#include <stdio.h>
#include<stdlib.h>
#define max 5
int stack[max];
int top=-1;
void push(int x)
{
    if(top==max-1)
    {
        printf("overflow");
    }
    else
    {
    top++;
    stack[top]=x;
    }     
}
void pop()
{
    if(top == -1)
    {
        printf("\nunderflow\n");
    }
    else
    {
        printf("\n%d removed\n ",stack[top]);
        top--;
    }
    
}
void display()
{
    int i;
if(top == -1)
    {
        printf("\nstack is empty\n");
    }
    else
    {
        for( i = 0; i<=top; i++)
        {
            printf("%d\t",stack[i]);
        }
    }
}
int main() {
    // Write C code here
    int data,choice;
    while(1)
    {
        
        printf("\nchoose the operation to be performed\n");
        printf("1.push\t 2.pop \t 3.display \t 4.exit \n");
        scanf("%d",&choice);
        switch(choice)
        {
        case 1:
            printf("enter the data: ");
            scanf("%d",&data);
            push(data);
            break;
        case 2:
            pop();
            break;
        case 3:
            display();
            break;
        case 4:
            printf("\nexiting......\n");
            exit(0);
            break;
        default:
            printf("\ninvalid input\n");
        }
    }

    return 0;
 
}
