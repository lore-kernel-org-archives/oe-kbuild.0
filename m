Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CA4C92
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 05:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772946956; cv=none; b=hD95JcsmJPNlYVyBWfKkBKzqlTZq36idbQrauiZVSKi7h5qLyljEGcHptEv8STRbF+jVgdSAHcnBUj+tmMiV+n8XNxYdFBD82OjFwZpg8hbVQWrNSGCRdw2+S4FfFh4RD/fwMyUNn/mJQ87B9JmrMDeGgNPXihh7DT2+OWm81vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772946956; c=relaxed/simple;
	bh=mTGmt4KDwp7aK1StajAzAdLu+B1B0FPSf0oRa6z+cDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gSD41oX2JhFx3Kvw+rS3se5H+BOiHyh3m4webKN7w2Rk6ZdzZ9X1OwEEWTtjj7GJGjir9S/OVzYJ+gnKqcn4HtGPNMLzfSKOETtI/2PyjHrw6m8khGyYsvqFj2zJH64I3UzauLacsZWutbXb3pCe1PB2pS6fVAQVZa6OmfO3GbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4ht7MAi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4ht7MAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772946955; x=1804482955;
  h=date:from:to:cc:subject:message-id;
  bh=mTGmt4KDwp7aK1StajAzAdLu+B1B0FPSf0oRa6z+cDc=;
  b=L4ht7MAiHSn4qTABd13o5sozLuW3tsdCG6QIAYW3ui6zlL4Rz78QmwJ+
   AIITobl9WbAsDn0aVGHft+z/9ox5OA0ZRjH24wHyahb4U1FOHMmYfiaMD
   sB1jJCzImDd9GhehiGXa/BRa2lPg4mDZR7wZAv42pSTJGWdxvViq3D5iE
   aiuzqxGYOfvvRv0wrazO64Ph4fVm4FcRniP9JW/xP6FOUR57VeTORV4Fw
   gNygNJrgxQgDEucMYS4/sq5o3eJwZu75Y2eUU5VUI39N2pnqzK2K0duGw
   gsJhvRlG9dWqT7YrfzDMA3lYmX1k+2tfvnkgy8KD2be2iK9tY2rAOnMIB
   w==;
X-CSE-ConnectionGUID: vOtcbA5MTROGm/Bbs98Y2Q==
X-CSE-MsgGUID: KW80cH/6SsezBq89f1phVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="84329406"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="84329406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 21:15:54 -0800
X-CSE-ConnectionGUID: FA3x7Ku+TNSZ7tjeYrYrjA==
X-CSE-MsgGUID: 48/rSISHQ1mBSswoJNjOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223528558"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2026 21:15:53 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz6UY-000000002vF-0o9A;
	Sun, 08 Mar 2026 05:15:50 +0000
Date: Sun, 08 Mar 2026 13:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 71/471] kernel/dma/debug.c:775 filter_write()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202603081355.2PyKPc2I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: db55ad0fd65c64db85d76db88cc2549d6aa1f98c [71/471] dma-debug: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260308/202603081355.2PyKPc2I-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603081355.2PyKPc2I-lkp@intel.com/

smatch warnings:
kernel/dma/debug.c:775 filter_write() warn: potential spectre issue 'buf' [w]

vim +/buf +775 kernel/dma/debug.c

8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  756  
db55ad0fd65c64 kernel/dma/debug.c Jens Axboe    2024-04-08  757  static ssize_t filter_write(struct kiocb *iocb, struct iov_iter *from)
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  758  {
db55ad0fd65c64 kernel/dma/debug.c Jens Axboe    2024-04-08  759  	size_t count = iov_iter_count(from);
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  760  	char buf[NAME_MAX_LEN];
c17e2cf7376a20 lib/dma-debug.c    Joerg Roedel  2009-06-08  761  	unsigned long flags;
c17e2cf7376a20 lib/dma-debug.c    Joerg Roedel  2009-06-08  762  	size_t len;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  763  	int i;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  764  
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  765  	/*
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  766  	 * We can't copy from userspace directly. Access to
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  767  	 * current_driver_name is protected with a write_lock with irqs
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  768  	 * disabled. Since copy_from_user can fault and may sleep we
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  769  	 * need to copy to temporary buffer first
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  770  	 */
e7ed70eedccc78 lib/dma-debug.c    Joerg Roedel  2009-06-08  771  	len = min(count, (size_t)(NAME_MAX_LEN - 1));
db55ad0fd65c64 kernel/dma/debug.c Jens Axboe    2024-04-08  772  	if (!copy_from_iter_full(buf, len, from))
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  773  		return -EFAULT;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  774  
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22 @775  	buf[len] = 0;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  776  
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  777  	write_lock_irqsave(&driver_name_lock, flags);
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  778  
31232509478556 lib/dma-debug.c    Joerg Roedel  2009-06-08  779  	/*
31232509478556 lib/dma-debug.c    Joerg Roedel  2009-06-08  780  	 * Now handle the string we got from userspace very carefully.
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  781  	 * The rules are:
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  782  	 *         - only use the first token we got
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  783  	 *         - token delimiter is everything looking like a space
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  784  	 *           character (' ', '\n', '\t' ...)
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  785  	 *
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  786  	 */
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  787  	if (!isalnum(buf[0])) {
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  788  		/*
31232509478556 lib/dma-debug.c    Joerg Roedel  2009-06-08  789  		 * If the first character userspace gave us is not
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  790  		 * alphanumerical then assume the filter should be
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  791  		 * switched off.
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  792  		 */
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  793  		if (current_driver_name[0])
f737b095c60c63 kernel/dma/debug.c Robin Murphy  2018-12-10  794  			pr_info("switching off dma-debug driver filter\n");
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  795  		current_driver_name[0] = 0;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  796  		current_driver = NULL;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  797  		goto out_unlock;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  798  	}
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  799  
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  800  	/*
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  801  	 * Now parse out the first token and use it as the name for the
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  802  	 * driver to filter for.
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  803  	 */
39a37ce1cc5eef lib/dma-debug.c    Dan Carpenter 2010-04-06  804  	for (i = 0; i < NAME_MAX_LEN - 1; ++i) {
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  805  		current_driver_name[i] = buf[i];
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  806  		if (isspace(buf[i]) || buf[i] == ' ' || buf[i] == 0)
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  807  			break;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  808  	}
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  809  	current_driver_name[i] = 0;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  810  	current_driver = NULL;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  811  
f737b095c60c63 kernel/dma/debug.c Robin Murphy  2018-12-10  812  	pr_info("enable driver filter for driver [%s]\n",
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  813  		current_driver_name);
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  814  
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  815  out_unlock:
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  816  	write_unlock_irqrestore(&driver_name_lock, flags);
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  817  
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  818  	return count;
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  819  }
8a6fc708b9bb48 lib/dma-debug.c    Joerg Roedel  2009-05-22  820  

:::::: The code at line 775 was first introduced by commit
:::::: 8a6fc708b9bb48a79a385bdc2be0959ee2ab788d dma-debug: add debugfs file for driver filter

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
