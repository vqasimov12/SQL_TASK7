
--TASK 1

--GO
--USE master
--GO

--CREATE PROCEDURE CalculateFactorial
--@Number INT ,@Result INT OUTPUT
--AS
--BEGIN
--	IF @Number<0
--		BEGIN 
--			SET @Result=0
--			PRINT 'NEGATIVE NUMBERS FACTORIAL CAN NOT BE CALCULATED'
--		END
--	ELSE
--	  IF @Number=0
--		BEGIN
--			SET @Result=1
--		END

--	ELSE
--		BEGIN
--			SET @Result=1
--			WHILE @Number>0
--				BEGIN
--					SET @Result*=@Number
--					SET @Number-=1
--				END
--		END
--END

--GO
--DECLARE @FactorialResult INT;

--SET @FactorialResult = 1;

--EXEC CalculateFactorial @Number = 6, @Result = @FactorialResult OUTPUT;

--SELECT @FactorialResult AS Factorial;



--TASK 2


--GO
--USE Library
--GO

--CREATE VIEW Lazy
--AS
--SELECT 
--    S.Id AS StudentId,
--    S.FirstName AS [Name], 
--    S.LastName AS [Surname], 
--    SC.Id AS CardId
--FROM Students AS S 
--FULL OUTER JOIN S_Cards AS SC ON S.Id = SC.Id_Student
--WHERE S.Id IS NULL OR SC.Id_Student IS NULL


--GO
--CREATE PROCEDURE LazyStudents
--@LazyStudentsCount INT OUTPUT  
--AS
--BEGIN
-- SELECT *
-- FROM Lazy
-- SELECT  @LazyStudentsCount = COUNT(*)
-- FROM Lazy

--END


--DECLARE @CountOfLazyStudents INT
--EXEC LazyStudents @LazyStudentsCount = @CountOfLazyStudents OUTPUT
--SELECT @CountOfLazyStudents AS [Count Of Lazy Students]





--TASK 3

--GO 
--USE Library
--GO

--CREATE FUNCTION [Min Pages of Press] ()
--RETURNS TABLE
--AS
--RETURN 
--(
--SELECT 
--    P.[Name] AS [Press Name],
--    B.[Name] AS [Book Name],
--    B.Pages AS Pages
--FROM Press AS P
--INNER JOIN Books AS B ON P.Id = B.Id_Press
--WHERE B.Pages = (
--    SELECT MIN(Pages) 
--    FROM Books
--    WHERE Id_Press = P.Id
--)
--)

--GO
--SELECT *
--FROM [Min Pages of Press]()


--TASK 4


--GO 
--USE Library
--GO

--ALTER FUNCTION [Average] 
--(@COUNT AS int)
--RETURNS TABLE 
--AS 
--RETURN
--(
--	SELECT 
--    P.[Name] AS [Press Name],
--    AVG(B.Pages) AS AveragePages
--	FROM Press AS P
--	INNER JOIN Books AS B ON P.Id = B.Id_Press
--	GROUP BY P.[Name]
--	HAVING AVG(B.Pages)  > @COUNT
--)
--GO
--SELECT *
--FROM [Average](125)
--ORDER BY AveragePages 
