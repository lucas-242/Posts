import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/core/widgets/camera/camera_page.dart';
import 'package:reddit_posts/core/widgets/custom_safe_area/custom_safe_area.dart';
import 'package:reddit_posts/features/profile/cubit/profile_cubit.dart';
import 'package:reddit_posts/features/profile/widgets/options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizeConstants.largeSpace,
                  right: AppSizeConstants.largeSpace,
                  top: AppSizeConstants.largeSpace,
                ),
                child: Column(
                  children: [
                    BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                      return SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: CircleAvatar(
                          backgroundImage: state.file != null
                              ? FileImage(state.file!)
                              : null,
                          backgroundColor: AppColors.white,
                          child: state.file == null
                              ? Text(
                                  '🦆',
                                  style:
                                      context.bodyLarge!.copyWith(fontSize: 90),
                                )
                              : null,
                        ),
                      );
                    }),
                    AppSizeConstants.mediumVerticalSpacer,
                    TextButton(
                      child: Text(AppLocalizations.current.takePicture),
                      onPressed: () async {
                        final cameras = await availableCameras();
                        if (!mounted) return;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CameraPage(
                              camera: cameras.first,
                              takePictureCallback: (xfile) {
                                context
                                    .read<ProfileCubit>()
                                    .onChangePicture(xfile);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    AppSizeConstants.largeVerticalSpacer,
                    Text(
                      AppLocalizations.current.selectLanguage,
                      style: context.titleMedium,
                    ),
                    AppSizeConstants.largeVerticalSpacer,
                    const Divider(),
                  ],
                ),
              ),
              Options(
                changeLanguageCallback: () => setState(() {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
