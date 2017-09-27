class GameV2
  def play(player1_choice, player2_choice)
    options ={
        paper: {scissors: :lose, rock: :win, paper: :draw},
        scissors: {rock: :lose, paper: :win, scissors: :draw},
        rock: {paper: :lose, scissors: :win, rock: :draw}
    }

    options[player1_choice][player2_choice]
  end
end

describe GameV2 do

  # subject do
  #   GameV2.new
  # end

  context 'paper' do
    it 'beats rock' do
      expect(subject.play(:paper, :rock)).to eq(:win)
    end

    it 'loses to scissors' do
      expect(subject.play(:paper, :scissors)).to eq(:lose)
    end

    it 'draws with paper' do
      expect(subject.play(:paper, :paper)).to eq(:draw)
    end
  end

  context 'scissors' do
    it 'beats paper' do
      expect(subject.play(:scissors, :paper)).to eq(:win)
    end

    it 'loses to rock' do
      expect(subject.play(:scissors, :rock)).to eq(:lose)
    end

    it 'draws with scissors' do
      expect(subject.play(:scissors, :scissors)).to eq(:draw)
    end
  end

  context 'rock' do
    it 'beats scissors' do
      expect(subject.play(:rock, :scissors)).to eq(:win)
    end

    it 'loses to paper' do
      expect(subject.play(:rock, :paper)).to eq(:lose)
    end

    it 'draws with rock' do
      expect(subject.play(:rock, :rock)).to eq(:draw)
    end
  end
end