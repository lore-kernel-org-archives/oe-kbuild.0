Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C734CFDC
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576638; cv=none; b=jRh4UGSoY4uROQp9JVpaFkLKr3IoMwJleuP7qP6UvQUS0rz3Uhrlekd4v61r6MtI37A4qIfqns1WCY+CdBtg1KbSvJJpxJ2XttKRtvZZbOqDmgszMm1RmS+cXjwAXJ1hBZaMouLs4XmjUKt/kiKnYpvZc/JqvteIwQPiGqAnKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576638; c=relaxed/simple;
	bh=ZxZ1fPSbwl+LWrUZCHWkWP6w3Pg5lz5cJXdCISn5Qzg=;
	h=Date:From:To:Subject:Message-ID; b=jEfNzPZIWpwqzzlh9pfWTSkhMCcd4ZTxClyoO2KfPf3EA3jfajKCKqP3ZoDfCKeYiy7IrILPBXyo15eUUEow6PcO2UpC5j3UU4x44x7oqsEV8aisISuTlMcXHUqxgVxgWOPROxTS6Z2XY5Y7DdGB8J+klhmbx/yfn9vxHrbkOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4ASG/pJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4ASG/pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773576637; x=1805112637;
  h=date:from:to:subject:message-id;
  bh=ZxZ1fPSbwl+LWrUZCHWkWP6w3Pg5lz5cJXdCISn5Qzg=;
  b=n4ASG/pJvylEhMniQM9W4jSrZmoVbp7GP0cbIljyeiHkFYRwDjaeMln+
   3Ro30ZaNofRAZBN5ZdhPkLMhV4k7aAx9RKtxrMgGne7OQQ/wNPaM+1Yid
   CzozZXYqSYQ71Qe787I41F2PCBzdLQbi7zOktyvcgUkqWo+bK1TH8JWOG
   nWt4BFqd+upWzDk5fyw1iypjN1ycXUbsol48BM2Qparv0I538iXxL27z/
   A1qOz2bIE/+tLQp2Oe/Tugqg9hZcqvH4PXF2pYpAOygCw3DPTZajc5XKs
   ZqancM1WNryi79hw29j50Ath90bWybD17KPd2V2yYvNX11bmKeiss7s0T
   A==;
X-CSE-ConnectionGUID: 1qkO8S7VR1WXEI4A6GVcNg==
X-CSE-MsgGUID: ZPivt3KLQdCyYUEXfsQSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="86092305"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="86092305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 05:10:36 -0700
X-CSE-ConnectionGUID: uxXlak1fQKyF5JIEq+XN6w==
X-CSE-MsgGUID: m3FnnfHcSdKGnoCwVcf3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="259525264"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2026 05:10:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1kIi-0000000042V-0m4E
	for oe-kbuild@lists.linux.dev;
	Sun, 15 Mar 2026 12:10:32 +0000
Date: Sun, 15 Mar 2026 13:10:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 68/112] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603151316.nKC5RILp-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   f24237270454953662a56f4163837ebd026d6fe7
commit: 1d23e5c20715c1743aaea50c372ffb261af89c2d [68/112] x86: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260315/202603151316.nKC5RILp-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#841: FILE: lib/raid/xor/x86/xor-sse.c:49:
+xor_sse_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#842: FILE: lib/raid/xor/x86/xor-sse.c:50:
+	  const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#893: FILE: lib/raid/xor/x86/xor-sse.c:101:
+xor_sse_2_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#894: FILE: lib/raid/xor/x86/xor-sse.c:102:
+	       const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#928: FILE: lib/raid/xor/x86/xor-sse.c:136:
+xor_sse_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#929: FILE: lib/raid/xor/x86/xor-sse.c:137:
+	  const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#930: FILE: lib/raid/xor/x86/xor-sse.c:138:
+	  const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#988: FILE: lib/raid/xor/x86/xor-sse.c:196:
+xor_sse_3_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#989: FILE: lib/raid/xor/x86/xor-sse.c:197:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#990: FILE: lib/raid/xor/x86/xor-sse.c:198:
+	       const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1026: FILE: lib/raid/xor/x86/xor-sse.c:234:
+xor_sse_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1027: FILE: lib/raid/xor/x86/xor-sse.c:235:
+	  const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1028: FILE: lib/raid/xor/x86/xor-sse.c:236:
+	  const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1029: FILE: lib/raid/xor/x86/xor-sse.c:237:
+	  const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1094: FILE: lib/raid/xor/x86/xor-sse.c:302:
+xor_sse_4_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1095: FILE: lib/raid/xor/x86/xor-sse.c:303:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1096: FILE: lib/raid/xor/x86/xor-sse.c:304:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1097: FILE: lib/raid/xor/x86/xor-sse.c:305:
+	       const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1135: FILE: lib/raid/xor/x86/xor-sse.c:343:
+xor_sse_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1136: FILE: lib/raid/xor/x86/xor-sse.c:344:
+	  const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1137: FILE: lib/raid/xor/x86/xor-sse.c:345:
+	  const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1138: FILE: lib/raid/xor/x86/xor-sse.c:346:
+	  const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1139: FILE: lib/raid/xor/x86/xor-sse.c:347:
+	  const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1211: FILE: lib/raid/xor/x86/xor-sse.c:419:
+xor_sse_5_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1212: FILE: lib/raid/xor/x86/xor-sse.c:420:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1213: FILE: lib/raid/xor/x86/xor-sse.c:421:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1214: FILE: lib/raid/xor/x86/xor-sse.c:422:
+	       const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1215: FILE: lib/raid/xor/x86/xor-sse.c:423:
+	       const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
