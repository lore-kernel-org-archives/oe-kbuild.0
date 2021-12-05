Content-Type: multipart/mixed; boundary="===============4656797033778235582=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pci-aardvark.c:595:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 06 Dec 2021 03:49:49 +0800
Message-ID: <202112060335.8fqYfiMO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4656797033778235582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Marek Beh=C3=BAn" <kabel@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79a72162048e42a677bc7336a9f5d86fc3ff9558
commit: 464de7e7fff767e87429cd7be09c4f2cb50a6ccb PCI: aardvark: Don't spam =
about PIO Response Status
date:   8 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20211130 (https://download.01.org/0day-ci/arc=
hive/20211206/202112060335.8fqYfiMO-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D464de7e7fff767e87429cd7be09c4f2cb50a6ccb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 464de7e7fff767e87429cd7be09c4f2cb50a6ccb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/pwm/core.c:787:6: note: Returning from 'IS_ERR'
           if (IS_ERR(pc)) {
               ^~~~~~~~~~
   drivers/pwm/core.c:787:2: note: Taking false branch
           if (IS_ERR(pc)) {
           ^
   drivers/pwm/core.c:796:6: note: Calling 'IS_ERR'
           if (IS_ERR(pwm))
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
   drivers/pwm/core.c:796:6: note: Returning from 'IS_ERR'
           if (IS_ERR(pwm))
               ^~~~~~~~~~~
   drivers/pwm/core.c:796:2: note: Taking false branch
           if (IS_ERR(pwm))
           ^
   drivers/pwm/core.c:800:6: note: Calling 'IS_ERR'
           if (IS_ERR(dl)) {
               ^~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/core.c:800:6: note: Returning from 'IS_ERR'
           if (IS_ERR(dl)) {
               ^~~~~~~~~~
   drivers/pwm/core.c:800:2: note: Taking false branch
           if (IS_ERR(dl)) {
           ^
   drivers/pwm/core.c:812:7: note: 'con_id' is null
           if (!con_id) {
                ^~~~~~
   drivers/pwm/core.c:812:2: note: Taking true branch
           if (!con_id) {
           ^
   drivers/pwm/core.c:815:7: note: 'err' is < 0
                   if (err < 0)
                       ^~~
   drivers/pwm/core.c:815:3: note: Taking true branch
                   if (err < 0)
                   ^
   drivers/pwm/core.c:816:13: note: Access to field 'name' results in a der=
eference of a null pointer (loaded from variable 'np')
                           con_id =3D np->name;
                                    ^~
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
   6 warnings generated.
   drivers/pci/ecam.c:129:15: warning: Value stored to 'bsz' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int bsz =3D 1 << cfg->bus_shift;
                        ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:129:15: note: Value stored to 'bsz' during its initia=
lization is never read
           unsigned int bsz =3D 1 << cfg->bus_shift;
                        ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:130:15: warning: Value stored to 'busn' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:130:15: note: Value stored to 'busn' during its initi=
alization is never read
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:151:28: warning: Value stored to 'cfg' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pci_config_window *cfg =3D bus->sysdata;
                                     ^~~   ~~~~~~~~~~~~
   drivers/pci/ecam.c:151:28: note: Value stored to 'cfg' during its initia=
lization is never read
           struct pci_config_window *cfg =3D bus->sysdata;
                                     ^~~   ~~~~~~~~~~~~
   drivers/pci/ecam.c:152:15: warning: Value stored to 'busn' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:152:15: note: Value stored to 'busn' during its initi=
alization is never read
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pci/controller/pci-aardvark.c:595:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D &pcie->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:595:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D &pcie->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
>> drivers/pci/controller/pci-aardvark.c:682:3: warning: Value stored to 's=
tr_posted' is never read [clang-analyzer-deadcode.DeadStores]
                   str_posted =3D "Non-posted";
                   ^            ~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:682:3: note: Value stored to 'str_=
posted' is never read
                   str_posted =3D "Non-posted";
                   ^            ~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:684:3: warning: Value stored to 's=
tr_posted' is never read [clang-analyzer-deadcode.DeadStores]
                   str_posted =3D "Posted";
                   ^            ~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:684:3: note: Value stored to 'str_=
posted' is never read
                   str_posted =3D "Posted";
                   ^            ~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/string_helpers.c:111:12: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   lib/string_helpers.c:59:6: note: Assuming 'blk_size' is not equal to 0
           if (blk_size =3D=3D 0)
               ^~~~~~~~~~~~~
   lib/string_helpers.c:59:2: note: Taking false branch
           if (blk_size =3D=3D 0)
           ^
   lib/string_helpers.c:61:6: note: Assuming 'size' is not equal to 0
           if (size =3D=3D 0)
               ^~~~~~~~~
   lib/string_helpers.c:61:2: note: Taking false branch
           if (size =3D=3D 0)
           ^
   lib/string_helpers.c:75:2: note: Loop condition is false. Execution cont=
inues on line 80
           while (blk_size >> 32) {
           ^
   lib/string_helpers.c:80:2: note: Loop condition is false. Execution cont=
inues on line 87
           while (size >> 32) {
           ^
   lib/string_helpers.c:90:2: note: Loop condition is false. Execution cont=
inues on line 97
           while (size >=3D divisor[units]) {
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:32: note: The value 3 is assigned to 'j'
           for (j =3D 0; sf_cap*10 < 1000; j++)
                                         ^~~
   lib/string_helpers.c:98:14: note: Assuming the condition is false
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is false. Execution cont=
inues on line 101
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:101:6: note: Assuming 'units' is not equal to STRIN=
G_UNITS_2
           if (units =3D=3D STRING_UNITS_2) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c:101:2: note: Taking false branch
           if (units =3D=3D STRING_UNITS_2) {
           ^
   lib/string_helpers.c:111:12: note: Assigned value is garbage or undefined
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/pci/controller/dwc/pci-dra7xx.c:290:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:290:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/dev +595 drivers/pci/controller/pci-aardvark.c

8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  592  =

43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  593  static int advk_pcie_check_pio_status(struct advk_pcie *pc=
ie, bool allow_crs, u32 *val)
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  594  {
9aec2feaf787a7 drivers/pci/host/pci-aardvark.c       Bjorn Helgaas    2016-=
10-06 @595  	struct device *dev =3D &pcie->pdev->dev;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  596  	u32 reg;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  597  	unsigned int status;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  598  	char *strcomp_status, *str_posted;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  599  =

8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  600  	reg =3D advk_readl(pcie, PIO_STAT);
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  601  	status =3D (reg & PIO_COMPLETION_STATUS_MASK) >>
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  602  		PIO_COMPLETION_STATUS_SHIFT;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  603  =

fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  604  	/*
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  605  	 * According to HW spec, the PIO status check sequence as belo=
w:
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  606  	 * 1) even if COMPLETION_STATUS(bit9:7) indicates successful,
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  607  	 *    it still needs to check Error Status(bit11), only when t=
his bit
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  608  	 *    indicates no error happen, the operation is successful.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  609  	 * 2) value Unsupported Request(1) of COMPLETION_STATUS(bit9:7=
) only
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  610  	 *    means a PIO write error, and for PIO read it is successf=
ul with
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  611  	 *    a read value of 0xFFFFFFFF.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  612  	 * 3) value Completion Retry Status(CRS) of COMPLETION_STATUS(=
bit9:7)
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  613  	 *    only means a PIO write error, and for PIO read it is suc=
cessful
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  614  	 *    with a read value of 0xFFFF0001.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  615  	 * 4) value Completer Abort (CA) of COMPLETION_STATUS(bit9:7) =
means
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  616  	 *    error for both PIO read and PIO write operation.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  617  	 * 5) other errors are indicated as 'unknown'.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  618  	 */
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  619  	switch (status) {
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  620  	case PIO_COMPLETION_STATUS_OK:
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  621  		if (reg & PIO_ERR_STATUS) {
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  622  			strcomp_status =3D "COMP_ERR";
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  623  			break;
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  624  		}
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  625  		/* Get the read result */
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  626  		if (val)
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  627  			*val =3D advk_readl(pcie, PIO_RD_DATA);
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  628  		/* No error */
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  629  		strcomp_status =3D NULL;
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  630  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  631  	case PIO_COMPLETION_STATUS_UR:
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  632  		strcomp_status =3D "UR";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  633  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  634  	case PIO_COMPLETION_STATUS_CRS:
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  635  		if (allow_crs && val) {
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  636  			/* PCIe r4.0, sec 2.3.2, says:
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  637  			 * If CRS Software Visibility is enabled:
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  638  			 * For a Configuration Read Request that includes both
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  639  			 * bytes of the Vendor ID field of a device Function's
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  640  			 * Configuration Space Header, the Root Complex must
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  641  			 * complete the Request to the host by returning a
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  642  			 * read-data value of 0001h for the Vendor ID field and
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  643  			 * all '1's for any additional bytes included in the
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  644  			 * request.
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  645  			 *
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  646  			 * So CRS in this case is not an error status.
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  647  			 */
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  648  			*val =3D CFG_RD_CRS_VAL;
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  649  			strcomp_status =3D NULL;
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  650  			break;
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  651  		}
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  652  		/* PCIe r4.0, sec 2.3.2, says:
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  653  		 * If CRS Software Visibility is not enabled, the Root Complex
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  654  		 * must re-issue the Configuration Request as a new Request.
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  655  		 * If CRS Software Visibility is enabled: For a Configur=
ation
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  656  		 * Write Request or for any other Configuration Read Req=
uest,
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  657  		 * the Root Complex must re-issue the Configuration Requ=
est as
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  658  		 * a new Request.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  659  		 * A Root Complex implementation may choose to limit the numb=
er
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  660  		 * of Configuration Request/CRS Completion Status loops before
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  661  		 * determining that something is wrong with the target of the
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  662  		 * Request and taking appropriate action, e.g., complete the
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  663  		 * Request to the host as a failed transaction.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  664  		 *
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  665  		 * To simplify implementation do not re-issue the Configurati=
on
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  666  		 * Request and complete the Request as a failed transaction.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  667  		 */
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  668  		strcomp_status =3D "CRS";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  669  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  670  	case PIO_COMPLETION_STATUS_CA:
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  671  		strcomp_status =3D "CA";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  672  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  673  	default:
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  674  		strcomp_status =3D "Unknown";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  675  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  676  	}
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  677  =

fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  678  	if (!strcomp_status)
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  679  		return 0;
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  680  =

8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  681  	if (reg & PIO_NON_POSTED_REQ)
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30 @682  		str_posted =3D "Non-posted";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  683  	else
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  684  		str_posted =3D "Posted";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  685  =

464de7e7fff767 drivers/pci/controller/pci-aardvark.c Marek Beh=C3=BAn      =
2021-10-05  686  	dev_dbg(dev, "%s PIO Response Status: %s, %#x @ %#x\n",
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  687  		str_posted, strcomp_status, reg, advk_readl(pcie, PIO_ADDR_LS=
));
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  688  =

fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  689  	return -EFAULT;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  690  }
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  691  =


:::::: The code at line 595 was first introduced by commit
:::::: 9aec2feaf787a766f802172e9021c7422029bc64 PCI: aardvark: Add local st=
ruct device pointers

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4656797033778235582==--

