Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B11CDFD5
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126382; cv=none; b=DBEF9X9a50Q0d09cnOI6PJ9yfLENIga5jkbUIUpioWvOB0w49Slht+qVZmnln+BAgmE3d99aw7Zg+3HiG8Yy05P4j7ysdvkHiVyddAHVUuZj32vcXb/Jx/qZAOnjx1Uznrsqf96VCNG1pq3cVgrVKWWNa/gVeGYnwGNdZ+iY+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126382; c=relaxed/simple;
	bh=Y2UYsoyUZc1X38wnLmD+PX8Ggh9fob7Iz6r+qcvmKEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nrbv0Khh/GFrAuJGTRr0cyyg5FgGTZtnLiCc8GsprCthoMgPF7WLn3H5yGkRcBus51GbEbVhnqfWEZxClxYRaSK+XCobXq8DhIAd8EmfenxNW7dlwtbBeujRzl5wyjTt4G0jbt7D1z1ahYkUnmKt+tc2b7t3LVWt+hyR1eKSRdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4TndqAw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4TndqAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763126380; x=1794662380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2UYsoyUZc1X38wnLmD+PX8Ggh9fob7Iz6r+qcvmKEI=;
  b=i4TndqAwx9W8SFnzL/gPD2+jcbP0N/FA/zNBuVurJGFtMHtjbmTy1PYC
   hgiTlxzOAmLsu34a62bWaEQqGIt8wuhHX62ZfXoPge4utfZ1JStxLQgwY
   b66og2jfLt2lK/hEukAHAVsAieSCmdazljzKTJRxfUEMJsJ/Pfjcub8If
   Q65FQI1nigkQb1MZQH6XZbm/+V6LcRulgE4IFVP6gI5b5z05L5zLIbfGv
   pCJf5kzOlt73YMWuGwbuhPSVEu522oTlsuDhAGOo5DTT6ENCC4wLxvhgU
   eYV/X58yzvFCvwTKva0nZMSvPTP+2lb9NDNOTu5pKWkbV1A4lfZsigody
   w==;
X-CSE-ConnectionGUID: Mbvc8MndRxSKHho0DidF5g==
X-CSE-MsgGUID: C/QFgw52QZmKEoVExrUdLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="87866165"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="87866165"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:19:40 -0800
X-CSE-ConnectionGUID: ZnpwQqkrT9e6IBQAZ1BEmg==
X-CSE-MsgGUID: Uw+1EDc4Q56/BqGduwqf3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189975820"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2025 05:19:39 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJtiC-0006bt-1I;
	Fri, 14 Nov 2025 13:19:36 +0000
Date: Fri, 14 Nov 2025 21:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:bcachefs-testing 756/875]
 fs/bcachefs/btree/cache.c:737:6-8: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202511142117.yBx4IM74-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ab3c04679170b0e63c55680f725ceb4218b2b04c
commit: aee3cb0d7dc17b4c6b123c100c460bb07ea89ecd [756/875] bcachefs: btree cache: kill gotos
:::::: branch date: 16 hours ago
:::::: commit date: 8 days ago
config: um-randconfig-r061-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142117.yBx4IM74-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511142117.yBx4IM74-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/cache.c:737:6-8: WARNING: possible condition with no effect (if == else)

vim +737 fs/bcachefs/btree/cache.c

1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  730  
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  731  int bch2_btree_cache_cannibalize_lock(struct btree_trans *trans, struct closure *cl)
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  732  {
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  733  	struct bch_fs *c = trans->c;
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  734  	int ret = __btree_cache_cannibalize_lock(c, cl);
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  735  	if (!ret)
a564c9fad58197 fs/bcachefs/btree_cache.c Kent Overstreet 2023-12-02  736  		trace_and_count(c, btree_cache_cannibalize_lock, trans);
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31 @737  	else if (cl)
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  738  		trace_and_count(c, btree_cache_cannibalize_lock_fail, trans);
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  739  	else
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  740  		trace_and_count(c, btree_cache_cannibalize_lock_fail, trans);
aee3cb0d7dc17b fs/bcachefs/btree/cache.c Kent Overstreet 2025-10-31  741  	return ret;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  742  }
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
