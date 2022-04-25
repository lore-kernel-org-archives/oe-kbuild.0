Content-Type: multipart/mixed; boundary="===============9201724777081909627=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mingo-tip:sched/headers 1954/2579] arch/x86/include/asm/processor_api.h:36:1: sparse: struct fixed_percpu_data extern [addressable] [toplevel] fixed_percpu_data
Date: Mon, 25 Apr 2022 12:12:07 +0800
Message-ID: <202204251243.pUEzCnrW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9201724777081909627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/h=
eaders
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 98059e2f050a3f6f7474f92ca847b02ec9fe9cb2 [1954/2579] headers/deps: =
x86/cpu: Optimize <asm/processor.h> dependencies
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-s022-20220425 (https://download.01.org/0day-ci/ar=
chive/20220425/202204251243.pUEzCnrW-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/com=
mit/?id=3D98059e2f050a3f6f7474f92ca847b02ec9fe9cb2
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/=
git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 98059e2f050a3f6f7474f92ca847b02ec9fe9cb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash arch/x86/kernel/cpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/cpu/common.c:1930:1: sparse: sparse: symbol 'fixed_percp=
u_data' redeclared with different type (different address spaces):
   arch/x86/kernel/cpu/common.c:1930:1: sparse:    struct fixed_percpu_data=
 [addressable] [noderef] [toplevel] __percpu fixed_percpu_data
   arch/x86/kernel/cpu/common.c: note: in included file:
   arch/x86/include/asm/processor_api.h:36:1: sparse: note: previously decl=
ared as:
>> arch/x86/include/asm/processor_api.h:36:1: sparse:    struct fixed_percp=
u_data extern [addressable] [toplevel] fixed_percpu_data
   arch/x86/kernel/cpu/common.c:221:43: sparse: sparse: cast truncates bits=
 from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:222:43: sparse: sparse: cast truncates bits=
 from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:223:43: sparse: sparse: cast truncates bits=
 from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:224:43: sparse: sparse: cast truncates bits=
 from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:225:43: sparse: sparse: cast truncates bits=
 from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:226:43: sparse: sparse: cast truncates bits=
 from constant value (fffff becomes ffff)
>> arch/x86/include/asm/processor_api.h:40:31: sparse: sparse: incorrect ty=
pe in initializer (different address spaces) @@     expected void const [no=
deref] __percpu *__vpp_verify @@     got char ( * )[40] @@
   arch/x86/include/asm/processor_api.h:40:31: sparse:     expected void co=
nst [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor_api.h:40:31: sparse:     got char ( * )[4=
0]

vim +36 arch/x86/include/asm/processor_api.h

98059e2f050a3f Ingo Molnar 2021-11-24  34  =

98059e2f050a3f Ingo Molnar 2021-11-24  35  DECLARE_PER_CPU_FIRST(struct fix=
ed_percpu_data, fixed_percpu_data) __visible;
98059e2f050a3f Ingo Molnar 2021-11-24 @36  DECLARE_INIT_PER_CPU(fixed_percp=
u_data);
98059e2f050a3f Ingo Molnar 2021-11-24  37  =

98059e2f050a3f Ingo Molnar 2021-11-24  38  static inline unsigned long cpu_=
kernelmode_gs_base(int cpu)
98059e2f050a3f Ingo Molnar 2021-11-24  39  {
98059e2f050a3f Ingo Molnar 2021-11-24 @40  	return (unsigned long)per_cpu(f=
ixed_percpu_data.gs_base, cpu);
98059e2f050a3f Ingo Molnar 2021-11-24  41  }
98059e2f050a3f Ingo Molnar 2021-11-24  42  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9201724777081909627==--

