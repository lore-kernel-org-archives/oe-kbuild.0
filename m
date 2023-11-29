Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719641D546
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0t31iDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701259314; x=1732795314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZKGepjH+dg2h8gXuIpg3rMiEVMpZzYapwxwFwgsZb0U=;
  b=b0t31iDWQbi3A7ahO+vZIMx10X5Rk5QoMZ8GH4bINdgaTjkLEPMfeZ1+
   dsjdvVBOJPmhtg3EnDWKht6gpvMpRiaJOE9EQrpmDC1BXR70BoKXRL6Cv
   hdr/C2a30Lal0iYZfHNSAOBoWhMWknitoIQTDoXGNlkP3bO8FK89uF2Vo
   9aADxC2dJ7a2rsB0EZFmK465yu0xc9EF7GCV+/6AXA4ishQ9w3SQjhnNF
   BOZRtEQ2Wrwfp+ASikAZ9PcItcphRp4+bPc300ukmTS2C2CCE7WodIEv0
   wkhu164T5liQghrsoBEQMgFDI7FadS6qh1XchOJXbJuqZRGw5T8S8gwK5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372515836"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="372515836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762295546"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762295546"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2023 04:01:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8JGH-0000CB-2U;
	Wed, 29 Nov 2023 12:01:49 +0000
Date: Wed, 29 Nov 2023 20:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal
 constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202311291907.fFPdWd8O-lkp@intel.com>
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
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: bfae40744b337928b1e65bf40efd91e715a5d808 clk: qcom: gpucc-sm8550: Add support for graphics clock controller
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: microblaze-randconfig-r034-20230909 (https://download.01.org/0day-ci/archive/20231129/202311291907.fFPdWd8O-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291907.fFPdWd8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311291907.fFPdWd8O-lkp@intel.com/

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
