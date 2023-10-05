import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    if (Platform.isAndroid) {
      final dir = await getExternalStorageDirectory();
      final file = File('${dir!.path}/$name');
      await file.writeAsBytes(bytes);
      return file;
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$name');
      await file.writeAsBytes(bytes);
      return file;
    }
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFilex.open(url);
  }
}
