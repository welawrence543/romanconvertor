def fromRoman(romanNumber)
    length = romanNumber.length
    for index in 0..(length-1)
        if romanNumber[index] != "I" &&
            romanNumber[index] != "V" &&
            romanNumber[index] != "X" &&
            romanNumber[index] != "L" &&
            romanNumber[index] != "C" &&
            romanNumber[index] != "D" &&
            romanNumber[index] != "M"
            raise TypeError
        end
    end

    if romanNumber != romanNumber.upcase
        raise TypeError
    end

    numerals = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100,
                  "D" => 500, "M" => 1000}

    arabicValue = 0
    for index in 0..(length - 1)
        if (index > 0) && (numerals[romanNumber[index]] > numerals[romanNumber[index-1]])
            arabicValue += numerals[romanNumber[index]] - 2 * numerals[romanNumber[index-1]]
        else
            arabicValue += numerals[romanNumber[index]]
        end
    end
    return arabicValue
end

def toRoman(arabicNumber)
    if arabicNumber < 1 || arabicNumber > 3999
        raise RangeError
    end

    ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    thousands = ["", "M", "MM", "MMM"]

    romanNumeral = thousands[arabicNumber / 1000] +
        hundreds[(arabicNumber % 1000) / 100] +
        tens[(arabicNumber % 100) / 10] +
        ones[arabicNumber % 10]
    return romanNumeral
end