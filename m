Content-Type: multipart/mixed; boundary="===============7026396729422224664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/chrome/chromeos_laptop.c:861:25: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 06 Dec 2021 10:24:20 +0800
Message-ID: <202112061034.5t3y7U95-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7026396729422224664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14 scripts/Makefile.clang: de=
fault to LLVM_IAS=3D1
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-c001-20211128 (https://download.01.org/0day-ci/arch=
ive/20211206/202112061034.5t3y7U95-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df12b034afeb3a977bbb1c6584dedc0f3dc666f14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f12b034afeb3a977bbb1c6584dedc0f3dc666f14
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~
   drivers/base/bus.c:44:6: note: 'bus' is non-null
           if (bus) {
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to '->p'
   }
   ^
   drivers/base/bus.c:572:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_autoprobe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:573:2: note: Calling 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:145:6: note: Calling 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:44:6: note: 'bus' is non-null
           if (bus) {
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to '->p'
   }
   ^
   drivers/base/bus.c:573:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:574:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:872:2: note: Returning from 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:873:18: note: Access to field 'drivers_kset' results =
in a dereference of a null pointer (loaded from field 'p')
           kset_unregister(bus->p->drivers_kset);
                           ^    ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/platform/chrome/chromeos_laptop.c:861:25: warning: Use of memory=
 after it is freed [clang-analyzer-unix.Malloc]
                   i2c_unregister_device(i2c_dev->client);
                                         ^
   drivers/platform/chrome/chromeos_laptop.c:953:13: note: Calling 'chromeo=
s_laptop_init'
   module_init(chromeos_laptop_init);
               ^
   include/linux/module.h:88:35: note: expanded from macro 'module_init'
   #define module_init(x)  __initcall(x);
                           ~~~~~~~~~~~^~
   include/linux/init.h:296:40: note: expanded from macro '__initcall'
   #define __initcall(fn) device_initcall(fn)
                          ~~~~~~~~~~~~~~~~^~~
   include/linux/init.h:291:48: note: expanded from macro 'device_initcall'
   #define device_initcall(fn)             __define_initcall(fn, 6)
                                           ~~~~~~~~~~~~~~~~~~^~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/init.h:254:22: note: expanded from macro '__unique_initcal=
l'
           ____define_initcall(fn,                                 \
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:241:33: note: expanded from macro '____define_initc=
all'
           __define_initcall_stub(__stub, fn)                      \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/init.h:226:10: note: expanded from macro '__define_initcal=
l_stub'
                   return fn();                                    \
                          ^~~~
   drivers/platform/chrome/chromeos_laptop.c:907:6: note: Assuming 'dmi_id'=
 is non-null
           if (!dmi_id) {
               ^~~~~~~
   drivers/platform/chrome/chromeos_laptop.c:907:2: note: Taking false bran=
ch
           if (!dmi_id) {
           ^
   drivers/platform/chrome/chromeos_laptop.c:912:2: note: Taking false bran=
ch
           pr_debug("DMI Matched %s\n", dmi_id->ident);
           ^
   include/linux/printk.h:471:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
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
   drivers/platform/chrome/chromeos_laptop.c:912:2: note: Loop condition is=
 false.  Exiting loop
           pr_debug("DMI Matched %s\n", dmi_id->ident);
           ^
   include/linux/printk.h:471:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
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
   drivers/platform/chrome/chromeos_laptop.c:914:16: note: Calling 'chromeo=
s_laptop_prepare'
           cros_laptop =3D chromeos_laptop_prepare((void *)dmi_id->driver_d=
ata);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/chrome/chromeos_laptop.c:885:6: note: Assuming 'cros_la=
ptop' is non-null
           if (!cros_laptop)
               ^~~~~~~~~~~~
   drivers/platform/chrome/chromeos_laptop.c:885:2: note: Taking false bran=
ch
           if (!cros_laptop)
           ^
   drivers/platform/chrome/chromeos_laptop.c:888:10: note: Calling 'chromeo=
s_laptop_prepare_i2c_peripherals'
           error =3D chromeos_laptop_prepare_i2c_peripherals(cros_laptop, s=
rc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/chromeos_laptop.c:748:6: note: Assuming field 'n=
um_i2c_peripherals' is not equal to 0
           if (!src->num_i2c_peripherals)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/chromeos_laptop.c:748:2: note: Taking false bran=
ch
           if (!src->num_i2c_peripherals)
           ^
   drivers/platform/chrome/chromeos_laptop.c:755:6: note: Assuming field 'i=
2c_peripherals' is non-null
           if (!cros_laptop->i2c_peripherals)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/chromeos_laptop.c:755:2: note: Taking false bran=
ch
           if (!cros_laptop->i2c_peripherals)
           ^
   drivers/platform/chrome/chromeos_laptop.c:760:14: note: 'i' is < field '=
num_i2c_peripherals'
           for (i =3D 0; i < cros_laptop->num_i2c_peripherals; i++) {
                       ^
   drivers/platform/chrome/chromeos_laptop.c:760:2: note: Loop condition is=
 true.  Entering loop body
           for (i =3D 0; i < cros_laptop->num_i2c_peripherals; i++) {
           ^
   drivers/platform/chrome/chromeos_laptop.c:765:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   drivers/platform/chrome/chromeos_laptop.c:765:3: note: Taking false bran=
ch
                   if (error)
                   ^
   drivers/platform/chrome/chromeos_laptop.c:769:7: note: Assuming field 'p=
roperties' is non-null
                   if (i2c_dev->properties) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/chromeos_laptop.c:769:3: note: Taking true branch

vim +861 drivers/platform/chrome/chromeos_laptop.c

c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  852  =

c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  853  static void chromeos_laptop=
_destroy(const struct chromeos_laptop *cros_laptop)
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  854  {
5020cd29d8bfcb Dmitry Torokhov 2018-05-03  855  	const struct acpi_peripher=
al *acpi_dev;
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  856  	struct i2c_peripheral *i2c=
_dev;
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  857  	int i;
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  858  =

c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  859  	for (i =3D 0; i < cros_lap=
top->num_i2c_peripherals; i++) {
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  860  		i2c_dev =3D &cros_laptop-=
>i2c_peripherals[i];
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20 @861  		i2c_unregister_device(i2c=
_dev->client);
65582920d72d25 Dmitry Torokhov 2018-03-20  862  	}
65582920d72d25 Dmitry Torokhov 2018-03-20  863  =

5020cd29d8bfcb Dmitry Torokhov 2018-05-03  864  	for (i =3D 0; i < cros_lap=
top->num_acpi_peripherals; i++) {
5020cd29d8bfcb Dmitry Torokhov 2018-05-03  865  		acpi_dev =3D &cros_laptop=
->acpi_peripherals[i];
5020cd29d8bfcb Dmitry Torokhov 2018-05-03  866  =

2c02f659851a96 Heikki Krogerus 2021-03-29  867  		if (acpi_dev->client)
2c02f659851a96 Heikki Krogerus 2021-03-29  868  			device_remove_software_n=
ode(&acpi_dev->client->dev);
2c02f659851a96 Heikki Krogerus 2021-03-29  869  =

2c02f659851a96 Heikki Krogerus 2021-03-29  870  		property_entries_free(acp=
i_dev->swnode.properties);
5020cd29d8bfcb Dmitry Torokhov 2018-05-03  871  	}
5020cd29d8bfcb Dmitry Torokhov 2018-05-03  872  =

c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  873  	kfree(cros_laptop->i2c_per=
ipherals);
5020cd29d8bfcb Dmitry Torokhov 2018-05-03  874  	kfree(cros_laptop->acpi_pe=
ripherals);
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  875  	kfree(cros_laptop);
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  876  }
65582920d72d25 Dmitry Torokhov 2018-03-20  877  =


:::::: The code at line 861 was first introduced by commit
:::::: c0bb0608ec79f8480432e169ccc3857dc7f7c205 platform/chrome: chromeos_l=
aptop - discard data for unneeded boards

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Benson Leung <bleung@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7026396729422224664==--

