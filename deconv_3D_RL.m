function Output=deconv_3D_RL(LF)
%% Robert's code
%% Reference:  Robert Prevede, Young-Gyu Yoon, Maximilian Hoffmann, Nikita Pak.etc. 
%% "Simultaneous whole-animal 3D imaging of neuronal activity using light-field microscopy " 
%% in Nature Methods VOL.11 NO.7|July 2014.
%% Downloaded from https://www.nature.com/articles/nmeth.2964
load('PSF/LF_psf.mat');
Nnum=size(H,3);
maxIter=1;
Xguess=ones(size(LF,1),size(LF,2),size(H,5));
Xguess=Xguess./sum(Xguess(:)).*sum(LF(:));
Htf=backwardProject_LFM(Ht,LF);

for i=1:maxIter,
    tic;
    HXguess = forwardProject_LFM(H,Xguess);
    HXguessBack = backwardProject_LFM(Ht,HXguess);
    errorBack =Htf./HXguessBack;
    Xguess=Xguess.*errorBack;
    Xguess(find(isnan(Xguess))) = 0;
    Xguess(find(isinf(Xguess))) = 0;
    Xguess(Xguess<0) = 0;
    ttime1=toc;
    disp(['iter ',num2str(i),' | ',num2str(maxIter),', 3D RL deconvolution took ',num2str(ttime1),' secs']);
end
Output=Xguess(Nnum*2+1:end-Nnum*2,Nnum*2+1:end-Nnum*2,6:end-5);
