import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metamask/utils/helperfunctions.dart';
import 'package:metamask/utils/multi_value_listenable.dart';
import 'package:slider_button/slider_button.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var session, uri, signature;



  @override
  Widget build(BuildContext context) {
    // listenableConnector.value.on('connect', (session) => listenableSession.value = session);
    // listenableConnector.value.on('disconnect', (payload) => listenableSession.value = null);
    // listenableConnector.value.on('session_update', (payload) {
    //   listenableSession.value = payload as SessionStatus?;
    //   print(listenableSession.value!.accounts[0]);
    //   print(listenableSession.value!.chainId);
    // });
    return MultiValueListenableBuilder(
        valueListenables: [
          listenableSession,
          listenableUri,
          listenableSignature
        ],
        builder: (context, listenables, child) {
          var session = listenables[0];
          var uri = listenables[1];
          String signature = listenables[2];
          return Scaffold(
            appBar: AppBar(title: const Text('Login Page')),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/main_page_image.png',
                      fit: BoxFit.fitHeight),
                  session != null
                      ? Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Account',
                                  style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text('${session.accounts[0]}',
                                  style: GoogleFonts.inconsolata(fontSize: 16)),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text('Chain: ',
                                      style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(getNetworkName(session.chainId),
                                      style:
                                          GoogleFonts.inconsolata(fontSize: 16))
                                ],
                              ),
                              const SizedBox(height: 20),
                              (session.chainId != 80001)
                                  ? Row(
                                      children: const [
                                        Icon(Icons.warning,
                                            color: Colors.redAccent, size: 15),
                                        Text(
                                            'Network not supported. Switch to '),
                                        Text(
                                          'Mumbai Testnet',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  : (session != null && signature.isEmpty)
                                      ? Container(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                              onPressed: () =>
                                                  signMessageWithMetamask(
                                                      context: context,
                                                      message:
                                                          generateSessionMessage(
                                                              session
                                                                  .accounts[0]),
                                                      uri: uri,
                                                      session: session),
                                              child:
                                                  const Text('Sign Message')),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Signature: ",
                                                  style:
                                                      GoogleFonts.merriweather(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                ),
                                                Text(
                                                    truncateString(
                                                        text: signature),
                                                    style:
                                                        GoogleFonts.inconsolata(
                                                            fontSize: 16))
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SliderButton(
                                              action: () async {
                                                // TODO: Navigate to main page
                                              },
                                              label:
                                                  const Text('Slide to login'),
                                              icon: const Icon(Icons.check),
                                            )
                                          ],
                                        )
                            ],
                          ))
                      : ElevatedButton(
                          onPressed: () => loginUsingMetamask(
                              context: context, uri: uri),
                          child: const Text("Connect with Metamask"))
                ],
              ),
            ),
          );
        });
  }
}
