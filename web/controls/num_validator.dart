
/**
 * From a String [value], returns a valid num.  If the string is not
 * valid, then the return is 0.
 */
num _validNum(String value){
  if (value == null) return 0;
  if (value.isEmpty()) return 0;

  num numValue;

  try{
    numValue = double.parse(value);
  }
  on FormatException catch(e){
    numValue = 0;
  }

  return numValue;
}
