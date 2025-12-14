Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF00221726
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 03:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765684550; cv=none; b=fF2SbGmDEAx4E9RPKFrORClqDTqZ9Fi3jYJ8JKe5NbBiWqadcwlWg7hivyw6Gz0L5p2iHl0WyryBQxVnA493dwAYBHqYt1auKpB6KT6InsrwaR0Zk++QMW/oyaSPZlYEsisDLJA93rrsa9TdlSLLGFEZ2JbyYTEyYccbaM3G7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765684550; c=relaxed/simple;
	bh=OKFtnPbGhdFgvTTMZh2MkPZgzC/XDA3wOa2+ROnlO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGLlgBj2YH1lJ0rXr4j5s92IFdMX1CrRTXDaRZv1ICtUh8rRBJpBZMe6QMoSwCr9N3reBx+AZvSOckowseXDlQRQmRMlGLB/3arozPLwXrKc+Fpvpd84hDtenu+Cqu/LyjstvWNPI+KW4b8m2jhTo/0NIxql8s+IrIJkiVvQgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f38KoE/X; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f38KoE/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765684548; x=1797220548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKFtnPbGhdFgvTTMZh2MkPZgzC/XDA3wOa2+ROnlO8k=;
  b=f38KoE/XS4TCQP26zd9gSkGB9u/T/xyhdLjS9rPT5XbC79ysdA5cUWX5
   h7snlKlxQh9pi5jL+lYwrlXLPqANYPlfqndthISTRDBO0DPC2t/Wesneo
   vfo6cahI5qUsvlmZv0Q3O4Xt/CrujhhV9Aqo1twkJkzpy4kpvm7uSFIh2
   XO3KX+kyCFgLT0D8M8LaHCpy014aw0Ay197WwX9rjpRtTV+/qqJ2Di8aA
   d1e6ON3QIVWoqL/sLqCdr4kMVqyTJ3pqbXk1aV11NPJ+mhxMrIQaSGMTH
   HbuM4c5H6iuJ7RGiWXjtPNA6ln/AeCYMC2koXTQWr7XxKbNWbqcsLkNGa
   g==;
X-CSE-ConnectionGUID: pkUFhIeBTMWkTUxPR9EqDA==
X-CSE-MsgGUID: KIFNtzg8T7ebZpYF43qtrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90283654"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="90283654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:55:48 -0800
X-CSE-ConnectionGUID: X2hgRqw5SgCfQwIQ1GYhUQ==
X-CSE-MsgGUID: ZRbJ9og5RBmx4ecpSZONxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="234827947"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 19:55:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUdCy-000000008Xx-0YJh;
	Sun, 14 Dec 2025 03:55:44 +0000
Date: Sun, 14 Dec 2025 11:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/test/efi_test.c:364 efi_runtime_get_waketime()
 error: uninitialized symbol 'pending'.
Message-ID: <202512141139.LPW4cFJi-lkp@intel.com>
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
TO: Ivan Hu <ivan.hu@canonical.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 3dcb524d785373fd43b129f01f32bd394fe167e0 efi/efi_test: Fix missing pending status update in getwakeuptime
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141139.LPW4cFJi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141139.LPW4cFJi-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/test/efi_test.c:364 efi_runtime_get_waketime() error: uninitialized symbol 'pending'.

Old smatch warnings:
drivers/firmware/efi/test/efi_test.c:360 efi_runtime_get_waketime() error: uninitialized symbol 'enabled'.
drivers/firmware/efi/test/efi_test.c:533 efi_runtime_get_nexthighmonocount() error: uninitialized symbol 'count'.

vim +/pending +364 drivers/firmware/efi/test/efi_test.c

ff6301dabc3ca2 Ivan Hu 2016-08-25  335  
ff6301dabc3ca2 Ivan Hu 2016-08-25  336  static long efi_runtime_get_waketime(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  337  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  338  	struct efi_getwakeuptime __user *getwakeuptime_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  339  	struct efi_getwakeuptime getwakeuptime;
ff6301dabc3ca2 Ivan Hu 2016-08-25  340  	efi_bool_t enabled, pending;
ff6301dabc3ca2 Ivan Hu 2016-08-25  341  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  342  	efi_time_t efi_time;
ff6301dabc3ca2 Ivan Hu 2016-08-25  343  
ff6301dabc3ca2 Ivan Hu 2016-08-25  344  	getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  345  	if (copy_from_user(&getwakeuptime, getwakeuptime_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  346  				sizeof(getwakeuptime)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  347  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  348  
ff6301dabc3ca2 Ivan Hu 2016-08-25  349  	status = efi.get_wakeup_time(
ff6301dabc3ca2 Ivan Hu 2016-08-25  350  		getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  351  		getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  352  		getwakeuptime.time ? &efi_time : NULL);
ff6301dabc3ca2 Ivan Hu 2016-08-25  353  
ff6301dabc3ca2 Ivan Hu 2016-08-25  354  	if (put_user(status, getwakeuptime.status))
ff6301dabc3ca2 Ivan Hu 2016-08-25  355  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  356  
ff6301dabc3ca2 Ivan Hu 2016-08-25  357  	if (status != EFI_SUCCESS)
ff6301dabc3ca2 Ivan Hu 2016-08-25  358  		return -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  359  
ff6301dabc3ca2 Ivan Hu 2016-08-25  360  	if (getwakeuptime.enabled && put_user(enabled,
ff6301dabc3ca2 Ivan Hu 2016-08-25  361  						getwakeuptime.enabled))
ff6301dabc3ca2 Ivan Hu 2016-08-25  362  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  363  
3dcb524d785373 Ivan Hu 2025-03-31 @364  	if (getwakeuptime.pending && put_user(pending,
3dcb524d785373 Ivan Hu 2025-03-31  365  						getwakeuptime.pending))
3dcb524d785373 Ivan Hu 2025-03-31  366  		return -EFAULT;
3dcb524d785373 Ivan Hu 2025-03-31  367  
ff6301dabc3ca2 Ivan Hu 2016-08-25  368  	if (getwakeuptime.time) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  369  		if (copy_to_user(getwakeuptime.time, &efi_time,
ff6301dabc3ca2 Ivan Hu 2016-08-25  370  				sizeof(efi_time_t)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  371  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  372  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  373  
ff6301dabc3ca2 Ivan Hu 2016-08-25  374  	return 0;
ff6301dabc3ca2 Ivan Hu 2016-08-25  375  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  376  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
