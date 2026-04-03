Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773837C911
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205725; cv=none; b=jhzI8iJ3a/AAnnlJ+JUPLkqEGeXDiRvDHAlpUGE5wfBdq2Fq5LrSSp7ClynoSM8K7159euOn7pBSrecCdy2mOFuK63NL/PWNmeLDfIc1tzaikloVqXwHMy4qE4Ehmit9vCfJxmHO59OMM9J6IfMC04zMhuv7X05lNiorJhEv6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205725; c=relaxed/simple;
	bh=Wabu8b3foetbaqjiZxvf3qyK7MC6NEplZnyCSMsr+hQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XUQo168zEJwww6jzfOON7k9aJm5wCOr4QpR/Ulw+LZPrIFYFXMXxtFp0UqK6mX+Xos0pQcP+4SQC+cDPZrGPsCwn0TdwRGjVB8P8Ced+8lqacgBhIYeECaGp+wyTRVtO3/1WcRq3XYAJZYJTtjTR9onp0DnkROLs3XIZsUfCp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nit0aUV3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nit0aUV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205721; x=1806741721;
  h=date:from:to:cc:subject:message-id;
  bh=Wabu8b3foetbaqjiZxvf3qyK7MC6NEplZnyCSMsr+hQ=;
  b=Nit0aUV3pon4s3CTgbc+LLfA7FqKNQu/xrsbELWyJaiBMGqurTxAzHUk
   A0O3MfRUFV38zQHh9f+c3F9CAHBcJPrYDDNMx28rKG3MSh2ofXQHEPocC
   TI2ZHgFB/IjMQ8llOdaCwyGa7e+/UmvuQ0+1THku0J6n9IrWzXAHbil5q
   WzBy9aWf1DzhbTWLOmWIcaJlmL6vR2afVFR2j0OFaSKbV7I51icTSID/a
   mx2yxpvKeLHQi/frngB9SCqBlt1thW08lQxcF0xiUIKptAbdqlPinRyr1
   wXvD9ydI1vPRR1oUydn4pWudKvsbLGUG4IdN5RmNBMqNP/1swxy1jwcet
   g==;
X-CSE-ConnectionGUID: hGadalAGTDOdWF2wxVJUaw==
X-CSE-MsgGUID: HSdBitteQlWdO2fYd+Wekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973953"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973953"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: i+BdQwhXQKq22MuaWdvxVA==
X-CSE-MsgGUID: TZ+X4ImsS5qBsLRQd5BYpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834238"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-0000000013B-3EcX;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/zsmalloc.c:352:2-8: preceding lock on line 347
Message-ID: <202604022204.EvOdKOX7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: e27af3f9360ee130b7ab0b274088f92146a0855b zsmalloc: sleepable zspage reader-lock
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: powerpc64-randconfig-r054-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022204.EvOdKOX7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e3cbd9984a78422c3799629eb6b5f7f7818c1a11)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e27af3f9360e ("zsmalloc: sleepable zspage reader-lock")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604022204.EvOdKOX7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/zsmalloc.c:352:2-8: preceding lock on line 347

vim +352 mm/zsmalloc.c

e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  342  
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  343  static __must_check bool zspage_write_trylock(struct zspage *zspage)
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  344  {
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  345  	struct zspage_lock *zsl = &zspage->zsl;
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  346  
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03 @347  	spin_lock(&zsl->lock);
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  348  	if (zsl->cnt == ZS_PAGE_UNLOCKED) {
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  349  		zsl->cnt = ZS_PAGE_WRLOCKED;
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  350  		rwsem_acquire(&zsl->dep_map, 0, 1, _RET_IP_);
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  351  		lock_acquired(&zsl->dep_map, _RET_IP_);
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03 @352  		return true;
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  353  	}
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  354  
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  355  	spin_unlock(&zsl->lock);
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  356  	return false;
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  357  }
e27af3f9360ee1 Sergey Senozhatsky 2025-03-03  358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
