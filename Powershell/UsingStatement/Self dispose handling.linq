<Query Kind="Program" />

void Main()
{
	DbConnection db = new DbConnection();
	try
	{
		db.RunQuery();
	}
	finally
	{
		db.Dispose();
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