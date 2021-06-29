Content-Type: multipart/mixed; boundary="===============8908685028897094227=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [CFT][PATCH] exit/bdflush: Remove the deprecated bdflush system call
Date: Wed, 30 Jun 2021 05:55:25 +0800
Message-ID: <202106300518.XTzRgogX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8908685028897094227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <87sg10quue.fsf_-_@disp2133>
References: <87sg10quue.fsf_-_@disp2133>
TO: "Eric W. Biederman" <ebiederm@xmission.com>
TO: Michael Schmitz <schmitzmic@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: "linux-arch" <linux-arch@vger.kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: Oleg Nesterov <oleg@redhat.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
CC: Richard Henderson <rth@twiddle.net>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: Matt Turner <mattst88@gmail.com>

Hi "Eric,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on arm64/for-next/core m68k/for-next hp-parisc/for=
-next powerpc/next s390/features tip/x86/asm linus/master sparc/master v5.1=
3 next-20210629]
[cannot apply to sparc-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Eric-W-Biederman/exit-bdfl=
ush-Remove-the-deprecated-bdflush-system-call/20210630-042915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 012669c=
740e6e2afa8bdb95394d06676f933dd2d
:::::: branch date: 86 minutes ago
:::::: commit date: 86 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/sysca=
ll.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.t=
bl':  125< 134  common	bdflush			-				-
>> Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/sysca=
ll.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.t=
bl':  125> 134  common	bdflush			sys_ni_syscall			sys_ni_syscall

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8908685028897094227==--

