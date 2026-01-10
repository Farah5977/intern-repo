import Foundation

class APIClient {
    static let shared = APIClient()

    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func fetchPosts() async throws -> [Post] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts
    }
}
