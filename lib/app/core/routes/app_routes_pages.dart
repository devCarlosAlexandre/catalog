import 'package:get/get.dart';

import '../../bindings/categoria_bindind.dart';
import '../../bindings/produto_bindings.dart';
import '../../bindings/profile_binding.dart';
import '../../pages/auth/login_page.dart';
import '../../pages/auth/register_page.dart';
import '../../pages/base_page.dart';
// import '../../pages/form_produto/form_produto.dart';
import '../../pages/form_produto/form_produto.dart';
import '../../pages/home/home_page.dart';
import '../../pages/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppRoutes.base, page: () => const BasePage(), bindings: [
      CategoriaBinding(),
      ProdutoBinding(),
      ProfileBinding(),
    ]),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.formProduto,
      page: () => FormProduto(),
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String formProduto = '/form-produto';
}
