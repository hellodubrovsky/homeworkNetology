// MARK: Домашнее задание к #4 лекции.





// MARK: - Задача #1.
print("👉 Задание #1:")

/*  Создайте три опциональные строковые переменные.
    Первые две проинициализируйте значениями, оставшуюся переменную проинициализируйте значением nil.
    При помощи nil-coalescing оператора выведите каждое значение в консоль с новой строки.
    Затем присвойте 3-й переменной значение и выведите его в консоль, используя nil-coalescing оператор.
    Есть ли разница между выводами в случае, когда переменная не имела значения и после присвоения.
 
    Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквы.
    Найти сумму всех этих констант приведя их к Int. (Используйте optional binding и forced unwrapping). */

var firstVariable: String? = "01"
var secondVarible: Optional<String> = "02"      // Либо: var seocndVarible = Optional<String>("Вторая переменная") / Либо: var secondVarible = String?("Вторая переменная")
var thirdVarible: String?                       // Либо: var thirdVarible: String? = Optional<String>.none / Либо: var thirdVarible: String? = nil

let noValueError = "Значение отсутсвует"
print("Первая переменная: \(firstVariable ?? noValueError).\nВторая переменная: \(secondVarible ?? noValueError).\nТретья переменная: \(thirdVarible ?? noValueError).\n")

let firstConstant = "1"
let secondConstant = "80333222"
let thirdConstant = "123abc"
let fourthConstant = "5g6h7j8k9l"
let fifthConstant = "#41fI?35&"

/* Для тестирования:
   let firstConstant = "1"
   let secondConstant = "5"
   let thirdConstant = "6"
   let fourthConstant = "8"
   let fifthConstant = "10" */

print("Первый вариант решения 2-ой части 1-го задания:")

if let newFirstConstant = Int(firstConstant), let newSecondConstant = Int(secondConstant), let newThirdConstant = Int(thirdConstant), let newFourthConstant = Int(fourthConstant), let newFifthConstant = Int(fifthConstant) {
    print("Сумма констант:", newFirstConstant + newSecondConstant + newThirdConstant + newFourthConstant + newFifthConstant, "\n")
} else {
    print("Одну или несколько переменных, нельзя перевести в тип Int.\n")
}

//  Не совсем понял формулировку 2-ой части 1-го задания, поэтому реализовал второй вариант,
//  который высчитывает сумму всех констант, которые можно перевести из Sting в Int.

print("Второй вариант решения 2-ой части 1-го задания:")
var sumOfStringConstant: Int = 0

if let newFirstConstant = Int(firstConstant) {
    sumOfStringConstant += newFirstConstant
    print("- Первая константа может быть переведена в Int. Она равна - \(newFirstConstant).")
}

if let newSecondConstant = Int(secondConstant) {
    sumOfStringConstant += newSecondConstant
    print("- Первая константа может быть переведена в Int. Она равна - \(newSecondConstant).")
}

if let newThirdConstant = Int(thirdConstant) {
    sumOfStringConstant += newThirdConstant
    print("- Первая константа может быть переведена в Int. Она равна - \(newThirdConstant).")
}

if let newFourthConstant = Int(fourthConstant) {
    sumOfStringConstant += newFourthConstant
    print("- Первая константа может быть переведена в Int. Она равна - \(newFourthConstant).")
}

if let newFifthConstant = Int(fifthConstant) {
    sumOfStringConstant += newFifthConstant
    print("- Первая константа может быть переведена в Int. Она равна - \(newFifthConstant).")
}

print("Сумма констант, которые можно перевести в Int = \(sumOfStringConstant).\n")





// MARK: - Задача #2.
print("👉 Задание #2:")

/*  Создайте опциональную константу с типом данных Optional<Int>.
    Проинициализируйте конструктором преобразования строки в целое число Int(String).
    Вместо String впишите температуру за окном. При помощи конструкции if else выведите в консоль информационные сообщения, например для таких случаев, температура:
    - Больше нуля;
    - Меньше нуля;
    - Меньше -10 градусов;
    - Больше 10 градусов;
    - Нет значения (nil).
    Например, если температура -25 градусов, можно вывести в консоль сообщение “Это что, Сибирь?”
    Попробуйте подставить различные значения в конструктор, чтобы увидеть в консоли все сообщения. */

let temperature: Int? = Int("-48")

/* Для тестирования:
 let temperature: Int? = Int("0")
 let temperature: Int? = Int("4")
 let temperature: Int? = Int("14")
 let temperature: Int? = Int("-4")
 let temperature: Int? = Int("-14") */

if let temperatureInt = temperature {
    switch temperatureInt {
    case 0:
        print("Температура ровно на нуле. Ваша температура: \(temperatureInt).")
    case 1...10:
        print("У вас не слишком жарко, но и не слишкой холодно. Температура от 0 до 10 градусов. Ваша температура: \(temperatureInt).")
    case 11...:
        print("Похоже, вы живете в Африке, у вас достаточно жарко. Температура больше 10 градусов. Ваша температура: \(temperatureInt).")
    case -10...(-1):
        print("У вас не слишком холодко, но и совсем не жарко. Температура от -10 до 0 градусов. Ваша температура: \(temperatureInt).")
    case ...(-11):
        print("Похоже, вы живете на Серевном полюсе, у вас очень холодно. Температура больше 10 градусов. Ваша температура: \(temperatureInt).")
    default:
        print("Неизвестная ошибка. Попало в default.")
    }
} else {
    print("Нет значения (nil). Невозможно перевести вашу строку в тип Integer.")
}
