
#include <stdio.h>
#include<stdlib.h>
#define MAX 5
int queue[MAX];
int front=-1, rear=-1;
void enqueue(int x)
{
    if(rear==MAX-1)
    {
        printf("overflow");
    }
    else
    {
    if(front == -1)
    {
        front = 0;
    }
        rear +=1;
        queue[rear]=x;
    }     
}
void dequeue()
{
    if(front == -1 || front > rear)
    {
        printf("\nunderflow\n");
    }
    else
    {
        printf("\n%d removed\n ",queue[front]);
        front +=1;
    }
    if (front > rear) 
        { 
            front = rear = -1;
        }
}
void display()
{
    int i;
if(front == -1 || front > rear)
    {
        printf("\nqueue is empty\n");
    }
    else
    {
        for( i = front;i<=rear;i++)
        {
            printf("%d\t",queue[i]);
        }
    }
}
int main() {
   
    int data,choice;
    while(1)
    {
        
        printf("\nchoose the operation to be performed\n");
        printf("1.insertion\t 2.deletion \t 3.display \n 4.exit    \n");
        scanf("%d",&choice);
        switch(choice)
        {
        case 1:
            printf("enter the data: ");
            scanf("%d",&data);
            enqueue(data);
            break;
        case 2:
            dequeue();
            break;
        case 3:
            display();
            break;
        case 4:
            printf("\exiting......\n");
            exit(0);
            break;
        default:
            printf("\ninvalid input\n");
        }
    }

    return 0;
}
