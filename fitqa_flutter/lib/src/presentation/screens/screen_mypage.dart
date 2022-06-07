import 'package:fitqa/src/application/storage/trainer_token_facade.dart';
import 'package:fitqa/src/application/storage/user_token_facade.dart';
import 'package:fitqa/src/application/trainer/trainer_detail.dart';
import 'package:fitqa/src/presentation/screens/screen_mypage_detail.dart';
import 'package:fitqa/src/presentation/screens/screen_mypage_login.dart';
import 'package:fitqa/src/presentation/screens/screen_trainer_detail.dart';
import 'package:fitqa/src/presentation/widgets/common/fitqa_appbar_mypage.dart';
import 'package:fitqa/src/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenMyPage extends ConsumerWidget {
  const ScreenMyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownerTrainerToken = ref.watch(trainerTokenProvider);
    final ownerUserToken = ref.watch(userTokenProvider);
    final trainerDetailTokenController =
        ref.watch(selectedTrainerTokenProvider.notifier);
    Widget _navigation() {
      // return _buildUserMyPage();
      if (ownerUserToken.isEmpty && ownerTrainerToken.isEmpty) {
        return _buildLoginPage();
      } else if (ownerTrainerToken.isEmpty) {
        return _buildUserMyPage();
      } else {
        trainerDetailTokenController.state = ownerTrainerToken;
        return _buildTrainerMyPage();
      }
    }

    return Column(mainAxisSize: MainAxisSize.min, children: [
      const FitqaAppbarMyPage(),

      /// Appbar
      _imageProfile(context),

      /// profile picture
      _navigation(),

      /// Contents
    ]);
  }

  Widget _buildUserMyPage() => const ScreenMyPageDetail();
  Widget _buildTrainerMyPage() => const ScreenTrainerDetail();
  Widget _buildLoginPage() => const ScreenMyPageLogin();
}

Widget _imageProfile(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              color: FColors.blue,
              width: double.infinity,
              height: 75.0,
            ),
            const Center(
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/default_profile.jpg')),
            ),
          ],
        ),
        LoginButton(context)
      ],
    ),
  );
}

Widget LoginButton(BuildContext context) {
  const String _profileName = "로그인하세요";
  return TextButton(
    child: RichText(
      text: const TextSpan(
          text: _profileName,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          children: [
            TextSpan(
              text: ' >',
              style: TextStyle(color: FColors.blue),
            ),
          ]),
    ),
    onPressed: () {
      Navigator.popAndPushNamed(context, '/Login');
    },
  );
}
