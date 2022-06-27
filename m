Content-Type: multipart/mixed; boundary="===============7392532039417629466=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:lto 40/48] arch/x86/events/amd/core.c:696:23: warning: no previous prototype for 'amd_pmu_test_overflow_topbit'
Date: Mon, 27 Jun 2022 18:46:25 +0800
Message-ID: <202206271846.ABXxrU2T-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7392532039417629466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andi Kleen <ak@linux.intel.com>
CC: Jiri Slaby <jirislaby@kernel.org>
CC: Martin Liska <mliska@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 lto
head:   b5ee1c28376713353cb5355716949d9c6d9b416b
commit: 37d6f8c7840982bb452f8bb411fba6a7f4f0e8e9 [40/48] cpufreq, amd-pstat=
e, lto: Fix for gcc LTO
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220627/20=
2206271846.ABXxrU2T-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.g=
it/commit/?id=3D37d6f8c7840982bb452f8bb411fba6a7f4f0e8e9
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kerne=
l/git/jirislaby/linux.git
        git fetch --no-tags jirislaby lto
        git checkout 37d6f8c7840982bb452f8bb411fba6a7f4f0e8e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash arch/x86/eve=
nts/amd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/core.c:696:23: warning: no previous prototype for 'a=
md_pmu_test_overflow_topbit' [-Wmissing-prototypes]
     696 | __visible_on_lto bool amd_pmu_test_overflow_topbit(int idx)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/amd_pmu_test_overflow_topbit +696 arch/x86/events/amd/core.c

7685665c390dc6 Sandipan Das 2022-04-21  695  =

37d6f8c7840982 Andi Kleen   2022-02-18 @696  __visible_on_lto bool amd_pmu_=
test_overflow_topbit(int idx)
7685665c390dc6 Sandipan Das 2022-04-21  697  {
7685665c390dc6 Sandipan Das 2022-04-21  698  	u64 counter;
7685665c390dc6 Sandipan Das 2022-04-21  699  =

7685665c390dc6 Sandipan Das 2022-04-21  700  	rdmsrl(x86_pmu_event_addr(idx=
), counter);
7685665c390dc6 Sandipan Das 2022-04-21  701  =

7685665c390dc6 Sandipan Das 2022-04-21  702  	return !(counter & BIT_ULL(x8=
6_pmu.cntval_bits - 1));
7685665c390dc6 Sandipan Das 2022-04-21  703  }
7685665c390dc6 Sandipan Das 2022-04-21  704  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7392532039417629466==--

