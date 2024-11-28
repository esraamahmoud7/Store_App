import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../services/get_all_product_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<ProductModel> products=[];

  void getData()async
  {
    try
    {
      emit(HomeLoading());
       products= await AllProductsService().getAllProducts();
       print("data get");
       emit(HomeSuccess());
    }
    on Exception catch(e)
    {
      emit(HomeFailure());
    }
  }
}
