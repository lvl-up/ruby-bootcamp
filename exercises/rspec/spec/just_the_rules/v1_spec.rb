class GameV1
  def play player1_choice, player2_choice
    if player1_choice == :paper
      if player2_choice == :scissors
        :lose
      elsif player2_choice == :rock
        :win
      else
        :draw
      end
    elsif player1_choice == :scissors
      if player2_choice == :paper
        :win
      elsif player2_choice == :rock
        :lose
      else
        :draw
      end
    else
      if player2_choice == :scissors
        :win
      elsif player2_choice == :paper
        :lose
      else
        :draw
      end
    end
  end
end

describe GameV1 do

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