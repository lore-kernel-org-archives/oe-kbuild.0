Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA03ACA4A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064701; cv=none; b=FUMFYZVSZzliVw0w4T5mKVbFz81Ks/2C0W0LHNM6V3ecN4qU8fdUPH9qvkzW/M5oFqLAlT/1oBUAH5xHjttrok8zP0VezSNXu0tRIczF2UGpNx7WPcNEiqk8rdV7zeg54QDqfj2KqGQKgQ/o+WcV5+Uv0lRo+KY4XPge0NRhiHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064701; c=relaxed/simple;
	bh=uY7VACcmmNWAnQlVVq9y4KVxCn1nrZLiDbBO4ugbbyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b7xmqt+P8tgRWV+T2teyBtAdkvMTiMUpt3XceHmnGbE6xTXyZvAyb9h5nHTEuifQal5uMVz41Y1U7aGv6JPI/76y8v8CfsxAYi3MUtsb8/cPlErQjd+QPlPULlQU8RA0nsXunMDaCT0DjX/3CB2bLmqGb+lK2JKHj2LuwMfgVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5vQqvqS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5vQqvqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773064700; x=1804600700;
  h=date:from:to:cc:subject:message-id;
  bh=uY7VACcmmNWAnQlVVq9y4KVxCn1nrZLiDbBO4ugbbyU=;
  b=P5vQqvqSPc1VYnnZTsc7lKwBeHBlj1v1vvPA07UbYAmHPfEqVvzTXIcf
   uxxRyMqvZ7qOAwlJCQFOYptGLj1HPyMApI920gOQcqZxBLurloJREgtK8
   4k6YHQ9k6mnWlgM90B6cIsFW/3HCxaTZZ/l1s2afvUuFKnivSkyReDkFp
   tA99F0dxUiCv/G+xwmF/CL8oH7q8k8MYqzR6bc2FfiY6y6A7kqB05WkPQ
   BIzbbWNC0R8dBDilyw4NHCnt65G75soov3VjQeCzU1zt0H/qG5MMEANqQ
   06WTsIweKT1y8/MlQ9VZHn2EbiqLxgbK39Ne+auYtnMMJBBDtDIXfOozN
   A==;
X-CSE-ConnectionGUID: CRbqkOodSM6WOP+RBboKMQ==
X-CSE-MsgGUID: kA8Oz0x1SS2hbE0USz7clg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="61655865"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="61655865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 06:58:19 -0700
X-CSE-ConnectionGUID: t7jzswDgS3mZ/HUEJXvNUQ==
X-CSE-MsgGUID: mSdNQvWiSTOAtcwT/3oAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224689297"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 06:58:18 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzb7e-000000000IK-2FvT;
	Mon, 09 Mar 2026 13:58:14 +0000
Date: Mon, 09 Mar 2026 21:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 71/471] kernel/dma/debug.c:775 filter_write()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202603092111.GN3EpXVW-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260309/202603092111.GN3EpXVW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603092111.GN3EpXVW-lkp@intel.com/

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
