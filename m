Content-Type: multipart/mixed; boundary="===============3456255561123025596=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 302/364] drivers/video/backlight/rave-sp-backlight.c: linux/backlight.h is included more than once.
Date: Mon, 14 Jun 2021 05:42:54 +0800
Message-ID: <202106140550.A1INT1nf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3456255561123025596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>
CC: Lee Jones <lee.jones@linaro.org>
CC: Daniel Thompson <daniel.thompson@linaro.org>
CC: Jingoo Han <jingoohan1@gmail.com>
CC: Support Opensource <support.opensource@diasemi.com>
CC: dri-devel(a)lists.freedesktop.org
CC: linux-fbdev(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: 3fb8658426ac271948eb757e1c5a5554afdc5cf8 [302/364] sched/headers, f=
b: Simplify <linux/fb.h> dependencies
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/video/backlight/rave-sp-backlight.c: linux/backlight.h is includ=
ed more than once.
--
>> drivers/video/backlight/lm3639_bl.c: linux/backlight.h is included more =
than once.
--
>> drivers/video/backlight/kb3886_bl.c: linux/backlight.h is included more =
than once.
--
>> drivers/video/backlight/da9052_bl.c: linux/backlight.h is included more =
than once.
--
>> drivers/video/backlight/cr_bllcd.c: linux/backlight.h is included more t=
han once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3456255561123025596==--

