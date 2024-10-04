#include <stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *next;
}*top=NULL,*temp;
void push(int x)
{
    temp = (struct node *)malloc(sizeof(struct node));
    temp->data=x;
    temp->next=NULL;
    if (top == NULL)
    {
        top = temp;
    }
    else
    {
        temp->next=top;
        top = temp;
    }
}
void pop()
{
    if(top==NULL)
    {
        printf("\nstack is empty");
    }
    else
    {
        printf("%d removed",top->data);
        top=top->next;
    }
}
void display()
{
 if(top==NULL)
    {
        printf("\nstack is empty");
    }
    else
    {
        temp=top;
        while(temp!=NULL)
        {
            printf("%d\t",temp->data);
            temp=temp->next;
        }
    }
}

int main() {
    int data,choice;
    while(1){
		printf("\nMenu..\n");
		printf("1: Push\t2: Pop\t3: Display\t4: Exit\n");
		printf("Enter the choice: ");
		scanf("%d",&choice);
		switch(choice)
		{
		    case 1:
		    printf("enter the element to be inserted\n");
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
		    printf("exiting...");
		    exit(0);
		    break;
		    
		    default:
		    printf("invalid input");
		    
		}
    }

    return 0;
}
