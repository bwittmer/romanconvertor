def fromRoman(romanNumber)

    number = 0
    romanNumberString = String.new(romanNumber)

    while romanNumberString[0] == "M"
      romanNumberString.slice!(0)
      number += 1000
    end

    if romanNumberString[0] == "D"
      romanNumberString.slice!(0)
      number += 500
    end

    while romanNumberString[0] == "C"
      if romanNumberString[1] == "M"
        romanNumberString.slice!(0..1)
        number += 900
      elsif romanNumberString[1] == "D"
        romanNumberString.slice!(0..1)
        number += 400
      else
        romanNumberString.slice!(0)
        number += 100
      end
    end

    if romanNumberString[0] == "L"
      romanNumberString.slice!(0)
      number += 50
    end

    while romanNumberString[0] == "X"
      if romanNumberString[1] == "C"
        romanNumberString.slice!(0..1)
        number += 90
      elsif romanNumberString[1] == "L"
        romanNumberString.slice!(0..1)
        number += 40
      else
        romanNumberString.slice!(0)
        number += 10
      end
    end

    if romanNumberString[0] == "V"
      romanNumberString.slice!(0)
      number += 5
    end

    while romanNumberString[0] == "I"
      if romanNumberString[1] == "X"
        romanNumberString.slice!(0..1)
        number += 9
      elsif romanNumberString[1] == "V"
        romanNumberString.slice!(0..1)
        number += 4
      else
        romanNumberString.slice!(0)
        number += 1
      end
    end

    return number if number != 0
    raise(TypeError)
end

def toRoman(arabicNumber)

  romanString = ""
  arabicNumberInteger = Integer(arabicNumber)

  if 4000 <= arabicNumberInteger || 0 >= arabicNumberInteger
    raise(RangeError)
  end

  while 4000 > arabicNumberInteger && arabicNumberInteger >= 1000
    arabicNumberInteger -= 1000
    romanString.insert(romanString.size, "M")
  end

  if 1000 > arabicNumberInteger && arabicNumberInteger >= 900
    arabicNumberInteger -= 900
    romanString.insert(romanString.size, "CM")
  end

  if 900 > arabicNumberInteger && arabicNumberInteger >= 500
    arabicNumberInteger -= 500
    romanString.insert(romanString.size, "D")
  end

  if 500 > arabicNumberInteger && arabicNumberInteger >= 400
    arabicNumberInteger -= 400
    romanString.insert(romanString.size, "CD")
  end

  while 400 > arabicNumberInteger && arabicNumberInteger >= 100
    arabicNumberInteger -= 100
    romanString.insert(romanString.size, "C")
  end

  if 100 > arabicNumberInteger && arabicNumberInteger >= 90
    arabicNumberInteger -= 90
    romanString.insert(romanString.size, "XC")
  end

  if 90 > arabicNumberInteger && arabicNumberInteger >= 50
    arabicNumberInteger -= 50
    romanString.insert(romanString.size, "L")
  end

  if 50 > arabicNumberInteger && arabicNumberInteger >= 40
    arabicNumberInteger -= 40
    romanString.insert(romanString.size, "XL")
  end

  while 40 > arabicNumberInteger && arabicNumberInteger >= 10
    arabicNumberInteger -= 10
    romanString.insert(romanString.size, "X")
  end

  if 10 > arabicNumberInteger && arabicNumberInteger >= 9
    arabicNumberInteger -= 9
    romanString.insert(romanString.size, "IX")
  end

  if 9 > arabicNumberInteger && arabicNumberInteger >= 5
    arabicNumberInteger -= 5
    romanString.insert(romanString.size, "V")
  end

  if 5 > arabicNumberInteger && arabicNumberInteger >= 4
    arabicNumberInteger -= 4
    romanString.insert(romanString.size, "IV")
  end

  while arabicNumberInteger > 0
    arabicNumberInteger -= 1
    romanString.insert(romanString.size, "I")
  end


  return romanString if !romanString.empty?
end