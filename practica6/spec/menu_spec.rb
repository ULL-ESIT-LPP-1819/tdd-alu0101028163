require "spec_helper"

RSpec.describe "generador_menu" do
  it "El generador de menú debe poder calcular el peso teórico" do
  expect(peso_teorico(168)).to eq(63.5)
 end
end
