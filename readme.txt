Title:      Matlab code for "Phase-space deconvolution for light field microscopy"  
Author:     Zhi Lu (luz18@mails.tsinghua.edu.cn),  Jiamin Wu, Hui Qiao and You Zhou .etc  
Version:    1.0 
Copyright:  2019, Zhi Lu,  Jiamin Wu, Hui Qiao, You Zhou, Tao Yan, Zijing Zhou, Xu Zhang, Jingtao Fan, Qionghai Dai*

Edited based on the reference [1].


Matlab code for "Phase-space deconvolution for light field microscopy"
==========================================================

This package contains an implementation of the Phase-space deconvolution algorithm described in the paper: 
Zhi Lu,  Jiamin Wu, Hui Qiao and You Zhou .etc, "Phase-space deconvolution for light field microscopy", OE 2019.

Please cite our paper if using the code to generate data (e.g., images, tables of processing times, etc.) 
in an academic publication.

For algorithmic details, please refer to our paper.

----------------
How to use
----------------
The code is tested in MATLAB 2018b(64bit) under the MS Windows 10 64bit version with an Intel Xeon CPU@2.53GHz and 32GB RAM.

1. unpack the package
2. include code/subdirectory in your Matlab path
3. Run "main.m" to try the examples included in this package.
4. The Lightfield Data referred to Fig.3 (the imaging of B16cell ) in our paper is saved in "Raw" which can be used for test. 
5. MAT file of the point spread function  is located in dir "PSF" which is captured by our LFM system. Readers can also obtain the similar PSFs by the origin code of reference[1];
----------------
User specified parameter:
----------------
There are a few parameters need to be specified by users.
---------------
Main.m file:
---------------
'RL_deconv': the old deconvolution method in LF microscopy (typically set as 1 and 0)
'Phase_space_deconv': the new phase_space deconvolution method in our paper (typically set as 1 and 0)
---------------
deconv_phase_space.m file:
---------------
Nnum: the pixel number after every single micro lens
maxIter: the maximum iteration times during deconbolution

----------------
IMPORTANT NOTE 
----------------
Note that the algorithm sometimes may converge to an incorrect result. 
When you obtain such an incorrect result, please re-try to increase the 'maxIter' parameter 
Should you have any questions regarding this code and the corresponding results, please contact Zhi Lu (luz18@mails.tsinghua.edu.cn).

Reference:
1.  R. Prevedel, Y.-G. Yoon, M. Hoffmann, N. Pak, G. Wetzstein, S. Kato, T. Schr?del, R. Raskar, M. Zimmer, E. S. Boyden, and A. Vaziri, 
     "Simultaneous whole-animal 3D imaging of neuronal activity using light-field microscopy," Nature Methods 11, 727¨C730 (2014).