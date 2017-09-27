class GameV3
  def play player1_choice, player2_choice
    case (player1_choice <=> player2_choice)
      when -1
        :lose
      when 1
        :win
      else
        :draw
    end
  end
end

class Rock
  def <=> other
    case other
      when Paper
        -1
      when Scissors
        1
      else
        0
    end
  end
end

class Scissors
  def <=> other
    case other
      when Rock
        -1
      when Paper
        1
      else
        0
    end
  end
end

class Paper
  def <=> other
    case other
      when Scissors
        -1
      when Rock
        1
      else
        0
    end
  end
end


describe Rock do
  it 'beats paper' do
    expect(subject <=> Paper.new).to eq(-1)
  end

  it 'loses to scissors' do
    expect(subject <=> Scissors.new).to eq(1)
  end

  it 'draws with rock' do
    expect(subject <=> Rock.new).to eq(0)
  end
end

describe Paper do
  it 'beats Rock' do
    expect(subject <=> Rock.new).to eq(1)
  end

  it 'loses to scissors' do
    expect(subject <=> Scissors.new).to eq(-1)
  end

  it 'draws with paper' do
    expect(subject <=> Paper.new).to eq(0)
  end
end

describe Scissors do
  it 'beats paper' do
    expect(subject <=> Paper.new).to eq(1)
  end

  it 'loses to rock' do
    expect(subject <=> Rock.new).to eq(-1)
  end

  it 'draws with scissors' do
    expect(subject <=> Scissors.new).to eq(0)
  end
end



describe GameV3 do

  let(:paper){Paper.new}

  describe '#play' do
    context 'player 1s choice beats players 2s' do
      it 'returns win' do
        expect(subject.play(paper, Rock.new)).to eq(:win)
      end
    end

    context 'player 1s choice loses to player 2s' do
      it 'returns lose' do
        expect(subject.play(paper, Scissors.new)).to eq(:lose)
      end
    end

    context 'player 1s choice draws with player 2s' do
      it 'returns draw' do
        expect(subject.play(paper, paper)).to eq(:draw)
      end
    end
  end

end