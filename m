Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBEA621
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 00:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689814689; x=1721350689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTce/MEAFxpRA42by/GZ6UP9wZQGhx1T9+2mytmC31I=;
  b=T0+Y1Rgk8AOKWReCCg3mrN5vq6yWePEa/nnm+YLaMzKzvkO+W+DsrTV+
   WCBicvb6x9zbjA0dbjUn1jTpEBl6IEg3ZGjOCj5f13Cye0JWKTDaZ9UsC
   qf8LCt/Fg6zqKg6kMdLbkMLCcSrV9GGgIT6fTda8OPdYmjVeQglpQ4Io5
   3NB/e8vnPg5xP5y1nDWKTv5btshkyix1j1Ath1+IpJalcCc+ZSOMWIRbW
   seNnblWWdOubbpyUkAcYM6L8K6FNLIh4gb0hkIE/E96m532OO0+Kw4rGG
   LycYFya4a4JdngLWsXSZGHBDkbk3J+30V2glP9FfQtXyanbkMhWh9ZdO8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364062586"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="364062586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674511017"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="674511017"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 17:58:07 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMHza-0005dV-1w;
	Thu, 20 Jul 2023 00:58:06 +0000
Date: Thu, 20 Jul 2023 08:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal
 constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202307200855.kxnrzqhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfa3037d828050896ae52f6467b6ca2489ae6fb1
commit: bfae40744b337928b1e65bf40efd91e715a5d808 clk: qcom: gpucc-sm8550: Add support for graphics clock controller
date:   8 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-r081-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200855.kxnrzqhX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200855.kxnrzqhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307200855.kxnrzqhX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +37 drivers/clk/qcom/gpucc-sm8550.c

bfae40744b3379 Jagadeesh Kona 2023-05-24  35  
bfae40744b3379 Jagadeesh Kona 2023-05-24  36  static const struct pll_vco lucid_ole_vco[] = {
bfae40744b3379 Jagadeesh Kona 2023-05-24 @37  	{ 249600000, 2300000000, 0 },
bfae40744b3379 Jagadeesh Kona 2023-05-24  38  };
bfae40744b3379 Jagadeesh Kona 2023-05-24  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
