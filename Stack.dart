// Challenge 1:
void reverseList(List<dynamic> input) {
  // for (int i = input.length - 1; i >= 0; i--) {
  //   print(input[i]);
  // }
  while (input.isNotEmpty) {
    print(input.removeLast());
  }
}

// Challenge 2:
bool isBalanced(String input) {
  List<String> stack = [];

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    if (char == '(') {
      stack.add(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false;
      }
      stack.removeLast();
    }
  }

  return stack.isEmpty;
}

void main() {
  // Challenge 1:
  /*
  List<int> numbers = [1, 2, 3, 4, 5];
  print("Original List: $numbers");
  print("Reversed List:");
  reverseList(numbers);
*/

  // Challenge 2:
  print(isBalanced("(hello(world))"));
  print(isBalanced("((a)(a))"));
  print(isBalanced("a)(a"));
  print(isBalanced("((a)"));
}



