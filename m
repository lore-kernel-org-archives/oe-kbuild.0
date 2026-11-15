Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755886;
	b=MhWwbPrPOChHzH0llSKDEP08UyPbc5kYMCgNb9myZYkC9IKdqmGeqMhvu55jiKYwolIp
	 1qFsqyGvp7v5dolBiQMlCLJDNgkEqU0oqdZxDeeAdN7/4PDKqGroMhX/0e6HuqKA1O3PM
	 GzgQLEzrtWq4BKI7Pz1W2mBpZm/gpq3YMl/UA3NBmidvnlkQc1ggTb5zmG6GXJKJjEp2g
	 afOfM5fxt/dI9eiCV+7m0/62g+1+g0a8Ui1/f8b7PBxrxyTxM7HdY3ywnCgIxEZT3qLDe
	 Epk6DMc2dQ7Nr20NPqNzw5OuktFwgVDbQijtzWWfiC+wkQ2lZFOkY9qGAtiuboBb5DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YLbPzAZbCnTXVPG0e6HM8+th5bEYfLpcpKUYPvhwZC8=;
	b=RbYSyGjC0whoXz9wLvTFDE+hVE2oak2I5rMX7/N2oW/krNu6u0D1WWPAB8IDrLEBnHOE
	 ecNoJvdkYeeAI61jlGtIzRx4O9Cm+iWKr/haeXtik0bwWAJpl2V1tSiZVVwuZguaw4uFr
	 VruS1TuwmbbtsCAU1FdaRVPL08t0zW1X5YNF26whSkfiLvGxbybvkHq2E1WinnVa4pYMl
	 MV+sKDPQpnpaGRduzxVHc9Oz5ecVk8jcbHojta2uI66CvYUGf5tNgIECHdqiD8UBUCPAB
	 SMy5U7Ky9CUahNk8EhYO7bsdVb/N+0G01Teez5T9IUkRIl3iKrlEBIpQ/hhuO01cZzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lpi0aLuy;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C266606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 15:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C266606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lpi0aLuy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794755886; x=1826291886;
  h=date:from:to:cc:subject:message-id;
  bh=LEHlaFYU+yy/vQgiSII8fGYzmIKztjyao4983qOhask=;
  b=Lpi0aLuytaRuYXSkgG7BLwQd+8uPD419Dujv7Z6c1G7pRVmF9zBAjkNk
   RgSlv/x5ci8R2o5MIurBMHgE5zuT4EhfVh6nRQvoUcrYJLYLAbs/5yGYQ
   E4T/NTFyxbbdCIshYccnaR1tLHe8bCx48MHBlIvQs+37cWPbf2BI1KO+E
   Lml2h+bX+SnpDKmUZYspDjeAabl6BukPQnB3G4pCOo7FzHU+WraH3xr5d
   fLOQijavp8kaGqnSQ+GhQHptLmMkyM+7lUu7CNl0AS/jJ2BQXHhO6VPXf
   QWtkq4MLyXPoDQYFtfRvFctx+2fY7UUdbwVQ6r+lqA+t3GiwKN9Mg+84S
   Q==;
X-CSE-ConnectionGUID: l/vLhpq0Q6mv5tw5xLb+aQ==
X-CSE-MsgGUID: gU9OHMxkQKqhePnLBLVQBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3534407"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3534407"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 07:18:04 -0800
X-CSE-ConnectionGUID: MzcAglQcTBa9OQq2uCEXNQ==
X-CSE-MsgGUID: QyTIY8MATLWdsLZNYC3svA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="11124174"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 15 Nov 2026 07:18:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSbzT-000000002GY-37Zh;
	Sun, 15 Nov 2026 15:17:59 +0000
Date: Sun, 15 Nov 2026 16:17:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_all_2 52/68]
 ctlv_tlv.h:234:42: warning: 'len' is used uninitialized
Message-ID: <202611151650.OfeOGRz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: a81126ff58172d1ce767b1e83109c9d408538b57 [52/68] selftests/ctlv: Add message-format tests
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261115/202611151650.OfeOGRz8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151650.OfeOGRz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151650.OfeOGRz8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ctlv.c:28:
   ctlv_tlv.h: In function 'ctlv_rd_u64':
>> ctlv_tlv.h:234:42: warning: 'len' is used uninitialized [-Wuninitialized]
     234 |                len < sizeof(value) ? len : sizeof(value));
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   ctlv_tlv.h:231:15: note: 'len' declared here
     231 |         __u32 len;
         |               ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
