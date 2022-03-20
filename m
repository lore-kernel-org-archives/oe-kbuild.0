Content-Type: multipart/mixed; boundary="===============1402458179066464433=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 306/307] drivers/scsi/ufs/ufshcd.c:8320:2: warning: Value stored to 'name' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 20 Mar 2022 15:35:16 +0800
Message-ID: <202203201523.5qtyHe1M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1402458179066464433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   366c4aa8768b5193b782c809d7aba916d4e382da
commit: a8a69970d87f778e000ae1b15e18061c09aa0f7b [306/307] scsi: ufs: Remov=
e unused constants and code
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220320/202203201523.5qtyHe1M-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 217f26=
7efe3082438e698e2f08566b9df8c530fa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/bvanassche/linux/commit/a8a69970d87f778e000ae1=
b15e18061c09aa0f7b
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche ufs-for-next
        git checkout a8a69970d87f778e000ae1b15e18061c09aa0f7b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:6133:2: note: 'mode' declared without an initi=
al value
           u32 mode;
           ^~~~~~~~
   drivers/scsi/ufs/ufshcd.c:6135:2: note: Calling 'ufshcd_dme_get'
           ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PWRMODE), &mode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.h:1139:9: note: Calling 'ufshcd_dme_get_attr'
           return ufshcd_dme_get_attr(hba, attr_sel, mib_val, DME_LOCAL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:3920:6: note: 'peer' is 0
           if (peer && (hba->quirks & UFSHCD_QUIRK_DME_PEER_ACCESS_AUTO_MOD=
E)) {
               ^~~~
   drivers/scsi/ufs/ufshcd.c:3920:11: note: Left side of '&&' is false
           if (peer && (hba->quirks & UFSHCD_QUIRK_DME_PEER_ACCESS_AUTO_MOD=
E)) {
                    ^
   drivers/scsi/ufs/ufshcd.c:3942:20: note: 'peer' is 0
           uic_cmd.command =3D peer ?
                             ^~~~
   drivers/scsi/ufs/ufshcd.c:3942:20: note: '?' condition is false
   drivers/scsi/ufs/ufshcd.c:3949:7: note: 'ret' is -5
                   if (ret)
                       ^~~
   drivers/scsi/ufs/ufshcd.c:3949:3: note: Taking true branch
                   if (ret)
                   ^
   drivers/scsi/ufs/ufshcd.c:3950:4: note: Taking false branch
                           dev_dbg(hba->dev, "%s: attr-id 0x%x error code %=
d\n",
                           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/scsi/ufs/ufshcd.c:3952:11: note: 'ret' is -5
           } while (ret && peer && --retries);
                    ^~~
   drivers/scsi/ufs/ufshcd.c:3952:11: note: Left side of '&&' is true
   drivers/scsi/ufs/ufshcd.c:3952:18: note: 'peer' is 0
           } while (ret && peer && --retries);
                           ^~~~
   drivers/scsi/ufs/ufshcd.c:3952:23: note: Left side of '&&' is false
           } while (ret && peer && --retries);
                                ^
   drivers/scsi/ufs/ufshcd.c:3946:2: note: Loop condition is false.  Exitin=
g loop
           do {
           ^
   drivers/scsi/ufs/ufshcd.c:3954:6: note: 'ret' is -5
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshcd.c:3954:2: note: Taking true branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshcd.c:3955:3: note: Loop condition is false.  Exitin=
g loop
                   dev_err(hba->dev, "%s: attr-id 0x%x failed %d retries\n",
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
   drivers/scsi/ufs/ufshcd.c:3959:6: note: 'mib_val' is non-null
           if (mib_val && !ret)
               ^~~~~~~
   drivers/scsi/ufs/ufshcd.c:3959:6: note: Left side of '&&' is true
   drivers/scsi/ufs/ufshcd.c:3959:18: note: 'ret' is -5
           if (mib_val && !ret)
                           ^~~
   drivers/scsi/ufs/ufshcd.c:3959:2: note: Taking false branch
           if (mib_val && !ret)
           ^
   drivers/scsi/ufs/ufshcd.c:3962:6: note: 'peer' is 0
           if (peer && (hba->quirks & UFSHCD_QUIRK_DME_PEER_ACCESS_AUTO_MOD=
E)
               ^~~~
   drivers/scsi/ufs/ufshcd.c:3962:11: note: Left side of '&&' is false
           if (peer && (hba->quirks & UFSHCD_QUIRK_DME_PEER_ACCESS_AUTO_MOD=
E)
                    ^
   drivers/scsi/ufs/ufshcd.c:3966:2: note: Returning without writing to '*m=
ib_val'
           return ret;
           ^
   drivers/scsi/ufs/ufshcd.h:1139:9: note: Returning from 'ufshcd_dme_get_a=
ttr'
           return ufshcd_dme_get_attr(hba, attr_sel, mib_val, DME_LOCAL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.h:1139:2: note: Returning without writing to '*m=
ib_val'
           return ufshcd_dme_get_attr(hba, attr_sel, mib_val, DME_LOCAL);
           ^
   drivers/scsi/ufs/ufshcd.c:6135:2: note: Returning from 'ufshcd_dme_get'
           ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PWRMODE), &mode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:6137:33: note: The left operand of '>>' is a g=
arbage value
           if (pwr_info->pwr_rx !=3D ((mode >> PWRMODE_RX_OFFSET) & PWRMODE=
_MASK))
                                     ~~~~ ^
>> drivers/scsi/ufs/ufshcd.c:8320:2: warning: Value stored to 'name' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           name =3D vreg->name;
           ^      ~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:8320:2: note: Value stored to 'name' is never =
read
           name =3D vreg->name;
           ^      ~~~~~~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
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
   4 warnings generated.
   drivers/iio/adc/axp20x_adc.c:615:6: warning: The result of the left shif=
t is undefined because the left operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:51: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ~~~~~~~~~~~~~~~ ^
   drivers/iio/adc/axp20x_adc.c:615:6: note: '?' condition is false
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/iio/adc/axp20x_adc.c:615:6: note: '?' condition is true
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/iio/adc/axp20x_adc.c:615:6: note: Calling '__ilog2_u32'
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^~~~~~~~~~~~~~~
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:615:6: note: Returning from '__ilog2_u32'
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^~~~~~~~~~~~~~~
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:615:6: note: The result of the left shift i=
s undefined because the left operand is negative
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:51: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)

vim +/name +8320 drivers/scsi/ufs/ufshcd.c

57d104c153d3d6d Subhash Jadavani    2014-09-25  8308  =

aa497613093412e Sujit Reddy Thumma  2014-09-25  8309  static int ufshcd_con=
fig_vreg(struct device *dev,
aa497613093412e Sujit Reddy Thumma  2014-09-25  8310  		struct ufs_vreg *vr=
eg, bool on)
aa497613093412e Sujit Reddy Thumma  2014-09-25  8311  {
aa497613093412e Sujit Reddy Thumma  2014-09-25  8312  	int ret =3D 0;
727535903bea924 Gustavo A. R. Silva 2017-11-20  8313  	struct regulator *re=
g;
727535903bea924 Gustavo A. R. Silva 2017-11-20  8314  	const char *name;
a8a69970d87f778 Bart Van Assche     2021-12-08  8315  	int uA_load;
aa497613093412e Sujit Reddy Thumma  2014-09-25  8316  =

aa497613093412e Sujit Reddy Thumma  2014-09-25  8317  	BUG_ON(!vreg);
aa497613093412e Sujit Reddy Thumma  2014-09-25  8318  =

727535903bea924 Gustavo A. R. Silva 2017-11-20  8319  	reg =3D vreg->reg;
727535903bea924 Gustavo A. R. Silva 2017-11-20 @8320  	name =3D vreg->name;
727535903bea924 Gustavo A. R. Silva 2017-11-20  8321  =

aa497613093412e Sujit Reddy Thumma  2014-09-25  8322  	if (regulator_count_=
voltages(reg) > 0) {
90d88f47e8d03b2 Asutosh Das         2020-02-10  8323  		uA_load =3D on ? vr=
eg->max_uA : 0;
90d88f47e8d03b2 Asutosh Das         2020-02-10  8324  		ret =3D ufshcd_conf=
ig_vreg_load(dev, vreg, uA_load);
3b141e8cfd54ba3 Stanley Chu         2019-03-28  8325  	}
a8a69970d87f778 Bart Van Assche     2021-12-08  8326  =

aa497613093412e Sujit Reddy Thumma  2014-09-25  8327  	return ret;
aa497613093412e Sujit Reddy Thumma  2014-09-25  8328  }
aa497613093412e Sujit Reddy Thumma  2014-09-25  8329  =


:::::: The code at line 8320 was first introduced by commit
:::::: 727535903bea924c4f73abb202c4b3e85fff0ca4 scsi: ufs: ufshcd: fix pote=
ntial NULL pointer dereference in ufshcd_config_vreg

:::::: TO: Gustavo A. R. Silva <garsilva@embeddedor.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1402458179066464433==--

