require 'peep'
require 'pg'

describe 'Peep' do

  it 'allows user to create a peep' do
    new_peep = Peep.create(body: "test peep", time: Time.now)

    # expect(new_peep).to eq "test peep"
  end

  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    # peeps = Peep.all
    connection.exec("INSERT INTO peeps1 (url) VALUES('Test peep from database');")
    connection.exec("INSERT INTO peeps1 (url) VALUES('Second test peep from database');")

    peeps = Peep.all

    expect(peeps).to include('Test peep from database')
    expect(peeps).to include('Second test peep from database')
  end

end
