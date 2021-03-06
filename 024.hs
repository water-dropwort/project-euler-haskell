module Problem024 where

answer :: [Int]
answer = solve (1000000-1)

solve :: Int -> [Int]
solve 0 = list
solve n = let listMax = maximum list
              (_,res,_) = foldl nextNumber (n,[],list) [listMax,listMax-1..0]
          in  res
  where
    nextNumber (n',res,xs) j
      | xs == []  = (n',res,[])
      | n' == 0   = (n',res ++ xs, [])
      | otherwise = let (i,n_) = divMod n' $ permutation j
                        xs' = remIndex xs i
                    in  (n_, res++[xs!!i], xs')

list = [0..9]

permutation :: Int -> Int
permutation 0 = 1
permutation n = product [1..n]

remIndex :: [Int] -> Int -> [Int]
remIndex [] _ = []
remIndex xs i
  | 0 > i || i >= length xs = xs
  | otherwise               = filter (/=(xs !! i)) xs
