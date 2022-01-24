Content-Type: multipart/mixed; boundary="===============0028724553554621468=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-sim.c:513:2: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Tue, 25 Jan 2022 06:21:23 +0800
Message-ID: <202201250300.pawdAWzw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0028724553554621468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bartosz Golaszewski <brgl@bgdev.pl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: cb8c474e79be458f58e9df073f51ca159f3a2aa0 gpio: sim: new testing mod=
ule
date:   5 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 5 weeks ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-sim.c:513:2: warning: %u in format string (no. 1) requ=
ires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfAr=
gType_uint]
    snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpio-sim.c:513:2: warning: %u in format string (no. 1) requ=
ires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfAr=
gType_uint]
    snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
    ^
   drivers/gpio/gpio-sim.c:889:7: warning: Uninitialized variable: ret [uni=
nitvar]
     if (ret) {
         ^

vim +513 drivers/gpio/gpio-sim.c

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  502  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  503  /* This is called with =
dev->lock already taken. */
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  504  static int gpio_sim_bus=
_notifier_call(struct notifier_block *nb,
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  505  				      unsigned long=
 action, void *data)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  506  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  507  	struct gpio_sim_device=
 *simdev =3D container_of(nb,
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  508  						      struct gpio=
_sim_device,
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  509  						      bus_notifie=
r);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  510  	struct device *dev =3D=
 data;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  511  	char devname[32];
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  512  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07 @513  	snprintf(devname, size=
of(devname), "gpio-sim.%u", simdev->id);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  514  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  515  	if (strcmp(dev_name(de=
v), devname) =3D=3D 0) {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  516  		if (action =3D=3D BUS=
_NOTIFY_BOUND_DRIVER)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  517  			simdev->driver_bound=
 =3D true;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  518  		else if (action =3D=
=3D BUS_NOTIFY_DRIVER_NOT_BOUND)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  519  			simdev->driver_bound=
 =3D false;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  520  		else
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  521  			return NOTIFY_DONE;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  522  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  523  		complete(&simdev->pro=
be_completion);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  524  		return NOTIFY_OK;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  525  	}
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  526  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  527  	return NOTIFY_DONE;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  528  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  529  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0028724553554621468==--

