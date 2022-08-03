Content-Type: multipart/mixed; boundary="===============2699050770441548452=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mark:arm64/stacktrace/rework-cleanup 3/8] arch/arm64/kernel/sdei.c:66:21: error: use of undeclared identifier 'sdei_stack_normal_ptr'
Date: Thu, 04 Aug 2022 04:10:44 +0800
Message-ID: <202208040427.vAzlkXzS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2699050770441548452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Kalesh Singh <kaleshsingh@google.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm6=
4/stacktrace/rework-cleanup
head:   ff57049f8e5ec88c03b804c73bb4dd44ffa88896
commit: 10b1649e7fc666d82f11a5b4463013b3e46a7a53 [3/8] arm64: stacktrace: m=
ove SDEI stack helpers to stacktrace code
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-buildonly-randconfig-r003-20220803 (https://download.01.org/0=
day-ci/archive/20220804/202208040427.vAzlkXzS-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519=
e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/co=
mmit/?id=3D10b1649e7fc666d82f11a5b4463013b3e46a7a53
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git=
/mark/linux.git
        git fetch --no-tags mark arm64/stacktrace/rework-cleanup
        git checkout 10b1649e7fc666d82f11a5b4463013b3e46a7a53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/sdei.c:66:21: error: use of undeclared identifier 'sde=
i_stack_normal_ptr'
                   _free_sdei_stack(&sdei_stack_normal_ptr, cpu);
                                     ^
>> arch/arm64/kernel/sdei.c:67:21: error: use of undeclared identifier 'sde=
i_stack_critical_ptr'
                   _free_sdei_stack(&sdei_stack_critical_ptr, cpu);
                                     ^
   arch/arm64/kernel/sdei.c:92:27: error: use of undeclared identifier 'sde=
i_stack_normal_ptr'
                   err =3D _init_sdei_stack(&sdei_stack_normal_ptr, cpu);
                                           ^
   arch/arm64/kernel/sdei.c:95:27: error: use of undeclared identifier 'sde=
i_stack_critical_ptr'
                   err =3D _init_sdei_stack(&sdei_stack_critical_ptr, cpu);
                                           ^
   4 errors generated.


vim +/sdei_stack_normal_ptr +66 arch/arm64/kernel/sdei.c

f5df26961853d6 James Morse 2018-01-08  57  =

f5df26961853d6 James Morse 2018-01-08  58  static void free_sdei_stacks(voi=
d)
f5df26961853d6 James Morse 2018-01-08  59  {
f5df26961853d6 James Morse 2018-01-08  60  	int cpu;
f5df26961853d6 James Morse 2018-01-08  61  =

eec3bf6861a870 Will Deacon 2020-12-01  62  	if (!IS_ENABLED(CONFIG_VMAP_STA=
CK))
eec3bf6861a870 Will Deacon 2020-12-01  63  		return;
eec3bf6861a870 Will Deacon 2020-12-01  64  =

f5df26961853d6 James Morse 2018-01-08  65  	for_each_possible_cpu(cpu) {
f5df26961853d6 James Morse 2018-01-08 @66  		_free_sdei_stack(&sdei_stack_n=
ormal_ptr, cpu);
f5df26961853d6 James Morse 2018-01-08 @67  		_free_sdei_stack(&sdei_stack_c=
ritical_ptr, cpu);
f5df26961853d6 James Morse 2018-01-08  68  	}
f5df26961853d6 James Morse 2018-01-08  69  }
f5df26961853d6 James Morse 2018-01-08  70  =


:::::: The code at line 66 was first introduced by commit
:::::: f5df26961853d6809d704cedcaf082c57f635a64 arm64: kernel: Add arch-spe=
cific SDEI entry code and CPU masking

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2699050770441548452==--

