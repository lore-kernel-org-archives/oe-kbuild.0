Content-Type: multipart/mixed; boundary="===============5101105257611103503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/bd9576-regulator.c:809:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 25 Apr 2022 09:10:03 +0800
Message-ID: <202204250912.VBrm0DzE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5101105257611103503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen =
<mazziesaccount@gmail.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   af2d861d4cd2a4da5137f795ee3509e6f944a25b
commit: e7bf1fa58c46db9f72220c4472272d6da0a54c91 regulator: bd9576: Support=
 error reporting
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220424 (https://download.01.org/0day-ci/archi=
ve/20220425/202204250912.VBrm0DzE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De7bf1fa58c46db9f72220c4472272d6da0a54c91
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e7bf1fa58c46db9f72220c4472272d6da0a54c91
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/of/overlay.c:259:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(new_prop->value, target_path);
           ^~~~~~
   drivers/of/overlay.c:259:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(new_prop->value, target_path);
           ^~~~~~
   drivers/of/overlay.c:260:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(new_prop->value + target_path_len, path_tail);
           ^~~~~~
   drivers/of/overlay.c:260:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(new_prop->value + target_path_len, path_tail);
           ^~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/regulator/as3722-regulator.c:46:8: warning: Excessive padding in=
 'struct as3722_register_mapping' (14 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   sname, =

   n_voltages, =

   enable_reg, =

   control_reg, =

   sleep_ctrl_reg, =

   regulator_id, =

   vsel_reg, =

   vsel_mask, =

   enable_mask, =

   mode_mask, =

   sleep_ctrl_mask, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct as3722_register_mapping {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/as3722-regulator.c:46:8: note: Excessive padding in 's=
truct as3722_register_mapping' (14 padding bytes, where 2 is optimal). Opti=
mal fields order: name, sname, n_voltages, enable_reg, control_reg, sleep_c=
trl_reg, regulator_id, vsel_reg, vsel_mask, enable_mask, mode_mask, sleep_c=
trl_mask, consider reordering the fields or adding explicit padding members
   struct as3722_register_mapping {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/regulator/bcm590xx-regulator.c:140:8: warning: Excessive padding=
 in 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   vin_name, =

   volt_table, =

   linear_ranges, =

   n_voltages, =

   n_linear_ranges, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:140:8: note: Excessive padding in=
 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). Optimal fiel=
ds order: name, vin_name, volt_table, linear_ranges, n_voltages, n_linear_r=
anges, consider reordering the fields or adding explicit padding members
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/regulator/bd9576-regulator.c:809:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(d->regmap, BD957X_REG_INT_UVD_STAT,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9576-regulator.c:809:2: note: Value stored to 'ret' =
is never read
           ret =3D regmap_write(d->regmap, BD957X_REG_INT_UVD_STAT,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9576-regulator.c:1009:7: warning: Branch condition e=
valuates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (may_have_irqs) {
                       ^~~~~~~~~~~~~
   drivers/regulator/bd9576-regulator.c:894:27: note: 'may_have_irqs' decla=
red without an initial value
           bool vout_mode, ddr_sel, may_have_irqs;
                                    ^~~~~~~~~~~~~
   drivers/regulator/bd9576-regulator.c:930:6: note: Assuming 'regmap' is n=
on-null
           if (!regmap) {
               ^~~~~~~
   drivers/regulator/bd9576-regulator.c:930:2: note: Taking false branch
           if (!regmap) {
           ^
   drivers/regulator/bd9576-regulator.c:936:14: note: Calling 'of_property_=
read_bool'
           vout_mode =3D of_property_read_bool(pdev->dev.parent->of_node,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1230:9: note: Assuming 'prop' is null
           return prop ? true : false;
                  ^~~~
   include/linux/of.h:1230:9: note: '?' condition is false
   include/linux/of.h:1230:2: note: Returning zero, which participates in a=
 condition later
           return prop ? true : false;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9576-regulator.c:936:14: note: Returning from 'of_pr=
operty_read_bool'
           vout_mode =3D of_property_read_bool(pdev->dev.parent->of_node,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9576-regulator.c:938:6: note: 'vout_mode' is false
           if (vout_mode) {
               ^~~~~~~~~
   drivers/regulator/bd9576-regulator.c:938:2: note: Taking false branch
           if (vout_mode) {
           ^
   drivers/regulator/bd9576-regulator.c:985:6: note: 'ddr_sel' is false
           if (ddr_sel)
               ^~~~~~~
   drivers/regulator/bd9576-regulator.c:985:2: note: Taking false branch
           if (ddr_sel)
           ^
   drivers/regulator/bd9576-regulator.c:990:2: note: Control jumps to 'case=
 ROHM_CHIP_TYPE_BD9573:'  at line 995
           switch (chip) {
           ^
   drivers/regulator/bd9576-regulator.c:996:3: note: Taking true branch
                   dev_dbg(&pdev->dev, "Found BD9573MUF\n");
                   ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/regulator/bd9576-regulator.c:996:3: note: Loop condition is fals=
e.  Exiting loop
                   dev_dbg(&pdev->dev, "Found BD9573MUF\n");
                   ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/regulator/bd9576-regulator.c:997:3: note:  Execution continues o=
n line 1003
                   break;
                   ^
   drivers/regulator/bd9576-regulator.c:1003:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < num_reg_data; i++) {
           ^
   drivers/regulator/bd9576-regulator.c:1009:7: note: Branch condition eval=
uates to a garbage value
                   if (may_have_irqs) {
                       ^~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/jfs/jfs_imap.c:1086:28: warning: Access to field 'data' results in a =
dereference of a null pointer (loaded from variable 'amp') [clang-analyzer-=
core.NullDereference]
                                   ciagp =3D (struct iag *) amp->data;
                                                          ^~~
   fs/jfs/jfs_imap.c:873:6: note: Assuming 'iagno' is < field 'in_nextiag'
           if (iagno >=3D imap->im_nextiag) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:873:2: note: Taking false branch
           if (iagno >=3D imap->im_nextiag) {
           ^
   fs/jfs/jfs_imap.c:896:7: note: Assuming 'rc' is 0
           if ((rc =3D diIAGRead(imap, iagno, &mp))) {
                ^~
   fs/jfs/jfs_imap.c:896:2: note: Taking false branch

vim +/ret +809 drivers/regulator/bd9576-regulator.c

e7bf1fa58c46db Matti Vaittinen 2021-06-03  770  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  771  static int bd9576_uvd_handl=
er(int irq, struct regulator_irq_data *rid,
e7bf1fa58c46db Matti Vaittinen 2021-06-03  772  			      unsigned long *dev=
_mask)
e7bf1fa58c46db Matti Vaittinen 2021-06-03  773  {
e7bf1fa58c46db Matti Vaittinen 2021-06-03  774  	int val, ret, i;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  775  	struct bd957x_data *d =3D =
(struct bd957x_data *)rid->data;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  776  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  777  	ret =3D regmap_read(d->reg=
map, BD957X_REG_INT_UVD_STAT, &val);
e7bf1fa58c46db Matti Vaittinen 2021-06-03  778  	if (ret)
e7bf1fa58c46db Matti Vaittinen 2021-06-03  779  		return REGULATOR_FAILED_R=
ETRY;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  780  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  781  	*dev_mask =3D 0;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  782  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  783  	rid->opaque =3D val & UVD_=
IRQ_VALID_MASK;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  784  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  785  	/*
e7bf1fa58c46db Matti Vaittinen 2021-06-03  786  	 * Go through the set stat=
us bits and report either error or warning
e7bf1fa58c46db Matti Vaittinen 2021-06-03  787  	 * to the notifier dependi=
ng on what was flagged in DT
e7bf1fa58c46db Matti Vaittinen 2021-06-03  788  	 */
e7bf1fa58c46db Matti Vaittinen 2021-06-03  789  	*dev_mask =3D val & BD9576=
_xVD_IRQ_MASK_VOUT1TO4;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  790  	/* There is 1 bit gap in r=
egister after Vout1 .. Vout4 statuses */
e7bf1fa58c46db Matti Vaittinen 2021-06-03  791  	*dev_mask |=3D ((val & BD9=
576_xVD_IRQ_MASK_VOUTL1) >> 1);
e7bf1fa58c46db Matti Vaittinen 2021-06-03  792  	/*
e7bf1fa58c46db Matti Vaittinen 2021-06-03  793  	 * We (ab)use the uvd for =
OCW notification. DT parsing should
e7bf1fa58c46db Matti Vaittinen 2021-06-03  794  	 * have added correct OCW =
flag to uvd_notif and uvd_err for S1
e7bf1fa58c46db Matti Vaittinen 2021-06-03  795  	 */
e7bf1fa58c46db Matti Vaittinen 2021-06-03  796  	*dev_mask |=3D ((val & BD9=
576_UVD_IRQ_MASK_VOUTS1_OCW) >> 1);
e7bf1fa58c46db Matti Vaittinen 2021-06-03  797  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  798  	for_each_set_bit(i, dev_ma=
sk, 6) {
e7bf1fa58c46db Matti Vaittinen 2021-06-03  799  		struct bd957x_regulator_d=
ata *rdata;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  800  		struct regulator_err_stat=
e *stat;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  801  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  802  		rdata =3D &d->regulator_d=
ata[i];
e7bf1fa58c46db Matti Vaittinen 2021-06-03  803  		stat  =3D &rid->states[i];
e7bf1fa58c46db Matti Vaittinen 2021-06-03  804  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  805  		stat->notifs	=3D rdata->u=
vd_notif;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  806  		stat->errors	=3D rdata->u=
vd_err;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  807  	}
e7bf1fa58c46db Matti Vaittinen 2021-06-03  808  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03 @809  	ret =3D regmap_write(d->re=
gmap, BD957X_REG_INT_UVD_STAT,
e7bf1fa58c46db Matti Vaittinen 2021-06-03  810  			   UVD_IRQ_VALID_MASK & =
val);
e7bf1fa58c46db Matti Vaittinen 2021-06-03  811  =

e7bf1fa58c46db Matti Vaittinen 2021-06-03  812  	return 0;
e7bf1fa58c46db Matti Vaittinen 2021-06-03  813  }
e7bf1fa58c46db Matti Vaittinen 2021-06-03  814  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5101105257611103503==--

