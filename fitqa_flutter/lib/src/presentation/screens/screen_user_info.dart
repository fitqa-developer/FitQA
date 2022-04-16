import 'package:fitqa/src/presentation/widgets/common/fitqa_appbar_sub.dart';
import 'package:fitqa/src/presentation/widgets/user_info/section_user_info_title.dart';
import 'package:fitqa/src/theme/color.dart';
import 'package:flutter/material.dart';

class ScreenUserInfo extends StatelessWidget {
  const ScreenUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FColors.white,
        appBar: FitqaAppbarSub(
          title: '운동정보 입력',
          centerTitle: true,
          onPressed: () => Navigator.pop(context),
          foreground: FColors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: ListView(
            children: [
              const SizedBox(
                height: 32,
              ),
              SectionUserInfoTitle()
            ],
          ),
        ));
  }
}
