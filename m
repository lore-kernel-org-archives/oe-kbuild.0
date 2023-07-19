Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A31BB5D
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 23:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689810933; x=1721346933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CF+EY+5ZcUX+Utg5hK64Bmvuc3Lmc+XxnDvEQGamhj8=;
  b=kLF1sIpUVb/+ftjzfpiVtJGmwj7WeDACeWRh+Eav7zO9dGxP+GMHx5z1
   jOKGZfMMpCoEnUAfsM9KKGvaV+ds2MZMo6CdquBFGeQA4DX/wXfSxiuN6
   U3HLXsFw4enVkwyOshwQAurJztkwaKc383+AwR6r1ANPCyCkHgeUa6cKK
   WPkA8d//3gB0nmfBNAyAm0j7hP1HcPGHqz9yZYfetBcHMVrLhX6dED0bP
   /99CkT0zo65M4i7DVDn091TM1Dh9vx6jd/m/tyM6qkMgT4hVZpFkMpXwo
   LTq+S9usRwMWJKBFxoTkUN4ersjyS9EuCS3bgTBxYL7dJLaC7Z2xreUXs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356561130"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356561130"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 16:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837865259"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="837865259"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 16:55:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMH11-0005bd-0d;
	Wed, 19 Jul 2023 23:55:31 +0000
Date: Thu, 20 Jul 2023 07:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal
 constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202307200749.MsMOYIH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfa3037d828050896ae52f6467b6ca2489ae6fb1
commit: f53153a37969c185d51e388ad51a23807e2605a1 clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-r081-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200749.MsMOYIH5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200749.MsMOYIH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307200749.MsMOYIH5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +34 drivers/clk/qcom/videocc-sm8550.c

f53153a37969c1 Jagadeesh Kona 2023-05-24  32  
f53153a37969c1 Jagadeesh Kona 2023-05-24  33  static const struct pll_vco lucid_ole_vco[] = {
f53153a37969c1 Jagadeesh Kona 2023-05-24 @34  	{ 249600000, 2300000000, 0 },
f53153a37969c1 Jagadeesh Kona 2023-05-24  35  };
f53153a37969c1 Jagadeesh Kona 2023-05-24  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
