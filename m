Content-Type: multipart/mixed; boundary="===============3084125338039863850=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7391/10864] kernel/bpf/verifier.c:619 mark_stack_slot_scratched() warn: should '1 << spi' be a 64 bit type?
Date: Thu, 06 Jan 2022 08:09:36 +0800
Message-ID: <202201060848.nagWejwv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3084125338039863850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christy Lee <christylee@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7a769a3922d81cfc74ab4d90a9cc69485f260976
commit: 0f55f9ed21f96630c6ec96805d42f92c0b458b37 [7391/10864] bpf: Only pri=
nt scratched registers and stack slots to verifier logs.
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-m031-20220105 (https://download.01.org/0day-ci/ar=
chive/20220106/202201060848.nagWejwv-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
kernel/bpf/verifier.c:619 mark_stack_slot_scratched() warn: should '1 << sp=
i' be a 64 bit type?

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:91 current_thread_info() warn: incons=
istent indenting

vim +619 kernel/bpf/verifier.c

0f55f9ed21f9663 Christy Lee 2021-12-16  616  =

0f55f9ed21f9663 Christy Lee 2021-12-16  617  static void mark_stack_slot_sc=
ratched(struct bpf_verifier_env *env, u32 spi)
0f55f9ed21f9663 Christy Lee 2021-12-16  618  {
0f55f9ed21f9663 Christy Lee 2021-12-16 @619  	env->scratched_stack_slots |=
=3D 1UL << spi;
0f55f9ed21f9663 Christy Lee 2021-12-16  620  }
0f55f9ed21f9663 Christy Lee 2021-12-16  621  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3084125338039863850==--

