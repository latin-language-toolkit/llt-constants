module LLT
  module Constants
    module Phonology

      LETTERS = { vowel:            %w(a e i o u y),
                  long_vowel:       %w(ā ē ī ō ū),
                  short_vowel:      %w(ă ĕ ĭ ŏ ŭ),
                  diphtong:         %w(ae au ei eu oe ),
                  consonant:        %w(b c d f gu g h j k l m n p qu r s t v x z),
                  double_consonant: %w(x z),
                  sonant:           %w(l m n r),
                  semivowel:        %W(i u),

                  muta:             %w(b d g p t c ph th ch),
                  liquida:          %w(l r),
                  nasal:            %w(m n),
                  spirant:          %w(f v s h ),

                  labial:           %w(b ph p f v m),
                  aspirant:         %w(ph th ch),
                  dental:           %w(d th t s n l ), #alveolar
                  labiovelar:       %w(gu qu),
                  velar:            %w(n g c k), #guttural
                  glottal:          %w(h),

                  media:            %w(b d gu g),
                  tenuis:           %w(p t qu c k),
      }

      PHONEMES = LETTERS

    end
  end
end
