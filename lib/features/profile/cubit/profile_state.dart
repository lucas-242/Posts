part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({this.file});

  final File? file;

  @override
  List<Object?> get props => [file];
}
