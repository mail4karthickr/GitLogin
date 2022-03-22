//
//  SignOnView.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 24/02/22.
//

import SwiftUI
import SwiftUINavigation
import Views
import SafariServices

public struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel
    
    public init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Image(name: "white-76")
            Spacer()
            VStack(alignment: .center, spacing: 20) {
                Button(action: viewModel.signInWithGitHub) {
                    if viewModel.loading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        LoginButtonText("Sign in with GitHub")
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(30)
                    }
                }
                Button(action: viewModel.signInWithGitHub) {
                    LoginButtonText("Sign in with GitHub Enterprise")
                        .foregroundColor(.black)
                        .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .cornerRadius(30)
                }
                HStack {
                    Button(action: { self.viewModel.termsOfUseTapped() }) {
                        Text("Terms of use")
                    }
                    Text("and")
                    Button(action: { self.viewModel.privacyPolicyTapped() }) {
                        Text("Privacy policy")
                    }
                }
                .padding(.top, 15)
                .font(.system(size: 15))
            }
            .padding(.horizontal, 20)
            .fullScreenCover(
                unwrapping: $viewModel.route,
                case: /SignInViewModel.Route.safariView
            ) {
                SafariView(url: $0.wrappedValue).edgesIgnoringSafeArea(.all)
            }
            .sheet(
                unwrapping: $viewModel.route,
                case: /SignInViewModel.Route.signInWithGitHub
            ) {
                GitHubSignInView(viewModel: $0.wrappedValue)
        }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }
}

#if DEBUG
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: .init())
    }
}
#endif
