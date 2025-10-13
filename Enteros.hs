{-#LANGUAGE GADTs #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

{-
FUNDAMENTOS DE COMPUTACIÓN
ENTREGABLE: NÚMEROS ENTEROS

Integrantes del equipo:
Nombre 1: _______________________  Nro Est: _________
Nombre 2: _______________________  Nro Est: _________

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
    (==) = undefined

--------------------------------------------------------------------------------
-- EJERCICIO 2: Instancia de Eq para Entero
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Eq Entero where
    (==) = undefined 

--------------------------------------------------------------------------------
-- EJERCICIO 3: Instancia de Ord para Signo
-- Se pide: Neg < Pos
--------------------------------------------------------------------------------
instance Ord Signo where
    (<=) = undefined

--------------------------------------------------------------------------------
-- EJERCICIO 4: Instancia de Ord para Entero
-- Recordar: negativos < cero < positivos
-- Entre negativos: el de mayor magnitud es menor (más alejado de cero)
-- Entre positivos: el de mayor magnitud es mayor
-- CUIDADO: E Pos O y E Neg O ambos representan el cero
--------------------------------------------------------------------------------
instance Ord Entero where
    (<=) = undefined

--------------------------------------------------------------------------------
-- EJERCICIO 5: Instancia de Num para Entero
-- Definir suma, producto y resta de enteros
-- Recordar las reglas de signos y las diferentes combinaciones
-- Cuando una operación da como resultado cero, se puede devolver E Pos O o E Neg O indistintamente
--------------------------------------------------------------------------------
instance Num Entero where
    (+) = undefined
    (*) = undefined
    (-) = undefined
    