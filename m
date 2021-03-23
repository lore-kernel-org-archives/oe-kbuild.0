Content-Type: multipart/mixed; boundary="===============5974481581867134840=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4880/6512] sound/soc/codecs/rt1019.c:707:61: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Tue, 23 Mar 2021 23:18:45 +0800
Message-ID: <202103232333.svdnSFYq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5974481581867134840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jack Yu <jack.yu@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d949689e7383cd5271470f2b99dbe2fd3199bffd
commit: 7ec79d3850d0cb6dc52e6aa472886ab3adf15863 [4880/6512] ASoC: rt1019: =
add rt1019 amplifier driver
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> sound/soc/codecs/wm2200.c:1905:25: warning: Uninitialized variable: frat=
io [uninitvar]
    fll_div->n =3D target / (fratio * Fref);
                           ^
--
>> sound/soc/codecs/wm8996.c:1979:25: warning: Uninitialized variable: frat=
io [uninitvar]
    fll_div->n =3D target / (fratio * Fref);
                           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/rt1019.c:707:61: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     (pll_code.m_bp ? 0 : pll_code.m_code) << RT1019_PLL_M_SFT |
                                                               ^
>> sound/soc/codecs/rt5677.c:4750:9: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
      (0x2 | !!value) << (offset * 3 + 1));
           ^
   sound/soc/codecs/rt5677.c:4756:25: warning: Boolean result is used in bi=
twise operation. Clarify expression with parentheses. [clarifyCondition]
      RT5677_GPIO6_DIR_OUT | !!value << RT5677_GPIO6_OUT_SFT);
                           ^
--

vim +707 sound/soc/codecs/rt1019.c

7ec79d3850d0cb Jack Yu 2021-03-11  656  =

7ec79d3850d0cb Jack Yu 2021-03-11  657  static int rt1019_set_dai_pll(struc=
t snd_soc_dai *dai, int pll_id, int source,
7ec79d3850d0cb Jack Yu 2021-03-11  658  			unsigned int freq_in, unsigned i=
nt freq_out)
7ec79d3850d0cb Jack Yu 2021-03-11  659  {
7ec79d3850d0cb Jack Yu 2021-03-11  660  	struct snd_soc_component *componen=
t =3D dai->component;
7ec79d3850d0cb Jack Yu 2021-03-11  661  	struct rt1019_priv *rt1019 =3D snd=
_soc_component_get_drvdata(component);
7ec79d3850d0cb Jack Yu 2021-03-11  662  	struct rl6231_pll_code pll_code;
7ec79d3850d0cb Jack Yu 2021-03-11  663  	int ret;
7ec79d3850d0cb Jack Yu 2021-03-11  664  =

7ec79d3850d0cb Jack Yu 2021-03-11  665  	if (!freq_in || !freq_out) {
7ec79d3850d0cb Jack Yu 2021-03-11  666  		dev_dbg(component->dev, "PLL disa=
bled\n");
7ec79d3850d0cb Jack Yu 2021-03-11  667  		rt1019->pll_in =3D 0;
7ec79d3850d0cb Jack Yu 2021-03-11  668  		rt1019->pll_out =3D 0;
7ec79d3850d0cb Jack Yu 2021-03-11  669  		return 0;
7ec79d3850d0cb Jack Yu 2021-03-11  670  	}
7ec79d3850d0cb Jack Yu 2021-03-11  671  =

7ec79d3850d0cb Jack Yu 2021-03-11  672  	if (source =3D=3D rt1019->pll_src =
&& freq_in =3D=3D rt1019->pll_in &&
7ec79d3850d0cb Jack Yu 2021-03-11  673  		freq_out =3D=3D rt1019->pll_out)
7ec79d3850d0cb Jack Yu 2021-03-11  674  		return 0;
7ec79d3850d0cb Jack Yu 2021-03-11  675  =

7ec79d3850d0cb Jack Yu 2021-03-11  676  	switch (source) {
7ec79d3850d0cb Jack Yu 2021-03-11  677  	case RT1019_PLL_S_BCLK:
7ec79d3850d0cb Jack Yu 2021-03-11  678  		snd_soc_component_update_bits(com=
ponent, RT1019_CLK_TREE_1,
7ec79d3850d0cb Jack Yu 2021-03-11  679  			RT1019_PLL_SRC_MASK, RT1019_PLL_=
SRC_SEL_BCLK);
7ec79d3850d0cb Jack Yu 2021-03-11  680  		break;
7ec79d3850d0cb Jack Yu 2021-03-11  681  =

7ec79d3850d0cb Jack Yu 2021-03-11  682  	case RT1019_PLL_S_RC25M:
7ec79d3850d0cb Jack Yu 2021-03-11  683  		snd_soc_component_update_bits(com=
ponent, RT1019_CLK_TREE_1,
7ec79d3850d0cb Jack Yu 2021-03-11  684  			RT1019_PLL_SRC_MASK, RT1019_PLL_=
SRC_SEL_RC);
7ec79d3850d0cb Jack Yu 2021-03-11  685  		break;
7ec79d3850d0cb Jack Yu 2021-03-11  686  =

7ec79d3850d0cb Jack Yu 2021-03-11  687  	default:
7ec79d3850d0cb Jack Yu 2021-03-11  688  		dev_err(component->dev, "Unknown =
PLL source %d\n", source);
7ec79d3850d0cb Jack Yu 2021-03-11  689  		return -EINVAL;
7ec79d3850d0cb Jack Yu 2021-03-11  690  	}
7ec79d3850d0cb Jack Yu 2021-03-11  691  =

7ec79d3850d0cb Jack Yu 2021-03-11  692  	ret =3D rl6231_pll_calc(freq_in, f=
req_out, &pll_code);
7ec79d3850d0cb Jack Yu 2021-03-11  693  	if (ret < 0) {
7ec79d3850d0cb Jack Yu 2021-03-11  694  		dev_err(component->dev, "Unsuppor=
t input clock %d\n", freq_in);
7ec79d3850d0cb Jack Yu 2021-03-11  695  		return ret;
7ec79d3850d0cb Jack Yu 2021-03-11  696  	}
7ec79d3850d0cb Jack Yu 2021-03-11  697  =

7ec79d3850d0cb Jack Yu 2021-03-11  698  	dev_dbg(component->dev, "bypass=3D=
%d m=3D%d n=3D%d k=3D%d\n",
7ec79d3850d0cb Jack Yu 2021-03-11  699  		pll_code.m_bp, (pll_code.m_bp ? 0=
 : pll_code.m_code),
7ec79d3850d0cb Jack Yu 2021-03-11  700  		pll_code.n_code, pll_code.k_code);
7ec79d3850d0cb Jack Yu 2021-03-11  701  =

7ec79d3850d0cb Jack Yu 2021-03-11  702  	snd_soc_component_update_bits(comp=
onent, RT1019_PWR_STRP_2,
7ec79d3850d0cb Jack Yu 2021-03-11  703  		RT1019_AUTO_BITS_SEL_MASK | RT101=
9_AUTO_CLK_SEL_MASK,
7ec79d3850d0cb Jack Yu 2021-03-11  704  		RT1019_AUTO_BITS_SEL_MANU | RT101=
9_AUTO_CLK_SEL_MANU);
7ec79d3850d0cb Jack Yu 2021-03-11  705  	snd_soc_component_update_bits(comp=
onent, RT1019_PLL_1,
7ec79d3850d0cb Jack Yu 2021-03-11  706  		RT1019_PLL_M_MASK | RT1019_PLL_M_=
BP_MASK | RT1019_PLL_Q_8_8_MASK,
7ec79d3850d0cb Jack Yu 2021-03-11 @707  		(pll_code.m_bp ? 0 : pll_code.m_c=
ode) << RT1019_PLL_M_SFT |
7ec79d3850d0cb Jack Yu 2021-03-11  708  		pll_code.m_bp << RT1019_PLL_M_BP_=
SFT |
7ec79d3850d0cb Jack Yu 2021-03-11  709  		((pll_code.n_code >> 8) & RT1019_=
PLL_Q_8_8_MASK));
7ec79d3850d0cb Jack Yu 2021-03-11  710  	snd_soc_component_update_bits(comp=
onent, RT1019_PLL_2,
7ec79d3850d0cb Jack Yu 2021-03-11  711  		RT1019_PLL_Q_7_0_MASK, pll_code.n=
_code & RT1019_PLL_Q_7_0_MASK);
7ec79d3850d0cb Jack Yu 2021-03-11  712  	snd_soc_component_update_bits(comp=
onent, RT1019_PLL_3,
7ec79d3850d0cb Jack Yu 2021-03-11  713  		RT1019_PLL_K_MASK, pll_code.k_cod=
e);
7ec79d3850d0cb Jack Yu 2021-03-11  714  =

7ec79d3850d0cb Jack Yu 2021-03-11  715  	rt1019->pll_in =3D freq_in;
7ec79d3850d0cb Jack Yu 2021-03-11  716  	rt1019->pll_out =3D freq_out;
7ec79d3850d0cb Jack Yu 2021-03-11  717  	rt1019->pll_src =3D source;
7ec79d3850d0cb Jack Yu 2021-03-11  718  =

7ec79d3850d0cb Jack Yu 2021-03-11  719  	return 0;
7ec79d3850d0cb Jack Yu 2021-03-11  720  }
7ec79d3850d0cb Jack Yu 2021-03-11  721  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5974481581867134840==--

