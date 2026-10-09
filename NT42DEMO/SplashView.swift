import SwiftUI

struct SplashView: View {
    var onFinish: () -> Void

    @State private var isVisible = false

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()

            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
                .scaleEffect(isVisible ? 1 : 0.85)
                .opacity(isVisible ? 1 : 0)
                .accessibilityLabel("App logo")
        }
        .task {
            withAnimation(.easeOut(duration: 0.8)) {
                isVisible = true
            }
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            onFinish()
        }
    }
}

#Preview {
    SplashView(onFinish: {})
}
