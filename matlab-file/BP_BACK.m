% parameter explain
% training_example-->the data to be trained
% eta-->learning rate
function BP_BACK(training_example,eta)
[m,n] = size(training_example);
w = rand(2,3) - 0.5;
v = rand(3,2) - 0.5;
u = rand(2,3) - 0.5;
for num = 1:n
    one_sample = training_example(:,num);
    x = one_sample(1:3);
    y = one_sample(4:5);
    net2 = w * x;
    for i = 1:2
        hidden1(i) = 1/(1+exp(-net2(i)));
    end
    net3 = v * hidden1';
    for i = 1:3
        hidden2(i) = 1/(1+exp(-net3(i)));
    end
    net4 = u * hidden2';
    for i = 1:2
        o(i) = 1/(1 + exp(-net4(i)));
    end
    for i = 1:2
        delta3(i) = (y(i) - o(i)) * o(i) * (1-o(i));
    end
    for j = 1:3
        delta2(j) = hidden2(j) * (1-hidden2(j)) * delta3*u(:,j);
    end
    for k = 1:2
        delta1(k) = hidden1(k) * (1-hidden1(k)) * delta2 * v(:,k);
    end
    for i = 1:2
        for j = 1:3
            u(i,j) = u(i,j) + eta * delta3(i) * hidden2(j);
        end
    end
    for i = 1:3
        for j = 1:2
            v(i,j) = v(i,j) + eta*delta2(i) * hidden1(j);
        end
    end
    for i = 1:2
        for j = 1:3
            w(i,j) = w(i,j) + eta * delta1(i) * x(j);
        end
    end
    e = o' - y;
    sigma(num) = e' * e;
end
plot(sigma);
    














