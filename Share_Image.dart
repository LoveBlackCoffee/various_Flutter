import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

shareImage() async {
    var url = "url";

    // urlでShareする場合、
    //  Share.share(url);

    // ローカルに保存してShareする場合、
    var response = await http.get(url);
    final directory = await getApplicationDocumentsDirectory();
    final documentDirectory = directory.path;
    File imgFile = new File('$documentDirectory/flutter.png');
    imgFile.writeAsBytesSync(response.bodyBytes);
    var imagePath = '$documentDirectory/flutter.png';

    Share.shareFiles([imagePath]);
  }
