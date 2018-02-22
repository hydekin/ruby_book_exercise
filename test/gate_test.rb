require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < Minitest::Test
  def test_gate
    umeda = Gate.new :umeda
    juso  = Gate.new :juso
    ticket = Ticket.new 150
    umeda.enter ticket
    assert juso.exit ticket
  end

  def test_梅田から三国間で運賃不足
    umeda  = Gate.new :umeda
    mikuni = Gate.new :mikuni
    ticket = Ticket.new 150
    umeda.enter ticket
    refute mikuni.exit ticket
  end
  
end
