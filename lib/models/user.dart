import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.fireBaseUserId,
    this.email,
    this.name,
    this.photo,
    this.phoneNumber,
  });

  /// The current user's email address.
  final String? email;

  final String? phoneNumber;

  /// The current user's id.
  final String fireBaseUserId;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(fireBaseUserId: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, fireBaseUserId, name, photo];
}
