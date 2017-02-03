% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2 a
% Function to produce a single point of the acf defined in coursework
function x=acf_x(M,L)
    x=zeros(1,L/2);
    for i=0:M-1
        x(i+1)=(M-abs(i))/M;
    end
    x=[x 0 fliplr(x(2:end))];
end