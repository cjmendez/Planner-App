import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewitemViewViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack {
            Text("NEW ITEM")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 35)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Save Button
                Button(action: {
                    // Define the action of the button here
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }) {
                    Text("Save")
                        .foregroundColor(.white) // Text color
                        .padding() // Padding around the text
                        .frame(maxWidth: .infinity) // Make the button expand to the width of its container
                        .background(Color.pink) // Background color of the button
                        .cornerRadius(10) // Rounded corners
                }
                .padding() // Padding around the button itself
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please fill in all fields and select a due date that is today or newer.")
                    )
                }
            }
        }
    }
}

// Preview
struct NewitemView_Previews: PreviewProvider {
    static var previews: some View {
        NewitemView(newItemPresented: .constant(true))
    }
}

