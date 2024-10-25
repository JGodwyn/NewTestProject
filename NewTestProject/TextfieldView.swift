//
//  TextfieldView.swift
//  NewTestProject
//
//  Created by Gdwn on 21/10/2024.
//

import SwiftUI

struct TextfieldView: View {
    
    @State private var userDetail : UserStorage = .init() // create an instance of UserStorage
    @FocusState private var inputFocused : Bool // attach a state to a textField
    @State private var sentenceText : String = ""
    
    var body: some View {
        ScrollView {
            VStack (spacing : 16) {
                usernameView
                passwordView
                btnView
                textEditor
                
                Text("\(userDetail.username)")
                Text("\(userDetail.password)")
            }
            .toolbar { // adds a tool bar
                ToolbarItemGroup(placement: .keyboard) { // on the keyboard
                    // you can add any content here
                    Spacer()
                    MainButton(label: "Done", height: 24) {
                        resignKeyboard()
                    }
                }
            }
            .padding(.horizontal, 24)
            .textFieldStyle(.roundedBorder) // change the style of all the text fields
            .textInputAutocapitalization(.never) // disable auto-capitalization
            .autocorrectionDisabled() // disable autocorrection
            .onSubmit(of: .text) { // run the following action when I submit the text to this view (hit the submit button on a keyboard)
                resignKeyboard()
            }
        }
    }
}

// this will hold the user information
struct UserStorage {
    var username : String = ""
    var password : String = ""
    
    mutating func clearDetails() {
        username = ""
        password = ""
    }
}


struct TextFieldPracticeView : View {
    // this just shows the ways to use the text and secure fields
    // add this to preview to see it on the canvas
    @State private var textValue : String = ""
    
    var body: some View {
        ScrollView {
            VStack (spacing: 24) {
                
                VStack {
                    // bind the text entered to a string
                    TextField("Enter your name", text: $textValue)
                    Text("\(textValue)")
                        .font(.system(size: 32))
                }
                
                VStack {
                    // prompt overrides the text "Enter your name"
                    TextField("Enter your name",
                              text: .constant(""),
                              prompt: Text("What is your name"))
                }
                
                VStack {
                    // another way to write text
                    TextField(text: .constant("")) {
                        Text("Enter your details here")
                    }
                }
                
                VStack {
                    // this has the same initializers as the TextField
                    SecureField(text: .constant("")) {
                        Text("Enter your password")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TextfieldView()
}

// extend the TextfieldView
private extension TextfieldView {
    
    // defining the username externally
    var usernameView : some View {
        TextField(text: $userDetail.username) {
            Text("Your name")
        }
        .textContentType(.username) // set the type of content
        .focused($inputFocused) // controls whether the input field is focused or not
    }
    
    // defining the password externally
    var passwordView : some View {
        SecureField(text: $userDetail.password) {
            Text("Your password")
        }
        .textContentType(.password) // set the type of content
        .focused($inputFocused)
        .submitLabel(.done) // show this button on the keyboard
    }
    
    // defining the button externally
    var btnView : some View {
        MainButton(label: "Submit", fillContainer: true){
            resignKeyboard()
        }
    }
    
    // using the text editor
    // there is no inherent way to add placeholders to TextEditor
    var textEditor : some View {
            TextEditor(text: $sentenceText)
                .frame(height: 144)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray, lineWidth: 1)
                )
    }
    
    func resignKeyboard() {
        userDetail.clearDetails()
        inputFocused = false // un-focus the textfield thereby closing the keyboard
    }
}
