clc
clear all

n_protein = 290;
spoints = [1, 0; 1, -1; 0, -1; -1, -1; -1, 0; -1, 1; 0, 1; 1, 1];

fileFolder=fullfile('D:\Research_2026\PSS\code\ind');
dirOutput=dir(fullfile(fileFolder,'*.txt'));
PSSM_XXXX={dirOutput.name}';
PSSM_XXXX = natsortfiles(PSSM_XXXX);
fileNames_PSSM = [];
for i=1:n_protein
	path_way = [fileFolder '\' cell2mat(PSSM_XXXX(i))];
	lujing=cellstr(path_way);
	fileNames_PSSM = [fileNames_PSSM;lujing];
end


%%%%%%%%%%% Features extraction from PSSM %%%%%%%%%%%%%%%% 

for i=1:n_protein
	files_name = cell2mat(fileNames_PSSM(i));
    i
	PSSM_Matrix = Read_Text_files_PSSM(files_name);
    
       
    %%%%%%%%%%% LPQ-PSSM %%%%%%%%%%%%%%%%
   PSSM_IMG = uint8(255 * mat2gray(PSSM_Matrix));
     %imshow(PSSM_IMG);
    lpqfeat=lpq(PSSM_IMG,3);
    PSS_LPQ_PSSM_Ind(i,:)=lpqfeat;
     end
 
%%%%%%%%%%%%%%%%%%%%%%%% SAVE FILES %%%%%%%%%%%%%%%%%%%%%%%%%


 save PSS_LPQ_PSSM_Ind PSS_LPQ_PSSM_Ind;


%%%% To Create CSV sheet for the data %%%%%%%%%
   
   
       csvwrite('PSS_LPQ_PSSM_Ind.csv',PSS_LPQ_PSSM_Ind);
       