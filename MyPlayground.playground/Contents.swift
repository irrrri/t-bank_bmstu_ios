import Foundation

// ДЗ1
print("ДЗ1")
print("--------------------")

// Задача 1: Количество уникальных слов
print("Задача 1: Количество уникальных слов")
func countUniqueWords(_ text: String) -> Int {
    let words = text.lowercased().split(separator: " ")
    let uniqueWords = Set(words)
    return uniqueWords.count
}

print(countUniqueWords("apple Orange pineapple PEAR")) // 4
print(countUniqueWords("apple aPPle appLe Apple")) // 1

print("--------------------")

// Задача 2: Проверка скобочной последовательности
print("Задача 2: Проверка скобочной последовательности")
func isValidParentheses(_ text: String) -> String {
    if text.isEmpty { return "Некорректная" }
    
    var balance = 0

    for char in text {
        if char == "(" {
            balance += 1
        } else if char == ")" {
            balance -= 1
        } else {
            return "Некорректная"
        }

        if balance < 0 { return "Некорректная" }
    }
    
    return balance == 0 ? "Корректная" : "Некорректная"
}

print(isValidParentheses("(())")) // Корректная
print(isValidParentheses("))((")) // Некорректная
print(isValidParentheses("()()()")) // Корректная
print(isValidParentheses("()a()")) // Некорректная
print(isValidParentheses("((()))")) // Корректная
print(isValidParentheses("((())")) // Некорректная
print(isValidParentheses("hello")) // Некорректная
print(isValidParentheses("")) // Некорректная

print("--------------------")

// Задача 3: Группировка строк по длине
print("Задача 3: Группировка строк по длине")
func groupByLength(_ array: [String]) -> [Int: [String]] {
    var result = [Int: [String]]()
    for word in array {
        result[word.count, default: []].append(word)
    }
    return result
}

print(groupByLength(["a", "bb", "b", "cccc"])) // [1: ["a", "b"], 2: ["bb"], 4: ["cccc"]]
print(groupByLength(["a", "b", "c"])) // [1: ["a", "b", "c"]]

print("--------------------")

// Задача 4: Средняя оценка студентов
print("Задача 4: Средняя оценка студентов")
func averageScore(_ scores: [String: Int?]) -> String {
    let validScores = scores.values.compactMap { $0 }
    guard !validScores.isEmpty else { return "Никто не сдал" }
    let average = Double(validScores.reduce(0, +)) / Double(validScores.count)
    return String(Int(average.rounded()))
}

print(averageScore(["A": 4, "B": 4, "C": 4])) // 4
print(averageScore(["A": nil, "B": nil, "C": nil])) // Никто не сдал

print("--------------------")

// Задача 5: Перечисление математических операций
print("Задача 5: Перечисление математических операций")
enum MathOperation {
    case sum(Int, Int)
    case subtract(Int, Int)
    case multiply(Int, Int)
    case divide(Int, Int)
    case square(Int)
    case squareRoot(Double) // Изменили имя, чтобы избежать конфликта
    
    func perform() -> String {
        switch self {
        case .sum(let a, let b):
            return "Сумма - \(a + b)"
        case .subtract(let a, let b):
            return "Разность - \(a - b)"
        case .multiply(let a, let b):
            return "Произведение - \(a * b)"
        case .divide(let a, let b):
            return b != 0 ? "Деление - \(a / b)" : "Ошибка: деление на ноль"
        case .square(let a):
            return "Квадрат - \(a * a)"
        case .squareRoot(let a): // Используем новое имя
            return a >= 0 ? "Корень - \(sqrt(a))" : "Ошибка: корень из отрицательного числа"
        }
    }
}

let operations: [MathOperation] = [
    .sum(1, 2),
    .square(2),
    .subtract(5, 3),
    .multiply(3, 4),
    .squareRoot(16) // Используем новое имя
]

for operation in operations {
    print(operation.perform())
}

print("--------------------")

// ДЗ2
print("ДЗ2")
print("--------------------")

// Перечисление жанров книг
enum Genre {
    case fiction, novel, poems
}

// Структура книги
struct Book {
    let title: String
    let author: String
    let price: Double
    let genre: Genre
}

extension Book: CustomStringConvertible {
    var description: String {
        return "\(title) - \(author), Цена: \(price)"
    }
}

// Класс библиотеки
final class Library {
    private var books: [Book] = []
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func filterBooks(by genre: Genre) -> [Book] {
        return books.filter { $0.genre == genre }
    }
    
    func filterBooks(byName name: String) -> [Book] {
        return books.filter { $0.title.lowercased().contains(name.lowercased()) }
    }
}

// Класс пользователя
final class User {
    private let name: String
    private let discount: Double
    private var cart: [Book] = []
    
    init(name: String, discount: Double) {
        self.name = name
        self.discount = discount
    }
    
    func addToCart(_ books: [Book]) {
        cart.append(contentsOf: books)
    }
    
    func totalPrice() -> Double {
        let fullPriceFactor: Double = 1  // Константа для единичной цены (полная стоимость без скидки)
        let percentageDivider: Double = 100  // Константа для преобразования процента в десятичную дробь
        let total = cart.reduce(0) { $0 + $1.price }
        return total * (fullPriceFactor - discount / percentageDivider)
    }
    
    func sortedListOfBooks(by criterion: SortingCriterion) -> [Book] {
        switch criterion {
        case .byTitle:
            return cart.sorted { $0.title < $1.title }
        case .byPrice:
            return cart.sorted { $0.price < $1.price }
        }
    }
}

// Перечисление для сортировки
enum SortingCriterion {
    case byTitle
    case byPrice
}

// Тестирование
let library = Library()
library.addBook(
    Book(
        title: "Гарри Поттер и философский камень",
        author: "Дж.К. Роулинг",
        price: 1000,
        genre: .fiction
    )
)
library.addBook(
    Book(
        title: "Война и мир",
        author: "Лев Толстой",
        price: 850,
        genre: .novel
    )
)
library.addBook(
    Book(
        title: "Стихотворение",
        author: "Владимир Маяковский",
        price: 540,
        genre: .poems
    )
)

let user = User(name: "Алиса", discount: 1.5)
let novelBooks = library.filterBooks(by: .novel)
user.addToCart(novelBooks)
let booksWithName = library.filterBooks(byName: "Гарри")
user.addToCart(booksWithName)

print("Итоговая корзина:\n\(user.sortedListOfBooks(by: .byTitle).map { $0.description }.joined(separator: "\n"))")
print("Цена корзины: \(user.totalPrice())")

print("--------------------")
