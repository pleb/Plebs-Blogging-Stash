<Query Kind="Program" />

void Main()
{
    using(var db = new DbConnection()) 
    {
        db.RunQuery();
    }
}


public class DbConnection : IDisposable
{
	public DbConnection()
	{
		Console.WriteLine("New instance of Db Connection");
	}

	public void RunQuery()
	{
		throw new Exception("Error.... soz");
	}

	public void Dispose()
	{
		Console.WriteLine("Db Connection disposed");
	}
}
