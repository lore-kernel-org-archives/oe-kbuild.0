Content-Type: multipart/mixed; boundary="===============8465831173964590712=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-stable-rc:linux-5.10.y 7449/9999] arch/x86/kernel/head_64.o: warning: objtool: .text+0x5: unreachable instruction
Date: Thu, 17 Mar 2022 07:14:04 +0800
Message-ID: <202203170750.VIEiiAFh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8465831173964590712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Juergen Gross <jgross@suse.com>
CC: Miroslav Benes <mbenes@suse.cz>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.10.y
head:   1ef0e2b3149031c288a85198919cc1778754e515
commit: b36ab509e1817e60f73ce297494f0de1b7ed2c08 [7449/9999] x86/xen: Mark =
cpu_bringup_and_idle() as dead_end_function
:::::: branch date: 3 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/ar=
chive/20220317/202203170750.VIEiiAFh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3Db36ab509e1817e60f73ce297494f0de1b7ed2c08
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout b36ab509e1817e60f73ce297494f0de1b7ed2c08
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: .text+0x5: unreachable inst=
ruction

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8465831173964590712==--

