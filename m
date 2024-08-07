Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C901097B
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723058659; cv=none; b=NMF0xtgajHVbJwNXNZOjX0B3YpcvkH5yAb6uBaQQDr0cdsTgrc+NAJV22FlcNixP9EdpupsukuIVV7degdMjrpUSqprHUIl3S7Kh5VWaPg1+933kHdFe+ppOnnTWdpNb6LEUftJhsrX7n8mrdkGCKuPNm+bFQZ1+z7VMteUywnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723058659; c=relaxed/simple;
	bh=ID4w8VSRJK+diK/jwek48HYM9H0HNAEvaVXSwGEy3xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgVK9wI1uiZrvVbrCQWI/POmVWn9ycn1VbO9tD7+5MnpzCuQ7mtUqiK1FstPJ8WUieME88GvJ67p4qbXGLPcNHvpuSx3xHSlWTn7GW4HsCF/Du7p1lfZYstSH0V2ZiJgh5hajI0jKfqB+wcpZ86GgT7gNCmWbbjpq4WtrtAgSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ4M9e0x; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ4M9e0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723058656; x=1754594656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ID4w8VSRJK+diK/jwek48HYM9H0HNAEvaVXSwGEy3xc=;
  b=TQ4M9e0xu922ZBMVES1v+2n2VclLWZ5vNgCK4joAPOp1hKr/dYdFWpEw
   MVPrAAUWpg3BjYTr1/okQJZuXlClKIaS71DNMQtpiMl0QbuDSNputuGkR
   A3YTduNJHscglftgW0TotBsgSdO1UuX7MBG/9Pizvf0EkqoMG7vIy6KtN
   z++hm4E080Pf4r8iEefnU7kARpwQsa4rUTLdE622U8eTNbM0J0RhfvyuK
   cOYXeoFqmjdX/a9jwGvg5REudxaglnlEw65I0ad61lLIVeJNVWZrsCcEf
   r6/GD0Cn7I05YWEDQwBQzHG5qqXWyFL6nN5YmsWPd5tqDP4muWfZK2fq4
   A==;
X-CSE-ConnectionGUID: nA3nBdiMQbOPNQxSQWc3/A==
X-CSE-MsgGUID: vcs3Z71PQ5mP2bg4VtLWug==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21294369"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21294369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 12:24:15 -0700
X-CSE-ConnectionGUID: ZYMYgpl+S2a3UDeUOcJgWg==
X-CSE-MsgGUID: sS4ajyjsRGGBAQEOuhWBoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61079710"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2024 12:24:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbmGa-0005em-1W;
	Wed, 07 Aug 2024 19:24:12 +0000
Date: Thu, 8 Aug 2024 03:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2772/3555] mm/pagewalk.o: warning: objtool:
 pfn_swap_entry_to_page+0xec: unreachable instruction
Message-ID: <202408080352.OavBhnfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eec5d86d5bac6b3e972eb9c1898af3c08303c52d
commit: 740edf9fa88985ef62a43fc99d19b8f2ccd8fa94 [2772/3555] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-001-20240807 (https://download.01.org/0day-ci/archive/20240808/202408080352.OavBhnfI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080352.OavBhnfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408080352.OavBhnfI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pagewalk.o: warning: objtool: pfn_swap_entry_to_page+0xec: unreachable instruction


objdump-func vmlinux.o pfn_swap_entry_to_page:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
