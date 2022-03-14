Content-Type: multipart/mixed; boundary="===============4749652658651434361=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:clk/linux/clk-uniphier 1/1] collect2: error: ld returned 1 exit status
Date: Tue, 15 Mar 2022 05:40:07 +0800
Message-ID: <202203150536.rku2xD80-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4749652658651434361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block clk/linux/clk-uniphier
head:   ca85a66710a8a1f6b0719397225c3e9ee0abb692
commit: ca85a66710a8a1f6b0719397225c3e9ee0abb692 [1/1] clk: uniphier: Fix f=
ixed-rate initialization
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220315/202203150536.rku2xD80-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/ca85a66710a8a1f=
6b0719397225c3e9ee0abb692
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block clk/linux/clk-uniphier
        git checkout ca85a66710a8a1f6b0719397225c3e9ee0abb692
        # save the config file to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 SHELL=3D/bin/bash tools/all

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
>> collect2: error: ld returned 1 exit status
   make[3]: *** [<builtin>: vringh_test] Error 1
   make[3]: *** Waiting for unfinished jobs....
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_ring.o: in function `spin_lock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
6: undefined reference to `pthread_spin_lock'
   /usr/bin/ld: virtio_ring.o: in function `spin_unlock':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:2=
2: undefined reference to `pthread_spin_unlock'
   /usr/bin/ld: virtio_test.o: in function `spin_lock_init':
   /kbuild/worktree/build-ktools-consumer/tools/virtio/./linux/spinlock.h:1=
0: undefined reference to `pthread_spin_init'
>> collect2: error: ld returned 1 exit status
   make[3]: *** [<builtin>: virtio_test] Error 1
   ***
   *** The source tree is not clean, please run 'make mrproper'
   *** in /kbuild/worktree/build-ktools-consumer
   ***
   make[5]: *** [/kbuild/worktree/build-ktools-consumer/Makefile:575: outpu=
tmakefile] Error 1
   make[4]: *** [Makefile:723: include/config/auto.conf.cmd] Error 2
   make[3]: *** [Makefile:11: mod] Error 2

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4749652658651434361==--

