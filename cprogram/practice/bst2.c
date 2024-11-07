#include<stdio.h>
#include<stdlib.h>

struct node{
	int data;
	struct node* left;
	struct node* right;
}*root=NULL;


struct node* createNode(int data){
	struct node* temp=(struct node*)malloc(sizeof(struct node));
	temp->data=data;
	temp->right=temp->left=NULL;
	
	return temp;
}

struct node* insert(struct node* root,int data){
	if(root==NULL){
		return createNode(data);
	}

	if(data<root->data){
		root->left=insert(root->right,data);
	}
	else if(data>root->data){
		root->right=insert(root->right,data);
	}
}

void inorder(struct node* root){
	if(root!=NULL){
		inorder(root->left);
		printf("%d ->",root->data);
		inorder(root->right);
	}

}

struct node* search(struct node* root,int key){
	if(root==NULL|| root->data == key){
		return root;
	}
	if(key<root->data){
		search(root->left,key);
	}
	else if(key>root->data){
		search(root->right,key);
	}
}

struct node* findMin(struct node* root){
	while(root->left!=NULL){
		root=root->left;
	}
	return root;
}

struct node* deleteNode(struct node* root,int key){
	if(root==NULL){
		return root;
	}

	if(key<root->data){
		root->left=deleteNode(root->left,key);
	}
	else if(key>root->data){
		root->right=deleteNode(root->right,key);
	}
	else{
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
	
	
	struct node* temp=findMin(root->right);
	root->data=temp->data;
	root->right=deleteNode(root->right,temp->data);
	}
}
			

void main(){
	struct node* searchResult=NULL;
	root=insert(root,3);
	root=insert(root,1);
	root=insert(root,4);

	inorder(root);
	printf("NULL");

	searchResult=search(root,3);

	if(searchResult!=NULL)
		printf("\n search found for %d \n",searchResult->data);
	else if(searchResult==NULL)
		printf("search not found\n");

	root=deleteNode(root,4);
	inorder(root);
}
	
	