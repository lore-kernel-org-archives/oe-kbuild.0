Content-Type: multipart/mixed; boundary="===============0289266056495956758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 1/3] Only print scratched registers and stack slots to verifier logs
Date: Tue, 14 Dec 2021 10:24:14 +0800
Message-ID: <202112141048.WX0f7p6Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0289266056495956758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213182117.682461-2-christylee@fb.com>
References: <20211213182117.682461-2-christylee@fb.com>
TO: Christy Lee <christylee@fb.com>
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: andrii(a)kernel.org
CC: christylee(a)fb.com
CC: bpf(a)vger.kernel.org
CC: kernel-team(a)fb.com

Hi Christy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Christy-Lee/Improve-verifi=
er-log-readability/20211214-022202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m031-20211213 (https://download.01.org/0day-ci/arch=
ive/20211214/202112141048.WX0f7p6Z-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/verifier.c:618 mark_stack_slot_scratched() warn: should '1 << sp=
i' be a 64 bit type?

vim +618 kernel/bpf/verifier.c

a41a40a9bfc92d Christy Lee 2021-12-13  615  =

a41a40a9bfc92d Christy Lee 2021-12-13  616  static void mark_stack_slot_scr=
atched(struct bpf_verifier_env *env, u32 spi)
a41a40a9bfc92d Christy Lee 2021-12-13  617  {
a41a40a9bfc92d Christy Lee 2021-12-13 @618  	env->scratched_stack_slots |=
=3D 1UL << spi;
a41a40a9bfc92d Christy Lee 2021-12-13  619  }
a41a40a9bfc92d Christy Lee 2021-12-13  620  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0289266056495956758==--

