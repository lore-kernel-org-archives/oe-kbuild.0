Content-Type: multipart/mixed; boundary="===============8281297050653825503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/sdhci-msm.c:2271 sdhci_msm_probe() warn: missing error code 'ret'
Date: Tue, 23 Mar 2021 20:27:07 +0800
Message-ID: <202103232054.c8NvMcW2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8281297050653825503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Dewar <alex.dewar90@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   84196390620ac0e5070ae36af84c137c6216a7dc
commit: d425e42d600849ed81bca4e407a09f2555405ec7 mmc: sdhci-msm: enable com=
pile-testing on !ARM
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-m031-20210323 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mmc/host/sdhci-msm.c:2271 sdhci_msm_probe() warn: missing error cod=
e 'ret'

vim +/ret +2271 drivers/mmc/host/sdhci-msm.c

1dfbe3ff81f941 Sarthak Garg             2020-05-22  2196  =

1dfbe3ff81f941 Sarthak Garg             2020-05-22  2197  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2198  static int sdhci_=
msm_probe(struct platform_device *pdev)
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2199  {
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2200  	struct sdhci_hos=
t *host;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2201  	struct sdhci_plt=
fm_host *pltfm_host;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2202  	struct sdhci_msm=
_host *msm_host;
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2203  	struct clk *clk;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2204  	int ret;
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2205  	u16 host_version=
, core_minor;
29301f40cb9f8e Ritesh Harjani           2016-11-21  2206  	u32 core_version=
, config;
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2207  	u8 core_major;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2208  	const struct sdh=
ci_msm_offset *msm_offset;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2209  	const struct sdh=
ci_msm_variant_info *var_info;
87a8df0dce6ad0 Ritesh Harjani           2020-01-16  2210  	struct device_no=
de *node =3D pdev->dev.of_node;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2211  =

6f699531b66aad Jisheng Zhang            2016-02-16  2212  	host =3D sdhci_p=
ltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2213  	if (IS_ERR(host))
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2214  		return PTR_ERR(=
host);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2215  =

2a641e5374a486 Srinivas Kandagatla      2017-08-03  2216  	host->sdma_bound=
ary =3D 0;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2217  	pltfm_host =3D s=
dhci_priv(host);
6f699531b66aad Jisheng Zhang            2016-02-16  2218  	msm_host =3D sdh=
ci_pltfm_priv(pltfm_host);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2219  	msm_host->mmc =
=3D host->mmc;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2220  	msm_host->pdev =
=3D pdev;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2221  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2222  	ret =3D mmc_of_p=
arse(host->mmc);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2223  	if (ret)
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2224  		goto pltfm_free;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2225  =

bc99266bbdd2fb Sayali Lokhande          2018-06-19  2226  	/*
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2227  	 * Based on the =
compatible string, load the required msm host info from
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2228  	 * the data asso=
ciated with the version info.
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2229  	 */
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2230  	var_info =3D of_=
device_get_match_data(&pdev->dev);
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2231  =

bc99266bbdd2fb Sayali Lokhande          2018-06-19  2232  	msm_host->mci_re=
moved =3D var_info->mci_removed;
21f1e2d457ce67 Veerabhadrarao Badiganti 2018-11-12  2233  	msm_host->restor=
e_dll_config =3D var_info->restore_dll_config;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2234  	msm_host->var_op=
s =3D var_info->var_ops;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2235  	msm_host->offset=
 =3D var_info->offset;
5c30f340f9e0b8 Veerabhadrarao Badiganti 2020-05-22  2236  	msm_host->uses_t=
assadar_dll =3D var_info->uses_tassadar_dll;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2237  =

bc99266bbdd2fb Sayali Lokhande          2018-06-19  2238  	msm_offset =3D m=
sm_host->offset;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2239  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2240  	sdhci_get_of_pro=
perty(pdev);
1dfbe3ff81f941 Sarthak Garg             2020-05-22  2241  	sdhci_msm_get_of=
_property(pdev, host);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2242  =

abf270e5c62610 Ritesh Harjani           2016-11-21  2243  	msm_host->saved_=
tuning_phase =3D INVALID_TUNING_PHASE;
abf270e5c62610 Ritesh Harjani           2016-11-21  2244  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2245  	/* Setup SDCC bu=
s voter clock. */
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2246  	msm_host->bus_cl=
k =3D devm_clk_get(&pdev->dev, "bus");
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2247  	if (!IS_ERR(msm_=
host->bus_clk)) {
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2248  		/* Vote for max=
. clk rate for max. performance */
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2249  		ret =3D clk_set=
_rate(msm_host->bus_clk, INT_MAX);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2250  		if (ret)
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2251  			goto pltfm_fre=
e;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2252  		ret =3D clk_pre=
pare_enable(msm_host->bus_clk);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2253  		if (ret)
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2254  			goto pltfm_fre=
e;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2255  	}
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2256  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2257  	/* Setup main pe=
ripheral bus clock */
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2258  	clk =3D devm_clk=
_get(&pdev->dev, "iface");
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2259  	if (IS_ERR(clk))=
 {
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2260  		ret =3D PTR_ERR=
(clk);
2801b95e8ff0fc Colin Ian King           2016-06-23  2261  		dev_err(&pdev->=
dev, "Peripheral clk setup failed (%d)\n", ret);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2262  		goto bus_clk_di=
sable;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2263  	}
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2264  	msm_host->bulk_c=
lks[1].clk =3D clk;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2265  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2266  	/* Setup SDC MMC=
 clock */
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2267  	clk =3D devm_clk=
_get(&pdev->dev, "core");
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2268  	if (IS_ERR(clk))=
 {
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2269  		ret =3D PTR_ERR=
(clk);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2270  		dev_err(&pdev->=
dev, "SDC MMC clk setup failed (%d)\n", ret);
e4bf91f6723e49 Bjorn Andersson          2017-09-15 @2271  		goto bus_clk_di=
sable;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2272  	}
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2273  	msm_host->bulk_c=
lks[0].clk =3D clk;
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2274  =

b4fc8278d25228 Pradeep P V K            2020-06-09  2275  	 /* Check for op=
tional interconnect paths */
b4fc8278d25228 Pradeep P V K            2020-06-09  2276  	ret =3D dev_pm_o=
pp_of_find_icc_paths(&pdev->dev, NULL);
b4fc8278d25228 Pradeep P V K            2020-06-09  2277  	if (ret)
b4fc8278d25228 Pradeep P V K            2020-06-09  2278  		goto bus_clk_di=
sable;
b4fc8278d25228 Pradeep P V K            2020-06-09  2279  =

c2b613d03b0609 Rajendra Nayak           2020-04-28  2280  	msm_host->opp_ta=
ble =3D dev_pm_opp_set_clkname(&pdev->dev, "core");
c2b613d03b0609 Rajendra Nayak           2020-04-28  2281  	if (IS_ERR(msm_h=
ost->opp_table)) {
c2b613d03b0609 Rajendra Nayak           2020-04-28  2282  		ret =3D PTR_ERR=
(msm_host->opp_table);
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2283  		goto bus_clk_di=
sable;
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2284  	}
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2285  =

0472f8d3c054a0 Rajendra Nayak           2020-04-17  2286  	/* OPP table is =
optional */
c2b613d03b0609 Rajendra Nayak           2020-04-28  2287  	ret =3D dev_pm_o=
pp_of_add_table(&pdev->dev);
c2b613d03b0609 Rajendra Nayak           2020-04-28  2288  	if (!ret) {
c2b613d03b0609 Rajendra Nayak           2020-04-28  2289  		msm_host->has_o=
pp_table =3D true;
c2b613d03b0609 Rajendra Nayak           2020-04-28  2290  	} else if (ret !=
=3D -ENODEV) {
c2b613d03b0609 Rajendra Nayak           2020-04-28  2291  		dev_err(&pdev->=
dev, "Invalid OPP table in Device tree\n");
c2b613d03b0609 Rajendra Nayak           2020-04-28  2292  		goto opp_cleanu=
p;
c2b613d03b0609 Rajendra Nayak           2020-04-28  2293  	}
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2294  =

e4bf91f6723e49 Bjorn Andersson          2017-09-15  2295  	/* Vote for maxi=
mum clock rate for maximum performance */
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2296  	ret =3D dev_pm_o=
pp_set_rate(&pdev->dev, INT_MAX);
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2297  	if (ret)
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2298  		dev_warn(&pdev-=
>dev, "core clock boost failed\n");
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2299  =

4946b3af5e8e96 Bjorn Andersson          2017-09-15  2300  	clk =3D devm_clk=
_get(&pdev->dev, "cal");
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2301  	if (IS_ERR(clk))
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2302  		clk =3D NULL;
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2303  	msm_host->bulk_c=
lks[2].clk =3D clk;
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2304  =

4946b3af5e8e96 Bjorn Andersson          2017-09-15  2305  	clk =3D devm_clk=
_get(&pdev->dev, "sleep");
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2306  	if (IS_ERR(clk))
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2307  		clk =3D NULL;
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2308  	msm_host->bulk_c=
lks[3].clk =3D clk;
4946b3af5e8e96 Bjorn Andersson          2017-09-15  2309  =

e4bf91f6723e49 Bjorn Andersson          2017-09-15  2310  	ret =3D clk_bulk=
_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2311  				      msm_hos=
t->bulk_clks);
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2312  	if (ret)
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2313  		goto opp_cleanu=
p;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2314  =

83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2315  	/*
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2316  	 * xo clock is n=
eeded for FLL feature of cm_dll.
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2317  	 * In case if xo=
 clock is not mentioned in DT, warn and proceed.
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2318  	 */
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2319  	msm_host->xo_clk=
 =3D devm_clk_get(&pdev->dev, "xo");
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2320  	if (IS_ERR(msm_h=
ost->xo_clk)) {
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2321  		ret =3D PTR_ERR=
(msm_host->xo_clk);
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2322  		dev_warn(&pdev-=
>dev, "TCXO clk not present (%d)\n", ret);
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2323  	}
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2324  =

bc99266bbdd2fb Sayali Lokhande          2018-06-19  2325  	if (!msm_host->m=
ci_removed) {
cb064b50227d15 Yangtao Li               2019-12-15  2326  		msm_host->core_=
mem =3D devm_platform_ioremap_resource(pdev, 1);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2327  		if (IS_ERR(msm_=
host->core_mem)) {
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2328  			ret =3D PTR_ER=
R(msm_host->core_mem);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2329  			goto clk_disab=
le;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2330  		}
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2331  	}
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2332  =

5574ddcc60aaf7 Venkat Gopalakrishnan    2017-01-10  2333  	/* Reset the ven=
dor spec register to power on reset state */
5574ddcc60aaf7 Venkat Gopalakrishnan    2017-01-10  2334  	writel_relaxed(C=
ORE_VENDOR_SPEC_POR_VAL,
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2335  			host->ioaddr +=
 msm_offset->core_vendor_spec);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2336  =

bc99266bbdd2fb Sayali Lokhande          2018-06-19  2337  	if (!msm_host->m=
ci_removed) {
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2338  		/* Set HC_MODE_=
EN bit in HC_MODE register */
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2339  		msm_host_writel=
(msm_host, HC_MODE_EN, host,
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2340  				msm_offset->c=
ore_hc_mode);
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2341  		config =3D msm_=
host_readl(msm_host, host,
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2342  				msm_offset->c=
ore_hc_mode);
ff06ce417828b9 Venkat Gopalakrishnan    2016-11-21  2343  		config |=3D FF_=
CLK_SW_RST_DIS;
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2344  		msm_host_writel=
(msm_host, config, host,
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2345  				msm_offset->c=
ore_hc_mode);
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2346  	}
ff06ce417828b9 Venkat Gopalakrishnan    2016-11-21  2347  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2348  	host_version =3D=
 readw_relaxed((host->ioaddr + SDHCI_HOST_VERSION));
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2349  	dev_dbg(&pdev->d=
ev, "Host Version: 0x%x Vendor Version 0x%x\n",
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2350  		host_version, (=
(host_version & SDHCI_VENDOR_VER_MASK) >>
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2351  			       SDHCI_V=
ENDOR_VER_SHIFT));
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2352  =

bc99266bbdd2fb Sayali Lokhande          2018-06-19  2353  	core_version =3D=
 msm_host_readl(msm_host, host,
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2354  			msm_offset->co=
re_mci_version);
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2355  	core_major =3D (=
core_version & CORE_VERSION_MAJOR_MASK) >>
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2356  		      CORE_VERS=
ION_MAJOR_SHIFT;
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2357  	core_minor =3D c=
ore_version & CORE_VERSION_MINOR_MASK;
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2358  	dev_dbg(&pdev->d=
ev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2359  		core_version, c=
ore_major, core_minor);
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2360  =

83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2361  	if (core_major =
=3D=3D 1 && core_minor >=3D 0x42)
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2362  		msm_host->use_1=
4lpp_dll_reset =3D true;
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  2363  =

02e4293dc01362 Ritesh Harjani           2016-11-21  2364  	/*
02e4293dc01362 Ritesh Harjani           2016-11-21  2365  	 * SDCC 5 contro=
ller with major version 1, minor version 0x34 and later
02e4293dc01362 Ritesh Harjani           2016-11-21  2366  	 * with HS 400 m=
ode support will use CM DLL instead of CDC LP 533 DLL.
02e4293dc01362 Ritesh Harjani           2016-11-21  2367  	 */
02e4293dc01362 Ritesh Harjani           2016-11-21  2368  	if (core_major =
=3D=3D 1 && core_minor < 0x34)
02e4293dc01362 Ritesh Harjani           2016-11-21  2369  		msm_host->use_c=
dclp533 =3D true;
02e4293dc01362 Ritesh Harjani           2016-11-21  2370  =

3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2371  	/*
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2372  	 * Support for s=
ome capabilities is not advertised by newer
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2373  	 * controller ve=
rsions and must be explicitly enabled.
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2374  	 */
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2375  	if (core_major >=
=3D 1 && core_minor !=3D 0x11 && core_minor !=3D 0x12) {
29301f40cb9f8e Ritesh Harjani           2016-11-21  2376  		config =3D read=
l_relaxed(host->ioaddr + SDHCI_CAPABILITIES);
29301f40cb9f8e Ritesh Harjani           2016-11-21  2377  		config |=3D SDH=
CI_CAN_VDD_300 | SDHCI_CAN_DO_8BIT;
29301f40cb9f8e Ritesh Harjani           2016-11-21  2378  		writel_relaxed(=
config, host->ioaddr +
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2379  				msm_offset->c=
ore_vendor_spec_capabilities0);
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2380  	}
3a3ad3e9d54c96 Georgi Djakov            2015-03-23  2381  =

fa56ac97922653 Veerabhadrarao Badiganti 2019-11-26  2382  	if (core_major =
=3D=3D 1 && core_minor >=3D 0x49)
fa56ac97922653 Veerabhadrarao Badiganti 2019-11-26  2383  		msm_host->updat=
ed_ddr_cfg =3D true;
fa56ac97922653 Veerabhadrarao Badiganti 2019-11-26  2384  =

92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  2385  	ret =3D sdhci_ms=
m_register_vreg(msm_host);
92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  2386  	if (ret)
92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  2387  		goto clk_disabl=
e;
92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  2388  =

c7ccee224d2d55 Subhash Jadavani         2017-09-27  2389  	/*
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2390  	 * Power on rese=
t state may trigger power irq if previous status of
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2391  	 * PWRCTL was ei=
ther BUS_ON or IO_HIGH_V. So before enabling pwr irq
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2392  	 * interrupt in =
GIC, any pending power irq interrupt should be
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2393  	 * acknowledged.=
 Otherwise power irq interrupt handler would be
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2394  	 * fired prematu=
rely.
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2395  	 */
401b2d06c4ed69 Sahitya Tummala          2017-09-27  2396  	sdhci_msm_handle=
_pwr_irq(host, 0);
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2397  =

c7ccee224d2d55 Subhash Jadavani         2017-09-27  2398  	/*
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2399  	 * Ensure that a=
bove writes are propogated before interrupt enablement
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2400  	 * in GIC.
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2401  	 */
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2402  	mb();
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2403  =

ad81d387100454 Georgi Djakov            2016-06-24  2404  	/* Setup IRQ for=
 handling power/voltage tasks with PMIC */
ad81d387100454 Georgi Djakov            2016-06-24  2405  	msm_host->pwr_ir=
q =3D platform_get_irq_byname(pdev, "pwr_irq");
ad81d387100454 Georgi Djakov            2016-06-24  2406  	if (msm_host->pw=
r_irq < 0) {
d1f63f0c81c22b Wei Yongjun              2016-10-26  2407  		ret =3D msm_hos=
t->pwr_irq;
ad81d387100454 Georgi Djakov            2016-06-24  2408  		goto clk_disabl=
e;
ad81d387100454 Georgi Djakov            2016-06-24  2409  	}
ad81d387100454 Georgi Djakov            2016-06-24  2410  =

c0309b3803fed9 Vijay Viswanath          2017-09-27  2411  	sdhci_msm_init_p=
wr_irq_wait(msm_host);
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2412  	/* Enable pwr ir=
q interrupts */
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2413  	msm_host_writel(=
msm_host, INT_MASK, host,
bc99266bbdd2fb Sayali Lokhande          2018-06-19  2414  		msm_offset->cor=
e_pwrctl_mask);
c7ccee224d2d55 Subhash Jadavani         2017-09-27  2415  =

ad81d387100454 Georgi Djakov            2016-06-24  2416  	ret =3D devm_req=
uest_threaded_irq(&pdev->dev, msm_host->pwr_irq, NULL,
ad81d387100454 Georgi Djakov            2016-06-24  2417  					sdhci_msm_pw=
r_irq, IRQF_ONESHOT,
ad81d387100454 Georgi Djakov            2016-06-24  2418  					dev_name(&pd=
ev->dev), host);
ad81d387100454 Georgi Djakov            2016-06-24  2419  	if (ret) {
ad81d387100454 Georgi Djakov            2016-06-24  2420  		dev_err(&pdev->=
dev, "Request IRQ failed (%d)\n", ret);
ad81d387100454 Georgi Djakov            2016-06-24  2421  		goto clk_disabl=
e;
ad81d387100454 Georgi Djakov            2016-06-24  2422  	}
ad81d387100454 Georgi Djakov            2016-06-24  2423  =

9d8cb58691f85c Veerabhadrarao Badiganti 2020-04-20  2424  	msm_host->mmc->c=
aps |=3D MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
9d8cb58691f85c Veerabhadrarao Badiganti 2020-04-20  2425  =

67e6db113c903f Pramod Gurav             2016-10-21  2426  	pm_runtime_get_n=
oresume(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2427  	pm_runtime_set_a=
ctive(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2428  	pm_runtime_enabl=
e(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2429  	pm_runtime_set_a=
utosuspend_delay(&pdev->dev,
67e6db113c903f Pramod Gurav             2016-10-21  2430  					 MSM_MMC_AUT=
OSUSPEND_DELAY_MS);
67e6db113c903f Pramod Gurav             2016-10-21  2431  	pm_runtime_use_a=
utosuspend(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2432  =

92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  2433  	host->mmc_host_o=
ps.start_signal_voltage_switch =3D
92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  2434  		sdhci_msm_start=
_signal_voltage_switch;
4436c535996242 Ritesh Harjani           2017-01-24  2435  	host->mmc_host_o=
ps.execute_tuning =3D sdhci_msm_execute_tuning;
87a8df0dce6ad0 Ritesh Harjani           2020-01-16  2436  	if (of_property_=
read_bool(node, "supports-cqe"))
87a8df0dce6ad0 Ritesh Harjani           2020-01-16  2437  		ret =3D sdhci_m=
sm_cqe_add_host(host, pdev);
87a8df0dce6ad0 Ritesh Harjani           2020-01-16  2438  	else
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2439  		ret =3D sdhci_a=
dd_host(host);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2440  	if (ret)
67e6db113c903f Pramod Gurav             2016-10-21  2441  		goto pm_runtime=
_disable;
67e6db113c903f Pramod Gurav             2016-10-21  2442  =

67e6db113c903f Pramod Gurav             2016-10-21  2443  	pm_runtime_mark_=
last_busy(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2444  	pm_runtime_put_a=
utosuspend(&pdev->dev);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2445  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2446  	return 0;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2447  =

67e6db113c903f Pramod Gurav             2016-10-21  2448  pm_runtime_disabl=
e:
67e6db113c903f Pramod Gurav             2016-10-21  2449  	pm_runtime_disab=
le(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2450  	pm_runtime_set_s=
uspended(&pdev->dev);
67e6db113c903f Pramod Gurav             2016-10-21  2451  	pm_runtime_put_n=
oidle(&pdev->dev);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2452  clk_disable:
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2453  	clk_bulk_disable=
_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
e4bf91f6723e49 Bjorn Andersson          2017-09-15  2454  				   msm_host->=
bulk_clks);
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2455  opp_cleanup:
c2b613d03b0609 Rajendra Nayak           2020-04-28  2456  	if (msm_host->ha=
s_opp_table)
0472f8d3c054a0 Rajendra Nayak           2020-04-17  2457  		dev_pm_opp_of_r=
emove_table(&pdev->dev);
c2b613d03b0609 Rajendra Nayak           2020-04-28  2458  	dev_pm_opp_put_c=
lkname(msm_host->opp_table);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2459  bus_clk_disable:
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2460  	if (!IS_ERR(msm_=
host->bus_clk))
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2461  		clk_disable_unp=
repare(msm_host->bus_clk);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2462  pltfm_free:
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2463  	sdhci_pltfm_free=
(pdev);
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2464  	return ret;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2465  }
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  2466  =


:::::: The code at line 2271 was first introduced by commit
:::::: e4bf91f6723e493175eedfd2760f0ffda19756fa mmc: sdhci-msm: Utilize bul=
k clock API

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8281297050653825503==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8281297050653825503==--

