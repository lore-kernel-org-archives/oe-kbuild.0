Content-Type: multipart/mixed; boundary="===============8400348942315634079=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.9-q-release 7904/9999] include/linux/delayacct.h: linux/slab.h is included more than once.
Date: Sat, 20 Aug 2022 09:05:04 +0800
Message-ID: <202208200905.t0aafH4M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8400348942315634079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

include/linux/delayacct.h
include/linux/sched.h
tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android-4.9-q-release
head:   8c62b2bd034cfb52860b9e3f333b1ef587052af2
commit: 0f3e95cb46285a27db306d7a6e48fcf8a317b762 [7904/9999] UPSTREAM: sche=
d/headers, delayacct: Move the 'struct task_delay_info' definition from <li=
nux/sched.h> to <linux/delayacct.h>
:::::: branch date: 6 months ago
:::::: commit date: 3 years, 5 months ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> include/linux/delayacct.h: linux/slab.h is included more than once.
>> /kbuild/src/consumer/include/linux/delayacct.h: linux/sched.h is include=
d more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8400348942315634079==--

