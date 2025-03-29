defmodule RpnTest do
  use ExUnit.Case

  test "simple addition" do
    assert {:ok, 2} = Rpn.compute("1 1 +")
  end

  test "with too much operands" do
    assert {:error, _message} = Rpn.compute("1 1 1 +")
  end

  test "with 2 additions" do
    assert {:ok, 3} = Rpn.compute("1 4 2 / +")
  end

  test "with invalid order" do
    assert {:error, _message} = Rpn.compute("+ 1 1")
  end

  test "with multiple operations" do
    assert {:ok, 36} = Rpn.compute("1 5 + 4 2 + *")
  end

  test "with complex minus numbers" do
    assert {:ok, 22} = Rpn.compute("10 6 9 3 + -11 * / * 17 + 5 +")
  end

  test "with multiple operators" do
    assert {:ok, 13} = Rpn.compute("1 3 4 5 + + +")
  end

  test "with complex operation" do
    assert {:ok, 12} =
             Rpn.compute(
               "-8 23 8 - 9 23 - - * 33 -8 / + 38 -14 - - -7 32 -19 - 11 + + + 14 22 - - 27 -9 - + 31 + -12 -11 - - 14 + 30 + 37 30 - + -9 + 7 - 37 + -5 13 / - 19 -2 -19 12 + - 23 + - -19 - + 6 + -17 + 17 + 5 36 + -10 + + 23 -8 - - 18 - 31 -16 - + 34 + -6 + 24 - 22 - -8 - 28 + -12 + 39 28 -7 + + -14 5 + 5 + 10 + + + -18 * 10 + -5 11 - 6 + - -12 31 + + 30 29 - - 39 + 13 -8 -5 + - 26 19 - * - 10 - -20 5 + + 0 - 28 - 19 / 28 + -18 - 28 20 + -5 -19 + + - -12 - 3 - 6 -15 + 4 - - 38 + -9 - 38 - 12 -20 - 10 5 -15 - - - + -11 + 5 + 2 - 28 + -9 -11 - + 37 - -17 31 - 2 + + -16 -12 - - 12 + 34 - 15 + 8 + 17 - 2 - 33 + -5 + 14 + 29 - 33 23 + 26 30 - + + 39 + 9 24 - - 20 15 + - 24 + 37 - 30 -1 - + 34 + -13 - 23 15 - - -5 -8 8 30 35 -9 22 + - - 36 -1 + 5 - - + 25 - + 27 - 16 + + + 39 - 15 - -3 + 5 -6 - + -6 -15 -7 - + / 13 - 18 + 4 + 29 + -17 0 -6 -20 -17 + 12 - + - + + -10 22 + + -11 - -2 38 - - -6 + 0 - -10 + -4 -10 + - 0 - 31 30 - 37 5 + + + -15 + 38 4 - -16 -17 + + + 38 - 27 -19 / 12 + /"
             )
  end
end
