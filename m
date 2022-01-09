Content-Type: multipart/mixed; boundary="===============9200059822871712832=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/7] iio: adc: sc27xx: add support for PMIC sc2720 and sc2721
Date: Sun, 09 Jan 2022 12:48:41 +0800
Message-ID: <202201091245.f4fNhDsc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9200059822871712832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220106125947.139523-5-gengcixi@gmail.com>
References: <20220106125947.139523-5-gengcixi@gmail.com>
TO: Cixi Geng <gengcixi@gmail.com>
TO: orsonzhai(a)gmail.com
TO: baolin.wang7(a)gmail.com
TO: zhang.lyra(a)gmail.com
TO: jic23(a)kernel.org
TO: lars(a)metafoo.de
TO: robh+dt(a)kernel.org
TO: lgirdwood(a)gmail.com
TO: broonie(a)kernel.org
CC: yuming.zhu1(a)unisoc.com
CC: linux-iio(a)vger.kernel.org

Hi Cixi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cixi-Geng/iio-adc-sc27xx-a=
djust-structure-and-add-PMIC-s-support/20220106-210151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-c004-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201091245.f4fNhDsc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/cd6ab0edd81be2a2adf0a3c88=
d3386311de1b1a9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cixi-Geng/iio-adc-sc27xx-adjust-st=
ructure-and-add-PMIC-s-support/20220106-210151
        git checkout cd6ab0edd81be2a2adf0a3c88d3386311de1b1a9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/input/keyboard/pmic8xxx-keypad.c:194:7: note: Calling 'pmic8xxx_=
kp_read_data'
           rc =3D pmic8xxx_kp_read_data(kp, new_state, KEYP_RECENT_DATA,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:160:2: note: Loop condition is =
true.  Entering loop body
           for (row =3D 0; row < read_rows; row++) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:162:7: note: Assuming 'rc' is n=
ot equal to 0
                   if (rc)
                       ^~
   drivers/input/keyboard/pmic8xxx-keypad.c:162:3: note: Taking true branch
                   if (rc)
                   ^
   drivers/input/keyboard/pmic8xxx-keypad.c:163:4: note: Returning without =
writing to '*state'
                           return rc;
                           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:194:7: note: Returning from 'pm=
ic8xxx_kp_read_data'
           rc =3D pmic8xxx_kp_read_data(kp, new_state, KEYP_RECENT_DATA,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:196:6: note: Assuming 'rc' is >=
=3D 0
           if (rc < 0) {
               ^~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:196:2: note: Taking false branch
           if (rc < 0) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:206:6: note: Assuming 'rc' is >=
=3D 0
           if (rc < 0) {
               ^~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:206:2: note: Taking false branch
           if (rc < 0) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:213:6: note: Assuming 'rc' is >=
=3D 0
           if (rc < 0)
               ^~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:213:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:216:2: note: Returning without =
writing to '*new_state'
           return rc;
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:334:7: note: Returning from 'pm=
ic8xxx_kp_read_matrix'
           rc =3D pmic8xxx_kp_read_matrix(kp, new_state, old_state);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:335:6: note: 'rc' is >=3D 0
           if (rc < 0) {
               ^~
   drivers/input/keyboard/pmic8xxx-keypad.c:335:2: note: Taking false branch
           if (rc < 0) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:340:2: note: Calling '__pmic8xx=
x_kp_scan_matrix'
           __pmic8xxx_kp_scan_matrix(kp, new_state, kp->stuckstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:224:7: note: The value 0 is ass=
igned to 'row'
           for (row =3D 0; row < kp->num_rows; row++) {
                ^~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:224:16: note: Assuming 'row' is=
 < field 'num_rows'
           for (row =3D 0; row < kp->num_rows; row++) {
                         ^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:224:2: note: Loop condition is =
true.  Entering loop body
           for (row =3D 0; row < kp->num_rows; row++) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:225:37: note: The left operand =
of '^' is a garbage value
                   int bits_changed =3D new_state[row] ^ old_state[row];
                                      ~~~~~~~~~~~~~~ ^
   drivers/input/keyboard/pmic8xxx-keypad.c:257:33: warning: The left opera=
nd of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRe=
sult]
                   row_state =3D (~new_state[row]) &
                                                 ^
   drivers/input/keyboard/pmic8xxx-keypad.c:352:6: note: Assuming 'rc' is >=
=3D 0
           if (rc < 0) {
               ^~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:352:2: note: Taking false branch
           if (rc < 0) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:359:7: note: Calling 'pmic8xxx_=
kp_scan_matrix'
           rc =3D pmic8xxx_kp_scan_matrix(kp, events);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:280:2: note: Control jumps to '=
case 1:' @line 281
           switch (events) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:283:7: note: 'rc' is >=3D 0
                   if (rc < 0)
                       ^~
   drivers/input/keyboard/pmic8xxx-keypad.c:283:3: note: Taking false branch
                   if (rc < 0)
                   ^
   drivers/input/keyboard/pmic8xxx-keypad.c:287:7: note: Calling 'pmic8xxx_=
detect_ghost_keys'
                   if (pmic8xxx_detect_ghost_keys(kp, new_state))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:256:16: note: Assuming 'row' is=
 < field 'num_rows'
           for (row =3D 0; row < kp->num_rows; row++) {
                         ^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/pmic8xxx-keypad.c:256:2: note: Loop condition is =
true.  Entering loop body
           for (row =3D 0; row < kp->num_rows; row++) {
           ^
   drivers/input/keyboard/pmic8xxx-keypad.c:257:33: note: The left operand =
of '&' is a garbage value
                   row_state =3D (~new_state[row]) &
                                ~~~~~~~~~~~~~~~  ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/iio/adc/sc27xx_adc.c:461:8: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                   *val =3D value;
                        ^ ~~~~~
   drivers/iio/adc/sc27xx_adc.c:368:11: note: 'value' declared without an i=
nitial value
           u32 tmp, value, status;
                    ^~~~~
   drivers/iio/adc/sc27xx_adc.c:371:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/sc27xx_adc.c:371:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/sc27xx_adc.c:381:6: note: Assuming field 'pmic_type' is =
equal to SC2721_ADC
           if (data->var_data->pmic_type =3D=3D SC2721_ADC) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/sc27xx_adc.c:381:2: note: Taking true branch
           if (data->var_data->pmic_type =3D=3D SC2721_ADC) {
           ^
   drivers/iio/adc/sc27xx_adc.c:382:8: note: Assuming 'channel' is equal to=
 30
                   if ((channel =3D=3D 30) || (channel =3D=3D 31)) {
                        ^~~~~~~~~~~~~
   drivers/iio/adc/sc27xx_adc.c:382:23: note: Left side of '||' is true
                   if ((channel =3D=3D 30) || (channel =3D=3D 31)) {
                                       ^
   drivers/iio/adc/sc27xx_adc.c:386:8: note: Assuming 'ret' is 0
                           if (ret) {
                               ^~~
   drivers/iio/adc/sc27xx_adc.c:386:4: note: Taking false branch
                           if (ret) {
                           ^
   drivers/iio/adc/sc27xx_adc.c:396:6: note: Assuming 'ret' is not equal to=
 0
           if (ret)
               ^~~
   drivers/iio/adc/sc27xx_adc.c:396:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/adc/sc27xx_adc.c:397:3: note: Control jumps to line 448
                   goto unlock_adc;
                   ^
   drivers/iio/adc/sc27xx_adc.c:448:22: note: Field 'pmic_type' is equal to=
 SC2721_ADC
           if (data->var_data->pmic_type =3D=3D SC2721_ADC) {
                               ^
   drivers/iio/adc/sc27xx_adc.c:448:2: note: Taking true branch
           if (data->var_data->pmic_type =3D=3D SC2721_ADC) {
           ^
   drivers/iio/adc/sc27xx_adc.c:449:8: note: 'channel' is equal to 30
                   if ((channel =3D=3D 30) || (channel =3D=3D 31)) {
                        ^~~~~~~
   drivers/iio/adc/sc27xx_adc.c:449:23: note: Left side of '||' is true
                   if ((channel =3D=3D 30) || (channel =3D=3D 31)) {
                                       ^
   drivers/iio/adc/sc27xx_adc.c:453:8: note: Assuming 'ret' is 0
                           if (ret)
                               ^~~
   drivers/iio/adc/sc27xx_adc.c:453:4: note: Taking false branch
                           if (ret)
                           ^
   drivers/iio/adc/sc27xx_adc.c:460:7: note: 'ret' is 0
           if (!ret)
                ^~~
   drivers/iio/adc/sc27xx_adc.c:460:2: note: Taking true branch
           if (!ret)
           ^
   drivers/iio/adc/sc27xx_adc.c:461:8: note: Assigned value is garbage or u=
ndefined
                   *val =3D value;
                        ^ ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: warning: Passed-by-value st=
ruct argument contains uninitialized data (e.g., field: 'id_size') [clang-a=
nalyzer-core.CallAndMessage]
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   drivers/hwspinlock/qcom_hwspinlock.c:132:2: note: 'field' initialized he=
re
           struct reg_field field;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:140:6: note: Left side of '&&' is t=
rue
           if (IS_ERR(regmap) && PTR_ERR(regmap) =3D=3D -ENODEV)
               ^
   drivers/hwspinlock/qcom_hwspinlock.c:140:2: note: Taking true branch
           if (IS_ERR(regmap) && PTR_ERR(regmap) =3D=3D -ENODEV)
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Calling 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Returning from 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:2: note: Taking false branch
           if (IS_ERR(regmap))

vim +461 drivers/iio/adc/sc27xx_adc.c

b39db3bcbc9a96 Cixi Geng   2022-01-06  363  =

5df362a6cf49ca Freeman Liu 2018-06-21  364  static int sc27xx_adc_read(stru=
ct sc27xx_adc_data *data, int channel,
5df362a6cf49ca Freeman Liu 2018-06-21  365  			   int scale, int *val)
5df362a6cf49ca Freeman Liu 2018-06-21  366  {
5df362a6cf49ca Freeman Liu 2018-06-21  367  	int ret;
8de877d2bba5c3 Freeman Liu 2019-07-25  368  	u32 tmp, value, status;
5df362a6cf49ca Freeman Liu 2018-06-21  369  =

5df362a6cf49ca Freeman Liu 2018-06-21  370  	ret =3D hwspin_lock_timeout_ra=
w(data->hwlock, SC27XX_ADC_HWLOCK_TIMEOUT);
5df362a6cf49ca Freeman Liu 2018-06-21  371  	if (ret) {
5df362a6cf49ca Freeman Liu 2018-06-21  372  		dev_err(data->dev, "timeout t=
o get the hwspinlock\n");
5df362a6cf49ca Freeman Liu 2018-06-21  373  		return ret;
5df362a6cf49ca Freeman Liu 2018-06-21  374  	}
5df362a6cf49ca Freeman Liu 2018-06-21  375  =

cd6ab0edd81be2 Cixi Geng   2022-01-06  376  	/*
cd6ab0edd81be2 Cixi Geng   2022-01-06  377  	 * According to the sc2721 chi=
p data sheet, the reference voltage of
cd6ab0edd81be2 Cixi Geng   2022-01-06  378  	 * specific channel 30 and cha=
nnel 31 in ADC module needs to be set from
cd6ab0edd81be2 Cixi Geng   2022-01-06  379  	 * the default 2.8v to 3.5v.
cd6ab0edd81be2 Cixi Geng   2022-01-06  380  	 */
cd6ab0edd81be2 Cixi Geng   2022-01-06  381  	if (data->var_data->pmic_type =
=3D=3D SC2721_ADC) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  382  		if ((channel =3D=3D 30) || (c=
hannel =3D=3D 31)) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  383  			ret =3D regulator_set_voltag=
e(data->volref,
cd6ab0edd81be2 Cixi Geng   2022-01-06  384  						SC27XX_ADC_REFVOL_VDD35,
cd6ab0edd81be2 Cixi Geng   2022-01-06  385  						SC27XX_ADC_REFVOL_VDD35);
cd6ab0edd81be2 Cixi Geng   2022-01-06  386  			if (ret) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  387  				dev_err(data->dev, "failed =
to set the volref 3.5V\n");
cd6ab0edd81be2 Cixi Geng   2022-01-06  388  				hwspin_unlock_raw(data->hwl=
ock);
cd6ab0edd81be2 Cixi Geng   2022-01-06  389  				return ret;
cd6ab0edd81be2 Cixi Geng   2022-01-06  390  			}
cd6ab0edd81be2 Cixi Geng   2022-01-06  391  		}
cd6ab0edd81be2 Cixi Geng   2022-01-06  392  	}
cd6ab0edd81be2 Cixi Geng   2022-01-06  393  =

5df362a6cf49ca Freeman Liu 2018-06-21  394  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  395  				 SC27XX_ADC_EN, SC27XX_ADC_=
EN);
5df362a6cf49ca Freeman Liu 2018-06-21  396  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  397  		goto unlock_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  398  =

8de877d2bba5c3 Freeman Liu 2019-07-25  399  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_INT_CLR,
8de877d2bba5c3 Freeman Liu 2019-07-25  400  				 SC27XX_ADC_IRQ_CLR, SC27XX=
_ADC_IRQ_CLR);
8de877d2bba5c3 Freeman Liu 2019-07-25  401  	if (ret)
8de877d2bba5c3 Freeman Liu 2019-07-25  402  		goto disable_adc;
8de877d2bba5c3 Freeman Liu 2019-07-25  403  =

5df362a6cf49ca Freeman Liu 2018-06-21  404  	/* Configure the channel id an=
d scale */
b39db3bcbc9a96 Cixi Geng   2022-01-06  405  	tmp =3D (scale << data->var_da=
ta->scale_shift) & data->var_data->scale_mask;
5df362a6cf49ca Freeman Liu 2018-06-21  406  	tmp |=3D channel & SC27XX_ADC_=
CHN_ID_MASK;
5df362a6cf49ca Freeman Liu 2018-06-21  407  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CH_CFG,
b39db3bcbc9a96 Cixi Geng   2022-01-06  408  				 SC27XX_ADC_CHN_ID_MASK |
b39db3bcbc9a96 Cixi Geng   2022-01-06  409  				 data->var_data->scale_mask,
5df362a6cf49ca Freeman Liu 2018-06-21  410  				 tmp);
5df362a6cf49ca Freeman Liu 2018-06-21  411  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  412  		goto disable_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  413  =

5df362a6cf49ca Freeman Liu 2018-06-21  414  	/* Select 12bit conversion mod=
e, and only sample 1 time */
5df362a6cf49ca Freeman Liu 2018-06-21  415  	tmp =3D SC27XX_ADC_12BIT_MODE;
5df362a6cf49ca Freeman Liu 2018-06-21  416  	tmp |=3D (0 << SC27XX_ADC_RUN_=
NUM_SHIFT) & SC27XX_ADC_RUN_NUM_MASK;
5df362a6cf49ca Freeman Liu 2018-06-21  417  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  418  				 SC27XX_ADC_RUN_NUM_MASK | =
SC27XX_ADC_12BIT_MODE,
5df362a6cf49ca Freeman Liu 2018-06-21  419  				 tmp);
5df362a6cf49ca Freeman Liu 2018-06-21  420  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  421  		goto disable_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  422  =

5df362a6cf49ca Freeman Liu 2018-06-21  423  	ret =3D regmap_update_bits(dat=
a->regmap, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  424  				 SC27XX_ADC_CHN_RUN, SC27XX=
_ADC_CHN_RUN);
5df362a6cf49ca Freeman Liu 2018-06-21  425  	if (ret)
5df362a6cf49ca Freeman Liu 2018-06-21  426  		goto disable_adc;
5df362a6cf49ca Freeman Liu 2018-06-21  427  =

8de877d2bba5c3 Freeman Liu 2019-07-25  428  	ret =3D regmap_read_poll_timeo=
ut(data->regmap,
8de877d2bba5c3 Freeman Liu 2019-07-25  429  				       data->base + SC27XX_=
ADC_INT_RAW,
8de877d2bba5c3 Freeman Liu 2019-07-25  430  				       status, (status & SC=
27XX_ADC_IRQ_RAW),
8de877d2bba5c3 Freeman Liu 2019-07-25  431  				       SC27XX_ADC_POLL_RAW_=
STATUS,
8de877d2bba5c3 Freeman Liu 2019-07-25  432  				       SC27XX_ADC_RDY_TIMEO=
UT);
8de877d2bba5c3 Freeman Liu 2019-07-25  433  	if (ret) {
8de877d2bba5c3 Freeman Liu 2019-07-25  434  		dev_err(data->dev, "read adc =
timeout, status =3D 0x%x\n", status);
8de877d2bba5c3 Freeman Liu 2019-07-25  435  		goto disable_adc;
750ac07eb2c856 Freeman Liu 2018-11-09  436  	}
5df362a6cf49ca Freeman Liu 2018-06-21  437  =

8de877d2bba5c3 Freeman Liu 2019-07-25  438  	ret =3D regmap_read(data->regm=
ap, data->base + SC27XX_ADC_DATA, &value);
8de877d2bba5c3 Freeman Liu 2019-07-25  439  	if (ret)
8de877d2bba5c3 Freeman Liu 2019-07-25  440  		goto disable_adc;
8de877d2bba5c3 Freeman Liu 2019-07-25  441  =

8de877d2bba5c3 Freeman Liu 2019-07-25  442  	value &=3D SC27XX_ADC_DATA_MAS=
K;
8de877d2bba5c3 Freeman Liu 2019-07-25  443  =

5df362a6cf49ca Freeman Liu 2018-06-21  444  disable_adc:
5df362a6cf49ca Freeman Liu 2018-06-21  445  	regmap_update_bits(data->regma=
p, data->base + SC27XX_ADC_CTL,
5df362a6cf49ca Freeman Liu 2018-06-21  446  			   SC27XX_ADC_EN, 0);
5df362a6cf49ca Freeman Liu 2018-06-21  447  unlock_adc:
cd6ab0edd81be2 Cixi Geng   2022-01-06  448  	if (data->var_data->pmic_type =
=3D=3D SC2721_ADC) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  449  		if ((channel =3D=3D 30) || (c=
hannel =3D=3D 31)) {
cd6ab0edd81be2 Cixi Geng   2022-01-06  450  			ret =3D regulator_set_voltag=
e(data->volref,
cd6ab0edd81be2 Cixi Geng   2022-01-06  451  						    SC27XX_ADC_REFVOL_VDD=
28,
cd6ab0edd81be2 Cixi Geng   2022-01-06  452  						    SC27XX_ADC_REFVOL_VDD=
28);
cd6ab0edd81be2 Cixi Geng   2022-01-06  453  			if (ret)
cd6ab0edd81be2 Cixi Geng   2022-01-06  454  				dev_err(data->dev, "failed =
to set the volref 2.8V\n");
cd6ab0edd81be2 Cixi Geng   2022-01-06  455  		}
cd6ab0edd81be2 Cixi Geng   2022-01-06  456  	}
cd6ab0edd81be2 Cixi Geng   2022-01-06  457  =

5df362a6cf49ca Freeman Liu 2018-06-21  458  	hwspin_unlock_raw(data->hwlock=
);
5df362a6cf49ca Freeman Liu 2018-06-21  459  =

5df362a6cf49ca Freeman Liu 2018-06-21  460  	if (!ret)
8de877d2bba5c3 Freeman Liu 2019-07-25 @461  		*val =3D value;
5df362a6cf49ca Freeman Liu 2018-06-21  462  =

5df362a6cf49ca Freeman Liu 2018-06-21  463  	return ret;
5df362a6cf49ca Freeman Liu 2018-06-21  464  }
5df362a6cf49ca Freeman Liu 2018-06-21  465  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9200059822871712832==--

