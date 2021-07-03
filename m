Content-Type: multipart/mixed; boundary="===============5888919174105996110=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net:master 45/81] drivers/ptp/ptp_sysfs.c:182:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Sun, 04 Jul 2021 05:49:24 +0800
Message-ID: <202107040517.r17qYDzX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5888919174105996110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: netdev(a)vger.kernel.org
TO: Yangbo Lu <yangbo.lu@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
head:   b43c8909be52f2baca8884f967b418a88424494a
commit: 73f37068d540eba5f93ba3a0019bf479d35ebd76 [45/81] ptp: support ptp p=
hysical/virtual clocks conversion
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +182 drivers/ptp/ptp_sysfs.c

73f37068d540eb Yangbo Lu 2021-06-30  172  =

73f37068d540eb Yangbo Lu 2021-06-30  173  static ssize_t n_vclocks_show(str=
uct device *dev,
73f37068d540eb Yangbo Lu 2021-06-30  174  			      struct device_attribute =
*attr, char *page)
73f37068d540eb Yangbo Lu 2021-06-30  175  {
73f37068d540eb Yangbo Lu 2021-06-30  176  	struct ptp_clock *ptp =3D dev_ge=
t_drvdata(dev);
73f37068d540eb Yangbo Lu 2021-06-30  177  	ssize_t size;
73f37068d540eb Yangbo Lu 2021-06-30  178  =

73f37068d540eb Yangbo Lu 2021-06-30  179  	if (mutex_lock_interruptible(&pt=
p->n_vclocks_mux))
73f37068d540eb Yangbo Lu 2021-06-30  180  		return -ERESTARTSYS;
73f37068d540eb Yangbo Lu 2021-06-30  181  =

73f37068d540eb Yangbo Lu 2021-06-30 @182  	size =3D snprintf(page, PAGE_SIZ=
E - 1, "%d\n", ptp->n_vclocks);
73f37068d540eb Yangbo Lu 2021-06-30  183  =

73f37068d540eb Yangbo Lu 2021-06-30  184  	mutex_unlock(&ptp->n_vclocks_mux=
);
73f37068d540eb Yangbo Lu 2021-06-30  185  =

73f37068d540eb Yangbo Lu 2021-06-30  186  	return size;
73f37068d540eb Yangbo Lu 2021-06-30  187  }
73f37068d540eb Yangbo Lu 2021-06-30  188  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5888919174105996110==--

