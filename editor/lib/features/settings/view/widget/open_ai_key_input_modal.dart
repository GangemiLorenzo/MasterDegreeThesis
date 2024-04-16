import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart';
import 'package:editor/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenAIKeyInputModal extends StatefulWidget {
  final SecureSettingsState state;

  const OpenAIKeyInputModal({
    required this.state,
    super.key,
  });

  @override
  State<OpenAIKeyInputModal> createState() => _OpenAIKeyInputModalState();
}

class _OpenAIKeyInputModalState extends State<OpenAIKeyInputModal> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController()..text = widget.state.openAIKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Insert Open AI Key'),
      children: [
        SizedBox(
          width: 400,
          child: Padding(
            padding: allPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Open AI Key',
                  ),
                ),
                verticalSpace16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    horizontalSpace8,
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SecureSettingsCubit>(context)
                            .setOpenAIKey(_controller.text);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
