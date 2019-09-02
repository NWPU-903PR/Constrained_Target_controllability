function [driver_node_module] = constrained_target_control( z,B,C )
%function��predict the driver nodes using constraied target controllability
%   input: z,the structure of network
%          B,the constrained control nodes set
%          C,target control nodes
%  Output: Driver_nodes_module,the first colunm is the name of predicted driver nodes; the second colunm is the consensus module
%           The third colunm is the number of controlled target nodes
%****************************set parameters of CTC****************************************************************
%Users can assigned the value of parameters,num_max and c
num_max=1000;%the number of samplings 
c=0;%random Markov samplings
no_change_num_max=num_max;
%*****************************main part***************************************

NM=1;
ind_max=1;
num_iter=1;
no_change_num=1;

%random markov chain sampling,In the linking and dynamic graph, sampling
%the maximum matchings
[ TK0,predict_driver0,omiga0,driver_module0,interesting_ind0] = Markov_chain_driver( z,B,C,NM );
predict_driver_gene_module=[];

B_fda=B;
if length(TK0)~=0
    
All_TK{1,1}=TK0;
All_predict_driver{1,1}=predict_driver0;
All_omiga(1,1)=omiga0;
All_driver_module{1,1}=driver_module0;
ind_max=1;num_iter=2;

while ind_max
    

  
  % Generate new Markov chain
  % Assume that the length of TK0 as the initial Markov chain is k��
  % Randomly choose a locate��replace the matched edges untill we generate the new markov chains
  % Note��The right matched nodes is chosed from the targeted nodes in right 
  [ TK1,predict_driver1,omiga1,driver_module1 ] = New_Markov_chain_driver( z,B_fda,C,NM,TK0,interesting_ind0);
  
  %random accept the new state:c=0

  p=min(1,exp(-c*(omiga1-omiga0)));
  r=rand;
  if r<=p
 
       TK0=TK1; 
       predict_driver0=predict_driver1;
       omiga0=omiga1;
       driver_module0=driver_module1;
       
  end
  
  if r>p

       TK0=TK0; 
       predict_driver0=predict_driver0;
       omiga0=omiga0;
       driver_module0=driver_module0;

  end

   if num_iter>num_max
      ind_max=0;
   end
  
     All_TK{num_iter,1}=TK0;
     All_predict_driver{num_iter,1}=predict_driver0;
     All_omiga(num_iter,1)=omiga0;
     All_driver_module{num_iter,1}=driver_module0;
  
    num_iter=num_iter+1
    
    
end
%%
%Obtain the information of Markov chain sampling��including the number of
%driver nodes��Impactand the corresponding consensus module
%Firstly obtain all the possible driver genes
[row_All_driver_module,~]=size(All_driver_module);
poss_driver=[];
for i=1:row_All_driver_module
    
    intermid=cell2mat(All_driver_module{i,1}(:,1));
    poss_driver=[poss_driver;intermid];
    
end

possible_driver=unique(poss_driver);%Firstly obtain all the possible driver genes
%Then identify all the possible consensus module of the driver genes and
%its impact scores

for i=1:length(possible_driver)
     i
     candidate_driver=possible_driver(i,1);
     candidate_module=[];
    for j=1:row_All_driver_module
        
        mid=cell2mat(All_driver_module{j,1}(:,1));
        %Within each element, we can form a new matrix, which can identify the frequency of the side
        %the second colunm
        [~,ind]=ismember(candidate_driver,mid);%ind is the location of candidate_driver
        %then extract the element of
       
        if ind~=0
            
            inter_module=cell2mat(All_driver_module{j,1}(ind,2));
            candidate_module=[candidate_module;inter_module];
            
        end
    end
        
        all_edge=unique(candidate_module,'rows');
        % statistics frequency of candidate_edges, and adn the consensus gene modules
        [row_all_edge,~]=size(all_edge);
        [row_candidate_module,~]=size(candidate_module);
        gene_module=[];
        for k=1:row_all_edge
            x1=all_edge(k,1);
            x2=all_edge(k,2);
            fre=0;
            for kk=1:row_candidate_module
                
              if  (candidate_module(kk,1)==x1)*(candidate_module(kk,2)==x2)==1
                 
                  fre=fre+1;
                  
              end
                
            end
            
            node_module(k,1)=x1;node_module(k,2)=x2;node_module(k,3)=fre/row_All_driver_module;
        end
        
 driver_node_module{i,1}=candidate_driver;
 driver_node_module{i,2}=node_module;
 driver_node_module{i,3}=length(unique(intersect(node_module(:,2),C)));
        
        
end
    

end


end
