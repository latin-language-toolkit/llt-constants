module LLT
  module Constants
    module Abbreviations
      NAMES = %w{ A D C K L M N P Q S T App Ap Cn Mam M' Ser Sex Sp Tib Ti }
      NAMES_PIPED = NAMES.join('|')

      DATES = %w{ a d Kal Non Id Ian Feb Mar Apr Mai Iun Iul Aug Sep Oct Nov Dec }
      DATES_PIPED = DATES.join('|')

      ALL_ABBRS_PIPED = "#{NAMES_PIPED}|#{DATES_PIPED}"

      APOSTROPHES = %w{ po min vin potin satin scin tun }
      APOSTROPHES_PIPED = APOSTROPHES.join('|')
    end
  end
end
