import 'package:task/core/config/di/dependencies/providers/provider_imports.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._providersSplash,
  ..._providersUseCase,
];

List<SingleChildWidget> _providersSplash = <SingleChildWidget>[
  ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider(), lazy: false, ),
];

List<SingleChildWidget> _providersUseCase = <SingleChildWidget>[
  // ChangeNotifierProvider<BooksNewProvider>(create: (_) => BooksNewProvider(getBooksNewUseCase: sl()), lazy: false,),
  // ChangeNotifierProvider<SearchBooksProvider>(create: (_) => SearchBooksProvider(getSearchBooksUseCase: sl()), lazy: false,),
  // ChangeNotifierProvider<BooksDetailsProvider> (create: (_) => BooksDetailsProvider(getBookDetailsUseCase: sl()), lazy: false,),
];
