//
//  ContainerView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/12/23.
//

import SwiftUI

/**
 For every content, it is recommended to follow the pattern below in their async and/or try functions:
 - Create an extension for `async` functions.
 - Create an extension for `throw async` functions.
 Then in async functions extensions, make calls to
 `AsyncViewModel.asyncAction(label, errorTitle, action)`. Use the functions in
 throw async function extensions as the `action` parameter above.

 The `throw async` functions should throw an error of type `APICodable.Error` if you want
 the `SSOContainerView` to handle the exception smoothly, check `throw async` function section
 for more details

 `AsyncViewModel.asyncAction` will manage the display of a spinning view during the async
 call and present an error alert in case of a raised `APICodable.Error`.
 
 @Throw-Async Functions:
  These functions makes a call to `SSOService.callService(bodyObject,spree3dApi)`,
  checking if the response is an error or not. If an error is encountered, it throws an `Error` of
  type `APIError.error`.
  The `bodyObject` parameter  should conform to the `Codable` protocol, and this object,
  converted to a dictionary, will be used as the server request body. The same `bodyObject`
  must also conform to the `APICodableErrorProtocol`. This allows the query response
  to be processed to determine whether it was successful or not.
 */

public
struct ContainerView<Content>: View where Content : View {
    var title: String
    @EnvironmentObject var asyncViewModel: AsyncViewModel
    @State private var isAlertActive: Bool = false
    
    @ViewBuilder var content: Content
    var bgImage : Image? = nil

    public init(title: String,bgImage: Image? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.bgImage = bgImage
        self.content = content()
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            content
            Spacer()
        }
        .scrollDisabled(true)
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(title).ssoScreenTitle() }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { BackButton() }
        }
        .background {
            if let image = bgImage {
                BackroundImage(image: image)
                    .ignoresSafeArea()
            }
        }
        .activityIndicator(
            isActive: asyncViewModel.isActivityActive,
            label: asyncViewModel.activityLabel
        )
        .sync($asyncViewModel.isAlertActive, with:$isAlertActive)
        .modifier(alert)
    }
}

public
extension ContainerView {
    var alert: some ViewModifier {
        AlertModifier(title: asyncViewModel.alertTitle ?? "",
                      isPresented: $isAlertActive,
                      actions: {
            Button("OK") {
                let action = asyncViewModel.alertAction
                self.asyncViewModel.resetAlert()
                action?()
            }
        }, message: { Text(asyncViewModel.alertMessage ?? "") })
    }
}

//struct Template_Previews: PreviewProvider {
//    @MainActor
//    struct Proxy: View {
//        static private let tabs = ["SIGN ON", "SIGN IN"]
//        @State private var selection: String = Proxy.tabs.first ?? ""
//        var activityLabel: String?
//        var errorTitle: String?
//        var errorMessage: String?
//        @StateObject var asyncViewModel: AsyncViewModel = .init()
//
//        var body: some View {
//            SSOView_Previews.ProxyConainer {
//                ContainerView(title: "Title") {
//                    TabButtonsContainerView(selection: $selection) {
//                        SSOSignUp()
//                        .padding(.top, repetitions: 2)
//                        .tabScrollItem(tab: "SIGN ON")
//                        SSOSignIn()
//                        .padding(.top, repetitions: 2)
//                        .tabScrollItem(tab: "SIGN IN")
//                    }
//                }
//                .environmentObject(asyncViewModel)
//            }
//            .onAppear {
//                if let label = activityLabel {
//                    asyncViewModel.setActivity(label)
//                }
//                if let title = errorTitle,
//                   let message = errorMessage {
//                    asyncViewModel.setAlert(title, message: message)
//                }
//            }
//        }
//    }
//    static var previews: some View {
//        Proxy()
//        .previewDisplayName("Activty Off")
//        Proxy(activityLabel: "")
//        .previewDisplayName("Activiy Only")
//        Proxy(activityLabel: "Processing something ...")
//        .previewDisplayName("Activiy Active")
//        Proxy(errorTitle: "Error Title",
//              errorMessage: "Error message")
//        .previewDisplayName("Error Title")
//    }
//}
