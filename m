Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216966;
	b=tg3NNV/TxQaVIpBBqPUlKELwOLaAtzvmB3YKJF+M1C42laC1k4JUvQC2UL3w6oP2EsTj
	 QO+OpdJoUkJE5pHSVyfQL3fhF3zGn2/7+64IjWaq4csGI6bTjbOOsxxfl0mmK3OpbWicr
	 XV3JqA5brQUWr2fZNgJrD7QyoDG566YUx1kk98wQ8zFenmDUacBaKL6zNqRM+80OCahy6
	 EaEI8LvSfX8qQ6qdQt5BbgT60kfHRTlvSNJdNWk9Y0bbWvUfSUtyGxSHiyybZ5Fn+oLJJ
	 Dr7mbWXN+dx615Pi7Re2MXhnwbVD6OIuIroPn/VfUy3hYn+MUTTc8dLLI+HvCS+yhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vnh6HFzqNU6sweeCoTH1dAiOowAaGFB1+Ao8kGFlACo=;
	b=SlI8U6lXfcyMXd5OMmBDwysutKdIBeNQtwM3qSBf5or+hj4J09am/q6r06+UqQ77Dwlq
	 RaH50vMcTUHtv8SidlTLcU1nf8gKRJ+410G91lMVnoa7XVSsTCPn+BL2/8tKHnFmMdX2b
	 sn0hoW/i0zITEUHvoW7ugwyKcL+zgm25ePcHashwC4QXvQjrx7aBqnE9gaR0VosLsdpj1
	 nHF1QjmPMmyW3hFdEalFF2d9+xWhEKwO3CuA6OtyjAhEnEiDetTOOrNFz1Vsjd1UM3lk3
	 RvxHwURt+ue/4qT2jApeIcGPYAlXafXaFBuV+HNDTFAtH0M5PENIKKFN1we+nfUbHFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFSMmCda;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DBF606A338
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 09:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DBF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFSMmCda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794216965; x=1825752965;
  h=date:from:to:cc:subject:message-id;
  bh=RsrNalNfYeWGGZPIo5qwsgDq/IwcSkvhz0GNE/oaw8Y=;
  b=QFSMmCdamMS7qYGD3F547++fxOP8+McX0dLK3z1eNt9gmchTikPLlP+B
   HgBf6MellySLm6s2fO3H/dZkgcVULhC6iMJqD+kgYFLT9YxxowioSq9iW
   jd9svgSmlO8foud4OsZR1TLlvxZ6LHv9W2m4Clfani6FsyZAzvl5a/VF0
   7Jb7V+slfExVUSZ0hT57gsmJtVPYSVBhNDTIGoaRQdGRnFIW69cOQR97j
   AIPYY/4fsXBj9JMPm/erQvlskcaV1l/nVOtrcxz6zpfVRmKHJVU22x1tr
   Mh1aPmgejaq1ayXJ/Qt37vhgwDkZw2VPz0jImayO28x8FGOFL2Xhe1tgq
   w==;
X-CSE-ConnectionGUID: ZsCacZ64S5WhpuLxieanfg==
X-CSE-MsgGUID: V+a/ch7BSMCOLz+dqlgpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2937152"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2937152"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:36:05 -0800
X-CSE-ConnectionGUID: sdlxjOGSTqKkTCn0DeFhOg==
X-CSE-MsgGUID: u7XplI7+S6+bXS75jabXdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8161910"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2026 01:36:02 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQLnA-000000000IB-1CTw;
	Mon, 09 Nov 2026 09:35:56 +0000
Date: Mon, 09 Nov 2026 10:35:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/vmcore_info.c:16
 arch_crash_save_vmcoreinfo() warn: argument 2 to %lx specifier is cast from
 pointer
Message-ID: <202611091008.qt59ZzAc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yangyang Lian <lianyangyang@kylinos.cn>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: George Guo <guodongtai@kylinos.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
commit: 2a5ec3a553f7b23359344d52332263d5fa88aac6 LoongArch: Add arch_crash_save_vmcoreinfo() support
date:   13 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 13 days ago
config: loongarch-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091008.qt59ZzAc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2a5ec3a553f7 ("LoongArch: Add arch_crash_save_vmcoreinfo() support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611091008.qt59ZzAc-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/vmcore_info.c:16 arch_crash_save_vmcoreinfo() warn: argument 2 to %lx specifier is cast from pointer

vim +16 arch/loongarch/kernel/vmcore_info.c

2a5ec3a553f7b23 Yangyang Lian 2026-10-27   7  
2a5ec3a553f7b23 Yangyang Lian 2026-10-27   8  void arch_crash_save_vmcoreinfo(void)
2a5ec3a553f7b23 Yangyang Lian 2026-10-27   9  {
2a5ec3a553f7b23 Yangyang Lian 2026-10-27  10  	VMCOREINFO_NUMBER(VA_BITS);
2a5ec3a553f7b23 Yangyang Lian 2026-10-27  11  	/* NUMBER(VMALLOC_START) is exported by the generic code */
2a5ec3a553f7b23 Yangyang Lian 2026-10-27  12  	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
2a5ec3a553f7b23 Yangyang Lian 2026-10-27  13  #ifdef CONFIG_64BIT
2a5ec3a553f7b23 Yangyang Lian 2026-10-27  14  	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
2a5ec3a553f7b23 Yangyang Lian 2026-10-27  15  	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
2a5ec3a553f7b23 Yangyang Lian 2026-10-27 @16  	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", (unsigned long)vmemmap);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
