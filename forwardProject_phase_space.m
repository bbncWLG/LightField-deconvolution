function projection = forwardProject_phase_space(H,realspace)
%% Input:
% @H: psf in phase space 
% @realspace: the estimate sample volume  
%% Output:
% Ouput: the projection calculated from the volume and psf
%
% The Code is created based on the method described in the following paper 
%   [1]  ZHI LU, JIAMIN WU, HUI QIAO and YOU ZHOU.etc,
%        Phase-space deconvolution for light field microscopy
%        Optics Express, 2019. 
%   [2] Robert Prevede, Young-Gyu Yoon, Maximilian Hoffmann, Nikita Pak.etc. 
%       "Simultaneous whole-animal 3D imaging of neuronal activity using light-field microscopy "   
%       in Nature Methods VOL.11 NO.7|July 2014.
%
%    Author: ZHI LU (luz18@mails.tsinghua.edu.cn)
%    Date  : 05/21/2019
projection=zeros(size(realspace,1),size(realspace,2));
for z=1:size(realspace,3)
    projection=projection+conv2(realspace(:,:,z),H(:,:,z),'same');
end

end

