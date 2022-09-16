Content-Type: multipart/mixed; boundary="===============2944439558475589880=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:call-depth-tracking 49/59] arch/x86/include/asm/nospec-branch.h: asm/GEN-for-each-reg.h is included more than once.
Date: Sat, 17 Sep 2022 06:24:59 +0800
Message-ID: <202209170618.2UQw7Tb4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2944439558475589880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git ca=
ll-depth-tracking
head:   bc7583c5f43c957cb0b0f3e24d079b91576c1127
commit: 565b157e020446be36806822d6ef38e986b6444e [49/59] x86/retpoline: Add=
 SKL retthunk retpolines
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/nospec-branch.h: asm/GEN-for-each-reg.h is included=
 more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2944439558475589880==--

