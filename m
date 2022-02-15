Content-Type: multipart/mixed; boundary="===============3227284070184555781=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/rt5682s.c:2297:40: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Wed, 16 Feb 2022 03:24:04 +0800
Message-ID: <202202160359.tEGxvvjH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3227284070184555781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Derek Fang <derek.fang@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: bdd229ab26be9aa3306d01787e1467db92df6603 ASoC: rt5682s: Add driver =
for ALC5682I-VS codec
date:   5 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 5 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/rt5682s.c:2297:40: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      a_map.m_bp << RT5682S_PLLA_M_BP_SFT |
                                          ^
   sound/soc/codecs/rt5682s.c:2315:44: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      b_map.sel_ps << RT5682S_PLLB_SEL_PS_SFT |
                                              ^
   sound/soc/codecs/rt5682s.c:2316:44: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      b_map.byp_ps << RT5682S_PLLB_BYP_PS_SFT |
                                              ^
   sound/soc/codecs/rt5682s.c:2317:40: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      b_map.m_bp << RT5682S_PLLB_M_BP_SFT |
                                          ^

vim +2297 sound/soc/codecs/rt5682s.c

bdd229ab26be9aa Derek Fang 2021-08-31  2234  =

bdd229ab26be9aa Derek Fang 2021-08-31  2235  static int rt5682s_set_compone=
nt_pll(struct snd_soc_component *component,
bdd229ab26be9aa Derek Fang 2021-08-31  2236  		int pll_id, int source, unsi=
gned int freq_in,
bdd229ab26be9aa Derek Fang 2021-08-31  2237  		unsigned int freq_out)
bdd229ab26be9aa Derek Fang 2021-08-31  2238  {
bdd229ab26be9aa Derek Fang 2021-08-31  2239  	struct rt5682s_priv *rt5682s =
=3D snd_soc_component_get_drvdata(component);
bdd229ab26be9aa Derek Fang 2021-08-31  2240  	struct pll_calc_map a_map, b_=
map;
bdd229ab26be9aa Derek Fang 2021-08-31  2241  =

bdd229ab26be9aa Derek Fang 2021-08-31  2242  	if (source =3D=3D rt5682s->pl=
l_src[pll_id] && freq_in =3D=3D rt5682s->pll_in[pll_id] &&
bdd229ab26be9aa Derek Fang 2021-08-31  2243  	    freq_out =3D=3D rt5682s->=
pll_out[pll_id])
bdd229ab26be9aa Derek Fang 2021-08-31  2244  		return 0;
bdd229ab26be9aa Derek Fang 2021-08-31  2245  =

bdd229ab26be9aa Derek Fang 2021-08-31  2246  	if (!freq_in || !freq_out) {
bdd229ab26be9aa Derek Fang 2021-08-31  2247  		dev_dbg(component->dev, "PLL=
 disabled\n");
bdd229ab26be9aa Derek Fang 2021-08-31  2248  		rt5682s->pll_in[pll_id] =3D =
0;
bdd229ab26be9aa Derek Fang 2021-08-31  2249  		rt5682s->pll_out[pll_id] =3D=
 0;
bdd229ab26be9aa Derek Fang 2021-08-31  2250  		snd_soc_component_update_bit=
s(component, RT5682S_GLB_CLK,
bdd229ab26be9aa Derek Fang 2021-08-31  2251  			RT5682S_SCLK_SRC_MASK, RT56=
82S_CLK_SRC_MCLK << RT5682S_SCLK_SRC_SFT);
bdd229ab26be9aa Derek Fang 2021-08-31  2252  		return 0;
bdd229ab26be9aa Derek Fang 2021-08-31  2253  	}
bdd229ab26be9aa Derek Fang 2021-08-31  2254  =

bdd229ab26be9aa Derek Fang 2021-08-31  2255  	switch (source) {
bdd229ab26be9aa Derek Fang 2021-08-31  2256  	case RT5682S_PLL_S_MCLK:
bdd229ab26be9aa Derek Fang 2021-08-31  2257  		snd_soc_component_update_bit=
s(component, RT5682S_GLB_CLK,
bdd229ab26be9aa Derek Fang 2021-08-31  2258  			RT5682S_PLL_SRC_MASK, RT568=
2S_PLL_SRC_MCLK);
bdd229ab26be9aa Derek Fang 2021-08-31  2259  		break;
bdd229ab26be9aa Derek Fang 2021-08-31  2260  	case RT5682S_PLL_S_BCLK1:
bdd229ab26be9aa Derek Fang 2021-08-31  2261  		snd_soc_component_update_bit=
s(component, RT5682S_GLB_CLK,
bdd229ab26be9aa Derek Fang 2021-08-31  2262  			RT5682S_PLL_SRC_MASK, RT568=
2S_PLL_SRC_BCLK1);
bdd229ab26be9aa Derek Fang 2021-08-31  2263  		break;
bdd229ab26be9aa Derek Fang 2021-08-31  2264  	default:
bdd229ab26be9aa Derek Fang 2021-08-31  2265  		dev_err(component->dev, "Unk=
nown PLL Source %d\n", source);
bdd229ab26be9aa Derek Fang 2021-08-31  2266  		return -EINVAL;
bdd229ab26be9aa Derek Fang 2021-08-31  2267  	}
bdd229ab26be9aa Derek Fang 2021-08-31  2268  =

bdd229ab26be9aa Derek Fang 2021-08-31  2269  	rt5682s->pll_comb =3D find_pl=
l_inter_combination(freq_in, freq_out,
bdd229ab26be9aa Derek Fang 2021-08-31  2270  							&a_map, &b_map);
bdd229ab26be9aa Derek Fang 2021-08-31  2271  =

bdd229ab26be9aa Derek Fang 2021-08-31  2272  	if ((pll_id =3D=3D RT5682S_PL=
L1 && rt5682s->pll_comb =3D=3D USE_PLLA) ||
bdd229ab26be9aa Derek Fang 2021-08-31  2273  	    (pll_id =3D=3D RT5682S_PL=
L2 && (rt5682s->pll_comb =3D=3D USE_PLLB ||
bdd229ab26be9aa Derek Fang 2021-08-31  2274  					rt5682s->pll_comb =3D=3D =
USE_PLLAB))) {
bdd229ab26be9aa Derek Fang 2021-08-31  2275  		dev_dbg(component->dev,
bdd229ab26be9aa Derek Fang 2021-08-31  2276  			"Supported freq conversion =
for PLL%d:(%d->%d): %d\n",
bdd229ab26be9aa Derek Fang 2021-08-31  2277  			pll_id + 1, freq_in, freq_o=
ut, rt5682s->pll_comb);
bdd229ab26be9aa Derek Fang 2021-08-31  2278  	} else {
bdd229ab26be9aa Derek Fang 2021-08-31  2279  		dev_err(component->dev,
bdd229ab26be9aa Derek Fang 2021-08-31  2280  			"Unsupported freq conversio=
n for PLL%d:(%d->%d): %d\n",
bdd229ab26be9aa Derek Fang 2021-08-31  2281  			pll_id + 1, freq_in, freq_o=
ut, rt5682s->pll_comb);
bdd229ab26be9aa Derek Fang 2021-08-31  2282  		return -EINVAL;
bdd229ab26be9aa Derek Fang 2021-08-31  2283  	}
bdd229ab26be9aa Derek Fang 2021-08-31  2284  =

bdd229ab26be9aa Derek Fang 2021-08-31  2285  	if (rt5682s->pll_comb =3D=3D =
USE_PLLA || rt5682s->pll_comb =3D=3D USE_PLLAB) {
bdd229ab26be9aa Derek Fang 2021-08-31  2286  		dev_dbg(component->dev,
bdd229ab26be9aa Derek Fang 2021-08-31  2287  			"PLLA: fin=3D%d fout=3D%d m=
_bp=3D%d k_bp=3D%d m=3D%d n=3D%d k=3D%d\n",
bdd229ab26be9aa Derek Fang 2021-08-31  2288  			a_map.freq_in, a_map.freq_o=
ut, a_map.m_bp, a_map.k_bp,
bdd229ab26be9aa Derek Fang 2021-08-31  2289  			(a_map.m_bp ? 0 : a_map.m),=
 a_map.n, (a_map.k_bp ? 0 : a_map.k));
bdd229ab26be9aa Derek Fang 2021-08-31  2290  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_1,
bdd229ab26be9aa Derek Fang 2021-08-31  2291  			RT5682S_PLLA_N_MASK, a_map.=
n);
bdd229ab26be9aa Derek Fang 2021-08-31  2292  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_2,
bdd229ab26be9aa Derek Fang 2021-08-31  2293  			RT5682S_PLLA_M_MASK | RT568=
2S_PLLA_K_MASK,
bdd229ab26be9aa Derek Fang 2021-08-31  2294  			a_map.m << RT5682S_PLLA_M_S=
FT | a_map.k);
bdd229ab26be9aa Derek Fang 2021-08-31  2295  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_6,
bdd229ab26be9aa Derek Fang 2021-08-31  2296  			RT5682S_PLLA_M_BP_MASK | RT=
5682S_PLLA_K_BP_MASK,
bdd229ab26be9aa Derek Fang 2021-08-31 @2297  			a_map.m_bp << RT5682S_PLLA_=
M_BP_SFT |
bdd229ab26be9aa Derek Fang 2021-08-31  2298  			a_map.k_bp << RT5682S_PLLA_=
K_BP_SFT);
bdd229ab26be9aa Derek Fang 2021-08-31  2299  	}
bdd229ab26be9aa Derek Fang 2021-08-31  2300  =

bdd229ab26be9aa Derek Fang 2021-08-31  2301  	if (rt5682s->pll_comb =3D=3D =
USE_PLLB || rt5682s->pll_comb =3D=3D USE_PLLAB) {
bdd229ab26be9aa Derek Fang 2021-08-31  2302  		dev_dbg(component->dev,
bdd229ab26be9aa Derek Fang 2021-08-31  2303  			"PLLB: fin=3D%d fout=3D%d m=
_bp=3D%d k_bp=3D%d m=3D%d n=3D%d k=3D%d byp_ps=3D%d sel_ps=3D%d\n",
bdd229ab26be9aa Derek Fang 2021-08-31  2304  			b_map.freq_in, b_map.freq_o=
ut, b_map.m_bp, b_map.k_bp,
bdd229ab26be9aa Derek Fang 2021-08-31  2305  			(b_map.m_bp ? 0 : b_map.m),=
 b_map.n, (b_map.k_bp ? 0 : b_map.k),
bdd229ab26be9aa Derek Fang 2021-08-31  2306  			b_map.byp_ps, b_map.sel_ps);
bdd229ab26be9aa Derek Fang 2021-08-31  2307  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_3,
bdd229ab26be9aa Derek Fang 2021-08-31  2308  			RT5682S_PLLB_N_MASK, b_map.=
n);
bdd229ab26be9aa Derek Fang 2021-08-31  2309  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_4,
bdd229ab26be9aa Derek Fang 2021-08-31  2310  			RT5682S_PLLB_M_MASK | RT568=
2S_PLLB_K_MASK,
bdd229ab26be9aa Derek Fang 2021-08-31  2311  			b_map.m << RT5682S_PLLB_M_S=
FT | b_map.k);
bdd229ab26be9aa Derek Fang 2021-08-31  2312  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_6,
bdd229ab26be9aa Derek Fang 2021-08-31  2313  			RT5682S_PLLB_SEL_PS_MASK | =
RT5682S_PLLB_BYP_PS_MASK |
bdd229ab26be9aa Derek Fang 2021-08-31  2314  			RT5682S_PLLB_M_BP_MASK | RT=
5682S_PLLB_K_BP_MASK,
bdd229ab26be9aa Derek Fang 2021-08-31  2315  			b_map.sel_ps << RT5682S_PLL=
B_SEL_PS_SFT |
bdd229ab26be9aa Derek Fang 2021-08-31  2316  			b_map.byp_ps << RT5682S_PLL=
B_BYP_PS_SFT |
bdd229ab26be9aa Derek Fang 2021-08-31  2317  			b_map.m_bp << RT5682S_PLLB_=
M_BP_SFT |
bdd229ab26be9aa Derek Fang 2021-08-31  2318  			b_map.k_bp << RT5682S_PLLB_=
K_BP_SFT);
bdd229ab26be9aa Derek Fang 2021-08-31  2319  	}
bdd229ab26be9aa Derek Fang 2021-08-31  2320  =

bdd229ab26be9aa Derek Fang 2021-08-31  2321  	if (rt5682s->pll_comb =3D=3D =
USE_PLLB)
bdd229ab26be9aa Derek Fang 2021-08-31  2322  		snd_soc_component_update_bit=
s(component, RT5682S_PLL_CTRL_7,
bdd229ab26be9aa Derek Fang 2021-08-31  2323  			RT5682S_PLLB_SRC_MASK, RT56=
82S_PLLB_SRC_DFIN);
bdd229ab26be9aa Derek Fang 2021-08-31  2324  =

bdd229ab26be9aa Derek Fang 2021-08-31  2325  	rt5682s->pll_in[pll_id] =3D f=
req_in;
bdd229ab26be9aa Derek Fang 2021-08-31  2326  	rt5682s->pll_out[pll_id] =3D =
freq_out;
bdd229ab26be9aa Derek Fang 2021-08-31  2327  	rt5682s->pll_src[pll_id] =3D =
source;
bdd229ab26be9aa Derek Fang 2021-08-31  2328  =

bdd229ab26be9aa Derek Fang 2021-08-31  2329  	return 0;
bdd229ab26be9aa Derek Fang 2021-08-31  2330  }
bdd229ab26be9aa Derek Fang 2021-08-31  2331  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3227284070184555781==--

