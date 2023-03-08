classdef tNewTimesTable < matlab.unittest.TestCase
    %tNewTimesTable   MATLAB unit test for changing the times table.
    
    % Copyright 2018-2022 The MathWorks, Inc.
    
    properties
        gameObject;
    end
    
    methods(TestClassSetup)
        function setupGameObject(testCase)
            testCase.gameObject = timesTableGame;
        end
    end
    
    methods(Test)
        function verifyCanChangeTimesTable(testCase)
            currentTable = testCase.gameObject.CurrentTimesTable;
            newTable = 7;
            testCase.assertNotEqual(currentTable, newTable);
            testCase.gameObject.setNewTimesTable(newTable);
            testCase.verifyEqual(testCase.gameObject.CurrentTimesTable, newTable);
        end
    end
    
end
