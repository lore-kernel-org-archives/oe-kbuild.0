Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CDE23AA
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 05:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667799234; x=1699335234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z5gdcL2R6m6qStAmQJQXNd5g19zD2sl9Y5tduVjP1cI=;
  b=K+viOhLNCNTNFR1PmDIpFGuTi4yqF6DzZRJaEbc5alga/bLVTjN0pmNz
   8YPF9Y/K77ukM0OFtGEuVvKfgAP+/T+QhO38c/pQyD3vPyt0TcWBNVtbn
   EXKzmPAirdTY83PuP1xJLIBUcypLq3GfF/lQ1TiKth5ik1itLjoLrR48g
   ACUe1XMozmzYqJhFnsD73ns/VR+60w59pWjQpMKKQ4HKdkh8mzFlnhHMb
   X4k9mYsN9Ku5Ye6ESsozVKhunCJVdxfTK6bxApxYo0qw0TkC5jzYXUgs7
   Px/rQUbJvpi5pxh8Y5LpdGqg2Rwlmnh9OruhwrmNHEswYK/IEcuQ3GCv9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="311463827"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="311463827"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 21:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="778357465"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="778357465"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Nov 2022 21:33:28 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orulD-0000My-1d;
	Mon, 07 Nov 2022 05:33:27 +0000
Date: Mon, 7 Nov 2022 13:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant
 initialization for 'size'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202211071336.oM9N26rG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant initialization for 'size'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: 8ad7e8f696951f192c6629a0cbda9ac94c773159 x86/fpu/xsave: Support XSAVEC in the kernel
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8ad7e8f696951f192c6629a0cbda9ac94c773159
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   arch/x86/kernel/fpu/xstate.c:1236:7: warning: Local variable 'mask' shadows outer variable [shadowVariable]
     u64 mask = ((u64)1 << i);
         ^
   arch/x86/kernel/fpu/xstate.c:1205:6: note: Shadowed declaration
    u64 mask;
        ^
   arch/x86/kernel/fpu/xstate.c:1236:7: note: Shadow variable
     u64 mask = ((u64)1 << i);
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant initialization for 'size'. The initialized value is overwritten before it is read. [redundantInitialization]
    size = xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
         ^
   arch/x86/kernel/fpu/xstate.c:590:20: note: size is initialized
    unsigned int size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
                      ^
   arch/x86/kernel/fpu/xstate.c:605:7: note: size is overwritten
    size = xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
         ^
>> arch/x86/kernel/fpu/xstate.c:589:7: warning: Local variable 'xsaves' shadows outer function [shadowFunction]
    bool xsaves = cpu_feature_enabled(X86_FEATURE_XSAVES);
         ^
   arch/x86/kernel/fpu/xstate.c:1310:6: note: Shadowed declaration
   void xsaves(struct xregs_state *xstate, u64 mask)
        ^
   arch/x86/kernel/fpu/xstate.c:589:7: note: Shadow variable
    bool xsaves = cpu_feature_enabled(X86_FEATURE_XSAVES);
         ^
   arch/x86/kernel/fpu/xstate.c:1708:43: warning: Parameter 'tsk' can be declared as pointer to const [constParameter]
   long fpu_xstate_prctl(struct task_struct *tsk, int option, unsigned long arg2)
                                             ^

vim +/size +605 arch/x86/kernel/fpu/xstate.c

84e4dccc8fce20 Chang S. Bae    2021-10-21  576  
65ac2e9baa7dee Dave Hansen     2015-09-02  577  /*
65ac2e9baa7dee Dave Hansen     2015-09-02  578   * This essentially double-checks what the cpu told us about
65ac2e9baa7dee Dave Hansen     2015-09-02  579   * how large the XSAVE buffer needs to be.  We are recalculating
65ac2e9baa7dee Dave Hansen     2015-09-02  580   * it to be safe.
76d10256a97a7c Kan Liang       2020-07-20  581   *
01707b66535872 Andy Lutomirski 2021-06-23  582   * Independent XSAVE features allocate their own buffers and are not
76d10256a97a7c Kan Liang       2020-07-20  583   * covered by these checks. Only the size of the buffer for task->fpu
76d10256a97a7c Kan Liang       2020-07-20  584   * is checked here.
65ac2e9baa7dee Dave Hansen     2015-09-02  585   */
cd9ae761744912 Thomas Gleixner 2021-10-15  586  static bool __init paranoid_xstate_size_valid(unsigned int kernel_size)
65ac2e9baa7dee Dave Hansen     2015-09-02  587  {
8ad7e8f696951f Thomas Gleixner 2022-04-04  588  	bool compacted = cpu_feature_enabled(X86_FEATURE_XCOMPACTED);
8ad7e8f696951f Thomas Gleixner 2022-04-04 @589  	bool xsaves = cpu_feature_enabled(X86_FEATURE_XSAVES);
cd9ae761744912 Thomas Gleixner 2021-10-15  590  	unsigned int size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
65ac2e9baa7dee Dave Hansen     2015-09-02  591  	int i;
65ac2e9baa7dee Dave Hansen     2015-09-02  592  
1c253ff2287fe3 Thomas Gleixner 2021-10-15  593  	for_each_extended_xfeature(i, fpu_kernel_cfg.max_features) {
cd9ae761744912 Thomas Gleixner 2021-10-15  594  		if (!check_xstate_against_struct(i))
cd9ae761744912 Thomas Gleixner 2021-10-15  595  			return false;
65ac2e9baa7dee Dave Hansen     2015-09-02  596  		/*
65ac2e9baa7dee Dave Hansen     2015-09-02  597  		 * Supervisor state components can be managed only by
02b93c0b00df22 Thomas Gleixner 2021-06-23  598  		 * XSAVES.
65ac2e9baa7dee Dave Hansen     2015-09-02  599  		 */
8ad7e8f696951f Thomas Gleixner 2022-04-04  600  		if (!xsaves && xfeature_is_supervisor(i)) {
cd9ae761744912 Thomas Gleixner 2021-10-15  601  			XSTATE_WARN_ON(1);
cd9ae761744912 Thomas Gleixner 2021-10-15  602  			return false;
cd9ae761744912 Thomas Gleixner 2021-10-15  603  		}
65ac2e9baa7dee Dave Hansen     2015-09-02  604  	}
84e4dccc8fce20 Chang S. Bae    2021-10-21 @605  	size = xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
cd9ae761744912 Thomas Gleixner 2021-10-15  606  	XSTATE_WARN_ON(size != kernel_size);
cd9ae761744912 Thomas Gleixner 2021-10-15  607  	return size == kernel_size;
65ac2e9baa7dee Dave Hansen     2015-09-02  608  }
65ac2e9baa7dee Dave Hansen     2015-09-02  609  

:::::: The code at line 605 was first introduced by commit
:::::: 84e4dccc8fce20b497388d756e12de5c9006eb48 x86/fpu/xstate: Provide xstate_calculate_size()

:::::: TO: Chang S. Bae <chang.seok.bae@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
