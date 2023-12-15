//
//  NavigationModel.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/30/23.
//

import SwiftUI
import Combine

//TODO: Temporary the save to user default feature was removed b'cos the call to our backend
//TODO: ... /v2/garment/spree/collection/protea stop working when is called automatically.
/**
 This class will load from the User Defaults the last NavigationPath used in @path.
 This class will automatically update into the UserDefaults with any change in @path.
 */
@MainActor
public
class NavigationModel: ObservableObject {
    @Published public var path: NavigationPath
    public static var shared: NavigationModel = .init()
    static public let sharedId = "shared"
    
    //Private properties
    static private let basePathDataKey = "NavigationModel.pathData."
    let pathDataKey: String
    //private var cancelables: Set<AnyCancellable> = .init()
    
    public
    init(id:String = NavigationModel.sharedId) {
        self.path = NavigationPath()
        
        self.pathDataKey = Self.basePathDataKey + id
        /*
        defer {
            self.$path.sink(receiveValue: save).store(in: &cancelables)
        }
        self.pathDataKey = Self.basePathDataKey + id
        guard let data = UserDefaults.standard.data(forKey: self.pathDataKey) else {
            self.path = .init()
            return
        }
        do {
            let representation = try JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data)
            self.path = NavigationPath(representation)
            print("path set")
        } catch {
            self.path = NavigationPath()
            //TODO: Log something instead of assert as soon as we have a log system implemented
            assertionFailure("Data decode failed")
        }
        */
    }
    public func pathRemoveAll() {
        path.removeLast(path.count)
    }
    @available(*, deprecated, 
                renamed: "pathRemoveAll()",
                message: "This function will be removed in version 7.0.0")
    public func reset() {
        self.pathRemoveAll()
    }
    /*
    private func save(_ newPath: NavigationPath) {
        guard newPath.count > 0 else {
            UserDefaults.standard.removeObject(forKey: self.pathDataKey)
            return
        }
        guard let representation = newPath.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(representation)
            UserDefaults.standard.setValue(data, forKey: self.pathDataKey)
        } catch {
            //TODO: Log something instead of assert as soon as we have a log system implemented
            assertionFailure("Somehow the encoder failed so we clean the whole path")
            // We remove all the values from parh and this should trigger a new call to save.
            self.pathRemoveAll()
        }
    }
    */
}
