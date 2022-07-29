Content-Type: multipart/mixed; boundary="===============3437230260852797613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/berlin2-adc.c:242:18: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Fri, 29 Jul 2022 12:07:16 +0800
Message-ID: <202207291103.Q338HxHN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3437230260852797613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/iio/adc/berlin2-adc.c:242:18: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexandru Ardelean <aardelean@deviqon.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hi Alexandru,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   33ea1340bafe1f394e5bf96fceef73e9771d066b
commit: 8ee724ee4ebcb53f109c5d144f1b9eac966cc6f9 iio: adc: Kconfig: add COM=
PILE_TEST dep for berlin2-adc
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220724 (https://download.01.org/0day-ci/archi=
ve/20220729/202207291103.Q338HxHN-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8ee724ee4ebcb53f109c5d144f1b9eac966cc6f9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8ee724ee4ebcb53f109c5d144f1b9eac966cc6f9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/iio/iio.h:10,
                    from drivers/iio/adc/berlin2-adc.c:13:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always eval=
uate as 'true' for the address of 'mem_section' will never be NULL [-Waddre=
ss]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS=
_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/iio/adc/berlin2-adc.c: In function 'berlin2_adc_irq':
>> drivers/iio/adc/berlin2-adc.c:242:18: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     242 |         unsigned val;
         |                  ^~~
     'berlin2_adc_irq': event 1
       |
       |  242 |         unsigned val;
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
       |
   drivers/iio/adc/berlin2-adc.c: In function 'berlin2_adc_tsen_irq':
   drivers/iio/adc/berlin2-adc.c:262:18: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     262 |         unsigned val;
         |                  ^~~
     'berlin2_adc_tsen_irq': event 1
       |
       |  262 |         unsigned val;
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
       |

vim +242 drivers/iio/adc/berlin2-adc.c

70f1937911caeb Antoine Tenart 2015-05-18  238  =

70f1937911caeb Antoine Tenart 2015-05-18  239  static irqreturn_t berlin2_a=
dc_irq(int irq, void *private)
70f1937911caeb Antoine Tenart 2015-05-18  240  {
70f1937911caeb Antoine Tenart 2015-05-18  241  	struct berlin2_adc_priv *pr=
iv =3D iio_priv(private);
70f1937911caeb Antoine Tenart 2015-05-18 @242  	unsigned val;
70f1937911caeb Antoine Tenart 2015-05-18  243  =

70f1937911caeb Antoine Tenart 2015-05-18  244  	regmap_read(priv->regmap, B=
ERLIN2_SM_ADC_STATUS, &val);
70f1937911caeb Antoine Tenart 2015-05-18  245  	if (val & BERLIN2_SM_ADC_ST=
ATUS_DATA_RDY_MASK) {
70f1937911caeb Antoine Tenart 2015-05-18  246  		regmap_read(priv->regmap, =
BERLIN2_SM_ADC_DATA, &priv->data);
70f1937911caeb Antoine Tenart 2015-05-18  247  		priv->data &=3D BERLIN2_SM=
_ADC_MASK;
70f1937911caeb Antoine Tenart 2015-05-18  248  =

70f1937911caeb Antoine Tenart 2015-05-18  249  		val &=3D ~BERLIN2_SM_ADC_S=
TATUS_DATA_RDY_MASK;
70f1937911caeb Antoine Tenart 2015-05-18  250  		regmap_write(priv->regmap,=
 BERLIN2_SM_ADC_STATUS, val);
70f1937911caeb Antoine Tenart 2015-05-18  251  =

70f1937911caeb Antoine Tenart 2015-05-18  252  		priv->data_available =3D t=
rue;
70f1937911caeb Antoine Tenart 2015-05-18  253  		wake_up_interruptible(&pri=
v->wq);
70f1937911caeb Antoine Tenart 2015-05-18  254  	}
70f1937911caeb Antoine Tenart 2015-05-18  255  =

70f1937911caeb Antoine Tenart 2015-05-18  256  	return IRQ_HANDLED;
70f1937911caeb Antoine Tenart 2015-05-18  257  }
70f1937911caeb Antoine Tenart 2015-05-18  258  =


:::::: The code at line 242 was first introduced by commit
:::::: 70f1937911caebd961833314b41a618a33a5130a iio: adc: add support for B=
erlin

:::::: TO: Antoine Tenart <antoine.tenart@free-electrons.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3437230260852797613==--

