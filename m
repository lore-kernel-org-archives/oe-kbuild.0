Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F83EBF10
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417242; cv=none; b=XprYBptql36IbqBgVxdSkTrsefxpJ7X3Qz2y3WK0SGfMtGPLcOGmqH3WKwvxO706OysyEAegCHFqP4F24NKg/+R0XKAbS7mQKnOr9NVEibKyqOwewfbNbUB2hFRtkQ4auPY/sJFKvNxKDVpuaK916BCqKuc/uQDmQ0ECJT3ORy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417242; c=relaxed/simple;
	bh=yTYiAWWAmoh9hnN/yjkxBMG99CyYXgFvFhcIjtpCcfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wi11dIclsBHCtDIoeJrttllh9RJLoK7PEXoV9cothpaPxkorP2bjl3yDLbyXZFAt12pwALlDYjv8iE0qEcoLtKYKD/WOwegotenIl/nurrNRcfPz0cnSj1vuRnqE/bHKYkiaOp4Mxs7+X269LW/lwRIGZfIUmKokvwY6QOsTib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ib8KhKMe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ib8KhKMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769417240; x=1800953240;
  h=date:from:to:cc:subject:message-id;
  bh=yTYiAWWAmoh9hnN/yjkxBMG99CyYXgFvFhcIjtpCcfQ=;
  b=ib8KhKMesUzcjdU1V5IIJNQCXEvY5aAJHXunA3tQFufjmw/Q/jwoLq6w
   5CVXQ1kMUulK0pBQRYfSbsx9SlnweuROmrZFwkiiJg/RPJNz4B3sDqLCW
   B3PY/x1walJhHhwc/dADJjd7e1Fudi/+/9vEU0TTq5ZGfMy4Xd0LtF+G1
   Ql5utJ37/28CBzw+09hRLOQpK1x1wJbjxx14rx93zo0wNhJD1k6EfNicC
   wh1cPJUMaRlk7N9WbiTz9fslZOq2fG5xFwauSca/AJ3hEtRjVAOZeZ+dv
   nIXXyTrn+fRHV2c1dMOJJLlsYYUxhQ4VXixn/E9G4FRMjSiSjHqO0NUSJ
   A==;
X-CSE-ConnectionGUID: a2vEwuvvSXeiaE4WM2ZC7Q==
X-CSE-MsgGUID: XvDuEWJpSZewLGvTB9znYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70635427"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70635427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 00:47:20 -0800
X-CSE-ConnectionGUID: MX5z+ZvpQS+/b56KWy7isQ==
X-CSE-MsgGUID: mnHgUbEtQVm/msX0ELEr5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="245239499"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 00:47:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkIFg-00000000X74-0AeE;
	Mon, 26 Jan 2026 08:47:16 +0000
Date: Mon, 26 Jan 2026 16:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/extents.c:1227 bch2_extent_ptr_set_cached() warn: variable
 dereferenced before check 'ptr' (see line 1201)
Message-ID: <202601261630.caWGFEy7-lkp@intel.com>
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
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/799] bcachefs: move data code to subdir
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261630.caWGFEy7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601261630.caWGFEy7-lkp@intel.com/

New smatch warnings:
fs/bcachefs/data/extents.c:1227 bch2_extent_ptr_set_cached() warn: variable dereferenced before check 'ptr' (see line 1201)
fs/bcachefs/data/write.c:953 bch2_write_prep_encoded_data() warn: missing unwind goto?

Old smatch warnings:
fs/bcachefs/data/write.c:770 bch2_write_endio() error: we previously assumed 'ca' could be null (see line 752)

vim +/ptr +1227 fs/bcachefs/data/extents.c

a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1191  
a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1192  void bch2_extent_ptr_set_cached(struct bch_fs *c,
39b7fa9e35f413 fs/bcachefs/extents.c Kent Overstreet 2025-08-23  1193  				struct bch_inode_opts *opts,
a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1194  				struct bkey_s k,
a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1195  				struct bch_extent_ptr *ptr)
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1196  {
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1197  	struct bkey_ptrs ptrs;
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1198  	union bch_extent_entry *entry;
a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1199  	struct extent_ptr_decoded p;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1200  	bool have_cached_ptr;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04 @1201  	unsigned drop_dev = ptr->dev;
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1202  
18dad454cd16cb fs/bcachefs/extents.c Kent Overstreet 2025-05-24  1203  	guard(rcu)();
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1204  restart_drop_ptrs:
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1205  	ptrs = bch2_bkey_ptrs(k);
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1206  	have_cached_ptr = false;
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1207  
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1208  	bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1209  		/*
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1210  		 * Check if it's erasure coded - stripes can't contain cached
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1211  		 * data. Possibly something we can fix in the future?
a34eef6dd17946 fs/bcachefs/extents.c Kent Overstreet 2024-10-20  1212  		 */
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1213  		if (&entry->ptr == ptr && p.has_ec)
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1214  			goto drop;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1215  
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1216  		if (p.ptr.cached) {
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1217  			if (have_cached_ptr || !want_cached_ptr(c, opts, &p.ptr)) {
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1218  				bch2_bkey_drop_ptr_noerror(k, &entry->ptr);
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1219  				ptr = NULL;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1220  				goto restart_drop_ptrs;
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1221  			}
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1222  
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1223  			have_cached_ptr = true;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1224  		}
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1225  	}
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1226  
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04 @1227  	if (!ptr)
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1228  		bkey_for_each_ptr(ptrs, ptr2)
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1229  			if (ptr2->dev == drop_dev)
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1230  				ptr = ptr2;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1231  
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1232  	if (have_cached_ptr || !want_cached_ptr(c, opts, ptr))
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1233  		goto drop;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1234  
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1235  	ptr->cached = true;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1236  	return;
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1237  drop:
39430cfd27ed2e fs/bcachefs/extents.c Kent Overstreet 2025-05-04  1238  	bch2_bkey_drop_ptr_noerror(k, ptr);
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1239  }
c9163bb03b81e4 fs/bcachefs/extents.c Kent Overstreet 2023-02-21  1240  

:::::: The code at line 1227 was first introduced by commit
:::::: 39430cfd27ed2e1243374ea28479773506e119c3 bcachefs: Improve bch2_extent_ptr_set_cached()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
