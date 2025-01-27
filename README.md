# news_app
Simple News Application with Flutter 

🚀 Features
1.Clean Architecture:
  1.1.Well-structured codebase with a clear separation of concerns.
  1.2.Divided into Presentation, Domain, and Data layers.
2.State Management:
  2.1.Flutter Bloc ensures predictable and testable state transitions.
  2.2.Decouples UI logic from business logic.
3.Network Communication:
  3.1.Retrofit simplifies API calls with a declarative interface. 
4.Local Persistence:
  4.1.Floor provides a reactive SQLite database abstraction.



In this project I am using code generation because of that first run command
1.flutter run bulid_runner build 
2.make changes in file news_api_service.g.dart
past this instead of generated file it is same but with little changes

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _NewsApiService implements NewsApiService {
  _NewsApiService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apiKey': apiKey,
      r'country': country,
      r'category': category,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<List<ArticleModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/top-headlines',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late List<ArticleModel> _value;
    try {
      List<ArticleModel> temp = [];

      if (_result.data != null &&
          _result.data!['articles'] != null &&
          _result.data!['articles'].length > 0) {
        for (int i = 0; i < _result.data!['articles'].length; ++i) {
          ArticleModel article =
              ArticleModel.fromJson(_result.data!['articles'][i]);

          temp.add(article);
        }
      }

      _value = temp;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }

    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}


 
