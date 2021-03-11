function [leftdata,rightdata, entropy_of_features,min_entropy_of_node,feature,split_of_node] = find_split( data )
%SPLIT_DATA Summary of this function goes here
%   Detailed explanation goes here


    for k=1:21        
        cf1=[ data(:,k) data(:,22)];
        sorted= sortrows(cf1,1); % sorta gerek yok
        % if continuous
        if( k==1 || k==17 || k==18 || k==19 || k==20 || k==21)  
            changes=diff(sorted(:,2))~=0;
            ind_of_chg=find(changes==1);                
            split_data=sorted(ind_of_chg,:);
            splits=split_data(:,1);            
        else  % discrete   
            splits=[0 1];

        end;
            entropy=zeros(1,length(splits));
            for i=1:length(splits)
                leftsplit=[];
                rightsplit=[];
                for j=1: size(sorted,1)
                    if(sorted(j,1)<splits(i))
                       leftsplit=[leftsplit;sorted(j,:)];
                    else
                       rightsplit=[rightsplit;sorted(j,:)];
                    end;            
                end

                lsize=size(leftsplit,1);
                rsize=size(rightsplit,1);
                if(rsize>0 &&  lsize>0)
                    leftprobability= [  sum(leftsplit(:,2)==1)/lsize, sum(leftsplit(:,2)==2)/lsize, sum(leftsplit(:,2)==3)/lsize   ] ;        
                    rightprobability= [ sum(rightsplit(:,2)==1)/rsize ,sum(rightsplit(:,2)==2)/rsize, sum(rightsplit(:,2)==3)/rsize   ];
                    lp_pos=leftprobability(leftprobability>0);
                    rp_pos=rightprobability(rightprobability>0);    
                    lentropy= -(lp_pos*(log2(lp_pos))');
                    rentropy= -(rp_pos*(log2(rp_pos))');       
                    pleft=lsize/(lsize+rsize);
                    pright=rsize/(lsize+rsize);
                    entropy(i)=pleft*lentropy+pright*rentropy;   
                else
                    if(rsize==0)
                        leftprobability= [  sum(leftsplit(:,2)==1)/lsize, sum(leftsplit(:,2)==2)/lsize, sum(leftsplit(:,2)==3)/lsize   ] ;  
                        lp_pos=leftprobability(leftprobability>0);
                        lentropy= -(lp_pos*(log2(lp_pos))');
                        pleft=lsize/(lsize+rsize);
                        entropy(i)=pleft*lentropy;
                    else
                        rightprobability= [ sum(rightsplit(:,2)==1)/rsize ,sum(rightsplit(:,2)==2)/rsize, sum(rightsplit(:,2)==3)/rsize   ];
                        rp_pos=rightprobability(rightprobability>0); 
                        rentropy= -(rp_pos*(log2(rp_pos))');      
                        pright=rsize/(lsize+rsize);            
                        entropy(i)=pright*rentropy;
                    end;
                end;       

            end

            % find splits
            [MinimumEntropy,I]=min(entropy);
            entropy_of_features(k)=MinimumEntropy;
            split_val(k)=splits(I);

      

         [min_entropy_of_node, feature]= min(entropy_of_features);
         split_of_node= split_val(feature);


        leftdata=[];
        rightdata=[];
        for j=1: size(data,1)
            if(data(j,feature)<split_of_node)
               leftdata=[leftdata;data(j,:)];
            else
               rightdata=[rightdata;data(j,:)];
            end;            
        end

 
    
    end
