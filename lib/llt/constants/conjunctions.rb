module LLT
  module Constants
    # word => homophonous_forms?

    CONJUNCTIONS = {"et"     => false,
                    "-que"   => false,
                    "atque"  => false,
                    "neque"  => false,
                    "nec"    => false,
                    "aut"    => false,
                    "vel"    => false,
                    "sive"   => false,
                    "seu"    => false,
                    "-ve"    => false,
                    "sed"    => false,
                    "verum"  => true,
                    "at"     => false,
                    "attamen"=> false,
                    "tamen"  => false,
                    "velut"  => false,
                    "ac"     => false,
                    "com"    => false,
                    "an"     => false,
                    "ergo"   => false,
                    "atqui"  => false}
  end
end
