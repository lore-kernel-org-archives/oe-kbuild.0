Content-Type: multipart/mixed; boundary="===============6009937910552828073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [atishp04:kvm_perf_rfc_buildtest 15/24] lib/zstd/decompress/zstd_decompress_block.o: warning: objtool: ZSTD_decompressSequences_bmi2+0xe7a: call without frame pointer save/setup
Date: Mon, 18 Jul 2022 09:34:19 +0800
Message-ID: <202207180954.7lqxnxJu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6009937910552828073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 lib/zstd/decompress/zstd_decompress_block.o: warning: objtool: ZSTD_decomp=
ressSequences_bmi2+0xe7a: call without frame pointer save/setup"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Atish Patra <Atish.Patra@wdc.com>
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atishp@rivosinc.com>

tree:   https://github.com/atishp04/linux kvm_perf_rfc_buildtest
head:   ff2f56ec4ff4f67ae3da3936939b1dcf53099a6e
commit: 5faed77192c5455fe17fb4e6aea87e5bcc48a13d [15/24] COVER
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/202=
20718/202207180954.7lqxnxJu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/atishp04/linux/commit/5faed77192c5455fe17fb4e6=
aea87e5bcc48a13d
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_rfc_buildtest
        git checkout 5faed77192c5455fe17fb4e6aea87e5bcc48a13d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/zstd/decompress/zstd_decompress_block.o: warning: objtool: ZSTD_deco=
mpressSequences_bmi2+0xe7a: call without frame pointer save/setup

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6009937910552828073==--

