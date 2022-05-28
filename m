Content-Type: multipart/mixed; boundary="===============7262976599040296923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5242/14198] drivers/input/joystick/sensehat-joystick.c:102:2-9: line 102 is redundant because platform_get_irq() already prints an error
Date: Sat, 28 May 2022 16:43:25 +0800
Message-ID: <202205281652.CGMif8tY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7262976599040296923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Charles Mirabile <cmirabil@redhat.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Daniel Bauman <dbauman@redhat.com>
CC: Mwesigwa Guma <mguma@redhat.com>
CC: Joel Savitz <jsavitz@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: 41657514c796e1f0a8cf289780aff8f79643b7e5 [5242/14198] Input: add Ra=
spberry Pi Sense HAT joystick driver
:::::: branch date: 26 hours ago
:::::: commit date: 5 weeks ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220528=
/202205281652.CGMif8tY-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/joystick/sensehat-joystick.c:102:2-9: line 102 is redundan=
t because platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7262976599040296923==--

