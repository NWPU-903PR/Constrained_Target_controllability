# Constrained_target_controllability
The CTC,is to estimate the ability of a given network to control the targets by choosing driver nodes from the set of the constrained control nodes. 
Instruction of CTC package
This package includes Matlab scripts and several datasets for demo of CTC approaches:
(a)	main_CTC.m is a Matlab function for the routine of experimental analysis.

(b)	 constrained_target_control.m is the main script to call by supplying following parameters:
    
(c)  The input datasets include:
(1) z: structure of network 
(2) B: constrained control nodes.
(3) C: target control nodes

(d)  The output datasets include:
The  driver profiles by using CTC；
For CTC, the first colunm is the name of predicted driver nodes；the second colunm is the consensus module; The third colunm is the number of controlled target nodes; 

(e) As a demo, users can directly run main_CTC.m in Matlab. We choose a simple network as a test case in our demo. This package has been tested in different computer environments as: Window 7 or above; Matlab 2014 or above.

(f) When users analyzed yourself new data, please:
   (1) Prepare input datasets as introduced in (c).
   (2) Clear the previous results.
   (3) Set parameters in constrained_target_control.m.
   (4) Run main_CTC.m.
   (5) Suggest that the users add all fille in our folders to your folder.

%   $Id: main_Benchmark_control.m Created at 2017-05-29 12:22:20 $
%   by Weifeng Guo, Northwestern Polytechtical University, China
%   Copyright (c) 2014-2019 by Key Laboratory of Information Fusion Technology of Ministry of Education in Northwestern Polytechnical University,
%   and key Laboratory of Systems Biology in Shanghai Institutes for Biological Science; 
%   If any problem,pleasse contact shaonianweifeng@126.com for help.
