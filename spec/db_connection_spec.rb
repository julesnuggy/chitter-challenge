require 'db_connection'
require 'pg'

describe DB_Connection do
  describe '.setup' do
    it 'connects to the database' do
      expect(PG).to receive(:connect).with(dbname: DB_Connection.dbname, user: 'julesnuggy')
      DB_Connection.setup(DB_Connection.dbname)
    end

    it 'confirms connection' do
      connection = DB_Connection.setup(DB_Connection.dbname)
      expect(DB_Connection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'sends a query to the database' do
      connection = DB_Connection.setup(DB_Connection.dbname)
      query_string = "SELECT * FROM summons;"
      expect(connection).to receive(:exec).with(query_string)
      DB_Connection.query(query_string)
    end
  end

end
