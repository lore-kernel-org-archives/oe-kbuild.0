Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C366191
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jan 2023 02:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672541493; x=1704077493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cJRlklakXde3c7gYqxZt475yT0EcRoM0VpnolypP4U=;
  b=VaP57qa6J9ZtNed4i9ksc9eWdr/6hS/a8nDHFpYVVDpbnenBX7jydNAI
   ptUDchvKcqddLVC3pquyOSRi4n/4Q5zEElTPCpbDo3l28kUhTqSq7ZttV
   2brfCFrEbxl+bxrFCYn8ggH/+Rd4XJnikJqsI0TeXep/tK/DtETx0SY2N
   f5hvrnpiruMdZ29g/hx8mV9ga2XlEqOBxCPBqmV3F7LHbHThLKYb1O8aV
   wMppB1GSuHtM3dGzQpVWjn+3yuGEymeRQDg5cPKpxJZYJVE1vsDY6x9GX
   Rm65S9Uhb0Q7NxCNIcjxoACnOMzZ94ZcRBTkF4DwY3Pp0m1rKQE0xby+5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="301724529"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="301724529"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2022 18:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="982978029"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="982978029"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Dec 2022 18:51:31 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBoRf-000OVJ-0J;
	Sun, 01 Jan 2023 02:51:31 +0000
Date: Sun, 1 Jan 2023 10:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/kernel/fpsimd.c:1741:52: warning: Parameter 'state' can
 be declared as pointer to const [constParameter]
Message-ID: <202301011011.bEUeKPr7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/kernel/fpsimd.c:1741:52: warning: Parameter 'state' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Brown <broonie@kernel.org>
CC: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e4cf7c25bae5c3b5089a3c23a897f450149caef2
commit: 1192b93ba3528feaf37dc4b5d8d6bdbb475791ad arm64/fp: Use a struct to pass data to fpsimd_bind_state_to_cpu()
date:   5 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 weeks ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1192b93ba3528feaf37dc4b5d8d6bdbb475791ad
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/fpsimd.c:1741:52: warning: Parameter 'state' can be declared as pointer to const [constParameter]
   void fpsimd_bind_state_to_cpu(struct cpu_fp_state *state)
                                                      ^
--
>> arch/arm64/kernel/ptrace.c:1906:11: warning: Parameter 'kdata' can be declared as pointer to const [constParameter]
        u32 *kdata)
             ^

vim +/state +1741 arch/arm64/kernel/fpsimd.c

8884b7bd7e52de Dave Martin      2017-12-06  1740  
1192b93ba3528f Mark Brown       2022-11-15 @1741  void fpsimd_bind_state_to_cpu(struct cpu_fp_state *state)
e6b673b741ea0d Dave Martin      2018-04-06  1742  {
1192b93ba3528f Mark Brown       2022-11-15  1743  	struct cpu_fp_state *last = this_cpu_ptr(&fpsimd_last_state);
e6b673b741ea0d Dave Martin      2018-04-06  1744  
52f73c383b2418 Suzuki K Poulose 2020-01-13  1745  	WARN_ON(!system_supports_fpsimd());
e6b673b741ea0d Dave Martin      2018-04-06  1746  	WARN_ON(!in_softirq() && !irqs_disabled());
e6b673b741ea0d Dave Martin      2018-04-06  1747  
1192b93ba3528f Mark Brown       2022-11-15  1748  	*last = *state;
8884b7bd7e52de Dave Martin      2017-12-06  1749  }
8884b7bd7e52de Dave Martin      2017-12-06  1750  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
