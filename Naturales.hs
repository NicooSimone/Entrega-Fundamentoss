{-# LANGUAGE GADTs #-}
{-# OPTIONS_GHC -fno-warn-tabs #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

module Naturales where

data N where {O :: N; S :: N -> N} deriving Show

uno = S O
dos = S uno
tres = S dos
cuatro = S tres
cinco = S cuatro

predecesor :: N -> N
predecesor = \n -> case n of {O -> O; S x -> x}

instance Eq N where
  (==) :: N -> N -> Bool
  (==) = \m -> \n -> case m of {
    O -> case n of {O -> True; S y -> False};
    S x -> case n of {O -> False; S y -> x == y};
  }

instance Ord N where
  (<) :: N -> N -> Bool
  (<) = \m -> \n -> case n of {
    O -> False;
    S y -> case m of {O -> True; S x -> x < y};
  }

  (<=) :: N -> N -> Bool
  (<=) = \m -> \n -> case m of {
    O -> True;
    S x -> case n of {O -> False; S y -> x <= y};
  }

  (>) :: N -> N -> Bool
  (>) = \m -> \n -> case m of {
    O -> False;
    S x -> case n of {O -> True; S y -> x > y};
  }

  (>=) :: N -> N -> Bool
  (>=) = \m -> \n -> case m of {
    O -> case n of {O -> True; S y -> False};
    S x -> case n of {O -> True; S y -> x >= y};
  }

instance Num N where
  (+) :: N -> N -> N
  (+) = \m -> \n -> case m of {
    O -> n;
    S x -> S (x + n);
  }

  (*) :: N -> N -> N
  (*) = \m -> \n -> case m of {
    O -> O;
    S x -> (x * n) + n;
  }

  (-) :: N -> N -> N
  (-) = \m -> \n -> case m of {
    O -> O;
    S x -> case n of {
      O -> S x;
      S y -> x - y;
    };
  }
