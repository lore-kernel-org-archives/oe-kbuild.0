Content-Type: multipart/mixed; boundary="===============4838167618956179195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/notify.c:667:9: warning: Identical condition 'ret', second condition is always false
Date: Wed, 14 Oct 2020 00:57:15 +0800
Message-ID: <202010140013.YMYXTJwY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4838167618956179195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   865c50e1d279671728c2936cb7680eb89355eeea
commit: bd31b249692e256ab92e1a4339e42af0e4971738 firmware: arm_scmi: Add no=
tification dispatch and delivery
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/notify.c:667:9: warning: Identical condition '=
ret', second condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/firmware/arm_scmi/notify.c:661:6: note: first condition
    if (ret)
        ^
   drivers/firmware/arm_scmi/notify.c:667:9: note: second condition
    return ret;
           ^

vim +/ret +667 drivers/firmware/arm_scmi/notify.c

1fc2dd1864c2b18 Cristian Marussi 2020-07-01  638  =

1fc2dd1864c2b18 Cristian Marussi 2020-07-01  639  /**
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  640   * scmi_initialize_events=
_queue()  - Allocate/Initialize a kfifo buffer
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  641   * @ni: A reference to th=
e notification instance to use
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  642   * @equeue: The events_qu=
eue to initialize
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  643   * @sz: Size of the kfifo=
 buffer to allocate
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  644   *
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  645   * Allocate a buffer for =
the kfifo and initialize it.
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  646   *
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  647   * Return: 0 on Success
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  648   */
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  649  static int scmi_initializ=
e_events_queue(struct scmi_notify_instance *ni,
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  650  					struct events_queue =
*equeue, size_t sz)
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  651  {
bd31b249692e256 Cristian Marussi 2020-07-01  652  	int ret;
bd31b249692e256 Cristian Marussi 2020-07-01  653  =

1fc2dd1864c2b18 Cristian Marussi 2020-07-01  654  	if (kfifo_alloc(&equeue-=
>kfifo, sz, GFP_KERNEL))
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  655  		return -ENOMEM;
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  656  	/* Size could have been =
roundup to power-of-two */
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  657  	equeue->sz =3D kfifo_siz=
e(&equeue->kfifo);
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  658  =

bd31b249692e256 Cristian Marussi 2020-07-01  659  	ret =3D devm_add_action_=
or_reset(ni->handle->dev, scmi_kfifo_free,
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  660  				       &equeue->kfifo=
);
bd31b249692e256 Cristian Marussi 2020-07-01  661  	if (ret)
bd31b249692e256 Cristian Marussi 2020-07-01  662  		return ret;
bd31b249692e256 Cristian Marussi 2020-07-01  663  =

bd31b249692e256 Cristian Marussi 2020-07-01  664  	INIT_WORK(&equeue->notif=
y_work, scmi_events_dispatcher);
bd31b249692e256 Cristian Marussi 2020-07-01  665  	equeue->wq =3D ni->notif=
y_wq;
bd31b249692e256 Cristian Marussi 2020-07-01  666  =

bd31b249692e256 Cristian Marussi 2020-07-01 @667  	return ret;
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  668  }
1fc2dd1864c2b18 Cristian Marussi 2020-07-01  669  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4838167618956179195==--

