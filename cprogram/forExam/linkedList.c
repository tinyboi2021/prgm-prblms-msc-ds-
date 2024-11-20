#include<stdio.h>
#include<stdlib.h>

struct node{
	int data;
	struct node* next;
};

struct node* createNode(int data){
	struct node* newNode=(struct node*)malloc(sizeof(struct node));
	newNode->data=data;
	newNode->next=NULL;

	return newNode;
}

void insertAtBeg(struct node** head,int data){
	struct node* newNode=createNode(data);
	newNode->next=*head;
	*head=newNode;

}

void insertAtEnd(struct node** head,int data){
	struct node* newNode=createNode(data);
	if(*head==NULL){
		*head=newNode;
		return;
	}
	struct node* temp=*head;
	while(temp->next!=NULL){
		temp=temp->next;
	}
	temp->next=newNode;
}
int search(struct node* head,int key){
	struct node* temp=head;
	while(temp!=NULL){
		if(key==temp->data){
			return 1;
		}
			temp=temp->next;
	}
	return 0;
}	

void deleteNode(struct node** head,int key){
	struct node* temp=*head;
	struct node* prev=NULL;

	if(temp!=NULL&&temp->data==key){
		*head=temp->next;
		free(temp);
		return;
	}

	while(temp!=NULL&&temp->data!=key){
		prev=temp;
		temp=temp->next;
	}

	if(temp==NULL){
		printf("value to be deleted not found\n");
	}
		

	prev->next=temp->next;
	free(temp);
}

void traverse(struct node* head){
	struct node* temp=head;
	while(temp!=NULL){
		printf(" %d  ->",temp->data);
		temp=temp->next;
	}
	printf(" NULL \n");
}		
	

void main(){
	struct node* head=NULL;
	insertAtBeg(&head,10);
	insertAtBeg(&head,30);

	traverse(head);
	insertAtEnd(&head,20);
	traverse(head);
	if(search(head,1)){
		printf("the elment is found\n");
	}else{
		printf("the element is not found\n");
	}

	deleteNode(&head,10);

	traverse(head);

}