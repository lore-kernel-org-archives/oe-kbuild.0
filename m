Content-Type: multipart/mixed; boundary="===============2557898945037170035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/gr3d.c:396:25: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 15 Aug 2022 18:48:29 +0800
Message-ID: <202208151838.SZuztuoD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2557898945037170035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/tegra/gr3d.c:396:25: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Thierry Reding <treding@nvidia.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 2421b20d659069ed6435b27a919e627b74c27e7e drm/tegra: gr3d: Support g=
eneric power domain and runtime PM
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220808 (https://download.01.org/0day-ci/archi=
ve/20220815/202208151838.SZuztuoD-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2421b20d659069ed6435b27a919e627b74c27e7e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2421b20d659069ed6435b27a919e627b74c27e7e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/tegra/gr3d.c: In function 'gr3d_init_power':
>> drivers/gpu/drm/tegra/gr3d.c:396:25: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     396 |         struct device **opp_virt_devs, *pd_dev;
         |                         ^~~~~~~~~~~~~
     'gr3d_init_power': event 1
       |
       |  396 |         struct device **opp_virt_devs, *pd_dev;
       |      |                         ^~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) use of uninitialized value '<un=
known>' here
       |

vim +396 drivers/gpu/drm/tegra/gr3d.c

5f60ed0d840d53 Thierry Reding  2013-02-28  391  =

2421b20d659069 Dmitry Osipenko 2021-12-01  392  static int gr3d_init_power(=
struct device *dev, struct gr3d *gr3d)
2421b20d659069 Dmitry Osipenko 2021-12-01  393  {
2421b20d659069 Dmitry Osipenko 2021-12-01  394  	static const char * const =
opp_genpd_names[] =3D { "3d0", "3d1", NULL };
2421b20d659069 Dmitry Osipenko 2021-12-01  395  	const u32 link_flags =3D D=
L_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
2421b20d659069 Dmitry Osipenko 2021-12-01 @396  	struct device **opp_virt_d=
evs, *pd_dev;
2421b20d659069 Dmitry Osipenko 2021-12-01  397  	struct device_link *link;
2421b20d659069 Dmitry Osipenko 2021-12-01  398  	unsigned int i;
2421b20d659069 Dmitry Osipenko 2021-12-01  399  	int err;
2421b20d659069 Dmitry Osipenko 2021-12-01  400  =

2421b20d659069 Dmitry Osipenko 2021-12-01  401  	err =3D of_count_phandle_w=
ith_args(dev->of_node, "power-domains",
2421b20d659069 Dmitry Osipenko 2021-12-01  402  					 "#power-domain-cells"=
);
5f60ed0d840d53 Thierry Reding  2013-02-28  403  	if (err < 0) {
2421b20d659069 Dmitry Osipenko 2021-12-01  404  		if (err !=3D -ENOENT)
2421b20d659069 Dmitry Osipenko 2021-12-01  405  			return err;
2421b20d659069 Dmitry Osipenko 2021-12-01  406  =

2421b20d659069 Dmitry Osipenko 2021-12-01  407  		/*
2421b20d659069 Dmitry Osipenko 2021-12-01  408  		 * Older device-trees don=
't use GENPD. In this case we should
2421b20d659069 Dmitry Osipenko 2021-12-01  409  		 * toggle power domain ma=
nually.
2421b20d659069 Dmitry Osipenko 2021-12-01  410  		 */
2421b20d659069 Dmitry Osipenko 2021-12-01  411  		err =3D gr3d_power_up_leg=
acy_domain(dev, "3d",
2421b20d659069 Dmitry Osipenko 2021-12-01  412  						  TEGRA_POWERGATE_3D);
2421b20d659069 Dmitry Osipenko 2021-12-01  413  		if (err)
2421b20d659069 Dmitry Osipenko 2021-12-01  414  			return err;
2421b20d659069 Dmitry Osipenko 2021-12-01  415  =

2421b20d659069 Dmitry Osipenko 2021-12-01  416  		err =3D gr3d_power_up_leg=
acy_domain(dev, "3d2",
2421b20d659069 Dmitry Osipenko 2021-12-01  417  						  TEGRA_POWERGATE_3D1=
);
2421b20d659069 Dmitry Osipenko 2021-12-01  418  		if (err)
2421b20d659069 Dmitry Osipenko 2021-12-01  419  			return err;
2421b20d659069 Dmitry Osipenko 2021-12-01  420  =

2421b20d659069 Dmitry Osipenko 2021-12-01  421  		return 0;
2421b20d659069 Dmitry Osipenko 2021-12-01  422  	}
2421b20d659069 Dmitry Osipenko 2021-12-01  423  =

2421b20d659069 Dmitry Osipenko 2021-12-01  424  	/*
2421b20d659069 Dmitry Osipenko 2021-12-01  425  	 * The PM domain core auto=
matically attaches a single power domain,
2421b20d659069 Dmitry Osipenko 2021-12-01  426  	 * otherwise it skips atta=
ching completely. We have a single domain
2421b20d659069 Dmitry Osipenko 2021-12-01  427  	 * on Tegra20 and two doma=
ins on Tegra30+.
2421b20d659069 Dmitry Osipenko 2021-12-01  428  	 */
2421b20d659069 Dmitry Osipenko 2021-12-01  429  	if (dev->pm_domain)
2421b20d659069 Dmitry Osipenko 2021-12-01  430  		return 0;
2421b20d659069 Dmitry Osipenko 2021-12-01  431  =

2421b20d659069 Dmitry Osipenko 2021-12-01  432  	err =3D devm_pm_opp_attach=
_genpd(dev, opp_genpd_names, &opp_virt_devs);
2421b20d659069 Dmitry Osipenko 2021-12-01  433  	if (err)
2421b20d659069 Dmitry Osipenko 2021-12-01  434  		return err;
2421b20d659069 Dmitry Osipenko 2021-12-01  435  =

2421b20d659069 Dmitry Osipenko 2021-12-01  436  	for (i =3D 0; opp_genpd_na=
mes[i]; i++) {
2421b20d659069 Dmitry Osipenko 2021-12-01  437  		pd_dev =3D opp_virt_devs[=
i];
2421b20d659069 Dmitry Osipenko 2021-12-01  438  		if (!pd_dev) {
2421b20d659069 Dmitry Osipenko 2021-12-01  439  			dev_err(dev, "failed to =
get %s power domain\n",
2421b20d659069 Dmitry Osipenko 2021-12-01  440  				opp_genpd_names[i]);
2421b20d659069 Dmitry Osipenko 2021-12-01  441  			return -EINVAL;
2421b20d659069 Dmitry Osipenko 2021-12-01  442  		}
2421b20d659069 Dmitry Osipenko 2021-12-01  443  =

2421b20d659069 Dmitry Osipenko 2021-12-01  444  		link =3D device_link_add(=
dev, pd_dev, link_flags);
2421b20d659069 Dmitry Osipenko 2021-12-01  445  		if (!link) {
2421b20d659069 Dmitry Osipenko 2021-12-01  446  			dev_err(dev, "failed to =
link to %s\n", dev_name(pd_dev));
2421b20d659069 Dmitry Osipenko 2021-12-01  447  			return -EINVAL;
2421b20d659069 Dmitry Osipenko 2021-12-01  448  		}
2421b20d659069 Dmitry Osipenko 2021-12-01  449  =

2421b20d659069 Dmitry Osipenko 2021-12-01  450  		err =3D devm_add_action_o=
r_reset(dev, gr3d_del_link, link);
2421b20d659069 Dmitry Osipenko 2021-12-01  451  		if (err)
5f60ed0d840d53 Thierry Reding  2013-02-28  452  			return err;
5f60ed0d840d53 Thierry Reding  2013-02-28  453  	}
5f60ed0d840d53 Thierry Reding  2013-02-28  454  =

2421b20d659069 Dmitry Osipenko 2021-12-01  455  	return 0;
2421b20d659069 Dmitry Osipenko 2021-12-01  456  }
2421b20d659069 Dmitry Osipenko 2021-12-01  457  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2557898945037170035==--

