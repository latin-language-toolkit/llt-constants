require 'llt/constants/verb_endings'

module LLT
  module Constants
    module Endings
      module Latin

        class Noun
          A  = ['a', 'ae', 'ae', 'am', 'a', 'a', 'ae', 'arum', 'is', 'as', 'ae', 'is']
          O  = ['us', 'i', 'o', 'um', 'e', 'o', 'i', 'orum', 'is', 'os', 'i', 'is']
          ON = ['um', 'i', 'o', 'um', 'um', 'o', 'a', 'orum', 'is', 'a', 'a', 'is']
          E  = ['es', 'ei', 'ei', 'em', 'es', 'e', 'es', 'erum', 'ebus', 'es', 'es', 'ebus']
          U  = ['us', 'us', 'ui', 'um', 'us', 'u', 'us', 'uum', 'ibus', 'us', 'us', 'ibus']
          UN = ['u', 'us', 'u', 'u', 'u', 'u', 'ua', 'uum', 'ibus', 'ua', 'ua', 'ibus']
          C  = [nil, 'is', 'i', 'em', nil, 'e', 'es', 'um', 'ibus', 'es', 'es', 'ibus']
          CN = [nil, 'is', 'i', nil, nil, 'e', 'a', 'um', 'ibus', 'a', 'a', 'ibus']
          M  = [nil, 'is', 'i', 'em', nil, 'e', 'es', 'ium', 'ibus', 'es', 'es', 'ibus']
          I  = ['is', 'is', 'i', 'im', 'is', 'i', 'es', 'ium', 'ibus', 'es', 'es', 'ibus']
          IN = ['e', 'is', 'i', 'e', 'e', 'i', 'ia', 'ium', 'ibus', 'ia', 'ia', 'ibus']
          IRREGULARS = [nil, nil, nil, nil, nil, nil, nil, nil, 'bus', nil, nil, 'bus']

          class Metrical < Noun
            A  = ['ă', 'ae', 'ae', 'ăm', 'ă', 'ā', 'ae', 'ārŭm', 'īs', 'ās', 'ae', 'īs']
            O  = ['ŭs', 'ī', 'ō', 'ŭm', 'ĕ', 'ō', 'ī', 'ōrŭm', 'īs', 'ōs', 'ī', 'īs']
            ON = ['ŭm', 'ī', 'ō', 'ŭm', 'ŭm', 'ō', 'ă', 'ōrŭm', 'īs', 'ă', 'ă', 'īs']
            #attention: if final sound of stem is vowel 2sg and 3sg e is long, else short: see diēī but rĕī
            EL = ['ēs', 'ēī', 'ēī', 'ĕm', 'ēs', 'ē', 'ēs', 'ērŭm', 'ēbŭs', 'ēs', 'ēs', 'ēbŭs']
            ES = ['ēs', 'ĕī', 'ĕī', 'ĕm', 'ēs', 'ē', 'ēs', 'ērŭm', 'ēbŭs', 'ēs', 'ēs', 'ēbŭs']
            U  = ['ŭs', 'ūs', 'ŭī', 'ŭm', 'ŭs', 'ū', 'ūs', 'ŭŭm', 'ĭbŭs', 'ūs', 'ūs', 'ĭbŭs']
            UN = ['ū', 'ūs', 'ū', 'ū', 'ū', 'ū', 'ŭă', 'ŭŭm', 'ĭbŭs', 'ŭă', 'ŭă', 'ĭbŭs']
            C  = [nil, 'ĭs', 'ī', 'ĕm', nil, 'ĕ', 'ēs', 'ŭm', 'ĭbŭs', 'ēs', 'ēs', 'ĭbŭs']
            CN = [nil, 'ĭs', 'ī', nil, nil, 'ĕ', 'ă', 'ŭm', 'ĭbŭs', 'ă', 'ă', 'ĭbŭs']
            M  = [nil, 'ĭs', 'ī', 'ĕm', nil, 'ĕ', 'ēs', 'ĭŭm', 'ĭbŭs', 'ēs', 'ēs', 'ĭbŭs']
            I  = ['ĭs', 'ĭs', 'ī', 'ĭm', 'ĭs', 'ī', 'ēs', 'ĭŭm', 'ĭbŭs', 'ēs', 'ēs', 'ĭbŭs']
            IN = ['ĕ', 'ĭs', 'ī', 'ĕ', 'ĕ', 'ī', 'ĭă', 'ĭŭm', 'ĭbŭs', 'ĭă', 'ĭă', 'ĭbŭs']
            IRREGULARS = [nil, nil, nil, nil, nil, nil, nil, nil, 'bŭs', nil, nil, 'bŭs']
          end

          def self.get_ending_for_inflection_class(inflection_class)
            case inflection_class
            when 1  then  :A
            when 2  then  :O
            when 3  then  :C
            when 32 then  :I
            when 33 then  :M
            when 4  then  :U
            when 5  then  :E
            end
          end

          def self.get_ending_for_inflection_class_as_neutrum(inflection_class)
            case inflection_class
            when 2  then :ON
            when 3  then :CN
            when 4  then :UN
            when 31 then :IN
            end
          end

          def self.get(inflection_class, sexus = nil)
            ending = if sexus == :n
                       get_ending_for_inflection_class_as_neutrum(inflection_class)
                     else
                       get_ending_for_inflection_class(inflection_class)
                     end
            const_get(ending)
          end
        end

        class Adjective
          A = Noun::A
          O = Noun::O
          ON = Noun::ON
          CMF = Noun::C
          CN  = Noun::CN
          MMF = [nil, 'is', 'i', 'em', nil, 'i', 'es', 'ium', 'ibus', 'es', 'es', 'ibus']
          MN  = [nil, 'is', 'i', nil, nil, 'i', 'ia', 'ium', 'ibus', 'ia', 'ia', 'ibus']
          PRM = ['us', 'ius', 'i', 'um', 'e', 'o', 'i', 'orum', 'is', 'os', 'i', 'is']
          PRF = ['a', 'ius', 'i', 'am', 'a', 'a', 'ae', 'arum', 'is', 'as', 'ae', 'is']
          PRN = ['um', 'ius', 'i', 'um', 'um', 'o', 'a', 'orum', 'is', 'a', 'a', 'is']

          AO = Noun::O + Noun::A + Noun::ON
          MIXED = MMF + MMF + MN
          MIXED_1 = MIXED
          MIXED_2 = MIXED.each_with_index.map do |el, i|
            case i.to_s
            when /^(0|4|12|16)$/ then 'is'
            when /^(24|27|28)$/  then 'e'
            else el
            end
          end
          MIXED_3 = MIXED_2.each_with_index.map do |el, i|
            case i.to_s
            when /^(0|4)$/ then nil
            else el
            end
          end
          CONSONANTIC = CMF + CMF + CN
          PRONOMINAL = PRM + PRF + PRN

          class Metrical < Adjective
            A = Noun::Metrical::A
            O = Noun::Metrical::O
            ON = Noun::Metrical::ON
            CMF = Noun::Metrical::C
            CN  = Noun::Metrical::CN
            MMF = [nil, 'ĭs', 'ī', 'ĕm', nil, 'ī', 'ēs', 'ĭŭm', 'ĭbŭs', 'ēs', 'ēs', 'ĭbŭs']
            MN  = [nil, 'ĭs', 'ī', nil, nil, 'ī', 'ĭa', 'ĭŭm', 'ĭbŭs', 'ĭa', 'ĭa', 'ĭbŭs']
            PRM = ['ŭs', 'īŭs', 'ī', 'ŭm', 'ĕ', 'ō', 'ī', 'ōrŭm', 'īs', 'ōs', 'ī', 'īs']
            PRF = ['ă', 'īŭs', 'ī', 'ăm', 'ă', 'ā', 'ae', 'ārum', 'īs', 'ās', 'ae', 'īs']
            PRN = ['ŭm', 'īŭs', 'ī', 'ŭm', 'ŭm', 'ō', 'ă', 'ōrŭm', 'īs', 'ă', 'ă', 'īs']

            AO = Noun::Metrical::O + Noun::Metrical::A + Noun::Metrical::ON
            MIXED = MMF + MMF + MN
            MIXED_1 = MIXED
            MIXED_2 = MIXED.each_with_index.map do |el, i|
              case i.to_s
              when /^(0|4|12|16)$/ then 'ĭs'
              when /^(24|27|28)$/  then 'ĕ'
              else el
              end
            end
            MIXED_3 = MIXED_2.each_with_index.map do |el, i|
              case i.to_s
              when /^(0|4)$/ then nil
              else el
              end
            end
            CONSONANTIC = CMF + CMF + CN
            PRONOMINAL = PRM + PRF + PRN
          end

          def self.get(inflection_class, number_of_endings, comparatio = :positivus)
            const_get(case comparatio
          when :comparativus
            :CONSONANTIC
          when :superlativus
            :AO
          else # positivus - or nil if someone has forgotten to provide a value
            case [inflection_class, number_of_endings]
            when [1,  3] then :AO
            when [3,  1] then :CONSONANTIC
            when [33, 1] then :MIXED_1
            when [33, 2] then :MIXED_2
            when [33, 3] then :MIXED_3
            when [5,  3] then :PRONOMINAL
            end
          end)
        end
      end

      class Adverb
        E    = "e"
        ITER = "iter"
        TER  = "ter"
        ER   = "er"
        EMPTY = ""

        def self.get(inflection_class, stem, comparatio)
          const_get(case comparatio
        when :comparativus then :EMPTY
        when :superlativus then :E
        else positivus_ending(inflection_class, stem)
        end)
      end

      def self.positivus_ending(inflection_class, stem)
        if inflection_class.to_s =~ /3/
          case stem
          when /nt$/     then :ER
          when /^facil$/ then :E
          else :ITER
            # TER for audacter and sollerter, cf. RH 50
          end
        else
          :E
        end
      end
    end

    class Pronoun
      HIC  = ['i', 'ius', 'i', 'un', nil, 'o', 'i', 'orum', 'is', 'os', nil, 'is']
      HAEC = ['ae', 'ius', 'i', 'an', nil, 'a', 'ae', 'arum', 'is', 'as', nil, 'is']
      HOC  = ['o', 'ius', 'i', 'o', nil, 'o', 'ae', 'orum', 'is', 'ae', nil, 'is']

      #ille + iste
      ILLE  = ['e', 'ius', 'i', 'um', nil, 'o', 'i', 'orum', 'is', 'os', nil, 'is']
      ILLA  = ['a', 'ius', 'i', 'am', nil, 'a', 'ae', 'arum', 'is', 'as', nil, 'is']
      ILLUD = ['ud', 'ius', 'i', 'ud', nil, 'o', 'a', 'orum', 'is', 'a', nil, 'is']

      #ipse
      IPSE = ILLE
      IPSA = ILLA
      IPSUM = ['um', 'ius', 'i', 'um', nil, 'o', 'a', 'orum', 'is', 'a', nil, 'is']

      #is
      IS  = ['s', 'ius', 'i', 'um', nil, 'o', 'i', 'orum', 'is', 'os', nil, 'is']
      EA  = ILLA
      ID  = ['d', 'ius', 'i', 'd', nil, 'o', 'a', 'orum', 'is', 'a', nil, 'is']

      #idem
      IDEM   = [nil, 'ius', 'i', 'un', nil, 'o', 'i', 'orun', 'is', 'os', nil, 'is']
      EADEM  = ['a', 'ius', 'i', 'an', nil, 'a', 'ae', 'arun', 'is', 'as', nil, 'is']
      IDEM_N = [nil, 'ius', 'i', nil, nil, 'o', 'a', 'orun', 'is', 'a', nil, 'is']

      #qui
      QUI  = ['i', 'ius', 'i', 'em', nil, 'o', 'i', 'orum', 'ibus', 'os', nil, 'ibus']
      QUAE = ['ae', 'ius', 'i', 'am', nil, 'a', 'ae', 'arum', 'ibus', 'as', nil, 'ibus']
      QUOD = ['od', 'ius', 'i', 'od', nil, 'o', 'ae', 'orum', 'ibus', 'ae', nil, 'ibus']
      QUA  = ['a', 'ius', 'i', 'am', nil, 'a', 'ae', 'arum', 'ibus', 'as', nil, 'ibus']

      #quidam - adj
      QUIDAM  = ['i', 'ius', 'i', 'en', nil, 'o', 'i', 'orun', 'ibus', 'os', nil, 'ibus']
      QUAEDAM = ['ae', 'ius', 'i', 'an', nil, 'a', 'ae', 'arun', 'ibus', 'as', nil, 'ibus']
      QUODDAM = ['od', 'ius', 'i', 'od', nil, 'o', 'ae', 'orun', 'ibus', 'ae', nil, 'ibus']

      #quis
      QUIS = ['is', 'ius', 'i', 'em', nil, 'o', 'i', 'orum', 'ibus', 'os', nil, 'ibus']
      #QUAE
      QUID = ['id', 'ius', 'i', 'id', nil, 'o', 'ae', 'orum', 'ibus', 'ae', nil, 'ibus']

      #uter + uterque
      UTER = [nil, 'ius', 'i', 'um', nil, 'o', 'i', 'orum', 'is', 'os', nil, 'is']
      UTRA = ['a', 'ius', 'i', 'am', nil, 'a', 'ae', 'arum', 'is', 'as', nil, 'is']
      UTRUM = ['um', 'ius', 'i', 'um', nil, 'o', 'a', 'orum', 'is', 'a', nil, 'is']

      def self.get(pronoun_type)
        qui_adj = QUI + QUAE + QUOD
        quis_adj = QUIS + QUAE + QUOD
        qui_subst = QUIS + QUIS + QUID
        uter_adj = UTER + UTRA + UTRUM
        ille_iste = ILLE + ILLA + ILLUD
        case pronoun_type
        when :aliqui        then QUI + QUA + QUOD
        when :aliquis       then qui_subst
        when :hic           then HIC + HAEC + HOC
        when :idem          then IDEM + EADEM + IDEM_N
        when :ille          then ille_iste
        when :ipse          then IPSE + IPSA + IPSUM
        when :is            then IS + EA + ID
        when :iste          then ille_iste
        when :qui           then qui_adj
        when :quicumque     then qui_adj
        when :quidam        then QUIDAM + QUAEDAM + QUODDAM
        when :quilibet      then qui_adj
        when :quinam        then qui_adj
        when :quis          then qui_subst
        when :quisquam      then qui_subst
        when :quispiam      then qui_subst
        when :quisque       then quis_adj
        when :quisque_s     then qui_subst
        when :quisquis      then qui_subst
        when :quivis        then qui_adj
        when :unusquisque   then quis_adj
        when :unusquisque_s then qui_subst
        when :uter          then uter_adj
        when :uterque       then uter_adj
          #when :quilibet      then QUI + QUAE + QUID
          #when :quivis        then QUI + QUAE + QUID
        end
      end
    end
    class PersonalPronoun
      nils = [nil] * 6
      EGO = ["ego", "mei", "mihi", "me", nil, "me"  ]
      TU  = ["tu", "tui", "tibi", "te", nil, "te" ]
      SE  = [nil, "sui", "sibi", "se", nil, "se"] * 2
      NOS = nils + ["nos", "nostri", "nobis", "nos", nil, "nobis"] # handle nostrum and vestrum in the builder
      VOS = nils + ["vos", "vestri", "vobis", "vos", nil, "vobis"]

      def self.get(inflection_class)
        const_get(inflection_class.upcase)
      end
    end


    class Ppa
      MMFE = ['s', 'is', 'i', 'em', 's', 'e', 'es', 'ium', 'ibus', 'es', 'es', 'ibus']
      MNE  = ['s', 'is', 'i', 's', 's', 'e', 'ia', 'ium', 'ibus', 'ia', 'ia', 'ibus']

      def self.get(*args)
        MMFE + MMFE + MNE
      end

      class Metrical < Ppa
        MMFE = ['s', 'ĭs', 'ī', 'ĕm', 's', 'ĕ', 'ēs', 'ĭŭm', 'ĭbŭs', 'ēs', 'ēs', 'ĭbŭs']
        MNE  = ['s', 'ĭs', 'ī', 's', 's', 'ĕ', 'ĭa', 'ĭŭm', 'ĭbŭs', 'ĭa', 'ĭa', 'ĭbŭs']
      end
    end

    class AoVerbalNoun
      AO = Adjective::AO

      def self.get(*args)
        AO
      end

      class Metrical < AoVerbalNoun
        AO = Adjective::Metrical::AO
      end
    end

    class Gerundive < AoVerbalNoun
      class Metrical < AoVerbalNoun; end
    end

    class Ppp < AoVerbalNoun
      class Metrical < AoVerbalNoun; end
    end

    class Fp < AoVerbalNoun
      class Metrical < AoVerbalNoun; end
    end

    class Gerund
      GERUND = %w{ i o um o }

      def self.get(*args)
        GERUND
      end

      class Metrical < Gerund
        GERUND  = %w{ ī ō ŭm ō }
      end
    end

    class Supinum
      SUPINUM = %w{ u um u }

      def self.get(*args)
        SUPINUM
      end

      class Metrical < Supinum
        SUPINUM = %w{ ū ŭm ū }
      end
    end
  end
end
  end
end
