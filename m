Content-Type: multipart/mixed; boundary="===============7932481236952325432=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/bridge/sil-sii8620.c:2355: undefined reference to `extcon_unregister_notifier'
Date: Mon, 15 Jun 2020 07:46:01 +0800
Message-ID: <202006150758.CMuPyFH9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7932481236952325432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b3a9e3b9622ae10064826dccb4f7a52bd88c7407
commit: def2fbffe62c00c330c7f41584a356001179c59c kconfig: allow symbols imp=
lied by y to become m
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: h8300-randconfig-r024-20200614 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout def2fbffe62c00c330c7f41584a356001179c59c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

h8300-linux-ld: section .init.text LMA [0000000000455a00,000000000048c1c7] =
overlaps section .text LMA [000000000000025c,0000000000820b77]
h8300-linux-ld: section .data VMA [0000000000400000,00000000004559ff] overl=
aps section .text VMA [000000000000025c,0000000000820b77]
h8300-linux-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_=
remove':
>> drivers/gpu/drm/bridge/sil-sii8620.c:2355: undefined reference to `extco=
n_unregister_notifier'
h8300-linux-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_=
extcon_init':
>> drivers/gpu/drm/bridge/sil-sii8620.c:2179: undefined reference to `extco=
n_find_edev_by_node'
>> h8300-linux-ld: drivers/gpu/drm/bridge/sil-sii8620.c:2191: undefined ref=
erence to `extcon_register_notifier'
h8300-linux-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_=
extcon_work':
>> drivers/gpu/drm/bridge/sil-sii8620.c:2139: undefined reference to `extco=
n_get_state'

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ddef2fbffe62c00c330c7f41584a356001179c59c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout def2fbffe62c00c330c7f41584a356001179c59c
vim +2355 drivers/gpu/drm/bridge/sil-sii8620.c

688838442147d9 Maciej Purski    2018-02-27  2162  =

688838442147d9 Maciej Purski    2018-02-27  2163  static int sii8620_extcon=
_init(struct sii8620 *ctx)
688838442147d9 Maciej Purski    2018-02-27  2164  {
688838442147d9 Maciej Purski    2018-02-27  2165  	struct extcon_dev *edev;
688838442147d9 Maciej Purski    2018-02-27  2166  	struct device_node *musb=
, *muic;
688838442147d9 Maciej Purski    2018-02-27  2167  	int ret;
688838442147d9 Maciej Purski    2018-02-27  2168  =

688838442147d9 Maciej Purski    2018-02-27  2169  	/* get micro-USB connect=
or node */
688838442147d9 Maciej Purski    2018-02-27  2170  	musb =3D of_graph_get_re=
mote_node(ctx->dev->of_node, 1, -1);
688838442147d9 Maciej Purski    2018-02-27  2171  	/* next get micro-USB In=
terface Controller node */
688838442147d9 Maciej Purski    2018-02-27  2172  	muic =3D of_get_next_par=
ent(musb);
688838442147d9 Maciej Purski    2018-02-27  2173  =

688838442147d9 Maciej Purski    2018-02-27  2174  	if (!muic) {
688838442147d9 Maciej Purski    2018-02-27  2175  		dev_info(ctx->dev, "no =
extcon found, switching to 'always on' mode\n");
688838442147d9 Maciej Purski    2018-02-27  2176  		return 0;
688838442147d9 Maciej Purski    2018-02-27  2177  	}
688838442147d9 Maciej Purski    2018-02-27  2178  =

688838442147d9 Maciej Purski    2018-02-27 @2179  	edev =3D extcon_find_ede=
v_by_node(muic);
688838442147d9 Maciej Purski    2018-02-27  2180  	of_node_put(muic);
688838442147d9 Maciej Purski    2018-02-27  2181  	if (IS_ERR(edev)) {
688838442147d9 Maciej Purski    2018-02-27  2182  		if (PTR_ERR(edev) =3D=
=3D -EPROBE_DEFER)
688838442147d9 Maciej Purski    2018-02-27  2183  			return -EPROBE_DEFER;
688838442147d9 Maciej Purski    2018-02-27  2184  		dev_err(ctx->dev, "Inva=
lid or missing extcon\n");
688838442147d9 Maciej Purski    2018-02-27  2185  		return PTR_ERR(edev);
688838442147d9 Maciej Purski    2018-02-27  2186  	}
688838442147d9 Maciej Purski    2018-02-27  2187  =

688838442147d9 Maciej Purski    2018-02-27  2188  	ctx->extcon =3D edev;
688838442147d9 Maciej Purski    2018-02-27  2189  	ctx->extcon_nb.notifier_=
call =3D sii8620_extcon_notifier;
688838442147d9 Maciej Purski    2018-02-27  2190  	INIT_WORK(&ctx->extcon_w=
q, sii8620_extcon_work);
688838442147d9 Maciej Purski    2018-02-27 @2191  	ret =3D extcon_register_=
notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
688838442147d9 Maciej Purski    2018-02-27  2192  	if (ret) {
688838442147d9 Maciej Purski    2018-02-27  2193  		dev_err(ctx->dev, "fail=
ed to register notifier for MHL\n");
688838442147d9 Maciej Purski    2018-02-27  2194  		return ret;
688838442147d9 Maciej Purski    2018-02-27  2195  	}
688838442147d9 Maciej Purski    2018-02-27  2196  =

688838442147d9 Maciej Purski    2018-02-27  2197  	return 0;
688838442147d9 Maciej Purski    2018-02-27  2198  }
688838442147d9 Maciej Purski    2018-02-27  2199  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2200  static inline struct sii8=
620 *bridge_to_sii8620(struct drm_bridge *bridge)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2201  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2202  	return container_of(brid=
ge, struct sii8620, bridge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2203  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2204  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2205  static int sii8620_attach=
(struct drm_bridge *bridge)
e25f1f7c94e16d Maciej Purski    2017-08-24  2206  {
e25f1f7c94e16d Maciej Purski    2017-08-24  2207  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
e25f1f7c94e16d Maciej Purski    2017-08-24  2208  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2209  	sii8620_init_rcp_input_d=
ev(ctx);
e25f1f7c94e16d Maciej Purski    2017-08-24  2210  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2211  	return sii8620_clear_err=
or(ctx);
e25f1f7c94e16d Maciej Purski    2017-08-24  2212  }
e25f1f7c94e16d Maciej Purski    2017-08-24  2213  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2214  static void sii8620_detac=
h(struct drm_bridge *bridge)
e25f1f7c94e16d Maciej Purski    2017-08-24  2215  {
e25f1f7c94e16d Maciej Purski    2017-08-24  2216  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
e25f1f7c94e16d Maciej Purski    2017-08-24  2217  =

710abfe8ead247 Ronald Tschal=C3=A4r  2019-04-19  2218  	if (!IS_ENABLED(CON=
FIG_RC_CORE))
710abfe8ead247 Ronald Tschal=C3=A4r  2019-04-19  2219  		return;
710abfe8ead247 Ronald Tschal=C3=A4r  2019-04-19  2220  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2221  	rc_unregister_device(ctx=
->rc_dev);
e25f1f7c94e16d Maciej Purski    2017-08-24  2222  }
e25f1f7c94e16d Maciej Purski    2017-08-24  2223  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2224  static int sii8620_is_pac=
king_required(struct sii8620 *ctx,
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2225  				       const struct d=
rm_display_mode *mode)
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2226  {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2227  	int max_pclk, max_pclk_p=
p_mode;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2228  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2229  	if (sii8620_is_mhl3(ctx)=
) {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2230  		max_pclk =3D MHL3_MAX_P=
CLK;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2231  		max_pclk_pp_mode =3D MH=
L3_MAX_PCLK_PP_MODE;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2232  	} else {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2233  		max_pclk =3D MHL1_MAX_P=
CLK;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2234  		max_pclk_pp_mode =3D MH=
L1_MAX_PCLK_PP_MODE;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2235  	}
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2236  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2237  	if (mode->clock < max_pc=
lk)
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2238  		return 0;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2239  	else if (mode->clock < m=
ax_pclk_pp_mode)
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2240  		return 1;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2241  	else
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2242  		return -1;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2243  }
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2244  =

e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2245  static enum drm_mode_stat=
us sii8620_mode_valid(struct drm_bridge *bridge,
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2246  					 const struct drm_di=
splay_mode *mode)
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2247  {
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2248  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2249  	int pack_required =3D si=
i8620_is_packing_required(ctx, mode);
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2250  	bool can_pack =3D ctx->d=
evcap[MHL_DCAP_VID_LINK_MODE] &
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2251  			MHL_DCAP_VID_LINK_PPIX=
EL;
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2252  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2253  	switch (pack_required) {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2254  	case 0:
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2255  		return MODE_OK;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2256  	case 1:
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2257  		return (can_pack) ? MOD=
E_OK : MODE_CLOCK_HIGH;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2258  	default:
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2259  		return MODE_CLOCK_HIGH;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2260  	}
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2261  }
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2262  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2263  static bool sii8620_mode_=
fixup(struct drm_bridge *bridge,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2264  			       const struct dr=
m_display_mode *mode,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2265  			       struct drm_disp=
lay_mode *adjusted_mode)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2266  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2267  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2268  =

bf1722cab55a32 Andrzej Hajda    2017-02-01  2269  	mutex_lock(&ctx->lock);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2270  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2271  	ctx->use_packed_pixel =
=3D sii8620_is_packing_required(ctx, adjusted_mode);
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2272  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2273  	mutex_unlock(&ctx->lock);
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2274  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2275  	return true;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2276  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2277  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2278  static const struct drm_b=
ridge_funcs sii8620_bridge_funcs =3D {
e25f1f7c94e16d Maciej Purski    2017-08-24  2279  	.attach =3D sii8620_atta=
ch,
e25f1f7c94e16d Maciej Purski    2017-08-24  2280  	.detach =3D sii8620_deta=
ch,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2281  	.mode_fixup =3D sii8620_=
mode_fixup,
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2282  	.mode_valid =3D sii8620_=
mode_valid,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2283  };
ce6e153f414a73 Andrzej Hajda    2016-10-10  2284  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2285  static int sii8620_probe(=
struct i2c_client *client,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2286  			 const struct i2c_devi=
ce_id *id)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2287  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2288  	struct device *dev =3D &=
client->dev;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2289  	struct sii8620 *ctx;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2290  	int ret;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2291  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2292  	ctx =3D devm_kzalloc(dev=
, sizeof(*ctx), GFP_KERNEL);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2293  	if (!ctx)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2294  		return -ENOMEM;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2295  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2296  	ctx->dev =3D dev;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2297  	mutex_init(&ctx->lock);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2298  	INIT_LIST_HEAD(&ctx->mt_=
queue);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2299  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2300  	ctx->clk_xtal =3D devm_c=
lk_get(dev, "xtal");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2301  	if (IS_ERR(ctx->clk_xtal=
)) {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2302  		dev_err(dev, "failed to=
 get xtal clock from DT\n");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2303  		return PTR_ERR(ctx->clk=
_xtal);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2304  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2305  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2306  	if (!client->irq) {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2307  		dev_err(dev, "no irq pr=
ovided\n");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2308  		return -EINVAL;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2309  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2310  	irq_set_status_flags(cli=
ent->irq, IRQ_NOAUTOEN);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2311  	ret =3D devm_request_thr=
eaded_irq(dev, client->irq, NULL,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2312  					sii8620_irq_thread,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2313  					IRQF_TRIGGER_HIGH | =
IRQF_ONESHOT,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2314  					"sii8620", ctx);
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2315  	if (ret < 0) {
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2316  		dev_err(dev, "failed to=
 install IRQ handler\n");
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2317  		return ret;
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2318  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2319  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2320  	ctx->gpio_reset =3D devm=
_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2321  	if (IS_ERR(ctx->gpio_res=
et)) {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2322  		dev_err(dev, "failed to=
 get reset gpio from DT\n");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2323  		return PTR_ERR(ctx->gpi=
o_reset);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2324  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2325  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2326  	ctx->supplies[0].supply =
=3D "cvcc10";
ce6e153f414a73 Andrzej Hajda    2016-10-10  2327  	ctx->supplies[1].supply =
=3D "iovcc18";
ce6e153f414a73 Andrzej Hajda    2016-10-10  2328  	ret =3D devm_regulator_b=
ulk_get(dev, 2, ctx->supplies);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2329  	if (ret)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2330  		return ret;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2331  =

688838442147d9 Maciej Purski    2018-02-27  2332  	ret =3D sii8620_extcon_i=
nit(ctx);
688838442147d9 Maciej Purski    2018-02-27  2333  	if (ret < 0) {
688838442147d9 Maciej Purski    2018-02-27  2334  		dev_err(ctx->dev, "fail=
ed to initialize EXTCON\n");
688838442147d9 Maciej Purski    2018-02-27  2335  		return ret;
688838442147d9 Maciej Purski    2018-02-27  2336  	}
688838442147d9 Maciej Purski    2018-02-27  2337  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2338  	i2c_set_clientdata(clien=
t, ctx);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2339  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2340  	ctx->bridge.funcs =3D &s=
ii8620_bridge_funcs;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2341  	ctx->bridge.of_node =3D =
dev->of_node;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2342  	drm_bridge_add(&ctx->bri=
dge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2343  =

688838442147d9 Maciej Purski    2018-02-27  2344  	if (!ctx->extcon)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2345  		sii8620_cable_in(ctx);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2346  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2347  	return 0;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2348  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2349  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2350  static int sii8620_remove=
(struct i2c_client *client)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2351  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2352  	struct sii8620 *ctx =3D =
i2c_get_clientdata(client);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2353  =

688838442147d9 Maciej Purski    2018-02-27  2354  	if (ctx->extcon) {
688838442147d9 Maciej Purski    2018-02-27 @2355  		extcon_unregister_notif=
ier(ctx->extcon, EXTCON_DISP_MHL,
688838442147d9 Maciej Purski    2018-02-27  2356  					   &ctx->extcon_nb);
688838442147d9 Maciej Purski    2018-02-27  2357  		flush_work(&ctx->extcon=
_wq);
688838442147d9 Maciej Purski    2018-02-27  2358  		if (ctx->cable_state > =
0)
688838442147d9 Maciej Purski    2018-02-27  2359  			sii8620_cable_out(ctx);
688838442147d9 Maciej Purski    2018-02-27  2360  	} else {
688838442147d9 Maciej Purski    2018-02-27  2361  		sii8620_cable_out(ctx);
688838442147d9 Maciej Purski    2018-02-27  2362  	}
e25f1f7c94e16d Maciej Purski    2017-08-24  2363  	drm_bridge_remove(&ctx->=
bridge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2364  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2365  	return 0;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2366  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2367  =


:::::: The code at line 2355 was first introduced by commit
:::::: 688838442147d9dd94c2ef7c2c31a35cf150c5fa drm/bridge/sii8620: use mic=
ro-USB cable detection logic to detect MHL

:::::: TO: Maciej Purski <m.purski@samsung.com>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7932481236952325432==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7932481236952325432==--

