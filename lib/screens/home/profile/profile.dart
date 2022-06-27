import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';

import '../../../blocs/app_bloc/app_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final _authenticationRepository =
        RepositoryProvider.of<AuthenticationRepository>(context);
    final _appBloc = BlocProvider.of<AppBloc>(context);

    if (_appBloc.state.user.isNotEmpty) {
      return Row(
        children: [
          Text(_appBloc.state.user.phoneNumber!),
          TextButton(
              onPressed: () {
                _authenticationRepository.logOut();
              },
              child: const Text("log out"))
        ],
      );
    }

    return const SizedBox();
  }
}
