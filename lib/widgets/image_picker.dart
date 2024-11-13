import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/providers/add_agency_form_provider.dart';

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              withData: false,
              withReadStream: true,
              allowedExtensions: ['jpg', 'png'],
            );

            if (result == null) {
              debugPrint('Không có file nào được chọn.');
              return;
            }

            final file = result.files.single;
            debugPrint('Selected file: ${file.path}');

            ref.read(filePickerProvider.notifier).setFile(file);
          },
          child: const Text('Chọn ảnh'),
        ),
        SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final selectedFile = ref.watch(filePickerProvider);
            return selectedFile != null
                ? Text('File đã chọn: ${selectedFile.name}')
                : const Text('Chưa chọn file');
          },
        ),
      ],
    );
  }
}
