import Foundation

struct URLSessionGetExample {

    static func fetchAndPrintJSON() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request failed:", error)
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                print("Fetched JSON:")
                print(jsonString)
            }
        }

        task.resume()
    }
}
