import 'package:crafty_bay/data/model/invoicecreateresponsemodel.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CreateInvoiceController extends GetxController {

  String _errorMessages = '';
  bool _createInvoiceInProgress = false;
  InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();


  String get errorMessages => _errorMessages;
  bool get createInvoiceInProgress => _createInvoiceInProgress;
  InvoiceCreateData? get invoiceCreateResponseModel => _invoiceCreateResponseModel.data?.first;

  Future<bool> createInvoice ()async {
    _createInvoiceInProgress = true;
   update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice);
     _createInvoiceInProgress = false;
     update();
    if(response.isSuccess && response.responseJson !["msg"] == "success"){
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.responseJson!);
      return true;
    }else{
      _errorMessages = 'Pyment Method fetch not found';
      return false;
    }


  }


}