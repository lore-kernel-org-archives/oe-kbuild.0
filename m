Content-Type: multipart/mixed; boundary="===============4719825945089612596=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-sim.c:839:2: warning: There is an unknown macro here somewhere. Configuration is required. If fwnode_for_each_child_node is a macro then please configure it. [unknownMacro]
Date: Fri, 01 Apr 2022 06:20:45 +0800
Message-ID: <202204010621.wWp6WwgS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4719825945089612596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bartosz Golaszewski <brgl@bgdev.pl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: cb8c474e79be458f58e9df073f51ca159f3a2aa0 gpio: sim: new testing mod=
ule
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpiolib-acpi.c:252:2: warning: There is an unknown macro he=
re somewhere. Configuration is required. If list_for_each_entry is a macro =
then please configure it. [unknownMacro]
    list_for_each_entry(event, &acpi_gpio->events, node)
    ^
--
>> drivers/gpio/gpio-sim.c:839:2: warning: There is an unknown macro here s=
omewhere. Configuration is required. If fwnode_for_each_child_node is a mac=
ro then please configure it. [unknownMacro]
    fwnode_for_each_child_node(swnode, child)
    ^

vim +839 drivers/gpio/gpio-sim.c

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  834  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  835  static void gpio_sim_re=
move_swnode_recursive(struct fwnode_handle *swnode)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  836  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  837  	struct fwnode_handle *=
child;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  838  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07 @839  	fwnode_for_each_child_=
node(swnode, child)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  840  		fwnode_remove_softwar=
e_node(child);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  841  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  842  	fwnode_remove_software=
_node(swnode);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  843  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  844  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4719825945089612596==--

