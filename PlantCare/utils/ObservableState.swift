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

    public func dispatch(_ action: Action) -> () -> Void {
        {
            self.store.dispatch(action)
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

