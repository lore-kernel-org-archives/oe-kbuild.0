Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80712512FD
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031200; cv=none; b=o4s9JNcHZL+akOYAsKgKEqFs1m9nNoW67mBhjDsnum4gJj59layBEsEd1PRmBMrlqahNwkSjOc74rnxdzJJanWb1Kv0cPjkul18gg2++ZIuM/ZhOgG9k6DLQS7GMvX2AyxdnFYZ9nCZNX0CHG/dIOVFdajXvkeez+zf9jqdaKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031200; c=relaxed/simple;
	bh=Pshsk/crBjfnLcTAifquv2vsE14uvgrYa8796Jy4foM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgWsvWgyihxs5dakZMA1fJTBiygaBNaItkbu96lzONVdXk35EPM7EH8gWiQy6NA51XA/zz0TImGTY/MVNr+JYLrNalG3WWsRbXdxj2d2X4JP7zPW0HW0+rDuWLkVlw2zH4OAbISn5EVAR5+xzan0el3zRl1afy7BDMZR/gp6na4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALqZxEfr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALqZxEfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744031199; x=1775567199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pshsk/crBjfnLcTAifquv2vsE14uvgrYa8796Jy4foM=;
  b=ALqZxEfr/w3oowPYzJ4RYr7F5G1ixEWUOtcZoWSfoEU8MuABuIWyCFZb
   DD4S3fruDiExIX6tDTrLmmSBqfAaA/To7VoIf3BUEUjDh2PT9gNOcI0mu
   NP3uNByPAB8u7xmWn0/JRN3t23+0Qa+LtBcAgqTQSML7NMZC50K6MQYoI
   YGe6gnF2+WZhriRWijxnYkk8j/I+5hGC7cOB+iXd4fKrxlFhnd7Y54DHI
   r2EmsGTouYlgEgI2ONlnKjAlEbiV6em9atDxbzey6YinHfw8fnwSqwHIN
   3AoZ2yTJHpONFTo4suJpqKwglTo2a5tLNWD9UXJKP4PswObzk48AEsvME
   w==;
X-CSE-ConnectionGUID: syKQpoI7S2ehr0fg8WHBxg==
X-CSE-MsgGUID: djKOHuRETliaxKGM3cB89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49210650"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49210650"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:06:38 -0700
X-CSE-ConnectionGUID: EN4WzkmDQYmj7fkhU7odrQ==
X-CSE-MsgGUID: jwq/0cRbREac4+HmBJz7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132084818"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2025 06:06:36 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1mBO-0003Pj-0X;
	Mon, 07 Apr 2025 13:06:34 +0000
Date: Mon, 7 Apr 2025 21:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/zsmalloc.c:352:2-8: preceding lock on line 347
Message-ID: <202504072032.LG1Y32Pk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: e27af3f9360ee130b7ab0b274088f92146a0855b zsmalloc: sleepable zspage reader-lock
date:   3 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r061-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072032.LG1Y32Pk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504072032.LG1Y32Pk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/zsmalloc.c:352:2-8: preceding lock on line 347

vim +352 mm/zsmalloc.c

e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  342  
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  343  static __must_check bool zspage_write_trylock(struct zspage *zspage)
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  344  {
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  345  	struct zspage_lock *zsl = &zspage->zsl;
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  346  
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03 @347  	spin_lock(&zsl->lock);
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  348  	if (zsl->cnt == ZS_PAGE_UNLOCKED) {
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  349  		zsl->cnt = ZS_PAGE_WRLOCKED;
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  350  		rwsem_acquire(&zsl->dep_map, 0, 1, _RET_IP_);
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  351  		lock_acquired(&zsl->dep_map, _RET_IP_);
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03 @352  		return true;
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  353  	}
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  354  
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  355  	spin_unlock(&zsl->lock);
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  356  	return false;
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  357  }
e27af3f9360ee13 Sergey Senozhatsky 2025-03-03  358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
