import 'package:meta/meta.dart';

@immutable
class AppUser {
  const AppUser(this.displayName, this.email, this.photoUrl);

  final String displayName;
  final String email;
  final String photoUrl;

  factory AppUser.empty() {
    return const AppUser("", "", "");
  }
}
