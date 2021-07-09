Content-Type: multipart/mixed; boundary="===============2540698647288930777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/sdhci-msm.c:2271 sdhci_msm_probe() warn: missing error code 'ret'
Date: Fri, 09 Jul 2021 22:14:53 +0800
Message-ID: <202107092242.JSsDy8CR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2540698647288930777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Dewar <alex.dewar90@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

Hi Alex,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f55966571d5eb2876a11e48e798b4592fa1ffbb7
commit: d425e42d600849ed81bca4e407a09f2555405ec7 mmc: sdhci-msm: enable com=
pile-testing on !ARM
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m031-20210709 (attached as .config)
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

--===============2540698647288930777==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2540698647288930777==--

