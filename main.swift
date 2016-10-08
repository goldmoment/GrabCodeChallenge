func find(_ red: Int, _ green: Int, _ blue: Int, _ n: Int, _ state: Int, _ sum: Int, _ completion: (Int)->()) {
  if n == 0 {
    completion(sum)
  } else {
    if state == -1 {
      find(red, green, blue, n - 1, 0, sum + red, completion)
    }
    
    if state == 0 {
      if green > blue {
        find(red, green, blue, n - 1, 1, sum + green, completion)
      } else {
         find(red, green, blue, n - 1, 2, sum + blue, completion)
      }
    }

    if state == 1 {
      if red > blue {
        find(red, green, blue, n - 1, 0, sum + red, completion)
      } else {
        find(red, green, blue, n - 1, 2, sum + blue, completion)
      }
    }

    if state == 2 {
      if red > green {
        find(red, green, blue, n - 1, 0, sum + red, completion)
      } else {
        find(red, green, blue, n - 1, 1, sum + green, completion)
      }
    }
  }
}

let t = Int(readLine()!)!

for i in 0..<t {
  let n = Int(readLine()!)!
  
  let arr = readLine()!.characters.split{ $0 == " " }.map(String.init)
  let red = Int(arr[0])!
  let green = Int(arr[1])!
  let blue = Int(arr[2])!
    
  if n == 1 {
    print(red)
  } else {
    find(red, green, blue, n, -1, 0) { val in
      print(val)
    }
  }
}