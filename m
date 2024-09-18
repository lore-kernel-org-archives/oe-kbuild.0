Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8572027442
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726631818; cv=none; b=rFvSZ9WduviR452iXDhG7CQ63kTyWeQR8fsAkp3SOV492ymCJ0tU302WPmFJFQQTj7hrCFFweWu4iM6BhhdwY4x6j0nSHzrS1+etqc2BA6lOUXOP635vDoG3gi/3Llj/gyCFHkgMSOm+MgWEsJa0v/SknzvIsuxR+KBVUT3hw2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726631818; c=relaxed/simple;
	bh=nsMoetFQwknIbdivpr+dDQNmgQrSnSJqqQkhfITBerE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYlhVurVM/D6kWtZ4w5ooz2IviGm5BDC5XeOmjZYypdUJPKiS2eC6TD5R8T0b0sNjXuBByAoVhwRnnHR+kih30VFIEC79QtgvgU1Ifz7KmdTHlnmr1FJx0KyO5PVLPI0qaeSLcRi147f4yr8FPU5FabdXANlmCizIq0s0WmEUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXMeP9nv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXMeP9nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726631815; x=1758167815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nsMoetFQwknIbdivpr+dDQNmgQrSnSJqqQkhfITBerE=;
  b=AXMeP9nv5y6X2zmt5jt4JpnxenEY5g2V9pQIGNuVWzAL2XB2vVrX3riq
   OwHdrZzv87LCJNLMZKA6Vz9RKDe7hTFpzZDFG5x3NGzopYtzkXQiNSo40
   LLYdIQ63cuAUKLYjbOLtlPb/K4219IkEmZA7xYtQf7EGxDjAmqJP9cduF
   jtJorWxvPnSh3xEwwd1B2bsWgZNLQUw0oFDcnURCH5lQmQacY5BNIkzTm
   lYBTlMWUzgDsYjmf9l73BKis3iMLuLq+sFW3tK9zSWvruOM74t2jHpTwB
   FPm0WJIG5EHLC2MU3nd2OCCLoQpfeLkWdryvzUbVTz16AKUmEKYHJq4kB
   A==;
X-CSE-ConnectionGUID: M6Tg0z+SQwSvo4GvV/gqtQ==
X-CSE-MsgGUID: E/sPmcmCSG6CzuBmvC7m8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25398570"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25398570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 20:56:54 -0700
X-CSE-ConnectionGUID: x8UOoaEsQN26fI00RN8q+Q==
X-CSE-MsgGUID: 5VlHVrJtRAqXbSAfUQq+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73962808"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2024 20:56:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqloB-000Bqo-15;
	Wed, 18 Sep 2024 03:56:51 +0000
Date: Wed, 18 Sep 2024 11:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/proc/task_mmu.c:2300 pagemap_scan_get_args() warn: potential user
 controlled sizeof overflow 'arg->vec_len * 24' '0-u64max * 24'
Message-ID: <202409181144.TgGvE9jj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Andrei Vagin <avagin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f27fce67173bbb05d5a0ee03dae5c021202c912
commit: 52526ca7fdb905a768a93f8faa418e9b988fc34b fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20240917 (https://download.01.org/0day-ci/archive/20240918/202409181144.TgGvE9jj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409181144.TgGvE9jj-lkp@intel.com/

smatch warnings:
fs/proc/task_mmu.c:2300 pagemap_scan_get_args() warn: potential user controlled sizeof overflow 'arg->vec_len * 24' '0-u64max * 24'

vim +2300 fs/proc/task_mmu.c

52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2272  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2273  static int pagemap_scan_get_args(struct pm_scan_arg *arg,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2274  				 unsigned long uarg)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2275  {
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2276  	if (copy_from_user(arg, (void __user *)uarg, sizeof(*arg)))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2277  		return -EFAULT;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2278  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2279  	if (arg->size != sizeof(struct pm_scan_arg))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2280  		return -EINVAL;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2281  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2282  	/* Validate requested features */
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2283  	if (arg->flags & ~PM_SCAN_FLAGS)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2284  		return -EINVAL;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2285  	if ((arg->category_inverted | arg->category_mask |
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2286  	     arg->category_anyof_mask | arg->return_mask) & ~PM_SCAN_CATEGORIES)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2287  		return -EINVAL;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2288  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2289  	arg->start = untagged_addr((unsigned long)arg->start);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2290  	arg->end = untagged_addr((unsigned long)arg->end);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2291  	arg->vec = untagged_addr((unsigned long)arg->vec);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2292  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2293  	/* Validate memory pointers */
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2294  	if (!IS_ALIGNED(arg->start, PAGE_SIZE))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2295  		return -EINVAL;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2296  	if (!access_ok((void __user *)(long)arg->start, arg->end - arg->start))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2297  		return -EFAULT;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2298  	if (!arg->vec && arg->vec_len)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2299  		return -EINVAL;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21 @2300  	if (arg->vec && !access_ok((void __user *)(long)arg->vec,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2301  			      arg->vec_len * sizeof(struct page_region)))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2302  		return -EFAULT;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2303  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2304  	/* Fixup default values */
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2305  	arg->end = ALIGN(arg->end, PAGE_SIZE);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2306  	arg->walk_end = 0;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2307  	if (!arg->max_pages)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2308  		arg->max_pages = ULONG_MAX;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2309  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2310  	return 0;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2311  }
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
