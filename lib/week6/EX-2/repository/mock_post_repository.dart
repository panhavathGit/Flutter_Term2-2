import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  List<Post> listOfPosts = [
    Post(id: 1, title: 'End of Term trip', description: 'SR or KP'),
    Post(
        id: 2,
        title: 'Best programming language',
        description: 'Let\'s discuss!'),
    Post(
        id: 3,
        title: 'Have you done Capstone Project',
        description: 'On the way'),
    Post(
      id: 25,
      title: 'Who is the best',
      description: 'teacher ronan',
    )
  ];
  @override
  Future<List<Post>> getPost() {
    return Future.delayed(Duration(seconds: 5), () {
      return listOfPosts;
    });
  }
}
