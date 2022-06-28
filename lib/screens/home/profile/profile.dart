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
    return BlocSelector<AppBloc, AppState, dynamic>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        if (state.user.isEmpty) return const SizedBox();
        return Row(
          children: [
            Text(state.user.phoneNumber!),
            Text(state.user.name! ?? ''),
            TextButton(
                onPressed: () {
                  context.read<AppBloc>().add(AppLogoutRequested());
                },
                child: const Text("log out"))
          ],
        );
      },
    );
  }
}
