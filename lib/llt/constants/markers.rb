module LLT
  module Constants
    module Markers
      class Adjective
        COMP_MF = "ior"
        COMP_N  = "ius"

        RIM = "rim"
        LIM = "lim"
        ISSIM = "issim"

        class Metrical < Adjective
          # are they right?
          COMP_MF = "īōr"
          COMP_N  = "īūs"

          RIM = "rīm"
          LIM = "līm"
          ISSIM = "īssīm"
        end
      end

      class Adverb < Adjective
        IUS = "ius"
      end
    end
  end
end
