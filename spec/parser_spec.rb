require './requires'

describe Parser do
  context 'When testing the Parser class' do

    parser = Parser.new 'search.xml'
    parser.parse

    it 'The search results collection should contain 3 items' do
      expect(parser.results.length).to eq 3
    end

    it 'The first search result should contain 2 connections' do
      expect(parser.results[0].connections.length).to eq 2
    end

    it 'The Train Name of the first connection of first result should be Eurostar' do
      expect(parser.results[0].connections[0].train).to eq 'Eurostar'
    end

  end
end