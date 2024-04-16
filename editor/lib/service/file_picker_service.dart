import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilePickerService {
  FilePickerService();

  FilePicker get _filePicker => FilePicker.platform;

  Future<PlatformFile?> pickSingleFile({
    List<String>? allowedExtensions,
  }) async {
    final result = await _filePicker.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
    );
    if (result == null) {
      return null;
    }
    return result.files.single;
  }
}
