Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D6225416
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673227; cv=none; b=fBOh9pAwBqcqAjyuO97STMKVeXrzQZVWyb68eAT0dI4GBMiaQL7U0VI7ZiWMWv1QLzVLp97zGFtYV7GJ7w7ZxrEPxlwPu7Ui7j7bTUshkuDc82QuY+PhMFZBgFNDM8QWZibZsdbR5BsZt9ze92OqM5/zGaKBmnaKcj5YstDc9gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673227; c=relaxed/simple;
	bh=W4gxiVzPCRBasCIUm9ant7ViLJGvFU6hgbeYD3nuMAg=;
	h=Date:From:To:Subject:Message-ID; b=kvuL2+ibxA+ZxNvKdq+W6BzsmmUAbw0X9beLYih/gqVR3Wpl8AidpcylHkayeW5kYKDQw2ib0/oTkjBjTN4dZzYe3EAMFicmEAAk5zJ9qgk4jgr+e6mPemQCRdYVOCNGD8NHmD9SUcL8ZCX539n4ZbltqLB9nZOjbILYpBxGA4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn4rjgge; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn4rjgge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673226; x=1806209226;
  h=date:from:to:subject:message-id;
  bh=W4gxiVzPCRBasCIUm9ant7ViLJGvFU6hgbeYD3nuMAg=;
  b=Vn4rjggesyc2H7OCU7iHMFGSQkeOJK2sv9CUTIL98kGfnviB+gUcljxL
   63CDr2//S3T+rDHXe3ZQYW+M9L9y7Z4HBQrOYL5jEs9R4mfyNjpmsg273
   f3qGOZPJJKaU0W+WdNmBKXHheLsTK3eQooZwz996q53rMNi8TbYEmPDgn
   Az6lg2rLzWRoBDEhZdGDMzvjnzERuDh1pjEpyOevNt+WhQ4CXvUb3hbkv
   ew+h7LnoXcXfmm9JX1wtjRkKAcJovnU+w+CtMQEHeQ24fU0V5N/mRpgHG
   mgGAz7GR2TUFdn+rcPByg1+2NUd8gfVcUYu2h7bTUduJP7IDM+w9uIW5x
   w==;
X-CSE-ConnectionGUID: p3nVUF7oQledmXXhjKu4tA==
X-CSE-MsgGUID: RjWHd2c7QYyS1R4IHsRTPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296701"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296701"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: c/igeqY/Qcumj/jSvTG+RQ==
X-CSE-MsgGUID: lZjlepB3Rr28trfH6A3EYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983382"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZb-000000007di-09xb
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:59 +0000
Date: Sat, 28 Mar 2026 05:46:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 31/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280546.D0LeIzRT-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: dabf078383c93d0dde358b10c5e818c5503f4903 [31/33] xor/arm: Replace vectorized implementation with arm64's intrinsics
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280546.D0LeIzRT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#54: FILE: lib/raid/xor/arm/xor-neon.c:12:
+static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#55: FILE: lib/raid/xor/arm/xor-neon.c:13:
+		const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#81: FILE: lib/raid/xor/arm/xor-neon.c:39:
+static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#82: FILE: lib/raid/xor/arm/xor-neon.c:40:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#83: FILE: lib/raid/xor/arm/xor-neon.c:41:
+		const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#117: FILE: lib/raid/xor/arm/xor-neon.c:75:
+static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#118: FILE: lib/raid/xor/arm/xor-neon.c:76:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#119: FILE: lib/raid/xor/arm/xor-neon.c:77:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#120: FILE: lib/raid/xor/arm/xor-neon.c:78:
+		const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#162: FILE: lib/raid/xor/arm/xor-neon.c:120:
+static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#163: FILE: lib/raid/xor/arm/xor-neon.c:121:
+		const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#164: FILE: lib/raid/xor/arm/xor-neon.c:122:
+		const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#165: FILE: lib/raid/xor/arm/xor-neon.c:123:
+		const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#166: FILE: lib/raid/xor/arm/xor-neon.c:124:
+		const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
