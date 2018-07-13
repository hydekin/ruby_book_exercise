# 改札機クラス
class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  # Gateオブジェクトの作成
  # ==== 引数
  # * +name+ - 駅名
  def initialize(name)
    @name = name
  end

  # 改札を通って駅に入場する
  # ==== 引数
  # * +ticket+ - 切手
  def enter(ticket)
    ticket.stamp @name
  end

  # 改札を通って駅から出場する
  # ==== 引数
  # * +ticket+ - 切手
  # ==== 戻り値
  # * +boolean+ - 運賃が足りていれば+true+、不足していれば+false+
  def exit(ticket)
    fare = calc_fare ticket
    fare <= ticket.fare
  end

  # 運賃を計算する
  # ==== 引数
  # * +ticket+ チケット
  # ==== 戻り値
  # * 運賃
  def calc_fare(ticket)
    from = STATIONS.index ticket.stamp_at
    to   = STATIONS.index @name
    distance = to - from
    FARES[distance - 1]
  end
end
