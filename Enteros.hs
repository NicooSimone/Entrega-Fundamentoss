{-#LANGUAGE GADTs #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

{-
FUNDAMENTOS DE COMPUTACIÓN
ENTREGABLE: NÚMEROS ENTEROS

Integrantes del equipo:
Nombre 1: Nicolás Simone  Nro Est:346253
Nombre 2: Moisés Benavides  Nro Est: 346605

IMPORTANTE: 
- No se corregirán archivos que no compilen
- Comentar código que no compile y dejar como undefined
- No usar herramientas de IA
-}

module Enteros where

import Naturales

data Signo where { Pos :: Signo ; Neg :: Signo }
    deriving Show

data Entero where { E :: Signo -> N -> Entero }
    deriving Show

--------------------------------------------------------------------------------
-- EJERCICIO 1: Instancia de Eq para Signo
--------------------------------------------------------------------------------
instance Eq Signo where
    (==) :: Signo -> Signo -> Bool
    (==) = \p -> \q -> case p of{
        Pos -> case q of{
            Pos -> True;
            Neg -> False;
        };
        Neg -> case q of{
            Pos -> False;
            Neg -> True;
        };
    }

--------------------------------------------------------------------------------
-- EJERCICIO 2: Instancia de Eq para Entero
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Eq Entero where
    (==) :: Entero -> Entero -> Bool
    (==) = \m -> \n -> case m of{
        E Pos O -> case n of{
           E Pos O -> True;
           E Neg O -> True;
           E Pos (S y) -> False;
           E Neg (S y) -> False;
        };
        E Neg O -> case n of{
           E Pos O -> True;
           E Neg O -> True;
           E Pos (S y) -> False;
           E Neg (S y) -> False;
        };   
        E Pos (S x) -> case n of{
           E Pos O -> False;
           E Neg O -> False;
           E Pos (S y) -> x == y;
           E Neg (S y) -> False;
        };
        E Neg (S x) -> case n of{
           E Pos O -> False;
           E Neg O -> False;
           E Pos (S y) -> False;
           E Neg (S y) -> x == y;
        };
    };
    --(E s1 O) == (E s2 O) = True;
    --(E s1 n1) == (E s2 n2) = (s1 == s2) && (n1 == n2)
--------------------------------------------------------------------------------
-- EJERCICIO 3: Instancia de Ord para Signo
-- Se pide: Neg < Pos
--------------------------------------------------------------------------------
instance Ord Signo where
    (<=) :: Signo -> Signo -> Bool
    (<=) = \m -> \n -> case m of{
        Pos -> case n of{
            Pos -> True;
            Neg -> False;
        };
        Neg -> True;
    };

--------------------------------------------------------------------------------
-- EJERCICIO 4: Instancia de Ord para Entero
-- Recordar: negativos < cero < positivos
-- Entre negativos: el de mayor magnitud es menor (más alejado de cero)
-- Entre positivos: el de mayor magnitud es mayor
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Ord Entero where
    (<=) :: Entero -> Entero -> Bool
    (<=) = \m -> \n -> case m of{
        E Pos O -> case n of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S y) -> True;
            E Neg (S y) -> False;
        };
        E Neg O -> case n of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S y) -> True;
            E Neg (S y) -> False;
        };
        E Pos (S x) -> case n of{
            E Pos O -> False;
            E Neg O -> False;
            E Pos (S y) -> x <= y;
            E Neg (S y) -> False;
        };
        E Neg (S x) -> case n of{
            E Pos O -> True;
            E Neg O -> True;
            E Pos (S y) -> True;
            E Neg (S y) -> y <= x;
        };
    }

--------------------------------------------------------------------------------
-- EJERCICIO 5: Instancia de Num para Entero
-- Definir suma, producto y resta de enteros
-- Recordar las reglas de signos y las diferentes combinaciones
-- Cuando una operación da como resultado cero, se puede devolver E Pos O o E Neg O indistintamente
--------------------------------------------------------------------------------
instance Num Entero where
   
   
   --CORREGIR (+)
   
   {- (+) :: Entero -> Entero -> Entero
    (+) = \m -> \n -> case m of{
        E Pos O -> case n of{
            E Pos O ->  E Pos O;
            E Neg O ->  E Pos O;
            E Pos (S y) -> n;
            E Neg (S y) -> n;
        };
         E Neg O -> case n of{
            E Pos O ->  E Pos O;
            E Neg O ->  E Pos O;
            E Pos (S y) -> n;
            E Neg (S y) -> n;
        };
         E Pos (S x) -> case n of{
            E Pos O ->  m;
            E Neg O ->  m;
            E Pos (S y) -> m + n;
            E Neg (S y) -> case;
        };
          E Neg (S x) -> case n of{
            E Pos O ->  E Pos O;
            E Neg O ->  E Pos O;
            E Pos (S y) -> n;
            E Neg (S y) -> n;
        };
    -}
    (*) :: Entero -> Entero -> Entero
    (*) = \m -> \n -> case m of{
         E Pos O -> E Pos O;
         E Neg O -> E Pos O;
         E Pos (S x) -> case n of{
            E Pos O ->  E Pos O;
            E Neg O ->  E Pos O;
            E Pos (S y) -> (E Pos (x*y) + (S y) + x)   --FALTAN CASOS
    }
    (-) = undefined
    