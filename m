Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362B4318EE9
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 19:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246193; cv=none; b=TfIS+7t8avsUfZifZWsreeiWQcdfKd5MHqk0pLubHklrFCAskUVFLgqiite6sa6eGaRk2Sk31xH0IdmmlTNnq3NDQfKqhZl8W32mR28O5u83hwLBnWy9gmorHuFlI5uBPLTVBs+39JEAeimb7yxOH2OvePb0BOyRFG4O0T/aW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246193; c=relaxed/simple;
	bh=MI8jmCpu+Iw+LCYO3uWLL3m7MMCmeeTq9C+6SjFDw2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c1wyY6vjhERTwlouWBM0tXatqV/9SBA1RWxhi9bw0gPZf8OaFBvZmR1QPjyIHOgq/eFuyCmq6vpImYbnpriN3SKZqSfXqxZBlyrSksFg7y2KrLM00R6dikgxwEdSfiusFzwzocyfq5u/4LtNYuU36C3lEfpv0kxGVshY2Us/CXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsfrV/fQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsfrV/fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768246191; x=1799782191;
  h=date:from:to:cc:subject:message-id;
  bh=MI8jmCpu+Iw+LCYO3uWLL3m7MMCmeeTq9C+6SjFDw2A=;
  b=dsfrV/fQx2U8ifgzR0qU5+jnpo32mXa6ClcWgrGcxFL1WRPRVPiPdRN0
   Wru4eU/Ufr4sIi/qJGUjtpbsZQ40WLma6o0S/KYD+e2oK64mDfLs8XKvO
   JI/bzeo3qK2ROPw9PkaSzdd/qGc8g9CjyrsaY2OxPjeLbkBN0JywVZmTG
   et/8M5EinRTyprwh3rdA/0+pnjFbmQyZFkoLMaDnzpQh2ILmFayXAz3ZH
   310VCzNC5MmfvkB7V/zd16d3mp+tcqdORZOMS2a6dOONJ1OzXPOQoMDjt
   o+FU1diqRPqJOWWLSgaXhD2jDxdin7C82R4cvliQv+cNaCbEnCQ0Po/dp
   w==;
X-CSE-ConnectionGUID: B874le9aT6GgrP3chR/5vg==
X-CSE-MsgGUID: 8PVUqtlERniyAijg89tQ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69440260"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69440260"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:29:50 -0800
X-CSE-ConnectionGUID: jqRUhk8ASvmDXufkyU899A==
X-CSE-MsgGUID: hieO3HJsTbqONs/tYT8clQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203332882"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 11:29:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfNbn-00000000DnI-21M5;
	Mon, 12 Jan 2026 19:29:47 +0000
Date: Tue, 13 Jan 2026 03:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/sparse.o: warning: objtool:
 sparse_init_early_section+0xd8: unreachable instruction
Message-ID: <202601130321.xObpFLuq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: d65917c42373f70159a3fc453f8f028fd665e04f mm/sparse: allow for alternate vmemmap section init at boot
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260113/202601130321.xObpFLuq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130321.xObpFLuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601130321.xObpFLuq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/sparse.o: warning: objtool: sparse_init_early_section+0xd8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
