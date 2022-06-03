Content-Type: multipart/mixed; boundary="===============4972428561934346374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/2] cpumask: Fix invalid uniprocessor mask assumption
Date: Fri, 03 Jun 2022 13:35:14 +0800
Message-ID: <202206031301.CXhGloF7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4972428561934346374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 cacheinfo.c:(.text+0x451): undefined reference to `cpu_llc_shared_map'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <017b97698ba58d33bf45d30317d5a73c5b93d2a0.1654201862.git.sande=
r@svanheule.net>
References: <017b97698ba58d33bf45d30317d5a73c5b93d2a0.1654201862.git.sander=
@svanheule.net>
TO: Sander Vanheule <sander@svanheule.net>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Yury Norov <yury.norov@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Valentin Schneider <vschneid@redhat.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Marco Elver <elver@google.com>
TO: Barry Song <song.bao.hua@hisilicon.com>
CC: linux-kernel(a)vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sander Vanheule <sander@svanheule.net>

Hi Sander,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/cpum=
ask-Fix-invalid-uniprocessor-assumptions/20220603-050659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
603/202206031301.CXhGloF7-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-14-g5a0004b5-dirty
        # https://github.com/intel-lab-lkp/linux/commit/4bf6a27a30fc5847a5f=
c6e6dae56e5716c2625ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sander-Vanheule/cpumask-Fix-invali=
d-uniprocessor-assumptions/20220603-050659
        git checkout 4bf6a27a30fc5847a5fc6e6dae56e5716c2625ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/cacheinfo.o: in function `__cache_cpumap_setup':
>> cacheinfo.c:(.text+0x451): undefined reference to `cpu_llc_shared_map'
>> ld: cacheinfo.c:(.text+0x475): undefined reference to `cpu_llc_shared_ma=
p'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4972428561934346374==--

