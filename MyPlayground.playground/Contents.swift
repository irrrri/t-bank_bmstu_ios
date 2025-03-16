import Foundation

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
