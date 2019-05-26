%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% phase-space reconstruction from light field image
%%
%% Title                : Phase-space Deconvolution for Light field microscopy
%% Authors              : Zhi Lu, Jiamin Wu, Hui Qiao, You Zhou, Tao Yan, Zijing Zhou, Xu Zhang, Jingtao Fan, Qionghai Dai
%% Authors' Affiliation : Tsinghua University
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
load('Raw/light_field_data.mat');

RL_deconv=0; 
Phase_space_deconv=1;

if RL_deconv==1 && Phase_space_deconv==0
    Output=deconv_3D_RL(LF);
    save('ReconResult_3D_RL_deconv/Recon.mat','Output');
elseif RL_deconv==0 && Phase_space_deconv==1
    Output=deconv_phase_space(LF);
    save('ReconResult_phase_space_deconv/Recon.mat','Output');
end
