Content-Type: multipart/mixed; boundary="===============7722447560159907771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [brgl:gpio/for-next 16/29] drivers/gpio/gpio-sim.c:889:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 17 Dec 2021 15:19:44 +0800
Message-ID: <202112171504.U1a3Ld4A-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7722447560159907771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bartosz Golaszewski <brgl@bgdev.pl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio=
/for-next
head:   c492c8dc2ed86825ebf02f0de1da5c9b1d641b80
commit: 83960fcf4818607692ee7dd7ec566bab944d71a8 [16/29] gpio: sim: new tes=
ting module
:::::: branch date: 22 hours ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20211216 (https://download.01.org/0day-ci/archi=
ve/20211217/202112171504.U1a3Ld4A-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/co=
mmit/?id=3D83960fcf4818607692ee7dd7ec566bab944d71a8
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git=
/brgl/linux.git
        git fetch --no-tags brgl gpio/for-next
        git checkout 83960fcf4818607692ee7dd7ec566bab944d71a8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~
   arch/arm/kernel/setup.c:1109:2: note: Taking true branch
           if (!mdesc)
           ^
   arch/arm/kernel/setup.c:1110:3: note: Value assigned to 'mdesc'
                   mdesc =3D setup_machine_tags(atags_vaddr, __machine_arch=
_type);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   arch/arm/kernel/setup.c:1111:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/setup.c:1111:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/setup.c:1115:7: note: Assuming '__atags_pointer' is 0
                   if (__atags_pointer)
                       ^~~~~~~~~~~~~~~
   arch/arm/kernel/setup.c:1115:3: note: Taking false branch
                   if (__atags_pointer)
                   ^
   arch/arm/kernel/setup.c:1121:17: note: Access to field 'name' results in=
 a dereference of a null pointer (loaded from variable 'mdesc')
           machine_name =3D mdesc->name;
                          ^~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (9 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   security/keys/request_key.c:119:21: warning: Value stored to 'cred' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct cred *cred =3D current_cred();
                              ^~~~
   security/keys/request_key.c:119:21: note: Value stored to 'cred' during =
its initialization is never read
           const struct cred *cred =3D current_cred();
                              ^~~~
   security/keys/request_key.c:510:3: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   security/keys/request_key.c:510:3: note: Value stored to 'ret' is never =
read
                   ret =3D 0;
                   ^     ~
   Suppressed 8 warnings (8 in non-user code).
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
   3 warnings generated.
   drivers/gpio/gpio-rcar.c:468:13: warning: The result of the right shift =
is undefined due to shifting by '32', which is greater or equal to the widt=
h of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
           u32 mask =3D GENMASK(p->gpio_chip.ngpio - 1, 0);
                      ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   drivers/gpio/gpio-rcar.c:619:19: note: Assuming 'offset' is >=3D field '=
ngpio'
           for (offset =3D 0; offset < p->gpio_chip.ngpio; offset++) {
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rcar.c:619:2: note: Loop condition is false. Execution=
 continues on line 647
           for (offset =3D 0; offset < p->gpio_chip.ngpio; offset++) {
           ^
   drivers/gpio/gpio-rcar.c:647:6: note: Assuming field 'has_inen' is true
           if (p->info.has_inen)
               ^~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rcar.c:647:2: note: Taking true branch
           if (p->info.has_inen)
           ^
   drivers/gpio/gpio-rcar.c:648:3: note: Calling 'gpio_rcar_enable_inputs'
                   gpio_rcar_enable_inputs(p);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rcar.c:468:13: note: The result of the right shift is =
undefined due to shifting by '32', which is greater or equal to the width o=
f type 'unsigned long'
           u32 mask =3D GENMASK(p->gpio_chip.ngpio - 1, 0);
                      ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpio/gpio-sim.c:889:7: warning: Branch condition evaluates to a =
garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (ret) {
                       ^
   drivers/gpio/gpio-sim.c:953:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpio/gpio-sim.c:953:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpio/gpio-sim.c:958:7: note: Assuming 'live' is true
           if ((!live && !gpio_sim_device_is_live_unlocked(dev)) ||
                ^~~~~
   drivers/gpio/gpio-sim.c:958:13: note: Left side of '&&' is false
           if ((!live && !gpio_sim_device_is_live_unlocked(dev)) ||
                      ^
   drivers/gpio/gpio-sim.c:959:7: note: 'live' is true
               (live && gpio_sim_device_is_live_unlocked(dev)))
                ^~~~
   drivers/gpio/gpio-sim.c:959:7: note: Left side of '&&' is true
   drivers/gpio/gpio-sim.c:958:2: note: Taking false branch
           if ((!live && !gpio_sim_device_is_live_unlocked(dev)) ||
           ^
   drivers/gpio/gpio-sim.c:961:11: note: 'live' is true
           else if (live)
                    ^~~~
   drivers/gpio/gpio-sim.c:961:7: note: Taking true branch
           else if (live)
                ^
   drivers/gpio/gpio-sim.c:962:9: note: Calling 'gpio_sim_device_activate_u=
nlocked'
                   ret =3D gpio_sim_device_activate_unlocked(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:868:2: note: 'ret' declared without an initial v=
alue
           int ret;
           ^~~~~~~
   drivers/gpio/gpio-sim.c:870:6: note: Assuming the condition is false
           if (list_empty(&dev->bank_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:870:2: note: Taking false branch
           if (list_empty(&dev->bank_list))
           ^
   drivers/gpio/gpio-sim.c:878:6: note: Assuming the condition is false
           if (gpio_sim_bank_labels_non_unique(dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:878:2: note: Taking false branch
           if (gpio_sim_bank_labels_non_unique(dev))
           ^
   drivers/gpio/gpio-sim.c:884:6: note: Calling 'IS_ERR'
           if (IS_ERR(swnode))
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
   drivers/gpio/gpio-sim.c:884:6: note: Returning from 'IS_ERR'
           if (IS_ERR(swnode))
               ^~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:884:2: note: Taking false branch
           if (IS_ERR(swnode))
           ^
   drivers/gpio/gpio-sim.c:887:2: note: Loop condition is true.  Entering l=
oop body
           list_for_each_entry(bank, &dev->bank_list, siblings) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpio/gpio-sim.c:889:7: note: Branch condition evaluates to a gar=
bage value
                   if (ret) {
                       ^~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/zstd/compress/fse_compress.c:85:9: warning: The result of the left s=
hift is undefined due to shifting by '4294967294', which is greater or equa=
l to the width of type 'unsigned long long' [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
       if (FSE_BUILD_CTABLE_WORKSPACE_SIZE(maxSymbolValue, tableLog) > wksp=
Size) return ERROR(tableLog_tooLarge);
           ^
   lib/zstd/compress/../common/fse.h:338:87: note: expanded from macro 'FSE=
_BUILD_CTABLE_WORKSPACE_SIZE'
   #define FSE_BUILD_CTABLE_WORKSPACE_SIZE(maxSymbolValue, tableLog) (sizeo=
f(unsigned) * FSE_BUILD_CTABLE_WORKSPACE_SIZE_U32(maxSymbolValue, tableLog))
                                                                           =
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/compress/../common/fse.h:337:99: note: expanded from macro 'FSE=
_BUILD_CTABLE_WORKSPACE_SIZE_U32'
   #define FSE_BUILD_CTABLE_WORKSPACE_SIZE_U32(maxSymbolValue, tableLog) (m=
axSymbolValue + 2 + (1ull << (tableLog - 2)))
                                                                           =
                          ^  ~~~~~~~~~~~~~~
   lib/zstd/compress/fse_compress.c:75:56: note: Assuming 'tableLog' is 0
       void* const FSCT =3D ((U32*)ptr) + 1 /* header */ + (tableLog ? tabl=
eSize>>1 : 1) ;
                                                          ^~~~~~~~
   lib/zstd/compress/fse_compress.c:75:56: note: '?' condition is false
   lib/zstd/compress/fse_compress.c:84:9: note: Assuming the condition is f=
alse
       if ((size_t)workSpace & 3) return ERROR(GENERIC); /* Must be 4 byte =
aligned */
           ^~~~~~~~~~~~~~~~~~~~~

vim +889 drivers/gpio/gpio-sim.c

83960fcf481860 Bartosz Golaszewski 2021-12-07  861  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  862  static int gpio_sim_dev=
ice_activate_unlocked(struct gpio_sim_device *dev)
83960fcf481860 Bartosz Golaszewski 2021-12-07  863  {
83960fcf481860 Bartosz Golaszewski 2021-12-07  864  	struct platform_device=
_info pdevinfo;
83960fcf481860 Bartosz Golaszewski 2021-12-07  865  	struct fwnode_handle *=
swnode;
83960fcf481860 Bartosz Golaszewski 2021-12-07  866  	struct platform_device=
 *pdev;
83960fcf481860 Bartosz Golaszewski 2021-12-07  867  	struct gpio_sim_bank *=
bank;
83960fcf481860 Bartosz Golaszewski 2021-12-07  868  	int ret;
83960fcf481860 Bartosz Golaszewski 2021-12-07  869  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  870  	if (list_empty(&dev->b=
ank_list))
83960fcf481860 Bartosz Golaszewski 2021-12-07  871  		return -ENODATA;
83960fcf481860 Bartosz Golaszewski 2021-12-07  872  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  873  	/*
83960fcf481860 Bartosz Golaszewski 2021-12-07  874  	 * Non-unique GPIO dev=
ice labels are a corner-case we don't support
83960fcf481860 Bartosz Golaszewski 2021-12-07  875  	 * as it would interfe=
re with machine hogging mechanism and has little
83960fcf481860 Bartosz Golaszewski 2021-12-07  876  	 * use in real life.
83960fcf481860 Bartosz Golaszewski 2021-12-07  877  	 */
83960fcf481860 Bartosz Golaszewski 2021-12-07  878  	if (gpio_sim_bank_labe=
ls_non_unique(dev))
83960fcf481860 Bartosz Golaszewski 2021-12-07  879  		return -EINVAL;
83960fcf481860 Bartosz Golaszewski 2021-12-07  880  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  881  	memset(&pdevinfo, 0, s=
izeof(pdevinfo));
83960fcf481860 Bartosz Golaszewski 2021-12-07  882  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  883  	swnode =3D fwnode_crea=
te_software_node(NULL, NULL);
83960fcf481860 Bartosz Golaszewski 2021-12-07  884  	if (IS_ERR(swnode))
83960fcf481860 Bartosz Golaszewski 2021-12-07  885  		return PTR_ERR(swnode=
);
83960fcf481860 Bartosz Golaszewski 2021-12-07  886  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  887  	list_for_each_entry(ba=
nk, &dev->bank_list, siblings) {
83960fcf481860 Bartosz Golaszewski 2021-12-07  888  		bank->swnode =3D gpio=
_sim_make_bank_swnode(bank, swnode);
83960fcf481860 Bartosz Golaszewski 2021-12-07 @889  		if (ret) {
83960fcf481860 Bartosz Golaszewski 2021-12-07  890  			gpio_sim_remove_swno=
de_recursive(swnode);
83960fcf481860 Bartosz Golaszewski 2021-12-07  891  			return ret;
83960fcf481860 Bartosz Golaszewski 2021-12-07  892  		}
83960fcf481860 Bartosz Golaszewski 2021-12-07  893  	}
83960fcf481860 Bartosz Golaszewski 2021-12-07  894  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  895  	ret =3D gpio_sim_add_h=
ogs(dev);
83960fcf481860 Bartosz Golaszewski 2021-12-07  896  	if (ret) {
83960fcf481860 Bartosz Golaszewski 2021-12-07  897  		gpio_sim_remove_swnod=
e_recursive(swnode);
83960fcf481860 Bartosz Golaszewski 2021-12-07  898  		return ret;
83960fcf481860 Bartosz Golaszewski 2021-12-07  899  	}
83960fcf481860 Bartosz Golaszewski 2021-12-07  900  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  901  	pdevinfo.name =3D "gpi=
o-sim";
83960fcf481860 Bartosz Golaszewski 2021-12-07  902  	pdevinfo.fwnode =3D sw=
node;
83960fcf481860 Bartosz Golaszewski 2021-12-07  903  	pdevinfo.id =3D dev->i=
d;
83960fcf481860 Bartosz Golaszewski 2021-12-07  904  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  905  	reinit_completion(&dev=
->probe_completion);
83960fcf481860 Bartosz Golaszewski 2021-12-07  906  	dev->driver_bound =3D =
false;
83960fcf481860 Bartosz Golaszewski 2021-12-07  907  	bus_register_notifier(=
&platform_bus_type, &dev->bus_notifier);
83960fcf481860 Bartosz Golaszewski 2021-12-07  908  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  909  	pdev =3D platform_devi=
ce_register_full(&pdevinfo);
83960fcf481860 Bartosz Golaszewski 2021-12-07  910  	if (IS_ERR(pdev)) {
83960fcf481860 Bartosz Golaszewski 2021-12-07  911  		bus_unregister_notifi=
er(&platform_bus_type, &dev->bus_notifier);
83960fcf481860 Bartosz Golaszewski 2021-12-07  912  		gpio_sim_remove_hogs(=
dev);
83960fcf481860 Bartosz Golaszewski 2021-12-07  913  		gpio_sim_remove_swnod=
e_recursive(swnode);
83960fcf481860 Bartosz Golaszewski 2021-12-07  914  		return PTR_ERR(pdev);
83960fcf481860 Bartosz Golaszewski 2021-12-07  915  	}
83960fcf481860 Bartosz Golaszewski 2021-12-07  916  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  917  	wait_for_completion(&d=
ev->probe_completion);
83960fcf481860 Bartosz Golaszewski 2021-12-07  918  	bus_unregister_notifie=
r(&platform_bus_type, &dev->bus_notifier);
83960fcf481860 Bartosz Golaszewski 2021-12-07  919  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  920  	if (!dev->driver_bound=
) {
83960fcf481860 Bartosz Golaszewski 2021-12-07  921  		/* Probe failed, chec=
k kernel log. */
83960fcf481860 Bartosz Golaszewski 2021-12-07  922  		platform_device_unreg=
ister(pdev);
83960fcf481860 Bartosz Golaszewski 2021-12-07  923  		gpio_sim_remove_hogs(=
dev);
83960fcf481860 Bartosz Golaszewski 2021-12-07  924  		gpio_sim_remove_swnod=
e_recursive(swnode);
83960fcf481860 Bartosz Golaszewski 2021-12-07  925  		return -ENXIO;
83960fcf481860 Bartosz Golaszewski 2021-12-07  926  	}
83960fcf481860 Bartosz Golaszewski 2021-12-07  927  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  928  	dev->pdev =3D pdev;
83960fcf481860 Bartosz Golaszewski 2021-12-07  929  =

83960fcf481860 Bartosz Golaszewski 2021-12-07  930  	return 0;
83960fcf481860 Bartosz Golaszewski 2021-12-07  931  }
83960fcf481860 Bartosz Golaszewski 2021-12-07  932  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7722447560159907771==--

