

import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/main.dart';
import 'package:jurisconexao_cliente/screens/settings/settings/settings.dart';
import '../../components/constant.dart';
import '../notification/notificationList.dart';
import 'components/about/about_screen.dart';
import 'components/callCenter/callCenter.dart';
import 'components/message/message.dart';
import 'components/orders/trackOrder.dart';
import 'components/payment/paymentDetails.dart';

class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none, alignment: Alignment.center,
            children: [
              Container(
                height: 250.0,
                child: Image(
                  image: AssetImage(bg),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -60.0,
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: kWhiteColor,
                      width: kLess,
                    ),
                    image: DecorationImage(
                      image: AssetImage(profile),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -88.0,
                child: Text(
                  'Username',
                  style: kDarkTextStyle,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 88.0),
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // dense: true,
                    leading: Icon(
                      icons[index],
                      color: kPrimaryColor,
                    ),
                    title: Text(labels[index]),
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      switch (labels[index]) {
                        case 'Notifications':
                          return NotificationList();
                          break;
                        case 'Payments':
                          return PaymentDetails();
                          break;
                        case 'Message':
                          return Message_config();
                          break;
                        case 'My Orders':
                          return TrackOrder();
                          break;
                        case 'Setting Account':
                          return Setting();
                          break;
                        case 'Call Center':
                          return CallCenter();
                        case 'About Application':
                          return About();
                          break;
                        default:
                          return MyApp();
                      }
                    }))
                  // onTap: () => this.setState(
                  //   () {
                  //     switch (labels[index]) {
                  //       case 'Notifications':
                  //         return snackBarMsg(context, 'Notifications');
                  //         break;
                  //       case 'Payments':
                  //         return snackBarMsg(context, 'Payments');
                  //         break;
                  //       case 'Message':
                  //         return snackBarMsg(context, 'Message');
                  //         break;
                  //       case 'My Orders':
                  //         return snackBarMsg(context, 'My Orders');
                  //         break;
                  //       case 'Setting Account':
                  //         return snackBarMsg(context, 'Setting Account');
                  //         break;
                  //       case 'Call Center':
                  //         return snackBarMsg(context, 'Call Center');
                  //         break;
                  //       case 'About Application':
                  //         return snackBarMsg(context, 'About Application');
                  //         break;
                  //       default:
                  //         return snackBarMsg(context, 'Notifications');
                  //         break;
                  //     }
                  //   },
                  // ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  snackBarMsg(BuildContext context, String msg) {
    var sb = SnackBar(
      elevation: kRadius,
      content: Text(msg),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        // textColor: kWhiteColor,
        label: 'OK',
        onPressed: () {},
      ),
    );
  }
}