Content-Type: multipart/mixed; boundary="===============8263080267927599512=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/opp/core.c:876:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 04 Sep 2022 20:04:48 +0800
Message-ID: <202209041954.WBCg5eXI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8263080267927599512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/o=
pp/core.c:876:2: warning: Undefined or garbage value returned to caller [cl=
ang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7726d4c3e60bfe206738894267414a5f10510f1a
commit: 8174a3a613af1a911ab19da812824f7180b261f9 OPP: Provide a simple impl=
ementation to configure multiple clocks
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-c005-20220901 (https://download.01.org/0day-ci/arch=
ive/20220904/202209041954.WBCg5eXI-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8174a3a613af1a911ab19da812824f7180b261f9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8174a3a613af1a911ab19da812824f7180b261f9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                        ^
   drivers/s390/char/sclp_tty.c:502:6: note: Dereference of null pointer
           if (MACHINE_IS_VM && !CONSOLE_IS_SCLP)
               ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/mtd/nand/raw/nand_bbt.c:579:3: warning: Value stored to 'bbtbloc=
ks' is never read [clang-analyzer-deadcode.DeadStores]
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_bbt.c:579:3: note: Value stored to 'bbtblocks'=
 is never read
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/s390/net/smsgiucv.c:141:7: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           if (!MACHINE_IS_VM) {
                ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/s390/net/smsgiucv.c:141:7: note: Dereference of null pointer
           if (!MACHINE_IS_VM) {
                ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/opp/core.c:876:2: warning: Undefined or garbage value returned t=
o caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/opp/core.c:854:6: note: 'ret' declared without an initial value
           int ret, i;
               ^~~
   drivers/opp/core.c:856:6: note: Assuming 'scaling_down' is false
           if (scaling_down) {
               ^~~~~~~~~~~~
   drivers/opp/core.c:856:2: note: Taking false branch
           if (scaling_down) {
           ^
   drivers/opp/core.c:866:15: note: Assuming 'i' is >=3D field 'clk_count'
                   for (i =3D 0; i < opp_table->clk_count; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/opp/core.c:866:3: note: Loop condition is false. Execution conti=
nues on line 876
                   for (i =3D 0; i < opp_table->clk_count; i++) {
                   ^
   drivers/opp/core.c:876:2: note: Undefined or garbage value returned to c=
aller
           return ret;
           ^      ~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +876 drivers/opp/core.c

947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar 2016-12-01  845  =

8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  846  =
/*
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  847  =
 * Simple implementation for configuring multiple clocks. Configure clocks =
in
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  848  =
 * the order in which they are present in the array while scaling up.
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  849  =
 */
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  850  =
int dev_pm_opp_config_clks_simple(struct device *dev,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  851  =
		struct opp_table *opp_table, struct dev_pm_opp *opp, void *data,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  852  =
		bool scaling_down)
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  853  {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  854  =
	int ret, i;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  855  =

8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  856  =
	if (scaling_down) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  857  =
		for (i =3D opp_table->clk_count - 1; i >=3D 0; i--) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  858  =
			ret =3D clk_set_rate(opp_table->clks[i], opp->rates[i]);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  859  =
			if (ret) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  860  =
				dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  861  =
					ret);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  862  =
				return ret;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  863  =
			}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  864  =
		}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  865  =
	} else {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  866  =
		for (i =3D 0; i < opp_table->clk_count; i++) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  867  =
			ret =3D clk_set_rate(opp_table->clks[i], opp->rates[i]);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  868  =
			if (ret) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  869  =
				dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  870  =
					ret);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  871  =
				return ret;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  872  =
			}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  873  =
		}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  874  =
	}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  875  =

8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10 @876  =
	return ret;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  877  }
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  878  =
EXPORT_SYMBOL_GPL(dev_pm_opp_config_clks_simple);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  879  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8263080267927599512==--

