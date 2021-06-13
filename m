Content-Type: multipart/mixed; boundary="===============0428617196461823986=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 42/364] arch/x86/include/asm/processor.h: linux/sched/thread.h is included more than once.
Date: Mon, 14 Jun 2021 04:55:40 +0800
Message-ID: <202106140428.UOGl0rub-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0428617196461823986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@alien8.de>
CC: x86(a)kernel.org
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Kees Cook <keescook@chromium.org>
CC: Sasha Levin <sashal@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Andy Lutomirski <luto@kernel.org>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: 0e04b3ebeb185beeb77ebc6f70f6a5eef9ecdb3d [42/364] sched/headers: Co=
nvert task_struct::thread to a per_task() field
:::::: branch date: 2 hours ago
:::::: commit date: 4 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/processor.h: linux/sched/thread.h is included more =
than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0428617196461823986==--

