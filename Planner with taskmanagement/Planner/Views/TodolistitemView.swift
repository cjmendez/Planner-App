//TodolistitemView
import SwiftUI

struct TodolistitemView: View {
    @StateObject var viewModel = TodolistitemViewViewModel() // Ensure ViewModel has required members
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .strikethrough(item.isDone, color: .black) // Make sure 'isDone' is a property of 'ToDoListItem'
                
                // Assuming item.dueDate is a TimeInterval since 1970
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated  ,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item) // Ensure this method exists in the ViewModel
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle") // Make sure 'isDone' is a property of 'ToDoListItem'
                    .foregroundColor(Color.blue)
                    .padding()
            }
        }
    }
}
