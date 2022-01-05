Content-Type: multipart/mixed; boundary="===============6328513500374052530=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: st-delta: Fix PM disable depth imbalance in delta_probe
Date: Thu, 06 Jan 2022 07:08:12 +0800
Message-ID: <202201060724.NNqAORgm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6328513500374052530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105115515.12196-1-linmq006@gmail.com>
References: <20220105115515.12196-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/media-st-delt=
a-Fix-PM-disable-depth-imbalance-in-delta_probe/20220105-195600
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: mips-randconfig-s032-20220105 (https://download.01.org/0day-ci/arch=
ive/20220106/202201060724.NNqAORgm-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/df377b6adc1cca5963348f9ac=
16f033e5da299cb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/media-st-delta-Fix-PM=
-disable-depth-imbalance-in-delta_probe/20220105-195600
        git checkout df377b6adc1cca5963348f9ac16f033e5da299cb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash drivers/media/platform/sti/delta/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/media/platform/sti/delta/delta-v4l2.c:1901:1: sparse: sparse: un=
used label 'disable_pm_runtime'

vim +/disable_pm_runtime +1901 drivers/media/platform/sti/delta/delta-v4l2.c

f386509e4959459 Hugues Fruchet 2017-02-02  1812  =

f386509e4959459 Hugues Fruchet 2017-02-02  1813  static int delta_probe(str=
uct platform_device *pdev)
f386509e4959459 Hugues Fruchet 2017-02-02  1814  {
f386509e4959459 Hugues Fruchet 2017-02-02  1815  	struct delta_dev *delta;
f386509e4959459 Hugues Fruchet 2017-02-02  1816  	struct device *dev =3D &p=
dev->dev;
f386509e4959459 Hugues Fruchet 2017-02-02  1817  	int ret;
f386509e4959459 Hugues Fruchet 2017-02-02  1818  =

f386509e4959459 Hugues Fruchet 2017-02-02  1819  	delta =3D devm_kzalloc(de=
v, sizeof(*delta), GFP_KERNEL);
f386509e4959459 Hugues Fruchet 2017-02-02  1820  	if (!delta) {
f386509e4959459 Hugues Fruchet 2017-02-02  1821  		ret =3D -ENOMEM;
f386509e4959459 Hugues Fruchet 2017-02-02  1822  		goto err;
f386509e4959459 Hugues Fruchet 2017-02-02  1823  	}
f386509e4959459 Hugues Fruchet 2017-02-02  1824  =

f386509e4959459 Hugues Fruchet 2017-02-02  1825  	delta->dev =3D dev;
f386509e4959459 Hugues Fruchet 2017-02-02  1826  	delta->pdev =3D pdev;
f386509e4959459 Hugues Fruchet 2017-02-02  1827  	platform_set_drvdata(pdev=
, delta);
f386509e4959459 Hugues Fruchet 2017-02-02  1828  =

f386509e4959459 Hugues Fruchet 2017-02-02  1829  	mutex_init(&delta->lock);
f386509e4959459 Hugues Fruchet 2017-02-02  1830  =

f386509e4959459 Hugues Fruchet 2017-02-02  1831  	/* get clock resources */
f386509e4959459 Hugues Fruchet 2017-02-02  1832  	delta->clk_delta =3D devm=
_clk_get(dev, "delta");
f386509e4959459 Hugues Fruchet 2017-02-02  1833  	if (IS_ERR(delta->clk_del=
ta)) {
f386509e4959459 Hugues Fruchet 2017-02-02  1834  		dev_dbg(dev, "%s can't g=
et delta clock\n", DELTA_PREFIX);
f386509e4959459 Hugues Fruchet 2017-02-02  1835  		delta->clk_delta =3D NUL=
L;
f386509e4959459 Hugues Fruchet 2017-02-02  1836  	}
f386509e4959459 Hugues Fruchet 2017-02-02  1837  =

f386509e4959459 Hugues Fruchet 2017-02-02  1838  	delta->clk_st231 =3D devm=
_clk_get(dev, "delta-st231");
f386509e4959459 Hugues Fruchet 2017-02-02  1839  	if (IS_ERR(delta->clk_st2=
31)) {
f386509e4959459 Hugues Fruchet 2017-02-02  1840  		dev_dbg(dev, "%s can't g=
et delta-st231 clock\n", DELTA_PREFIX);
f386509e4959459 Hugues Fruchet 2017-02-02  1841  		delta->clk_st231 =3D NUL=
L;
f386509e4959459 Hugues Fruchet 2017-02-02  1842  	}
f386509e4959459 Hugues Fruchet 2017-02-02  1843  =

f386509e4959459 Hugues Fruchet 2017-02-02  1844  	delta->clk_flash_promip =
=3D devm_clk_get(dev, "delta-flash-promip");
f386509e4959459 Hugues Fruchet 2017-02-02  1845  	if (IS_ERR(delta->clk_fla=
sh_promip)) {
f386509e4959459 Hugues Fruchet 2017-02-02  1846  		dev_dbg(dev, "%s can't g=
et delta-flash-promip clock\n",
f386509e4959459 Hugues Fruchet 2017-02-02  1847  			DELTA_PREFIX);
f386509e4959459 Hugues Fruchet 2017-02-02  1848  		delta->clk_flash_promip =
=3D NULL;
f386509e4959459 Hugues Fruchet 2017-02-02  1849  	}
f386509e4959459 Hugues Fruchet 2017-02-02  1850  =

f386509e4959459 Hugues Fruchet 2017-02-02  1851  	/* init pm_runtime used f=
or power management */
f386509e4959459 Hugues Fruchet 2017-02-02  1852  	pm_runtime_set_autosuspen=
d_delay(dev, DELTA_HW_AUTOSUSPEND_DELAY_MS);
f386509e4959459 Hugues Fruchet 2017-02-02  1853  	pm_runtime_use_autosuspen=
d(dev);
f386509e4959459 Hugues Fruchet 2017-02-02  1854  	pm_runtime_set_suspended(=
dev);
f386509e4959459 Hugues Fruchet 2017-02-02  1855  	pm_runtime_enable(dev);
f386509e4959459 Hugues Fruchet 2017-02-02  1856  =

91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1857  	/* init firmware ipc chan=
nel */
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1858  	ret =3D delta_ipc_init(de=
lta);
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1859  	if (ret) {
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1860  		dev_err(delta->dev, "%s =
failed to initialize firmware ipc channel\n",
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1861  			DELTA_PREFIX);
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1862  		goto err;
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1863  	}
91c83f395fbe7c8 Hugues Fruchet 2017-02-02  1864  =

f386509e4959459 Hugues Fruchet 2017-02-02  1865  	/* register all available=
 decoders */
f386509e4959459 Hugues Fruchet 2017-02-02  1866  	register_decoders(delta);
f386509e4959459 Hugues Fruchet 2017-02-02  1867  =

f386509e4959459 Hugues Fruchet 2017-02-02  1868  	/* register all supported=
 formats */
f386509e4959459 Hugues Fruchet 2017-02-02  1869  	register_formats(delta);
f386509e4959459 Hugues Fruchet 2017-02-02  1870  =

f386509e4959459 Hugues Fruchet 2017-02-02  1871  	/* register on V4L2 */
f386509e4959459 Hugues Fruchet 2017-02-02  1872  	ret =3D v4l2_device_regis=
ter(dev, &delta->v4l2_dev);
f386509e4959459 Hugues Fruchet 2017-02-02  1873  	if (ret) {
f386509e4959459 Hugues Fruchet 2017-02-02  1874  		dev_err(delta->dev, "%s =
failed to register V4L2 device\n",
f386509e4959459 Hugues Fruchet 2017-02-02  1875  			DELTA_PREFIX);
f386509e4959459 Hugues Fruchet 2017-02-02  1876  		goto err;
f386509e4959459 Hugues Fruchet 2017-02-02  1877  	}
f386509e4959459 Hugues Fruchet 2017-02-02  1878  =

f386509e4959459 Hugues Fruchet 2017-02-02  1879  	delta->work_queue =3D cre=
ate_workqueue(DELTA_NAME);
f386509e4959459 Hugues Fruchet 2017-02-02  1880  	if (!delta->work_queue) {
f386509e4959459 Hugues Fruchet 2017-02-02  1881  		dev_err(delta->dev, "%s =
failed to allocate work queue\n",
f386509e4959459 Hugues Fruchet 2017-02-02  1882  			DELTA_PREFIX);
f386509e4959459 Hugues Fruchet 2017-02-02  1883  		ret =3D -ENOMEM;
f386509e4959459 Hugues Fruchet 2017-02-02  1884  		goto err_v4l2;
f386509e4959459 Hugues Fruchet 2017-02-02  1885  	}
f386509e4959459 Hugues Fruchet 2017-02-02  1886  =

f386509e4959459 Hugues Fruchet 2017-02-02  1887  	/* register device */
f386509e4959459 Hugues Fruchet 2017-02-02  1888  	ret =3D delta_register_de=
vice(delta);
f386509e4959459 Hugues Fruchet 2017-02-02  1889  	if (ret)
f386509e4959459 Hugues Fruchet 2017-02-02  1890  		goto err_work_queue;
f386509e4959459 Hugues Fruchet 2017-02-02  1891  =

f386509e4959459 Hugues Fruchet 2017-02-02  1892  	dev_info(dev, "%s %s regi=
stered as /dev/video%d\n",
f386509e4959459 Hugues Fruchet 2017-02-02  1893  		 DELTA_PREFIX, delta->vd=
ev->name, delta->vdev->num);
f386509e4959459 Hugues Fruchet 2017-02-02  1894  =

f386509e4959459 Hugues Fruchet 2017-02-02  1895  	return 0;
f386509e4959459 Hugues Fruchet 2017-02-02  1896  =

f386509e4959459 Hugues Fruchet 2017-02-02  1897  err_work_queue:
f386509e4959459 Hugues Fruchet 2017-02-02  1898  	destroy_workqueue(delta->=
work_queue);
f386509e4959459 Hugues Fruchet 2017-02-02  1899  err_v4l2:
f386509e4959459 Hugues Fruchet 2017-02-02  1900  	v4l2_device_unregister(&d=
elta->v4l2_dev);
df377b6adc1cca5 Miaoqian Lin   2022-01-05 @1901  disable_pm_runtime:
df377b6adc1cca5 Miaoqian Lin   2022-01-05  1902  	pm_runtime_disable(dev);
f386509e4959459 Hugues Fruchet 2017-02-02  1903  err:
f386509e4959459 Hugues Fruchet 2017-02-02  1904  	return ret;
f386509e4959459 Hugues Fruchet 2017-02-02  1905  }
f386509e4959459 Hugues Fruchet 2017-02-02  1906  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6328513500374052530==--

