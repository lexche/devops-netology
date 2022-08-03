# Домашнее задание к занятию "7.5. Основы golang."

## Задача 3

1.
        package main
        import "fmt"
        func main() {
        fmt.Print("Enter a number: ")
        var input float64
        fmt.Scanf("%f", &input)
        output := input * 2
        fmt.Println(output)


2.
        package main
        import "fmt"
        func main() {
        x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
        z := x[0]
        for i:=1; i < len(x); i++ {
            if x[i] < z {z = x[i]}
        }
        fmt.Println(z)
        }

3.
    package main
    import "fmt"
    func main() {
    for i:=1; i<=100; i++ {
    if i % 3 == 0 {
    fmt.Println(i)
        }
	}
	}
