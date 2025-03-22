function scientific_calculator()
    hFig = figure('Name', 'Scientific Calculator', ...
                  'NumberTitle', 'off', ...
                  'MenuBar', 'none', ...
                  'Position', [500, 300, 370, 600], ...
                  'Color', [0.9, 0.9, 0.9]);

    hDisplay = uicontrol('Style', 'edit', ...
                         'FontSize', 16, ...
                         'FontWeight', 'bold', ...
                         'BackgroundColor', [1, 1, 1], ...
                         'ForegroundColor', [0, 0, 0], ...
                         'HorizontalAlignment', 'right', ...
                         'Position', [20, 530, 330, 50]);

    % Buttons
    buttons = {'(', ')', 'C', '←', ...
               '7', '8', '9', '/', ...
               '4', '5', '6', '*', ...
               '1', '2', '3', '-', ...
               '0', '.', '=', '+', ...
               'sin', 'cos', 'tan', 'log', ...
               'asin', 'acos', 'atan', 'sqrt', ...
               'x^2', 'x^3', 'x^y', '10^x', ...
               'exp', 'ln', 'pi', 'e', ...
               'deg', 'rad', 'n!', 'nthRoot'};

    % Button positions
    positions = reshape([20, 480, 70, 40; 100, 480, 70, 40; 180, 480, 70, 40; 260, 480, 70, 40; ...
                         20, 430, 70, 40; 100, 430, 70, 40; 180, 430, 70, 40; 260, 430, 70, 40; ...
                         20, 380, 70, 40; 100, 380, 70, 40; 180, 380, 70, 40; 260, 380, 70, 40; ...
                         20, 330, 70, 40; 100, 330, 70, 40; 180, 330, 70, 40; 260, 330, 70, 40; ...
                         20, 280, 70, 40; 100, 280, 70, 40; 180, 280, 70, 40; 260, 280, 70, 40; ...
                         20, 230, 70, 40; 100, 230, 70, 40; 180, 230, 70, 40; 260, 230, 70, 40; ...
                         20, 180, 70, 40; 100, 180, 70, 40; 180, 180, 70, 40; 260, 180, 70, 40; ...
                         20, 130, 70, 40; 100, 130, 70, 40; 180, 130, 70, 40; 260, 130, 70, 40; ...
                         20, 80, 70, 40; 100, 80, 70, 40; 180, 80, 70, 40; 260, 80, 70, 40; ...
                         20, 30, 70, 40; 100, 30, 70, 40; 180, 30, 70, 40; 260, 30, 70, 40], [], 4);


    integer_color = [1.0, 1.0, 0.6];
    operation_color = [0.6, 0.6, 1.0];
    function_color = [0.6, 1.0, 0.6];


    integers = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    operations = {'+', '-', '*', '/', '=', 'C', '←', '(', ')', '.'};
    function_buttons = {'sin', 'cos', 'tan', 'log', 'ln', 'exp', 'sqrt', ...
                        'asin', 'acos', 'atan', 'x^2', 'x^3', 'x^y', ...
                        '10^x', 'n!', 'nthRoot', 'deg', 'rad'};

    for i = 1:length(buttons)
        if ismember(buttons{i}, integers)
            color = integer_color;
        elseif ismember(buttons{i}, operations)
            color = operation_color;
        else
            color = function_color;
        end

        uicontrol('Style', 'pushbutton', ...
                  'String', buttons{i}, ...
                  'FontSize', 12, ...
                  'FontWeight', 'bold', ...
                  'BackgroundColor', color, ...
                  'ForegroundColor', [0, 0, 0], ...
                  'Position', positions(i, :), ...
                  'Callback', @(src, event) button_callback(hDisplay, buttons{i}));
    end
end
function button_callback(hDisplay, button)
    current_text = get(hDisplay, 'String');
    try

        number = str2double(current_text);

        switch button
            case '='

                result = eval(current_text);
                set(hDisplay, 'String', num2str(result));
            case 'C'

                set(hDisplay, 'String', '');
            case '←'

                if ~isempty(current_text)
                    set(hDisplay, 'String', current_text(1:end-1));
                end
            case {'(', ')'}

                set(hDisplay, 'String', [current_text, button]);
            case {'sin', 'cos', 'tan', 'asin', 'acos', 'atan', 'exp', 'sqrt'}

                set(hDisplay, 'String', [current_text, button, '(']);
            case 'log'
                % Log base 10
                if ~isnan(number)
                    if number > 0
                        result = log10(number);

                        if number == 10
                            set(hDisplay, 'String', '1');
                        else
                            set(hDisplay, 'String', num2str(result));
                        end
                    else
                        set(hDisplay, 'String', 'Error');
                    end
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'ln'
                % Natural logarithm (log base e)
                if ~isnan(number)
                    if number > 0
                        result = log(number);

                        if abs(number - exp(1)) < 1e-10
                            set(hDisplay, 'String', '1');
                        else
                            set(hDisplay, 'String', num2str(result));
                        end
                    else
                        set(hDisplay, 'String', 'Error');
                    end
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'sqrt'

                if ~isnan(number) && number >= 0
                    set(hDisplay, 'String', num2str(sqrt(number)));
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'x^2'

                if ~isnan(number)
                    result = number^2;
                    set(hDisplay, 'String', num2str(result));
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'x^3'

                if ~isnan(number)
                    result = number^3;
                    set(hDisplay, 'String', num2str(result));
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'n!'

                if ~isnan(number) && number >= 0 && mod(number, 1) == 0
                    result = factorial(number);
                    set(hDisplay, 'String', num2str(result));
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'x^y'

                if ~isnan(number)
                    n = inputdlg('Enter the value of y:', 'Exponentiation', 1);
                    if ~isempty(n)
                        exponent = str2double(n{1});
                        if ~isnan(exponent)
                            result = number^exponent;
                            set(hDisplay, 'String', num2str(result));
                        else
                            set(hDisplay, 'String', 'Error');
                        end
                    end
                else
                    set(hDisplay, 'String', 'Error');
                end
            case '10^x'

                if ~isnan(number)
                    result = 10^number;
                    set(hDisplay, 'String', num2str(result));
                else
                    set(hDisplay, 'String', 'Error');
                end
             case 'pi'

                if isempty(current_text)
                    set(hDisplay, 'String', 'pi');
                else
                    set(hDisplay, 'String', [current_text, 'pi']);
                    end
            case 'e'

                set(hDisplay, 'String', '2.71828182846');
            case 'nthRoot'

                if ~isnan(number)
                    n = inputdlg('Enter the value of n:', 'Nth Root', 1);
                    if ~isempty(n)
                        root = str2double(n{1});
                        if ~isnan(root) && root ~= 0
                            result = number^(1/root);
                            set(hDisplay, 'String', num2str(result));
                        else
                            set(hDisplay, 'String', 'Error');
                        end
                    end
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'deg'

                if ~isnan(number)
                    set(hDisplay, 'String', num2str(rad2deg(number)));
                else
                    set(hDisplay, 'String', 'Error');
                end
            case 'rad'

                if ~isnan(number)
                    set(hDisplay, 'String', num2str(deg2rad(number)));
                else
                    set(hDisplay, 'String', 'Error');
                end
            otherwise

                set(hDisplay, 'String', [current_text, button]);
        end
    catch
        set(hDisplay, 'String', 'Error');
    end
end
