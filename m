Content-Type: multipart/mixed; boundary="===============8345774719184430733=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:perf/core 6/13] arch/x86/events/amd/lbr.c:79:36: sparse: sparse: invalid access past the end of 'entry' (12 16)
Date: Fri, 19 Aug 2022 10:16:06 +0800
Message-ID: <202208191023.KOHYxWK9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8345774719184430733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
events/amd/lbr.c:79:36: sparse: sparse: invalid access past the end of 'ent=
ry' (12 16)"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sandipan Das <sandipan.das@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git pe=
rf/core
head:   3a8b83ed8cff6da47a4e157d5e7bd461554149ec
commit: a499b4b06c9f978dc69ca4058cd3346075dc7870 [6/13] perf/x86/amd/lbr: A=
dd LbrExtV2 branch record support
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220=
819/202208191023.KOHYxWK9-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3Da499b4b06c9f978dc69ca4058cd3346075dc7870
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue perf/core
        git checkout a499b4b06c9f978dc69ca4058cd3346075dc7870
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash arch/x86/events/amd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/amd/lbr.c:79:36: sparse: sparse: invalid access past the=
 end of 'entry' (12 16)

vim +/entry +79 arch/x86/events/amd/lbr.c

a499b4b06c9f97 Sandipan Das 2022-08-11  63  =

a499b4b06c9f97 Sandipan Das 2022-08-11  64  void amd_pmu_lbr_read(void)
a499b4b06c9f97 Sandipan Das 2022-08-11  65  {
a499b4b06c9f97 Sandipan Das 2022-08-11  66  	struct cpu_hw_events *cpuc =3D=
 this_cpu_ptr(&cpu_hw_events);
a499b4b06c9f97 Sandipan Das 2022-08-11  67  	struct perf_branch_entry *br =
=3D cpuc->lbr_entries;
a499b4b06c9f97 Sandipan Das 2022-08-11  68  	struct branch_entry entry;
a499b4b06c9f97 Sandipan Das 2022-08-11  69  	int out =3D 0, i;
a499b4b06c9f97 Sandipan Das 2022-08-11  70  =

a499b4b06c9f97 Sandipan Das 2022-08-11  71  	if (!cpuc->lbr_users)
a499b4b06c9f97 Sandipan Das 2022-08-11  72  		return;
a499b4b06c9f97 Sandipan Das 2022-08-11  73  =

a499b4b06c9f97 Sandipan Das 2022-08-11  74  	for (i =3D 0; i < x86_pmu.lbr_=
nr; i++) {
a499b4b06c9f97 Sandipan Das 2022-08-11  75  		entry.from.full	=3D amd_pmu_l=
br_get_from(i);
a499b4b06c9f97 Sandipan Das 2022-08-11  76  		entry.to.full	=3D amd_pmu_lbr=
_get_to(i);
a499b4b06c9f97 Sandipan Das 2022-08-11  77  =

a499b4b06c9f97 Sandipan Das 2022-08-11  78  		/* Check if a branch has been=
 logged */
a499b4b06c9f97 Sandipan Das 2022-08-11 @79  		if (!entry.to.split.valid)
a499b4b06c9f97 Sandipan Das 2022-08-11  80  			continue;
a499b4b06c9f97 Sandipan Das 2022-08-11  81  =

a499b4b06c9f97 Sandipan Das 2022-08-11  82  		perf_clear_branch_entry_bitfi=
elds(br + out);
a499b4b06c9f97 Sandipan Das 2022-08-11  83  =

a499b4b06c9f97 Sandipan Das 2022-08-11  84  		br[out].from	=3D sign_ext_bra=
nch_ip(entry.from.split.ip);
a499b4b06c9f97 Sandipan Das 2022-08-11  85  		br[out].to	=3D sign_ext_branc=
h_ip(entry.to.split.ip);
a499b4b06c9f97 Sandipan Das 2022-08-11  86  		br[out].mispred	=3D entry.fro=
m.split.mispredict;
a499b4b06c9f97 Sandipan Das 2022-08-11  87  		br[out].predicted =3D !br[out=
].mispred;
a499b4b06c9f97 Sandipan Das 2022-08-11  88  		out++;
a499b4b06c9f97 Sandipan Das 2022-08-11  89  	}
a499b4b06c9f97 Sandipan Das 2022-08-11  90  =

a499b4b06c9f97 Sandipan Das 2022-08-11  91  	cpuc->lbr_stack.nr =3D out;
a499b4b06c9f97 Sandipan Das 2022-08-11  92  =

a499b4b06c9f97 Sandipan Das 2022-08-11  93  	/*
a499b4b06c9f97 Sandipan Das 2022-08-11  94  	 * Internal register renaming =
always ensures that LBR From[0] and
a499b4b06c9f97 Sandipan Das 2022-08-11  95  	 * LBR To[0] always represent =
the TOS
a499b4b06c9f97 Sandipan Das 2022-08-11  96  	 */
a499b4b06c9f97 Sandipan Das 2022-08-11  97  	cpuc->lbr_stack.hw_idx =3D 0;
a499b4b06c9f97 Sandipan Das 2022-08-11  98  }
a499b4b06c9f97 Sandipan Das 2022-08-11  99  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8345774719184430733==--

