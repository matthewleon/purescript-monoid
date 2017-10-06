module Bench.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Function (applyN)
import Data.Monoid (power)
import Data.Monoid.Endo (Endo(..))
import Data.Newtype (unwrap)
import Performance.Minibench (benchWith)

main :: Eff (console :: CONSOLE) Unit
main = do
  log "applyN"
  benchApplyN

  log "power Endo"
  benchPowerEndo

  where
  benchApplyN = benchWith 10000 \_ ->
    applyN (_ + 1) 10000 0

  benchPowerEndo = benchWith 10000 \_ ->
    unwrap (power (Endo (_ + 1)) 10000) 0
