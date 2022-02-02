Content-Type: multipart/mixed; boundary="===============7250866587675007123=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] block: sed-opal: Add ioctl to return device status
Date: Wed, 02 Feb 2022 22:41:37 +0800
Message-ID: <202202022253.Nh8enpBH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7250866587675007123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220125215248.6489-1-luca.boccassi@gmail.com>
References: <20220125215248.6489-1-luca.boccassi@gmail.com>
TO: luca.boccassi(a)gmail.com
TO: linux-block(a)vger.kernel.org
CC: dougmill(a)linux.vnet.ibm.com
CC: hch(a)infradead.org
CC: sbauer(a)plzdonthack.me
CC: Jonathan.Derrick(a)solidigmtechnology.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/luca-boccassi-gmail-com/bl=
ock-sed-opal-Add-ioctl-to-return-device-status/20220126-055454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: openrisc-randconfig-m031-20220201 (https://download.01.org/0day-ci/=
archive/20220202/202202022253.Nh8enpBH-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
block/sed-opal.c:2703 sed_ioctl() error: uninitialized symbol 'p'.

Old smatch warnings:
block/sed-opal.c:2706 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2709 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2712 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2715 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2718 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2721 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2724 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2727 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2730 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2733 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2736 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2739 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2742 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2745 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2748 sed_ioctl() error: uninitialized symbol 'p'.

vim +/p +2703 block/sed-opal.c

0bf8b38e88d576 dougmill(a)linux.vnet.ibm.com 2022-01-25  2682  =

e225c20eb0fd0b Scott Bauer                 2017-02-14  2683  int sed_ioctl(=
struct opal_dev *dev, unsigned int cmd, void __user *arg)
455a7b238cd6bc Scott Bauer                 2017-02-03  2684  {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2685  	void *p;
e225c20eb0fd0b Scott Bauer                 2017-02-14  2686  	int ret =3D -=
ENOTTY;
455a7b238cd6bc Scott Bauer                 2017-02-03  2687  =

455a7b238cd6bc Scott Bauer                 2017-02-03  2688  	if (!capable(=
CAP_SYS_ADMIN))
455a7b238cd6bc Scott Bauer                 2017-02-03  2689  		return -EACC=
ES;
4f1244c8298606 Christoph Hellwig           2017-02-17  2690  	if (!dev)
4f1244c8298606 Christoph Hellwig           2017-02-17  2691  		return -ENOT=
SUPP;
0bf8b38e88d576 dougmill(a)linux.vnet.ibm.com 2022-01-25  2692  	if (!(dev->=
flags & OPAL_FL_SUPPORTED))
455a7b238cd6bc Scott Bauer                 2017-02-03  2693  		return -ENOT=
SUPP;
455a7b238cd6bc Scott Bauer                 2017-02-03  2694  =

0bf8b38e88d576 dougmill(a)linux.vnet.ibm.com 2022-01-25  2695  	if (cmd & I=
OC_IN) {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2696  		p =3D memdup=
_user(arg, _IOC_SIZE(cmd));
e225c20eb0fd0b Scott Bauer                 2017-02-14  2697  		if (IS_ERR(p=
))
e225c20eb0fd0b Scott Bauer                 2017-02-14  2698  			return PTR_=
ERR(p);
0bf8b38e88d576 dougmill(a)linux.vnet.ibm.com 2022-01-25  2699  	}
455a7b238cd6bc Scott Bauer                 2017-02-03  2700  =

e225c20eb0fd0b Scott Bauer                 2017-02-14  2701  	switch (cmd) {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2702  	case IOC_OPAL=
_SAVE:
e225c20eb0fd0b Scott Bauer                 2017-02-14 @2703  		ret =3D opal=
_save(dev, p);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7250866587675007123==--

