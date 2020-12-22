Content-Type: multipart/mixed; boundary="===============0844553575680981039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/firmware_if.c:371:18: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Tue, 22 Dec 2020 21:38:41 +0800
Message-ID: <202012222138.wte92BgC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0844553575680981039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8653b778e454a7708847aeafe689bce07aeeb94e
commit: 7b16a15524d5db449cf5e529602610cdf04eddab habanalabs: fix up absolut=
e include instructions
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/misc/habanalabs/common/firmware_if.c:371:18: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (!(err_val & CPU_BOOT_ERR0_ENABLED))
                    ^
--
>> drivers/misc/habanalabs/common/pci.c:115:5: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       PCI_CONFIG_ELBI_CTRL_WRITE);
       ^
   drivers/misc/habanalabs/common/pci.c:120:13: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (val & PCI_CONFIG_ELBI_STS_MASK)
               ^
   drivers/misc/habanalabs/common/pci.c:131:13: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if ((val & PCI_CONFIG_ELBI_STS_MASK) =3D=3D PCI_CONFIG_ELBI_STS_DONE)
               ^
   drivers/misc/habanalabs/common/pci.c:139:14: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (!(val & PCI_CONFIG_ELBI_STS_MASK)) {
                ^

vim +371 drivers/misc/habanalabs/common/firmware_if.c

7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  356  =

7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  357  static void fw_read_errors(struct hl_device *hdev, u32 boot_err0_re=
g)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  358  {
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  359  	u32 err_val;
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  360  =

7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  361  	/* Some of the firmware status codes are deprecated in newer f/w
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  362  	 * versions. In those versions, the errors are reported
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  363  	 * in different registers. Therefore, we need to check those
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  364  	 * registers and print the exact errors. Moreover, there
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  365  	 * may be multiple errors, so we need to report on each error
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  366  	 * separately. Some of the error codes might indicate a state
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  367  	 * that is not an error per-se, but it is an error in production
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  368  	 * environment
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  369  	 */
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  370  	err_val =3D RREG32(boot_err0_reg);
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6 @371  	if (!(err_val & CPU_BOOT_ERR0_ENABLED))
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  372  		return;
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  373  =

7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  374  	if (err_val & CPU_BOOT_ERR0_DRAM_INIT_FAIL)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  375  		dev_err(hdev->dev,
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  376  			"Device boot error - DRAM initialization failed\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  377  	if (err_val & CPU_BOOT_ERR0_FIT_CORRUPTED)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  378  		dev_err(hdev->dev, "Device boot error - FIT image corrupted\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  379  	if (err_val & CPU_BOOT_ERR0_TS_INIT_FAIL)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  380  		dev_err(hdev->dev,
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  381  			"Device boot error - Thermal Sensor initialization failed\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  382  	if (err_val & CPU_BOOT_ERR0_DRAM_SKIPPED)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  383  		dev_warn(hdev->dev,
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  384  			"Device boot warning - Skipped DRAM initialization\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  385  	if (err_val & CPU_BOOT_ERR0_BMC_WAIT_SKIPPED)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  386  		dev_warn(hdev->dev,
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  387  			"Device boot error - Skipped waiting for BMC\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  388  	if (err_val & CPU_BOOT_ERR0_NIC_DATA_NOT_RDY)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  389  		dev_err(hdev->dev,
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  390  			"Device boot error - Serdes data from BMC not available\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  391  	if (err_val & CPU_BOOT_ERR0_NIC_FW_FAIL)
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  392  		dev_err(hdev->dev,
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  393  			"Device boot error - NIC F/W initialization failed\n");
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  394  }
7e1c07dd3525097 drivers/misc/habanalabs/firmware_if.c Oded Gabbay 2020-03-2=
6  395  =


:::::: The code at line 371 was first introduced by commit
:::::: 7e1c07dd35250971cd29c60c786ac676179eb7f9 habanalabs: unify and impro=
ve device cpu init

:::::: TO: Oded Gabbay <oded.gabbay@gmail.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0844553575680981039==--

