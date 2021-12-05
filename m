Content-Type: multipart/mixed; boundary="===============7577874442946018610=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3307/5128] drivers/pinctrl/intel/pinctrl-cherryview.c:1063:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 05 Dec 2021 15:50:44 +0800
Message-ID: <202112051537.C4nZEauj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7577874442946018610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: db1b2a8caf5b4954aa62ead5b0580948656eac43 [3307/5128] pinctrl: cherr=
yview: Use temporary variable for struct device
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-c001-20211202 (https://download.01.org/0day-ci/arch=
ive/20211205/202112051537.C4nZEauj-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Ddb1b2a8caf5b4954aa62ead5b0580948656eac43
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout db1b2a8caf5b4954aa62ead5b0580948656eac43
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/hid.h:1006:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   include/linux/hid.h:1006:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   include/linux/hid.h:1006:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   include/linux/hid.h:1007:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/intel/pinctrl-cherryview.c:1063:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-cherryview.c:1063:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-cherryview.c:1307:18: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
                   struct device *dev =3D pctrl->dev;
                                  ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-cherryview.c:1307:18: note: Value stored t=
o 'dev' during its initialization is never read
                   struct device *dev =3D pctrl->dev;
                                  ^~~   ~~~~~~~~~~
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
   5 warnings generated.
   drivers/scsi/scsi_transport_spi.c:1623:2: warning: Value stored to 'erro=
r' is never read [clang-analyzer-deadcode.DeadStores]
           error =3D anon_transport_class_register(&spi_device_class);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_transport_spi.c:1623:2: note: Value stored to 'error' =
is never read
           error =3D anon_transport_class_register(&spi_device_class);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/scsi/libsas/sas_discover.c:249:2: warning: Use of memory after i=
t is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry(dev, &port->dev_list, dev_list_node)
           ^
   include/linux/list.h:632:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/scsi/libsas/sas_discover.c:249:2: note: Loop condition is true. =
 Entering loop body
           list_for_each_entry(dev, &port->dev_list, dev_list_node)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/scsi/libsas/sas_discover.c:250:3: note: Calling 'sas_notify_lldd=
_dev_gone'
                   sas_notify_lldd_dev_gone(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_discover.c:199:6: note: Assuming field 'lldd_dev=
_gone' is non-null
           if (!i->dft->lldd_dev_gone)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_discover.c:199:2: note: Taking false branch
           if (!i->dft->lldd_dev_gone)
           ^
   drivers/scsi/libsas/sas_discover.c:202:6: note: Assuming the condition i=
s true
           if (test_and_clear_bit(SAS_DEV_FOUND, &dev->state)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_discover.c:202:2: note: Taking true branch
           if (test_and_clear_bit(SAS_DEV_FOUND, &dev->state)) {
           ^
   drivers/scsi/libsas/sas_discover.c:204:3: note: Calling 'sas_put_device'
                   sas_put_device(dev);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_internal.h:189:2: note: Calling 'kref_put'
           kref_put(&dev->kref, sas_free_device);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {

vim +/dev +1063 drivers/pinctrl/intel/pinctrl-cherryview.c

ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1058  =

4e737af8c467b1 Andy Shevchenko 2018-09-26  1059  static int chv_config_set(=
struct pinctrl_dev *pctldev, unsigned int pin,
4e737af8c467b1 Andy Shevchenko 2018-09-26  1060  			  unsigned long *config=
s, unsigned int nconfigs)
6e08d6bbebebcf Mika Westerberg 2014-11-03  1061  {
3ea2e2cabd2dc7 Andy Shevchenko 2020-07-27  1062  	struct intel_pinctrl *pct=
rl =3D pinctrl_dev_get_drvdata(pctldev);
db1b2a8caf5b49 Andy Shevchenko 2021-11-26 @1063  	struct device *dev =3D pc=
trl->dev;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1064  	enum pin_config_param par=
am;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1065  	int i, ret;
58957d2edfa19e Mika Westerberg 2017-01-23  1066  	u32 arg;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1067  =

6e08d6bbebebcf Mika Westerberg 2014-11-03  1068  	if (chv_pad_locked(pctrl,=
 pin))
6e08d6bbebebcf Mika Westerberg 2014-11-03  1069  		return -EBUSY;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1070  =

6e08d6bbebebcf Mika Westerberg 2014-11-03  1071  	for (i =3D 0; i < nconfig=
s; i++) {
6e08d6bbebebcf Mika Westerberg 2014-11-03  1072  		param =3D pinconf_to_con=
fig_param(configs[i]);
6e08d6bbebebcf Mika Westerberg 2014-11-03  1073  		arg =3D pinconf_to_confi=
g_argument(configs[i]);
6e08d6bbebebcf Mika Westerberg 2014-11-03  1074  =

6e08d6bbebebcf Mika Westerberg 2014-11-03  1075  		switch (param) {
6e08d6bbebebcf Mika Westerberg 2014-11-03  1076  		case PIN_CONFIG_BIAS_DIS=
ABLE:
6e08d6bbebebcf Mika Westerberg 2014-11-03  1077  		case PIN_CONFIG_BIAS_PUL=
L_UP:
6e08d6bbebebcf Mika Westerberg 2014-11-03  1078  		case PIN_CONFIG_BIAS_PUL=
L_DOWN:
6e08d6bbebebcf Mika Westerberg 2014-11-03  1079  			ret =3D chv_config_set_=
pull(pctrl, pin, param, arg);
6e08d6bbebebcf Mika Westerberg 2014-11-03  1080  			if (ret)
6e08d6bbebebcf Mika Westerberg 2014-11-03  1081  				return ret;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1082  			break;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1083  =

ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1084  		case PIN_CONFIG_DRIVE_PU=
SH_PULL:
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1085  			ret =3D chv_config_set_=
oden(pctrl, pin, false);
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1086  			if (ret)
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1087  				return ret;
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1088  			break;
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1089  =

ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1090  		case PIN_CONFIG_DRIVE_OP=
EN_DRAIN:
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1091  			ret =3D chv_config_set_=
oden(pctrl, pin, true);
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1092  			if (ret)
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1093  				return ret;
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1094  			break;
ccdf81d08dbe05 Dan O'Donovan   2016-06-10  1095  =

6e08d6bbebebcf Mika Westerberg 2014-11-03  1096  		default:
6e08d6bbebebcf Mika Westerberg 2014-11-03  1097  			return -ENOTSUPP;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1098  		}
6e08d6bbebebcf Mika Westerberg 2014-11-03  1099  =

db1b2a8caf5b49 Andy Shevchenko 2021-11-26  1100  		dev_dbg(dev, "pin %d set=
 config %d arg %u\n", pin, param, arg);
6e08d6bbebebcf Mika Westerberg 2014-11-03  1101  	}
6e08d6bbebebcf Mika Westerberg 2014-11-03  1102  =

6e08d6bbebebcf Mika Westerberg 2014-11-03  1103  	return 0;
6e08d6bbebebcf Mika Westerberg 2014-11-03  1104  }
6e08d6bbebebcf Mika Westerberg 2014-11-03  1105  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7577874442946018610==--

