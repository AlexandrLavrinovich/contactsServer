import Foundation

typealias JSON = [String : Any]

enum API {
    
    static var identifier: String { "lavr" }
    static var baseURL: String { "https://ios-napoleonit.firebaseio.com/data/\(identifier)/" }
    
//    static func loadNotes(completion: @escaping ([Contacts]) -> Void) {
//        let url = URL(string: baseURL + ".json")!
//        let request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard
//                let data = data,
//                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON
//                else { return }
//
//            let notesJSON = json["notes"] as! JSON
//            var notes = [Contacts]()
//
//            for note in notesJSON {
//                notes.append(Contacts(data: note.value as! JSON))
//            }
//
////            notes.sort { $0.date < $1.date }
//
//            DispatchQueue.main.async {
//                completion(notes)
//            }
//        }
//        task.resume()
//    }
    
    static func createContact(name: String, phoneNumber: String,contactId: String, completion: @escaping (Bool) -> Void) {
        let params = [
            "name": name,
            "phoneNumber": phoneNumber,
        ]
        
        let url = URL(string: baseURL + "/contacts/\(contactId)/.json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error == nil)
        }
        task.resume()
    }
    
    static func editContact(name: String, phoneNumber: String, contactId: String, completion: @escaping (Bool) -> Void) {
        let params = [
            "name": name,
            "phoneNumber": phoneNumber,
        ]
        
        let url = URL(string: baseURL + "/contacts/\(contactId)/.json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error == nil)
        }
        task.resume()
    }
    
    static func deleteContact(contactId: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: baseURL + "/contacts/\(contactId).json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error == nil)
        }
        task.resume()
    }

}
