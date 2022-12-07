


import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_tarwej/di.dart';

class DataDi {
  static Future<void> initialize() async {
    // injector.registerLazySingleton(() => const FlutterSecureStorage());

    // injector.registerLazySingleton<PreferencesHelper>(
    //         () => PreferencesHelperImp(injector()));

    injector.registerLazySingleton<Link>(() {

      final link = Link.from([
        HttpLink(
            "https://staging-api.trwej.com/graphql",
            defaultHeaders: {
              "lang": _getCountryLanguage()
            }
        )
      ]);
      final authLink = AuthLink(getToken: () async {
        // final preferencesHelper = injector.get<PreferencesHelper>();
        // final token = await preferencesHelper.getToken() ?? "";
        String token = "";
        if (token.isNotEmpty) {
          return 'bearer $token';
        } else {
          return null;
        }
      });

      final concatLink = authLink.concat(link);

      final webSocketLink = WebSocketLink(
          "",
          config: const SocketClientConfig(
              initialPayload: authenticationHeader
          )
      );

      return Link.split(
              (request) => request.isSubscription,
          webSocketLink,
          concatLink
      );
    });

    injector.registerLazySingleton(() => GraphQLClient(
      link: injector(),
      cache: GraphQLCache(),
    ));
  }

  static Future<Map<String, dynamic>> authenticationHeader() async {
   // final preferencesHelper = injector.get<PreferencesHelper>();
    //final token = await preferencesHelper.getToken() ?? "";
    String token = "";
    if (token.isNotEmpty) {
      return {
        "Authorization" : "bearer $token"
      };
    } else {
      return {};
    }
  }

  static String _getCountryLanguage() {
    final String country = Platform.localeName.split("_").last;
    // final String appLanguage = isAppInArabic() ? "ar" : "en";
    const String appLanguage =  "en";

    return '$country-$appLanguage';
  }
}