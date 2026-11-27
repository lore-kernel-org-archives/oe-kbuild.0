Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794582;
	b=i6QpxxJ7c2l7xw4vmVKxKWQefqmvPtcsDgk3jkn7bxhsvzUTPdL8YEMPTd09nk5nDZxM
	 I0sxCa0DD7FatSiLWCSUafmO27ZgunoOJh39Rps+HBEjYi2MwRepUpYUy5wHesyCeY7kt
	 MrSsDh/ll+I7E271nbYFyd2d2yTGo/yIvo0+o5PSdsdy4WiBF4X/l/Lqy9K2q/LSwPTnE
	 r0JklZcqTOvKprWvS75BymieTYwsqwrdeI/PMw+hekh4+bkSdRv8CLxMdrPA5gcayV03d
	 eMGGjcC+HBe2JEiiccJ4stKst6j++EulyVKHrk/tVL5s0m3/ETKoFE13vFT7ib5QYHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794582;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iNOdr4oaH0OrnTDISnB3l0YyoQ3EBgth0eP07aBzPFk=;
	b=Tz029ljuJUBjhpwO0EHtcHkaFGAVBbFd38uoQouW3WXveWcVQAmEbCVjWTxwK7U9kuIg
	 +bccTRdoeHIczQqBvaEuAJlsfB2RPgIsRXugk5V9J68WAFpI/ioxKOJ50FiK8GRDPmA7f
	 ENb89tWY2zNfuj8uFgczW4FCzJPD3X+y8bqgNdlUGIx+5rDsOQdMVCD07BzB8F0H8uZvp
	 sTV6q3eTI9zto/naSbzKabB9i2f6eL/GmMH2NSRY71HB3JWNJv9rPd5y/e+0Dij2OGuQ/
	 IapA4uk2rIxxKgYA/M6+TVgVRSCHawrRbt8+kiaaslnuUlLrr9+Wgfhhglxfha6oNRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BP4ykWc1;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A6606A31E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 15:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BP4ykWc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795794581; x=1827330581;
  h=date:from:to:cc:subject:message-id;
  bh=LBB5aN183IuqU0tlHVJ1ohAyKtvU1fY2U4/zHhXs7Zs=;
  b=BP4ykWc1cHGmI82jrQRzXV1mg9wWmMR+Qpov3uUdzRfdlsYgKmOT5V9U
   J9iHzJ8bJ7QDW9IR+F0Dflyo3vyDrLTpcnFCbxfULMsiGDbcNkGETrB7o
   riKl22VV+IH85XpmtuAtOIYCD+RKRnX7aC5lS2WG0VCQ4yoLaTfhtrk5e
   NlEFQNfBgjSl6VkADti1T7fcHSo142u93drzolbvz+vfILpWYkgod1j46
   fWyfrlnA5uLBGeE9YTOuyXZ0HzfEpDk/bpc/g61wTiNcPmsuuou9PmTSs
   t9WtaZAjP2b1QSFn+gb32Ln4sylyeNgrc7TloGejijahK2a8jzXwxList
   Q==;
X-CSE-ConnectionGUID: 5Ouy1y5tRmahOjK05r5w7Q==
X-CSE-MsgGUID: dsMrRXhaQfqDSixV97dx6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4727861"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4727861"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:49:41 -0800
X-CSE-ConnectionGUID: BTzA1otmQyKcsPKwasxKng==
X-CSE-MsgGUID: 9UoxW6DTSTeZ9haIMMYhKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14186782"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 27 Nov 2026 07:49:40 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWyCf-000000000Df-2ANm;
	Fri, 27 Nov 2026 15:49:37 +0000
Date: Fri, 27 Nov 2026 16:49:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:fermata 254/348] kernel/bpf/coro.c:143
 bpf_coro_frame_class() error: buffer overflow 'small' 8 <= 576460752303423487
Message-ID: <20261127164144.CF3Gx2AP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux fermata
head:   1d98f92a7b37670e804415b13c1d5d039706d4ce
commit: 4d3cd4b6be701549f74ad943124f4ed5bef27765 [254/348] bpf: Keep the coroutine frames that a program frees for its next ones
:::::: branch date: 9 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127164144.CF3Gx2AP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261127164144.CF3Gx2AP-lkp@intel.com/

smatch warnings:
kernel/bpf/coro.c:143 bpf_coro_frame_class() error: buffer overflow 'small' 8 <= 576460752303423487

vim +/small +143 kernel/bpf/coro.c

4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  131  
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  132  static_assert(sizeof(struct bpf_coro_frame_hdr) + BPF_MAX_REF_SLOTS * BPF_REG_SIZE <= 1024);
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  133  static_assert(BPF_CORO_FRAME_CLASSES <=
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  134  	      BITS_PER_TYPE(typeof_member(struct bpf_prog_aux, coro_classes)));
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  135  
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  136  /* @size is that of the header and the frame */
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  137  static unsigned int bpf_coro_frame_class(size_t size)
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  138  {
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  139  	/* in steps of 32 bytes up to 256 */
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  140  	static const u8 small[] = { 1, 2, 3, 4, 5, 5, 6, 6 };
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  141  
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  142  	if (size <= 256)
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26 @143  		return small[(size - 1) / 32];
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  144  	return size <= 512 ? 7 : 8;
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  145  }
4d3cd4b6be7015 Kumar Kartikeya Dwivedi 2026-11-26  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
