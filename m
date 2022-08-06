Content-Type: multipart/mixed; boundary="===============4889667487952115594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7374/14565] drivers/opp/core.c:2671:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 06 Aug 2022 09:27:55 +0800
Message-ID: <202208060941.SDdPWNEW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4889667487952115594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/o=
pp/core.c:2671:22: warning: use of uninitialized value '<unknown>' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e894659f149e779bc1b49016231d75994f6a29e9
commit: 11b9b663585c4f8b00846089ebbca4d1e3283e86 [7374/14565] OPP: Add dev_=
pm_opp_set_config() and friends
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220806/202208060941.SDdPWNEW-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D11b9b663585c4f8b00846089ebbca4d1e3283e86
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 11b9b663585c4f8b00846089ebbca4d1e3283e86
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/opp/core.c: In function 'dev_pm_opp_set_config':
>> drivers/opp/core.c:2671:22: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2671 |         unsigned int id;
         |                      ^~
     'devm_pm_opp_set_config': events 1-2
       |
       | 2842 | int devm_pm_opp_set_config(struct device *dev, struct dev_p=
m_opp_config *config)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'devm_pm_opp_set_config'
       | 2843 | {
       | 2844 |         int token =3D dev_pm_opp_set_config(dev, config);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) calling 'dev_pm_opp_set_config' fro=
m 'devm_pm_opp_set_config'
       |
       +--> 'dev_pm_opp_set_config': events 3-4
              |
              | 2667 | int dev_pm_opp_set_config(struct device *dev, struct=
 dev_pm_opp_config *config)
              |      |     ^~~~~~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (3) entry to 'dev_pm_opp_set_config'
              |......
              | 2671 |         unsigned int id;
              |      |                      ~~
              |      |                      |
              |      |                      (4) use of uninitialized value =
'<unknown>' here
              |

vim +2671 drivers/opp/core.c

11b9b663585c4f Viresh Kumar 2022-05-25  2649  =

11b9b663585c4f Viresh Kumar 2022-05-25  2650  /**
11b9b663585c4f Viresh Kumar 2022-05-25  2651   * dev_pm_opp_set_config() - =
Set OPP configuration for the device.
11b9b663585c4f Viresh Kumar 2022-05-25  2652   * @dev: Device for which con=
figuration is being set.
11b9b663585c4f Viresh Kumar 2022-05-25  2653   * @config: OPP configuration.
11b9b663585c4f Viresh Kumar 2022-05-25  2654   *
11b9b663585c4f Viresh Kumar 2022-05-25  2655   * This allows all device OPP=
 configurations to be performed at once.
11b9b663585c4f Viresh Kumar 2022-05-25  2656   *
11b9b663585c4f Viresh Kumar 2022-05-25  2657   * This must be called before=
 any OPPs are initialized for the device. This may
11b9b663585c4f Viresh Kumar 2022-05-25  2658   * be called multiple times f=
or the same OPP table, for example once for each
11b9b663585c4f Viresh Kumar 2022-05-25  2659   * CPU that share the same ta=
ble. This must be balanced by the same number of
11b9b663585c4f Viresh Kumar 2022-05-25  2660   * calls to dev_pm_opp_clear_=
config() in order to free the OPP table properly.
11b9b663585c4f Viresh Kumar 2022-05-25  2661   *
11b9b663585c4f Viresh Kumar 2022-05-25  2662   * This returns a token to th=
e caller, which must be passed to
11b9b663585c4f Viresh Kumar 2022-05-25  2663   * dev_pm_opp_clear_config() =
to free the resources later. The value of the
11b9b663585c4f Viresh Kumar 2022-05-25  2664   * returned token will be >=
=3D 1 for success and negative for errors. The minimum
11b9b663585c4f Viresh Kumar 2022-05-25  2665   * value of 1 is chosen here =
to make it easy for callers to manage the resource.
11b9b663585c4f Viresh Kumar 2022-05-25  2666   */
11b9b663585c4f Viresh Kumar 2022-05-25  2667  int dev_pm_opp_set_config(str=
uct device *dev, struct dev_pm_opp_config *config)
11b9b663585c4f Viresh Kumar 2022-05-25  2668  {
11b9b663585c4f Viresh Kumar 2022-05-25  2669  	struct opp_table *opp_table,=
 *err;
11b9b663585c4f Viresh Kumar 2022-05-25  2670  	struct opp_config_data *data;
11b9b663585c4f Viresh Kumar 2022-05-25 @2671  	unsigned int id;
11b9b663585c4f Viresh Kumar 2022-05-25  2672  	int ret;
11b9b663585c4f Viresh Kumar 2022-05-25  2673  =

11b9b663585c4f Viresh Kumar 2022-05-25  2674  	data =3D kmalloc(sizeof(*dat=
a), GFP_KERNEL);
11b9b663585c4f Viresh Kumar 2022-05-25  2675  	if (!data)
11b9b663585c4f Viresh Kumar 2022-05-25  2676  		return -ENOMEM;
11b9b663585c4f Viresh Kumar 2022-05-25  2677  =

11b9b663585c4f Viresh Kumar 2022-05-25  2678  	opp_table =3D _add_opp_table=
(dev, false);
11b9b663585c4f Viresh Kumar 2022-05-25  2679  	if (IS_ERR(opp_table)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2680  		kfree(data);
11b9b663585c4f Viresh Kumar 2022-05-25  2681  		return PTR_ERR(opp_table);
11b9b663585c4f Viresh Kumar 2022-05-25  2682  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2683  =

11b9b663585c4f Viresh Kumar 2022-05-25  2684  	data->opp_table =3D opp_tabl=
e;
11b9b663585c4f Viresh Kumar 2022-05-25  2685  	data->flags =3D 0;
11b9b663585c4f Viresh Kumar 2022-05-25  2686  =

11b9b663585c4f Viresh Kumar 2022-05-25  2687  	/* This should be called bef=
ore OPPs are initialized */
11b9b663585c4f Viresh Kumar 2022-05-25  2688  	if (WARN_ON(!list_empty(&opp=
_table->opp_list))) {
11b9b663585c4f Viresh Kumar 2022-05-25  2689  		ret =3D -EBUSY;
11b9b663585c4f Viresh Kumar 2022-05-25  2690  		goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2691  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2692  =

11b9b663585c4f Viresh Kumar 2022-05-25  2693  	/* Configure clocks */
11b9b663585c4f Viresh Kumar 2022-05-25  2694  	if (config->clk_names) {
11b9b663585c4f Viresh Kumar 2022-05-25  2695  		const char * const *temp =
=3D config->clk_names;
11b9b663585c4f Viresh Kumar 2022-05-25  2696  		int count =3D 0;
11b9b663585c4f Viresh Kumar 2022-05-25  2697  =

11b9b663585c4f Viresh Kumar 2022-05-25  2698  		/* Count number of clks */
11b9b663585c4f Viresh Kumar 2022-05-25  2699  		while (*temp++)
11b9b663585c4f Viresh Kumar 2022-05-25  2700  			count++;
11b9b663585c4f Viresh Kumar 2022-05-25  2701  =

11b9b663585c4f Viresh Kumar 2022-05-25  2702  		/*
11b9b663585c4f Viresh Kumar 2022-05-25  2703  		 * This is a special case w=
here we have a single clock, whose
11b9b663585c4f Viresh Kumar 2022-05-25  2704  		 * connection id name is NU=
LL, i.e. first two entries are NULL
11b9b663585c4f Viresh Kumar 2022-05-25  2705  		 * in the array.
11b9b663585c4f Viresh Kumar 2022-05-25  2706  		 */
11b9b663585c4f Viresh Kumar 2022-05-25  2707  		if (!count && !config->clk_=
names[1])
11b9b663585c4f Viresh Kumar 2022-05-25  2708  			count =3D 1;
11b9b663585c4f Viresh Kumar 2022-05-25  2709  =

11b9b663585c4f Viresh Kumar 2022-05-25  2710  		/* We support only one cloc=
k name for now */
11b9b663585c4f Viresh Kumar 2022-05-25  2711  		if (count !=3D 1) {
11b9b663585c4f Viresh Kumar 2022-05-25  2712  			ret =3D -EINVAL;
11b9b663585c4f Viresh Kumar 2022-05-25  2713  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2714  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2715  =

11b9b663585c4f Viresh Kumar 2022-05-25  2716  		err =3D dev_pm_opp_set_clkn=
ame(dev, config->clk_names[0]);
11b9b663585c4f Viresh Kumar 2022-05-25  2717  		if (IS_ERR(err)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2718  			ret =3D PTR_ERR(err);
11b9b663585c4f Viresh Kumar 2022-05-25  2719  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2720  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2721  =

11b9b663585c4f Viresh Kumar 2022-05-25  2722  		data->flags |=3D OPP_CONFIG=
_CLK;
11b9b663585c4f Viresh Kumar 2022-05-25  2723  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2724  =

11b9b663585c4f Viresh Kumar 2022-05-25  2725  	/* Configure property names =
*/
11b9b663585c4f Viresh Kumar 2022-05-25  2726  	if (config->prop_name) {
11b9b663585c4f Viresh Kumar 2022-05-25  2727  		err =3D dev_pm_opp_set_prop=
_name(dev, config->prop_name);
11b9b663585c4f Viresh Kumar 2022-05-25  2728  		if (IS_ERR(err)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2729  			ret =3D PTR_ERR(err);
11b9b663585c4f Viresh Kumar 2022-05-25  2730  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2731  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2732  =

11b9b663585c4f Viresh Kumar 2022-05-25  2733  		data->flags |=3D OPP_CONFIG=
_PROP_NAME;
11b9b663585c4f Viresh Kumar 2022-05-25  2734  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2735  =

11b9b663585c4f Viresh Kumar 2022-05-25  2736  	/* Configure opp helper */
11b9b663585c4f Viresh Kumar 2022-05-25  2737  	if (config->set_opp) {
11b9b663585c4f Viresh Kumar 2022-05-25  2738  		err =3D dev_pm_opp_register=
_set_opp_helper(dev, config->set_opp);
11b9b663585c4f Viresh Kumar 2022-05-25  2739  		if (IS_ERR(err)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2740  			ret =3D PTR_ERR(err);
11b9b663585c4f Viresh Kumar 2022-05-25  2741  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2742  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2743  =

11b9b663585c4f Viresh Kumar 2022-05-25  2744  		data->flags |=3D OPP_CONFIG=
_REGULATOR_HELPER;
11b9b663585c4f Viresh Kumar 2022-05-25  2745  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2746  =

11b9b663585c4f Viresh Kumar 2022-05-25  2747  	/* Configure supported hardw=
are */
11b9b663585c4f Viresh Kumar 2022-05-25  2748  	if (config->supported_hw) {
11b9b663585c4f Viresh Kumar 2022-05-25  2749  		err =3D dev_pm_opp_set_supp=
orted_hw(dev, config->supported_hw,
11b9b663585c4f Viresh Kumar 2022-05-25  2750  						  config->supported_hw_=
count);
11b9b663585c4f Viresh Kumar 2022-05-25  2751  		if (IS_ERR(err)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2752  			ret =3D PTR_ERR(err);
11b9b663585c4f Viresh Kumar 2022-05-25  2753  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2754  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2755  =

11b9b663585c4f Viresh Kumar 2022-05-25  2756  		data->flags |=3D OPP_CONFIG=
_SUPPORTED_HW;
11b9b663585c4f Viresh Kumar 2022-05-25  2757  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2758  =

11b9b663585c4f Viresh Kumar 2022-05-25  2759  	/* Configure supplies */
11b9b663585c4f Viresh Kumar 2022-05-25  2760  	if (config->regulator_names)=
 {
11b9b663585c4f Viresh Kumar 2022-05-25  2761  		err =3D dev_pm_opp_set_regu=
lators(dev, config->regulator_names);
11b9b663585c4f Viresh Kumar 2022-05-25  2762  		if (IS_ERR(err)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2763  			ret =3D PTR_ERR(err);
11b9b663585c4f Viresh Kumar 2022-05-25  2764  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2765  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2766  =

11b9b663585c4f Viresh Kumar 2022-05-25  2767  		data->flags |=3D OPP_CONFIG=
_REGULATOR;
11b9b663585c4f Viresh Kumar 2022-05-25  2768  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2769  =

11b9b663585c4f Viresh Kumar 2022-05-25  2770  	/* Attach genpds */
11b9b663585c4f Viresh Kumar 2022-05-25  2771  	if (config->genpd_names) {
11b9b663585c4f Viresh Kumar 2022-05-25  2772  		err =3D dev_pm_opp_attach_g=
enpd(dev, config->genpd_names,
11b9b663585c4f Viresh Kumar 2022-05-25  2773  					      config->virt_devs);
11b9b663585c4f Viresh Kumar 2022-05-25  2774  		if (IS_ERR(err)) {
11b9b663585c4f Viresh Kumar 2022-05-25  2775  			ret =3D PTR_ERR(err);
11b9b663585c4f Viresh Kumar 2022-05-25  2776  			goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2777  		}
11b9b663585c4f Viresh Kumar 2022-05-25  2778  =

11b9b663585c4f Viresh Kumar 2022-05-25  2779  		data->flags |=3D OPP_CONFIG=
_GENPD;
11b9b663585c4f Viresh Kumar 2022-05-25  2780  	}
11b9b663585c4f Viresh Kumar 2022-05-25  2781  =

11b9b663585c4f Viresh Kumar 2022-05-25  2782  	ret =3D xa_alloc(&opp_config=
s, &id, data, XA_LIMIT(1, INT_MAX),
11b9b663585c4f Viresh Kumar 2022-05-25  2783  		       GFP_KERNEL);
11b9b663585c4f Viresh Kumar 2022-05-25  2784  	if (ret)
11b9b663585c4f Viresh Kumar 2022-05-25  2785  		goto err;
11b9b663585c4f Viresh Kumar 2022-05-25  2786  =

11b9b663585c4f Viresh Kumar 2022-05-25  2787  	return id;
11b9b663585c4f Viresh Kumar 2022-05-25  2788  =

11b9b663585c4f Viresh Kumar 2022-05-25  2789  err:
11b9b663585c4f Viresh Kumar 2022-05-25  2790  	_opp_clear_config(data);
11b9b663585c4f Viresh Kumar 2022-05-25  2791  	return ret;
11b9b663585c4f Viresh Kumar 2022-05-25  2792  }
11b9b663585c4f Viresh Kumar 2022-05-25  2793  EXPORT_SYMBOL_GPL(dev_pm_opp_=
set_config);
11b9b663585c4f Viresh Kumar 2022-05-25  2794  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4889667487952115594==--

