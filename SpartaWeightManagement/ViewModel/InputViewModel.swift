import Combine

class InputViewModel: ObservableObject {
  
  @Published var usersRepository = UsersRepository()

  
  func fetch() {
      usersRepository.fetchUsers();
  }
}
