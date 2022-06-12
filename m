Content-Type: multipart/mixed; boundary="===============5477208442394012967=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.9-q-release 7904/9999] include/linux/delayacct.h: linux/sched.h is included more than once.
Date: Mon, 13 Jun 2022 00:02:16 +0800
Message-ID: <202206122329.dqvYDs3t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5477208442394012967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android-4.9-q-release
head:   8c62b2bd034cfb52860b9e3f333b1ef587052af2
commit: 0f3e95cb46285a27db306d7a6e48fcf8a317b762 [7904/9999] UPSTREAM: sche=
d/headers, delayacct: Move the 'struct task_delay_info' definition from <li=
nux/sched.h> to <linux/delayacct.h>
:::::: branch date: 3 months ago
:::::: commit date: 3 years, 3 months ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> include/linux/delayacct.h: linux/sched.h is included more than once.
>> /kbuild/src/consumer/include/linux/delayacct.h: linux/slab.h is included=
 more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5477208442394012967==--

