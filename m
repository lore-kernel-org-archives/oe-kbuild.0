Content-Type: multipart/mixed; boundary="===============4209136174081559915=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/counter/counter-chrdev.c:91 counter_chrdev_read() error: uninitialized symbol 'copied'.
Date: Tue, 14 Dec 2021 18:39:42 +0800
Message-ID: <202112141815.oUnCbx3S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4209136174081559915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: William Breathitt Gray <vilhelm.gray@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: b6c50affda5957a3629b149a91c7f6688ffce7f7 counter: Add character dev=
ice interface
date:   8 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211214/202112141815.oUnCbx3S-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/counter/counter-chrdev.c:91 counter_chrdev_read() error: uninitiali=
zed symbol 'copied'.

Old smatch warnings:
drivers/counter/counter-chrdev.c:488 counter_get_data() error: uninitialize=
d symbol 'ret'.
drivers/counter/counter-chrdev.c:507 counter_get_data() error: uninitialize=
d symbol 'ret'.

vim +/copied +91 drivers/counter/counter-chrdev.c

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
b6c50affda5957 William Breathitt Gray 2021-09-29  63  	unsigned int copied;
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
b6c50affda5957 William Breathitt Gray 2021-09-29 @91  	} while (!copied);
b6c50affda5957 William Breathitt Gray 2021-09-29  92  =

b6c50affda5957 William Breathitt Gray 2021-09-29  93  	return copied;
b6c50affda5957 William Breathitt Gray 2021-09-29  94  }
b6c50affda5957 William Breathitt Gray 2021-09-29  95  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4209136174081559915==--

