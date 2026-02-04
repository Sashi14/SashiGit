import SwiftUI


enum LoginError : Error
{
    case emptyUsername
    case shortPassword
}

extension LoginError
{
    var message: String
    {
        switch self
        {
        case .emptyUsername: return "User name cannot be empty"
        case .shortPassword: return "Password must be at least 6 characters."
        }
    }
}

func login(username: String, password: String) throws
{
    if username.isEmpty { throw LoginError.emptyUsername }
    if password.count < 6 { throw LoginError.shortPassword }
    
}

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var message = ""
    @State private var isError: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            TextField("Username", text:$username)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Login") {
                handleLogin()
            }
            .buttonStyle(.borderedProminent)
            
            Text(message)
                .foregroundColor(isError ? .red : .green)
            
            
            
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
             */
        }
        .padding()
    }
    
    func handleLogin()
    {
        do{
            try login(username: username, password: password)
            message = "Login successful!"
            isError = false
            
        } catch let error as LoginError {
            message = error.message
            isError = true
        }
        catch {
            message = "Unknown error"
            isError = true
        }
    }
}
