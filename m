Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75E62F3C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675777337; x=1707313337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIt1Iiy8c+6jqqLlFV7/ToZiSyItN3mL14Fteb6A3Rc=;
  b=kgcz3dWQztZ5iIMFPbuhp4AKcHtjEqeNjKS8CgygGqsELAj2uIdO00fS
   C2RALBE9cHIJcVdlerkY6zslG1kPkl2G7EbovEmb8u351mPkYGQemC2nO
   I3OxUTJ4uhepZvAk+M8yuH9H9isJ8qLMJlTc13X0gmV7N7PVGYvRC78Ky
   BE18Qz9BXLNKQLCyKBHQ0s5iJgjnRsBjH+liBCYIZwktbdaDs0C/ouc5z
   5NrdkLlgsuC2TuEw7KHlQ0rMAjaelRYXnTPWa30qubU49nmAfX/AD5m3g
   WzIgymtPKlLeFbDziYV5+DABLUauq3hai5wquU9yRlUxYjQ1cIwKCBgrS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313152597"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="313152597"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 05:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="735551436"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="735551436"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 05:42:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPOEU-0003Zy-2j;
	Tue, 07 Feb 2023 13:42:02 +0000
Date: Tue, 7 Feb 2023 21:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 39/54] arch/arm/mach-omap2/pm24xx.c:129:6: warning:
 Unused variable: error [unusedVariable]
Message-ID: <202302072141.izLLW2rz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm/mach-omap2/pm24xx.c:129:6: warning: Unused variable: error [unusedVariable]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   4d627628d7584f3d3add1d53342d0f01aa878e04
commit: 259c95afac6f2758760f158537e1d28358b4639c [39/54] arm, OMAP2: Use WFI for omap2_pm_idle()
:::::: branch date: 7 days ago
:::::: commit date: 4 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 259c95afac6f2758760f158537e1d28358b4639c
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   arch/arm/mach-omap2/pm24xx.c:186:42: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
       (0x1 << OMAP24XX_SETRET_LEVEL_SHIFT) |
                                            ^
>> arch/arm/mach-omap2/pm24xx.c:129:6: warning: Unused variable: error [unusedVariable]
    int error;
        ^

vim +129 arch/arm/mach-omap2/pm24xx.c

8bd229492209c0 Kevin Hilman      2009-05-28  126  
8bd229492209c0 Kevin Hilman      2009-05-28  127  static void omap2_pm_idle(void)
8bd229492209c0 Kevin Hilman      2009-05-28  128  {
f4cfa36dab6734 Tony Lindgren     2019-12-16 @129  	int error;
f4cfa36dab6734 Tony Lindgren     2019-12-16  130  
94434535bd36ca Jouni Hogander    2009-02-03  131  	if (omap_irq_pending())
6b85638b83caac Santosh Shilimkar 2013-02-11  132  		return;
f4cfa36dab6734 Tony Lindgren     2019-12-16  133  
259c95afac6f27 Peter Zijlstra    2023-01-12  134  	omap2_do_wfi();
8bd229492209c0 Kevin Hilman      2009-05-28  135  }
8bd229492209c0 Kevin Hilman      2009-05-28  136  

:::::: The code at line 129 was first introduced by commit
:::::: f4cfa36dab6734466cd5639e0a1d7d753297cba4 dmaengine: ti: omap-dma: Use cpu notifier to block idle for omap2

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
