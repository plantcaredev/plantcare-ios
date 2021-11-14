//
//  ObservableState.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Foundation
import ReSwift

public class ObservableStore<T>: ObservableObject {
    @Published public var state: T
    private var store: Store<T>
    
    // MARK: Lifecycle

    public init(store: Store<T>) {
        self.store = store
        self.state = store.state
        
        store.subscribe(self)
    }
    
    deinit {
        store.unsubscribe(self)
    }
    
    // MARK: Public methods

    public func dispatch(_ action: Action) {
        store.dispatch(action)
    }
    
    public func dispatchThunk(_ action: Action) -> () -> Void {
        {
            self.store.dispatch(action)
        }
    }
    
    public func waitTill(stateIs checker: @escaping (_ state: T) -> Bool, every: TimeInterval = 1.0, atMost: Int = 10) async -> Bool {
        return await withCheckedContinuation { continuation in
            var runCount = 0
            
            Timer.scheduledTimer(withTimeInterval: every, repeats: true) { timer in
                runCount += 1
                
                let isMet = checker(self.state)
                if isMet {
                    timer.invalidate()
                    continuation.resume(returning: true)
                }
                
                if runCount == atMost {
                    timer.invalidate()
                    continuation.resume(returning: false)
                }
            }
        }
    }
}

extension ObservableStore: StoreSubscriber {
    // MARK: - <StoreSubscriber>

    public func newState(state: T) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}
