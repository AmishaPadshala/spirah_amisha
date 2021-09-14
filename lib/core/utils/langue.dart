import 'package:get/get_navigation/src/root/internacionalization.dart';

class Langue extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //'hi_IN': {'hello': 'नमस्ते'},
        //'fr_FR': {'hello': 'Bonjour'},
        'en_US': {
            'appTitle':'Spirah',
            'error':'Some error occured',

          //HomeScreen
            'products':'Products',
            'noProductFound':'No product found',

        }
      };
}
