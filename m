Content-Type: multipart/mixed; boundary="===============9175690006825258211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:objtool/core 15/24] vmlinux.o: warning: objtool: crc_pcl+0x7c: missing int3 after indirect jump
Date: Tue, 03 May 2022 12:59:45 +0800
Message-ID: <202205031245.byujnP62-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9175690006825258211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Miroslav Benes <mbenes@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool=
/core
head:   a8e35fece49b16b20de000aab687ca075e4463af
commit: c2bdd61c98d915ad2cc1f8cd4661fcda1f1e4c16 [15/24] objtool: Extricate=
 sls from stack validation
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-s022-20220502 (https://download.01.org/0day-ci/ar=
chive/20220503/202205031245.byujnP62-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3Dc2bdd61c98d915ad2cc1f8cd4661fcda1f1e4c16
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/=
tip/tip.git
        git fetch --no-tags tip objtool/core
        git checkout c2bdd61c98d915ad2cc1f8cd4661fcda1f1e4c16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: crc_pcl+0x7c: missing int3 after indirect j=
ump

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9175690006825258211==--

