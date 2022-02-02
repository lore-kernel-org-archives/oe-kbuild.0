Content-Type: multipart/mixed; boundary="===============0432568172178688601=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 3142/9999] drivers/pci/controller/pcie-rcar-host.c:480:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 02 Feb 2022 14:42:50 +0800
Message-ID: <202202021401.1aIjCufA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0432568172178688601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   fcc2bfb27307c6ab51031df9bae07a3ab5606959
commit: 00a2ac03d0c60813ebf06a8c6f1cdb5b9e92d169 [3142/9999] UPSTREAM: PCI:=
 rcar: Convert to MSI domains
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220202/202202021401.1aIjCufA-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbac=
a3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/00a2ac03d0c6081=
3ebf06a8c6f1cdb5b9e92d169
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 00a2ac03d0c60813ebf06a8c6f1cdb5b9e92d169
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (IS_ENABLED(CONFIG_DEBUG_FS))
           ^
   drivers/gpio/gpio-adnp.c:464:6: note: 'is_irq_controller' is true
           if (is_irq_controller) {
               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:464:2: note: Taking true branch
           if (is_irq_controller) {
           ^
   drivers/gpio/gpio-adnp.c:467:9: note: Calling 'adnp_irq_setup'
                   err =3D adnp_irq_setup(adnp);
                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:385:28: note: The result of the left shift is u=
ndefined due to shifting by '4294967292', which is greater or equal to the =
width of type 'int'
           unsigned int num_regs =3D 1 << adnp->reg_shift, i;
                                     ^  ~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/char/applicom.c:574:5: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   ret =3D do_ac_read(i, buf, &st_loc, &mai=
lbox);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/applicom.c:574:5: note: Value stored to 'ret' is never read
                                   ret =3D do_ac_read(i, buf, &st_loc, &mai=
lbox);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/applicom.c:734:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:734:4: note: Value stored to 'ret' is never read
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:755:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:755:4: note: Value stored to 'ret' is never read
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:781:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:781:4: note: Value stored to 'ret' is never read
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:836:3: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOTTY;
                   ^     ~~~~~~~
   drivers/char/applicom.c:836:3: note: Value stored to 'ret' is never read
                   ret =3D -ENOTTY;
                   ^     ~~~~~~~
   Suppressed 4 warnings (4 with check filters).
   3 warnings generated.
   drivers/char/ppdev.c:118:15: warning: Value stored to 'minor' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int minor =3D iminor(file_inode(file));
                        ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ppdev.c:118:15: note: Value stored to 'minor' during its in=
itialization is never read
           unsigned int minor =3D iminor(file_inode(file));
                        ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ppdev.c:196:15: warning: Value stored to 'minor' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int minor =3D iminor(file_inode(file));
                        ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ppdev.c:196:15: note: Value stored to 'minor' during its in=
itialization is never read
           unsigned int minor =3D iminor(file_inode(file));
                        ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ppdev.c:708:15: warning: Value stored to 'minor' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int minor =3D iminor(inode);
                        ^~~~~   ~~~~~~~~~~~~~
   drivers/char/ppdev.c:708:15: note: Value stored to 'minor' during its in=
itialization is never read
           unsigned int minor =3D iminor(inode);
                        ^~~~~   ~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
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
   drivers/pci/controller/pci-tegra.c:2252:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D port->pcie->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-tegra.c:2252:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D port->pcie->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/pci/controller/pci-rcar-gen2.c:225:3: warning: Value stored to '=
window_size' is never read [clang-analyzer-deadcode.DeadStores]
                   window_size =3D SZ_256M;
                   ^
   drivers/pci/controller/pci-rcar-gen2.c:225:3: note: Value stored to 'win=
dow_size' is never read
   2 warnings generated.
>> drivers/pci/controller/pcie-rcar-host.c:480:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-rcar-host.c:480:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/pci/controller/pci-v3-semi.c:604:6: warning: Value stored to 'pc=
i_end' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-v3-semi.c:604:6: note: Value stored to 'pci_e=
nd' during its initialization is never read
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/rapidio/devices/rio_mport_cdev.c:300:2: warning: Undefined or ga=
rbage value returned to caller [clang-analyzer-core.uninitialized.UndefRetu=
rn]
           return ret;
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:6: note: Left side of '||'=
 is false
           if (atomic_read(&md->active) =3D=3D 0)
               ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:285:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:6: note: Left side of '||'=
 is false
           if (atomic_read(&md->active) =3D=3D 0)
               ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:285:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:6: note: Left side of '||'=
 is true
           if (atomic_read(&md->active) =3D=3D 0)
               ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:286:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:6: note: Taking false bran=
ch
           if (atomic_read(&md->active) =3D=3D 0)
               ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:303:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:6: note: Loop condition is=
 false.  Exiting loop
           if (atomic_read(&md->active) =3D=3D 0)
               ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'

vim +/dev +480 drivers/pci/controller/pcie-rcar-host.c

581d9434aa56b46 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2016-=
01-05  474  =

290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  475  static irqreturn_t rcar_pcie_msi_irq(int irq, void *data)
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  476  {
78a0d7f2f5a3135 drivers/pci/controller/pcie-rcar-host.c Lad Prabhakar 2020-=
05-07  477  	struct rcar_pcie_host *host =3D data;
78a0d7f2f5a3135 drivers/pci/controller/pcie-rcar-host.c Lad Prabhakar 2020-=
05-07  478  	struct rcar_pcie *pcie =3D &host->pcie;
78a0d7f2f5a3135 drivers/pci/controller/pcie-rcar-host.c Lad Prabhakar 2020-=
05-07  479  	struct rcar_msi *msi =3D &host->msi;
4ef80d72a6f1a37 drivers/pci/host/pcie-rcar.c            Bjorn Helgaas 2016-=
10-10 @480  	struct device *dev =3D pcie->dev;
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  481  	unsigned long reg;
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  482  =

b77188495de64ab drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
06-30  483  	reg =3D rcar_pci_read_reg(pcie, PCIEMSIFR);
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  484  =

290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  485  	/* MSI & INTx share an interrupt - we only handle MSI here */
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  486  	if (!reg)
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  487  		return IRQ_NONE;
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  488  =

290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  489  	while (reg) {
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  490  		unsigned int index =3D find_first_bit(&reg, 32);
a27beb5820d1a52 drivers/pci/controller/pcie-rcar.c      Wolfram Sang  2019-=
03-17  491  		unsigned int msi_irq;
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  492  =

00a2ac03d0c6081 drivers/pci/controller/pcie-rcar-host.c Marc Zyngier  2021-=
03-30  493  		msi_irq =3D irq_find_mapping(msi->domain->parent, index);
a27beb5820d1a52 drivers/pci/controller/pcie-rcar.c      Wolfram Sang  2019-=
03-17  494  		if (msi_irq) {
a27beb5820d1a52 drivers/pci/controller/pcie-rcar.c      Wolfram Sang  2019-=
03-17  495  			generic_handle_irq(msi_irq);
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  496  		} else {
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  497  			/* Unknown MSI, just clear it */
4ef80d72a6f1a37 drivers/pci/host/pcie-rcar.c            Bjorn Helgaas 2016-=
10-10  498  			dev_dbg(dev, "unexpected MSI\n");
00a2ac03d0c6081 drivers/pci/controller/pcie-rcar-host.c Marc Zyngier  2021-=
03-30  499  			rcar_pci_write_reg(pcie, BIT(index), PCIEMSIFR);
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  500  		}
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  501  =

290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  502  		/* see if there's any more pending in this vector */
b77188495de64ab drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
06-30  503  		reg =3D rcar_pci_read_reg(pcie, PCIEMSIFR);
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  504  	}
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  505  =

290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  506  	return IRQ_HANDLED;
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  507  }
290c1fb35860540 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-=
05-12  508  =


:::::: The code at line 480 was first introduced by commit
:::::: 4ef80d72a6f1a379e471960f48e051ab5e102fc0 PCI: rcar: Add local struct=
 device pointers

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0432568172178688601==--

