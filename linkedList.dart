class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data);
}
class LinkedList<T> {
  Node<T>? head;

  void add(T value) {
    Node<T> newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node<T> current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }

  void printList() {
    Node<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }


}
void main() {

  //Challenge 1: Print in Reverse
  void printReverse<T>(Node<T>? node) {
    if (node == null) return;
    printReverse(node.next);
    print(node.data);
  }
  LinkedList<int> list = LinkedList<int>();
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(10);
  list.add(40);


  print("Original:");
  list.printList();
  print("Reversed:");
  printReverse(list.head);


  // Challenge 2: Find the Middle Node
  Node<T>? findMiddle<T>(Node<T>? head) {
    Node<T>? slow = head;
    Node<T>? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }

    return slow;
  }
  Node<int>? middle = findMiddle(list.head);
  print("\nMiddle node: ${middle?.data}");

  // Challenge 3: Reverse a Linked List
  Node<T>? reverseLinkedList<T>(Node<T>? head) {
    Node<T>? prev = null;
    Node<T>? current = head;

    while (current != null) {
      Node<T>? next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }

    return prev;
  }
  list.head = reverseLinkedList(list.head);
  print("\nReversed:");
  list.printList();

  // Challenge 4: Remove All Occurrences
  Node<T>? removeAll<T>(Node<T>? head, T target) {
    // Step 1: Remove matching nodes at the head
    while (head != null && head.data == target) {
      head = head.next;
    }

    // Step 2: Traverse and remove matching nodes
    Node<T>? current = head;
    while (current != null && current.next != null) {
      if (current.next!.data == target) {
        current.next = current.next!.next; // Skip the node
      } else {
        current = current.next;
      }
    }

    return head;
  }


  list.head = removeAll(list.head, 10);

  print("\nAfter removing 10:");
  list.printList();
}
