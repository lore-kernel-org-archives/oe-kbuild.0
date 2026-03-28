Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DFB221DB3
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673227; cv=none; b=qP+vIqm7nDqz9pW71NTKO0SGvzs1reEdov83M43ixXtqVGk6SothXF3v2yCS/YBVSYccrgctY8r6Gg85+tXFLH2yltwiUP8CwOqBV716TnXD0/KULFytwi0jkxA4t0WrAYzVnROmZi+MExH+slKxTPf+TEsQTmHz/kdvqZqQCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673227; c=relaxed/simple;
	bh=zaIGc2rbhe80DyQYL9iBejs/a20oG4nIXuv8RTHUzmo=;
	h=Date:From:To:Subject:Message-ID; b=eX+JW5ivPUU2wotk2KMsseSNXOCzzE0bCUgONmdzEFUCqc2HnMa3YQIQI1z6v+I/SsoB97HXUpMdG+csyy6/zHuZM8E0ZkxajgyT26/9eoIWv8nHrtrVJMMNCWfVHAaz0xQZKWqrNqLTqq9LgxvCMLV08cUS+UwTUK4Aw8QJ/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJOHBR2S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJOHBR2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673226; x=1806209226;
  h=date:from:to:subject:message-id;
  bh=zaIGc2rbhe80DyQYL9iBejs/a20oG4nIXuv8RTHUzmo=;
  b=jJOHBR2StdnA2Z5UOfUTn+ShZFZUIHrawG89uL1RExP/zd4JJ0mBpTgU
   k73zaOadcC08124XKEWygBDId1kTj/avLU3wDO1hIMM/TzFD/fJDzmWvp
   xmKUUIW7vN+90iTMWkYC1yxcZDNvQKb8Q48wpXGlYkoA4e9IwjWxp+vU7
   E9ODyw4ry0GsKhAP550Xf76o3EcnEdbYmpiP1hEE7bdhUa0eqJr9oa6Ra
   zz5tnWQ+12gA6lTFkcZm303/rZibv+rxvhD3LBASIJbrF1ifbwRyg8qJB
   d9irjq5D531cP06WPn5vTTH5kGAWYE7sFnowjXknLMNV0UKEfG0ITc8C3
   g==;
X-CSE-ConnectionGUID: GqAFBQnxTPSn0sQ5YCeT7Q==
X-CSE-MsgGUID: LIg1i1Y4QYWDirXqNzMb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296702"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296702"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: L4HkGgbMTGGXGklVgzrVRw==
X-CSE-MsgGUID: YgpO8IHbSNeYtMKfzzbzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983383"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZa-000000007dV-3jKa
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:58 +0000
Date: Sat, 28 Mar 2026 05:46:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 15/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280553.z7JvOTWO-lkp@intel.com>
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
commit: 771c94ec32680a7aff7ce4003b417f45870c0414 [15/33] powerpc: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280553.z7JvOTWO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#6: 
Move the optimized XOR into lib/raid and include it it in xor.ko

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#216: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:15:
+static void xor_altivec_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#217: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:16:
+		const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#226: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:25:
+static void xor_altivec_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#227: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:26:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#228: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:27:
+		const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#237: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:36:
+static void xor_altivec_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#238: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:37:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#239: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:38:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#240: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:39:
+		const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#249: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:48:
+static void xor_altivec_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#250: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:49:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#251: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:50:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#252: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:51:
+		const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#253: FILE: lib/raid/xor/powerpc/xor_vmx_glue.c:52:
+		const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
