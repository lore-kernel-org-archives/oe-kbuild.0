Content-Type: multipart/mixed; boundary="===============6771189168282845047=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/4] leds: pca955x: Add HW blink support
Date: Tue, 12 Apr 2022 12:51:12 +0800
Message-ID: <202204121228.Q9ABnTaA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6771189168282845047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411162033.39613-5-eajames@linux.ibm.com>
References: <20220411162033.39613-5-eajames@linux.ibm.com>
TO: Eddie James <eajames@linux.ibm.com>
TO: linux-leds(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: pavel(a)ucw.cz
CC: patrick(a)stwcx.xyz
CC: andy.shevchenko(a)gmail.com
CC: openbmc(a)lists.ozlabs.org
CC: joel(a)jms.id.au
CC: Eddie James <eajames@linux.ibm.com>

Hi Eddie,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on linus/master v5.18-rc2 next-20220411]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/leds-pca=
955x-Add-HW-blink-support/20220412-002330
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-c002-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204121228.Q9ABnTaA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/3b7b1899f6cc6dd0287=
e9626280d869c673aa75e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eddie-James/leds-pca955x-Add-HW-bl=
ink-support/20220412-002330
        git checkout 3b7b1899f6cc6dd0287e9626280d869c673aa75e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^
   drivers/iio/light/veml6030.c:346:8: note: Calling 'veml6030_get_intgrn_t=
m'
           ret =3D veml6030_get_intgrn_tm(indio_dev, &x, &y);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:221:6: note: Assuming 'ret' is not equal to=
 0
           if (ret) {
               ^~~
   drivers/iio/light/veml6030.c:221:2: note: Taking true branch
           if (ret) {
           ^
   drivers/iio/light/veml6030.c:222:3: note: Loop condition is false.  Exit=
ing loop
                   dev_err(&data->client->dev,
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/iio/light/veml6030.c:224:3: note: Returning without writing to '=
*val2'
                   return ret;
                   ^
   drivers/iio/light/veml6030.c:346:8: note: Returning from 'veml6030_get_i=
ntgrn_tm'
           ret =3D veml6030_get_intgrn_tm(indio_dev, &x, &y);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:347:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/veml6030.c:347:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/veml6030.c:350:6: note: Assuming 'val' is not equal to=
 0
           if (!val) {
               ^~~~
   drivers/iio/light/veml6030.c:350:2: note: Taking false branch
           if (!val) {
           ^
   drivers/iio/light/veml6030.c:353:8: note: Assuming 'val' is not equal to=
 1
                   if ((val =3D=3D 1) && (val2 =3D=3D 600000))
                        ^~~~~~~~
   drivers/iio/light/veml6030.c:353:18: note: Left side of '&&' is false
                   if ((val =3D=3D 1) && (val2 =3D=3D 600000))
                                  ^
   drivers/iio/light/veml6030.c:355:13: note: Assuming 'val' is not equal t=
o 3
                   else if ((val =3D=3D 3) && (val2 =3D=3D 200000))
                             ^~~~~~~~
   drivers/iio/light/veml6030.c:355:23: note: Left side of '&&' is false
                   else if ((val =3D=3D 3) && (val2 =3D=3D 200000))
                                       ^
   drivers/iio/light/veml6030.c:357:13: note: Assuming 'val' is equal to 6
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                             ^~~~~~~~
   drivers/iio/light/veml6030.c:357:12: note: Left side of '&&' is true
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                            ^
   drivers/iio/light/veml6030.c:357:27: note: Assuming 'val2' is equal to 4=
00000
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                                           ^~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:357:8: note: Taking true branch
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                        ^
   drivers/iio/light/veml6030.c:358:21: note: The right operand of '/' is a=
 garbage value
                           period =3D 6400000 / y;
                                            ^ ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/leds/leds-pca955x.c:455:2: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/leds/leds-pca955x.c:396:2: note: 'ret' declared without an initi=
al value
           int ret;
           ^~~~~~~
   drivers/leds/leds-pca955x.c:400:6: note: Assuming 'p' is 0
           if (p) {
               ^
   drivers/leds/leds-pca955x.c:400:2: note: Taking false branch
           if (p) {
           ^
   drivers/leds/leds-pca955x.c:412:7: note: Assuming field 'active_blink' i=
s 0
                   p =3D pca955x->active_blink ? pca955x->blink_period :
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca955x.c:412:7: note: '?' condition is false
   drivers/leds/leds-pca955x.c:416:16: note: Field 'active_blink' is 0
           if (!pca955x->active_blink ||
                         ^
   drivers/leds/leds-pca955x.c:416:29: note: Left side of '||' is true
           if (!pca955x->active_blink ||
                                      ^
   drivers/leds/leds-pca955x.c:421:8: note: '?' condition is false
                   if (!test_and_set_bit(pca955x_led->led_num,
                        ^
   arch/arm/include/asm/bitops.h:192:33: note: expanded from macro 'test_an=
d_set_bit'
   #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr=
,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/leds/leds-pca955x.c:421:7: note: Assuming the condition is false
                   if (!test_and_set_bit(pca955x_led->led_num,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca955x.c:421:3: note: Taking false branch
                   if (!test_and_set_bit(pca955x_led->led_num,
                   ^
   drivers/leds/leds-pca955x.c:437:7: note: Assuming 'p' is equal to field =
'blink_period'
                   if (pca955x->blink_period !=3D p) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca955x.c:437:3: note: Taking false branch
                   if (pca955x->blink_period !=3D p) {
                   ^
   drivers/leds/leds-pca955x.c:455:2: note: Undefined or garbage value retu=
rned to caller
           return ret;
           ^      ~~~
   drivers/leds/leds-pca955x.c:713:16: warning: 1st function call argument =
is an uninitialized value [clang-analyzer-core.CallAndMessage]
                                   ls2[reg] =3D pca955x_ledsel(ls2[reg], bi=
t,
                                              ^              ~~~~~~~~
   drivers/leds/leds-pca955x.c:620:6: note: Assuming 'md' is non-null
           if (md) {
               ^~
   drivers/leds/leds-pca955x.c:620:2: note: Taking true branch
           if (md) {
           ^
   drivers/leds/leds-pca955x.c:637:6: note: Assuming 'pdata' is non-null
           if (!pdata) {
               ^~~~~~
   drivers/leds/leds-pca955x.c:637:2: note: Taking false branch
           if (!pdata) {
           ^
   drivers/leds/leds-pca955x.c:644:6: note: Assuming the condition is false
           if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca955x.c:644:2: note: Taking false branch
           if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=3D
           ^
   drivers/leds/leds-pca955x.c:651:2: note: Loop condition is false.  Exiti=
ng loop
           dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver=
 at "
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/leds/leds-pca955x.c:655:2: note: Taking false branch
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
           ^
   drivers/leds/leds-pca955x.c:658:6: note: Assuming field 'num_leds' is eq=
ual to field 'bits'
           if (pdata->num_leds !=3D chip->bits) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca955x.c:658:2: note: Taking false branch
           if (pdata->num_leds !=3D chip->bits) {
           ^
   drivers/leds/leds-pca955x.c:666:6: note: Assuming 'pca955x' is non-null
           if (!pca955x)
               ^~~~~~~~
   drivers/leds/leds-pca955x.c:666:2: note: Taking false branch
           if (!pca955x)
           ^
   drivers/leds/leds-pca955x.c:669:18: note: Calling 'devm_kcalloc'

vim +455 drivers/leds/leds-pca955x.c

3b7b1899f6cc6d Eddie James      2022-04-11  389  =

3b7b1899f6cc6d Eddie James      2022-04-11  390  static int pca955x_led_bli=
nk(struct led_classdev *led_cdev,
3b7b1899f6cc6d Eddie James      2022-04-11  391  			     unsigned long *del=
ay_on, unsigned long *delay_off)
3b7b1899f6cc6d Eddie James      2022-04-11  392  {
3b7b1899f6cc6d Eddie James      2022-04-11  393  	struct pca955x_led *pca95=
5x_led =3D led_to_pca955x(led_cdev);
3b7b1899f6cc6d Eddie James      2022-04-11  394  	struct pca955x *pca955x =
=3D pca955x_led->pca955x;
3b7b1899f6cc6d Eddie James      2022-04-11  395  	unsigned long p =3D *dela=
y_on + *delay_off;
3b7b1899f6cc6d Eddie James      2022-04-11  396  	int ret;
3b7b1899f6cc6d Eddie James      2022-04-11  397  =

3b7b1899f6cc6d Eddie James      2022-04-11  398  	mutex_lock(&pca955x->lock=
);
3b7b1899f6cc6d Eddie James      2022-04-11  399  =

3b7b1899f6cc6d Eddie James      2022-04-11  400  	if (p) {
3b7b1899f6cc6d Eddie James      2022-04-11  401  		if (*delay_on !=3D *dela=
y_off) {
3b7b1899f6cc6d Eddie James      2022-04-11  402  			ret =3D -EINVAL;
3b7b1899f6cc6d Eddie James      2022-04-11  403  			goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  404  		}
3b7b1899f6cc6d Eddie James      2022-04-11  405  =

3b7b1899f6cc6d Eddie James      2022-04-11  406  		if (p < pca955x_psc_to_p=
eriod(pca955x, 0) ||
3b7b1899f6cc6d Eddie James      2022-04-11  407  		    p > pca955x_psc_to_p=
eriod(pca955x, 0xff)) {
3b7b1899f6cc6d Eddie James      2022-04-11  408  			ret =3D -EINVAL;
3b7b1899f6cc6d Eddie James      2022-04-11  409  			goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  410  		}
3b7b1899f6cc6d Eddie James      2022-04-11  411  	} else {
3b7b1899f6cc6d Eddie James      2022-04-11  412  		p =3D pca955x->active_bl=
ink ? pca955x->blink_period :
3b7b1899f6cc6d Eddie James      2022-04-11  413  			PCA955X_BLINK_DEFAULT_M=
S;
3b7b1899f6cc6d Eddie James      2022-04-11  414  	}
3b7b1899f6cc6d Eddie James      2022-04-11  415  =

3b7b1899f6cc6d Eddie James      2022-04-11  416  	if (!pca955x->active_blin=
k ||
3b7b1899f6cc6d Eddie James      2022-04-11  417  	    pca955x->active_blink=
 =3D=3D BIT(pca955x_led->led_num) ||
3b7b1899f6cc6d Eddie James      2022-04-11  418  	    pca955x->blink_period=
 =3D=3D p) {
3b7b1899f6cc6d Eddie James      2022-04-11  419  		u8 psc =3D pca955x_perio=
d_to_psc(pca955x, p);
f46e9203d9a100 Nate Case        2008-07-16  420  =

3b7b1899f6cc6d Eddie James      2022-04-11  421  		if (!test_and_set_bit(pc=
a955x_led->led_num,
3b7b1899f6cc6d Eddie James      2022-04-11  422  				      &pca955x->active=
_blink)) {
3b7b1899f6cc6d Eddie James      2022-04-11  423  			u8 ls;
3b7b1899f6cc6d Eddie James      2022-04-11  424  			int reg =3D pca955x_led=
->led_num / 4;
3b7b1899f6cc6d Eddie James      2022-04-11  425  			int bit =3D pca955x_led=
->led_num % 4;
3b7b1899f6cc6d Eddie James      2022-04-11  426  =

3b7b1899f6cc6d Eddie James      2022-04-11  427  			ret =3D pca955x_read_ls=
(pca955x, reg, &ls);
3b7b1899f6cc6d Eddie James      2022-04-11  428  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  429  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  430  =

3b7b1899f6cc6d Eddie James      2022-04-11  431  			ls =3D pca955x_ledsel(l=
s, bit, PCA955X_LS_BLINK0);
9e58c2a7bb91f6 Eddie James      2022-04-11  432  			ret =3D pca955x_write_l=
s(pca955x, reg, ls);
3b7b1899f6cc6d Eddie James      2022-04-11  433  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  434  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  435  		}
3b7b1899f6cc6d Eddie James      2022-04-11  436  =

3b7b1899f6cc6d Eddie James      2022-04-11  437  		if (pca955x->blink_perio=
d !=3D p) {
3b7b1899f6cc6d Eddie James      2022-04-11  438  			pca955x->blink_period =
=3D p;
3b7b1899f6cc6d Eddie James      2022-04-11  439  			ret =3D pca955x_write_p=
sc(pca955x, 0, psc);
3b7b1899f6cc6d Eddie James      2022-04-11  440  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  441  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  442  		}
3b7b1899f6cc6d Eddie James      2022-04-11  443  =

3b7b1899f6cc6d Eddie James      2022-04-11  444  		p =3D pca955x_psc_to_per=
iod(pca955x, psc);
3b7b1899f6cc6d Eddie James      2022-04-11  445  		p /=3D 2;
3b7b1899f6cc6d Eddie James      2022-04-11  446  		*delay_on =3D p;
3b7b1899f6cc6d Eddie James      2022-04-11  447  		*delay_off =3D p;
3b7b1899f6cc6d Eddie James      2022-04-11  448  	} else {
3b7b1899f6cc6d Eddie James      2022-04-11  449  		ret =3D -EBUSY;
3b7b1899f6cc6d Eddie James      2022-04-11  450  	}
e7e11d8ba807d4 Alexander Stein  2012-05-29  451  =

1591caf2d5eafd C=C3=A9dric Le Goater 2017-08-30  452  out:
e7e11d8ba807d4 Alexander Stein  2012-05-29  453  	mutex_unlock(&pca955x->lo=
ck);
f46e9203d9a100 Nate Case        2008-07-16  454  =

1591caf2d5eafd C=C3=A9dric Le Goater 2017-08-30 @455  	return ret;
f46e9203d9a100 Nate Case        2008-07-16  456  }
f46e9203d9a100 Nate Case        2008-07-16  457  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6771189168282845047==--

