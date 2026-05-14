Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C638BF62
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757738; cv=none; b=UnYgo8Lbou0KQlpJjoOcq+uzyg3RiNreGudLvV3/SkkKgZOG4vzySayWqzP4Ak7zcVjva6jufBGY7zjUB3xmAbZIVHrthAENNuZ5ZRRwwCbyY2/hHy0J3e/eZpgTp9eJcPcf3FGQjn0SvdmIPnLWiScydBWkKzACE52iiuz1sJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757738; c=relaxed/simple;
	bh=fkoR+4nTCd1WMrs+UTxfP2I/q4eJawNVU72RppIYp58=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xi+yrHsXK7eU+RyLE+0FlakXuavsy8/YGhD3XxwtOe2AXBEKApGrcj/BA7rc1l58Oz5xg601snQRnwxn6cj4tTm7ieYBj0//AhqwOEYOeOPWEB8D6JTQjel3sivu1MX9D3fnn4T6RTF7uKWtm1HARA2TkE500mKSgIw/J7KKwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ek/p/NZC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek/p/NZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778757736; x=1810293736;
  h=date:from:to:cc:subject:message-id;
  bh=fkoR+4nTCd1WMrs+UTxfP2I/q4eJawNVU72RppIYp58=;
  b=ek/p/NZCFQHfZi5CAYLV0WgqwrFLKsuKxX5CmXZx+xzkKarWksVamuZ9
   tJy770+Z2H35be7hxtUDNusg0nudiuf4hKAZD8JJnZpp8zA7o+tU/hRm4
   0KIqZYLQB5m4SP9zauArkfXv2JuNdxFlheasXZqYne3tcCerg4/A7d5EL
   BvB30N/U+3V/sVzu7IIjvIEi2ZO91155D2i+LUMITB3Y+XLMN5J3CMXKQ
   uBDs7m5yDs0W2jMtCg8u2qDVmlX/hSu1ddliR/A7RdDY+vHqDRUbHpt6r
   P9Fq97TAQByAka6pG1Z/xWR3ZL9TcnQH1jbSXR+3vYVJ9DV8ICHhQwuUy
   Q==;
X-CSE-ConnectionGUID: 1GHqTchrS0WR+oiMy0aXFg==
X-CSE-MsgGUID: wXMcQrdES42Jt93chPZy5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105156464"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="105156464"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:22:15 -0700
X-CSE-ConnectionGUID: 1Wa4OX/qQCe2CHC0pH3KZg==
X-CSE-MsgGUID: Wpc9ctkeT+ibyZdnTnhTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235718449"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 04:22:14 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNU8p-000000006PX-2noZ;
	Thu, 14 May 2026 11:22:11 +0000
Date: Thu, 14 May 2026 19:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 518/799]
 fs/bcachefs/init/chardev.c:249 bch2_ioctl_disk_remove() warn: 'ca' can also
 be NULL
Message-ID: <202605141930.GaeWbclM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 383cf0dacfb4922419e7d38a3c22766d62fddc05 [518/799] bcachefs: more __free() conversion
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141930.GaeWbclM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141930.GaeWbclM-lkp@intel.com/

New smatch warnings:
fs/bcachefs/init/chardev.c:249 bch2_ioctl_disk_remove() warn: 'ca' can also be NULL

Old smatch warnings:
fs/bcachefs/init/chardev.c:557 bch2_ioctl_query_accounting() warn: potential user controlled sizeof overflow 'arg.accounting_u64s * 8' '0-u32max * 8'

vim +/ca +249 fs/bcachefs/init/chardev.c

ebb0fa27bb872bf fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  229  
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  230  static long bch2_ioctl_disk_remove(struct bch_fs *c, struct bch_ioctl_disk arg)
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  231  {
a515d0a50c6e8bb fs/bcachefs/chardev.c Tobias Geerinckx-Rice 2021-07-04  232  	if (!capable(CAP_SYS_ADMIN))
a515d0a50c6e8bb fs/bcachefs/chardev.c Tobias Geerinckx-Rice 2021-07-04  233  		return -EPERM;
a515d0a50c6e8bb fs/bcachefs/chardev.c Tobias Geerinckx-Rice 2021-07-04  234  
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  235  	if ((arg.flags & ~(BCH_FORCE_IF_DATA_LOST|
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  236  			   BCH_FORCE_IF_METADATA_LOST|
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  237  			   BCH_FORCE_IF_DEGRADED|
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  238  			   BCH_BY_INDEX)) ||
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  239  	    arg.pad)
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  240  		return -EINVAL;
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  241  
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet       2025-07-14  242  	struct bch_dev *ca = bch2_device_lookup(c, arg.dev, arg.flags);
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  243  	if (IS_ERR(ca))
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  244  		return PTR_ERR(ca);
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  245  
c72d1fe6d352961 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  246  	CLASS(printbuf, err)();
c72d1fe6d352961 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  247  	int ret = bch2_dev_remove(c, ca, arg.flags, &err);
c72d1fe6d352961 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  248  	if (ret)
c72d1fe6d352961 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18 @249  		bch_err(ca, "%s", err.buf);
c72d1fe6d352961 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  250  	return ret;
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  251  }
1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  252  

:::::: The code at line 249 was first introduced by commit
:::::: c72d1fe6d3529612bb93391e29c5658acdf0e568 bcachefs: Plumb a printbuf for error strings through ioctls

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
