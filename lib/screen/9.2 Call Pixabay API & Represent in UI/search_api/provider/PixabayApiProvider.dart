

import 'package:flutter/cupertino.dart';

import '../../../../Api_Helper/API_helper.dart';

import '../modal/Pixabay_api_modal.dart';


class PixabayProvider extends ChangeNotifier
{
  ApiHelper apiHelper = ApiHelper();
  PixabayModal? pixabayModal;
  String search = ' ';

  void findImage(String img){
    search = img;
    notifyListeners();
  }


  Future<PixabayModal?> fromJson(String img)
  async {
    final data = await apiHelper.fetchData(img);
    pixabayModal = PixabayModal.fromJson(data);
    notifyListeners();
    return pixabayModal;
  }

}
var txtSearch = TextEditingController();