Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4D35280
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726270; cv=none; b=Guztrlnt0DfY/0vNLQsFv87NrgacLiTHUGUnoQfGySti+WbEmXyao1hXGxZ3qcB+WvePwuNN0aDUFltNhbP79so9mvLgrpe9+mSpK0l7hgz7PBttiqExkr+ooRjs/fMi1qj36Ilp1pvbhatXJl3u/zhvBmL2ci9nEcXh0cR5gPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726270; c=relaxed/simple;
	bh=e3C6gCxOEvtH6tf+14KbRISFV35ymlnodrwyN6GIifc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JMPHYzwvWfee+oB/h3+LHF/1UwGBHW3IjBXbMCvlMGFoVgsaMnhzvCwKzMxzqUH0gDXNh420YfPilA4Lv+YgHOM7IihvtsIMiM049XbDui8giEa4j0Bc85PiVG4KBgBq2Sx90melhXY0/QpRM/hN2YX53sc5M5zK9raQXJ1LCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3z+wlzK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3z+wlzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746726269; x=1778262269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3C6gCxOEvtH6tf+14KbRISFV35ymlnodrwyN6GIifc=;
  b=V3z+wlzKn8lyjBkxcZbK7SVDdGlGsTJnht4BYxLBS4esb7QpoVezE5iO
   0+giY6/Z8V7lK+h63slNS7syxDLokFbkjOv/Pc6ml65kePiAlONsrMkm4
   NSlOLFCcyeOE3At0OE0Zq/NS0f+CNKgebznSwt+QeJsa5Rx3WTJzKAd2T
   xP403jNe7WgtW5WRaIsT7wJA0MBf+luEXsBhlQ7Ktf4iXI6rzE5YXLKYh
   zrBMxhj45nsc7F16rZpZ2U++Y/kUGSrzAIUXAB2cINAUp8h2Ot+WPnx5c
   bGjqybzCkYZ6dOkfWibvh+ZGwWs2Hn/n1VpZofaJ/3aPEBaKfqOzKSTmc
   Q==;
X-CSE-ConnectionGUID: Oap1C4PQTMuBaJuGDT4jhg==
X-CSE-MsgGUID: KatCdV6oRZSJXndnZNOIVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48440628"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48440628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 10:44:28 -0700
X-CSE-ConnectionGUID: Gz8Sm0OqTraVhWzirNtZYA==
X-CSE-MsgGUID: bqUpsvIiTKurRHbEgrtF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137303860"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2025 10:44:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD5IG-000BE1-2G;
	Thu, 08 May 2025 17:44:24 +0000
Date: Fri, 9 May 2025 01:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build 51/57] htmldocs: check.c:641:9: error: call to
 undeclared function 'memmem'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202505090139.eNgYYbIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   a756ad343c6f178683f423165424a8b5b8048da8
commit: db5ffffab4819bc919ea60b818dabeba709edc58 [51/57] objtool check klp
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505090139.eNgYYbIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090139.eNgYYbIS-lkp@intel.com/

All errors (new ones prefixed by >>):

         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1277: prepare0] Error 2
>> check.c:641:9: error: call to undeclared function 'memmem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     641 |         return memmem(sec->data->d_buf, sec_size(sec), "\0livepatch=Y", 12);
         |                ^
   check.c:641:9: note: did you mean 'memset'?
   /usr/include/string.h:61:14: note: 'memset' declared here
      61 | extern void *memset (void *__s, int __c, size_t __n) __THROW __nonnull ((1));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
