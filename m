Content-Type: multipart/mixed; boundary="===============5446346586784794048=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/counter/counter-chrdev.c:63:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 28 Aug 2022 23:50:00 +0800
Message-ID: <202208282314.yZzZUGVc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5446346586784794048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/c=
ounter/counter-chrdev.c:63:22: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: William Breathitt Gray <vilhelm.gray@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   10d4879f9ef01cc6190fafe4257d06f375bab92c
commit: b6c50affda5957a3629b149a91c7f6688ffce7f7 counter: Add character dev=
ice interface
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220828 (https://download.01.org/0day-ci/archi=
ve/20220828/202208282314.yZzZUGVc-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db6c50affda5957a3629b149a91c7f6688ffce7f7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b6c50affda5957a3629b149a91c7f6688ffce7f7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In function 'counter_get_data':
   cc1: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyz=
er-use-of-uninitialized-value]
     'counter_get_data': events 1-2
       |
       |drivers/counter/counter-chrdev.c:470:12:
       |  470 |         if (comp_node->component.type =3D=3D COUNTER_COMPON=
ENT_NONE)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  473 |         switch (comp->type) {
       |      |                 ~~~~~~~~~~
       |      |                     |
       |      |                     (2) ...to here
       |
     'counter_get_data': event 3
       |
       |cc1:
       | (3): following 'default:' branch...
       |
     'counter_get_data': event 4
       |
       |  487 |                 *value =3D value_u8;
       |      |                 ~~~~~~~^~~~~~~~~~
       |      |                        |
       |      |                        (4) ...to here
       |
     'counter_get_data': event 5
       |
       |cc1:
       | (5): use of uninitialized value '=1B[01m=1B[K<unknown>=1B[m=1B[K' =
here
       |
   drivers/counter/counter-chrdev.c: In function 'counter_chrdev_read':
>> drivers/counter/counter-chrdev.c:63:22: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      63 |         unsigned int copied;
         |                      ^~~~~~
     'counter_chrdev_read': event 1
       |
       |   63 |         unsigned int copied;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +63 drivers/counter/counter-chrdev.c

b6c50affda5957 William Breathitt Gray 2021-09-29  33  =

b6c50affda5957 William Breathitt Gray 2021-09-29  34  #define counter_comp_=
read_is_equal(a, b) \
b6c50affda5957 William Breathitt Gray 2021-09-29  35  	(a.action_read =3D=
=3D b.action_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  36  	a.device_u8_read =3D=
=3D b.device_u8_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  37  	a.count_u8_read =3D=
=3D b.count_u8_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  38  	a.signal_u8_read =3D=
=3D b.signal_u8_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  39  	a.device_u32_read =
=3D=3D b.device_u32_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  40  	a.count_u32_read =3D=
=3D b.count_u32_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  41  	a.signal_u32_read =
=3D=3D b.signal_u32_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  42  	a.device_u64_read =
=3D=3D b.device_u64_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  43  	a.count_u64_read =3D=
=3D b.count_u64_read || \
b6c50affda5957 William Breathitt Gray 2021-09-29  44  	a.signal_u64_read =
=3D=3D b.signal_u64_read)
b6c50affda5957 William Breathitt Gray 2021-09-29  45  =

b6c50affda5957 William Breathitt Gray 2021-09-29  46  #define counter_comp_=
read_is_set(comp) \
b6c50affda5957 William Breathitt Gray 2021-09-29  47  	(comp.action_read ||=
 \
b6c50affda5957 William Breathitt Gray 2021-09-29  48  	comp.device_u8_read =
|| \
b6c50affda5957 William Breathitt Gray 2021-09-29  49  	comp.count_u8_read |=
| \
b6c50affda5957 William Breathitt Gray 2021-09-29  50  	comp.signal_u8_read =
|| \
b6c50affda5957 William Breathitt Gray 2021-09-29  51  	comp.device_u32_read=
 || \
b6c50affda5957 William Breathitt Gray 2021-09-29  52  	comp.count_u32_read =
|| \
b6c50affda5957 William Breathitt Gray 2021-09-29  53  	comp.signal_u32_read=
 || \
b6c50affda5957 William Breathitt Gray 2021-09-29  54  	comp.device_u64_read=
 || \
b6c50affda5957 William Breathitt Gray 2021-09-29  55  	comp.count_u64_read =
|| \
b6c50affda5957 William Breathitt Gray 2021-09-29  56  	comp.signal_u64_read)
b6c50affda5957 William Breathitt Gray 2021-09-29  57  =

b6c50affda5957 William Breathitt Gray 2021-09-29  58  static ssize_t counte=
r_chrdev_read(struct file *filp, char __user *buf,
b6c50affda5957 William Breathitt Gray 2021-09-29  59  				   size_t len, lo=
ff_t *f_ps)
b6c50affda5957 William Breathitt Gray 2021-09-29  60  {
b6c50affda5957 William Breathitt Gray 2021-09-29  61  	struct counter_devic=
e *const counter =3D filp->private_data;
b6c50affda5957 William Breathitt Gray 2021-09-29  62  	int err;
b6c50affda5957 William Breathitt Gray 2021-09-29 @63  	unsigned int copied;
b6c50affda5957 William Breathitt Gray 2021-09-29  64  =

b6c50affda5957 William Breathitt Gray 2021-09-29  65  	if (!counter->ops)
b6c50affda5957 William Breathitt Gray 2021-09-29  66  		return -ENODEV;
b6c50affda5957 William Breathitt Gray 2021-09-29  67  =

b6c50affda5957 William Breathitt Gray 2021-09-29  68  	if (len < sizeof(str=
uct counter_event))
b6c50affda5957 William Breathitt Gray 2021-09-29  69  		return -EINVAL;
b6c50affda5957 William Breathitt Gray 2021-09-29  70  =

b6c50affda5957 William Breathitt Gray 2021-09-29  71  	do {
b6c50affda5957 William Breathitt Gray 2021-09-29  72  		if (kfifo_is_empty(=
&counter->events)) {
b6c50affda5957 William Breathitt Gray 2021-09-29  73  			if (filp->f_flags =
& O_NONBLOCK)
b6c50affda5957 William Breathitt Gray 2021-09-29  74  				return -EAGAIN;
b6c50affda5957 William Breathitt Gray 2021-09-29  75  =

b6c50affda5957 William Breathitt Gray 2021-09-29  76  			err =3D wait_event=
_interruptible(counter->events_wait,
b6c50affda5957 William Breathitt Gray 2021-09-29  77  					!kfifo_is_empty(=
&counter->events) ||
b6c50affda5957 William Breathitt Gray 2021-09-29  78  					!counter->ops);
b6c50affda5957 William Breathitt Gray 2021-09-29  79  			if (err < 0)
b6c50affda5957 William Breathitt Gray 2021-09-29  80  				return err;
b6c50affda5957 William Breathitt Gray 2021-09-29  81  			if (!counter->ops)
b6c50affda5957 William Breathitt Gray 2021-09-29  82  				return -ENODEV;
b6c50affda5957 William Breathitt Gray 2021-09-29  83  		}
b6c50affda5957 William Breathitt Gray 2021-09-29  84  =

b6c50affda5957 William Breathitt Gray 2021-09-29  85  		if (mutex_lock_inte=
rruptible(&counter->events_lock))
b6c50affda5957 William Breathitt Gray 2021-09-29  86  			return -ERESTARTSY=
S;
b6c50affda5957 William Breathitt Gray 2021-09-29  87  		err =3D kfifo_to_us=
er(&counter->events, buf, len, &copied);
b6c50affda5957 William Breathitt Gray 2021-09-29  88  		mutex_unlock(&count=
er->events_lock);
b6c50affda5957 William Breathitt Gray 2021-09-29  89  		if (err < 0)
b6c50affda5957 William Breathitt Gray 2021-09-29  90  			return err;
b6c50affda5957 William Breathitt Gray 2021-09-29  91  	} while (!copied);
b6c50affda5957 William Breathitt Gray 2021-09-29  92  =

b6c50affda5957 William Breathitt Gray 2021-09-29  93  	return copied;
b6c50affda5957 William Breathitt Gray 2021-09-29  94  }
b6c50affda5957 William Breathitt Gray 2021-09-29  95  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5446346586784794048==--

