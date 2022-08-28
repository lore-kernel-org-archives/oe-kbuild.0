Content-Type: multipart/mixed; boundary="===============4891419373805466478=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-6.1/block 1/13] block/sed-opal.c:2702:23: warning: use of uninitialized value 'p' [CWE-457]
Date: Sun, 28 Aug 2022 09:20:25 +0800
Message-ID: <202208280943.WQRnVchq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4891419373805466478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: block/sed=
-opal.c:2702:23: warning: use of uninitialized value 'p' [CWE-457] [-Wanaly=
zer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: dougmill <dougmill@linux.vnet.ibm.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Scott Bauer <sbauer@plzdonthack.me>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-6.1/block
head:   ddbfc34fcf5d0bc33b006b90c580c56edeb31068
commit: c6ea70604249bc357ce09e9f8e16c29df0fb2fa2 [1/13] block: sed-opal: Ad=
d ioctl to return device status
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220827 (https://download.01.org/0day-ci/archi=
ve/20220828/202208280943.WQRnVchq-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git/commit/?id=3Dc6ea70604249bc357ce09e9f8e16c29df0fb2fa2
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/ker=
nel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.1/block
        git checkout c6ea70604249bc357ce09e9f8e16c29df0fb2fa2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   block/sed-opal.c: In function 'start_generic_opal_session':
   block/sed-opal.c:1445:13: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1445 |         int err;
         |             ^~~
     'start_SIDASP_opal_session.part.0': events 1-2
       |
       | 1493 | static int start_SIDASP_opal_session(struct opal_dev *dev, =
void *data)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'start_SIDASP_opal_session.part.0'
       |......
       | 1501 |                 ret =3D start_generic_opal_session(dev, OPA=
L_SID_UID,
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |                       |
       |      |                       (2) calling 'start_generic_opal_sessi=
on' from 'start_SIDASP_opal_session.part.0'
       | 1502 |                                                  OPAL_ADMIN=
SP_UID,
       |      |                                                  ~~~~~~~~~~=
~~~~~~~
       | 1503 |                                                  okey->key,
       |      |                                                  ~~~~~~~~~~
       | 1504 |                                                  okey->key_=
len);
       |      |                                                  ~~~~~~~~~~=
~~~~
       |
       +--> 'start_generic_opal_session': events 3-4
              |
              | 1438 | static int start_generic_opal_session(struct opal_de=
v *dev,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'start_generic_opal_session'
              |......
              | 1445 |         int err;
              |      |             ~~~
              |      |             |
              |      |             (4) use of uninitialized value '<unknown=
>' here
              |
   block/sed-opal.c: In function 'sed_ioctl':
>> block/sed-opal.c:2702:23: warning: use of uninitialized value 'p' [CWE-4=
57] [-Wanalyzer-use-of-uninitialized-value]
    2702 |                 ret =3D opal_save(dev, p);
         |                       ^~~~~~~~~~~~~~~~~
     'sed_ioctl': events 1-6
       |
       | 2684 |         void *p;
       |      |               ^
       |      |               |
       |      |               (1) region created on stack here
       |......
       | 2687 |         if (!capable(CAP_SYS_ADMIN))
       |      |            ~   =

       |      |            |
       |      |            (2) following 'true' branch...
       | 2688 |                 return -EACCES;
       | 2689 |         if (!dev)
       |      |            ~   =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'false' branch (when 'dev' is non-=
NULL)...
       | 2690 |                 return -ENOTSUPP;
       | 2691 |         if (!(dev->flags & OPAL_FL_SUPPORTED))
       |      |            ~  ~~~~~~~~~~
       |      |            |     |
       |      |            |     (5) ...to here
       |      |            (6) following 'false' branch...
       |
     'sed_ioctl': events 7-12
       |
       | 2694 |         if (cmd & IOC_IN) {
       |      |            ~     =

       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 2700 |         switch (cmd) {
       |      |         ~~~~~~   =

       |      |         |
       |      |         (9) ...to here
       |      |         (10) following 'case 1092120796:' branch...
       | 2701 |         case IOC_OPAL_SAVE:
       |      |         ~~~~     =

       |      |         |
       |      |         (11) ...to here
       | 2702 |                 ret =3D opal_save(dev, p);
       |      |                       ~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) use of uninitialized value 'p' h=
ere
       |
   block/sed-opal.c:2705:23: warning: use of uninitialized value 'p' [CWE-4=
57] [-Wanalyzer-use-of-uninitialized-value]
    2705 |                 ret =3D opal_lock_unlock(dev, p);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
     'sed_ioctl': events 1-6
       |
       | 2684 |         void *p;
       |      |               ^
       |      |               |
       |      |               (1) region created on stack here
       |......
       | 2687 |         if (!capable(CAP_SYS_ADMIN))
       |      |            ~   =

       |      |            |
       |      |            (2) following 'true' branch...
       | 2688 |                 return -EACCES;
       | 2689 |         if (!dev)
       |      |            ~   =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'false' branch (when 'dev' is non-=
NULL)...
       | 2690 |                 return -ENOTSUPP;
       | 2691 |         if (!(dev->flags & OPAL_FL_SUPPORTED))
       |      |            ~  ~~~~~~~~~~
       |      |            |     |
       |      |            |     (5) ...to here
       |      |            (6) following 'false' branch...
       |
     'sed_ioctl': events 7-12
       |
       | 2694 |         if (cmd & IOC_IN) {
       |      |            ~     =

       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 2700 |         switch (cmd) {
       |      |         ~~~~~~   =

       |      |         |
       |      |         (9) ...to here
       |      |         (10) following 'case 1092120797:' branch...
       |......
       | 2704 |         case IOC_OPAL_LOCK_UNLOCK:
       |      |         ~~~~     =

       |      |         |
       |      |         (11) ...to here
       | 2705 |                 ret =3D opal_lock_unlock(dev, p);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) use of uninitialized value 'p' h=
ere
       |

vim +/p +2702 block/sed-opal.c

c6ea70604249bc dougmill(a)linux.vnet.ibm.com 2022-08-16  2681  =

e225c20eb0fd0b Scott Bauer                 2017-02-14  2682  int sed_ioctl(=
struct opal_dev *dev, unsigned int cmd, void __user *arg)
455a7b238cd6bc Scott Bauer                 2017-02-03  2683  {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2684  	void *p;
e225c20eb0fd0b Scott Bauer                 2017-02-14  2685  	int ret =3D -=
ENOTTY;
455a7b238cd6bc Scott Bauer                 2017-02-03  2686  =

455a7b238cd6bc Scott Bauer                 2017-02-03  2687  	if (!capable(=
CAP_SYS_ADMIN))
455a7b238cd6bc Scott Bauer                 2017-02-03  2688  		return -EACC=
ES;
4f1244c8298606 Christoph Hellwig           2017-02-17  2689  	if (!dev)
4f1244c8298606 Christoph Hellwig           2017-02-17  2690  		return -ENOT=
SUPP;
c6ea70604249bc dougmill(a)linux.vnet.ibm.com 2022-08-16  2691  	if (!(dev->=
flags & OPAL_FL_SUPPORTED))
455a7b238cd6bc Scott Bauer                 2017-02-03  2692  		return -ENOT=
SUPP;
455a7b238cd6bc Scott Bauer                 2017-02-03  2693  =

c6ea70604249bc dougmill(a)linux.vnet.ibm.com 2022-08-16  2694  	if (cmd & I=
OC_IN) {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2695  		p =3D memdup=
_user(arg, _IOC_SIZE(cmd));
e225c20eb0fd0b Scott Bauer                 2017-02-14  2696  		if (IS_ERR(p=
))
e225c20eb0fd0b Scott Bauer                 2017-02-14  2697  			return PTR_=
ERR(p);
c6ea70604249bc dougmill(a)linux.vnet.ibm.com 2022-08-16  2698  	}
455a7b238cd6bc Scott Bauer                 2017-02-03  2699  =

e225c20eb0fd0b Scott Bauer                 2017-02-14  2700  	switch (cmd) {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2701  	case IOC_OPAL=
_SAVE:
e225c20eb0fd0b Scott Bauer                 2017-02-14 @2702  		ret =3D opal=
_save(dev, p);

:::::: The code at line 2702 was first introduced by commit
:::::: e225c20eb0fd0b6657e640408f11ee392dc82b5b Move stack parameters for s=
ed_ioctl to prevent oversized stack with CONFIG_KASAN

:::::: TO: Scott Bauer <scott.bauer@intel.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4891419373805466478==--

