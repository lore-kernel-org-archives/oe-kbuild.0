Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976DA8BFC
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731411; cv=none; b=qiemEOh2WYDE6/wWBWBJWiR0HXbU31QvvlW73HGedZ/L/iU3HBm94stikN4TG/rT+weehviq3CoXNMYPhwq0Te9gyWVznzPMaEeMyVxWHclgwDkImPFE1h9w5b2OTdIlpkaz4QuwnB5cycu+NXoqVBstZF7fHzGtcqFIB1bsyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731411; c=relaxed/simple;
	bh=5UHR79Y8ke6GsQWRlPjj8mJXqtJEoY86a/YAmXx78Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CV5x2d3sJErbj1o5I5PV1vPzKdNsZ82W42Jx2NCHTgBlZf/vNiemPFuBGIgLto8b4YAXS3isJ7SplIBR549id6vsHtI43jbVnPsl619+f88/KrdCO7mFX5+/409ouMFqF8aUcb/PFs6Es6sVvrKTWENnbD+f5SzumJChwYDPrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMgNhgKg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMgNhgKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720731410; x=1752267410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5UHR79Y8ke6GsQWRlPjj8mJXqtJEoY86a/YAmXx78Wc=;
  b=JMgNhgKg9Hj135BgClKwVdhkFubXotEwrNdf7cdBuKOeMh6xaeiKczm4
   AYlkNGIdCQSxAsUBFwtd+eicUsoRjcDVcOKjxvhDYD1aLlfqonklxhpYB
   L+4RN2xjIFqYNXnsmJbOQz44eeS2oTCXtdOmxeYym3tPGUAYePwQE7kmm
   bmVCvG+92cT4MPpWr0J7uUmMC25h4RaM0ygZU9Qp4Y/Crrkx00ub6swzA
   8CVVujJZuL1DJf0yMMwrkNf8NbPGRIuhufIROE0GUDLAmtSHWrFgAPLSb
   0aS5iiElm02FUDY5grVPSeexDmDNC0xL8IfNvWJOg+Gk2aoeidV4EMIIb
   w==;
X-CSE-ConnectionGUID: Te4fdUUPQQiNr2nSuJ83zA==
X-CSE-MsgGUID: C4/ofDraSoap55tEC0ALBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17766091"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="17766091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 13:56:49 -0700
X-CSE-ConnectionGUID: tJLZUox+TL+2BGlksGgcFg==
X-CSE-MsgGUID: Gi88fLBiRqWCnolMOXCG8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="53075485"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 13:56:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS0qL-000Zsr-31;
	Thu, 11 Jul 2024 20:56:45 +0000
Date: Fri, 12 Jul 2024 04:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/wfamnae-next20240710-cbc 1/13]
 arch/powerpc/include/asm/hvcall.h:697:48: error: structure containing a
 flexible array member is not at the end of another structure
Message-ID: <202407120418.bob8U4Yb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240710-cbc
head:   811bc7260e24cf06adefdbf8debb2a83d213e02d
commit: d692eacf807861f523e66bd7d1c60f5dc254f4c6 [1/13] Makefile: Enable -Wflex-array-member-not-at-end globally
:::::: branch date: 2 hours ago
:::::: commit date: 15 hours ago
config: powerpc64-randconfig-001-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120418.bob8U4Yb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120418.bob8U4Yb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407120418.bob8U4Yb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/tlbflush-radix.h:5,
                    from arch/powerpc/include/asm/book3s/64/radix.h:18,
                    from arch/powerpc/include/asm/book3s/64/pgtable.h:298,
                    from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:378,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:10:
>> arch/powerpc/include/asm/hvcall.h:697:48: error: structure containing a flexible array member is not at the end of another structure [-Werror=flex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
   cc1: all warnings being treated as errors


vim +697 arch/powerpc/include/asm/hvcall.h

59562b5c33d6ff Scott Cheloha 2020-07-27  691  
59562b5c33d6ff Scott Cheloha 2020-07-27  692  #define HGPCI_REQ_BUFFER_SIZE	4096
59562b5c33d6ff Scott Cheloha 2020-07-27  693  #define HGPCI_MAX_DATA_BYTES \
59562b5c33d6ff Scott Cheloha 2020-07-27  694  	(HGPCI_REQ_BUFFER_SIZE - sizeof(struct hv_get_perf_counter_info_params))
59562b5c33d6ff Scott Cheloha 2020-07-27  695  
59562b5c33d6ff Scott Cheloha 2020-07-27  696  struct hv_gpci_request_buffer {
59562b5c33d6ff Scott Cheloha 2020-07-27 @697  	struct hv_get_perf_counter_info_params params;
59562b5c33d6ff Scott Cheloha 2020-07-27  698  	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
59562b5c33d6ff Scott Cheloha 2020-07-27  699  } __packed;
59562b5c33d6ff Scott Cheloha 2020-07-27  700  

:::::: The code at line 697 was first introduced by commit
:::::: 59562b5c33d6ff3685509ed58b2ed3c5b5712704 powerpc/perf: consolidate GPCI hcall structs into asm/hvcall.h

:::::: TO: Scott Cheloha <cheloha@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
