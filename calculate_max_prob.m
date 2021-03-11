function [ max_prob ] = calculate_max_prob( class_dis )

    p1=class_dis(1)/sum(class_dis);
    p2=class_dis(2)/sum(class_dis);
    p3=class_dis(3)/sum(class_dis);
    
    max_prob=max(p1,p2,p3);


end

