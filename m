Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122C37419B
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504057; cv=none; b=N/KvOJBbKwBcn0t2BQ/LF4wRu9l3zJ3tGtDU9QvHfVpt74TemGcO8m1LZ+mZ9GuU228E8PCfJkJR8+nmB56rY4bTtf3AnW6q0MiNs6b5z8At7gbZIMvhgDvltUHXUg+1fGXWwkMOGLOatzJhs9X7FA/vpfsIKtj85ihpc002/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504057; c=relaxed/simple;
	bh=E6Usad82NEAv4AQrR/Tr4uzBaqSYml6pCE+7Onrsj4M=;
	h=Date:From:To:Subject:Message-ID; b=GoG5uEtzqMnRduQcfUP5jtpU93lNblgakDJruU4WIRWhk8wQu2f+xpo4ns37rEWDzM9gvVMMzniGkbExFGUzOESJTmuE2M80BBI+GWaXsE77nm0tROtE0T6NueaY8/o7sFW2+iZVjJTmE6fb6x+/qEVXlxq3yUStf1zLOKsXHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkmNUKEa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkmNUKEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772504055; x=1804040055;
  h=date:from:to:subject:message-id;
  bh=E6Usad82NEAv4AQrR/Tr4uzBaqSYml6pCE+7Onrsj4M=;
  b=WkmNUKEaVV79kLU6uv5wYYTz2l7a+bCuf/Fe7tnJC+i2BS7xUCuUOi15
   aTUika2bvOiFiDlWvWVCOOkXuuShfzglHt67i0KTBP1TgBG+AITlAGuHl
   YEGNzUfByyIaAG6Rt0MoNtB5VY5q3+ZjjfcaqwUs8u621of3uzMnCABtD
   7OvywwGZIwsGDC19oJSzkHTmP1crqE8eRS5YD++JDGDqumCPIo7eI/w5X
   Hi8OwjsV2MNpTpVB9v7L+orKfQSjTfITYpzsig5azISE6qWzuNEdtHvFo
   qOsJ078d0dPhMqo/yigkay57YsoauhTNSc68Lk+H/ijThN/+cNSBswWcw
   w==;
X-CSE-ConnectionGUID: WpAqN5q8SUen9MVJSk6/pg==
X-CSE-MsgGUID: Q0VpZuFmQP2mNt2CmVLcrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72726944"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="72726944"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:14:12 -0800
X-CSE-ConnectionGUID: fFxv+tEyT0G0l34VVZioCA==
X-CSE-MsgGUID: hrwyzmcBQBmwpBDCouUspw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="216259960"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2026 18:14:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFGz-000000001Ll-2K6q
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 02:14:09 +0000
Date: Tue, 03 Mar 2026 03:13:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 79/103] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603030315.Oa0z3Rd0-lkp@intel.com>
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
head:   edf9ae1454f27f84c0dd4274c9a0519d2917ff4d
commit: 9685e9804520311463a98969003084fb5ccb6ae9 [79/103] xor: avoid indirect calls for arm64-optimized ops
:::::: branch date: 41 minutes ago
:::::: commit date: 41 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030315.Oa0z3Rd0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#140: FILE: lib/raid/xor/arm64/xor-neon-glue.c:14:
+xor_##_name##_2(unsigned long bytes, unsigned long * __restrict p1,	\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#141: FILE: lib/raid/xor/arm64/xor-neon-glue.c:15:
+	   const unsigned long * __restrict p2)				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#148: FILE: lib/raid/xor/arm64/xor-neon-glue.c:22:
+xor_##_name##_3(unsigned long bytes, unsigned long * __restrict p1,	\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#149: FILE: lib/raid/xor/arm64/xor-neon-glue.c:23:
+	   const unsigned long * __restrict p2,				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#150: FILE: lib/raid/xor/arm64/xor-neon-glue.c:24:
+	   const unsigned long * __restrict p3)				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#157: FILE: lib/raid/xor/arm64/xor-neon-glue.c:31:
+xor_##_name##_4(unsigned long bytes, unsigned long * __restrict p1,	\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#158: FILE: lib/raid/xor/arm64/xor-neon-glue.c:32:
+	   const unsigned long * __restrict p2,				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#159: FILE: lib/raid/xor/arm64/xor-neon-glue.c:33:
+	   const unsigned long * __restrict p3,				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#160: FILE: lib/raid/xor/arm64/xor-neon-glue.c:34:
+	   const unsigned long * __restrict p4)				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#167: FILE: lib/raid/xor/arm64/xor-neon-glue.c:41:
+xor_##_name##_5(unsigned long bytes, unsigned long * __restrict p1,	\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#168: FILE: lib/raid/xor/arm64/xor-neon-glue.c:42:
+	   const unsigned long * __restrict p2,				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#169: FILE: lib/raid/xor/arm64/xor-neon-glue.c:43:
+	   const unsigned long * __restrict p3,				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#170: FILE: lib/raid/xor/arm64/xor-neon-glue.c:44:
+	   const unsigned long * __restrict p4,				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#171: FILE: lib/raid/xor/arm64/xor-neon-glue.c:45:
+	   const unsigned long * __restrict p5)				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#199: FILE: lib/raid/xor/arm64/xor-neon.c:13:
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#200: FILE: lib/raid/xor/arm64/xor-neon.c:14:
+		const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#211: FILE: lib/raid/xor/arm64/xor-neon.c:40:
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#212: FILE: lib/raid/xor/arm64/xor-neon.c:41:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#213: FILE: lib/raid/xor/arm64/xor-neon.c:42:
+		const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#225: FILE: lib/raid/xor/arm64/xor-neon.c:76:
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#226: FILE: lib/raid/xor/arm64/xor-neon.c:77:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#227: FILE: lib/raid/xor/arm64/xor-neon.c:78:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#228: FILE: lib/raid/xor/arm64/xor-neon.c:79:
+		const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#241: FILE: lib/raid/xor/arm64/xor-neon.c:121:
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#242: FILE: lib/raid/xor/arm64/xor-neon.c:122:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#243: FILE: lib/raid/xor/arm64/xor-neon.c:123:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#244: FILE: lib/raid/xor/arm64/xor-neon.c:124:
+		const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#245: FILE: lib/raid/xor/arm64/xor-neon.c:125:
+		const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#272: FILE: lib/raid/xor/arm64/xor-neon.c:185:
+void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#273: FILE: lib/raid/xor/arm64/xor-neon.c:186:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#274: FILE: lib/raid/xor/arm64/xor-neon.c:187:
+		const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#287: FILE: lib/raid/xor/arm64/xor-neon.c:219:
+void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#288: FILE: lib/raid/xor/arm64/xor-neon.c:220:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#289: FILE: lib/raid/xor/arm64/xor-neon.c:221:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#290: FILE: lib/raid/xor/arm64/xor-neon.c:222:
+		const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#304: FILE: lib/raid/xor/arm64/xor-neon.c:262:
+void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#305: FILE: lib/raid/xor/arm64/xor-neon.c:263:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#306: FILE: lib/raid/xor/arm64/xor-neon.c:264:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#307: FILE: lib/raid/xor/arm64/xor-neon.c:265:
+		const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#308: FILE: lib/raid/xor/arm64/xor-neon.c:266:
+		const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#333: FILE: lib/raid/xor/arm64/xor-neon.h:3:
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#334: FILE: lib/raid/xor/arm64/xor-neon.h:4:
+		const unsigned long * __restrict p2);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#335: FILE: lib/raid/xor/arm64/xor-neon.h:5:
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#336: FILE: lib/raid/xor/arm64/xor-neon.h:6:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#337: FILE: lib/raid/xor/arm64/xor-neon.h:7:
+		const unsigned long * __restrict p3);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#338: FILE: lib/raid/xor/arm64/xor-neon.h:8:
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#339: FILE: lib/raid/xor/arm64/xor-neon.h:9:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#340: FILE: lib/raid/xor/arm64/xor-neon.h:10:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#341: FILE: lib/raid/xor/arm64/xor-neon.h:11:
+		const unsigned long * __restrict p4);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#342: FILE: lib/raid/xor/arm64/xor-neon.h:12:
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#343: FILE: lib/raid/xor/arm64/xor-neon.h:13:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#344: FILE: lib/raid/xor/arm64/xor-neon.h:14:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#345: FILE: lib/raid/xor/arm64/xor-neon.h:15:
+		const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#346: FILE: lib/raid/xor/arm64/xor-neon.h:16:
+		const unsigned long * __restrict p5);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#349: FILE: lib/raid/xor/arm64/xor-neon.h:19:
+void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#350: FILE: lib/raid/xor/arm64/xor-neon.h:20:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#351: FILE: lib/raid/xor/arm64/xor-neon.h:21:
+		const unsigned long * __restrict p3);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#352: FILE: lib/raid/xor/arm64/xor-neon.h:22:
+void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#353: FILE: lib/raid/xor/arm64/xor-neon.h:23:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#354: FILE: lib/raid/xor/arm64/xor-neon.h:24:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#355: FILE: lib/raid/xor/arm64/xor-neon.h:25:
+		const unsigned long * __restrict p4);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#356: FILE: lib/raid/xor/arm64/xor-neon.h:26:
+void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#357: FILE: lib/raid/xor/arm64/xor-neon.h:27:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#358: FILE: lib/raid/xor/arm64/xor-neon.h:28:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#359: FILE: lib/raid/xor/arm64/xor-neon.h:29:
+		const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#360: FILE: lib/raid/xor/arm64/xor-neon.h:30:
+		const unsigned long * __restrict p5);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
