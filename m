Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA8320A2C
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 20:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644485; cv=none; b=WQ7486+gbe24Sg1hvRWWzIQfsuf/WdVHQADiVBcX6+WJ8QReQop3pOnDUEpAYFv8fybKWnY4pQKekUdxlg+YoCItZ5BONBbs2A4yS4i97734g8yXydQDetGk74tbdwUN7pM2HrvqRmTeZjAoAlWSX28f4L0EbLTMoItxtvAeF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644485; c=relaxed/simple;
	bh=HLLowoDJ8dfYyFcchWnyIqNzRsnhcsp4dDmirf8LYj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TtfcNraXNYkRE9057T9AAeCdTAehaX1IqyGtKmP32flxlQMF8gtNdQBfK+aH8V5mM2hYPmUzbMFpg6a1uGeJqnHCX6QH8DNuXCP90ne7nDdE9zoUun/KeWAPGg9aNgYmSnVBee5Sq73/Zhmk10WQ5X1e5dG0ZCKwBJ+eQhBJYvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MH8BQRLO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MH8BQRLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767644483; x=1799180483;
  h=date:from:to:cc:subject:message-id;
  bh=HLLowoDJ8dfYyFcchWnyIqNzRsnhcsp4dDmirf8LYj0=;
  b=MH8BQRLOApczYQ/gapyiU5l+2wgCO+wIjmLdDP1VjF9zqLPlHXmEyx0/
   QpNIQZfkQFp3H12Co50TS+mhwer7anuGLRln8j9NWK02/XjdHIfC8QQ3d
   H0E55JSM7EY307t62ZKWbWT9HOt0PqR5rSA/n1pYpazAKqY/e1MFYT02o
   rbeyn11GYnEx5emqWdvgMPc1p+p+C1aznIbnzwA8gniMdI8O2RnkjVsSb
   rTDiuFoNbWs0nAkm9q0XSmclco8/sOiuSpaEdAqExoXkTtoOIcT1HG0UO
   9JmBFsQAvTuB5OQhhlRt0DAe8l8Fp26cx7ZPlmwrL2ztvCGHiOi0GhcTf
   Q==;
X-CSE-ConnectionGUID: xpe5uZzYSaqWM/q/4EA3vw==
X-CSE-MsgGUID: CFwGa1OtST2RRx827mTUfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="94486621"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="94486621"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 12:21:22 -0800
X-CSE-ConnectionGUID: ImxC5PNTSWa1E4y/m60/lw==
X-CSE-MsgGUID: swhfbek/RmabBictAI/PsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="233607551"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 12:21:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcr4p-000000001Tv-3Wxf;
	Mon, 05 Jan 2026 20:21:19 +0000
Date: Tue, 06 Jan 2026 04:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/cadence/macb_main.c:4844:6-8: WARNING:
 possible condition with no effect (if == else)
Message-ID: <202601060418.cSGAsfqo-lkp@intel.com>
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
head:   3609fa95fb0f2c1b099e69e56634edb8fc03f87c
commit: 40e819747b45fd254ab99cfe39ba8787d6bbd33d net: cadence: macb: convert from round_rate() to determine_rate()
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: sparc-randconfig-r061-20260106 (https://download.01.org/0day-ci/archive/20260106/202601060418.cSGAsfqo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601060418.cSGAsfqo-lkp@intel.com/

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
