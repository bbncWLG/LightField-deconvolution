%PTYCHOGRAPHICORDER - Generates an inward spiraling index into an array.
%
%
%   Syntax:
%   -------
%   [ROWINDEXES, COLINDEXES] = PTYCHOGRAPHICORDER(ARRAYSIZE) takes in a two
%   element vector, ARRAYSIZE, and generates a list of row and colum
%   indexes for iterating through every element of a matrix of ARRAYSIZE from 
%   the top left corner (1, 1) to the center of the matrix in an inward 
%   spiraling fashion.
%
%
%   Inputs:
%   -------
%      ARRAYSIZE - a two element numeric vector
%                  * type: must contain non-negative integers
%
%
%   Outputs:
%   --------
%      ROWINDEXES - The indexes for indexing into the rows of a matrix of 
%                   ARRAYSIZE in a spiraling order. See Example 1.
%                   * size: [1, prod(ARRAYSIZE)]
%      
%      COLINDEXES - The indexes for indexing into the columns of a matrix of 
%                   ARRAYSIZE in a spiraling order. See Example 1.
%                   * size: [1, prod(ARRAYSIZE)];
%      
%
%   Notes:
%   ------
%   - This function is useful for iterating through phase space in image
%     deconvolution operations.
%
%
%   Example 1:
%   --------
%      >> arrSize = [3, 3];
%      >> [ri, ci] = ptychographicOrder(arrSize)
%      
%      ri = 
%
%            1     1     1     2     3     3     3     2     2
%      
%      
%      ci =
%      
%            1     2     3     3     3     2     1     1     2
%     
%      >> x = zeros(arrSize);
%      >> for i = 1:numel(x), x(ri(i), ci(i)) = i; end
%      >> x
%
%      x = 
%
%           1     2     3
%           8     9     4
%           7     6     5

% Corban Swain, 2019


function [rowIndexes, colIndexes] = ptychographicOrder(arraySize)

nRows = arraySize(1);
nCols = arraySize(2);

if nRows > 1 && nCols > 1
   oneLessForCols = ones(1, nCols - 1);
   oneLessForRows = ones(1, nRows - 1);
   
   rowIndexes = [...
      oneLessForCols, ...
      1:1:(nRows - 1), ...
      oneLessForCols * nRows, ...
      nRows:-1:2];
   colIndexes = [...
      1:1:(nCols - 1), ...
      oneLessForRows * nCols, ...
      nCols:-1:2, ...
      oneLessForRows];
   
   [remainingRowIndexes, remainingColIndexes] = ...
      ptychographicOrder(arraySize - 2);
   rowIndexes = [rowIndexes, remainingRowIndexes + 1];
   colIndexes = [colIndexes, remainingColIndexes + 1];  
   
elseif nRows == 0 || nCols == 0
   rowIndexes = [];
   colIndexes = [];
   
else
   if nRows == 1
      rowIndexes = ones(1, nCols);
   else
      rowIndexes = 1:nRows;
   end
   
   if nCols == 1
      colIndexes = ones(1, nRows);
   else
      colIndexes = 1:nCols;
   end
end