import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/data/models/user.dart';
import 'package:weight_tracker/presentation/screens/home_screen.dart';
import 'package:weight_tracker/presentation/screens/signup_screen.dart';
import 'package:weight_tracker/providers/user/user_provider.dart';
import 'package:weight_tracker/providers/user/user_state.dart';

class UserDialog extends ConsumerStatefulWidget {
  const UserDialog({super.key});

  @override
  ConsumerState<UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends ConsumerState<UserDialog> {
  final textController = TextEditingController();

  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select User',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      content: Consumer(builder: (context, ref, child) {
        final state = ref.watch(userProvider);
        if (state is LoggingIn || state is InitialUserState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoggedIn) {
          users = state.users;
          final currentUser = state.user;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int idx = 0; idx < users.length; idx++)
                ListTile(
                  onTap: () {
                    ref.watch(userProvider.notifier).setCurrentUser(users[idx]);
                    Navigator.popUntil(context, (route) => false);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  title: Text(users[idx].name),
                  leading: currentUser == users[idx]
                      ? const Icon(Icons.circle_rounded)
                      : const Icon(Icons.circle_outlined),
                ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
                },
                title: const Text("Add new user"),
                leading: const Icon(Icons.person_add_alt),
              ),
            ],
          );
        }
        return const SizedBox();
      }),
    );
  }
}
