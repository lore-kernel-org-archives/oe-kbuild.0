Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915875;
	b=Y0tznYBxfU7e+o2F5YvrowBi8P5PZsFIM7zGQ8986TP3g14fbgyNY5e3QtMpy+5ScoG4
	 hOf9kQIQEr1beI21THNzrNxmtVdpk0x1PJgUBe1IlP9B1jhjfUgjn3GWZMQWmfttmLfVb
	 oozsMaSvO0Ez0GTwxSbTMlqChdaxiB1xdgVZnSkzt/J0TthUSXoUDHE9FaC4h2+GbCHmR
	 gekHQDYW13c9fwphZyU+m9p1Tn3SDCNg6O1jjtVNhXyV83q5dht2uxDc1DAR2f6jXxbxN
	 YCGaLmnpq0lbRlIjcbBrUeV9/Ha3inPmVsHmUWsgxtecxpX2f/IEgq8R1o1n9HXhKlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0EBzT7gwIQ7aikBBg44blOzxigCFU68gGpjJTopwZe0=;
	b=AlIVQ3ctevuMCfavEwKEn39/4cwDKqMAb/PtmNi+6Eh7OInje8p/dnSfUWPOouJIHUhQ
	 nhMk1YwdLirD4hG7khwgjdoy3EynWOkegs6SHIwRkYl+B9ctw4fOmrMWboNI76ZCH5tj8
	 KlyBoB9iNpxF6kvEeSTgHnil99RTSnO4YBrZBQlmBGltJzSfpwfj125PJCymM8uGjxDZr
	 wzYZv/q8X69/jC7tNz7tnb3tgCE6r7iWhQWaUd960asLiBYxjPTpmawZjgL+XC50PZSzo
	 WaoJX+WVk11j3AuxD27fJwyB0CtQHCelQ4zhYaPjJZpIn9zN+kjHk2xMDgn6JZt2SvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Crg6jMBk;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DD4606A32C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 21:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06DD4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Crg6jMBk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793915875; x=1825451875;
  h=date:from:to:cc:subject:message-id;
  bh=F2K36BTu3E4DCMDseQkp+ogszfT8mpKudLyQdHET5Is=;
  b=Crg6jMBkh6dUjDFUAodO8473xE06PbiW3PFNPFAEtNw3L5zV5TsI03PW
   +J4WT1SIMDfPoIM0kiHn+zQ0u2uTCjwzdOOXrP4NEBX22zkcFZ4lYjApo
   G7yWge89hrSpnZZ87rmqh6MGUkdJzXZmGT3INm7NvHWLeor2AxMIyEPc4
   j3Tz/Qde8nPCGMTYBy9f89nJMcKW8jbEHHkTFlEZRkxQr0OhGbajc76ov
   MJ9jzl91dbfjzrkw7gNLI2ISqCBgOR6ryL0be5bPsp5LhbiW0cgkgjg41
   WYyI1OfPmCE7cKLDLf3fcZUn2h8ZJBSdLfJxU8jNWSKKNT9FZS8mlDtPh
   Q==;
X-CSE-ConnectionGUID: xQhL+KbMQZujKgthglEq2Q==
X-CSE-MsgGUID: nZbpAK9rR76Dr5xHViY+oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2730819"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2730819"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:57:53 -0800
X-CSE-ConnectionGUID: 9NjtAjAjT+mkOkj3S3rQfQ==
X-CSE-MsgGUID: ySqnp0tvS2a6iYDgqgz6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8877827"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 13:57:52 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP5Sv-000000009om-2QLR;
	Thu, 05 Nov 2026 21:57:49 +0000
Date: Thu, 05 Nov 2026 22:57:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kasong:master 14/19] include/linux/mm_inline.h:117
 lru_get_gen_flags() warn: mask and shift to zero: expr='(flags & ((((((1)))
 << (0)) - 1) << (((((((4 * 8) - (32 - 28)) - 0) - 1) - 0) - 0) - 0))) >>
 (((((((4 * 8) - (32 - 28)) - 0) - 1) - 0) - 0) - 0)'
Message-ID: <202611052230.DlZJeyer-lkp@intel.com>
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
TO: Kairui Song <kasong@tencent.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kasong/linux.git master
head:   8101629262ca78b97e4c62eb7257d7b0a27e879c
commit: 7f923cfff2c5a85e53b07f0377c275d23d635314 [14/19] mm/mglru: folio LRU refs based active/inactive number accounting
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052230.DlZJeyer-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611052230.DlZJeyer-lkp@intel.com/

smatch warnings:
include/linux/mm_inline.h:117 lru_get_gen_flags() warn: mask and shift to zero: expr='(flags & ((((((1))) << (0)) - 1) << (((((((4 * 8) - (32 - 28)) - 0) - 1) - 0) - 0) - 0))) >> (((((((4 * 8) - (32 - 28)) - 0) - 1) - 0) - 0) - 0)'

vim +117 include/linux/mm_inline.h

f90d8191ac864d Yu Zhao     2021-02-24  107  
7f923cfff2c5a8 Kairui Song 2026-10-15  108  /**
7f923cfff2c5a8 Kairui Song 2026-10-15  109   * lru_get_gen_flags - Return the LRU generation number from folio flags.
7f923cfff2c5a8 Kairui Song 2026-10-15  110   * @flags: folio flags
7f923cfff2c5a8 Kairui Song 2026-10-15  111   *
7f923cfff2c5a8 Kairui Song 2026-10-15  112   * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Returns
7f923cfff2c5a8 Kairui Song 2026-10-15  113   * -1 if the flags indicate the folio is off the list (e.g., isolated).
7f923cfff2c5a8 Kairui Song 2026-10-15  114   */
7f923cfff2c5a8 Kairui Song 2026-10-15  115  static inline int lru_get_gen_flags(unsigned long flags)
7f923cfff2c5a8 Kairui Song 2026-10-15  116  {
7f923cfff2c5a8 Kairui Song 2026-10-15 @117  	int gen = (flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF;
7f923cfff2c5a8 Kairui Song 2026-10-15  118  
7f923cfff2c5a8 Kairui Song 2026-10-15  119  	/* The gen is stored offset by one, so zero means off-list */
7f923cfff2c5a8 Kairui Song 2026-10-15  120  	VM_WARN_ON_ONCE(gen > MAX_NR_GENS);
7f923cfff2c5a8 Kairui Song 2026-10-15  121  	return gen - 1;
7f923cfff2c5a8 Kairui Song 2026-10-15  122  }
7f923cfff2c5a8 Kairui Song 2026-10-15  123  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
