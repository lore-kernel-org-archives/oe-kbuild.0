Content-Type: multipart/mixed; boundary="===============4607290684174260571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/bus/mhi/ep/main.c:124:24: warning: Uninitialized variable: itr->state [uninitvar]
Date: Mon, 06 Jun 2022 16:19:41 +0800
Message-ID: <202206061617.FIhuoBMx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4607290684174260571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/b=
us/mhi/ep/main.c:124:24: warning: Uninitialized variable: itr->state [unini=
tvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: 484e04faa8a0487843808a08ff8b11e0684972f5 bus: mhi: ep: Add support =
for managing MHI state machine
date:   9 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 weeks ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 484e04faa8a0487843808a08ff8b11e0684972f5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
--===============4607290684174260571==--

