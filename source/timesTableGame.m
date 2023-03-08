classdef timesTableGame < handle
    %TIMESTABLEGAME A simple educational app that asks times tables.
    
    % Copyright 2018-2022 The MathWorks, Inc.
    
    properties
        CurrentTimesTable = 3;
        CurrentQuestion;
        NumberCorrectAnswers = 0;
    end
    
    methods
        
        function obj = timesTableGame()
        end
        
        function b = isAnswerCorrect(obj, guess)
            % Check that "guess" is valid -- expect a number
            if isempty(guess)
                b = false;
                return
            end
            
            expectedAnswer = obj.CurrentTimesTable * obj.CurrentQuestion;
            b = (expectedAnswer == guess);
        end
        
        function setNewTimesTable(obj, newTimesTable)
            % update obj data, reset current answer and questions
            obj.CurrentTimesTable = newTimesTable;
            obj.askNewQuestion;
        end
        
        function askNewQuestion(obj)
            obj.setNewQuestion;
        end
        
        function incrementScore(obj)
            obj.NumberCorrectAnswers = obj.NumberCorrectAnswers + 1;
        end
        
        function setNewQuestion(obj)
            % Pick a random number between 1 and 12:
            obj.CurrentQuestion = floor(12*rand(1)) + 1;
        end
        
    end
end
