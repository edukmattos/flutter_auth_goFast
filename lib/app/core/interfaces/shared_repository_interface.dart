abstract class ISharesRepositoryInterface {
  // ignore: type_annotate_public_apis
  setInstance();
  dynamic getValue<T>(String key);
  Future<bool> setValue<T>(String key, dynamic value);
}
