classdef tAnswerIsCorrect < matlab.unittest.TestCase
    %tAnswerIsCorrect   Confirm that the app gives the correct answer.
    
    % Copyright 2018-2022 The MathWorks, Inc.
    properties
        gameObject;
    end
    
    methods(TestClassSetup)
        function setupGameObject(testCase)
            testCase.gameObject = timesTableGame;
            % Ask a question:
            testCase.gameObject.askNewQuestion;
        end
    end
    
    methods(Test)
        function verifyCorrect(testCase)
            % Give the correct answer:
            correctAnswer = testCase.gameObject.CurrentTimesTable * testCase.gameObject.CurrentQuestion;
            testCase.verifyTrue(testCase.gameObject.isAnswerCorrect(correctAnswer));
        end
        
        function verifyIncorrect(testCase)
            % Give the incorrect answer:
            correctAnswer = testCase.gameObject.CurrentTimesTable * testCase.gameObject.CurrentQuestion;
            inCorrectAnswer = correctAnswer + 1;
            testCase.verifyFalse(testCase.gameObject.isAnswerCorrect(inCorrectAnswer));
        end
        
        function verifyEmptyAnswer(testCase)
            testCase.verifyFalse( testCase.gameObject.isAnswerCorrect(0) );
        end
        
        function verifyLargeAnswer(testCase)
            testCase.verifyFalse( testCase.gameObject.isAnswerCorrect(Inf) );
        end

    end
    
end
