Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CB29BD95
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673228; cv=none; b=inpfFLEC79T5LSh931kXc3o0ykjrO12RlwFM7ZhDZLHkEOKya7ADI3dP6HZIevJvKlR3JENOvtD5o0jyCJoueW7UappMqQaXSpMTWSku6FFF5jKDmPWsByurHtph22gvxrmssfFwVlW6HtHD2u1C/H2onYUyDtU+2NjtY72FWDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673228; c=relaxed/simple;
	bh=UZmr6UCAmdTLHB2LfsbEAlat12ejKwgm+hzEFmVYrdg=;
	h=Date:From:To:Subject:Message-ID; b=SclQh6qHkd5YiGijfeom5M9eTn2PUSwhnJ1GABC7KA16+4dplZgNZZn5XvMnz2DiGh0h3racPIdg7CvArDDq5eW41hYeklyE3tQpSvsemE8EXx7VdNyH40ahfrP2Bmevy8un/W8enao3hh2bE2fj5J57AHmc4tkKbHZ5AoE3qCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyuOqxAc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyuOqxAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673227; x=1806209227;
  h=date:from:to:subject:message-id;
  bh=UZmr6UCAmdTLHB2LfsbEAlat12ejKwgm+hzEFmVYrdg=;
  b=iyuOqxAcx6Ki63+sPtbY7NGzEb6MlDYnQsh1VovpH4Mf7oWSYw2Ry8Js
   8MqmHZiODOITtB9+0SPvOw+0srgwgY9dZ3wy019wUX39kXaWYVWtMSUWz
   KmShTH2i7aZKWzOySKrTk2u3hDV9CCfQ6Mm5A861c8KH8irVjrhY6gzu7
   XuCVaNNLGKR/RO5rbUNIDhV8VWc8slZyQGjhDLLhACBjkouP3p6XHIyF+
   +HOA86OCluByxwS1RvcuEYUmmANIIcWUOL9k31YOS+wS6sd3lm9QmEku0
   +JfDecscRnzKv7jHBwHZWKGLDL4kLTkW9PYt8v2NZSWtWCXaORekdyJWU
   g==;
X-CSE-ConnectionGUID: 4CEK/5dxQcWK/QmZMbki4w==
X-CSE-MsgGUID: t4PEc+BDQJu3flXai5X2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296703"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: CZtuZxHVT2WTA2mYY128zA==
X-CSE-MsgGUID: 1s+gN/rdTBaAuWbcf4Zdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983384"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZb-000000007db-00OP
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:59 +0000
Date: Sat, 28 Mar 2026 05:46:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 26/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280516.p7b97fmm-lkp@intel.com>
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
commit: 5a1dad4e21385ce1d4fbf4b2143692500aca91dc [26/33] xor: pass the entire operation to the low-level ops
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280516.p7b97fmm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#287: FILE: lib/raid/xor/arm64/xor-neon.c:13:
+static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#296: FILE: lib/raid/xor/arm64/xor-neon.c:40:
+static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#305: FILE: lib/raid/xor/arm64/xor-neon.c:76:
+static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#314: FILE: lib/raid/xor/arm64/xor-neon.c:121:
+static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#333: FILE: lib/raid/xor/arm64/xor-neon.c:188:
+static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#342: FILE: lib/raid/xor/arm64/xor-neon.c:222:
+static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#351: FILE: lib/raid/xor/arm64/xor-neon.c:265:
+static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#500: FILE: lib/raid/xor/powerpc/xor_vmx.c:54:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#501: FILE: lib/raid/xor/powerpc/xor_vmx.c:55:
+		const unsigned long * __restrict v2_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#514: FILE: lib/raid/xor/powerpc/xor_vmx.c:73:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#515: FILE: lib/raid/xor/powerpc/xor_vmx.c:74:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#516: FILE: lib/raid/xor/powerpc/xor_vmx.c:75:
+		const unsigned long * __restrict v3_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#530: FILE: lib/raid/xor/powerpc/xor_vmx.c:97:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#531: FILE: lib/raid/xor/powerpc/xor_vmx.c:98:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#532: FILE: lib/raid/xor/powerpc/xor_vmx.c:99:
+		const unsigned long * __restrict v3_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#533: FILE: lib/raid/xor/powerpc/xor_vmx.c:100:
+		const unsigned long * __restrict v4_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#548: FILE: lib/raid/xor/powerpc/xor_vmx.c:126:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#549: FILE: lib/raid/xor/powerpc/xor_vmx.c:127:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#550: FILE: lib/raid/xor/powerpc/xor_vmx.c:128:
+		const unsigned long * __restrict v3_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#551: FILE: lib/raid/xor/powerpc/xor_vmx.c:129:
+		const unsigned long * __restrict v4_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#552: FILE: lib/raid/xor/powerpc/xor_vmx.c:130:
+		const unsigned long * __restrict v5_in)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
