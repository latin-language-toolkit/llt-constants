module LLT
  module Constants
    PERSONAL_PRONOUNS = { "ego"      => [[:ego, 1, 1]],
                          "egomet"   => [[:ego, 1, 1]],
                          "mei"      => [[:ego, 2, 1]],
                          "meimet"   => [[:ego, 2, 1]],
                          "mihi"     => [[:ego, 3, 1]],
                          "mihimet"  => [[:ego, 3, 1]],
                          "me"       => [[:ego, 4, 1], ["ego", 6, 1]],
                          "memet"    => [[:ego, 4, 1], ["ego", 6, 1]],
                          "mecum"    => [[:ego, 6, 1]],

                          "tu"       => [[:tu, 1, 1]],
                          "tute"     => [[:tu, 1, 1]],
                          "tui"      => [[:tu, 2, 1]],
                          "tibi"     => [[:tu, 3, 1]],
                          "tibimet"  => [[:tu, 3, 1]],
                          "te"       => [[:tu, 4, 1],  ["tu", 6, 1]],
                          "tete"     => [[:tu, 4, 1],  ["tu", 6, 1]],
                          "tecum"    => [[:tu, 6, 1]],

                          "sui"      => [[:se, 2, 1], ["se", 2, 2]],
                          "sibi"     => [[:se, 3, 1], ["se", 3, 2]],
                          "sese"     => [[:se, 4, 1], ["se", 4, 2]],
                          "se"       => [[:se, 4, 1], ["se", 6, 1], ["se", 4, 2], ["se", 6, 2]],
                          "secum"    => [[:se, 6, 1], ["se", 6, 2]],

                          "nos"      => [[:nos, 1, 2], ["nos", 4, 2]],
                          "nosmet"   => [[:nos, 1, 2], ["nos", 4, 2]],
                          "nostri"   => [[:nos, 2, 2]],
                          "nostrum"  => [[:nos, 2, 2]],
                          "nobis"    => [[:nos, 3, 2], ["nos", 6, 2]],
                          "nobismet" => [[:nos, 3, 2], ["nos", 6, 2]],
                          "nobiscum" => [[:nos, 6, 2]],

                          "vos"      => [[:vos, 1, 2], ["vos", 4, 2]],
                          "vosmet"   => [[:vos, 1, 2], ["vos", 4, 2]],
                          "vestri"   => [[:vos, 2, 2]],
                          "vestrum"  => [[:vos, 2, 2]],
                          "vostrum"  => [[:vos, 2, 2]],
                          "vobis"    => [[:vos, 3, 2], ["vos", 6, 2]],
                          "vobismet" => [[:vos, 3, 2], ["vos", 6, 2]],
                          "vobiscum" => [[:vos, 6, 2]],
    }
  end
end
