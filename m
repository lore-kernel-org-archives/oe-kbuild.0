Content-Type: multipart/mixed; boundary="===============3757663390219469572=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: {standard input}:1371: Error: Insn slot not set in unwind record.
Date: Wed, 02 Feb 2022 19:07:06 +0800
Message-ID: <202202021926.qrlwJgJC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3757663390219469572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Rui <ray.huang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi Huang,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: bf67014d6bda16a72deea11dbbff2a97c705ca92 drm/amdgpu: introduce new =
amdgpu_fence object to indicate the job embedded fence
date:   7 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 weeks ago
config: ia64-randconfig-c003-20220130 (https://download.01.org/0day-ci/arch=
ive/20220202/202202021926.qrlwJgJC-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbf67014d6bda16a72deea11dbbff2a97c705ca92
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bf67014d6bda16a72deea11dbbff2a97c705ca92
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 O=3Dbuild_dir ARCH=3Dia64 SHELL=3D/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:153,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/seq_file.h:12,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:31:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:127:48: warning: variable 'old_rr4' =
set but not used [-Wunused-but-set-variable]
     127 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   {standard input}: Assembler messages:
>> {standard input}:1371: Error: Insn slot not set in unwind record.
   {standard input}:1371: Fatal error: Section switching in code is not sup=
ported.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3757663390219469572==--

