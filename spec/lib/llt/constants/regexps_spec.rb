require 'spec_helper'

describe LLT::Constants::RegExps do
  def self.example_loop(regexp, negative = false)
    yield.each do |example|
      str = (negative ? "doesn't match" : "matches")
      it "#{str} #{example}" do
        if negative
          regexp.should_not match(example)
        else
          regexp.should match(example)
        end
      end
    end
  end

  context "CASE INSENSITIVE" do
    context "with irregular verbs" do
      iv = LLT::Constants::RegExps::IRREGULAR_VERBS

      context "with esse" do
        context "in praesens" do
          r = iv[:esse][:praesens].first
          example_loop(r) do
            %w{ sum est es eris sis sunt esto esse absumus desint Sunt }
          end

          example_loop(r, :negative) do
            %w{ et eunt eam eum suo satis rite eas }
          end

          it "returns with correct components - esse" do
            m = r.match("esse")
            m.captures.should == ["", "es", "", "", "se"]
          end

          context "with prefix" do
            it "returns with correct components - desum" do
              m = r.match("desum")
              m.captures.should == ["de", "s", "u", "", "m"]
            end
          end
        end

        context "in perfectum" do
          example_loop(iv[:esse][:perfectum].first) do
            %w{ fuerint fuisse fueras }
          end
        end
      end

      context "with posse" do
        context "in praesens" do
          r = iv[:posse][:praesens].first
          example_loop(r) do
            %w{ possum potest potes poteris possis possunt posse possumus }
          end

          example_loop(r, :negative) do
            %w{ post }
          end

          context "returns with correct components" do
            it "posse" do
              m = r.match("posse")
              m.captures.should == ["", "pos", "", "", "se"]
            end

            it "possent" do
              m = r.match("possent")
              m.captures.should == ["", "pos", "", "se", "nt"]
            end

            it "potest" do
              m = r.match("potest")
              m.captures.should == ["", "potes", "", "", "t"]
            end
          end
        end

        context "in perfectum" do
          example_loop(iv[:posse][:perfectum].first) do
            %w{ potuerint potuisse potueras potuisti potui }
          end
        end
      end

      context "with ferre" do
        context "in praesens" do
          r = iv[:ferre][:praesens].first
          example_loop(r) do
            %w{ fer ferre ferri fero fers fert ferrem feret ferat ferimus feruntur ferunto }
          end

          example_loop(r, :negative) do
            %w{ fere ferus feri }
          end

          context "with verbal nouns" do
            example_loop(iv[:ferre][:praesens][1]) do
              %w{ ferendus ferendi ferendo ferendum ferendorum ferendis ferendos ferende
                  ferenda ferendae ferendarum ferendam ferendas
                  ferens ferentis ferenti ferentem ferente ferentes ferentium ferentibus
                  ferentia ferentium }
            end
          end

          it "returns with correct components - ferre" do
            m = r.match("ferre")
            m.captures.should == ["", "fer", "", "", "re"]
          end
        end

        context "in perfectum" do
          example_loop(iv[:ferre][:perfectum].first) do
            %w{ tulerunt tulerim tulero tulerint tulisse tuleras tulisti tuli
                tulissent intulisset
                contulissent }
          end
        end

        context "in ppp" do
          example_loop(iv[:ferre][:ppp].first) do
            %w{ allatus latus lati lato latum late lata latae latorum latis latarum latos laturas
                laturus laturi laturo laturum lature latura laturae laturorum laturis laturarum laturos latas
                conlatus perlatum inlatam }
          end
        end
      end

      context "with ire" do
        context "in praesens" do
          context "with stem i" do
            r = iv[:ire][:praesens].first
            example_loop(r) do
              %w{ is it imus itis ibo ibis ibunt adiberis ire iri
                  inito subito ito itote irem transiretur }
            end

            example_loop(r, :negative) do
              %w{ iam ibi interim iste ista isto }
            end
          end

          context "with stem e" do
            r = iv[:ire][:praesens][1]
            example_loop(r) do
              %w{ eo eunt eam eas eat eamus eatis eunto subeo obeo }
            end

            example_loop(r, :negative) do
              %w{ eos }
            end
          end

          context "with verbal nouns" do
            example_loop(iv[:ire][:praesens][2]) do
              %w{ eundus abeundus eundi eundo eundum eundorum eundis eundos eunde
                  eunda eundae eundarum eundam eundas
                  iens euntis eunti euntem eunte euntes euntium euntibus
                  euntia euntium }
            end
          end
        end

        context "in perfectum" do
          r = iv[:ire][:perfectum].first
          example_loop(r) do
            %w{ ierunt ierim iero ierint isse ieras isti ii }
          end

          example_loop(r, :negative) do
            %w{ interim }
          end

          context "with queo and nequeo" do
          r = iv[:ire][:perfectum][1]
            example_loop(r) do
              %w{ nequivi quivi nequisse }
            end
          end
        end

        context "in ppp" do
          r = iv[:ire][:ppp].first
          example_loop(r) do
            # ita disabled for convenience reasons...
            %w{ aditus itus iti ito itum ite itae itorum itis itarum itos ituras
                iturus ituri ituro iturum iture itura iturae iturorum ituris iturarum ituros itas
                inita subito inito obitum }
          end

          it "returns with correct components" do
            m = r.match("inito")
            m.captures.should == ["in", "it", "", "o"]
          end
        end
      end

      context "with velle" do
        context "in praesens" do
          r = iv[:velle][:praesens].first
          example_loop(r) do
            %w{ volo vis vult volumus vultis volunt velim velint volam voles volebant velle }
          end
        end

        context "in perfectum" do
          r = iv[:velle][:perfectum].first
          example_loop(r) do
            %w{ volui voluerunt voluisti volueram voluero volueritis voluisse }
          end
        end
      end

      context "with nolle" do
        context "in praesens" do
          r = iv[:nolle][:praesens].first
          example_loop(r) do
            %w{ nolo nolumus nolunt nolim nolint nolam noles nolebant nolle noli nolitote nolite nolito }
          end
        end

        context "in perfectum" do
          r = iv[:nolle][:perfectum].first
          example_loop(r) do
            %w{ nolui noluerunt noluisti nolueram noluero nolueritis noluisse }
          end
        end
      end

      context "with malle" do
        context "in praesens" do
          r = iv[:malle][:praesens].first
          example_loop(r) do
            %w{ malo malumus malunt malim malint malam males malebant malle }
          end
        end

        context "in perfectum" do
          r = iv[:malle][:perfectum].first
          example_loop(r) do
            %w{ malui maluerunt maluisti malueram maluero malueritis maluisse }
          end
        end
      end

      context "with fieri" do
        context "in praesens" do
          r = iv[:fieri][:praesens].first
          example_loop(r) do
            %w{ fio fis fit fimus fitis fiunt fiebam fiam fies fiat fierem fi fite fieri }
          end

          it "returns with correct components" do
            m = r.match("fieri")
            m.captures.should == ["fi", "e", "", "ri"]
          end

          it "returns with correct components" do
            m = r.match("fiebam")
            m.captures.should == ["fi", "e", "ba", "m"]
          end

          it "returns with correct components" do
            m = r.match("fiebat")
            m.captures.should == ["fi", "e", "ba", "t"]
          end
        end
      end

    end

    context "with pronouns" do
      pr = LLT::Constants::RegExps::PRONOUNS

      #qui
      example_loop(pr) do
        %w{ qui cuius cui quem quo qui quorum quibus quos quibus
            quae cuius cui Quam qua quae quarum quibus quas quibus
            quod cuius cui quod quo quae quorum quibus quae quibus
            quibuscum quocum quacum }.uniq
      end

      #quis/quid
      example_loop(pr) do
        %w{ quis quid }
      end

      #quisquam
      example_loop(pr) do
        %w{ quisquam quidquam quicquam }
      end

      #quisquis
      example_loop(pr) do
        %w{ quisquis quidquid quoquo }
      end

      #unusquisque
      example_loop(pr) do
        %w{ unusquisque uniuscuiusque }
      end

      example_loop(pr, :negative) do
        %w{ undique }
      end

      # hic
      example_loop(pr) do
        %w{ hic huius huic hunc hoc hi horum his hos his
            haec Huius huic hanc hac hae harum his has his
            hoc huius huic hoc hoc haec horum his haec his }.uniq
      end

      example_loop(pr, :negative) do
        %w{ hiscum }
      end

      # ipse
      example_loop(pr) do
        %w{ ipse ipsa ipsum ipsis }
      end

      # is
      example_loop(pr) do
        %w{ is ea id eius ei }
      end

      example_loop(pr, :negative) do
        %w{ iam }
      end

      # idem
      example_loop(pr) do
        %w{ idem eadem iisdem isdem }
      end

      # quispiam
      example_loop(pr) do
        %w{ quispiam }
      end

      # aliqui
      example_loop(pr) do
        %w{ aliquo alicuius }
      end

      example_loop(pr, :negative) do
        %w{ aliis aliquibuscum }
      end

      it "matches uterque" do
        pr.should match("uterque")
      end

      example_loop(pr, :negative) do
        %w{ quidem }
      end

      it "has proper captures" do
        pr.match("aliqui").captures.should == ["ali", "qu", "i", nil, nil]
        pr.match("hi")    .captures.should == [nil, "h", "i", nil, nil]
        pr.match("hunc")  .captures.should == [nil, "h", "un", "c", nil]
        pr.match("isdem") .captures.should == [nil, "i", "s",  "dem", nil]
        pr.match("quocum").captures.should == [nil, "qu", "o",  nil, "cum"]
        pr.match("quonam").captures.should == [nil, "qu", "o", "nam", nil]
        pr.match("unusquisque").captures.should == ["unus", "qu", "is", "que", nil]
      end
    end
  end
end
