Content-Type: multipart/mixed; boundary="===============6563306614504221401=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 52/68] sound/soc/codecs/rt5682s.c:2297:40: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Sun, 19 Sep 2021 22:37:21 +0800
Message-ID: <202109192218.xeLdESyn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6563306614504221401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   ac888fed7b09e9df29efffe569f7ee30c4502344
commit: 3325c135c3b981118ca0c7214415d9ae50bac4ca [52/68] FROMGIT: ASoC: rt5=
682s: Add driver for ALC5682I-VS codec
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
compiler: nios2-linux-gcc (GCC) 11.2.0

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

3325c135c3b98111 Derek Fang 2021-08-31  2234  =

3325c135c3b98111 Derek Fang 2021-08-31  2235  static int rt5682s_set_compon=
ent_pll(struct snd_soc_component *component,
3325c135c3b98111 Derek Fang 2021-08-31  2236  		int pll_id, int source, uns=
igned int freq_in,
3325c135c3b98111 Derek Fang 2021-08-31  2237  		unsigned int freq_out)
3325c135c3b98111 Derek Fang 2021-08-31  2238  {
3325c135c3b98111 Derek Fang 2021-08-31  2239  	struct rt5682s_priv *rt5682s=
 =3D snd_soc_component_get_drvdata(component);
3325c135c3b98111 Derek Fang 2021-08-31  2240  	struct pll_calc_map a_map, b=
_map;
3325c135c3b98111 Derek Fang 2021-08-31  2241  =

3325c135c3b98111 Derek Fang 2021-08-31  2242  	if (source =3D=3D rt5682s->p=
ll_src[pll_id] && freq_in =3D=3D rt5682s->pll_in[pll_id] &&
3325c135c3b98111 Derek Fang 2021-08-31  2243  	    freq_out =3D=3D rt5682s-=
>pll_out[pll_id])
3325c135c3b98111 Derek Fang 2021-08-31  2244  		return 0;
3325c135c3b98111 Derek Fang 2021-08-31  2245  =

3325c135c3b98111 Derek Fang 2021-08-31  2246  	if (!freq_in || !freq_out) {
3325c135c3b98111 Derek Fang 2021-08-31  2247  		dev_dbg(component->dev, "PL=
L disabled\n");
3325c135c3b98111 Derek Fang 2021-08-31  2248  		rt5682s->pll_in[pll_id] =3D=
 0;
3325c135c3b98111 Derek Fang 2021-08-31  2249  		rt5682s->pll_out[pll_id] =
=3D 0;
3325c135c3b98111 Derek Fang 2021-08-31  2250  		snd_soc_component_update_bi=
ts(component, RT5682S_GLB_CLK,
3325c135c3b98111 Derek Fang 2021-08-31  2251  			RT5682S_SCLK_SRC_MASK, RT5=
682S_CLK_SRC_MCLK << RT5682S_SCLK_SRC_SFT);
3325c135c3b98111 Derek Fang 2021-08-31  2252  		return 0;
3325c135c3b98111 Derek Fang 2021-08-31  2253  	}
3325c135c3b98111 Derek Fang 2021-08-31  2254  =

3325c135c3b98111 Derek Fang 2021-08-31  2255  	switch (source) {
3325c135c3b98111 Derek Fang 2021-08-31  2256  	case RT5682S_PLL_S_MCLK:
3325c135c3b98111 Derek Fang 2021-08-31  2257  		snd_soc_component_update_bi=
ts(component, RT5682S_GLB_CLK,
3325c135c3b98111 Derek Fang 2021-08-31  2258  			RT5682S_PLL_SRC_MASK, RT56=
82S_PLL_SRC_MCLK);
3325c135c3b98111 Derek Fang 2021-08-31  2259  		break;
3325c135c3b98111 Derek Fang 2021-08-31  2260  	case RT5682S_PLL_S_BCLK1:
3325c135c3b98111 Derek Fang 2021-08-31  2261  		snd_soc_component_update_bi=
ts(component, RT5682S_GLB_CLK,
3325c135c3b98111 Derek Fang 2021-08-31  2262  			RT5682S_PLL_SRC_MASK, RT56=
82S_PLL_SRC_BCLK1);
3325c135c3b98111 Derek Fang 2021-08-31  2263  		break;
3325c135c3b98111 Derek Fang 2021-08-31  2264  	default:
3325c135c3b98111 Derek Fang 2021-08-31  2265  		dev_err(component->dev, "Un=
known PLL Source %d\n", source);
3325c135c3b98111 Derek Fang 2021-08-31  2266  		return -EINVAL;
3325c135c3b98111 Derek Fang 2021-08-31  2267  	}
3325c135c3b98111 Derek Fang 2021-08-31  2268  =

3325c135c3b98111 Derek Fang 2021-08-31  2269  	rt5682s->pll_comb =3D find_p=
ll_inter_combination(freq_in, freq_out,
3325c135c3b98111 Derek Fang 2021-08-31  2270  							&a_map, &b_map);
3325c135c3b98111 Derek Fang 2021-08-31  2271  =

3325c135c3b98111 Derek Fang 2021-08-31  2272  	if ((pll_id =3D=3D RT5682S_P=
LL1 && rt5682s->pll_comb =3D=3D USE_PLLA) ||
3325c135c3b98111 Derek Fang 2021-08-31  2273  	    (pll_id =3D=3D RT5682S_P=
LL2 && (rt5682s->pll_comb =3D=3D USE_PLLB ||
3325c135c3b98111 Derek Fang 2021-08-31  2274  					rt5682s->pll_comb =3D=3D=
 USE_PLLAB))) {
3325c135c3b98111 Derek Fang 2021-08-31  2275  		dev_dbg(component->dev,
3325c135c3b98111 Derek Fang 2021-08-31  2276  			"Supported freq conversion=
 for PLL%d:(%d->%d): %d\n",
3325c135c3b98111 Derek Fang 2021-08-31  2277  			pll_id + 1, freq_in, freq_=
out, rt5682s->pll_comb);
3325c135c3b98111 Derek Fang 2021-08-31  2278  	} else {
3325c135c3b98111 Derek Fang 2021-08-31  2279  		dev_err(component->dev,
3325c135c3b98111 Derek Fang 2021-08-31  2280  			"Unsupported freq conversi=
on for PLL%d:(%d->%d): %d\n",
3325c135c3b98111 Derek Fang 2021-08-31  2281  			pll_id + 1, freq_in, freq_=
out, rt5682s->pll_comb);
3325c135c3b98111 Derek Fang 2021-08-31  2282  		return -EINVAL;
3325c135c3b98111 Derek Fang 2021-08-31  2283  	}
3325c135c3b98111 Derek Fang 2021-08-31  2284  =

3325c135c3b98111 Derek Fang 2021-08-31  2285  	if (rt5682s->pll_comb =3D=3D=
 USE_PLLA || rt5682s->pll_comb =3D=3D USE_PLLAB) {
3325c135c3b98111 Derek Fang 2021-08-31  2286  		dev_dbg(component->dev,
3325c135c3b98111 Derek Fang 2021-08-31  2287  			"PLLA: fin=3D%d fout=3D%d =
m_bp=3D%d k_bp=3D%d m=3D%d n=3D%d k=3D%d\n",
3325c135c3b98111 Derek Fang 2021-08-31  2288  			a_map.freq_in, a_map.freq_=
out, a_map.m_bp, a_map.k_bp,
3325c135c3b98111 Derek Fang 2021-08-31  2289  			(a_map.m_bp ? 0 : a_map.m)=
, a_map.n, (a_map.k_bp ? 0 : a_map.k));
3325c135c3b98111 Derek Fang 2021-08-31  2290  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_1,
3325c135c3b98111 Derek Fang 2021-08-31  2291  			RT5682S_PLLA_N_MASK, a_map=
.n);
3325c135c3b98111 Derek Fang 2021-08-31  2292  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_2,
3325c135c3b98111 Derek Fang 2021-08-31  2293  			RT5682S_PLLA_M_MASK | RT56=
82S_PLLA_K_MASK,
3325c135c3b98111 Derek Fang 2021-08-31  2294  			a_map.m << RT5682S_PLLA_M_=
SFT | a_map.k);
3325c135c3b98111 Derek Fang 2021-08-31  2295  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_6,
3325c135c3b98111 Derek Fang 2021-08-31  2296  			RT5682S_PLLA_M_BP_MASK | R=
T5682S_PLLA_K_BP_MASK,
3325c135c3b98111 Derek Fang 2021-08-31 @2297  			a_map.m_bp << RT5682S_PLLA=
_M_BP_SFT |
3325c135c3b98111 Derek Fang 2021-08-31  2298  			a_map.k_bp << RT5682S_PLLA=
_K_BP_SFT);
3325c135c3b98111 Derek Fang 2021-08-31  2299  	}
3325c135c3b98111 Derek Fang 2021-08-31  2300  =

3325c135c3b98111 Derek Fang 2021-08-31  2301  	if (rt5682s->pll_comb =3D=3D=
 USE_PLLB || rt5682s->pll_comb =3D=3D USE_PLLAB) {
3325c135c3b98111 Derek Fang 2021-08-31  2302  		dev_dbg(component->dev,
3325c135c3b98111 Derek Fang 2021-08-31  2303  			"PLLB: fin=3D%d fout=3D%d =
m_bp=3D%d k_bp=3D%d m=3D%d n=3D%d k=3D%d byp_ps=3D%d sel_ps=3D%d\n",
3325c135c3b98111 Derek Fang 2021-08-31  2304  			b_map.freq_in, b_map.freq_=
out, b_map.m_bp, b_map.k_bp,
3325c135c3b98111 Derek Fang 2021-08-31  2305  			(b_map.m_bp ? 0 : b_map.m)=
, b_map.n, (b_map.k_bp ? 0 : b_map.k),
3325c135c3b98111 Derek Fang 2021-08-31  2306  			b_map.byp_ps, b_map.sel_ps=
);
3325c135c3b98111 Derek Fang 2021-08-31  2307  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_3,
3325c135c3b98111 Derek Fang 2021-08-31  2308  			RT5682S_PLLB_N_MASK, b_map=
.n);
3325c135c3b98111 Derek Fang 2021-08-31  2309  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_4,
3325c135c3b98111 Derek Fang 2021-08-31  2310  			RT5682S_PLLB_M_MASK | RT56=
82S_PLLB_K_MASK,
3325c135c3b98111 Derek Fang 2021-08-31  2311  			b_map.m << RT5682S_PLLB_M_=
SFT | b_map.k);
3325c135c3b98111 Derek Fang 2021-08-31  2312  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_6,
3325c135c3b98111 Derek Fang 2021-08-31  2313  			RT5682S_PLLB_SEL_PS_MASK |=
 RT5682S_PLLB_BYP_PS_MASK |
3325c135c3b98111 Derek Fang 2021-08-31  2314  			RT5682S_PLLB_M_BP_MASK | R=
T5682S_PLLB_K_BP_MASK,
3325c135c3b98111 Derek Fang 2021-08-31  2315  			b_map.sel_ps << RT5682S_PL=
LB_SEL_PS_SFT |
3325c135c3b98111 Derek Fang 2021-08-31  2316  			b_map.byp_ps << RT5682S_PL=
LB_BYP_PS_SFT |
3325c135c3b98111 Derek Fang 2021-08-31  2317  			b_map.m_bp << RT5682S_PLLB=
_M_BP_SFT |
3325c135c3b98111 Derek Fang 2021-08-31  2318  			b_map.k_bp << RT5682S_PLLB=
_K_BP_SFT);
3325c135c3b98111 Derek Fang 2021-08-31  2319  	}
3325c135c3b98111 Derek Fang 2021-08-31  2320  =

3325c135c3b98111 Derek Fang 2021-08-31  2321  	if (rt5682s->pll_comb =3D=3D=
 USE_PLLB)
3325c135c3b98111 Derek Fang 2021-08-31  2322  		snd_soc_component_update_bi=
ts(component, RT5682S_PLL_CTRL_7,
3325c135c3b98111 Derek Fang 2021-08-31  2323  			RT5682S_PLLB_SRC_MASK, RT5=
682S_PLLB_SRC_DFIN);
3325c135c3b98111 Derek Fang 2021-08-31  2324  =

3325c135c3b98111 Derek Fang 2021-08-31  2325  	rt5682s->pll_in[pll_id] =3D =
freq_in;
3325c135c3b98111 Derek Fang 2021-08-31  2326  	rt5682s->pll_out[pll_id] =3D=
 freq_out;
3325c135c3b98111 Derek Fang 2021-08-31  2327  	rt5682s->pll_src[pll_id] =3D=
 source;
3325c135c3b98111 Derek Fang 2021-08-31  2328  =

3325c135c3b98111 Derek Fang 2021-08-31  2329  	return 0;
3325c135c3b98111 Derek Fang 2021-08-31  2330  }
3325c135c3b98111 Derek Fang 2021-08-31  2331  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6563306614504221401==--

