import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '46mgc0cr': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    '3nezznf7': {
      'es': 'Inicie sesión para continuar',
      'en': 'Please log in to continue',
    },
    'odu3otkl': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'lb2qin4m': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'ygiy7gqi': {
      'es': '¿Olvidaste la contraseña?',
      'en': 'Forgot your password?',
    },
    'nl0ncbng': {
      'es': 'Iniciar sesión',
      'en': 'Login',
    },
    '6qnz3kt1': {
      'es': 'O inicia sesión con',
      'en': 'Or log in with',
    },
    'qybekng4': {
      'es': 'Continuar con Google',
      'en': 'Continue with Google',
    },
    'yfg4shxx': {
      'es': '¿No tienes una cuenta? ',
      'en': 'Don\'t have an account?',
    },
    '62z70w64': {
      'es': 'Registrate aquí',
      'en': 'Register here',
    },
    'fve9y8sv': {
      'es': 'Derechos reservados.',
      'en': 'All rights reserved.',
    },
    'lkquyge6': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'edme9msn': {
      'es': 'Debe ingresar al menos 8 caracteres',
      'en': 'You must enter at least 8 characters',
    },
    '312hppeu': {
      'es': 'Superó el máximo de caracteres',
      'en': 'Exceeded maximum characters',
    },
    'u5na23gl': {
      'es': 'El correo ingresado no es válido',
      'en': 'The email entered is not valid',
    },
    'jifvwu96': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    'jeiojkta': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'rqdvr10g': {
      'es': 'Debe ingresar al menos 8 caracteres',
      'en': 'You must enter at least 8 characters',
    },
    '3951km9p': {
      'es': 'Superó el máximo de caracteres',
      'en': 'Exceeded maximum characters',
    },
    '7yxtxveu': {
      'es':
          'La contraseña debe tener entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula, al menos una mayúscula y al menos un carácter no alfanumérico.',
      'en':
          'The password must be between 8 and 16 characters, at least one digit, at least one lowercase letter, at least one uppercase letter, and at least one non-alphanumeric character.',
    },
    '48hnilh9': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '79zfc7gh': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // Signin
  {
    'xry469d6': {
      'es': 'Crear cuenta',
      'en': 'Create account',
    },
    'wmk3dnuw': {
      'es': 'Regístrese para continuar',
      'en': 'Sign up to continue',
    },
    'ay81oaoo': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'w0qlaqtn': {
      'es': 'Apellidos',
      'en': 'Last name',
    },
    '1ozpp9t6': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'oi40xbpb': {
      'es': 'Número de teléfono',
      'en': 'Phone',
    },
    'jd5rrq3k': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'qiai2yaf': {
      'es': 'Registrarse',
      'en': 'Register',
    },
    'f963dqj1': {
      'es': 'O regístrate con',
      'en': 'Or register with',
    },
    'tvampr1x': {
      'es': 'Continuar con Google',
      'en': 'Continue with Google',
    },
    '7wht4rc5': {
      'es': '¿Tienes una cuenta? ',
      'en': 'Do you have an account?',
    },
    'xbp05zmq': {
      'es': 'Inicie sesión aquí',
      'en': 'Log in here',
    },
    'ar2d6bco': {
      'es': 'Derechos reservados.',
      'en': 'All rights reserved.',
    },
    '5cyzmp6j': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'e9bwbidf': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    'bhivrlkq': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'd4yj603p': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    'yz43ua72': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'gu6610tl': {
      'es': 'Debe ingresar al menos 8 caracteres',
      'en': 'You must enter at least 8 characters',
    },
    'tcacrek0': {
      'es': 'Superó el máximo de caracteres',
      'en': 'Exceeded maximum characters',
    },
    '9ixwczg5': {
      'es': 'El correo ingresado no es válido',
      'en': 'The email entered is not valid',
    },
    'yq4lm6r8': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    '15srzje3': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'aodcsapf': {
      'es': 'Debe ingresar al menos 8 caracteres',
      'en': 'You must enter at least 8 characters',
    },
    'd3zzea7l': {
      'es': 'Superó el máximo de caracteres',
      'en': 'Exceeded maximum characters',
    },
    '2j26z4ma': {
      'es':
          'La contraseña debe tener entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula, al menos una mayúscula y al menos un carácter no alfanumérico.',
      'en':
          'The password must be between 8 and 16 characters, at least one digit, at least one lowercase letter, at least one uppercase letter, and at least one non-alphanumeric character.',
    },
    '6jc0qc6w': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    '285zl6rl': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // Forgotpassword
  {
    '4susm0wc': {
      'es': 'Cambiar contraseña',
      'en': 'Change password',
    },
    '482evrng': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'k1s0c4g7': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'vkbvv4t3': {
      'es': 'Confirmar contraseña',
      'en': 'Confirm Password',
    },
    'g8gbmv0m': {
      'es': 'Cambiar contraseña',
      'en': 'Change password',
    },
    'yuc95r4v': {
      'es': '¿Tienes una cuenta? ',
      'en': 'Do you have an account?',
    },
    '4f3jp504': {
      'es': 'Inicie sesión aquí',
      'en': 'Log in here',
    },
    'pyvxngej': {
      'es': '¿No tienes una cuenta? ',
      'en': 'Don\'t have an account?',
    },
    'pnrn9e72': {
      'es': 'Registrate aquí',
      'en': 'Register here',
    },
    'u8k71i7h': {
      'es': 'Derechos reservados.',
      'en': 'All rights reserved.',
    },
    '20o585p2': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // Perfil
  {
    'psbb8erh': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    '52kb67q1': {
      'es': 'Administrar reservas',
      'en': '',
    },
    '725mhm2w': {
      'es': 'Administrar servicios',
      'en': '',
    },
    '8zuhj9cn': {
      'es': 'Lenguaje',
      'en': 'Language',
    },
    'gz8bvqaj': {
      'es': 'Tipo de fuente',
      'en': 'Font type',
    },
    'z2s8svr4': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
    },
    'kr3oqwem': {
      'es': 'Eliminar cuenta',
      'en': 'Delete account',
    },
    'r8h8dm6e': {
      'es': 'Mi Perfil',
      'en': 'My Profile',
    },
    'fbv268if': {
      'es': 'Perfil',
      'en': 'Profile',
    },
  },
  // Contactenos
  {
    'wvgle8dw': {
      'es': 'Contáctenos',
      'en': 'Contact us',
    },
    'h4aurjil': {
      'es': 'Nuestra ubicación',
      'en': 'Our location',
    },
    'vo8m1lt3': {
      'es': 'Contacto',
      'en': 'Contact',
    },
    '31cg0xqc': {
      'es': '8899-8899',
      'en': '8906-0789',
    },
    '678796cw': {
      'es': 'Hems Spa',
      'en': 'Hems Spa',
    },
    '48qxiy35': {
      'es': '7 am - 4 pm',
      'en': '7 am - 4 pm',
    },
    'js4mzhqm': {
      'es': 'Hems Spa',
      'en': 'Hems Spa',
    },
    '4i90j1xz': {
      'es': 'Contáctenos',
      'en': 'Contact us',
    },
  },
  // Servicios
  {
    'nlerhwpd': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'hyx2itnn': {
      'es': 'En esta sección puede visualizar y registrar los servicios',
      'en': 'In this section you can view and register the services',
    },
    'ys5qi9i9': {
      'es': 'Servicios Destacados',
      'en': 'Top services',
    },
    'cvlhkazb': {
      'es': 'Todos los servicios',
      'en': 'All services',
    },
    'cvds9hjb': {
      'es': 'Hems Spa',
      'en': 'Hems spa',
    },
    'rld394kx': {
      'es': 'Servicios',
      'en': 'Services',
    },
  },
  // DetalleServicio
  {
    '8w3qzlt5': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'bv693jz4': {
      'es': 'Total',
      'en': 'Total',
    },
    '50rxml4y': {
      'es': 'Reservar servicio',
      'en': 'Book service',
    },
    'xttykemn': {
      'es': 'Detalle de servicio',
      'en': 'Service detail',
    },
    'vktj8clm': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // MisServicios
  {
    'rwxw9ynf': {
      'es': 'Servicios contratados:',
      'en': 'Contracted services:',
    },
    '131d17sx': {
      'es': 'Servicios',
      'en': 'My quotes',
    },
    'tobhufpg': {
      'es': 'Servicios',
      'en': 'My quotes',
    },
  },
  // MisReservaciones
  {
    'qe2maf60': {
      'es': 'Servicios contratados:',
      'en': '',
    },
    'n9hs3uzy': {
      'es': 'Mis reservaciones',
      'en': '',
    },
    'ahfhxj3w': {
      'es': 'Reservas',
      'en': '',
    },
  },
  // MisReservacionesAdmin
  {
    'cscwjhzw': {
      'es': 'Servicios contratados:',
      'en': '',
    },
    'u6y3a58a': {
      'es': 'Reservaciones',
      'en': '',
    },
    '6tka8wld': {
      'es': 'Reservas',
      'en': '',
    },
  },
  // bs_eliminarCita
  {
    'io0788v9': {
      'es': 'Para confirmar, escribir borrar',
      'en': 'To confirm, type delete',
    },
    'co378gh6': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    '85b6cc1y': {
      'es': 'Confirmar',
      'en': 'Confirm',
    },
  },
  // bs_agregarServicio
  {
    'tnd2yhms': {
      'es': 'Agregar servicio',
      'en': 'Add service',
    },
    'ths4ai5x': {
      'es': 'Nombre del servicio...',
      'en': 'Name of service...',
    },
    'h2r6ysk9': {
      'es': 'Costo del servicio...',
      'en': 'Cost of service...',
    },
    'm827dw95': {
      'es': 'Descripción...',
      'en': 'Description...',
    },
    '64di19i9': {
      'es': 'Agregar a servicios',
      'en': 'Add to services',
    },
    '4n0lfii3': {
      'es': 'Campo requerido',
      'en': '',
    },
    'h8y8mybv': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the drop-down menu',
    },
    '7l1262w5': {
      'es': 'Campo requerido',
      'en': '',
    },
    'zjw6qjjz': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the drop-down menu',
    },
    'd1q8azov': {
      'es': 'Campo requerido',
      'en': '',
    },
    'r10j53qs': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bs_editarServicio
  {
    'pu9tzvup': {
      'es': 'Editar servicio',
      'en': 'Edit service',
    },
    'fbfemibs': {
      'es': 'Agregar a servicios',
      'en': 'Add service',
    },
  },
  // bs_eliminarServicio
  {
    'q2zncxu7': {
      'es': 'Eliminar servicio',
      'en': 'Delete service',
    },
    'ln4aielo': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // bs_editarperfil
  {
    'hqghdrxc': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    'b69a7gk0': {
      'es': 'Guardar información',
      'en': 'Save information',
    },
  },
  // bs_idioma
  {
    'mn2hk731': {
      'es': 'Idioma',
      'en': 'Language',
    },
    'nv0gt6ao': {
      'es': 'Español',
      'en': 'Spanish',
    },
    'bsth8aca': {
      'es': 'Ingles',
      'en': 'English',
    },
  },
  // bs_fuentes
  {
    'tmk6np0v': {
      'es': 'Cambiar Fuentes',
      'en': 'Change Fonts',
    },
    'j57rsg0o': {
      'es': 'Titulos',
      'en': 'Titles',
    },
    '0he1k14m': {
      'es': 'Pequeño',
      'en': 'small',
    },
    'dlkvwy35': {
      'es': 'Medio',
      'en': 'medium',
    },
    'twd34byl': {
      'es': 'Grande',
      'en': 'large',
    },
    '7jkz0vdm': {
      'es': 'Textos Medianos',
      'en': 'Medium Texts',
    },
    '41qd0ekm': {
      'es': 'Pequeño',
      'en': 'small',
    },
    'ltbitbjd': {
      'es': 'Medio',
      'en': 'medium',
    },
    'zp0id0qj': {
      'es': 'Grande',
      'en': 'large',
    },
    'notzbtzq': {
      'es': 'Textos Pequeños',
      'en': 'Small Texts',
    },
    'a6om3ou1': {
      'es': 'Pequeño',
      'en': 'small',
    },
    'e6n6pbia': {
      'es': 'Medio',
      'en': 'medium',
    },
    'jli5uysv': {
      'es': 'Grande',
      'en': 'large',
    },
    'xfulfa18': {
      'es': 'Botones',
      'en': 'Buttons',
    },
    'ir3b2va9': {
      'es': 'Pequeño',
      'en': 'small',
    },
    'infkhp3g': {
      'es': 'Medio',
      'en': 'medium',
    },
    '4zstx73j': {
      'es': 'Grande',
      'en': 'large',
    },
  },
  // bs_eliminarCuenta
  {
    'fbqvy91f': {
      'es': '¿Desea eliminar su cuenta de forma permanente?',
      'en': '¿Do you want to delete your account permanently?',
    },
    'd81vac15': {
      'es': 'Si',
      'en': 'Yes',
    },
    'hj1uwhhc': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // bs_agregarReserva
  {
    'grij0g3w': {
      'es': 'Agregar reserva',
      'en': '',
    },
    'keufqn3e': {
      'es': 'Nombre del servicio...',
      'en': '',
    },
    'tv9dbgp4': {
      'es': 'Costo del servicio...',
      'en': '',
    },
    'lgrrpi3i': {
      'es': 'Descripción...',
      'en': '',
    },
    'k3jpyugn': {
      'es': 'Agregar a reserva',
      'en': '',
    },
    'jjdm4npz': {
      'es': 'Campo requerido',
      'en': '',
    },
    'b5ft8kwe': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'c9z2bx6k': {
      'es': 'Campo requerido',
      'en': '',
    },
    'j990qgy9': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3sy2shb1': {
      'es': 'Campo requerido',
      'en': '',
    },
    'hrtn5prh': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '1r2idosd': {
      'es': '',
      'en': '',
    },
    'b9k7h6xz': {
      'es': '',
      'en': '',
    },
    'un1b5yca': {
      'es': '',
      'en': '',
    },
    'g4lgqu9i': {
      'es': '',
      'en': '',
    },
    'px2rikir': {
      'es': '',
      'en': '',
    },
    '27fqyjad': {
      'es': '',
      'en': '',
    },
    'kp91gsre': {
      'es': '',
      'en': '',
    },
    'hgvey3bq': {
      'es': '',
      'en': '',
    },
    'fiwd54gd': {
      'es': '',
      'en': '',
    },
    'd85g57vf': {
      'es': '',
      'en': '',
    },
    '7kms4st1': {
      'es': '',
      'en': '',
    },
    '8mbxxld1': {
      'es': '',
      'en': '',
    },
    'lnh3lz1j': {
      'es': '',
      'en': '',
    },
    'rbt0ovrk': {
      'es': '',
      'en': '',
    },
    'ww2fhyff': {
      'es': '',
      'en': '',
    },
    '28f6xhg8': {
      'es': '',
      'en': '',
    },
    'jfmx5cdh': {
      'es': '',
      'en': '',
    },
    '7144a2dh': {
      'es': '',
      'en': '',
    },
    '518p28b7': {
      'es': '',
      'en': '',
    },
    'rb4z8t2c': {
      'es': '',
      'en': '',
    },
    'qxbzthk6': {
      'es': '',
      'en': '',
    },
    'fvkrkg31': {
      'es': '',
      'en': '',
    },
    '3q39ifnd': {
      'es': '',
      'en': '',
    },
    'ioto81jh': {
      'es': '',
      'en': '',
    },
    'b2dtfy2s': {
      'es': '',
      'en': '',
    },
    'xaxyxp39': {
      'es': '',
      'en': '',
    },
    '44n7p899': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
