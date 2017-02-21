% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2 a
% Function to produce a single point of the acf defined in coursework
function x=acf_x(M,L)
    k=0:1:M-1;
    rxx=(M-k)./M;
    x=[rxx zeros(1,L-(2*M-1)) fliplr(rxx(2:end))];
end