import 'package:crafty_bay/data/model/payment_method.dart';
import 'package:crafty_bay/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/ui/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  bool isCompleted = false;



  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((_){
     
     Get.find<CreateInvoiceController>().createInvoice().then((value){
       isCompleted = value;
       if(mounted){
         setState(() {});
       }

     });
   });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Out')),
      body: GetBuilder<CreateInvoiceController>(
        builder: (createInvoiceController) {
          if (createInvoiceController.createInvoiceInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if(!isCompleted){
            return Center(
              child: Text('Please check your completed profile'),
              
            );
          }
          return ListView.separated(itemCount: createInvoiceController.invoiceCreateResponseModel?.paymentMethod?.length ?? 0,
            itemBuilder: (context, index) {
              final PaymentMethod paymentMethod = createInvoiceController.invoiceCreateResponseModel!.paymentMethod![index];
              return ListTile(
                leading: Image.network(paymentMethod.logo ?? ''),
                title: Text(paymentMethod.name ?? ''),

                onTap: (){
                  Get.off(()=> WebViewScreen(pymentUrl: paymentMethod.redirectGatewayURL!));
                },
              );
            },
             separatorBuilder: (BuildContext context, int index) {
            return Divider();
            },
          );
        },
      ),
    );
  }
}
