

import Foundation
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class PhotographsEarthDependencies487729fc47af8ed8f7c3Provider: PhotographsEarthDependencies {
    var networkService: NetworkService {
        return rootComponent.networkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PhotographsEarthComponent
private func factory09cb463852750b5662ffb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PhotographsEarthDependencies487729fc47af8ed8f7c3Provider(rootComponent: parent1(component) as! RootComponent)
}
private class PictureDayDependencies40a494f6b1008ffc5b85Provider: PictureDayDependencies {
    var networkService: NetworkService {
        return rootComponent.networkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PictureDayComponent
private func factoryeaf4909f5da943a0e93bb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PictureDayDependencies40a494f6b1008ffc5b85Provider(rootComponent: parent1(component) as! RootComponent)
}

#else
extension PhotographsEarthComponent: Registration {
    public func registerItems() {
        keyPathToName[\PhotographsEarthDependencies.networkService] = "networkService-NetworkService"
    }
}
extension PictureDayComponent: Registration {
    public func registerItems() {
        keyPathToName[\PictureDayDependencies.networkService] = "networkService-NetworkService"
    }
}
extension RootComponent: Registration {
    public func registerItems() {


    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent->PhotographsEarthComponent", factory09cb463852750b5662ffb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->PictureDayComponent", factoryeaf4909f5da943a0e93bb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
