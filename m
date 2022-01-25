Content-Type: multipart/mixed; boundary="===============7627296358436271277=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/panfrost/panfrost_gpu.c:179:0: warning: failed to expand 'GPU_MODEL', Invalid ## usage when expanding 'GPU_REV_EXT'. [preprocessorErrorDirective]
Date: Tue, 25 Jan 2022 23:24:24 +0800
Message-ID: <202201252314.aYPrMQ1o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7627296358436271277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Guenter,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a08b41ab9e2e468647f78eb17c28e29b93006394
commit: a18b14d8886614b3c7d290c4cfc33389822b0535 riscv: Disable STACKPROTEC=
TOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/panfrost/panfrost_gpu.c:179:0: warning: failed to expand=
 'GPU_MODEL', Invalid ## usage when expanding 'GPU_REV_EXT'. [preprocessorE=
rrorDirective]
   #define GPU_REV_EXT(name, _rev, _p, _s, stat) 3-^

vim +179 drivers/gpu/drm/panfrost/panfrost_gpu.c

f3ba91228e8e91 Rob Herring 2018-09-10  178  =

f3ba91228e8e91 Rob Herring 2018-09-10 @179  #define GPU_REV_EXT(name, _rev,=
 _p, _s, stat) \
f3ba91228e8e91 Rob Herring 2018-09-10  180  {\
f3ba91228e8e91 Rob Herring 2018-09-10  181  	.revision =3D (_rev) << 12 | (=
_p) << 4 | (_s),		\
f3ba91228e8e91 Rob Herring 2018-09-10  182  	.issues =3D hw_issues_##name##=
_r##_rev##p##_p##stat,	\
f3ba91228e8e91 Rob Herring 2018-09-10  183  }
f3ba91228e8e91 Rob Herring 2018-09-10  184  #define GPU_REV(name, r, p) GPU=
_REV_EXT(name, r, p, 0, )
f3ba91228e8e91 Rob Herring 2018-09-10  185  =


:::::: The code@line 179 was first introduced by commit
:::::: f3ba91228e8e917e5bd6c4b72bfe846933d17370 drm/panfrost: Add initial p=
anfrost driver

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7627296358436271277==--

