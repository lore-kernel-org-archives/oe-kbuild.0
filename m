Content-Type: multipart/mixed; boundary="===============0842843399317059599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2115/14198] drivers/input/misc/iqs7222.c:2418:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sat, 28 May 2022 15:52:25 +0800
Message-ID: <202205281555.7oEwEjIQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0842843399317059599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: e505edaedcb9e7d16eefddc62d2189afaea0febc [2115/14198] Input: add su=
pport for Azoteq IQS7222A/B/C
:::::: branch date: 25 hours ago
:::::: commit date: 7 weeks ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220528=
/202205281555.7oEwEjIQ-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/iqs7222.c:2418:9-34: WARNING: Threaded IRQ with no pr=
imary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0842843399317059599==--

