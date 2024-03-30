//
//  UIControl+Combine.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/15/24.
//

import UIKit
import Combine

extension UIControl {
    var tapPublisher: EventPublisher {
        return controlPublihser(for: .touchUpInside)
    }
    
    func controlPublihser(for event: UIControl.Event) -> UIControl.EventPublisher {
        .init(control: self, controlEvent: event)
    }
    
    func throttleTapPublisher() -> Publishers.Throttle<UIControl.EventPublisher, RunLoop> {
        return EventPublisher(control: self, controlEvent: .touchUpInside)
            .throttle(
                for: .seconds(0.5),
                scheduler: RunLoop.main,
                latest: false
            )
    }
}

extension UIControl {
    final class EventSubscription<S: Subscriber>: Subscription where S.Input == Void {
        private var subscriber: S?
        private let control: UIControl
        private let event: UIControl.Event
        
        init(subscriber: S, control: UIControl, event: UIControl.Event) {
            self.subscriber = subscriber
            self.control = control
            self.event = event
            
            control.addTarget(self, action: #selector(eventHandler), for: event)
        }
        
        func request(_ demand: Subscribers.Demand) {}
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(eventHandler), for: event)
        }
        
        @objc private func eventHandler() {
            _ = subscriber?.receive(())
        }
    }
}

extension UIControl {
    struct EventPublisher: Publisher {
        typealias Output = Void
        typealias Failure = Never
        
        private let control: UIControl
        private let controlEvent: UIControl.Event
        
        init(control: UIControl, controlEvent: UIControl.Event) {
            self.control = control
            self.controlEvent = controlEvent
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Output == S.Input {
            let subscription = EventSubscription(
                subscriber: subscriber,
                control: control,
                event: controlEvent
            )
            subscriber.receive(subscription: subscription)
        }
    }
}


/*
 
 extension UIControl {
     func controlPublisher(for event: UIControl.Event) -> UIControl.ControlPublisher {
         return ControlPublisher(control: self, controlEvent: event)
     }
     
     struct ControlPublisher: Publisher {
         typealias Output = UIControl
         typealias Failure = Never
         
         private let control: UIControl
         private let controlEvent: UIControl.Event
         
         init(control: UIControl, controlEvent: UIControl.Event) {
             self.control = control
             self.controlEvent = controlEvent
         }
         
         func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, UIControl == S.Input {
             let subscription = ControlSubscription(
                 subscriber: subscriber,
                 control: control,
                 controlEvent: controlEvent
             )
             subscriber.receive(subscription: subscription)
         }
     }
     
     final class ControlSubscription<ControlSubscriber: Subscriber>: Subscription where ControlSubscriber.Input == ControlPublisher.Output, ControlSubscriber.Failure == ControlPublisher.Failure {
         private let selector = #selector(eventHandler)
         private var subscriber: ControlSubscriber?
         private let control: UIControl
         private let controlEvent: UIControl.Event
         
         init(subscriber: ControlSubscriber, control: UIControl, controlEvent: UIControl.Event) {
             self.subscriber = subscriber
             self.control = control
             self.controlEvent = controlEvent
             control.addTarget(self, action: selector, for: controlEvent)
         }
         
         func request(_ demand: Subscribers.Demand) { } // 구현 필요 없음
         
         func cancel() {
             subscriber = nil
             control.removeTarget(self, action: selector, for: controlEvent)
         }
         
         @objc
         func eventHandler() {
             _ = subscriber?.receive(control)
         }
     }
 }

 extension UIButton {
     var tapPublisher: AnyPublisher<Void, Never> {
         return controlPublisher(for: .touchUpInside)
             .map { _ in }
             .eraseToAnyPublisher()
     }
 }

 */
