Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96E22CBE6
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766352199; cv=none; b=grCpvL75ecXgAtCBx9SNiMSbOpbW3U6pG9qgqijhEruyWU6E22hbIKT/l1h/9oehnkFU6XA3Oe4YV5la2FCbwECuN3WOd1aI91FnAaBohBlaUZAT2P13gD57A7mWE2k4xulF5hs5Wz8ymz5Q3UMF3Ojwkz9urxK8oU6NTeR4gM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766352199; c=relaxed/simple;
	bh=BoJHOGT6U3scuV2XV7Zi7VOIzFXM3RQhTNiQ3Uh9krE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwIn4a/2m79pB6mtOj9VVl4FB+6gwCGsFKahoKS4leBALN/J37F/otQV48c+cbN/qu3dvXbuueQDvjlAK7c1K6G3Ca8xvVxCa/yG5nWghWmOmdrA67LuRT+lDw1+Injr57Khh4w/dbavjhD79JqaokMdJwtnSrA9Tq6G98a56Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/jPFq6Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/jPFq6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766352197; x=1797888197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoJHOGT6U3scuV2XV7Zi7VOIzFXM3RQhTNiQ3Uh9krE=;
  b=a/jPFq6Q5wc/CQMJtJDFlpwN5RN1YxGyDRg2gQENBebddpSPAxGxfp9Z
   VorCiSNElLOv33GCyZ5s5fNwp4X95gMwRp/e7rJyqqftstb/iVOQoOFry
   YRFoziqU82BwlShkB9Nma4R37DU2XOGnBcihe6aD9BYk/9K7e4VzTbIpV
   5brMnt90jy2UxLHPEJ8Rt3BrHiyusDfYE3X6rJOc3kHmQoJbDm+3yeb77
   bx0sHqGtqyh+1cNFo6hBL7521LnFuirrVp4kclIEIfVJDV/+8d3QTj7fv
   rmR9ZNscnPxcM4La0qUgcFns4gyPQPxrraafkaoZBmZ/+SdUMPsGXs1Vu
   A==;
X-CSE-ConnectionGUID: t92NPnloR4Os/uUpIXUTcQ==
X-CSE-MsgGUID: l9o0NR1rSs2UqgMxvzDyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68372892"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68372892"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:23:16 -0800
X-CSE-ConnectionGUID: fyZIIke0TSm/vG8nkQULew==
X-CSE-MsgGUID: 0IqPcslxRoOLpBYhEnZvtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204436171"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 13:23:16 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXQtV-000000000BV-0GGv;
	Sun, 21 Dec 2025 21:23:13 +0000
Date: Mon, 22 Dec 2025 05:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/zsmalloc.c:352:2-8: preceding lock on line 347
Message-ID: <202512220524.fii0TsXx-lkp@intel.com>
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
head:   9094662f6707d1d4b53d18baba459604e8bb0783
commit: e27af3f9360ee130b7ab0b274088f92146a0855b zsmalloc: sleepable zspage reader-lock
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r051-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220524.fii0TsXx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512220524.fii0TsXx-lkp@intel.com/

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
