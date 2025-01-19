Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E34F9F8
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737246313; cv=none; b=vAgV56P2YINTppieO4EjNcOZgdwh2jy6+cjwV60gR8rnwmF7y1vUMCUmyOnvGtrWJh+BmdS5m8ea8KggWY3i58CLxnPVUqAu2GS3jJiqnjyr8ZlBXCl3N8D83baRN3im1dGhgwKVKg/RS5x0dI9KvkjQHlfgDYy8ACzQOVJCO7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737246313; c=relaxed/simple;
	bh=K4jee26wYU3kv2snZpqxn8MceNJAIkThBnRQGW0YoFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPPD80jk1HfUkODHa3omXV1JxD3ImWR8gK/Pz2d19K1ikRWZeEg7ILtdmGsmzYA/aw/En73qBCw8la1oko0l2WWQu/8w9zqVWCh5HMpUzkMyPWscufxw7uWnc3YW6mFQXGdhBmULg2YoLz3tm9yJLAgy7VAxtELuPekDe1Myvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3Vsr9nt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3Vsr9nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737246312; x=1768782312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K4jee26wYU3kv2snZpqxn8MceNJAIkThBnRQGW0YoFU=;
  b=V3Vsr9ntQOv5tweVeFo5LiBEXZu31uXx8TqNofoAx+knEK+9ew+m1F3S
   SI1gZgESmJ4htEcWdyjHWHR9q7gdG1GOdgTnyznrflMXiY57OdCuQzVgH
   pdIOJtO4Kv0BbbYg0j/RGagF3hUImS+1vhIwl3Ddhk54kPdgsOl741JRq
   az2LF15RukJP2k/s+FylHD1FhsrE2EzUNa79NKM/f19rCaIZCSv+A5Nrr
   XL/wS8u356TjuukDMYj34BTCwvDISeK/xzmVOAyytt0T6tdp/uKR5O2rO
   SI6CrX56Cs5LgW3YFyD4reRH4L+PheVxllBMiPl6h9UwAZcBMtBqaFiMv
   Q==;
X-CSE-ConnectionGUID: XfM7ZVZzR7qIhiTr+lJFOw==
X-CSE-MsgGUID: imH/Klu9RuqKQEA+CFRz9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49062033"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49062033"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 16:25:11 -0800
X-CSE-ConnectionGUID: 25cngmyYQkC0/6x3AWuizw==
X-CSE-MsgGUID: 4y9cmXu7RZmImFMP4yjeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110188715"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2025 16:24:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZJ6w-000Uxf-26;
	Sun, 19 Jan 2025 00:24:18 +0000
Date: Sun, 19 Jan 2025 08:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8757/9563] lib/lockref.c:123
 lockref_put_or_lock() warn: inconsistent returns '&lockref->lock'.
Message-ID: <202501190838.ngNIl2tX-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 57bd981b2db79db581a6baae42ddf6436174a924 [8757/9563] lockref: use bool for false/true returns
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250117 (https://download.01.org/0day-ci/archive/20250119/202501190838.ngNIl2tX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501190838.ngNIl2tX-lkp@intel.com/

smatch warnings:
lib/lockref.c:123 lockref_put_or_lock() warn: inconsistent returns '&lockref->lock'.

vim +123 lib/lockref.c

360f54796ed659 Linus Torvalds    2015-01-09  102  
2f4f12e571c4e2 Linus Torvalds    2013-09-02  103  /**
2f4f12e571c4e2 Linus Torvalds    2013-09-02  104   * lockref_put_or_lock - decrements count unless count <= 1 before decrement
44a0cf92926c34 Linus Torvalds    2013-09-07  105   * @lockref: pointer to lockref structure
2f4f12e571c4e2 Linus Torvalds    2013-09-02  106   * Return: 1 if count updated successfully or 0 if count <= 1 and lock taken
2f4f12e571c4e2 Linus Torvalds    2013-09-02  107   */
57bd981b2db79d Christoph Hellwig 2025-01-15  108  bool lockref_put_or_lock(struct lockref *lockref)
2f4f12e571c4e2 Linus Torvalds    2013-09-02  109  {
bc08b449ee14ac Linus Torvalds    2013-09-02  110  	CMPXCHG_LOOP(
bc08b449ee14ac Linus Torvalds    2013-09-02  111  		new.count--;
bc08b449ee14ac Linus Torvalds    2013-09-02  112  		if (old.count <= 1)
bc08b449ee14ac Linus Torvalds    2013-09-02  113  			break;
bc08b449ee14ac Linus Torvalds    2013-09-02  114  	,
57bd981b2db79d Christoph Hellwig 2025-01-15  115  		return true;
bc08b449ee14ac Linus Torvalds    2013-09-02  116  	);
bc08b449ee14ac Linus Torvalds    2013-09-02  117  
2f4f12e571c4e2 Linus Torvalds    2013-09-02  118  	spin_lock(&lockref->lock);
2f4f12e571c4e2 Linus Torvalds    2013-09-02  119  	if (lockref->count <= 1)
57bd981b2db79d Christoph Hellwig 2025-01-15  120  		return false;
2f4f12e571c4e2 Linus Torvalds    2013-09-02  121  	lockref->count--;
2f4f12e571c4e2 Linus Torvalds    2013-09-02  122  	spin_unlock(&lockref->lock);
57bd981b2db79d Christoph Hellwig 2025-01-15 @123  	return true;
2f4f12e571c4e2 Linus Torvalds    2013-09-02  124  }
2f4f12e571c4e2 Linus Torvalds    2013-09-02  125  EXPORT_SYMBOL(lockref_put_or_lock);
e7d33bb5ea8292 Linus Torvalds    2013-09-07  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
