Content-Type: multipart/mixed; boundary="===============3470825187697673507=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mani-mhi:mhi-next 7/18] drivers/bus/mhi/ep/main.c:124:24: warning: Uninitialized variable: itr->state [uninitvar]
Date: Mon, 04 Apr 2022 20:43:26 +0800
Message-ID: <202204042051.UDNU94jF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3470825187697673507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-ne=
xt
head:   5d4be19cbe6aadfad0a5f40df91bd478cedd8344
commit: 484e04faa8a0487843808a08ff8b11e0684972f5 [7/18] bus: mhi: ep: Add s=
upport for managing MHI state machine
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/pmem.c:383:1: warning: There is an unknown macro here somewh=
ere. Configuration is required. If __stringify is a macro then please confi=
gure it. [unknownMacro]
   MODULE_ALIAS_CXL(CXL_DEVICE_NVDIMM_BRIDGE);
   ^
--
>> drivers/bus/mhi/ep/main.c:124:24: warning: Uninitialized variable: itr->=
state [uninitvar]
       mhi_state_str(itr->state));
                          ^

vim +124 drivers/bus/mhi/ep/main.c

6f7cb6e7883962 Manivannan Sadhasivam 2021-11-29  107  =

484e04faa8a048 Manivannan Sadhasivam 2021-11-29  108  static void mhi_ep_st=
ate_worker(struct work_struct *work)
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  109  {
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  110  	struct mhi_ep_cntrl =
*mhi_cntrl =3D container_of(work, struct mhi_ep_cntrl, state_work);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  111  	struct device *dev =
=3D &mhi_cntrl->mhi_dev->dev;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  112  	struct mhi_ep_state_=
transition *itr, *tmp;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  113  	unsigned long flags;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  114  	LIST_HEAD(head);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  115  	int ret;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  116  =

484e04faa8a048 Manivannan Sadhasivam 2021-11-29  117  	spin_lock_irqsave(&m=
hi_cntrl->list_lock, flags);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  118  	list_splice_tail_ini=
t(&mhi_cntrl->st_transition_list, &head);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  119  	spin_unlock_irqresto=
re(&mhi_cntrl->list_lock, flags);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  120  =

484e04faa8a048 Manivannan Sadhasivam 2021-11-29  121  	list_for_each_entry_=
safe(itr, tmp, &head, node) {
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  122  		list_del(&itr->node=
);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  123  		dev_dbg(dev, "Handl=
ing MHI state transition to %s\n",
484e04faa8a048 Manivannan Sadhasivam 2021-11-29 @124  			 mhi_state_str(itr=
->state));
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  125  =

484e04faa8a048 Manivannan Sadhasivam 2021-11-29  126  		switch (itr->state)=
 {
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  127  		case MHI_STATE_M0:
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  128  			ret =3D mhi_ep_set=
_m0_state(mhi_cntrl);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  129  			if (ret)
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  130  				dev_err(dev, "Fai=
led to transition to M0 state\n");
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  131  			break;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  132  		case MHI_STATE_M3:
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  133  			ret =3D mhi_ep_set=
_m3_state(mhi_cntrl);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  134  			if (ret)
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  135  				dev_err(dev, "Fai=
led to transition to M3 state\n");
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  136  			break;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  137  		default:
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  138  			dev_err(dev, "Inva=
lid MHI state transition: %d\n", itr->state);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  139  			break;
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  140  		}
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  141  		kfree(itr);
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  142  	}
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  143  }
484e04faa8a048 Manivannan Sadhasivam 2021-11-29  144  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3470825187697673507==--

