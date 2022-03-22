s = [1 2 2 2 2 2 3 3 4 6 6 8 8 9 9 9 10 10 10 10 13 13 13 16 18 18 19 20 6 7 21 19 19 17 17 31 30 30 29 29 28 27 23 23 24 24 26 23 26 26 26 38 39 37 36 36 33 28 30 33 30 26 24 25 3];
t = [2 3 4 5 6 7 6 7 10 7 8 9 11 10 11 12 12 13 14 15 15 16 18 17 19 21 20 21 21 21 22 23 32 32 31 32 31 32 30 34 34 28 24 25 25 27 27 28 38 39 37 39 40 40 37 40 36 33 33 35 35 41 41 41 42];
weights = [78 400 136 72 309 309 167 167 106 27 235 104 96 155 95 258 228 191 376 508 167 204 338 162 50 413 100 421 153 149 218 80 212 155 219 128 137 128 147 86 83 214 166 121 60 124 188 131 335 443 216 311 121 176 202 140 234 495 289 235 151 334 389 454 103];
CUMap = graph(s,t, weights);
plot(CUMap, 'EdgeLabel',CUMap.Edges.Weight);
img = imread('labeledMap','jpeg');
option = 0;
start = 0;
final = 0;
imshow(img);
while option~=4
    option = 0;
    start = 0;
    final = 0;
    fprintf('----------------------------------------------------------\n');
    fprintf('Please type in any location in CUHK according to the code provided on the map.\n')
    fprintf('Options: \n1--Shortest path to leave CU \n2--Shortest path between two places in CU\n3--Show me the map\n4--Exit the program\n');
    option = input('Tell us what you want to do: ');
    if option ~= 1 && option ~= 2 && option ~= 3 && option ~= 4
        fprintf('***************************************\n');
        fprintf('Please input the correct option number.\n');
        fprintf('***************************************\n');
    end
    switch option
        case 1
            while start == 0
                start = input('Where are you right now? ');
                if start < 1 || start > 42
                    start = 0;
                    fprintf('Please input a valid code. (1-42)\n');
                end
            end
            [path1,d1] = shortestpath(CUMap, start, 41);
            [path2,d2] = shortestpath(CUMap, start, 42);
            if d1<=d2
                place1 = translate(path1);
                for i=1:length(path1)-1
                    fprintf('%1s(%1.0f) --> ',place1(i), path1(i));
                    if mod(i,3)==0
                        fprintf('\n');
                    end
                end
                fprintf('%1s(%1.0f)\n',place1(end),path1(end));
                fprintf('The estimated walking distance is %1.0fm\n', d1);
            else
                place2 = translate(path2);
                for i=1:length(path2)-1
                    fprintf('%1s(%1.0f) --> ',place2(i), path2(i));
                    if mod(i,3)==0
                        fprintf('\n');
                    end
                end
                fprintf('%1s(%1.0f)\n',place2(end),path2(end));
                fprintf('The estimated walking distance is %1.0fm\n', d2);
            end
        case 2
            while start == 0
                start = input('Where are you right now? ');
                if start < 1 || start > 42
                    start = 0;
                    fprintf('Please input a valid code. (1-42)\n');
                end
            end
            while final == 0
                final = input('Where are you right now? ');
                if final < 1 || final > 42
                    final = 0;
                    fprintf('Please input a valid code. (1-42)\n');
                end
            end
            [P,d] = shortestpath(CUMap, start, final);
            place = translate(P);
            for i=1:length(P)-1
                fprintf('%1s(%1.0f) --> ',place(i), P(i));
                if mod(i,3)==0
                    fprintf('\n');
                end
            end
            fprintf('%1s(%1.0f)\n',place(end),P(i+1));
            fprintf('The estimated walking distance is %1.0fm\n', d);
        case 3
            imshow(img);
    end
end