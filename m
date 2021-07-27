Content-Type: multipart/mixed; boundary="===============8696475317504076509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v3 2/9] Bluetooth: btintel: Add combined setup and shutdown functions
Date: Tue, 27 Jul 2021 12:38:27 +0800
Message-ID: <202107271223.LVZohNrY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8696475317504076509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210724073005.714003-3-hj.tedd.an@gmail.com>
References: <20210724073005.714003-3-hj.tedd.an@gmail.com>
TO: "Tedd Ho-Jeong An" <hj.tedd.an@gmail.com>

Hi Tedd,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bluetooth/master]
[also build test WARNING on v5.14-rc3 next-20210726]
[cannot apply to bluetooth-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tedd-Ho-Jeong-An/Bluetooth=
-btintel-Refactoring-setup-routines/20210724-153223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c001-20210723 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 3f2c1e=
99e44d028d5e9dd685f3c568f2661f2f68)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/0day-ci/linux/commit/eca1c570017a1accc1a7f6be7=
fe1fa0a390066f9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tedd-Ho-Jeong-An/Bluetooth-btintel=
-Refactoring-setup-routines/20210724-153223
        git checkout eca1c570017a1accc1a7f6be7fe1fa0a390066f9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/radeon/rv6xx_dpm.c:173:25: warning: The left operand of =
'=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           if (step->post_divider =3D=3D 1)
                                  ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1671:6: note: Assuming field 'thermal=
_protection' is false
           if (pi->thermal_protection)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1671:2: note: Taking false branch
           if (pi->thermal_protection)
           ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1678:2: note: Calling 'rv6xx_generate=
_transition_stepping'
           rv6xx_generate_transition_stepping(rdev, new_ps, old_ps);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1425:2: note: Calling 'rv6xx_generate=
_steps'
           rv6xx_generate_steps(rdev,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:248:2: note: Calling 'rv6xx_convert_c=
lock_to_stepping'
           rv6xx_convert_clock_to_stepping(rdev, low, &cur);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:146:6: note: Assuming 'ret' is not eq=
ual to 0
           if (ret)
               ^~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:146:2: note: Taking true branch
           if (ret)
           ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:147:3: note: Returning without writin=
g to 'step->post_divider'
                   return ret;
                   ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:248:2: note: Returning from 'rv6xx_co=
nvert_clock_to_stepping'
           rv6xx_convert_clock_to_stepping(rdev, low, &cur);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:251:2: note: Calling 'rv6xx_output_st=
epping'
           rv6xx_output_stepping(rdev, step_index++, &cur);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:173:25: note: The left operand of '=
=3D=3D' is a garbage value
           if (step->post_divider =3D=3D 1)
               ~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:253:41: warning: The left operand of =
'>=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
           increasing_vco =3D (target.vco_frequency >=3D cur.vco_frequency);
                                                  ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1671:6: note: Assuming field 'thermal=
_protection' is false
           if (pi->thermal_protection)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1671:2: note: Taking false branch
           if (pi->thermal_protection)
           ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1678:2: note: Calling 'rv6xx_generate=
_transition_stepping'
           rv6xx_generate_transition_stepping(rdev, new_ps, old_ps);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:1425:2: note: Calling 'rv6xx_generate=
_steps'
           rv6xx_generate_steps(rdev,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:249:2: note: Calling 'rv6xx_convert_c=
lock_to_stepping'
           rv6xx_convert_clock_to_stepping(rdev, high, &target);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:146:6: note: Assuming 'ret' is not eq=
ual to 0
           if (ret)
               ^~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:146:2: note: Taking true branch
           if (ret)
           ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:147:3: note: Returning without writin=
g to 'step->vco_frequency'
                   return ret;
                   ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:249:2: note: Returning from 'rv6xx_co=
nvert_clock_to_stepping'
           rv6xx_convert_clock_to_stepping(rdev, high, &target);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:253:41: note: The left operand of '>=
=3D' is a garbage value
           increasing_vco =3D (target.vco_frequency >=3D cur.vco_frequency);
                             ~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/bluetooth/hci_ag6xx.c:202:2: warning: Value stored to 'fw_ptr' i=
s never read [clang-analyzer-deadcode.DeadStores]
           fw_ptr =3D fw->data;
           ^        ~~~~~~~~
   drivers/bluetooth/hci_ag6xx.c:202:2: note: Value stored to 'fw_ptr' is n=
ever read
           fw_ptr =3D fw->data;
           ^        ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/bluetooth/btintel.c:422:6: warning: The left operand of '&' is a=
 garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (INTEL_HW_PLATFORM(version->cnvi_bt) !=3D 0x37) {
               ^
   drivers/bluetooth/btintel.h:135:53: note: expanded from macro 'INTEL_HW_=
PLATFORM'
   #define INTEL_HW_PLATFORM(cnvx_bt)      ((u8)(((cnvx_bt) & 0x0000ff00) >=
> 8))
                                                            ^
   drivers/bluetooth/btintel.c:1383:2: note: Taking false branch
           BT_DBG("%s", hdev->name);
           ^
   include/net/bluetooth/bluetooth.h:180:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/bluetooth/btintel.c:1392:2: note: Taking false branch
           if (IS_ERR(skb)) {
           ^
   drivers/bluetooth/btintel.c:1399:6: note: Assuming the condition is false
           if (skb->data[0]) {
               ^~~~~~~~~~~~
   drivers/bluetooth/btintel.c:1399:2: note: Taking false branch
           if (skb->data[0]) {
           ^
   drivers/bluetooth/btintel.c:1407:6: note: Assuming the condition is false
           if (skb->data[1] =3D=3D 0x37 && skb->len =3D=3D sizeof(ver)) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:1407:27: note: Left side of '&&' is false
           if (skb->data[1] =3D=3D 0x37 && skb->len =3D=3D sizeof(ver)) {
                                    ^
   drivers/bluetooth/btintel.c:1440:2: note: Calling 'btintel_parse_version=
_tlv'
           btintel_parse_version_tlv(hdev, &ver_tlv, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:506:2: note: Loop condition is false. Execut=
ion continues on line 583
           while (skb->len) {
           ^
   drivers/bluetooth/btintel.c:583:2: note: Returning without writing to 'v=
ersion->cnvi_bt'
           return 0;
           ^
   drivers/bluetooth/btintel.c:1440:2: note: Returning from 'btintel_parse_=
version_tlv'
           btintel_parse_version_tlv(hdev, &ver_tlv, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:1443:2: note: Calling 'btintel_version_info_=
tlv'
           btintel_version_info_tlv(hdev, &ver_tlv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:422:6: note: The left operand of '&' is a ga=
rbage value
           if (INTEL_HW_PLATFORM(version->cnvi_bt) !=3D 0x37) {
               ^
   drivers/bluetooth/btintel.h:135:53: note: expanded from macro 'INTEL_HW_=
PLATFORM'
   #define INTEL_HW_PLATFORM(cnvx_bt)      ((u8)(((cnvx_bt) & 0x0000ff00) >=
> 8))
                                                   ~~~~~~~  ^
   drivers/bluetooth/btintel.c:1436:3: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return err;
                   ^      ~~~
   drivers/bluetooth/btintel.c:1381:2: note: 'err' declared without an init=
ial value
           int err;
           ^~~~~~~
   drivers/bluetooth/btintel.c:1383:2: note: Taking false branch
           BT_DBG("%s", hdev->name);
           ^
   include/net/bluetooth/bluetooth.h:180:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/bluetooth/btintel.c:1392:6: note: Calling 'IS_ERR'
           if (IS_ERR(skb)) {
               ^~~~~~~~~~~
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
   drivers/bluetooth/btintel.c:1392:6: note: Returning from 'IS_ERR'
           if (IS_ERR(skb)) {
               ^~~~~~~~~~~
   drivers/bluetooth/btintel.c:1392:2: note: Taking false branch
           if (IS_ERR(skb)) {
           ^
   drivers/bluetooth/btintel.c:1399:6: note: Assuming the condition is false
           if (skb->data[0]) {
               ^~~~~~~~~~~~
   drivers/bluetooth/btintel.c:1399:2: note: Taking false branch
           if (skb->data[0]) {
           ^
   drivers/bluetooth/btintel.c:1407:6: note: Assuming the condition is true
           if (skb->data[1] =3D=3D 0x37 && skb->len =3D=3D sizeof(ver)) {

vim +422 drivers/bluetooth/btintel.c

6c483de1b3c41e Loic Poulain           2015-12-06  414  =

0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  415  int btintel_version_=
info_tlv(struct hci_dev *hdev, struct intel_version_tlv *version)
57375beef71af9 Kiran K                2020-09-14  416  {
57375beef71af9 Kiran K                2020-09-14  417  	const char *variant;
57375beef71af9 Kiran K                2020-09-14  418  =

0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  419  	/* The hardware pla=
tform number has a fixed value of 0x37 and
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  420  	 * for now only acc=
ept this single value.
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  421  	 */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23 @422  	if (INTEL_HW_PLATFO=
RM(version->cnvi_bt) !=3D 0x37) {
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  423  		bt_dev_err(hdev, "=
Unsupported Intel hardware platform (0x%2x)",
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  424  			   INTEL_HW_PLATF=
ORM(version->cnvi_bt));
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  425  		return -EINVAL;
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  426  	}
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  427  =

0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  428  	/* Check for suppor=
ted iBT hardware variants of this firmware
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  429  	 * loading method.
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  430  	 *
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  431  	 * This check has b=
een put in place to ensure correct forward
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  432  	 * compatibility op=
tions when newer hardware variants come along.
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  433  	 */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  434  	switch (INTEL_HW_VA=
RIANT(version->cnvi_bt)) {
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  435  	case 0x17:	/* TyP */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  436  	case 0x18:	/* Slr */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  437  	case 0x19:	/* Slr-F=
 */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  438  		break;
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  439  	default:
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  440  		bt_dev_err(hdev, "=
Unsupported Intel hardware variant (0x%x)",
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  441  			   INTEL_HW_VARIA=
NT(version->cnvi_bt));
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  442  		return -EINVAL;
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  443  	}
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  444  =

7de3a42cdc701f Lokendra Singh         2021-03-23  445  	switch (version->im=
g_type) {
7de3a42cdc701f Lokendra Singh         2021-03-23  446  	case 0x01:
7de3a42cdc701f Lokendra Singh         2021-03-23  447  		variant =3D "Bootl=
oader";
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  448  		/* It is required =
that every single firmware fragment is acknowledged
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  449  		 * with a command =
complete event. If the boot parameters indicate
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  450  		 * that this bootl=
oader does not send them, then abort the setup.
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  451  		 */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  452  		if (version->limit=
ed_cce !=3D 0x00) {
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  453  			bt_dev_err(hdev, =
"Unsupported Intel firmware loading method (0x%x)",
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  454  				   version->limi=
ted_cce);
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  455  			return -EINVAL;
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  456  		}
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  457  =

0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  458  		/* Secure boot eng=
ine type should be either 1 (ECDSA) or 0 (RSA) */
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  459  		if (version->sbe_t=
ype > 0x01) {
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  460  			bt_dev_err(hdev, =
"Unsupported Intel secure boot engine type (0x%x)",
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  461  				   version->sbe_=
type);
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  462  			return -EINVAL;
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  463  		}
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  464  =

57375beef71af9 Kiran K                2020-09-14  465  		bt_dev_info(hdev, =
"Device revision is %u", version->dev_rev_id);
57375beef71af9 Kiran K                2020-09-14  466  		bt_dev_info(hdev, =
"Secure boot is %s",
57375beef71af9 Kiran K                2020-09-14  467  			    version->secu=
re_boot ? "enabled" : "disabled");
57375beef71af9 Kiran K                2020-09-14  468  		bt_dev_info(hdev, =
"OTP lock is %s",
57375beef71af9 Kiran K                2020-09-14  469  			    version->otp_=
lock ? "enabled" : "disabled");
57375beef71af9 Kiran K                2020-09-14  470  		bt_dev_info(hdev, =
"API lock is %s",
57375beef71af9 Kiran K                2020-09-14  471  			    version->api_=
lock ? "enabled" : "disabled");
57375beef71af9 Kiran K                2020-09-14  472  		bt_dev_info(hdev, =
"Debug lock is %s",
57375beef71af9 Kiran K                2020-09-14  473  			    version->debu=
g_lock ? "enabled" : "disabled");
57375beef71af9 Kiran K                2020-09-14  474  		bt_dev_info(hdev, =
"Minimum firmware build %u week %u %u",
57375beef71af9 Kiran K                2020-09-14  475  			    version->min_=
fw_build_nn, version->min_fw_build_cw,
57375beef71af9 Kiran K                2020-09-14  476  			    2000 + versio=
n->min_fw_build_yy);
57375beef71af9 Kiran K                2020-09-14  477  		break;
57375beef71af9 Kiran K                2020-09-14  478  	case 0x03:
57375beef71af9 Kiran K                2020-09-14  479  		variant =3D "Firmw=
are";
57375beef71af9 Kiran K                2020-09-14  480  		break;
57375beef71af9 Kiran K                2020-09-14  481  	default:
57375beef71af9 Kiran K                2020-09-14  482  		bt_dev_err(hdev, "=
Unsupported image type(%02x)", version->img_type);
0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  483  		return -EINVAL;
57375beef71af9 Kiran K                2020-09-14  484  	}
57375beef71af9 Kiran K                2020-09-14  485  =

57375beef71af9 Kiran K                2020-09-14  486  	bt_dev_info(hdev, "=
%s timestamp %u.%u buildtype %u build %u", variant,
57375beef71af9 Kiran K                2020-09-14  487  		    2000 + (versio=
n->timestamp >> 8), version->timestamp & 0xff,
57375beef71af9 Kiran K                2020-09-14  488  		    version->build=
_type, version->build_num);
57375beef71af9 Kiran K                2020-09-14  489  =

0a460d8fe2db68 Luiz Augusto von Dentz 2021-03-23  490  	return 0;
57375beef71af9 Kiran K                2020-09-14  491  }
57375beef71af9 Kiran K                2020-09-14  492  EXPORT_SYMBOL_GPL(bt=
intel_version_info_tlv);
57375beef71af9 Kiran K                2020-09-14  493  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8696475317504076509==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8696475317504076509==--

