function Backprojection = backwardProject_LFM(Ht, projection)
%% Robert's code
%% Reference:  Robert Prevede, Young-Gyu Yoon, Maximilian Hoffmann, Nikita Pak.etc. 
%% "Simultaneous whole-animal 3D imaging of neuronal activity using light-field microscopy " 
%% in Nature Methods VOL.11 NO.7|July 2014.
x3length = size(Ht,5);
Nnum = size(Ht,3);
Backprojection = zeros(size(projection, 1), size(projection, 2), x3length);
zeroSlice = zeros(  size(projection,1) , size(projection, 2));

for cc=1:x3length,
    tempSliceBack = zeroSlice;
    for aa=1:Nnum,
        for bb=1:Nnum,                  
            Hts = squeeze(Ht( :,: ,aa,bb,cc));
            tempSlice = zeroSlice;
            tempSlice( (aa:Nnum:end) , (bb:Nnum:end) ) = projection( (aa:Nnum:end) , (bb:Nnum:end) );
            tempSliceBack = tempSliceBack + conv2(tempSlice, Hts, 'same');   
        end
    end
    Backprojection(:,:,cc) = Backprojection(:,:,cc) + tempSliceBack;
end

