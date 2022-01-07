Content-Type: multipart/mixed; boundary="===============7655690112700336278=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: mapphone-mdm6600: Fix PM disable depth imbalance in phy_mdm6600_probe
Date: Fri, 07 Jan 2022 18:01:27 +0800
Message-ID: <202201071716.1G7oTDdI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7655690112700336278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105123947.17946-1-linmq006@gmail.com>
References: <20220105123947.17946-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>
CC: linmq006(a)gmail.com
CC: Kishon Vijay Abraham I <kishon@ti.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Tony Lindgren <tony@atomide.com>
CC: linux-phy(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc8 next-20220106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/phy-mapphone-=
mdm6600-Fix-PM-disable-depth-imbalance-in-phy_mdm6600_probe/20220105-204113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
c9e6606c7fe92b50a02ce51dda82586ebdf99b48
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-s032-20220107 (https://download.01.org/0day-ci/a=
rchive/20220107/202201071716.1G7oTDdI-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/62cad5a4dd9feab731b40f99e=
6e0bf7a2429f1ed
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/phy-mapphone-mdm6600-=
Fix-PM-disable-depth-imbalance-in-phy_mdm6600_probe/20220105-204113
        git checkout 62cad5a4dd9feab731b40f99e6e0bf7a2429f1ed
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
parc64 SHELL=3D/bin/bash drivers/phy/motorola/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/phy/motorola/phy-mapphone-mdm6600.c:633:1: sparse: sparse: unuse=
d label 'disable_pm'

vim +/disable_pm +633 drivers/phy/motorola/phy-mapphone-mdm6600.c

5d1ebbda0318b1 Tony Lindgren 2018-03-08  555  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  556  static int phy_mdm6600_probe(=
struct platform_device *pdev)
5d1ebbda0318b1 Tony Lindgren 2018-03-08  557  {
5d1ebbda0318b1 Tony Lindgren 2018-03-08  558  	struct phy_mdm6600 *ddata;
5d1ebbda0318b1 Tony Lindgren 2018-03-08  559  	int error;
5d1ebbda0318b1 Tony Lindgren 2018-03-08  560  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  561  	ddata =3D devm_kzalloc(&pdev=
->dev, sizeof(*ddata), GFP_KERNEL);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  562  	if (!ddata)
5d1ebbda0318b1 Tony Lindgren 2018-03-08  563  		return -ENOMEM;
5d1ebbda0318b1 Tony Lindgren 2018-03-08  564  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  565  	INIT_DELAYED_WORK(&ddata->bo=
otup_work,
5d1ebbda0318b1 Tony Lindgren 2018-03-08  566  			  phy_mdm6600_deferred_pow=
er_on);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  567  	INIT_DELAYED_WORK(&ddata->st=
atus_work, phy_mdm6600_status);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  568  	INIT_DELAYED_WORK(&ddata->mo=
dem_wake_work, phy_mdm6600_modem_wake);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  569  	init_completion(&ddata->ack);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  570  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  571  	ddata->dev =3D &pdev->dev;
5d1ebbda0318b1 Tony Lindgren 2018-03-08  572  	platform_set_drvdata(pdev, d=
data);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  573  =

2ad2af0816221a Tony Lindgren 2018-12-02  574  	/* Active state selected in =
phy_mdm6600_power_on() */
2ad2af0816221a Tony Lindgren 2018-12-02  575  	error =3D pinctrl_pm_select_=
sleep_state(ddata->dev);
2ad2af0816221a Tony Lindgren 2018-12-02  576  	if (error)
2ad2af0816221a Tony Lindgren 2018-12-02  577  		dev_warn(ddata->dev, "%s: e=
rror with sleep_state: %i\n",
2ad2af0816221a Tony Lindgren 2018-12-02  578  			 __func__, error);
2ad2af0816221a Tony Lindgren 2018-12-02  579  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  580  	error =3D phy_mdm6600_init_l=
ines(ddata);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  581  	if (error)
5d1ebbda0318b1 Tony Lindgren 2018-03-08  582  		return error;
5d1ebbda0318b1 Tony Lindgren 2018-03-08  583  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  584  	phy_mdm6600_init_irq(ddata);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  585  	schedule_delayed_work(&ddata=
->bootup_work, 0);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  586  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  587  	/*
5d1ebbda0318b1 Tony Lindgren 2018-03-08  588  	 * See phy_mdm6600_device_po=
wer_on(). We should be able
5d1ebbda0318b1 Tony Lindgren 2018-03-08  589  	 * to remove this eventually=
 when ohci-platform can deal
5d1ebbda0318b1 Tony Lindgren 2018-03-08  590  	 * with -EPROBE_DEFER.
5d1ebbda0318b1 Tony Lindgren 2018-03-08  591  	 */
5d1ebbda0318b1 Tony Lindgren 2018-03-08  592  	msleep(PHY_MDM6600_PHY_DELAY=
_MS + 500);
5d1ebbda0318b1 Tony Lindgren 2018-03-08  593  =

f7f50b2a7b0546 Tony Lindgren 2018-05-06  594  	/*
f7f50b2a7b0546 Tony Lindgren 2018-05-06  595  	 * Enable PM runtime only af=
ter PHY has been powered up properly.
f7f50b2a7b0546 Tony Lindgren 2018-05-06  596  	 * It is currently only need=
ed after USB suspends mdm6600 and n_gsm
f7f50b2a7b0546 Tony Lindgren 2018-05-06  597  	 * needs to access the devic=
e. We don't want to do this earlier as
f7f50b2a7b0546 Tony Lindgren 2018-05-06  598  	 * gpio mode0 pin doubles as=
 mdm6600 wake-up gpio.
f7f50b2a7b0546 Tony Lindgren 2018-05-06  599  	 */
f7f50b2a7b0546 Tony Lindgren 2018-05-06  600  	pm_runtime_use_autosuspend(d=
data->dev);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  601  	pm_runtime_set_autosuspend_d=
elay(ddata->dev,
f7f50b2a7b0546 Tony Lindgren 2018-05-06  602  					 MDM6600_MODEM_IDLE_DELA=
Y_MS);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  603  	pm_runtime_enable(ddata->dev=
);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  604  	error =3D pm_runtime_get_syn=
c(ddata->dev);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  605  	if (error < 0) {
f7f50b2a7b0546 Tony Lindgren 2018-05-06  606  		dev_warn(ddata->dev, "faile=
d to wake modem: %i\n", error);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  607  		pm_runtime_put_noidle(ddata=
->dev);
2ad2af0816221a Tony Lindgren 2018-12-02  608  		goto cleanup;
2ad2af0816221a Tony Lindgren 2018-12-02  609  	}
2ad2af0816221a Tony Lindgren 2018-12-02  610  =

2ad2af0816221a Tony Lindgren 2018-12-02  611  	ddata->generic_phy =3D devm_=
phy_create(ddata->dev, NULL, &gpio_usb_ops);
2ad2af0816221a Tony Lindgren 2018-12-02  612  	if (IS_ERR(ddata->generic_ph=
y)) {
2ad2af0816221a Tony Lindgren 2018-12-02  613  		error =3D PTR_ERR(ddata->ge=
neric_phy);
2ad2af0816221a Tony Lindgren 2018-12-02  614  		goto idle;
f7f50b2a7b0546 Tony Lindgren 2018-05-06  615  	}
2ad2af0816221a Tony Lindgren 2018-12-02  616  =

2ad2af0816221a Tony Lindgren 2018-12-02  617  	phy_set_drvdata(ddata->gener=
ic_phy, ddata);
2ad2af0816221a Tony Lindgren 2018-12-02  618  =

2ad2af0816221a Tony Lindgren 2018-12-02  619  	ddata->phy_provider =3D
2ad2af0816221a Tony Lindgren 2018-12-02  620  		devm_of_phy_provider_regist=
er(ddata->dev,
2ad2af0816221a Tony Lindgren 2018-12-02  621  					      of_phy_simple_xlat=
e);
2ad2af0816221a Tony Lindgren 2018-12-02  622  	if (IS_ERR(ddata->phy_provid=
er))
2ad2af0816221a Tony Lindgren 2018-12-02  623  		error =3D PTR_ERR(ddata->ph=
y_provider);
2ad2af0816221a Tony Lindgren 2018-12-02  624  =

2ad2af0816221a Tony Lindgren 2018-12-02  625  idle:
f7f50b2a7b0546 Tony Lindgren 2018-05-06  626  	pm_runtime_mark_last_busy(dd=
ata->dev);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  627  	pm_runtime_put_autosuspend(d=
data->dev);
f7f50b2a7b0546 Tony Lindgren 2018-05-06  628  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  629  cleanup:
2ad2af0816221a Tony Lindgren 2018-12-02  630  	if (error < 0)
5d1ebbda0318b1 Tony Lindgren 2018-03-08  631  		phy_mdm6600_device_power_of=
f(ddata);
2ad2af0816221a Tony Lindgren 2018-12-02  632  =

62cad5a4dd9fea Miaoqian Lin  2022-01-05 @633  disable_pm:
62cad5a4dd9fea Miaoqian Lin  2022-01-05  634  	pm_runtime_disable(ddata->de=
v);
62cad5a4dd9fea Miaoqian Lin  2022-01-05  635  =

5d1ebbda0318b1 Tony Lindgren 2018-03-08  636  	return error;
5d1ebbda0318b1 Tony Lindgren 2018-03-08  637  }
5d1ebbda0318b1 Tony Lindgren 2018-03-08  638  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7655690112700336278==--

