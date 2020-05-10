Content-Type: multipart/mixed; boundary="===============8798922609679158669=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [habanaai:dev/ogabbay/gaudi 4/31] drivers/misc/habanalabs/firmware_if.c:305:18: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
Date: Sun, 10 May 2020 23:57:35 +0800
Message-ID: <202005102333.vBMNPewF%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8798922609679158669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Oded Gabbay <oded.gabbay@gmail.com>
CC: Omer Shpigelman <oshpigelman@habana.ai>

tree:   https://github.com/HabanaAI/linux.git dev/ogabbay/gaudi
head:   88a18dc3dfc1d290279b597cf82085ac994971be
commit: 63cd1cfdd076ed1dbcc6d2a1dcd3793aa1b72ea3 [4/31] habanalabs: unify a=
nd improve device cpu init
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/habanalabs/firmware_if.c:305:18: warning: Shifting signed 3=
2-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBit=
sSigned]
    if (!(err_val & CPU_BOOT_ERR0_ENABLED))
                    ^

# https://github.com/HabanaAI/linux/commit/63cd1cfdd076ed1dbcc6d2a1dcd3793a=
a1b72ea3
git remote add habanaai https://github.com/HabanaAI/linux.git
git remote update habanaai
git checkout 63cd1cfdd076ed1dbcc6d2a1dcd3793aa1b72ea3
vim +305 drivers/misc/habanalabs/firmware_if.c

63cd1cfdd076ed1 Oded Gabbay 2020-03-26  290  =

63cd1cfdd076ed1 Oded Gabbay 2020-03-26  291  static void fw_read_errors(str=
uct hl_device *hdev, u32 boot_err0_reg)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  292  {
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  293  	u32 err_val;
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  294  =

63cd1cfdd076ed1 Oded Gabbay 2020-03-26  295  	/* Some of the firmware statu=
s codes are deprecated in newer f/w
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  296  	 * versions. In those version=
s, the errors are reported
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  297  	 * in different registers. Th=
erefore, we need to check those
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  298  	 * registers and print the ex=
act errors. Moreover, there
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  299  	 * may be multiple errors, so=
 we need to report on each error
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  300  	 * separately. Some of the er=
ror codes might indicate a state
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  301  	 * that is not an error per-s=
e, but it is an error in production
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  302  	 * environment
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  303  	 */
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  304  	err_val =3D RREG32(boot_err0_=
reg);
63cd1cfdd076ed1 Oded Gabbay 2020-03-26 @305  	if (!(err_val & CPU_BOOT_ERR0=
_ENABLED))
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  306  		return;
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  307  =

63cd1cfdd076ed1 Oded Gabbay 2020-03-26  308  	if (err_val & CPU_BOOT_ERR0_D=
RAM_INIT_FAIL)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  309  		dev_err(hdev->dev,
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  310  			"Device boot error - DRAM i=
nitialization failed\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  311  	if (err_val & CPU_BOOT_ERR0_F=
IT_CORRUPTED)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  312  		dev_err(hdev->dev, "Device b=
oot error - FIT image corrupted\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  313  	if (err_val & CPU_BOOT_ERR0_T=
S_INIT_FAIL)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  314  		dev_err(hdev->dev,
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  315  			"Device boot error - Therma=
l Sensor initialization failed\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  316  	if (err_val & CPU_BOOT_ERR0_D=
RAM_SKIPPED)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  317  		dev_warn(hdev->dev,
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  318  			"Device boot warning - Skip=
ped DRAM initialization\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  319  	if (err_val & CPU_BOOT_ERR0_B=
MC_WAIT_SKIPPED)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  320  		dev_warn(hdev->dev,
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  321  			"Device boot error - Skippe=
d waiting for BMC\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  322  	if (err_val & CPU_BOOT_ERR0_N=
IC_DATA_NOT_RDY)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  323  		dev_err(hdev->dev,
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  324  			"Device boot error - Serdes=
 data from BMC not available\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  325  	if (err_val & CPU_BOOT_ERR0_N=
IC_FW_FAIL)
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  326  		dev_err(hdev->dev,
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  327  			"Device boot error - NIC F/=
W initialization failed\n");
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  328  }
63cd1cfdd076ed1 Oded Gabbay 2020-03-26  329  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8798922609679158669==--

