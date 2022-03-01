Content-Type: multipart/mixed; boundary="===============8460836299342304782=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mani-mhi:mhi-next 6/30] drivers/bus/mhi/host/pm.c:1037:57-58: atomic_add_unless
Date: Wed, 02 Mar 2022 04:12:12 +0800
Message-ID: <202203020457.tu11IAFt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8460836299342304782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Hemant Kumar <hemantk@codeaurora.org>
CC: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-ne=
xt
head:   6f5744ca0d90c556795cd8bc47ee651cc566582e
commit: 7b53cf6f78848f021913917a7d583d3c4bc51e37 [6/30] bus: mhi: Move host=
 MHI code to "host" directory
:::::: branch date: 4 hours ago
:::::: commit date: 11 hours ago
config: parisc-randconfig-c024-20220301 (https://download.01.org/0day-ci/ar=
chive/20220302/202203020457.tu11IAFt-lkp(a)intel.com/config)
compiler: hppa64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/bus/mhi/host/pm.c:1037:57-58: atomic_add_unless

vim +1037 drivers/bus/mhi/host/pm.c

3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1026  =

3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1027  /* De-assert device wake db */
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1028  static void mhi_deassert_dev_wake(struct mhi_controller *mhi_cntrl,
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1029  				  bool override)
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1030  {
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1031  	unsigned long flags;
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1032  =

3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1033  	/*
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1034  	 * Only continue if there is a single resource, else just decrement
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1035  	 * and return
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1036  	 */
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
@1037  	if (likely(atomic_add_unless(&mhi_cntrl->dev_wake, -1, 1)))
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1038  		return;
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1039  =

3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1040  	spin_lock_irqsave(&mhi_cntrl->wlock, flags);
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1041  	if ((atomic_dec_return(&mhi_cntrl->dev_wake) =3D=3D 0) &&
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1042  	    MHI_WAKE_DB_CLEAR_VALID(mhi_cntrl->pm_state) && !override &&
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1043  	    mhi_cntrl->wake_set) {
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1044  		mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, 0);
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1045  		mhi_cntrl->wake_set =3D false;
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1046  	}
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1047  	spin_unlock_irqrestore(&mhi_cntrl->wlock, flags);
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1048  }
3000f85b8f47b2c drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 =
 1049  =


:::::: The code at line 1037 was first introduced by commit
:::::: 3000f85b8f47b2c860add5cce4c201c83bde6468 bus: mhi: core: Add support=
 for basic PM operations

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8460836299342304782==--

