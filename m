Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A607217659
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673227; cv=none; b=FjIMW4Gte8fq6t7fHGeFc6shWA0aohoHkCG6m7upzc4IkZ642ntyAjk5PpN6rJan8eg7H5y5MVp7koUvDV7Dr7WPLijydAxZIfTeuuXtQ5aMVqPp++Y5wW9n5bgPP93d+OAySqQd4xLOKetHJWXYjH1yQ5TynfQGa/W1aiGs5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673227; c=relaxed/simple;
	bh=HfiJlJSXC8CyDt1GZkTyfaJ4aoSycAkCpRiv1ImT3O8=;
	h=Date:From:To:Subject:Message-ID; b=KaNTu/Y2Oyyk+Shg2Lxcssp3EliwHdJLZdQhHmkKgP0Tlheh+Or5J7f48ksKn1YEGbyoz9AGZPwucEyqNHnb9wYLdx9fsubi84h1mMypC9jb4jwih/wX+ZRgP1MN1bhXGYjTV8NUl1iPhoWVCA/T1cSc3DxDhbrCCyDaDTZ/9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAEJddvw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAEJddvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673225; x=1806209225;
  h=date:from:to:subject:message-id;
  bh=HfiJlJSXC8CyDt1GZkTyfaJ4aoSycAkCpRiv1ImT3O8=;
  b=QAEJddvwS+/VQfyBnt8S40W3iccPNFyr0V3sSRN3xFLy+HMKyqyOjNRT
   C1unt+ge45MJHWFJvHaDyQ5dx1IFhsbwqd3Mw63DCsvOWmbOCxgoSMA9F
   v/HhveJm8LI3tNcLg7p0hBHUg5QWkRZDeZr2QAgPR2SAj+EVkhXQQH/7Q
   iFN9n+pAqnzBFWaN74wAQZosXc4pA7X5uv6T+ZBGCj4GKns4GqBM6T3Vh
   ZmjllxzSMm/HexA/HlQjKC7H3Ii1bJqh/Vx45GivhwvjLWXA6bzs11RJ0
   lMsSRrC+6Yo/ekdK3o91RfB3ozewWlAuW6+tD7/Klm5k7N6y5QPyMD0Ew
   g==;
X-CSE-ConnectionGUID: e4PsDbQBT2arONzzbEkHrg==
X-CSE-MsgGUID: ZlXKTVwTTNun7Bxl/VEygg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296699"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: 3G2FWWjURsGlmQvhTXTB4w==
X-CSE-MsgGUID: 2hS9Ure3S1i2adw7CrO3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983380"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZa-000000007dR-3LCy
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:58 +0000
Date: Sat, 28 Mar 2026 05:46:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 13/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280529.7rFP0NKz-lkp@intel.com>
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
commit: c56f3172ce7dc87f6bb7dbac05dd72d2de9820c9 [13/33] arm64: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280529.7rFP0NKz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#6: 
Move the optimized XOR into lib/raid and include it it in the main

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#156: FILE: lib/raid/xor/arm64/xor-neon-glue.c:14:
+xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#157: FILE: lib/raid/xor/arm64/xor-neon-glue.c:15:
+	   const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#164: FILE: lib/raid/xor/arm64/xor-neon-glue.c:22:
+xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#165: FILE: lib/raid/xor/arm64/xor-neon-glue.c:23:
+	   const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#166: FILE: lib/raid/xor/arm64/xor-neon-glue.c:24:
+	   const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#173: FILE: lib/raid/xor/arm64/xor-neon-glue.c:31:
+xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#174: FILE: lib/raid/xor/arm64/xor-neon-glue.c:32:
+	   const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#175: FILE: lib/raid/xor/arm64/xor-neon-glue.c:33:
+	   const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#176: FILE: lib/raid/xor/arm64/xor-neon-glue.c:34:
+	   const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#183: FILE: lib/raid/xor/arm64/xor-neon-glue.c:41:
+xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#184: FILE: lib/raid/xor/arm64/xor-neon-glue.c:42:
+	   const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#185: FILE: lib/raid/xor/arm64/xor-neon-glue.c:43:
+	   const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#186: FILE: lib/raid/xor/arm64/xor-neon-glue.c:44:
+	   const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#187: FILE: lib/raid/xor/arm64/xor-neon-glue.c:45:
+	   const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
