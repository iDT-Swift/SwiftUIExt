//
//  NavigationModel.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/30/23.
//

import SwiftUI
import Combine

/**
 This class will load from the User Defaults the last NavigationPath used in @path.
 This class will automatically update into the UserDefaults with any change in @path.
 */
@MainActor
public
class NavigationModel: ObservableObject {
    @Published public var path: NavigationPath
    public static var shared: NavigationModel = .init()
    public var pathCount: Int { path.count }
    
    //Private properties
    static private let pathDataKey = "NavigationModel.pathData"
    @AppStorage(NavigationModel.pathDataKey)
    private var pathData: Data?
    private var cancelables: Set<AnyCancellable> = .init()
    
    private init() {
        path = NavigationPath()
        guard let data = self.pathData else {
            self.$path.sink(receiveValue: save).store(in: &cancelables)
            return
        }
        do {
            let representation = try JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data)
            self.path = NavigationPath(representation)
            self.$path.sink(receiveValue: save).store(in: &cancelables)
        } catch {
            self.path = NavigationPath()
            self.$path.sink(receiveValue: save).store(in: &cancelables)
        }
    }
    public func reset() {
        path.removeLast(path.count)
    }
    
    private func save(_ path: NavigationPath) {
        guard path.count > 0 else {
            self.pathData = nil
            return
        }
        guard let representation = path.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(representation)
            self.pathData = data
        } catch {
            assertionFailure("Somehow the encoder failed so we clean the whole path")
            // We remove all the values from parh and this should trigger a new call to save.
            self.path.removeLast(self.path.count)
        }
    }
}
