// MARK: Домашнее задание к 7-ой лекции.





// MARK: - Задача #1.

/*  В данной задаче вы тренируетесь добавлять и удалять значения в Хранилище (массив) при помощи двух функций, которые вам и нужно реализовать. Функции принимают значение, но ничего не возвращают.
    Первая функция добавляет элемент в массив, вторая функция удаляет элемент из массива, вы сами можете выбрать любой удобный для вас вариант добавления и удаления элементов из массива.

    Алгоритм решения:
    - 1. Создайте пустой массив строк типа String на любимую тематику, например, это будет Хранилище столовых приборов (этот пример не использовать), в который вы будете поочередно добавлять или удалять ложки, вилки и другие приборы.
    - 2. Создайте 2 функции в соответствии с условием.
    - 3. Попробуйте добавлять и удалять значения в массиве при помощи созданных функций.
    - 4. Что произойдет, если попытаетесь удалить значение, которого нет в Хранилище? Напишите, что в этом случае вы можете изменить в своей функции и внесите в нее изменения.
    - 5. Условие со звездочкой (необязательное для выполнения): обе функции должны принимать массив и значение. Они должны добавлять или удалять значения в массиве.
         Функция удаления должна быть безопасной, т.е. если Хранилище пустое, мы должны сообщить об этом пользователю, если запрашиваемое на удаление значение отсутствует, необходимо также сообщить, что такого элемента нет.
         Запрещается использование forced unwrapping, если в вашем варианте будет необходимость работать с опциональными значениями. */

print("👉 Задача #1.")
var someFlagColors: [String] = ["Белый", "Синий", "Красный"]

// Метод добавления нового элемента в массив.
func adding(to array: inout [String], newItem: String) {
    array.append(newItem)
    print("   - Новый цвет: '\(newItem)' добавлен в словарь.")
}

// Проверки метода добавления.
print("\n🔹 ADD (изначальный массив):", someFlagColors)
adding(to: &someFlagColors, newItem: "Черный")
adding(to: &someFlagColors, newItem: "Красный")
adding(to: &someFlagColors, newItem: "Красный")
adding(to: &someFlagColors, newItem: "Красный")
print("🔹 ADD (массив после добавления):", someFlagColors)

// Метод удаления элемента из словаря по индексу. (1 вариант)
func removingElement(from array: inout [String], by index: Int) {
    if (!array.isEmpty) && (index >= 0) && (index < array.count) {          // Проверки: 1) Массив не пустой; 2) Индекс не отрицательный; 3) Элемент под таким индексом существует.
        print("   - Цвет: '\(array[index])' удален из словаря.")
        array.remove(at: index)
    } else if array.isEmpty {                                               // Если массив пустой, выводим соответсвуеющее сообщение.
        print("   - Массив является пустым.")
    } else if index < 0 {                                                   // Если индекс отрицательный, выводим соответсвуеющее сообщение.
        print("   - Индекс не может быть отрицательным числом.")
    } else {                                                                // Если элемента под таким индексом нет, выводим соответсвующее сообщение.
        print("   - Элемента по такому индексу не существует")
    }
}

// Метод удаления элемента(ов) из словаря по значению. (2 вариант)
func removing(element: String, from array: inout [String]) {
    guard !array.isEmpty else { print("   - Ваш массив является пустым."); return }
    guard let removingElementIndex = array.firstIndex(of: element) else { print("   - Такого элемента '\(element)' не существует."); return }
    array.remove(at: removingElementIndex)
}

// Проверки метода удаления по индексу.
print("\n🔸 1. REMOVE (изначальный массив):", someFlagColors)
removingElement(from: &someFlagColors, by: 4)
removingElement(from: &someFlagColors, by: 0)
print("🔸 1. REMOVE (после удаления 2-х элементов):", someFlagColors)
removingElement(from: &someFlagColors, by: -1)
removingElement(from: &someFlagColors, by: 3)
print("🔸 1. REMOVE (после попытки некорректных удалений):", someFlagColors)

// Проверки метода удаления по значению.
print("\n🔸 2. REMOVE (изначальный массив):", someFlagColors)
removing(element: "Черный", from: &someFlagColors)
removing(element: "Красный", from: &someFlagColors)
removing(element: "Черный", from: &someFlagColors)
print("\n🔸 2. REMOVE (изначальный массив):", someFlagColors)
 
 
 


// MARK: - Задача #2.

/*  Вы получили тестовое задание от службы доставки еды: преобразовать бонусные баллы клиентов, которые хранятся на сайте, в денежные единицы. Со стороны сайта приходит словарь, содержащий ID клиента (Int) и накопленную сумму Бонусов (Double). Ваша задача вернуть на сайт словарь, содержащий ID клиента (Int) и конвертированные денежные единицы (Int), каждые 100 бонусов равны 10 денежным единицам.

    Алгоритм решения:
    - 1. Словарь со своими значениями создавать не нужно. Значения, с которыми вы будете работать, инкапсулированы и переданы в userPoints.
    - 2. Распечатайте словарь и посмотрите, с какими значениями вы будете работать.
    - 3. Создайте функцию, которая принимаем словарь, ключом которого будет тип Integer, значением число с плавающей точкой Double, вернуть необходимо словарь ключом и значением, которого будет Integer.
    - 4. Вызовите функцию и распечатайте полученный результат.
    - 5. Дополнительно (необязательно) входящих параметров может быть больше, например, для коэффициента пересчета баллов в денежные единицы.*/

print("\n\n👉 Задача #2.")

typealias UsersPointsDictionary = [Int: Double]
typealias UsersCashDictionary = [Int: Int]

var userPoints: UsersPointsDictionary = [90: 1391.69, 14: 5941.22, 28: 4941.28, 9: 4661.12, 57: 4887.22, 38: 1248.34, 50: 5988.89, 61: 5805.56, 76: 2873.12, 39: 5915.56, 85: 4130.56, 54: 3904.67, 96: 6938.45, 66: 3961.45, 67: 2619.34, 44: 5349.45, 87: 1217.23, 43: 3519.46, 83: 4395.76, 65: 5415.87, 45: 2392.98, 33: 5796.09, 71: 6863.56, 99: 5252.31, 94: 4254.78, 49: 3697.56, 78: 5829.48, 80: 6077.87, 70: 3048.23, 59: 4800.34, 18: 2579.65, 64: 4235.56, 29: 3251.68, 98: 6971.88, 60: 812.55, 5: 4647.34, 55: 2598.44, 63: 1269.23, 93: 6114.78, 46: 4978.87, 68: 2912.98, 10: 2823.67, 48: 1805.89, 62: 3804, 74: 828, 79: 3456, 25: 3518, 1: 2400.76, 16: 4966, 30: 3238, 13: 196, 52: 558, 21: 3119, 2: 6099, 56: 6149, 97: 733, 17: 3546, 69: 3495, 34: 5952, 42: 568, 88: 5548, 86: 5138, 91: 6455, 47: 3868, 35: 1850, 41: 3313, 75: 2788, 24: 3162, 27: 4015, 22: 337.67, 4: 6567.55, 37: 5116.45, 51: 782.76, 23: 183.76, 8: 705.34, 40: 2054.89, 11: 4080.57, 7: 6420.87, 77: 6693.34, 53: 2001.54, 32: 1041.54, 6: 5489.34, 3: 2970.87, 82: 2260.34, 84: 5014.49, 95: 1000.59, 26: 634.34, 12: 4719.65, 20: 5342.56, 58: 4021.34, 15: 2333.34, 19: 5998.76, 73: 115.55, 92: 1431.44, 100: 3433.78, 81: 575, 89: 4389, 72: 35.50, 36: 6602.59, 31: 90.58]
print("🔹 Клиенты до конвертации с баллами: \(userPoints)")

func conversion(dictionary: UsersPointsDictionary) -> UsersCashDictionary {
    var userCash: UsersCashDictionary = [:]
    for (elementID, elementPoint) in dictionary {
        userCash[elementID] = Int(elementPoint) / 100 * 10
    }
    return userCash
}

var userCash = conversion(dictionary: userPoints)
print("🔹 Клиенты, с конвертированными баллами в рубли: \(userCash)")

 



// MARK: - Задача #3. (Первый вариант решения).

/*  Вам необходимо реализовать функцию, которая принимаем массив опциональных значений типа Integer и возвращает кортеж, в который необходимо передать сумму четных и нечетных значений.
    Массив может содержать повторяющиеся и nil значения, например: [1, 2, nil, 12, 1, nil, 3, 2].
    В вычислении должны быть использованы только уникальные значения, а повторяющиеся учитываться не должны. Например, у нас повторяются числа 1 и 2, но попадать в результат они должны один раз; сумма нечетных будет (1 + 3 = 4), четных (2 + 12 = 14).
    Так как в массиве могут быть nil, а вернуть необходимо не опциональное значение, необходимо использовать безопасное развертывание опционала (optional binding).
    Для проверки вашего решения передайте в функцию подготовленный массив arrayOfNumbers.
    Массив со своими значениями создавать не нужно. Значения, с которыми вы будете работать, инкапсулированы и переданы в arrayOfNumbers.
    Распечатайте массив и посмотрите, с какими значениями вы будете работать.
    Если вы все правильно сделаете, то получите ответ: сумма четных: 1378, нечетных: 1304. */

print("\n\n👉 Задача #3.")
var arrayOfNumbers = [70, 44, 97, 96, 99, 72, nil, 100, 40, 96, 1, 70, 77, 93, 25, 11, 89, 24, 50, 84, 81, 33, 95, 8, 22, 56, 24, 14, 4, 21, 14, 8, 59, 12, 81, 100, 8, 24, 4, 34, 17, 22, 54, 77, 87, nil, 1, 62, 33, 92, 66, 73, 51, 52, 25, 24, 20, 20, 13, 13, 51, 47, 8, 12, 53, nil, 13, 59, 98, 13, 13, 22, 10, 97, 88, 96, 24, 63, 12, 72, 47, 60, 51, 33, 35, 84, 79, 5, 89, 11, 46, 12, 13, nil, 22, 40, nil, 8, 14, 24]

func calculateSumEvenOddValues(from array: [Int?]) -> (Int, Int) {
    
    var uniqueNumbers: [Int] = []
    var sumOdd = 0
    var sumEven = 0
    
    for numberOptional in array {
        if let numberInt = numberOptional {
            if !uniqueNumbers.contains(numberInt) {
                uniqueNumbers.append(numberInt)
            }
        }
    }
    
    for i in 1...2 {
        switch i {
        case 1:
            sumOdd = uniqueNumbers.filter{ $0 % 2 == 0 }.reduce(0, +)
        default:
            sumEven = uniqueNumbers.filter{ $0 % 2 != 0 }.reduce(0, +)
        }
    }
    
    print("Сумма уникальных четных чисел: \(sumOdd)")
    print("Сумма уникальных не четных чисел: \(sumEven)")
    return (sumOdd, sumEven)
}

// Проверка решения задачи №3.
calculateSumEvenOddValues(from: arrayOfNumbers)





// MARK: - Второй вариант решение задания #3.
// Это вариант, с помощью которого я решил изначально, после чего пришел к первому варианту решение.

/* func calculateSumEvenOddValues1(from array: [Int?]) -> (Int, Int) {
    
    var uniqueNumbers: [Int] = []
    
    for numberOptional in array {
        if let numberInt = numberOptional {
            if !uniqueNumbers.contains(numberInt) {
                uniqueNumbers.append(numberInt)
            }
        }
    }
    
    var odd: [Int] = []
    var even: [Int] = []
    
    var q: [Int] = []
    var r: [Int] = []
    
    let evenArray1 = uniqueNumbers.filter{$0 % 2 != 0}
    for i in evenArray1 {
        for j in evenArray1 {
            if i != j {
                if !q.contains(i) && !q.contains(j) {
                    if i % 2 != 0 && j % 2 != 0 {
                        q.append(i)
                        q.append(j)
                        even.append(i + j)
                    }
                }
            }
            if !q.contains(evenArray1[evenArray1.endIndex - 1]) && evenArray1[evenArray1.endIndex - 1] % 2 == 0 {
                print(evenArray1[evenArray1.endIndex - 1])
                q.append(evenArray1[evenArray1.endIndex - 1])
                even.append(evenArray1[evenArray1.endIndex - 1])
            }
        }
    }
    
    let oddArray1 = uniqueNumbers.filter{$0 % 2 == 0}
    for i in oddArray1 {
        for j in oddArray1 {
            if i != j {
                if !r.contains(i) && !r.contains(j) {
                    if i % 2 == 0 && j % 2 == 0 {
                        r.append(i)
                        r.append(j)
                        odd.append(i + j)
                    }
                }
                if !r.contains(oddArray1[oddArray1.endIndex - 1]) && oddArray1[oddArray1.endIndex - 1] % 2 == 0 {
                    r.append(oddArray1[oddArray1.endIndex - 1])
                    odd.append(oddArray1[oddArray1.endIndex - 1])
                }
            }
        }
    }
    
    var k: Int = 0
    var g: Int = 0
    
    for i in even {
        k += i
    }
    
    for i in odd {
        g += i
    }
    
    print("Сумма четных: \(g)")
    print("Сумма не четных: \(k)")

    return (g, k)
}

calculateSumEvenOddValues1(from: arrayOfNumbers) */
