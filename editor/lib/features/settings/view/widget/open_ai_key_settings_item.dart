import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart';
import 'package:editor/app/theme/common.dart';
import 'package:editor/features/settings/view/widget/open_ai_key_input_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenAIKeySettingsItem extends StatelessWidget {
  const OpenAIKeySettingsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecureSettingsCubit, SecureSettingsState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Open AI Key',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  verticalSpace4,
                  Text(
                    'The Open AI Key is used to access the Open AI API.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
            horizontalSpace8,
            OutlinedButton.icon(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) => OpenAIKeyInputModal(
                    state: state,
                  ),
                );
              },
              icon: Icon(
                state.openAIKey.isEmpty
                    ? Icons.lock_open_outlined
                    : Icons.lock_outlined,
                size: 20,
              ),
              label: Padding(
                padding: allPadding8,
                child: Text(state.openAIKey.isEmpty ? 'Add Key' : 'Update Key'),
              ),
            ),
          ],
        );
      },
    );
  }
}
