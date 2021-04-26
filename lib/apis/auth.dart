import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:turgent/components/snackbar.dart';
import 'package:turgent/screens/onlineAgent.dart';

signUp({email, password, name, phoneNumber}) async {
  var url = Uri.parse('https://tugent.hostify.com.ng/api/user_registration');
  var response = await http.post(url, body: {
    'email': email,
    'password': password,
    'name': name,
    'phoneNumber': phoneNumber
  });
  print(response.body);
  if (response.statusCode == 200) {
    Get.to(
      () => OnlineAgent(),
    );
  } else if (response.statusCode == 422) {
    showCustomSnackBar('email is already used');
  } else {
    showCustomSnackBar('Please check your network and try again');
  }
}

signIn({email, password}) async {
  var url = Uri.parse('https://tugent.hostify.com.ng/api/login');
  var response = await http.post(url, body: {
    'email': email,
    'password': password,
  });
  print(response.body);
  if (response.statusCode == 200) {
    Get.to(
      () => OnlineAgent(),
    );
  } else if (response.statusCode == 401) {
    showCustomSnackBar('Wrong username or password');
  } else {
    showCustomSnackBar('Please check your network and try again');
  }
}
