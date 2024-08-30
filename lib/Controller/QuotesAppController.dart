import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/ApiHelper.dart';
import '../DBHelper/DBHelper.dart';
import '../Modal/QuotesModal.dart';

class QuotesAppController extends GetxController{

  RxList<QuotesModel> mainQuotes = <QuotesModel>[].obs;
  RxList<QuotesModel> quotes = <QuotesModel>[].obs;
  RxList data = [].obs;

  var themeSelect = 'assets/Images/img/Themes/11.jpg'.obs;
  var themeSelectsIndex=1.obs;
  var fontValue = 20.0.obs;
  var fontFamily = 'f1'.obs;
  var selectedFontFamily = 2.obs;
  var isLiked = false.obs;
  var likeOpacity = 0.0.obs;
  var selectQuotes=0.obs;
  var likedQuotes = <String>[].obs;
  var saveCategoryName = ''.obs;
  var showWallpepar = false.obs;

  void showWallpeparUi()
  {
    showWallpepar.value=!showWallpepar.value;
  }


  Future<void> likeSave(String category,String img) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String quoteString = "$category-$img";

    if (!likedQuotes.contains(quoteString))
    {
      likedQuotes.add(quoteString);
      await prefs.setStringList('items', likedQuotes);
    }
    else
    {
      // Get.snackbar('Info', 'This quote is already liked');
    }
  }

  Future<void> likedQuotesRemove(int index) async {
    likedQuotes.removeAt(index);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', likedQuotes);
  }

  Future<void> likeGet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    likedQuotes.value = prefs.getStringList('items') ?? [];
  }

  void selectQuote(var value)
  {
    selectQuotes.value=value;
  }


  void onDoubleTap() {
    isLiked.value = !isLiked.value;
    likeOpacity.value = 1.0;

    Future.delayed(const Duration(milliseconds: 500), () {
      likeOpacity.value = 0.0;
    });
  }

  void setFontFamily(var value,var index)
  {
    selectedFontFamily.value=index;
    fontFamily.value= value;
  }
  void setFontSize(var value) {
    fontValue.value = value;
  }

  void setTheme(var value,var index)
  {
    themeSelectsIndex.value=index;
    themeSelect.value = value;
  }

  Future<void> loadData() async {

    // Start fetching data
    List json = await ApiServices.apiServices.fetchData();

    // Process the data
    mainQuotes.value = json.map((e) => QuotesModel.fromJson(e)).toList();
    quotes.value = mainQuotes;

  }

  // DBHelper--------------------------------------------------------

  Future initDb()
  async {
    await DbHelper.dbHelper.database;
    await getRecords();
  }

  Future getRecords()
  async {
    data.value =  await DbHelper.dbHelper.readData();
    return data;
  }

  Future insertRecord(String quote,String author,String category,String image)
  async {
    await DbHelper.dbHelper.insertData(quote,author,category,image);
    await getRecords();
  }

  Future<void> readCategoryRecord(String category)
  async {
    saveCategoryName.value=category;
    data.value = await DbHelper.dbHelper.readCategoryData(category);
  }

  Future removeRecord(int id)
  async {
    await DbHelper.dbHelper.deleteData(id);
    await getRecords();
  }

  @override
  void onInit()
  {
    super.onInit();
    loadData();
    likeGet();
    initDb();
  }

}