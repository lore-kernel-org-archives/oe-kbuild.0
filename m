Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CA1A6814
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188904; cv=none; b=aMsAK72/Z9yZWNA8Zh4YfQFOV/PCHEzoNUXxVkNZU2Lhf0dXO8zaviF8Zcl3QmDQiO6lf4WZne/kpWt3Dru1M+ys8F7pPfu7yF4sArGJnqIIXSY2jrfosmDkQ236EXzBJwW46JzcVkZn8EFIyc35GbRDuVlnyMSY71qfqRoYn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188904; c=relaxed/simple;
	bh=LL7SlhObMNdFx9HejzqbsyYo3rUXdDyAoMjJ44NJ+KQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nIyim2xkgR/Xt7vjljv1aPL98Ei2b1GnoE8DjQY8WCQqTJnCg6u0VJVxYLrY2M1mNvJNc8O8q0CeGP98HkBfSiPhSjOhBeGN8py8qR1O/51lw8cJQ4W98ErissRoXgyMEJJ/daV1ZpHjtFscYncvwZqRRwBxFfUL3/KP2BDTFCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8oiyvGw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8oiyvGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773188903; x=1804724903;
  h=date:from:to:cc:subject:message-id;
  bh=LL7SlhObMNdFx9HejzqbsyYo3rUXdDyAoMjJ44NJ+KQ=;
  b=N8oiyvGwyCKx5kmXFGoGbpZQ4L0KnoNNy8q/ruT+BzXASWfxa4ciyUvh
   F7S6rk0r5UH+cQSRW/ttsnP/MyTlGgs0KzSn7NXqYTMZ/m+BQSAhDWwCz
   9umwOfU8j3wUAZ/CnBBjpw5MrU+FmbkosgJApmCJTTm6/0xZAddQ6jWQZ
   Ia3P1QM/WS0QCNZtXpOSotToKTuvtq18CFzGhEMD99BgNgYdVF7qOE8JD
   WTYrbadhMDBAWHB8QBq9XXS40ngBGL8wVyX6tyw0ZWxN0cLwK8qDVwh7/
   0NsjDXCi50Db3VvMyhZ03+8KaQuMBG8xlegGTx4W90wm0LD+uxsPeww8J
   A==;
X-CSE-ConnectionGUID: 4RDriqOtS6Oqsu5wiFRxdw==
X-CSE-MsgGUID: 7X7eCb8aTsiq1pmzul/D9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96864994"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96864994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:28:23 -0700
X-CSE-ConnectionGUID: yPL8Ku+HS3uG3oFRnxDrWA==
X-CSE-MsgGUID: YZh7QHloSr+Fx4Aq6JQG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243304220"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 17:28:21 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w07Qx-000000000RL-0bFG;
	Wed, 11 Mar 2026 00:28:19 +0000
Date: Wed, 11 Mar 2026 08:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 71/471] kernel/dma/debug.c:775 filter_write()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202603110801.iq3ceDLm-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260311/202603110801.iq3ceDLm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603110801.iq3ceDLm-lkp@intel.com/

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
