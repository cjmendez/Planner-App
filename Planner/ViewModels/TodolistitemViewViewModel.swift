import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodolistitemViewViewModel: ObservableObject {
    
    // Initialization if needed
    init() {
        // Perform initial setup if necessary
    }

    // Define toggleIsDone as a method of the class
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
