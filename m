Content-Type: multipart/mixed; boundary="===============2137180284060960857=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kernel/topology.c:317:13: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
Date: Tue, 30 Aug 2022 18:23:38 +0800
Message-ID: <202208301830.oD0plTUT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2137180284060960857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/arm6=
4/kernel/topology.c:317:13: warning: Same value in both branches of ternary=
 operator. [duplicateValueTernary]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ionela Voinescu <ionela.voinescu@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: e89d120c4b720e232cc6a94f0fcbd59c15d41489 arm64: errata: add detecti=
on for AMEVCNTR01 incrementing incorrectly
date:   7 days ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 days ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e89d120c4b720e232cc6a94f0fcbd59c15d41489
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/topology.c:317:13: warning: Same value in both branche=
s of ternary operator. [duplicateValueTernary]
           0UL : read_constcnt();
               ^

vim +317 arch/arm64/kernel/topology.c

68c5debcc06d6d2 Ionela Voinescu 2020-11-06  307  =

68c5debcc06d6d2 Ionela Voinescu 2020-11-06  308  static void cpu_read_const=
cnt(void *val)
68c5debcc06d6d2 Ionela Voinescu 2020-11-06  309  {
e89d120c4b720e2 Ionela Voinescu 2022-08-19  310  	/*
e89d120c4b720e2 Ionela Voinescu 2022-08-19  311  	 * Return 0 if the curren=
t CPU is affected by erratum 2457168. A value
e89d120c4b720e2 Ionela Voinescu 2022-08-19  312  	 * of 0 is also returned =
if the current CPU does not support AMUs or if
e89d120c4b720e2 Ionela Voinescu 2022-08-19  313  	 * the counter is disable=
d. A return value of 0 at counter read is
e89d120c4b720e2 Ionela Voinescu 2022-08-19  314  	 * properly handled as an=
 error case by the users of the counter.
e89d120c4b720e2 Ionela Voinescu 2022-08-19  315  	 */
e89d120c4b720e2 Ionela Voinescu 2022-08-19  316  	*(u64 *)val =3D this_cpu_=
has_cap(ARM64_WORKAROUND_2457168) ?
e89d120c4b720e2 Ionela Voinescu 2022-08-19 @317  		      0UL : read_constcn=
t();
68c5debcc06d6d2 Ionela Voinescu 2020-11-06  318  }
68c5debcc06d6d2 Ionela Voinescu 2020-11-06  319  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2137180284060960857==--

