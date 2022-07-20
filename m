Content-Type: multipart/mixed; boundary="===============5694678516048598933=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/leds/flash/leds-mt6360.c:339:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 20 Jul 2022 16:27:36 +0800
Message-ID: <202207201633.6XxCDoTh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5694678516048598933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/l=
eds/flash/leds-mt6360.c:339:13: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gene Chen <gene_chen@richtek.com>
CC: Pavel Machek <pavel@ucw.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: 679f8652064bfa2f622c7b2bab86b1bf3207d6bc leds: Add mt6360 driver
date:   6 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220720/202207201633.6XxCDoTh-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D679f8652064bfa2f622c7b2bab86b1bf3207d6bc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 679f8652064bfa2f622c7b2bab86b1bf3207d6bc
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/leds/flash/leds-mt6360.c: In function 'mt6360_fault_get':
>> drivers/leds/flash/leds-mt6360.c:339:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     339 |         u16 fled_stat;
         |             ^~~~~~~~~
     'mt6360_fault_get': event 1
       |
       |  339 |         u16 fled_stat;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/leds/flash/leds-mt6360.c:340:22: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     340 |         unsigned int chg_stat, strobe_timeout_mask, fled_short_m=
ask;
         |                      ^~~~~~~~
     'mt6360_fault_get': event 1
       |
       |  340 |         unsigned int chg_stat, strobe_timeout_mask, fled_sh=
ort_mask;
       |      |                      ^~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/leds/flash/leds-mt6360.c: In function 'mt6360_isnk_init_default_=
state':
   drivers/leds/flash/leds-mt6360.c:391:22: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     391 |         unsigned int regval;
         |                      ^~~~~~
     'mt6360_isnk_init_default_state': event 1
       |
       |  391 |         unsigned int regval;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/leds/flash/leds-mt6360.c: In function 'mt6360_flash_init_default=
_state':
   drivers/leds/flash/leds-mt6360.c:427:22: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     427 |         unsigned int regval;
         |                      ^~~~~~
     'mt6360_flash_init_default_state': event 1
       |
       |  427 |         unsigned int regval;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/leds/flash/leds-mt6360.c: In function 'mt6360_init_isnk_properti=
es':
   drivers/leds/flash/leds-mt6360.c:624:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     624 |         u32 val;
         |             ^~~
     'mt6360_init_isnk_properties': event 1
       |
       |  624 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/leds/flash/leds-mt6360.c:636:29: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     636 |                         u32 reg, color;
         |                             ^~~
     'mt6360_init_isnk_properties': events 1-3
       |
       |  627 |         if (led->led_no =3D=3D MT6360_VIRTUAL_MULTICOLOR) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |......
       |  630 |                 sub_led =3D devm_kzalloc(priv->dev,
       |      |                           ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (2) ...to here
       |  631 |                         sizeof(*sub_led) * MULTICOLOR_NUM_C=
HANNELS, GFP_KERNEL);
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |  632 |                 if (!sub_led)
       |      |                    ~
       |      |                    |
       |      |                    (3) following 'false' branch...
       |
     'mt6360_init_isnk_properties': event 4
       |
       |  635 |                 fwnode_for_each_child_node(init_data->fwnod=
e, child) {
       |      |                                            ~~~~~~~~~^~~~~~~~
       |      |                                                     |
       |      |                                                     (4) ...=
to here
   include/linux/property.h:101:49: note: in definition of macro 'fwnode_fo=
r_each_child_node'
       |  101 |         for (child =3D fwnode_get_next_child_node(fwnode, N=
ULL); child;   \
       |      |                                                 ^~~~~~
       |
     'mt6360_init_isnk_properties': event 5
       |
       |drivers/leds/flash/leds-mt6360.c:635:63:
       |  635 |                 fwnode_for_each_child_node(init_data->fwnod=
e, child) {
       |      |                                                            =
   ^~~~~
       |      |                                                            =
   |
       |      |                                                            =
   (5) following 'true' branch (when 'child' is non-NULL)...
   include/linux/property.h:101:64: note: in definition of macro 'fwnode_fo=
r_each_child_node'
       |  101 |         for (child =3D fwnode_get_next_child_node(fwnode, N=
ULL); child;   \
       |      |                                                            =
    ^~~~~
       |
     'mt6360_init_isnk_properties': events 6-7
       |
       |drivers/leds/flash/leds-mt6360.c:636:29:
       |  636 |                         u32 reg, color;
       |      |                             ^~~
       |      |                             |

vim +339 drivers/leds/flash/leds-mt6360.c

679f8652064bfa Gene Chen 2021-11-15  333  =

679f8652064bfa Gene Chen 2021-11-15  334  static int mt6360_fault_get(struc=
t led_classdev_flash *fl_cdev, u32 *fault)
679f8652064bfa Gene Chen 2021-11-15  335  {
679f8652064bfa Gene Chen 2021-11-15  336  	struct mt6360_led *led =3D
679f8652064bfa Gene Chen 2021-11-15  337  		container_of(fl_cdev, struct mt=
6360_led, flash);
679f8652064bfa Gene Chen 2021-11-15  338  	struct mt6360_priv *priv =3D led=
->priv;
679f8652064bfa Gene Chen 2021-11-15 @339  	u16 fled_stat;
679f8652064bfa Gene Chen 2021-11-15  340  	unsigned int chg_stat, strobe_ti=
meout_mask, fled_short_mask;
679f8652064bfa Gene Chen 2021-11-15  341  	u32 rfault =3D 0;
679f8652064bfa Gene Chen 2021-11-15  342  	int ret;
679f8652064bfa Gene Chen 2021-11-15  343  =

679f8652064bfa Gene Chen 2021-11-15  344  	mutex_lock(&priv->lock);
679f8652064bfa Gene Chen 2021-11-15  345  	ret =3D regmap_read(priv->regmap=
, MT6360_REG_CHGSTAT2, &chg_stat);
679f8652064bfa Gene Chen 2021-11-15  346  	if (ret)
679f8652064bfa Gene Chen 2021-11-15  347  		goto unlock;
679f8652064bfa Gene Chen 2021-11-15  348  =

679f8652064bfa Gene Chen 2021-11-15  349  	ret =3D regmap_raw_read(priv->re=
gmap, MT6360_REG_FLEDSTAT1, &fled_stat,
679f8652064bfa Gene Chen 2021-11-15  350  			      sizeof(fled_stat));
679f8652064bfa Gene Chen 2021-11-15  351  	if (ret)
679f8652064bfa Gene Chen 2021-11-15  352  		goto unlock;
679f8652064bfa Gene Chen 2021-11-15  353  =

679f8652064bfa Gene Chen 2021-11-15  354  	if (led->led_no =3D=3D MT6360_LE=
D_FLASH1) {
679f8652064bfa Gene Chen 2021-11-15  355  		strobe_timeout_mask =3D MT6360_=
FLED1STRBTO_MASK;
679f8652064bfa Gene Chen 2021-11-15  356  		fled_short_mask =3D MT6360_FLED=
1SHORT_MASK;
679f8652064bfa Gene Chen 2021-11-15  357  	} else {
679f8652064bfa Gene Chen 2021-11-15  358  		strobe_timeout_mask =3D MT6360_=
FLED2STRBTO_MASK;
679f8652064bfa Gene Chen 2021-11-15  359  		fled_short_mask =3D MT6360_FLED=
2SHORT_MASK;
679f8652064bfa Gene Chen 2021-11-15  360  	}
679f8652064bfa Gene Chen 2021-11-15  361  =

679f8652064bfa Gene Chen 2021-11-15  362  	if (chg_stat & MT6360_FLEDCHGVIN=
OVP_MASK)
679f8652064bfa Gene Chen 2021-11-15  363  		rfault |=3D LED_FAULT_INPUT_VOL=
TAGE;
679f8652064bfa Gene Chen 2021-11-15  364  =

679f8652064bfa Gene Chen 2021-11-15  365  	if (fled_stat & strobe_timeout_m=
ask)
679f8652064bfa Gene Chen 2021-11-15  366  		rfault |=3D LED_FAULT_TIMEOUT;
679f8652064bfa Gene Chen 2021-11-15  367  =

679f8652064bfa Gene Chen 2021-11-15  368  	if (fled_stat & fled_short_mask)
679f8652064bfa Gene Chen 2021-11-15  369  		rfault |=3D LED_FAULT_SHORT_CIR=
CUIT;
679f8652064bfa Gene Chen 2021-11-15  370  =

679f8652064bfa Gene Chen 2021-11-15  371  	if (fled_stat & MT6360_FLEDLVF_M=
ASK)
679f8652064bfa Gene Chen 2021-11-15  372  		rfault |=3D LED_FAULT_UNDER_VOL=
TAGE;
679f8652064bfa Gene Chen 2021-11-15  373  =

679f8652064bfa Gene Chen 2021-11-15  374  	*fault =3D rfault;
679f8652064bfa Gene Chen 2021-11-15  375  unlock:
679f8652064bfa Gene Chen 2021-11-15  376  	mutex_unlock(&priv->lock);
679f8652064bfa Gene Chen 2021-11-15  377  	return ret;
679f8652064bfa Gene Chen 2021-11-15  378  }
679f8652064bfa Gene Chen 2021-11-15  379  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5694678516048598933==--

