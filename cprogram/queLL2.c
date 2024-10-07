#include<stdio.h>
#include<stdlib.h>

struct node{
	int data;
	struct node *next;
}*front=NULL,*rear=NULL,*temp;

void enqueue(int x){
	temp=(struct node*)malloc(sizeof(struct node));
	temp->data=x;
	temp->next=NULL;
	
	if(rear==NULL){
		front=rear=temp;
	}
	else{
		rear->next=temp;
		rear=temp;
	}
}

void display(){	
	if(front==NULL){
		printf("there is no element in the queue");
	}
	else{
		temp=front;
		int i=0;
		printf("the elements inside the queue is\n");
		while(temp!=NULL){
			printf("%d :%d \n",i,temp->data);
			temp=temp->next;
			i++;
		}
	}
}

void dequeue(){
	if(front==NULL){
		printf("the is no element to delete");
	}
	else if(front==rear){
		printf("the deleted element is %d\n",front->data);
		front=rear=NULL;
	}
	else{
		printf("the deleted element is %d\n",front->data);
		front=front->next;
	}
}

		

void main(){
	
	enqueue(1);
	enqueue(2);

	display();
	dequeue();
	display();
}			
	