Content-Type: multipart/mixed; boundary="===============5111611532787716439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/cdns3/core.c:676:9: warning: Identical condition 'ret', second condition is always false
Date: Fri, 13 Nov 2020 04:41:08 +0800
Message-ID: <202011130406.ujF5QARn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5111611532787716439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Chen <peter.chen@nxp.com>
CC: Felipe Balbi <balbi@kernel.org>
CC: Pawel Laszczak <pawell@cadence.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3d5e28bff7ad55aea081c1af516cc1c94a5eca7d
commit: b1234e3b3b265588bab1e7a28508621045b87efa usb: cdns3: add runtime PM=
 support
date:   6 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 weeks ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/cdns3/core.c:676:9: warning: Identical condition 'ret', seco=
nd condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/usb/cdns3/core.c:659:6: note: first condition
    if (ret)
        ^
   drivers/usb/cdns3/core.c:676:9: note: second condition
    return ret;
           ^
   drivers/usb/cdns3/core.c:719:9: warning: Identical condition 'ret', seco=
nd condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/usb/cdns3/core.c:712:6: note: first condition
    if (ret)
        ^
   drivers/usb/cdns3/core.c:719:9: note: second condition
    return ret;
           ^

vim +/ret +676 drivers/usb/cdns3/core.c

7733f6c32e36ff9 Pawel Laszczak 2019-08-26  648  =

b1234e3b3b26558 Peter Chen     2020-09-02  649  static int cdns3_controller=
_resume(struct device *dev, pm_message_t msg)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  650  {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  651  	struct cdns3 *cdns =3D dev=
_get_drvdata(dev);
b1234e3b3b26558 Peter Chen     2020-09-02  652  	int ret;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  653  	unsigned long flags;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  654  =

b1234e3b3b26558 Peter Chen     2020-09-02  655  	if (!cdns->in_lpm)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  656  		return 0;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  657  =

b1234e3b3b26558 Peter Chen     2020-09-02  658  	ret =3D set_phy_power_on(c=
dns);
b1234e3b3b26558 Peter Chen     2020-09-02  659  	if (ret)
b1234e3b3b26558 Peter Chen     2020-09-02  660  		return ret;
b1234e3b3b26558 Peter Chen     2020-09-02  661  =

b1234e3b3b26558 Peter Chen     2020-09-02  662  	cdns3_set_platform_suspend=
(cdns->dev, false, false);
b1234e3b3b26558 Peter Chen     2020-09-02  663  =

b1234e3b3b26558 Peter Chen     2020-09-02  664  	spin_lock_irqsave(&cdns->l=
ock, flags);
b1234e3b3b26558 Peter Chen     2020-09-02  665  	if (cdns->roles[cdns->role=
]->resume && !PMSG_IS_AUTO(msg))
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  666  		cdns->roles[cdns->role]->=
resume(cdns, false);
b1234e3b3b26558 Peter Chen     2020-09-02  667  =

b1234e3b3b26558 Peter Chen     2020-09-02  668  	cdns->in_lpm =3D false;
b1234e3b3b26558 Peter Chen     2020-09-02  669  	spin_unlock_irqrestore(&cd=
ns->lock, flags);
b1234e3b3b26558 Peter Chen     2020-09-02  670  	if (cdns->wakeup_pending) {
b1234e3b3b26558 Peter Chen     2020-09-02  671  		cdns->wakeup_pending =3D =
false;
b1234e3b3b26558 Peter Chen     2020-09-02  672  		enable_irq(cdns->wakeup_i=
rq);
b1234e3b3b26558 Peter Chen     2020-09-02  673  	}
b1234e3b3b26558 Peter Chen     2020-09-02  674  	dev_dbg(cdns->dev, "%s end=
s\n", __func__);
b1234e3b3b26558 Peter Chen     2020-09-02  675  =

b1234e3b3b26558 Peter Chen     2020-09-02 @676  	return ret;
b1234e3b3b26558 Peter Chen     2020-09-02  677  }
b1234e3b3b26558 Peter Chen     2020-09-02  678  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5111611532787716439==--

