#encoding: UTF-8

module LLT
  module Constants
    module Endings
      class Verb
        # all nil values are wildcards to keep the index in the right order
        SECONDARY = [ "i", "isti", "it", "imus", "istis", "erunt" ]

        PRIMARY_O_ACTIVUM = ["o", "s", "t", "mus", "tis", "nt" ]
        PRIMARY_M_ACTIVUM = ["m", "s", "t", "mus", "tis", "nt" ]
        PRIMARY_OR_PASSIVUM = ["or", "ris", "tur", "mur", "mini", "ntur" ]
        PRIMARY_R_PASSIVUM = ["r", "ris", "tur", "mur", "mini", "ntur" ]

        IMPERATIVUM_ACTIVUM_PRAESENS = [ nil, "", nil, nil, "te", nil ]
        IMPERATIVUM_ACTIVUM_PRAESENS_C_M = [ nil, "e", nil, nil, "te", nil ]
        IMPERATIVUM_PASSIVUM_PRAESENS = [ nil, "re", nil, nil, "mini", nil ]

        IMPERATIVUM_ACTIVUM_FUTURUM = [ nil, "to", "to", nil, "tote", "nto" ]
        IMPERATIVUM_PASSIVUM_FUTURUM = [ nil, "tor", "tor", nil, nil, "ntor" ]

        class Praesens
          class << self
            private

            def a1; PRIMARY_O_ACTIVUM; end
            def a2; PRIMARY_M_ACTIVUM; end
            def p1; PRIMARY_R_PASSIVUM; end
            def p2; PRIMARY_OR_PASSIVUM; end
            def p3sg; [nil, nil, "tur", nil, nil, nil]; end
            def iap1; IMPERATIVUM_ACTIVUM_PRAESENS; end
            def iap2; IMPERATIVUM_ACTIVUM_PRAESENS_C_M; end
            def ipp ; IMPERATIVUM_PASSIVUM_PRAESENS; end
            def ifa ; IMPERATIVUM_ACTIVUM_FUTURUM; end
            def ifp ; IMPERATIVUM_PASSIVUM_FUTURUM; end
            def nils; [nil, nil, nil, nil, nil, nil]; end
            def praes_ind_con; a1 + p2 + a2 + p1; end
            def praes_imp_to_future_ind; ipp + a2 + p1 + a2 + p1 + nils + nils; end
            def future_con_and_imp; nils + nils + ifa + ifp; end
          end

          #  these "compositions" could be refactored one day to something like
          #  A = praesens_a + imperfect_a + future_a, for better readability...
          #  pIa  pIp  pCa  pCp  pIMa   pIMp  iIa  iIp iCa  iCp    nil    nil   fIa  aIp    nil   nil fIMa fIMp
          A = praes_ind_con + iap1 + praes_imp_to_future_ind + a1 + p2 + future_con_and_imp
          E = A
          C = praes_ind_con + iap2 + praes_imp_to_future_ind + a2 + p1 + future_con_and_imp
          I = praes_ind_con + iap1 + praes_imp_to_future_ind + a2 + p1 + future_con_and_imp
          M = C

          def self.get(inflection_class)
            const_get(case inflection_class
                      when 1 then :A
                      when 2 then :E
                      when 3 then :C
                      when 4 then :I
                      when 5 then :M
                      end)
          end
        end

        class IrregularPraesens < Praesens
          a3 = ["m", "", "t", "mus", "tis", "nt" ]
          a4 = ["o", "", "t", "mus", "tis", "nt" ]
          iap3 = [ nil, "i", nil, nil, "te", nil ]
          nils_3 = nils + nils + nils
          same_forms_of_esse_and_edere = nils + a2 + nils + iap1 + nils + a2 + nils + a2 + nils_3 + a1 + nils_3 + ifa + nils

          ESSE  = a3 + same_forms_of_esse_and_edere
          POSSE = a3 + nils + a2 + nils_3 + a2 + nils + a2 + nils_3 + a1 + nils_3 + nils + nils
          FERRE = a1 + p2 + a2 + p1 + iap1 + praes_imp_to_future_ind + a2 + p1 + future_con_and_imp
          VELLE = a1 + nils + a2 + nils_3 + a2 + nils + a2 + nils_3 + a2 + nils_3 + nils + nils
          NOLLE = a1 + nils + a2 + nils + iap3 + nils +
                  a2 + nils + a2 + nils_3 +
                  a2 + nils + nils + nils + ifa + nils
          MALLE = VELLE
          # passive of ire because of composita
          IRE   = a1 + p2 + a2 + p1 + iap1 + praes_imp_to_future_ind + a1 + p2 + future_con_and_imp
          EDERE = a4 + p3sg + a2 + p3sg + iap1 + nils +
                  a2 + p3sg + a2 + p3sg + nils + nils +
                  a2 + p3sg + nils + nils + ifa + nils
          # active endings!
          FIERI = nils + a1 + nils + a2 + nils + nils +
                  nils + a2 + nils + a2 + nils + nils +
                  nils + a2 + nils + nils + nils + nils

          def self.get(inflection_class)
            const_get(inflection_class.upcase.to_sym)
          end
        end

        class PraesensInfinitivum < Praesens
          A = ["re", "ri"]
          E = A
          C = ["re", "i"]
          I = A
          M = C
        end

        class IrregularPraesensInfinitivum < IrregularPraesens
          ESSE  = ["se"]
          POSSE = ["se"]
          FERRE = ["re", "ri"]
          VELLE = ["le"]
          NOLLE = VELLE
          MALLE = VELLE
          IRE   = FERRE
          EDERE = ["se"]
          FIERI = [nil, "ri"]
        end

        class Perfectum
          def self.get
            a1 = PRIMARY_O_ACTIVUM
            a2 = PRIMARY_M_ACTIVUM
            a3 = SECONDARY

            a3 + a2 + a2 + a2 + a1
          end
        end

        class IrregularPerfectum < Perfectum
        end

        class Metrical < Verb
         O = "ō"
         SECONDARY = [ "ī", "istī", "it", "imus", "istis", "ērunt" ]
         PRIMARY_PASSIVUM_ENDING_WITHOUT_FIRST = [ "rĭs", "tŭr", "mŭr", "mĭnī", "ntŭr" ]
         PRIMARY_ACTIVUM_ENDINGS_WITHOUT_FIRST = [ "s", "t", "mŭs", "tĭs", "nt" ]

         IMPERATIVUM_PASSIVUM_PRAESENS = [ nil, "re", nil, nil, "minī", nil ]

         IMPERATIVUM_ACTIVUM_FUTURUM = [ nil, "tō", "tō", nil, "tōte", "ntō" ]
         IMPERATIVUM_PASSIVUM_FUTURUM = [ nil, "tor", "tor", nil, nil, "ntor" ]
        end

        class PerfectumInfinitivum
          def self.get(*args)
            ["isse"]
          end
        end

        class IrregularPerfectumInfinitivum < PerfectumInfinitivum
        end
      end
    end
  end
end
