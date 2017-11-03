// StackDouble Pila = new StackDouble();
class StackDouble
{
  private int n; // size of the stack
  private Node first; // top of the stack
  
  // Node class
  private class Node
  {
      private double item;
      private Node next;
  }
  
  // check if stack is empty
  boolean isEmpty()
  {
      return first == null;
  }
  
  // number of elements on the stack
  int stackSize()
  {
      return n;
  }
  
  // PUSH: add an element to the stack
  void push(double item)
  {
      Node oldfirst = first;
      first = new Node();
      first.item = item;
      first.next = oldfirst;
      n++;
  }
  
  // POP: delete and return the most recently added element
  double pop()
  {
      if (isEmpty())
      {
        println("stack underflow");
        return (-1);
      }
      else
      {
        double item = first.item; // save item to return
        first = first.next; // delete first node
        n--;
        return item; // return the saved item
      }
  }
  
  // LOOK: return the most recently added element (top of the stack)
  double LOOK()
  {
      if (isEmpty())
      {
        println("stack underflow");
        return (-1);
      }
      else
      {
        return first.item; // return the saved item
      }
  }
  
  // getItem: return the n-th value
  double getItem(int n)
  {
     double val = 0.0;
     int i = 0;
     for (Node x = first; x != null; x = x.next)
     {
       if (n == i)
       { 
         //println(x.item);
         val = x.item;
         break;
       }
       i++; 
     }
     return(val);
  }
  
  // printStack: print the stack items (console)
  void printStack()
  {
      int n = 1;
      for (Node x = first; x != null; x = x.next)
      {
        println(x.item);
        //n++;
      }  
  }    
  
  // drawStack: draw the stack items on canvas
  void drawStack(int fd)
  {
      int xp, yp, step;
      xp = baseDigitX;
      yp = baseDigitY + stepDigitY;
      step = stepDigitY;
      fill(digitOutputCol);
      textAlign(RIGHT);
      int num = 0;
      for (Node x = first; x != null; x = x.next)
      {
        if (num < 7)
        {
          String numStr = formatNumber(x.item);
          text(numStr, xp, yp);
          num++;
        }
        //println(x.item);
        yp = yp + step;
      }
  }
  
  // clearStack: clear all items of the stack
  void clearStack()
  {
    while (!isEmpty()) { pop(); }
    //n = 0;
  }
}