clc
clear
%   $Id: main_CTC.m Created at 2017-05-29 12:22:20 $
%   by Weifeng Guo, Northwestern Polytechtical University, China
%   Copyright (c) 2014-2019 by Key Laboratory of Information Fusion Technology of Ministry of Education in Northwestern Polytechnical University,
%   and key Laboratory of Systems Biology in Shanghai Institutes for Biological Science; 
%   If any problem,pleasse contact shaonianweifeng@126.com for help.

%**************Input the information of network****
%   input: z,the structure of network
%          B,the constrained control nodes set
%          C,target control nodes
%  Output1: All_predict_driver:
%          each element denotes the result in each markov sampling;
%           For each cell elemnt, the first colunm is the name of predicted driver nodes; the second colunm is the consensus module
%           The third colunm is the controlled target nodes
%  Output2: Control_capacity_drivers
%           the first colunm is the name of predicted driver nodes; the
%           second colunm is the frequency of driver nodes in Markov
%           sampling
z=[1 2;2 3;1 4;1 5;3 5;4 5]
B=[1;2]
C=[3;4]
[All_predict_driver,Control_capacity_drivers] = constrained_target_control( z,B,C );





