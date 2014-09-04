module LLT
  module Constants
    module Abbreviations
      NAMES = %w{ A D C K L M N P Q S T App Ap Cn Mam M' Ser Sex Sp Tib Ti }
      NAMES_PIPED = NAMES.join('|')

      DATES = %w{ a d Kal Non Id Ian Feb Mar Apr Mai Iun Iul Aug Sep Oct Octob Nov Dec }
      DATES_PIPED = DATES.join('|')

      INSCRIPTION_ABBR = %w{ Cos Coss Conss Cons cos coss conss cons tr pl Tr f p }
      INSCRIPTION_ABBR_PIPED = INSCRIPTION_ABBR.join('|')

      ALL_ABBRS_PIPED = "#{NAMES_PIPED}|#{DATES_PIPED}|#{INSCRIPTION_ABBR_PIPED}"

      APOSTROPHES = %w{ po min vin potin satin scin tun }
      APOSTROPHES_PIPED = APOSTROPHES.join('|')
    end
  end
end
