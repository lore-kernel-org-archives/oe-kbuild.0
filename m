Content-Type: multipart/mixed; boundary="===============5556395503724209878=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [riscv:for-next 24/27] arch/riscv/kernel/traps.c:203:0: warning: There is an unknown macro here somewhere. Configuration is required. If DEFINE_PER_CPU is a macro then please configure it. [unknownMacro]
Date: Sun, 13 Jun 2021 13:36:55 +0800
Message-ID: <202106131353.OeGUsMoe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5556395503724209878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Tong Tiangen <tongtiangen@huawei.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for=
-next
head:   0918a3c9b00bf666bd58e3df16179511f5769409
commit: 7b9dbbb41e1e6579d21fbec1d85ed04a392f73e9 [24/27] riscv: add VMAP_ST=
ACK overflow detection
:::::: branch date: 5 hours ago
:::::: commit date: 26 hours ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kernel/traps.c:203:0: warning: There is an unknown macro here=
 somewhere. Configuration is required. If DEFINE_PER_CPU is a macro then pl=
ease configure it. [unknownMacro]
   =

   ^

vim +203 arch/riscv/kernel/traps.c

7b9dbbb41e1e65 Tong Tiangen 2021-05-24  201  =

7b9dbbb41e1e65 Tong Tiangen 2021-05-24  202  #ifdef CONFIG_VMAP_STACK
7b9dbbb41e1e65 Tong Tiangen 2021-05-24 @203  DEFINE_PER_CPU(unsigned long [=
OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  204  		__aligned(16);
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  205  /*
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  206   * shadow stack, handled_ kern=
el_ stack_ overflow(in kernel/entry.S) is used
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  207   * to get per-cpu overflow sta=
ck(get_overflow_stack).
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  208   */
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  209  long shadow_stack[SHADOW_OVERF=
LOW_STACK_SIZE/sizeof(long)];
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  210  asmlinkage unsigned long get_o=
verflow_stack(void)
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  211  {
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  212  	return (unsigned long)this_cp=
u_ptr(overflow_stack) +
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  213  		OVERFLOW_STACK_SIZE;
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  214  }
7b9dbbb41e1e65 Tong Tiangen 2021-05-24  215  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5556395503724209878==--

