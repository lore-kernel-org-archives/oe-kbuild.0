Content-Type: multipart/mixed; boundary="===============5740442596165243840=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: ERROR: modpost: "_restgpr1_23" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
Date: Tue, 26 Apr 2022 10:54:17 +0800
Message-ID: <202204261040.DakEidkZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5740442596165243840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Melissa Wen <mwen@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>

Hi Melissa,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: cf689e869cf0339c387397c7a6805e387594656d drm/amd/display: move FPU-=
related code from dcn20 to dml folder
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-s032-20220424 (https://download.01.org/0day-ci=
/archive/20220426/202204261040.DakEidkZ-lkp(a)intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf689e869cf0339c387397c7a6805e387594656d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf689e869cf0339c387397c7a6805e387594656d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "_restgpr1_16" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
ERROR: modpost: "_restgpr1_19" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
ERROR: modpost: "_restgpr1_18" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
ERROR: modpost: "_restfpr_19" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefi=
ned!
ERROR: modpost: "_restfpr_17" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefi=
ned!
ERROR: modpost: "_restfpr_18" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefi=
ned!
ERROR: modpost: "_restgpr1_24" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
ERROR: modpost: "_restgpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
ERROR: modpost: "_restgpr1_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
>> ERROR: modpost: "_restgpr1_23" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] un=
defined!
WARNING: modpost: suppressed 52 unresolved symbol warnings because there we=
re too many)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5740442596165243840==--

