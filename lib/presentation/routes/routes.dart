import 'package:get/get.dart';
import 'package:module_app/presentation/bindings/userlogin.binding.dart';
import 'package:module_app/presentation/pages/login/userlogin_page.dart';
import 'package:module_app/presentation/pages/mybook/UpdateDatabase.dart';
import 'package:module_app/presentation/pages/pages.dart';
import 'package:module_app/presentation/pages/register/appwrite_register.dart';
import '../bindings/bindings.dart';
import 'package:module_app/presentation/pages/account/account.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(name: newRegister,
            page: () => RegisterPage(),
            binding: RegisterBinding(),
    ),
    GetPage(name: userLogin,
            page: () => userLoginPage(),
            binding: UserLoginBinding(),
    ),
    GetPage(name: Accounts,
            page: () => AccountsPage(),
    ),
    GetPage(name: AppwriteRegister,
            page: () => AppwriteRegisterPage(),
    ),
    GetPage(name: appwriteLogin,
            page: () => appwriteLoginPage(),
    ),
    GetPage(name: UpdateDatabase,
            page: () => UpdateDatabasePage(),
    ),
  ];

  static getLogin() => login;
  static getDashboard() => dashboard;
  static getnewRegister() => newRegister;
  static getuserlogin()=> userLogin;
  static getAccount()=> Accounts;
  static getAppwriteRegister ()=>AppwriteRegister;
  static getappwriteLogin() =>appwriteLogin;
  static getUpdateDatabase() => UpdateDatabase;

  static String login = '/';
  static String dashboard = '/dashboard';
  static String newRegister = '/newRegister';
  static String userLogin = '/userlogin';
  static String Accounts = '/Accounts';
  static String AppwriteRegister = '/AppwriteRegister';
  static String appwriteLogin = '/appwriteLogin';
  static String UpdateDatabase = '/UpdateDatabase';

  
}
