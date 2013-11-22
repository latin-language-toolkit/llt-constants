module LLT
  module Constants
    module RegExps
      IRREGULAR_VERBS = {
        esse: { praesens: [
          /^(?<prefix>|ab|ad|de|in|inter|ob|prae|super|prod?)
            (?<stem>e?s|er)
            (?<thematic>(?<=[rs])u|(?<=r)i|)
            (?<extension>se(?=\w+)|(?<=s)i|(?<=r)a|)
            (?<ending>(?<!u)o|m|s|(?<!^e)t|mus|tis|nto?|te|to|tote|se|)$/xi ],
                perfectum: [
          /^(?<prefix>|ab?|ad|af|de|inter|ob|of|prae|super|pro)
            (?<stem>fu)
            (?<extension>isse|era|eri?|)
            (?<ending>o|m|s|t|mus|tis|nt|i|isti|it|imus|istis|erunt|isse)$/xi ]
              },

        posse: { praesens: [
          /^(?<prefix>)
            (?<stem>pote[sr]|poss?)
            (?<thematic>(?<=[rs])u|(?<=r)i|)
            (?<extension>se(?=.+)|(?<=s)i|(?<=r)a|)
            (?<ending>o|m|s|(?<!^pos)t|mus|tis|nt|se|)$/xi ],
                 perfectum: [
          /^(?<prefix>)
            (?<stem>potu)
            (?<extension>isse|era|eri?|)
            (?<ending>o|m|s|t|mus|tis|nt|i|isti|it|imus|istis|erunt|isse)$/xi ]
               },

        ferre: { praesens: [
          /^(?<prefix>|a[df]|au|con|de|dif|ef|in|of|per|prae|pro|re|trans)
            (?<stem>fer)
            (?<thematic>|e(?=ba)|i(?=.+)|u(?=nt))
            (?<extension>|e(?=\w+)|ba|a|re(?=.+))
            (?<ending>m|o|s|te?o?|tote|mu[rs]|tis|nto?|o?r|ris|n?tur|mini|r[ie]|)$/xi,

          /^(?<prefix>|a[df]|au|con|de|dif|ef|in|of|per|prae|pro|re|trans)
            (?<stem>fer)
            (?<thematic>e|u)
            (?<extension>nt?|nd)
            (?<ending>s|is|i|em|e|es|ium|ibus|ia|us|o|um|[oa]rum|is|os|a|ae|am|as)$/xi
               ],
                 perfectum: [
          /^(?<prefix>|ab?|ad|at|af|con|de|in|inter|ob|of|per|prae|super|pro)
            (?<stem>tul)
            (?<extension>isse|era|eri?|)
            (?<ending>o|m|s|t|mus|tis|nt|i|isti|it|imus|istis|erunt|isse)$/xi ],
                 ppp: [
          /^(?<prefix>|ab?|ad|at|af|al|con|de|in|inter|ob|of|per|prae|super|pro)
            (?<stem>lat)
            (?<extensiodn>ur|)
            (?<ending>us|i|o|um|e|[oa]rum|is|os|a|ae|am|as)$/xi ],
               },

        ire:   { praesens: [
          # prefix ven deleted due to its conflicting behavior with venio
          /^(?<prefix>|ab|ex|red|inter|ob|per|ad|in|sub|praeter|circum|trans)
            (?<stem>i)
            (?<extension>|ba?|re)
            (?<thematic>|(?<=b)[ei]|(?<=b)u(?!s))
            (?<ending>(?<!i)m|o|s|te?o?|tote|mu[rs]|nto?|r|ris|n?tur|mini|tis|re|ri)$/xi ,

          /^(?<prefix>|ab|ex|red|inter|ob|per|ad|in|sub|praeter|circum|trans)
            (?<stem>e)
            (?<extension>|a)
            (?<thematic>|u)
            (?<ending>(?<!u)m|or?|s|(?<!e)t|mu[rs]|tis|nto?|re|r|ris|n?tur|mini)$/xi,

          /^(?<prefix>|ab|ex|red|inter|per|ob|ad|in|sub|praeter|circum|trans)
            (?<stem>e(?=u)|i(?=ens))
            (?<thematic>e|u)
            (?<extension>nt?|nd)
            (?<ending>s|is|i|em|e|es|ium|ibus|ia|us|o|um|[oa]rum|is|os|a|ae|am|as)$/xi
            ],
                 perfectum: [
          /^(?<prefix>|ab|ex|red|inter|per|ob|ad|in|sub|praeter|circum|trans)
            (?<stem>i)
            (?<extension>|er[aiu]?|sse)
            (?<ending>(?<!interi)m|o|s|t|i?mus|i|s?tis?|it|erunt|sse|nt)$/xi,

          /^(?<prefix>qu|nequ)
            (?<stem>iv?)
            (?<extension>|sse|er[aiu]?|)
            (?<ending>m|o|s|t|mus|tis|nt|it?|s?tis?|erunt|sse)$/xi,
            ],
                 ppp: [
          # ending a taken out - we don't want the clash with ita for now (itura still working)
          /^(?<prefix>|ab|ex|red|inter|per|ad|ob|in|sub|praeter|circum|trans)
            (?<stem>it)
            (?<extension>ur|)
            (?<ending>us|i|o|um|e|[oa]rum|is|os|(?<!it)a|(?<=init)a|ae|am|as)$/xi ]
               },

        velle: { praesens: [
          /^(?<stem>v[eou]l|vi)
            (?<thematic>|e|u(?=[nm]))
            (?<extension>|i|a|e|ba|le)
            (?<ending>o|m|s|t|mus|tis|nt|le)$/xi,
               ],
                 perfectum: [
          /^(?<stem>volu)
            (?<extension>|er|er[aio]|isse)
            (?<ending>i|istis?|it|imus|erunt|isse|o|m|s|t|mus|tis|nt)$/xi,
            ],
               },

        nolle: { praesens: [
          /^(?<stem>nol)
            (?<thematic>|e|u(?=[mn])|i(?=t))
            (?<extension>|i|a|e|ba|le)
            (?<ending>o|m|s|t|mus|tis|nt|le|i|te|tote|to)$/xi,
            ],
                 perfectum: [
          /^(?<stem>nolu)
            (?<extension>|er|er[aio]|isse)
            (?<ending>i|istis?|it|imus|erunt|isse|o|m|s|t|mus|tis|nt)$/xi,
            ]},

        malle: { praesens: [
          /^(?<stem>mal|mavi|mavul)
            (?<thematic>|e|u(?=[mn]))
            (?<extension>|i|a|e|ba|le)
            (?<ending>o|m|s|t|mus|tis|nt|le)$/xi,
            ],
                 perfectum: [
          /^(?<stem>malu)
            (?<extension>|er|er[aio]|isse)
            (?<ending>i|istis?|it|imus|erunt|isse|o|m|s|t|mus|tis|nt)$/xi,
            ]},

        edere: { praesens: [],
                 perfectum: []},

        fieri: { praesens: [
          /^(?<stem>fi)
            (?<thematic>|e(?=[rb])|u(?=n))
            (?<extension>a|e(?!r)|re|ba|)
            (?<ending>o|m|s|t|mus|tis|nt|te|ri|)$/xi
            ],
                },
      }

      PRONOUNS = /^(?<prefixed_particle>ali(?=c|q)|un[aiou].*?(?=[cq]u))?
                   (?<stem>qu|hu?|cu|ill|ist|ips|i(?!am$)|e|ute?r)
                   (?<ending>e|s|ius|i|[uae]m|[au]n|[aoi]s|ibus|ae?|o|[oa]ru[nm]|i[dc]|[ou]?d|)
                   (?<particle>c|dam|(?<!qui)dem|que|cumque|piam|libet|vis|quam|piam|nam|quid|\k<stem>\k<ending>)?
                   (?<suffix>(?<=^quo|^qua|^quibus)cum)?$/xi
    end
  end
end
