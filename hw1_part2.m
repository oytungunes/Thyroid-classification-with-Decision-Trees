clear all;
clc;
close all


%% Classification Tree Resubstitution Error


%%  Load Thyroid  data.
load ann-train.data
load ann-test.data
%%
% % Train a default classification tree using the entire data set.
% 
% data= ann_train;
% Mdl = fitctree(data(:,1:21),data(:,22));
% for i=1:8
%     Mdl = prune(Mdl,'Level',i);
% %     view(Mdl,'mode','graph') % graphic description
%     [label]= predict(Mdl,data(:,1:21)); % predicted
%     [C,order] = confusionmat(data(:,22),label);
%     train_accuracy(i)= sum(diag(C))/size(data,1);
% end;
% figure
% plot(1:8, train_accuracy)
% xlabel('Pruning Level'); ylabel('Training Accuracy');
% title('Accuracy versus Pruning Level')

% Train a default classification tree using the entire data set.

%% find accuracy on train data
data= ann_train;
Mdl = fitctree(data(:,1:21),data(:,22));
view(Mdl,'mode','graph') % graphic description
[label]= predict(Mdl,data(:,1:21)); % predicted
[C_train,~] = confusionmat(data(:,22),label)
C=C_train;
train_accuracy= sum(diag(C))/size(data,1)
class_based_accuracies_train=[ C_train(1,1)/sum(C_train(1,:))  C(2,2)/sum(C(2,:)) C(3,3)/sum(C(3,:))]


%% find accuracy on test data
data= ann_test;
Mdl = fitctree(data(:,1:21),data(:,22));
% view(Mdl,'mode','graph') % graphic description
[label]= predict(Mdl,data(:,1:21)); % predicted
[C_test,~] = confusionmat(data(:,22),label)
C=C_test;
test_accuracy= sum(diag(C))/size(data,1)
class_based_accuracies_test=[ C(1,1)/sum(C(1,:))  C(2,2)/sum(C(2,:)) C(3,3)/sum(C(3,:))]




