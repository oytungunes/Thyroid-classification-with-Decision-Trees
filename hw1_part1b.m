% clear all
% clc
% % construct the tree and calculate accuracies for train and test data
% 
% load Tree_final_unbalanced.mat;
% load ann-train.data;
% load ann-test.data
% confus_matrix=zeros(3,3);
% 
% data=ann_test;
%  
% for i=1:size(data,1)   
%     j=1;     
%     while(Tree(j).isfinished ==false)
%         if(data(i,Tree(j).feature)<Tree(j).splitvalue)
%             j=2*j;
%         else
%             j=2*j+1;
%         end;
%     end;    
%     true_class=data(i,22);
%     predicted=Tree(j).label;
%     confus_matrix(true_class,predicted)=confus_matrix(true_class,predicted)+1;
%     
% 
% end;
% confus_matrix
% overall_accuracy= sum(diag(confus_matrix))/size(data,1)
% 
% class_based_accuracies=[confus_matrix(1,1)/Tree(1).classdis(1); confus_matrix(2,2) / Tree(1).classdis(2);confus_matrix(3,3) / Tree(1).classdis(3)] 

%% calculate accuracies for balanced data
clear all
clc
load Tree_final_balanced.mat;
load ann-train.data;
load ann-test.data
confus_matrix=zeros(3,3);
Tree(59).isfinished=true;



data=ann_test;
 
for i=1:size(data,1)   
    j=1;     
    while(Tree(j).isfinished ==false)
        if(data(i,Tree(j).feature)<Tree(j).splitvalue)
            j=2*j;
        else
            j=2*j+1;
        end;
    end;    
    true_class=data(i,22);
    predicted=Tree(j).label;
    confus_matrix(true_class,predicted)=confus_matrix(true_class,predicted)+1;
    

end;
confus_matrix
overall_accuracy= sum(diag(confus_matrix))/size(data,1)

class_based_accuracies=[confus_matrix(1,1)/Tree(1).classdis(1); confus_matrix(2,2) / Tree(1).classdis(2);confus_matrix(3,3) / Tree(1).classdis(3)] 

