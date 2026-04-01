Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6E26ED3A
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066589; cv=none; b=a4zdKLQE1w1M9melttPYNA74b3kyjmuKymd1A/W828QPG+U2biPO+KSmdZdqixVHBH/wE8np/vA1Z2mejwl2YDvtyeZsvxlqOoAALBZz70T4xBFPNd7vYbaQdAZ56PQWFQRly9x0nIcRr/KyJUCvqopXSSJLAgEnxVOSEgbUnXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066589; c=relaxed/simple;
	bh=6+928MWu+OimyTkBeMPc9PcPr5Bv4oR3Dln65ceMVoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T9PK/5Hd++TCPZotqXGDXNXC3jgQ3K+Gbn0A6tXEw2OaUcg8+e+A3O2GEeFaMCaLuphEqqP+eR1usH76wUdkrMg3nwmPSvThTqe+D7dBDw1K4VRWyasgmz77VLTkrO+dP10O4uiB1lv+L74P2Blq0QlNGp+zn4rdC17f/6FGQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpikOmgr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpikOmgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775066588; x=1806602588;
  h=date:from:to:cc:subject:message-id;
  bh=6+928MWu+OimyTkBeMPc9PcPr5Bv4oR3Dln65ceMVoA=;
  b=KpikOmgr8FRevuk7Vza4MLW5asgRZscq9FHVJjmYftWOObyHP88MS/Js
   09wr/leaB2rWyO65S82Doz10ND7Ygfqg6RFYc/B27uHvSUNnP3vxAoQco
   +NfQmVLxgjWbNS1cJtktgKWcnfd2Bp9666y9/U7p1e/tucNc/OBTwKB3b
   4sA9ueVghWRd6kSwUCrAZYF3dm9h035L/GDijVviarAhLipohNGS145Dh
   qfsib609BHkchv4gAaAYQ1lMteZp1Oz4AzBi+1b8qHHXHeWTFyU4y+n2B
   W/g3dVdyar4R04vyadYib9RSrSv+rlcGtF+Z72Sx2BG7poamWf3kZIJIo
   w==;
X-CSE-ConnectionGUID: 2fQE9jRKRzW8wf+J/DZ32w==
X-CSE-MsgGUID: LRBczGVkTwiwfIgVb+p4/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76000861"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76000861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 11:03:07 -0700
X-CSE-ConnectionGUID: AR9XkEIxSd+05tDABb3XlA==
X-CSE-MsgGUID: RdGpKw23SAizHWfnEb5Dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="264681601"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Apr 2026 11:03:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7zuC-000000008mX-1US4;
	Wed, 01 Apr 2026 18:03:04 +0000
Date: Wed, 01 Apr 2026 20:02:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rppt:mm-selftest/v0.3 25/73] pkey-arm64.h:39:33: error:
 implicit declaration of function 'default_huge_page_size'
Message-ID: <202604011934.npNfj662-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm-selftest/v0.3
head:   474ceb1620939c629b4937e273e6f3f0386a648d
commit: 007f80623c7833379e679eead818aaa4650839ba [25/73] selftests/mm: move HugeTLB helpers to hugepage_settings
:::::: branch date: 5 hours ago
:::::: commit date: 8 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260401/202604011934.npNfj662-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011934.npNfj662-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604011934.npNfj662-lkp@intel.com/

Note: the rppt/mm-selftest/v0.3 HEAD 474ceb1620939c629b4937e273e6f3f0386a648d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from protection_keys.c:49:
   protection_keys.c: In function 'malloc_pkey_anon_huge':
>> pkey-arm64.h:39:33: error: implicit declaration of function 'default_huge_page_size' [-Wimplicit-function-declaration]
      39 | #define HPAGE_SIZE              default_huge_page_size()
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   pkey-helpers.h:175:43: note: in definition of macro 'ALIGN_UP'
     175 | #define ALIGN_UP(x, align_to)   (((x) + ((align_to)-1)) & ~((align_to)-1))
         |                                           ^~~~~~~~
   protection_keys.c:691:31: note: in expansion of macro 'HPAGE_SIZE'
     691 |         size = ALIGN_UP(size, HPAGE_SIZE * 2);
         |                               ^~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
