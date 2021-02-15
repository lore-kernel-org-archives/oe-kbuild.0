Content-Type: multipart/mixed; boundary="===============5999041486125789741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-linux-stable:queue-5.10 48/49] arch/arm64/kernel/cpufeature.c:1706:0: warning: Invalid number of character '{' when these macros are defined: 'CONFIG_ARM64_MTE'.
Date: Mon, 15 Feb 2021 10:39:03 +0800
Message-ID: <202102151001.0ev0zoRs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5999041486125789741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alexander Levin <alexander.levin@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-5.10
head:   900aea7691ecf9b39e819be55f95a940c75cc3ac
commit: 36c5708fe6f882433a4915efa46f05ad58b52eb3 [48/49] arm64: mte: Allow =
PTRACE_PEEKMTETAGS access to the zero page
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/cpufeature.c:1706:0: warning: Invalid number of charac=
ter '{' when these macros are defined: 'CONFIG_ARM64_MTE'. [syntaxError]
   =

   ^

vim +1706 arch/arm64/kernel/cpufeature.c

8ef8f360cf30be Dave Martin     2020-03-16  1695  =

34bfeea4a9e9cd Catalin Marinas 2020-05-04  1696  #ifdef CONFIG_ARM64_MTE
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1697  static void cpu_enable_mte=
(struct arm64_cpu_capabilities const *cap)
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1698  {
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1699  	/*
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1700  	 * Clear the tags in the =
zero page. This needs to be done via the
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1701  	 * linear map which has t=
he Tagged attribute.
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1702  	 */
36c5708fe6f882 Catalin Marinas 2021-02-10  1703  	if (!test_and_set_bit(PG_=
mte_tagged, &ZERO_PAGE(0)->flags))
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1704  		mte_clear_page_tags(lm_a=
lias(empty_zero_page));
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1705  	}
34bfeea4a9e9cd Catalin Marinas 2020-05-04 @1706  }
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1707  #endif /* CONFIG_ARM64_MTE=
 */
34bfeea4a9e9cd Catalin Marinas 2020-05-04  1708  =


:::::: The code at line 1706 was first introduced by commit
:::::: 34bfeea4a9e9cdae713637541f240c3adfdfede3 arm64: mte: Clear the tags =
when a page is mapped in user-space with PROT_MTE

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5999041486125789741==--

