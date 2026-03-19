Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9BB344DAB
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 04:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894518; cv=none; b=Ehk4TPix8A/Eyr4USuC/6SX1PqO6+8GPPJMsbgpmAWoKsAUZvF42Rh1Pul3uVtz8KHT8Pt9kEMd5a/HA3uULTrFKFnFLyC6d3ye+kMhdTftGozr9oFa9oLfGRaGTAQ/pjzPm66rBzSsElbAE+Ei6nK4kpRrJ1PM/uTDGpm1GyOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894518; c=relaxed/simple;
	bh=SnY9OxM6243FUSWK/itRBBUm00OWtuHVJjidE8YW/ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r+vuXmU8U1WC4ZnccwBrfFFH3k4rwpa5MRmiDlFT9GwAz8WTmE76uWZY6Csjb/NvEcSz3yVRMrWYDrmysoovm1oOqzrgYzX7HNjPS3kURaDpCBNEXDYILxn+zpssSTFey8l3LHnGYMHLnKfTaffGpkURXEd4BWEy61BYjNM8TvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8qR48zh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8qR48zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773894517; x=1805430517;
  h=date:from:to:cc:subject:message-id;
  bh=SnY9OxM6243FUSWK/itRBBUm00OWtuHVJjidE8YW/ww=;
  b=E8qR48zh0TC5iRJPmVdsJrJLlmuZcd5AXiosQ1+ZYYm1Vy+h87JsvYf4
   398Zsw9wvmPXjNIJEYmKCNbE90/6180Y4P6nMBLdhRDYG60iMHlQcENLY
   Lfl/2smQE/JNaXstOGnmVaeu5QtVlZnS4z+MdVFKwzlEXl8HjtnuwIkzX
   fwcMoB6ruhp816j/H/+98uWgvdJk9syesa+mv3iTN84C5BbCYHTYeOw3q
   Et9cNv0O2ix+ouFO38KwSJm0kj1rKU2HYdtTpaSA7NTmn8/IYzaC7Hq48
   kDpjEXrm/zYErhRR/CNV0BxEBuvT07/QRfNaR7kwfNFSmJlxbATY4CqzM
   Q==;
X-CSE-ConnectionGUID: O4ZhNxQ5SLWQElCb9H8X9Q==
X-CSE-MsgGUID: SawfSYDZSUmbunhQLKijlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74847536"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74847536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 21:28:35 -0700
X-CSE-ConnectionGUID: QwYC/jemSqeLbW6ovIFp2Q==
X-CSE-MsgGUID: CWD5+8TWS0adaBDytKNnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="245871828"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2026 21:28:33 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w34zm-000000000JD-0e6r;
	Thu, 19 Mar 2026 04:28:30 +0000
Date: Thu, 19 Mar 2026 12:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/cadence/macb_main.c:4844:6-8: WARNING:
 possible condition with no effect (if == else)
Message-ID: <202603191243.lK6kKcvx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Brian Masney <bmasney@redhat.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
commit: 40e819747b45fd254ab99cfe39ba8787d6bbd33d net: cadence: macb: convert from round_rate() to determine_rate()
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-r061-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191243.lK6kKcvx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603191243.lK6kKcvx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/cadence/macb_main.c:4844:6-8: WARNING: possible condition with no effect (if == else)

vim +4844 drivers/net/ethernet/cadence/macb_main.c

c218ad559020ff Yash Shah    2019-06-18  4824  
40e819747b45fd Brian Masney 2025-08-10  4825  static int fu540_macb_tx_determine_rate(struct clk_hw *hw,
40e819747b45fd Brian Masney 2025-08-10  4826  					struct clk_rate_request *req)
40e819747b45fd Brian Masney 2025-08-10  4827  {
40e819747b45fd Brian Masney 2025-08-10  4828  	if (WARN_ON(req->rate < 2500000))
40e819747b45fd Brian Masney 2025-08-10  4829  		req->rate = 2500000;
40e819747b45fd Brian Masney 2025-08-10  4830  	else if (req->rate == 2500000)
40e819747b45fd Brian Masney 2025-08-10  4831  		req->rate = 2500000;
40e819747b45fd Brian Masney 2025-08-10  4832  	else if (WARN_ON(req->rate < 13750000))
40e819747b45fd Brian Masney 2025-08-10  4833  		req->rate = 2500000;
40e819747b45fd Brian Masney 2025-08-10  4834  	else if (WARN_ON(req->rate < 25000000))
40e819747b45fd Brian Masney 2025-08-10  4835  		req->rate = 25000000;
40e819747b45fd Brian Masney 2025-08-10  4836  	else if (req->rate == 25000000)
40e819747b45fd Brian Masney 2025-08-10  4837  		req->rate = 25000000;
40e819747b45fd Brian Masney 2025-08-10  4838  	else if (WARN_ON(req->rate < 75000000))
40e819747b45fd Brian Masney 2025-08-10  4839  		req->rate = 25000000;
40e819747b45fd Brian Masney 2025-08-10  4840  	else if (WARN_ON(req->rate < 125000000))
40e819747b45fd Brian Masney 2025-08-10  4841  		req->rate = 125000000;
40e819747b45fd Brian Masney 2025-08-10  4842  	else if (req->rate == 125000000)
40e819747b45fd Brian Masney 2025-08-10  4843  		req->rate = 125000000;
40e819747b45fd Brian Masney 2025-08-10 @4844  	else if (WARN_ON(req->rate > 125000000))
40e819747b45fd Brian Masney 2025-08-10  4845  		req->rate = 125000000;
40e819747b45fd Brian Masney 2025-08-10  4846  	else
40e819747b45fd Brian Masney 2025-08-10  4847  		req->rate = 125000000;
40e819747b45fd Brian Masney 2025-08-10  4848  
40e819747b45fd Brian Masney 2025-08-10  4849  	return 0;
c218ad559020ff Yash Shah    2019-06-18  4850  }
c218ad559020ff Yash Shah    2019-06-18  4851  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
