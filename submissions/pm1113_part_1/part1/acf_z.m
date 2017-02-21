% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2 a
% Function to produce a single point of the acf defined in coursework
function z=acf_z(M,L)
    z=zeros(1,M);
    for i=0:M-1
        z(i+1)=(M-abs(i))/M;
    end
    z=[fliplr(z(2:end)) z zeros(1,L-(2*M-1))];
end