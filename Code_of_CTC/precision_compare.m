function [ Precision,Index ] = precision_compare( PSCS_rank_genes,data_onco,data_drivernet,data_freq,Ref_driver_name1)

 Precision=[];
 
    for i=1:50
   i
    k=1;

 
    gene_name_cal=PSCS_rank_genes(1:i,1);


index1(i,1)=ismember(PSCS_rank_genes(i,1),Ref_driver_name1);
index1(i,2)=ismember(data_onco(i,1),Ref_driver_name1);  
index1(i,3)=ismember(data_drivernet(i,1),Ref_driver_name1);  
index1(i,4)=ismember(data_freq(i,1),Ref_driver_name1);  
 

Index{k,1}=index1;

    precision1(i,1)=sum(index1(1:i,1))/i;
    %precision1(i,2)=length(intersect(data_onco(1:i,1),Ref_driver_name1))/i;
    precision1(i,2)=sum(index1(1:i,2))/i;
    precision1(i,3)=sum(index1(1:i,3))/i;
    precision1(i,4)=sum(index1(1:i,4))/i;
    Precision{k,1}=precision1;

  


    end

end

