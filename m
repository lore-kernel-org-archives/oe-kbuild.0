Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756742;
	b=y4ufbhd9p1ljFMwo44Hk8sutyIj2C/mdY/JA71/R4djMIhz44nGEI7itD2RuDqCBWFAz
	 4VKJlqXshGZm4zbJMdfvbNU4n88ByA3TRtcmoszYZieGSX7s2DDbBPFhhmyen7Fpa4QiE
	 13/tx3mKEIxv0Ce/+uNF7q5NwRaPfNPaG3t2yq8YC2v/73WM5SRnpAZoUwk1COB4cvj2C
	 LtLmKQSTJRRt8OCQ6AJ6PHNy1rzjsPAzv7sAAxMJuvgKV82CNOEoMy3IDnlcfvEgk565F
	 hUU+IlGENRMboA0y7me5j8RKNowyfdMKCiIxHwXjX50t1K5R6xMUCdsY63AlXPpXlaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756742;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=g3lq0hrcQa1d3BegZiikzraIajltjea2tRPIym7KXms=;
	b=5FzcpfkuUhC5g+tB7Dd6aQFOJqyCvYp3f4QMXEKYlipXi1lubc3M/Azh4pbdvWLqQMNL
	 33wZrA12CXluoigDJ39X6Z1JYtD+RXS87qLqm8S9XU3n/YpRqZYSIG+2KPDT30rd5oGNt
	 ZUEHBmZgRY/qqbTzppGeukuAOfELBNvalyU01ZKVXI5KD3vVPM38PYvSA2yNTKgwH+mZ1
	 aQnryWRRfmgwkLh2v3OmKzFPVn335gaykiN1YwT858LoQZoyigyxuhP3JzIfbIPJCicyP
	 Wh1ReJQyMGBAcklwH1bi4IWFSla76dW9NZhECTTRRBlhY7tDAc2DyS0+l02B6PZB4sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DVXk8BS0;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D9C606A31B
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Oct 2026 11:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DVXk8BS0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792756741; x=1824292741;
  h=date:from:to:cc:subject:message-id;
  bh=7mlkTbRqV5iv8z4tO4zJhj0CLvrZ5yZouVkZYen5b/w=;
  b=DVXk8BS0dVLt8jiqQDIXU+q8niBvkmBFBNKYixjjqeU1H+y+P5wjQ32H
   4XVsf9hOVxZ75N+tx/sDVubOoSI8qL1txHLWR2LzvbjSt1DHWsvw45EZO
   Xskx7Z/1mtuyV8aVV42LWPrZY+jK4bmHF/EWB4pnr6dV/sc57qg8gNgoz
   00mTp/CKuJWuyXxYc+DPH8IIH/e7M2zauIrlhLHyCNntrM4RocvlpgFjQ
   mfvo4PDBVgN9eFXrTlFFOqkMg/rh0rTEebljfOtbD0BU9Ta3MnssKgCum
   Q3TwJZvY68WtljjcnSD9xz4nN4Xfzan6akcCvOzD6PO+heBbv5JrnxIar
   A==;
X-CSE-ConnectionGUID: nxW2iM18QRWdgu7Lj0pKzA==
X-CSE-MsgGUID: TXjiAhuSSNaDe05BAO/jBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1548490"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1548490"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 04:59:01 -0700
X-CSE-ConnectionGUID: WV5Ii5E4T4K1usA0DUgHfQ==
X-CSE-MsgGUID: BmX6ujqHQ02bpDUZvSKBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3577609"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2026 04:59:00 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKDvF-000000000b5-1C5g;
	Fri, 23 Oct 2026 11:58:57 +0000
Date: Fri, 23 Oct 2026 13:58:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [arm-integrator:b4/genexis-xg6846b-watchdog-reset 8/15]
 drivers/mfd/bcmbca_pmc3_pmb.c:107:2-8: preceding lock on line 93
Message-ID: <202610231345.2xsjwJ7h-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-watchdog-reset
head:   e9dced83bc7b577d707e72a7aa9a1b08b657de79
commit: 6dcd6c7d059333618775b0bc9d736625a859944e [8/15] mfd: Add a shared BCMBCA PMC3 PMB transport
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-r2110-20261022 (https://download.01.org/0day-ci/archive/20261023/202610231345.2xsjwJ7h-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610231345.2xsjwJ7h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mfd/bcmbca_pmc3_pmb.c:107:2-8: preceding lock on line 93

vim +107 drivers/mfd/bcmbca_pmc3_pmb.c

6dcd6c7d059333 Linus Walleij 2026-10-13   87  
6dcd6c7d059333 Linus Walleij 2026-10-13   88  int bcmbca_pmb_lock(struct bcmbca_pmb *pmb)
6dcd6c7d059333 Linus Walleij 2026-10-13   89  {
6dcd6c7d059333 Linus Walleij 2026-10-13   90  	u32 value;
6dcd6c7d059333 Linus Walleij 2026-10-13   91  	int ret;
6dcd6c7d059333 Linus Walleij 2026-10-13   92  
6dcd6c7d059333 Linus Walleij 2026-10-13  @93  	mutex_lock(&pmb->lock);
6dcd6c7d059333 Linus Walleij 2026-10-13   94  	if (pmb->stopping) {
6dcd6c7d059333 Linus Walleij 2026-10-13   95  		ret = -ENODEV;
6dcd6c7d059333 Linus Walleij 2026-10-13   96  		goto unlock;
6dcd6c7d059333 Linus Walleij 2026-10-13   97  	}
6dcd6c7d059333 Linus Walleij 2026-10-13   98  	if (pmb->recovering) {
6dcd6c7d059333 Linus Walleij 2026-10-13   99  		ret = -EBUSY;
6dcd6c7d059333 Linus Walleij 2026-10-13  100  		goto unlock;
6dcd6c7d059333 Linus Walleij 2026-10-13  101  	}
6dcd6c7d059333 Linus Walleij 2026-10-13  102  
6dcd6c7d059333 Linus Walleij 2026-10-13  103  	/* Reading bit 0 acquires the hardware lock; writing 1 releases it. */
6dcd6c7d059333 Linus Walleij 2026-10-13  104  	ret = readl_poll_timeout(pmb->base + PMB_MUTEX, value,
6dcd6c7d059333 Linus Walleij 2026-10-13  105  				 value & PMB_LOCKED, 1, 1000);
6dcd6c7d059333 Linus Walleij 2026-10-13  106  	if (!ret)
6dcd6c7d059333 Linus Walleij 2026-10-13 @107  		return 0;
6dcd6c7d059333 Linus Walleij 2026-10-13  108  unlock:
6dcd6c7d059333 Linus Walleij 2026-10-13  109  	mutex_unlock(&pmb->lock);
6dcd6c7d059333 Linus Walleij 2026-10-13  110  	return ret;
6dcd6c7d059333 Linus Walleij 2026-10-13  111  }
6dcd6c7d059333 Linus Walleij 2026-10-13  112  EXPORT_SYMBOL_GPL(bcmbca_pmb_lock);
6dcd6c7d059333 Linus Walleij 2026-10-13  113  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
