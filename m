Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF13947A6
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617690; cv=none; b=Y6zcc788cRAhyBXtiQjpcSJJrFyQ2egAkR6vF8FraLtzAJ8leJzivbZmzbaW663M10VrHz7pXxgLeMcRp6V8Dyqiue/LBdDNbGc17a+NGV7MiE7seYuXrG9RaQ7QsmhQGc2HGbL9virTxc5HslMchZwe/uTy9XUx+cJP9sHa5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617690; c=relaxed/simple;
	bh=NVNDXFXqSn6iDMVt1g5uV9pHXifd5SzKMC+HEhVxWfs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2DWdnmShY9A11i0kIqCunmuI2TNVZ8+S730LLp2ug1mvAfC4fi+bt24FyxUWRfQdy9WfHdXQptSqMrkp0zqAcVP92BCCJNay+xUsutTHbJnXAXgzm9xf4PjzR+hvC+h4xc1SgCcearlERDLloe/F3dRaHF1Sf2wEl8bNrBvv9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n11cEXNT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n11cEXNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772617688; x=1804153688;
  h=date:from:to:cc:subject:message-id;
  bh=NVNDXFXqSn6iDMVt1g5uV9pHXifd5SzKMC+HEhVxWfs=;
  b=n11cEXNTezzfhTVUTdfQSrRcax4mPHswzxELg+Y1fUImidqP7waZJZmk
   RLGb6AQbctZW9F9SEk6iBG5FNzn8zZtIGpYuwQxnIT6wqaepMb4CD2vGU
   NMrrOw7jDRtfvRocdTsWljPzSpFAsA8lcxEAcIas9TEyU8i+sNubK63LZ
   ohZjRjbb1JF2BDkKsKvjd/bXqDjmIr9yVrecBzgaQDEj4lLg4poN8yT3L
   RcUU2PNkmQ7NnDtggAIiz9s2rf/j1u/GQS7niOSCEny1I7/HR+xNoChMP
   GF6IhCmGOcDuf+NU4VuhknY2EotCwt16TmRPkqdeyA614Ys8M2VGHg8Vv
   Q==;
X-CSE-ConnectionGUID: 4id0Z8qnSCq39ODgjx4ijw==
X-CSE-MsgGUID: NNf+AoYdSHCBw3/1gLrnXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73639751"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73639751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 01:47:34 -0800
X-CSE-ConnectionGUID: cuzvh63OTRqU+yfWncEiHA==
X-CSE-MsgGUID: /5JRnaSKQ46npbSceJ8aDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218257105"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2026 01:47:32 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxipF-000000003Yx-475e;
	Wed, 04 Mar 2026 09:47:29 +0000
Date: Wed, 04 Mar 2026 17:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/namespace.c:1421 mntput_no_expire() warn: inconsistent
 returns 'rcu_read'.
Message-ID: <202603041703.TBnBkJZU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mateusz Guzik <mjguzik@gmail.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
commit: bfef6e1f3488fc09ae966cb4dd2cb09f73cff791 fs: move mntput_no_expire() slowpath into a dedicated routine
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260304 (https://download.01.org/0day-ci/archive/20260304/202603041703.TBnBkJZU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603041703.TBnBkJZU-lkp@intel.com/

New smatch warnings:
fs/namespace.c:1421 mntput_no_expire() warn: inconsistent returns 'rcu_read'.

Old smatch warnings:
fs/namespace.c:2833 may_change_propagation() warn: inconsistent indenting

vim +/rcu_read +1421 fs/namespace.c

b3e19d924b6eaf Nicholas Piggin 2011-01-07  1403  
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1404  static void mntput_no_expire(struct mount *mnt)
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1405  {
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1406  	rcu_read_lock();
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1407  	if (likely(READ_ONCE(mnt->mnt_ns))) {
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1408  		/*
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1409  		 * Since we don't do lock_mount_hash() here,
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1410  		 * ->mnt_ns can change under us.  However, if it's
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1411  		 * non-NULL, then there's a reference that won't
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1412  		 * be dropped until after an RCU delay done after
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1413  		 * turning ->mnt_ns NULL.  So if we observe it
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1414  		 * non-NULL under rcu_read_lock(), the reference
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1415  		 * we are dropping is not the final one.
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1416  		 */
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1417  		mnt_add_count(mnt, -1);
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1418  		rcu_read_unlock();
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1419  		return;
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1420  	}
bfef6e1f3488fc Mateusz Guzik   2025-11-14 @1421  	mntput_no_expire_slowpath(mnt);
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1422  }
bfef6e1f3488fc Mateusz Guzik   2025-11-14  1423  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
