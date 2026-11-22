Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795324501;
	b=szcsHDOD1AC626iC5+vNIElYbMVJeCtJLqRjZbTioLQJ6Pf5zsuNU5J9+ikW998+AS+X
	 kjp3fZa33UVyCrtpR/Incc/VIuFQfz8rbAV9HtMnKxaizS6v5EiYq0+obEUNonI/hx9lH
	 AuBBePfNo03Rb2LeI2arLPKHE6YeDs5RaS+KIph6RhMNZN00uQawdvZbjmebiL4AU6N88
	 1ZgT9e4+U9J3FiDUh5bFupDWn32Rs6IpVfycR+q0u3UsVnKES0lZS+M1wEaDxYS8XmLYM
	 NUvApA6oBsbgaLEdyOfPs7v6RfITrVBqZEfkBXdgP/jU+31EiQ+xjfp3wMbpHt/Hi8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324501;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JandlGMDRHR0vIWZxlG1t//OjZJskAYJ/ylvu0OH4vw=;
	b=W0b41zLPV/Y5lfdHCumKLA0iro4wbrOIYTkQdwRlS8vP7q74uj2nFWe/ZE8UpLAA/kxD
	 anAKGS3UFuW+E8fqsXFa31nnuF1nsPwzrhJdeiZ2VfGO9C+FqPs8F1+yZ6HY0qt8a1GaN
	 YMwiGUsDD5G6ITiuoHL5LyVJrdjZabn9Qb+OK5lBr44fUpbk3CBOAJlnrpwQQmQC9BDfU
	 0PKTJQh/GSFk8niyMA9PGIxcCiGgCbLWDZGvvp0H9nuK+bKX11MWmZQf585WMjy9+35tY
	 inp1GsLa3XYglYBXyDiN7jXtSYk2+UOW6HAWSCHLOLEPGUPILWu/T6j811BEIqqOnvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Y/BwPFhq";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF0606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 05:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y/BwPFhq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795324501; x=1826860501;
  h=date:from:to:cc:subject:message-id;
  bh=ORu3BfFYG9V84tPxvmDxQOIZdA7EBOYH9cxlkFwLZrs=;
  b=Y/BwPFhqer0S5PqfU1xx3xPjcKs9wUosFm++nOcFAD4kRqf4uagehIpx
   iplvVUiHNqeBQr9nfBV9+EablicLBGYJdOe+uq35Mq+SdWGmsJcLifjl7
   1lVDDbr0yo3zkBQb9aP9wlvYGVukS6mS/ZSPCxh2sOEmd6Cdu1oqApFoP
   3GfGtK2/csPJySODLXaAkMZs4a5aiicUiQpvNsuyXDfH6tIrTGPUQaTfA
   RZvh0lmlRX6vMY7xQzPMSMJ8C8qJ7gAzz6vdpZtKRanfY5RFHSmlvgPTR
   gMbHN5XkShIU4d2DgmUhz9rbsSpj78Qs2dz0D7eb1Gf2uOexdnSucqbCL
   A==;
X-CSE-ConnectionGUID: hBrbhIQSTSCTwayV3U4f1A==
X-CSE-MsgGUID: BFotBiFEQcS+dd1CGc8JvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4050374"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4050374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 21:15:00 -0800
X-CSE-ConnectionGUID: 4FzVrf/tR/mhO8rg7KOssw==
X-CSE-MsgGUID: kIqjhsObSy6ttxTTlktm8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11346648"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 21:14:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzuh-000000004Uz-2bNr;
	Sun, 22 Nov 2026 05:14:55 +0000
Date: Sun, 22 Nov 2026 06:14:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:fermata 187/284] kernel/bpf/states.c:557
 same_refs() error: __builtin_memcmp() '&a->refs[i]->ptr' too small (4 vs 8)
Message-ID: <20261122060423.8PB6kgiy-lkp@intel.com>
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
head:   7f7b1fb0e49ec9ac76f5d9f32824c34f601bd438
commit: 594aa7bcd085fc1bee0df72e792e57426e710157 [187/284] bpf: Add reference-owned slot arrays to verifier state
:::::: branch date: 54 minutes ago
:::::: commit date: 5 hours ago
config: m68k-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122060423.8PB6kgiy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122060423.8PB6kgiy-lkp@intel.com/

smatch warnings:
kernel/bpf/states.c:557 same_refs() error: __builtin_memcmp() '&a->refs[i]->ptr' too small (4 vs 8)
kernel/bpf/states.c:557 same_refs() error: __builtin_memcmp() '&b->refs[i]->ptr' too small (4 vs 8)

vim +557 kernel/bpf/states.c

594aa7bcd085fc Kumar Kartikeya Dwivedi 2026-09-29  550  
a03670bf0cf38b Alexei Starovoitov      2026-11-20  551  static bool same_refs(const struct bpf_verifier_state *a, const struct bpf_verifier_state *b)
a03670bf0cf38b Alexei Starovoitov      2026-11-20  552  {
a03670bf0cf38b Alexei Starovoitov      2026-11-20  553  	u32 i;
a03670bf0cf38b Alexei Starovoitov      2026-11-20  554  
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  555  	for (i = 0; i < a->acquired_refs; i++) {
a03670bf0cf38b Alexei Starovoitov      2026-11-20  556  		if (a->refs[i].type != b->refs[i].type || a->refs[i].id != b->refs[i].id ||
a03670bf0cf38b Alexei Starovoitov      2026-11-20 @557  		    memcmp(&a->refs[i].ptr, &b->refs[i].ptr, sizeof(u64)))
a03670bf0cf38b Alexei Starovoitov      2026-11-20  558  			return false;
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  559  		/* a state doesn't stand for one where another frame is to release it */
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  560  		if (a->refs[i].frameno != b->refs[i].frameno)
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  561  			return false;
2b95051722e6ed Kumar Kartikeya Dwivedi 2026-11-13  562  		/* or where a frame above the owner got it in another argument */
2b95051722e6ed Kumar Kartikeya Dwivedi 2026-11-13  563  		if (memcmp(a->refs[i].args, b->refs[i].args, sizeof(a->refs[i].args)))
2b95051722e6ed Kumar Kartikeya Dwivedi 2026-11-13  564  			return false;
594aa7bcd085fc Kumar Kartikeya Dwivedi 2026-09-29  565  		if (!same_ref_slots(&a->refs[i], &b->refs[i]))
594aa7bcd085fc Kumar Kartikeya Dwivedi 2026-09-29  566  			return false;
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  567  	}
a03670bf0cf38b Alexei Starovoitov      2026-11-20  568  	return true;
a03670bf0cf38b Alexei Starovoitov      2026-11-20  569  }
a03670bf0cf38b Alexei Starovoitov      2026-11-20  570  

:::::: The code at line 557 was first introduced by commit
:::::: a03670bf0cf38b9429887b8d8f9334e1fd1b3e95 bpf: Compare states by join_key, then by value

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
