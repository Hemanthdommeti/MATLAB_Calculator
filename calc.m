classdef CalculatorApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        FirstNumberEditField matlab.ui.control.NumericEditField
        SecondNumberEditField matlab.ui.control.NumericEditField
        ResultEditField     matlab.ui.control.NumericEditField
        AddButton          matlab.ui.control.Button
        SubtractButton     matlab.ui.control.Button
        MultiplyButton     matlab.ui.control.Button
        DivideButton       matlab.ui.control.Button
    end

    % Callbacks for button click events
    methods (Access = private)

        function addButtonPushed(app, event)
            num1 = app.FirstNumberEditField.Value;
            num2 = app.SecondNumberEditField.Value;
            app.ResultEditField.Value = num1 + num2;
        end

        function subtractButtonPushed(app, event)
            num1 = app.FirstNumberEditField.Value;
            num2 = app.SecondNumberEditField.Value;
            app.ResultEditField.Value = num1 - num2;
        end

        function multiplyButtonPushed(app, event)
            num1 = app.FirstNumberEditField.Value;
            num2 = app.SecondNumberEditField.Value;
            app.ResultEditField.Value = num1 * num2;
        end

        function divideButtonPushed(app, event)
            num1 = app.FirstNumberEditField.Value;
            num2 = app.SecondNumberEditField.Value;
            if num2 == 0
                uialert(app.UIFigure, 'Division by zero is not allowed!', 'Error');
            else
                app.ResultEditField.Value = num1 / num2;
            end
        end
    end

    % App Initialization
    methods (Access = public)

        function app = CalculatorApp
            createComponents(app);
        end

        function delete(app)
            delete(app.UIFigure);
        end
    end

    % GUI Component Creation
    methods (Access = private)

        function createComponents(app)
            app.UIFigure = uifigure('Position', [100, 100, 400, 300], 'Name', 'Basic Calculator');

            % First Number Input
            uilabel(app.UIFigure, 'Position', [50, 250, 100, 22], 'Text', 'First Number:');
            app.FirstNumberEditField = uieditfield(app.UIFigure, 'numeric', 'Position', [150, 250, 100, 22]);

            % Second Number Input
            uilabel(app.UIFigure, 'Position', [50, 200, 100, 22], 'Text', 'Second Number:');
            app.SecondNumberEditField = uieditfield(app.UIFigure, 'numeric', 'Position', [150, 200, 100, 22]);

            % Result Output
            uilabel(app.UIFigure, 'Position', [50, 150, 100, 22], 'Text', 'Result:');
            app.ResultEditField = uieditfield(app.UIFigure, 'numeric', 'Position', [150, 150, 100, 22], 'Editable', 'off');

            % Buttons
            app.AddButton = uibutton(app.UIFigure, 'push', 'Text', '+', ...
                'Position', [50, 100, 50, 30], 'ButtonPushedFcn', @(btn, event) addButtonPushed(app));

            app.SubtractButton = uibutton(app.UIFigure, 'push', 'Text', '-', ...
                'Position', [120, 100, 50, 30], 'ButtonPushedFcn', @(btn, event) subtractButtonPushed(app));

            app.MultiplyButton = uibutton(app.UIFigure, 'push', 'Text', '*', ...
                'Position', [190, 100, 50, 30], 'ButtonPushedFcn', @(btn, event) multiplyButtonPushed(app));

            app.DivideButton = uibutton(app.UIFigure, 'push', 'Text', '/', ...
                'Position', [260, 100, 50, 30], 'ButtonPushedFcn', @(btn, event) divideButtonPushed(app));
        end
    end
end
