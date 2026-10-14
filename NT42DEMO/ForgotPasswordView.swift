import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var messageSent = false
    
    var onSuccess: () -> Void

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.93, blue: 0.93)
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Spacer()

                Text("Forgot Password")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Enter your email address and we'll send you a reset link.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 5) {
                    Text("E-mail")
                        .font(.caption)

                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }

                Button {
                    messageSent = true
                } label: {
                    Text("Send Reset Link")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Color(red: 0.82, green: 0.55, blue: 0.63)
                        )
                        .cornerRadius(22)
                }

                if messageSent {
                    Text("Reset link sent! Please check your email.")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                }

                Button {
                    dismiss()
                } label: {
                    Text("Back to Login")
                        .font(.subheadline)
                        .underline()
                        .foregroundColor(
                            Color(red: 0.82, green: 0.55, blue: 0.63)
                        )
                }

                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ForgotPasswordView(onSuccess: {})
}
