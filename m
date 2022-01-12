Content-Type: multipart/mixed; boundary="===============7277155501997141725=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mingo-tip:sched/headers 1591/2382] include/linux/seqlock_api.h:43:9: sparse: sparse: too long token expansion
Date: Wed, 12 Jan 2022 21:35:52 +0800
Message-ID: <202201122150.zCVIImwk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7277155501997141725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/h=
eaders
head:   1a880941a087613ed42f77001229edfcf75ea8a5
commit: a6c3948fa18366403a757a7fdfc80f5a7c96891f [1591/2382] headers/deps: =
locking/seqlocks: Optimize <linux/seqlock.h>, remove <linux/seqlock_api.h> =
and other changes
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
112/202201122150.zCVIImwk-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/com=
mit/?id=3Da6c3948fa18366403a757a7fdfc80f5a7c96891f
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/=
git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout a6c3948fa18366403a757a7fdfc80f5a7c96891f
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/i915_active.c: note: in included file (through incl=
ude/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ..=
.):
>> include/linux/seqlock_api.h:43:9: sparse: sparse: too long token expansi=
on

vim +43 include/linux/seqlock_api.h

3ddf7f91e04090 Ingo Molnar 2021-08-28  40  =

3ddf7f91e04090 Ingo Molnar 2021-08-28  41  static inline void __seqprop_ass=
ert(const seqcount_t *s)
3ddf7f91e04090 Ingo Molnar 2021-08-28  42  {
3ddf7f91e04090 Ingo Molnar 2021-08-28 @43  	lockdep_assert_preemption_disab=
led();
3ddf7f91e04090 Ingo Molnar 2021-08-28  44  }
3ddf7f91e04090 Ingo Molnar 2021-08-28  45  =


:::::: The code at line 43 was first introduced by commit
:::::: 3ddf7f91e040902cf493741f6a2f592b8356b2ec headers/deps: locking/seqlo=
ck: Move seqlock API definitions to <linux/seqlock_api.h>

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7277155501997141725==--

