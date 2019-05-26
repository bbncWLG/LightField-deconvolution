function TOTALprojection = forwardProject_LFM( H, realspace)
%% Robert's code
%% Reference:  Robert Prevede, Young-Gyu Yoon, Maximilian Hoffmann, Nikita Pak.etc. 
%% "Simultaneous whole-animal 3D imaging of neuronal activity using light-field microscopy " 
%% in Nature Methods VOL.11 NO.7|July 2014.
Nnum = size(H,3);
zerospace = zeros(  size(realspace,1),   size(realspace,2));
TOTALprojection = zerospace;

for aa=1:Nnum
    for bb=1:Nnum
        for cc=1:size(realspace,3)          
            Hs = squeeze(H( :,: ,aa,bb,cc));                  
            tempspace = zerospace;
            tempspace( (aa:Nnum:end), (bb:Nnum:end) ) = realspace( (aa:Nnum:end), (bb:Nnum:end), cc);
            projection = conv2(tempspace, Hs, 'same');
            TOTALprojection = TOTALprojection + projection;          
        end
    end
end
