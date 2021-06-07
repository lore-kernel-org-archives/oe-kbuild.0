Content-Type: multipart/mixed; boundary="===============4181212734839563145=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc: Fix duplicate included _clear.h
Date: Mon, 07 Jun 2021 21:55:51 +0800
Message-ID: <202106072121.BxQtsHR2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4181212734839563145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1623061512-31651-1-git-send-email-jiapeng.chong@linux.aliba=
ba.com>
References: <1623061512-31651-1-git-send-email-jiapeng.chong@linux.alibab=
a.com>
TO: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
TO: mpe(a)ellerman.id.au
CC: benh(a)kernel.crashing.org
CC: paulus(a)samba.org
CC: linuxppc-dev(a)lists.ozlabs.org
CC: linux-kernel(a)vger.kernel.org
CC: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Hi Jiapeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.13-rc5 next-20210607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiapeng-Chong/powerpc-Fix-=
duplicate-included-_clear-h/20210607-182626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/powerpc/perf/req-gen/perf.h: _clear.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4181212734839563145==--

