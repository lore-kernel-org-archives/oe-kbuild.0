Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9461A731
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7Vdz7D9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701254706; x=1732790706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xm5EieKrXg96f/ltiuzHyL+K1N9Lc7SQgZaAySNb2O4=;
  b=Q7Vdz7D9fr3SbpdcCpuDQnq6zu8siSkeveekPb4LlXGB8icxKjWZErUf
   V6fQYX4H0NAYP4fVXBtjX0s5ZGhnbgyB98LKAvxV20zGAkYd5yqJJlLII
   OJl9V6qwR6jl3NNHQsakH1KFpaqvjNGlQB1NUmhh/8g0N1YJDeMmTItYp
   3OXIVJEo9bmQOkrj2pXpGqPPMNcgFdvZGBz/8ek8bCt/SHeNQGEUOGIqx
   kg3QWVK82TeeKEYq+HAbuthVA24t+U++IcW4MV0IZl4Wgaq9q6K5xnIWO
   JTv2WpYVQnSDNT8sWgQSNokAYIc1K6UmvIzKFd/7mhBw6gT5j0m/GmjYK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="29533"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="29533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834969713"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="834969713"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2023 02:45:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8I3x-00006J-0D;
	Wed, 29 Nov 2023 10:45:01 +0000
Date: Wed, 29 Nov 2023 18:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal
 constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202311291730.qW3JkfG4-lkp@intel.com>
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
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: f53153a37969c185d51e388ad51a23807e2605a1 clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: microblaze-randconfig-r034-20230909 (https://download.01.org/0day-ci/archive/20231129/202311291730.qW3JkfG4-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291730.qW3JkfG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311291730.qW3JkfG4-lkp@intel.com/

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
