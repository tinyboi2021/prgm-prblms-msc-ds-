#include <stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *next;
}*front=NULL,*rear=NULL,*temp;
void Enqueue(int x)
{
    temp = (struct node *)malloc(sizeof(struct node));
    temp->data=x;
    temp->next=NULL;
    if(front==NULL) 
    {
		front=rear=temp;
    }
					
	else{			
		rear->next=temp;
		rear=temp;
		}
}
void Dequeue()
{
    if(front==NULL){
		printf("\nEmpty Queue\n");
        }		
					
	else if(front==rear){
			printf("\n%d dequeued\n",front->data);
			front=rear=NULL;
			}
			
	else{
		printf("\n%d dequeued\n",front->data);
		front=front->next;
		}
}
void display()
{
    if(front==NULL){
		printf("\nEmpty Queue\n");
    }
	else{
		temp=front;
		while(temp!=NULL){
			printf(" %d ",temp->data);
			temp=temp->next;	
			}		
		}
}
int main() {
    int data,choice;
    while(1){
		printf("\nMenu..\n");
		printf("1: Enqueue\t2: Dequeue\t3: Display\t4: Exit\n");
		printf("Enter the choice: ");
		scanf("%d",&choice);
		switch(choice)
		{
		    case 1:
		    printf("enter the element to be inserted\n");
		    scanf("%d",&data);
		    Enqueue(data);
		    break;
		    
		    case 2:
		    Dequeue();
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
