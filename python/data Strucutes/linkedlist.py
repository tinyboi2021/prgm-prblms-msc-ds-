class Node:
    def __init__(self,data):
        self.data=data
        self.next=None

class LinkedList:
    def __init__(self):
        self.head=None

    def append(self,data):
        newNode=Node(data)

        if not self.head:
            self.head=newNode
            return
        curr=self.head

        while curr.next:
            curr=curr.next
        curr.next=newNode

    def prepend(self,data):
        newNode=Node(data)
        newNode.next=self.head
        self.head=newNode

    def delete(self,key):
        
        curr=self.head

        if curr and curr.data == key:
            self.head=curr.next
            return
        
        prev=None

        while curr and curr.data !=key:
            prev=curr
            curr=curr.next

        if curr:
            prev.next=curr.next


    def display(self):
        curr=self.head
        while curr:
            print(curr.data,end=" -> ")
            curr=curr.next
        print("None")



l1=LinkedList()
l1.append(1)
l1.append(2)
l1.prepend(10)
l1.display()

l1.delete(2)
l1.display()