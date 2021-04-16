Content-Type: multipart/mixed; boundary="===============4386795464943825113=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 2/20] sound/soc/codecs/rt1019.c:707:61: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Fri, 16 Apr 2021 21:15:58 +0800
Message-ID: <202104162152.XNEWcU9K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4386795464943825113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   da6ace963d422d19dd6b4f60c434546bea2f1257
commit: 814d7c1ba36c1d32a34d7591f4009463e8958148 [2/20] FROMGIT: ASoC: rt10=
19: add rt1019 amplifier driver
:::::: branch date: 6 hours ago
:::::: commit date: 28 hours ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/rt1019.c:707:61: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     (pll_code.m_bp ? 0 : pll_code.m_code) << RT1019_PLL_M_SFT |
                                                               ^

vim +707 sound/soc/codecs/rt1019.c

814d7c1ba36c1d Jack Yu 2021-03-11  656  =

814d7c1ba36c1d Jack Yu 2021-03-11  657  static int rt1019_set_dai_pll(struc=
t snd_soc_dai *dai, int pll_id, int source,
814d7c1ba36c1d Jack Yu 2021-03-11  658  			unsigned int freq_in, unsigned i=
nt freq_out)
814d7c1ba36c1d Jack Yu 2021-03-11  659  {
814d7c1ba36c1d Jack Yu 2021-03-11  660  	struct snd_soc_component *componen=
t =3D dai->component;
814d7c1ba36c1d Jack Yu 2021-03-11  661  	struct rt1019_priv *rt1019 =3D snd=
_soc_component_get_drvdata(component);
814d7c1ba36c1d Jack Yu 2021-03-11  662  	struct rl6231_pll_code pll_code;
814d7c1ba36c1d Jack Yu 2021-03-11  663  	int ret;
814d7c1ba36c1d Jack Yu 2021-03-11  664  =

814d7c1ba36c1d Jack Yu 2021-03-11  665  	if (!freq_in || !freq_out) {
814d7c1ba36c1d Jack Yu 2021-03-11  666  		dev_dbg(component->dev, "PLL disa=
bled\n");
814d7c1ba36c1d Jack Yu 2021-03-11  667  		rt1019->pll_in =3D 0;
814d7c1ba36c1d Jack Yu 2021-03-11  668  		rt1019->pll_out =3D 0;
814d7c1ba36c1d Jack Yu 2021-03-11  669  		return 0;
814d7c1ba36c1d Jack Yu 2021-03-11  670  	}
814d7c1ba36c1d Jack Yu 2021-03-11  671  =

814d7c1ba36c1d Jack Yu 2021-03-11  672  	if (source =3D=3D rt1019->pll_src =
&& freq_in =3D=3D rt1019->pll_in &&
814d7c1ba36c1d Jack Yu 2021-03-11  673  		freq_out =3D=3D rt1019->pll_out)
814d7c1ba36c1d Jack Yu 2021-03-11  674  		return 0;
814d7c1ba36c1d Jack Yu 2021-03-11  675  =

814d7c1ba36c1d Jack Yu 2021-03-11  676  	switch (source) {
814d7c1ba36c1d Jack Yu 2021-03-11  677  	case RT1019_PLL_S_BCLK:
814d7c1ba36c1d Jack Yu 2021-03-11  678  		snd_soc_component_update_bits(com=
ponent, RT1019_CLK_TREE_1,
814d7c1ba36c1d Jack Yu 2021-03-11  679  			RT1019_PLL_SRC_MASK, RT1019_PLL_=
SRC_SEL_BCLK);
814d7c1ba36c1d Jack Yu 2021-03-11  680  		break;
814d7c1ba36c1d Jack Yu 2021-03-11  681  =

814d7c1ba36c1d Jack Yu 2021-03-11  682  	case RT1019_PLL_S_RC25M:
814d7c1ba36c1d Jack Yu 2021-03-11  683  		snd_soc_component_update_bits(com=
ponent, RT1019_CLK_TREE_1,
814d7c1ba36c1d Jack Yu 2021-03-11  684  			RT1019_PLL_SRC_MASK, RT1019_PLL_=
SRC_SEL_RC);
814d7c1ba36c1d Jack Yu 2021-03-11  685  		break;
814d7c1ba36c1d Jack Yu 2021-03-11  686  =

814d7c1ba36c1d Jack Yu 2021-03-11  687  	default:
814d7c1ba36c1d Jack Yu 2021-03-11  688  		dev_err(component->dev, "Unknown =
PLL source %d\n", source);
814d7c1ba36c1d Jack Yu 2021-03-11  689  		return -EINVAL;
814d7c1ba36c1d Jack Yu 2021-03-11  690  	}
814d7c1ba36c1d Jack Yu 2021-03-11  691  =

814d7c1ba36c1d Jack Yu 2021-03-11  692  	ret =3D rl6231_pll_calc(freq_in, f=
req_out, &pll_code);
814d7c1ba36c1d Jack Yu 2021-03-11  693  	if (ret < 0) {
814d7c1ba36c1d Jack Yu 2021-03-11  694  		dev_err(component->dev, "Unsuppor=
t input clock %d\n", freq_in);
814d7c1ba36c1d Jack Yu 2021-03-11  695  		return ret;
814d7c1ba36c1d Jack Yu 2021-03-11  696  	}
814d7c1ba36c1d Jack Yu 2021-03-11  697  =

814d7c1ba36c1d Jack Yu 2021-03-11  698  	dev_dbg(component->dev, "bypass=3D=
%d m=3D%d n=3D%d k=3D%d\n",
814d7c1ba36c1d Jack Yu 2021-03-11  699  		pll_code.m_bp, (pll_code.m_bp ? 0=
 : pll_code.m_code),
814d7c1ba36c1d Jack Yu 2021-03-11  700  		pll_code.n_code, pll_code.k_code);
814d7c1ba36c1d Jack Yu 2021-03-11  701  =

814d7c1ba36c1d Jack Yu 2021-03-11  702  	snd_soc_component_update_bits(comp=
onent, RT1019_PWR_STRP_2,
814d7c1ba36c1d Jack Yu 2021-03-11  703  		RT1019_AUTO_BITS_SEL_MASK | RT101=
9_AUTO_CLK_SEL_MASK,
814d7c1ba36c1d Jack Yu 2021-03-11  704  		RT1019_AUTO_BITS_SEL_MANU | RT101=
9_AUTO_CLK_SEL_MANU);
814d7c1ba36c1d Jack Yu 2021-03-11  705  	snd_soc_component_update_bits(comp=
onent, RT1019_PLL_1,
814d7c1ba36c1d Jack Yu 2021-03-11  706  		RT1019_PLL_M_MASK | RT1019_PLL_M_=
BP_MASK | RT1019_PLL_Q_8_8_MASK,
814d7c1ba36c1d Jack Yu 2021-03-11 @707  		(pll_code.m_bp ? 0 : pll_code.m_c=
ode) << RT1019_PLL_M_SFT |
814d7c1ba36c1d Jack Yu 2021-03-11  708  		pll_code.m_bp << RT1019_PLL_M_BP_=
SFT |
814d7c1ba36c1d Jack Yu 2021-03-11  709  		((pll_code.n_code >> 8) & RT1019_=
PLL_Q_8_8_MASK));
814d7c1ba36c1d Jack Yu 2021-03-11  710  	snd_soc_component_update_bits(comp=
onent, RT1019_PLL_2,
814d7c1ba36c1d Jack Yu 2021-03-11  711  		RT1019_PLL_Q_7_0_MASK, pll_code.n=
_code & RT1019_PLL_Q_7_0_MASK);
814d7c1ba36c1d Jack Yu 2021-03-11  712  	snd_soc_component_update_bits(comp=
onent, RT1019_PLL_3,
814d7c1ba36c1d Jack Yu 2021-03-11  713  		RT1019_PLL_K_MASK, pll_code.k_cod=
e);
814d7c1ba36c1d Jack Yu 2021-03-11  714  =

814d7c1ba36c1d Jack Yu 2021-03-11  715  	rt1019->pll_in =3D freq_in;
814d7c1ba36c1d Jack Yu 2021-03-11  716  	rt1019->pll_out =3D freq_out;
814d7c1ba36c1d Jack Yu 2021-03-11  717  	rt1019->pll_src =3D source;
814d7c1ba36c1d Jack Yu 2021-03-11  718  =

814d7c1ba36c1d Jack Yu 2021-03-11  719  	return 0;
814d7c1ba36c1d Jack Yu 2021-03-11  720  }
814d7c1ba36c1d Jack Yu 2021-03-11  721  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4386795464943825113==--

