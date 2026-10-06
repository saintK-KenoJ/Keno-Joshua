function functions_assignment()
    
    clc; clear;
    
    
    tol = 1e-6;
    max_iter = 100;
    
    %% 1. NEWTON-RAPHSON METHOD
    fprintf('--- Newton-Raphson Method ---\n');
    x0 = 2.0; 
    
    root_nr_for = newton_raphson_for(x0, tol, max_iter);
    fprintf('Root (For-Loop):   %f\n', root_nr_for);
    
    root_nr_while = newton_raphson_while(x0, tol, max_iter);
    fprintf('Root (While-Loop): %f\n\n', root_nr_while);
    
    %% 2. SECANT METHOD
    fprintf('--- Secant Method ---\n');
    x_minus1 = 2.0; 
    x0_sec = 2.5;   
    
    root_sec_for = secant_for(x_minus1, x0_sec, tol, max_iter);
    fprintf('Root (For-Loop):   %f\n', root_sec_for);
    
    root_sec_while = secant_while(x_minus1, x0_sec, tol, max_iter);
    fprintf('Root (While-Loop): %f\n\n', root_sec_while);
    
    %% 3. RUNGE-KUTTA (RK4) METHOD
    fprintf('--- Runge-Kutta 4th Order ---\n');
    t0 = 0; tf = 2; y0 = 1; h = 0.1;
    
    [~, y_f] = runge_kutta_for(t0, tf, y0, h);
    fprintf('y(%g) (For-Loop):   %f\n', tf, y_f(end));
    
    [~, y_w] = runge_kutta_while(t0, tf, y0, h);
    fprintf('y(%g) (While-Loop): %f\n', tf, y_w(end));
end

%% LOCAL FUNCTIONS

% --- Newton-Raphson: For-Loop ---
function root = newton_raphson_for(x0, tol, max_iter)
    f = @(x) x^2 - 5;    
    df = @(x) 2*x;       
    x = x0;
    for i = 1:max_iter
        x_new = x - f(x)/df(x);
        if abs(x_new - x) < tol
            x = x_new;
            break;
        end
        x = x_new;
    end
    root = x;
end

% --- Newton-Raphson: While-Loop ---
function root = newton_raphson_while(x0, tol, max_iter)
    f = @(x) x^2 - 5;
    df = @(x) 2*x;
    x = x0;
    err = inf;
    iter = 0;
    while err > tol && iter < max_iter
        x_new = x - f(x)/df(x);
        err = abs(x_new - x);
        x = x_new;
        iter = iter + 1;
    end
    root = x;
end

% --- Secant Method: For-Loop ---
function root = secant_for(x0, x1, tol, max_iter)
    f = @(x) x^2 - 5;
    for i = 1:max_iter
        if abs(f(x1) - f(x0)) < 1e-12, break; end
        x_new = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        if abs(x_new - x1) < tol
            x1 = x_new;
            break;
        end
        x0 = x1;
        x1 = x_new;
    end
    root = x1;
end

% --- Secant Method: While-Loop ---
function root = secant_while(x0, x1, tol, max_iter)
    f = @(x) x^2 - 5;
    err = inf;
    iter = 0;
    while err > tol && iter < max_iter
        if abs(f(x1) - f(x0)) < 1e-12, break; end
        x_new = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        err = abs(x_new - x1);
        x0 = x1;
        x1 = x_new;
        iter = iter + 1;
    end
    root = x1;
end

% --- Runge-Kutta 4th Order: For-Loop ---
function [t, y] = runge_kutta_for(t0, tf, y0, h)
    f = @(t, y) t - y; 
    t = t0:h:tf;
    N = length(t);
    y = zeros(1, N);
    y(1) = y0;
    for i = 1:(N-1)
        k1 = h * f(t(i), y(i));
        k2 = h * f(t(i) + h/2, y(i) + k1/2);
        k3 = h * f(t(i) + h/2, y(i) + k2/2);
        k4 = h * f(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    end
end

% --- Runge-Kutta 4th Order: While-Loop ---
function [t, y] = runge_kutta_while(t0, tf, y0, h)
    f = @(t, y) t - y;
    t = t0;
    y = y0;
    i = 1;
    while t(i) < tf
        if t(i) + h > tf
            h = tf - t(i);
        end
        k1 = h * f(t(i), y(i));
        k2 = h * f(t(i) + h/2, y(i) + k1/2);
        k3 = h * f(t(i) + h/2, y(i) + k2/2);
        k4 = h * f(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
        t(i+1) = t(i) + h;
        i = i + 1;
    end
end