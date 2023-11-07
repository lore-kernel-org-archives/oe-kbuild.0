Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEF328CB
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buxIFSMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699374629; x=1730910629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pVzGD1a3l/es78C3FXorOxKtFbm5WSUc9+bIwITQVAA=;
  b=buxIFSMi2qMjURLVCf7kh8JdkZn7P9XV4Y02MKok/a7jGfOBImuHJokg
   JRtPBKOby7p1aLNjVJ+yTA9w0L2hVpQ9l7ScnWfp6UbHcVOShLobIMqUw
   4EN6Xdst5sX2WrmD2gcG2pGXMJVWP9KxqK4ufNtgPAPDF7jQmHtUsgzja
   WCdwCVY14F1fnywHC4tffIDroYb7GmW310JI9A1XBuuJOxnC1Y3YllXVw
   Cw80FRiUpZkT0X7ZOoUUGHQIFTZsZfaJb0uZrY0G4MM0jFqdan4CUP7dA
   YdV9Ch2oC3CiEyBU3s0MRxfpQY3c+T+LyuV20MoNbix3gQ8LiISUD+MZG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420657315"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="420657315"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 08:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="879870048"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="879870048"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2023 08:30:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0OyA-0007Dv-1X;
	Tue, 07 Nov 2023 16:30:26 +0000
Date: Wed, 8 Nov 2023 00:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/qcom/camcc-sm8550.c:49:22: sparse: sparse: decimal
 constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202311072344.wgEIC78G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/camcc-sm8550.c:49:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: ccc4e6a061a21d75b96d82fc4b084a8d96df6eb4 clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
date:   7 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231107/202311072344.wgEIC78G-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311072344.wgEIC78G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311072344.wgEIC78G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/camcc-sm8550.c:49:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +49 drivers/clk/qcom/camcc-sm8550.c

ccc4e6a061a21d Jagadeesh Kona 2023-07-07  47  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  48  static const struct pll_vco lucid_ole_vco[] = {
ccc4e6a061a21d Jagadeesh Kona 2023-07-07 @49  	{ 249600000, 2300000000, 0 },
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  50  };
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
