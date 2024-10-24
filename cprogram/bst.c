#include<stdio.h>
#include<stdlib.h>

struct node{
	int data;
	struct node *left;
	struct node *right;
}*root = NULL;

struct node* createNode(int data){
	struct node *temp = (struct node*)malloc(sizeof(struct node));
	temp->data=data;
	temp->left=temp->right=NULL;
	
	return temp;
}

struct node* insert(struct node* root,int data){
	if(root==NULL){
		return createNode(data);
	}
	
	
	
	if(data < root->data){
		root->left = insert(root->left,data);
	}
	else if(data > root->data){
		root->right = insert(root->right,data);
	}
		
	return root;
	
}


void inorder(struct node* root){
	if(root!=NULL){
		inorder(root->left);
		printf("%d \t",root->data);
		inorder(root->right);
	}
}


struct node* search(struct node *root,int key){
	
	if(root == NULL || root->data == key){
		return root;
	}
	
	if(key<root->data){
		return search(root->left,key);
		return search(root->right,key);
	}
}

struct node* findMin(struct node* root){
	while(root->left!=NULL){
		root = root->left;
	}
	return root;
}

struct node* deleteNode(struct node *root,int key){
	if(root==NULL){
		return root;
	}
		
	if(key<root->data){
		root->left=deleteNode(root->left,key);
	}else if(key>root->data){
		root->right=deleteNode(root->right,key);
	}else{
	
	
		if(root->right==NULL&&root->left==NULL){
			free(root);
			return NULL;
		}
		
		if(root->right==NULL){
			struct node* temp=root->left;
			free(root);
			
			return temp;
		}
		else if(root->left==NULL){
			struct node* temp=root->right;
			free(root);
			
			return temp;
		}

		struct node *temp=findMin(root->right);
		
		root->data = temp->data;
		root->right = deleteNode(root->right,temp->data);
	}
}
		

void main(){

	struct node* searchResult;
	int key,choice,value,del;
	
	while(1){
		printf("\nenter choice to select \n");
		printf("1 . insert\n");
		printf("2 . display (inorder) \n");
		printf("3 . search element \n");
		printf("4 . delete element \n");
		printf("5 . exit \n");
		scanf("%d",&choice);
		switch(choice){
			case 1:
				printf("\n enter the value \n");
				scanf("%d",&value);
				root = insert(root,value);
				
				break;
			
			case 2:
				
				printf("\nthe elements of the bst is \n");
				inorder(root);
				break;
				
			case 3:
				
				printf("enter a key to  search");
				scanf("%d",&key);
				searchResult = search(root,key);
				if(searchResult!=NULL){
					printf("the element is found in the tree\n");
				}else{
					printf("the element is not found in the tree\n");
				}
				break;
				
			case 4:
				printf("enter a element to delete");
				scanf("%d",&del);
				root=deleteNode(root,del);
				printf("elements after deletion");
				inorder(root);
				break;
				
			case 5:
				printf("program exited");
				exit(0);
				
			default:
				printf("invalid choice ");
				break;
				
		}
	
	}
		
			
	
	
	
	
} 

	
