// MARK: Домашнее задание к 6 лекции.





 // MARK: - Задача 1.

 /* Работа с кортежами
    Вы работаете над приложением "Информация о вас и ваших друзьях".
    Ваша задача создать список людей с минимальной информацией о них и объединить одно из полей для создания общего значения.

    Алгоритм выполнения:
    - Создайте кортеж с тремя параметрами: ваш любимый фильм, ваше любимое число и ваше любимое блюдо. Все элементы кортежа должны быть именованы.
    - Одним выражением запишите каждый элемент кортежа в три константы.
    - Создайте второй кортеж, аналогичный первому по параметрам, но описывающий другого человека (с другими значениями).
    - Обменяйте значения в кортежах между собой (с использованием дополнительного промежуточного кортежа).
    - Создайте новый кортеж, элементами которого будут любимое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кортежей. */


// - Создайте кортеж с тремя параметрами: ваш любимый фильм, ваше любимое число и ваше любимое блюдо. Все элементы кортежа должны быть именованы.
var infoAboutMe: (String, Int, String) = ("Матрица", 10, "Хот-дог")

// - Одним выражением запишите каждый элемент кортежа в три константы.
let (myFavoritFilm, myFavoritNumber, myFavoritFood) = infoAboutMe

// - Создайте второй кортеж, аналогичный первому по параметрам, но описывающий другого человека (с другими значениями).
var infoAboutAnotherPerson = ("Люди в черном", 888, "Гамбургер")

print("👉 ЗАДАНИЕ #1.\n")
print("Me before change: \(infoAboutMe).")
print("Another before change: \(infoAboutAnotherPerson).\n")

// - Обменяйте значения в кортежах между собой (с использованием дополнительного промежуточного кортежа).
var intermediateTuples = infoAboutMe
infoAboutMe = infoAboutAnotherPerson
infoAboutAnotherPerson = intermediateTuples

print("Me after change: \(infoAboutMe).")
print("Another before change: \(infoAboutAnotherPerson).")

//  - Создайте новый кортеж, элементами которого будут любимое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кортежей.
var newTuple = (infoAboutMe.1, infoAboutAnotherPerson.1, (infoAboutMe.1 - infoAboutAnotherPerson.1))
print("\nNew tuple: \(newTuple).")





 // MARK: - Задача 2.

 /* Представьте, что вы работаете над приложением электронный дневник.
    Создайте словарь, где ключом будет имя студента, а значением будет другой словарь из 3 элементов, содержащий название предмета и оценку. */

let electronicDiaries: [String: [String: Int]] = ["Ilya": ["Phisics": 5, "English": 4, "Russian": 3], "Alex": ["Phisics": 2, "English": 5, "Russian": 4]]
print("\n\n👉 ЗАДАНИЕ #2.\n")
print("ElectronicDiaries: \(electronicDiaries)")





 // MARK: - Задача 3.

 /* Вы разрабатываете приложение "Шахматы". Вашей задачей будет создать фигуру на игровом поле.
 
    Алгоритм выполнения:
    - Создайте псевдоним типа (typealias) Chessman для типа словаря [String: (alpha:Character, num: Int)?]. Данный тип описывает шахматную фигуру на игровом поле.
    - В ключе словаря должно храниться имя фигуры, например «Белый король», а в значении — кортеж, указывающий на координаты фигуры на игровом поле.
      Если вместо кортежа находится nil, это означает, что фигура убита (не имеет координат на игровом поле).
    - Создайте переменный словарь Chessmans типа Chessman и добавьте в него три произвольные фигуры, одна из которых не должна иметь координат.
    - Создайте конструкцию if-else, которая проверяет, убита ли переданная ей фигура (элемент словаря Chessmans), и выводит на консоль информацию
      либо о координатах фигуры, либо о ее отсутствии на игровом поле.

    Подсказка Для получения координат переданной фигуры используйте опциональное связывание.
    // chessmans[key] - опциональное значение
    if let info = chessmans[key] {
        // Действие
    } */

typealias Chessman = [String: (alpha: Character, num: Int)?]
var chessman: Chessman = ["White bishop": ("A", 2), "White knight": ("B", 8), "Black pawn": nil]

print("\n\n👉 ЗАДАНИЕ #3.\n")

func checkingForTheExistenceOfFigure(dictionaryChessmans: Chessman, figureInDictionary: String) {
    if let figure = dictionaryChessmans[figureInDictionary] {
        if let coordinate = figure {
            print("Coordinate figure '\(figureInDictionary)':", coordinate)
        } else {
            print("The figure '\(figureInDictionary)' is killed.")
        }
    } else {
        print("Figure '\(figureInDictionary)' not found.")
    }
}

checkingForTheExistenceOfFigure(dictionaryChessmans: chessman, figureInDictionary: "White knight")      // Проверка существующей и не убитой фигуры
checkingForTheExistenceOfFigure(dictionaryChessmans: chessman, figureInDictionary: "Black pawn")        // Проверка существующей, но убитой фигуры
checkingForTheExistenceOfFigure(dictionaryChessmans: chessman, figureInDictionary: "Black")             // Проверка не существующей фигуры





 // MARK: - Задача 4.

 /* Вам необходимо доработать программу из Задачи 3 таким образом, чтобы она автоматически анализировала не одну переданную ей фигуру, а все фигуры, хранящиеся в переменной Chessmans. */
print("\n\n👉 ЗАДАНИЕ #4.\n")

if !chessman.isEmpty {
    for figure in chessman.keys {
        checkingForTheExistenceOfFigure(dictionaryChessmans: chessman, figureInDictionary: figure)
    }
} else {
    print("Chessman empty.")
}
