import Foundation
import Combine

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadPosts() async {
        isLoading = true
        errorMessage = nil

        do {
            posts = try await APIClient.shared.fetchPosts()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
