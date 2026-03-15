Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045434D4FE
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576639; cv=none; b=nytp5TaV5mcCZ9lXi9F+t1FqbIVy3VyWLtAQiBp2vT+cJF67ej+158xwoK4n99ildUIZ0aRxGUxoQp6+KEPeryJcLvIp04Jkb6u+hbhCw0XVwjUE4MhV1lAvn40EJAXBOzLOergmlUF4/eMvXSWmKXl9PPK2ECJtc7V6tqmWzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576639; c=relaxed/simple;
	bh=rFay5oRzS3Zcl9u0nZv/fRzEYztMSILwT4kl0To7lDA=;
	h=Date:From:To:Subject:Message-ID; b=YZE4jXTQsTC1ENq4KbETEuvwYZ47do4CMY61MhfDFE954ExQJQBmdOQX4kgFycKqOlGkP1i7XtfC0yPMKk+PoDAQQJa1bKtcBhiSGA2ZKlH/320OpmgMYZRIDeDWfp5shI9wcjW0hNzy71UMEO+DYHjMouUxuR8dxDC9CjwIddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY+0ZCsT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY+0ZCsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773576637; x=1805112637;
  h=date:from:to:subject:message-id;
  bh=rFay5oRzS3Zcl9u0nZv/fRzEYztMSILwT4kl0To7lDA=;
  b=AY+0ZCsT72HEMyLSvf6kDbZsRw+ccCEhgYm8KAY7KIuWaypM3+f0abYb
   41jsBFWFjH81gig7aQyjcFyk3XFeyrEsTKeOjavyKdOVw+S3d2Xk/S7Vd
   +31QrnkOGc5KAPdC8BOd84Qy/mvXINj8VU+S1UOPK2kmNbN2PdwkQHFve
   KzkKDdP7ZIeAGOg+ogK3GZqtS3z52Wg7ZRXSsZYdEQXph5fmM/jccmxg0
   0qSUZexnzj6aqFfSit1IekETC2xMlhcSb5d7IXrX4kKxuGgWwaxTb4kYt
   D/rczuvdoSedDZFRlDAMKOLUz+dke6YyJJRuO5huboQzVupOpO+Yw1Dhs
   Q==;
X-CSE-ConnectionGUID: i7wio1rgSM61sfGg4uV33Q==
X-CSE-MsgGUID: nCswtjFhQAG0vp8A3Dl1eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="86092304"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="86092304"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 05:10:35 -0700
X-CSE-ConnectionGUID: +seYDTUdR/mLxIpTLY7pqQ==
X-CSE-MsgGUID: YdvMwdaTRd+vVbgc6ciuaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="259525263"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2026 05:10:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1kIi-0000000042X-0zsJ
	for oe-kbuild@lists.linux.dev;
	Sun, 15 Mar 2026 12:10:32 +0000
Date: Sun, 15 Mar 2026 13:10:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 74/112] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603151316.dOKranNo-lkp@intel.com>
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
commit: f70f5ac227d2712a0caa396233d828c004e17647 [74/112] xor: pass the entire operation to the low-level ops
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260315/202603151316.dOKranNo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#324: FILE: lib/raid/xor/arm64/xor-neon.c:13:
+static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#333: FILE: lib/raid/xor/arm64/xor-neon.c:40:
+static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#342: FILE: lib/raid/xor/arm64/xor-neon.c:76:
+static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#351: FILE: lib/raid/xor/arm64/xor-neon.c:121:
+static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#370: FILE: lib/raid/xor/arm64/xor-neon.c:188:
+static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#379: FILE: lib/raid/xor/arm64/xor-neon.c:222:
+static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#388: FILE: lib/raid/xor/arm64/xor-neon.c:265:
+static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#537: FILE: lib/raid/xor/powerpc/xor_vmx.c:54:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#538: FILE: lib/raid/xor/powerpc/xor_vmx.c:55:
+		const unsigned long * __restrict v2_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#551: FILE: lib/raid/xor/powerpc/xor_vmx.c:73:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#552: FILE: lib/raid/xor/powerpc/xor_vmx.c:74:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#553: FILE: lib/raid/xor/powerpc/xor_vmx.c:75:
+		const unsigned long * __restrict v3_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#567: FILE: lib/raid/xor/powerpc/xor_vmx.c:97:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#568: FILE: lib/raid/xor/powerpc/xor_vmx.c:98:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#569: FILE: lib/raid/xor/powerpc/xor_vmx.c:99:
+		const unsigned long * __restrict v3_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#570: FILE: lib/raid/xor/powerpc/xor_vmx.c:100:
+		const unsigned long * __restrict v4_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#585: FILE: lib/raid/xor/powerpc/xor_vmx.c:126:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#586: FILE: lib/raid/xor/powerpc/xor_vmx.c:127:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#587: FILE: lib/raid/xor/powerpc/xor_vmx.c:128:
+		const unsigned long * __restrict v3_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#588: FILE: lib/raid/xor/powerpc/xor_vmx.c:129:
+		const unsigned long * __restrict v4_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#589: FILE: lib/raid/xor/powerpc/xor_vmx.c:130:
+		const unsigned long * __restrict v5_in)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
