import SwiftUI

struct Profile: View {
    
    @State private var uid: Int = 0
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View
    {
        VStack
        {
            Image(systemName: "person.crop.circle")
                .frame(width: 100, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.gray, lineWidth: 1)
                )
            TextField("Username", text: $username)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
            
            SecureField("Password", text: $password)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
            
            Button(action: login)
            {
                Text("Login")
            }
            .padding()
            
            
        }
        .padding()
    }
    
    func login()
    {
        // Implement registration functionality here
    }
    
}


