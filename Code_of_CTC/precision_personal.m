function [ Personal_precision ] = precision_personal( new_result_driver_gene_module,Ref_driver_name1 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 tic
for i=1:length(new_result_driver_gene_module)
    
  
    [row,colunm]=size(new_result_driver_gene_module{i,1});
    k=0;
 if row~=0
   for j=1:row
       
    [a,b]=ismember(new_result_driver_gene_module{i,1}{j,1},Ref_driver_name1);
    if b~=0
      
        k=k+1;
        
    end
    
   end
   Personal_precision(i,1)=k/row;
   
   
 end

end
toc




end

