Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065879DC
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366328; cv=none; b=ZrRopXJKZQ7E0J3HSfL5ESab23E9dmO7lMdIOu6lt1GtQou6wAzWHOWoaNa4KkDOjiEc9tm8nIa+c6e4RUetOYAiy4AQa2TXxK456zm2o2mG+4i8gFh1+KUt+/EtiB++8TJTlFzagVfuZeDUD5xPuyLwzZlEmIMzwcQR7KpssaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366328; c=relaxed/simple;
	bh=vLgpCIl3qsTn+Z5DSIqWPQUx1/NoD6OByNQfSHFnHd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=muiCMOBs1bGGRKFtHXnc4JOPxo4jt7HAZxUgyhQdjLXX3fYE3i4UMcVAU2OgNf114h33vIkC/mH+zpybArpdCOYGSjzVEdHAV79531wtHMgb3P70kJBgqNX3mYK0QxY5PaWioGzxnEXFoNZjOR7YhXgJgVjnfUTO0PLdGZ8F6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGU6CdXr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGU6CdXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733366326; x=1764902326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLgpCIl3qsTn+Z5DSIqWPQUx1/NoD6OByNQfSHFnHd0=;
  b=lGU6CdXrQCWIwIpi72xkpBqT4vm+tI5+r1Xk/sF+Xlr5m1YQCtnzDG5/
   /H2c+bV6QWgpwS0TGvGONC3ivWWduFiooX1fUKE1kDiGsUH02BLflNygM
   1l3SGt1nBJHb+EffVrNpqRiehj+rLep/+SgIgRPzyazQy/V7KlP/VWVpc
   tj/gPuP4pBqR/c+3KhNZTFHToJUFeCr/vZrsYrcX87I1T+gIh0VRSdlsy
   PvAj/kdbwzjdaonAxU6ov15S8DoA/ZF7i4QEsavjmJGzYKdIXEV+XTUQ4
   u7ODOPZv2sxPA6fxeCz7uX3Alku/k3CzqkUU8LL8MXwpbny4rSrcheLET
   w==;
X-CSE-ConnectionGUID: 7TRkXPbSSm+c33wdoW4c9Q==
X-CSE-MsgGUID: y2esglKRTMmusDFh0PPoyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45048125"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="45048125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 18:38:45 -0800
X-CSE-ConnectionGUID: astNHpUqQamSebktwso8RA==
X-CSE-MsgGUID: KEiF8Sp3RSagPkWJCNsPlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94789797"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 18:38:45 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ1l8-0003hJ-0h;
	Thu, 05 Dec 2024 02:38:34 +0000
Date: Thu, 5 Dec 2024 10:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bigeasy-staging:futex_local_v4 7/11] kernel/futex/core.c:1364
 futex_hash_is_invariant() warn: signedness bug returning '(-22)'
Message-ID: <202412051021.huhObpLe-lkp@intel.com>
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
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v4
head:   e259acd3e886368666385efb91f818174ea67e7a
commit: f660409ae182f97b143c93355f4bb216db994f62 [7/11] futex: Allow to make the number of slots invariant.
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051021.huhObpLe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412051021.huhObpLe-lkp@intel.com/

smatch warnings:
kernel/futex/core.c:1364 futex_hash_is_invariant() warn: signedness bug returning '(-22)'

vim +1364 kernel/futex/core.c

f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1354  
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1355  bool futex_hash_is_invariant(void)
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1356  {
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1357  	struct futex_hash_bucket_private *hb_p;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1358  	struct mm_struct *mm;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1359  
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1360  	mm = current->mm;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1361  	guard(rcu)();
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1362  	hb_p = rcu_dereference(mm->futex_hash_bucket);
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1363  	if (!hb_p)
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03 @1364  		return -EINVAL;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1365  	return hb_p->slots_invariant;
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1366  }
f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
