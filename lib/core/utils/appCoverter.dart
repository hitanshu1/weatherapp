
import 'getStorage.dart';
/// app converter
class AppConverter{
  AppConverter._();

  /// covert celsius to fahrenheit
  static String getTemValue(double celsius,{bool enableUnit = true}) {
    if(AppGetXStorage.getIsCelsius()){
      if(enableUnit){
        return '$celsius °';
      }else{
        return celsius.toStringAsFixed(2);
      }
      
    }else{
      if(enableUnit){
         return '${(celsius * 9 / 5 + 32).toStringAsFixed(2)} °F';
      }else{
        return (celsius * 9 / 5 + 32).toStringAsFixed(2);
      }
     
    }
    
  }
  /// get temp unit
  static String getTempUnit() {
    return AppGetXStorage.getIsCelsius() ? '°C' : '°F';
  }
}
