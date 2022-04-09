Content-Type: multipart/mixed; boundary="===============7793672601290141859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshcd-pci.c:73:44: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 73. [shiftTooManyBitsSigned]
Date: Sat, 09 Apr 2022 23:51:42 +0800
Message-ID: <202204092319.kQMsaEkW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7793672601290141859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Avri Altman <avri.altman@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1b45d8ccb9839b48e5884664470e54520e17f4c
commit: 4e5483b8440d01f6851a1388801088a6e0da0b56 scsi: ufs: ufs-pci: Force =
a full restore after suspend-to-disk
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4e5483b8440d01f6851a1388801088a6e0da0b56
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/scsi/ufs/ufshcd-pci.c:73:44: warning: Shifting signed 32-bit val=
ue by 31 bits is implementation-defined behaviour. See condition at line 73=
. [shiftTooManyBitsSigned]
    if (fn > 31 || !(intel_host->dsm_fns & (1 << fn)))
                                              ^
   drivers/scsi/ufs/ufshcd-pci.c:73:9: note: Assuming that condition 'fn>31=
' is not redundant
    if (fn > 31 || !(intel_host->dsm_fns & (1 << fn)))
           ^
   drivers/scsi/ufs/ufshcd-pci.c:73:44: note: Shift
    if (fn > 31 || !(intel_host->dsm_fns & (1 << fn)))
                                              ^
>> drivers/scsi/ufs/ufshcd-pci.c:73:44: warning: Either the condition 'fn>3=
1' is redundant or there is signed integer overflow for expression '1<<fn'.=
 [integerOverflowCond]
    if (fn > 31 || !(intel_host->dsm_fns & (1 << fn)))
                                              ^
   drivers/scsi/ufs/ufshcd-pci.c:73:9: note: Assuming that condition 'fn>31=
' is not redundant
    if (fn > 31 || !(intel_host->dsm_fns & (1 << fn)))
           ^
   drivers/scsi/ufs/ufshcd-pci.c:73:44: note: Integer overflow
    if (fn > 31 || !(intel_host->dsm_fns & (1 << fn)))
                                              ^

vim +73 drivers/scsi/ufs/ufshcd-pci.c

b2c57925df1ffc9 Adrian Hunter 2021-03-12  69  =

b2c57925df1ffc9 Adrian Hunter 2021-03-12  70  static int intel_dsm(struct i=
ntel_host *intel_host, struct device *dev,
b2c57925df1ffc9 Adrian Hunter 2021-03-12  71  		     unsigned int fn, u32 *=
result)
b2c57925df1ffc9 Adrian Hunter 2021-03-12  72  {
b2c57925df1ffc9 Adrian Hunter 2021-03-12 @73  	if (fn > 31 || !(intel_host-=
>dsm_fns & (1 << fn)))
b2c57925df1ffc9 Adrian Hunter 2021-03-12  74  		return -EOPNOTSUPP;
b2c57925df1ffc9 Adrian Hunter 2021-03-12  75  =

b2c57925df1ffc9 Adrian Hunter 2021-03-12  76  	return __intel_dsm(intel_hos=
t, dev, fn, result);
b2c57925df1ffc9 Adrian Hunter 2021-03-12  77  }
b2c57925df1ffc9 Adrian Hunter 2021-03-12  78  =


:::::: The code@line 73 was first introduced by commit
:::::: b2c57925df1ffc9c930629a39c1680035f735ffb scsi: ufs: ufs-pci: Add sup=
port for Intel LKF

:::::: TO: Adrian Hunter <adrian.hunter@intel.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7793672601290141859==--

