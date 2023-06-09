import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:reddit_posts/core/extensions/extensions.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/models/enums.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/core/widgets/back_and_pill/back_and_pill.dart';
import 'package:reddit_posts/core/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:reddit_posts/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:reddit_posts/core/widgets/pill_button/pill_button.dart';
import 'package:reddit_posts/features/app_cubit.dart';
import 'package:reddit_posts/features/post/cubit/post_form_cubit.dart';

class PostFormContent extends StatefulWidget {
  const PostFormContent({
    super.key,
    required this.onConfirm,
  });
  final Function() onConfirm;

  @override
  State<PostFormContent> createState() => _PostFormContentState();
}

class _PostFormContentState extends State<PostFormContent> {
  final _formKey = GlobalKey<FormState>();
  final _authorKey = GlobalKey<FormFieldState>();
  final _titleKey = GlobalKey<FormFieldState>();
  final _dateKey = GlobalKey<FormFieldState>();

  late final MaskedTextController _dateController;

  @override
  void initState() {
    final cubit = context.read<PostFormCubit>();
    _dateController = MaskedTextController(
      text: DateFormat.yMd().format(cubit.state.post.created).normalizeDate(),
      mask: '00/00/0000',
    );
    super.initState();
  }

  void _onConfirm() {
    if (_formKey.currentState!.validate()) {
      widget.onConfirm();
    }
  }

  void _onChangeDate(DateTime date) {
    final cubit = context.read<PostFormCubit>();
    cubit.onChangePostDate(date);
    _dateController.text = DateFormat.yMd().format(date).normalizeDate();
  }

  bool _isCreating(Post? post) => post == null || post.id == 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostFormCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackAndPill(
          text: _isCreating(cubit.state.post)
              ? AppLocalizations.current.newPost
              : AppLocalizations.current.editPost,
          onTapBack: () {
            context.read<AppCubit>().changePage(AppPage.home);
          },
        ),
        AppSizeConstants.bigVerticalSpacer,
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                textFormKey: _titleKey,
                labelText: AppLocalizations.current.title,
                initialValue: cubit.state.post.title,
                onChanged: (value) => cubit.onChangePostTitle(value),
                validator: (value) => cubit.validateTextField(
                  value,
                  AppLocalizations.current.title,
                ),
              ),
              AppSizeConstants.largeVerticalSpacer,
              CustomTextFormField(
                textFormKey: _authorKey,
                labelText: AppLocalizations.current.author,
                initialValue: cubit.state.post.author,
                onChanged: (value) => cubit.onChangePostAuthor(value),
                validator: (value) => cubit.validateTextField(
                  value,
                  AppLocalizations.current.author,
                ),
              ),
              AppSizeConstants.largeVerticalSpacer,
              CustomDatePicker(
                label: AppLocalizations.current.date,
                fieldKey: _dateKey,
                controller: _dateController,
                onChange: _onChangeDate,
                validator: (value) => cubit.validateTextField(
                    value, AppLocalizations.current.date),
              ),
              AppSizeConstants.bigVerticalSpacer,
              PillButton(
                onTap: _onConfirm,
                child: Text(AppLocalizations.current.save),
              ),
              AppSizeConstants.bigVerticalSpacer,
            ],
          ),
        ),
      ],
    );
  }
}
