Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B585254B03
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772887457; cv=none; b=HkN5EC77/fU/07ThY1xX+Bev7XNLXthbmRe2UD/joZKwQ+ccq1ra51wud0XcpFClv8Jogc28CMIMjXXIuzi4IMP+pfdwr01UHOR7fgrb4zM5GjMyJ8ypNUj7+aZtptleHl6N/t0cpSYGGUaR8axDhALq4Q541qvOg5AdgZXdq3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772887457; c=relaxed/simple;
	bh=ylIwR2BpmRY29TgqzNvMC+C0l0CDeg7gGPIZqZjH0Q8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FSuz45sYTc0o0x3cbDbvkLgK97T5T7knVv2hXxss3mnyiTWV3qZzGg/J6cvKI7yFqLRJeCMM8uCsS32pThxw5PJHHcBMRbtJClsmaRlLXBn4RWiwJbGcdlyw3REEYAFvfAXNEOpWSxKR2LouG0l6ghIq780je3cl/pXjkRmJI1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AchUhRXy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AchUhRXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772887454; x=1804423454;
  h=date:from:to:cc:subject:message-id;
  bh=ylIwR2BpmRY29TgqzNvMC+C0l0CDeg7gGPIZqZjH0Q8=;
  b=AchUhRXyiKl4EtYYySiwBE1Wgxgd6pe39lq0mlekFK5Paa19aqLrJ8Eb
   bty4AqXcLX7ws+DDUfmjApsFv5+J7Rcz8xPkA8ZfZASjgzGWZjgbh0Smr
   /ULrCLYWKnhc/1te2yb6Ogpam1W6bKx++qoZLEzjd7cEJc1LdEyZq5lQF
   ebu/WYOB/FSO++/JCuxTW6Op2A58d0E1mIUhFakwYe7pccBkeL9fSM970
   eBRpK6IeKjuqC/16gieoQEVEO3JZgcVvvvwDJGUGvyRik0WixchWymn+5
   X280CaDghtG00y+Pq0WmlDAZphgbpnOMKebS3PVzXeMy60a21XMwTHtjq
   g==;
X-CSE-ConnectionGUID: PT/aScCCSUWLd8a5KT6RLA==
X-CSE-MsgGUID: fPjcoWQjRh2TzI4YCEZGyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="99449716"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="99449716"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 04:44:13 -0800
X-CSE-ConnectionGUID: ArX5I3U/Qdidoj2KIIljkw==
X-CSE-MsgGUID: QP8BG+RGQcKJG6//q/IYMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="242289285"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2026 04:44:12 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyr0s-000000001z1-0Xz1;
	Sat, 07 Mar 2026 12:44:10 +0000
Date: Sat, 07 Mar 2026 20:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 71/471] kernel/dma/debug.c:775 filter_write()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202603072011.ZdTRyOVG-lkp@intel.com>
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
:::::: branch date: 25 hours ago
:::::: commit date: 34 hours ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260307/202603072011.ZdTRyOVG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603072011.ZdTRyOVG-lkp@intel.com/

smatch warnings:
kernel/dma/debug.c:775 filter_write() warn: potential spectre issue 'buf' [w]

vim +/buf +775 kernel/dma/debug.c

8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  756  
db55ad0fd65c64d kernel/dma/debug.c Jens Axboe    2024-04-08  757  static ssize_t filter_write(struct kiocb *iocb, struct iov_iter *from)
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  758  {
db55ad0fd65c64d kernel/dma/debug.c Jens Axboe    2024-04-08  759  	size_t count = iov_iter_count(from);
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  760  	char buf[NAME_MAX_LEN];
c17e2cf7376a201 lib/dma-debug.c    Joerg Roedel  2009-06-08  761  	unsigned long flags;
c17e2cf7376a201 lib/dma-debug.c    Joerg Roedel  2009-06-08  762  	size_t len;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  763  	int i;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  764  
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  765  	/*
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  766  	 * We can't copy from userspace directly. Access to
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  767  	 * current_driver_name is protected with a write_lock with irqs
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  768  	 * disabled. Since copy_from_user can fault and may sleep we
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  769  	 * need to copy to temporary buffer first
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  770  	 */
e7ed70eedccc78e lib/dma-debug.c    Joerg Roedel  2009-06-08  771  	len = min(count, (size_t)(NAME_MAX_LEN - 1));
db55ad0fd65c64d kernel/dma/debug.c Jens Axboe    2024-04-08  772  	if (!copy_from_iter_full(buf, len, from))
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  773  		return -EFAULT;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  774  
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22 @775  	buf[len] = 0;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  776  
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  777  	write_lock_irqsave(&driver_name_lock, flags);
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  778  
312325094785566 lib/dma-debug.c    Joerg Roedel  2009-06-08  779  	/*
312325094785566 lib/dma-debug.c    Joerg Roedel  2009-06-08  780  	 * Now handle the string we got from userspace very carefully.
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  781  	 * The rules are:
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  782  	 *         - only use the first token we got
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  783  	 *         - token delimiter is everything looking like a space
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  784  	 *           character (' ', '\n', '\t' ...)
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  785  	 *
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  786  	 */
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  787  	if (!isalnum(buf[0])) {
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  788  		/*
312325094785566 lib/dma-debug.c    Joerg Roedel  2009-06-08  789  		 * If the first character userspace gave us is not
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  790  		 * alphanumerical then assume the filter should be
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  791  		 * switched off.
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  792  		 */
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  793  		if (current_driver_name[0])
f737b095c60c635 kernel/dma/debug.c Robin Murphy  2018-12-10  794  			pr_info("switching off dma-debug driver filter\n");
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  795  		current_driver_name[0] = 0;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  796  		current_driver = NULL;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  797  		goto out_unlock;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  798  	}
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  799  
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  800  	/*
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  801  	 * Now parse out the first token and use it as the name for the
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  802  	 * driver to filter for.
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  803  	 */
39a37ce1cc5eef4 lib/dma-debug.c    Dan Carpenter 2010-04-06  804  	for (i = 0; i < NAME_MAX_LEN - 1; ++i) {
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  805  		current_driver_name[i] = buf[i];
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  806  		if (isspace(buf[i]) || buf[i] == ' ' || buf[i] == 0)
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  807  			break;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  808  	}
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  809  	current_driver_name[i] = 0;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  810  	current_driver = NULL;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  811  
f737b095c60c635 kernel/dma/debug.c Robin Murphy  2018-12-10  812  	pr_info("enable driver filter for driver [%s]\n",
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  813  		current_driver_name);
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  814  
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  815  out_unlock:
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  816  	write_unlock_irqrestore(&driver_name_lock, flags);
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  817  
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  818  	return count;
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  819  }
8a6fc708b9bb48a lib/dma-debug.c    Joerg Roedel  2009-05-22  820  

:::::: The code at line 775 was first introduced by commit
:::::: 8a6fc708b9bb48a79a385bdc2be0959ee2ab788d dma-debug: add debugfs file for driver filter

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
