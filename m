Content-Type: multipart/mixed; boundary="===============4356655369963282087=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kernel/patching.c:74:8: warning: Redundant initialization for 'waddr'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Thu, 07 Apr 2022 13:40:20 +0800
Message-ID: <202204071347.JzveAhdA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4356655369963282087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Julien Thierry <jthierry@redhat.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 5f154c4e20d7edd38bddec78f3e0a7628057ef76 arm64: Move patching utili=
ties out of instruction encoding/decoding
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5f154c4e20d7edd38bddec78f3e0a7628057ef76
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/patching.c:74:8: warning: Redundant initialization for=
 'waddr'. The initialized value is overwritten before it is read. [redundan=
tInitialization]
    waddr =3D patch_map(addr, FIX_TEXT_POKE0);
          ^
   arch/arm64/kernel/patching.c:69:14: note: waddr is initialized
    void *waddr =3D addr;
                ^
   arch/arm64/kernel/patching.c:74:8: note: waddr is overwritten
    waddr =3D patch_map(addr, FIX_TEXT_POKE0);
          ^

vim +/waddr +74 arch/arm64/kernel/patching.c

5f154c4e20d7ed Julien Thierry 2021-03-03  66  =

5f154c4e20d7ed Julien Thierry 2021-03-03  67  static int __kprobes __aarch6=
4_insn_write(void *addr, __le32 insn)
5f154c4e20d7ed Julien Thierry 2021-03-03  68  {
5f154c4e20d7ed Julien Thierry 2021-03-03  69  	void *waddr =3D addr;
5f154c4e20d7ed Julien Thierry 2021-03-03  70  	unsigned long flags =3D 0;
5f154c4e20d7ed Julien Thierry 2021-03-03  71  	int ret;
5f154c4e20d7ed Julien Thierry 2021-03-03  72  =

5f154c4e20d7ed Julien Thierry 2021-03-03  73  	raw_spin_lock_irqsave(&patch=
_lock, flags);
5f154c4e20d7ed Julien Thierry 2021-03-03 @74  	waddr =3D patch_map(addr, FI=
X_TEXT_POKE0);
5f154c4e20d7ed Julien Thierry 2021-03-03  75  =

5f154c4e20d7ed Julien Thierry 2021-03-03  76  	ret =3D copy_to_kernel_nofau=
lt(waddr, &insn, AARCH64_INSN_SIZE);
5f154c4e20d7ed Julien Thierry 2021-03-03  77  =

5f154c4e20d7ed Julien Thierry 2021-03-03  78  	patch_unmap(FIX_TEXT_POKE0);
5f154c4e20d7ed Julien Thierry 2021-03-03  79  	raw_spin_unlock_irqrestore(&=
patch_lock, flags);
5f154c4e20d7ed Julien Thierry 2021-03-03  80  =

5f154c4e20d7ed Julien Thierry 2021-03-03  81  	return ret;
5f154c4e20d7ed Julien Thierry 2021-03-03  82  }
5f154c4e20d7ed Julien Thierry 2021-03-03  83  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4356655369963282087==--

