import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/crypto.dart';

var listenableSession = ValueNotifier<SessionStatus?>(null);
var listenableUri = ValueNotifier('');
var listenableSignature = ValueNotifier('');
var listenableConnector = ValueNotifier<WalletConnect>(WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
        name: 'My App',
        description: 'An app for converting pictures to NFT',
        url: 'https://walletconnect.org',
        icons: [
          'https://files.gitbook.com/v0/b/'
              'gitbook-legacy-files/o/'
              'spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ])));

String truncateString({required text}) {
  int size = 4 + 2;
  // front: 4,
  // end: 2
  if (text.toString().length > size) {
    String finalString =
        "${text.substring(0, 4)}...${text.substring(text.length - 2)}";
    return finalString;
  }

  return text;
}

String generateSessionMessage(String accountAddress) {
  String message = 'Hello $accountAddress, welcome to our app. '
      'By signing this message you agree to learn '
      'and have fun with blockchain';
  print(message);

  var hash = keccakUtf8(message);
  final hashString = '0x${bytesToHex(hash).toString()}';

  return hashString;
}

loginUsingMetamask({required BuildContext context, required uri}) async {
  if (!listenableConnector.value.connected) {
    try {
      var session = await listenableConnector.value.createSession(
          onDisplayUri: (uri) async {
        listenableUri.value = uri;
        await launchUrlString(uri, mode: LaunchMode.externalApplication);
      });
      print(session.accounts[0]);
      print(session.chainId);
      listenableSession.value = session;
    } catch (exp) {
      print(exp);
    }
  }
}

signMessageWithMetamask(
    {required BuildContext context,
    required String message,
    required uri,
    required session}) async {
  if (listenableConnector.value.connected) {
    try {
      print("Message received");
      print(message);

      EthereumWalletConnectProvider provider =
          EthereumWalletConnectProvider(listenableConnector.value);
      launchUrlString(uri, mode: LaunchMode.externalApplication);
      var signature = await provider.personalSign(
          message: message, address: session.accounts[0], password: "");
      print(signature);
      listenableSignature.value = signature;
    } catch (exp) {
      print("Error while signing transaction");
      print(exp);
    }
  }
}

getNetworkName(chainId) {
  switch (chainId) {
    case 1:
      return 'Ethereum Mainnet';
    case 3:
      return 'Ropsten Testnet';
    case 4:
      return 'Rinkeby Testnet';
    case 5:
      return 'Goreli Testnet';
    case 42:
      return 'Kovan Testnet';
    case 137:
      return 'Polygon Mainnet';
    case 80001:
      return 'Mumbai Testnet';
    default:
      return 'Unknown Chain';
  }
}
