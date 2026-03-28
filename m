Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41BA2D0C92
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774672565; cv=none; b=LvCzyyVGzt+jw4375joYtyq+AyHowqKMPLtvnfp5C/HtPbJ6kSkp2oSM6AJ99LPSkOFXsoQjLiiqE1U+t5pdBIHZkLnJYkcBxzlBFK0yAfOJ2ugq5jG5xqHl/CbHrnJFCzuJOgmtEKVtc4aU0NtwNe59ul+y+Rb7kpKotJsRJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774672565; c=relaxed/simple;
	bh=Q6gDXhwXS+aOi03Qo/ahhDGhbG03FULQHFqGLqaTNBQ=;
	h=Date:From:To:Subject:Message-ID; b=RPhNJac/SxJ9GzfexJv7f3hXz53b0v9rdCZj45GMBFoElmq6PYpFB+RMlh/Xvh+T6Bu08je5BYq88AVpZFVMIjmSp1LiZgC9ElACJluBNYEh6pgF3iiyvBwHNDJg+UCnkuUmqQJyK4OPW8020u+6uYgWu+jdMn4LVJEM5zMX6F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIlvyuLj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIlvyuLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774672564; x=1806208564;
  h=date:from:to:subject:message-id;
  bh=Q6gDXhwXS+aOi03Qo/ahhDGhbG03FULQHFqGLqaTNBQ=;
  b=SIlvyuLjOmCSFKNemx0kY0hbL4++jMP20gqn5q+ckJn/lnf4+YII0HLq
   TjOpDSuLaQbFsxr/0afebAPa8pPs4/3u8K2ym4uCAKFFRqcUhGDs7DTwr
   JvYOuQTnCy5XDqLphoRTFiFPsQiaZ0XlaMpMAY+3LwX1drsUDHVNJhHI4
   TxjjoOnWmhoXsVeLsFoq9vnRFIYZuq3RS7bv8YtDsWFDoKyUYxqfOAVxl
   0SojFt60XO7a80SmY/QbRgmqYay5tJK5+Bv7KYR+ii8mXmJn/QM+gagXs
   P1g2NMXSLcfJA7+UpaYxgvL31CPRqDk0Nh8airIxbXvKvENE+C50zyfV6
   g==;
X-CSE-ConnectionGUID: o7sHkZSgRmyiYtmXOWA7YQ==
X-CSE-MsgGUID: BMe7Qm/lRp2Qm722enukAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79605522"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79605522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:36:01 -0700
X-CSE-ConnectionGUID: +BUUxbL7SBGLCqy8yIUJLw==
X-CSE-MsgGUID: EHaH3UG1TSG32iIzZ7n/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="222624959"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 21:36:00 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LOw-000000007cg-0n5G
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:35:58 +0000
Date: Sat, 28 Mar 2026 05:35:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 12/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280512.8jVJQhMR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: ac1dfc786c590c82d4478d3c8320c9e2b1ba09d3 [12/33] arm: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280512.8jVJQhMR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#6: 
Move the optimized XOR into lib/raid and include it it in the main

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#273: FILE: lib/raid/xor/arm/xor-neon-glue.c:11:
+xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#274: FILE: lib/raid/xor/arm/xor-neon-glue.c:12:
+	   const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#282: FILE: lib/raid/xor/arm/xor-neon-glue.c:20:
+xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#283: FILE: lib/raid/xor/arm/xor-neon-glue.c:21:
+	   const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#284: FILE: lib/raid/xor/arm/xor-neon-glue.c:22:
+	   const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#292: FILE: lib/raid/xor/arm/xor-neon-glue.c:30:
+xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#293: FILE: lib/raid/xor/arm/xor-neon-glue.c:31:
+	   const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#294: FILE: lib/raid/xor/arm/xor-neon-glue.c:32:
+	   const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#295: FILE: lib/raid/xor/arm/xor-neon-glue.c:33:
+	   const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#303: FILE: lib/raid/xor/arm/xor-neon-glue.c:41:
+xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#304: FILE: lib/raid/xor/arm/xor-neon-glue.c:42:
+	   const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#305: FILE: lib/raid/xor/arm/xor-neon-glue.c:43:
+	   const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#306: FILE: lib/raid/xor/arm/xor-neon-glue.c:44:
+	   const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#307: FILE: lib/raid/xor/arm/xor-neon-glue.c:45:
+	   const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#407: FILE: lib/raid/xor/arm/xor.c:43:
+xor_arm4regs_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#408: FILE: lib/raid/xor/arm/xor.c:44:
+	       const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#428: FILE: lib/raid/xor/arm/xor.c:64:
+xor_arm4regs_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#429: FILE: lib/raid/xor/arm/xor.c:65:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#430: FILE: lib/raid/xor/arm/xor.c:66:
+	       const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#451: FILE: lib/raid/xor/arm/xor.c:87:
+xor_arm4regs_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#452: FILE: lib/raid/xor/arm/xor.c:88:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#453: FILE: lib/raid/xor/arm/xor.c:89:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#454: FILE: lib/raid/xor/arm/xor.c:90:
+	       const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#472: FILE: lib/raid/xor/arm/xor.c:108:
+xor_arm4regs_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#473: FILE: lib/raid/xor/arm/xor.c:109:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#474: FILE: lib/raid/xor/arm/xor.c:110:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#475: FILE: lib/raid/xor/arm/xor.c:111:
+	       const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#476: FILE: lib/raid/xor/arm/xor.c:112:
+	       const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
