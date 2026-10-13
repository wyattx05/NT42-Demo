import SwiftUI

struct RegistrationView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    @State private var showPassword = false
    @State private var showConfirmPassword = false

    var onSuccess: () -> Void

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.93, blue: 0.93)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    Spacer()
                        .frame(height: 60)

                    Text("Register")
                        .font(.title)
                        .fontWeight(.bold)

                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("First Name")
                                .font(.caption)

                            TextField("John", text: $firstName)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text("Last Name")
                                .font(.caption)

                            TextField("Doe", text: $lastName)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                    }

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

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                            .font(.caption)

                        HStack {
                            if showPassword {
                                TextField("Enter your password", text: $password)
                            } else {
                                SecureField("Enter your password", text: $password)
                            }

                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)

                        Text("must contain 8 char.")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Confirm Password")
                            .font(.caption)

                        HStack {
                            if showConfirmPassword {
                                TextField("Confirm your password", text: $confirmPassword)
                            } else {
                                SecureField("Confirm your password", text: $confirmPassword)
                            }

                            Button {
                                showConfirmPassword.toggle()
                            } label: {
                                Image(systemName: showConfirmPassword ? "eye" : "eye.slash")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    }

                    Spacer()
                        .frame(height: 20)

                    Button {
                        onSuccess()
                    } label: {
                        Text("Create Account")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                Color(red: 0.82, green: 0.55, blue: 0.63)
                            )
                            .cornerRadius(22)
                    }

                    VStack(spacing: 2) {
                        Text("By continuing, you agree to our")
                            .font(.caption)
                            .foregroundColor(.gray)

                        HStack(spacing: 4) {
                            Text("Terms of Service")
                                .font(.caption)
                                .foregroundColor(
                                    Color(red: 0.82, green: 0.55, blue: 0.63)
                                )

                            Text("and")
                                .font(.caption)
                                .foregroundColor(.gray)

                            Text("Privacy Policy.")
                                .font(.caption)
                                .foregroundColor(
                                    Color(red: 0.82, green: 0.55, blue: 0.63)
                                )
                        }
                    }
                    .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 32)
            }
        }
    }
}

#Preview {
    RegistrationView(onSuccess: {})
}
