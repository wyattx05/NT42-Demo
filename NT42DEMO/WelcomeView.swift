import SwiftUI

struct WelcomeView: View {
    var onRegister: () -> Void
    var onLogin: () -> Void

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .accessibilityLabel("App logo")

                Spacer()

                VStack(spacing: 14) {
                    Button("Register", action: onRegister)
                        .buttonStyle(SecondaryButtonStyle())

                    Button("Log In", action: onLogin)
                        .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    WelcomeView(onRegister: {}, onLogin: {})
}
