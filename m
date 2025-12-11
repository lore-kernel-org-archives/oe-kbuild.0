Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2488214A64
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 22:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765493877; cv=none; b=upRI6PMjLOmWy009SRrS03wOkhvU58joJ3ME4Qa0Q7fCNN0zfq3vrxsb50BSwNZfg8HS8fy00LOh/wRkcd5qcU2E5bNHKdlcgbF4uKbdeDvhKDZPgv3cT0hzvMgX6BTSXGixyB/2TAR3z0L65EJ88cUSSFRiQV8+vofomkvDR/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765493877; c=relaxed/simple;
	bh=re6GQrkO6ds4u+s6br8Zt18ika/j7tt/g6aNhdhX6jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zvo4asoBfHU7kD3Rm1PNF/KCtzdqstN3c+wyYj4cyCwwUhYkKuUPdMovm5SamII9wjTnfy3xTGFUhVru1f4+XyAUjfDfq29xn8YJG6RTz7mGhLXQyfOfVmdSrMXaI/xHu9MMoP5VQDv894vlRegv1fbgC2I5VYofEGmdRs4/AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGuLkXPz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGuLkXPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765493876; x=1797029876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=re6GQrkO6ds4u+s6br8Zt18ika/j7tt/g6aNhdhX6jY=;
  b=KGuLkXPzPKHyZSpj6YPrJAK9WLfuzfhz7p7AgtzCE+XEMlEWgxP1tz2C
   9bCz+SOtjBlI5yDboq4s3DRaTP4sLVRT70IoV4foxNWOoPploItcN9Nkz
   3X/cTI5clXnbsoWcjsGcbKs5cd7ifpoScSgWMUPncQPvD+LV+gd/kqB06
   x/PKCiJ6ZhjA5mVZbxqkhZsLcKWgbQ9VFCS/Vwg7aNRdS6CDh8IlYJFnN
   7wXvLHFWgludwH4bwd5qmRYBpyHwu0VyP0jqo965sLwjz6uxkL4KCwcTS
   evcHw1Iw81wj+cF5NdYunDzwSw6v03SzF6iPn9uS3fQt0eVMOZwIrIqr0
   w==;
X-CSE-ConnectionGUID: OqDrov+sRAyuBOZ8aShsgw==
X-CSE-MsgGUID: wHPV6UHQQFmavRrXV1BaKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78949411"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78949411"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:57:54 -0800
X-CSE-ConnectionGUID: N/HBeHJhTLG5DEq2ZZLeyA==
X-CSE-MsgGUID: mZZG0KyyQNe6DZwiF0O4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201086678"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 14:57:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpbZ-000000005AP-3RVJ;
	Thu, 11 Dec 2025 22:57:49 +0000
Date: Fri, 12 Dec 2025 06:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/afs/dir_search.c:155 afs_dir_search_bucket() warn: potential
 spectre issue 'block->dirents' [r] (local cap)
Message-ID: <202512120622.av4gYfkD-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: a5b5beebcf96d5e8a2fc79856c2ac1e93f82478e afs: Use the contained hashtable to search a directory
date:   12 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120622.av4gYfkD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120622.av4gYfkD-lkp@intel.com/

smatch warnings:
fs/afs/dir_search.c:155 afs_dir_search_bucket() warn: potential spectre issue 'block->dirents' [r] (local cap)

vim +155 fs/afs/dir_search.c

a5b5beebcf96d5 David Howells 2024-12-16  119  
a5b5beebcf96d5 David Howells 2024-12-16  120  /*
a5b5beebcf96d5 David Howells 2024-12-16  121   * Search through a directory bucket.
a5b5beebcf96d5 David Howells 2024-12-16  122   */
a5b5beebcf96d5 David Howells 2024-12-16  123  int afs_dir_search_bucket(struct afs_dir_iter *iter, const struct qstr *name,
a5b5beebcf96d5 David Howells 2024-12-16  124  			  struct afs_fid *_fid)
a5b5beebcf96d5 David Howells 2024-12-16  125  {
a5b5beebcf96d5 David Howells 2024-12-16  126  	const union afs_xdr_dir_block *meta;
a5b5beebcf96d5 David Howells 2024-12-16  127  	unsigned int entry;
a5b5beebcf96d5 David Howells 2024-12-16  128  	int ret = -ESTALE;
a5b5beebcf96d5 David Howells 2024-12-16  129  
a5b5beebcf96d5 David Howells 2024-12-16  130  	meta = afs_dir_find_block(iter, 0);
a5b5beebcf96d5 David Howells 2024-12-16  131  	if (!meta)
a5b5beebcf96d5 David Howells 2024-12-16  132  		return -ESTALE;
a5b5beebcf96d5 David Howells 2024-12-16  133  
a5b5beebcf96d5 David Howells 2024-12-16  134  	entry = ntohs(meta->meta.hashtable[iter->bucket & (AFS_DIR_HASHTBL_SIZE - 1)]);
a5b5beebcf96d5 David Howells 2024-12-16  135  	_enter("%x,%x", iter->bucket, entry);
a5b5beebcf96d5 David Howells 2024-12-16  136  
a5b5beebcf96d5 David Howells 2024-12-16  137  	while (entry) {
a5b5beebcf96d5 David Howells 2024-12-16  138  		const union afs_xdr_dir_block *block;
a5b5beebcf96d5 David Howells 2024-12-16  139  		const union afs_xdr_dirent *dire;
a5b5beebcf96d5 David Howells 2024-12-16  140  		unsigned int blnum = entry / AFS_DIR_SLOTS_PER_BLOCK;
a5b5beebcf96d5 David Howells 2024-12-16  141  		unsigned int slot = entry % AFS_DIR_SLOTS_PER_BLOCK;
a5b5beebcf96d5 David Howells 2024-12-16  142  		unsigned int resv = (blnum == 0 ? AFS_DIR_RESV_BLOCKS0 : AFS_DIR_RESV_BLOCKS);
a5b5beebcf96d5 David Howells 2024-12-16  143  
a5b5beebcf96d5 David Howells 2024-12-16  144  		_debug("search %x", entry);
a5b5beebcf96d5 David Howells 2024-12-16  145  
a5b5beebcf96d5 David Howells 2024-12-16  146  		if (slot < resv) {
a5b5beebcf96d5 David Howells 2024-12-16  147  			kdebug("slot out of range h=%x rs=%2x sl=%2x-%2x",
a5b5beebcf96d5 David Howells 2024-12-16  148  			       iter->bucket, resv, slot, slot + iter->nr_slots - 1);
a5b5beebcf96d5 David Howells 2024-12-16  149  			goto bad;
a5b5beebcf96d5 David Howells 2024-12-16  150  		}
a5b5beebcf96d5 David Howells 2024-12-16  151  
a5b5beebcf96d5 David Howells 2024-12-16  152  		block = afs_dir_find_block(iter, blnum);
a5b5beebcf96d5 David Howells 2024-12-16  153  		if (!block)
a5b5beebcf96d5 David Howells 2024-12-16  154  			goto bad;
a5b5beebcf96d5 David Howells 2024-12-16 @155  		dire = &block->dirents[slot];
a5b5beebcf96d5 David Howells 2024-12-16  156  
a5b5beebcf96d5 David Howells 2024-12-16  157  		if (slot + iter->nr_slots <= AFS_DIR_SLOTS_PER_BLOCK &&
a5b5beebcf96d5 David Howells 2024-12-16  158  		    memcmp(dire->u.name, name->name, name->len) == 0 &&
a5b5beebcf96d5 David Howells 2024-12-16  159  		    dire->u.name[name->len] == '\0') {
a5b5beebcf96d5 David Howells 2024-12-16  160  			_fid->vnode  = ntohl(dire->u.vnode);
a5b5beebcf96d5 David Howells 2024-12-16  161  			_fid->unique = ntohl(dire->u.unique);
a5b5beebcf96d5 David Howells 2024-12-16  162  			ret = entry;
a5b5beebcf96d5 David Howells 2024-12-16  163  			goto found;
a5b5beebcf96d5 David Howells 2024-12-16  164  		}
a5b5beebcf96d5 David Howells 2024-12-16  165  
a5b5beebcf96d5 David Howells 2024-12-16  166  		iter->prev_entry = entry;
a5b5beebcf96d5 David Howells 2024-12-16  167  		entry = ntohs(dire->u.hash_next);
a5b5beebcf96d5 David Howells 2024-12-16  168  		if (!--iter->loop_check) {
a5b5beebcf96d5 David Howells 2024-12-16  169  			kdebug("dir chain loop h=%x", iter->bucket);
a5b5beebcf96d5 David Howells 2024-12-16  170  			goto bad;
a5b5beebcf96d5 David Howells 2024-12-16  171  		}
a5b5beebcf96d5 David Howells 2024-12-16  172  	}
a5b5beebcf96d5 David Howells 2024-12-16  173  
a5b5beebcf96d5 David Howells 2024-12-16  174  	ret = -ENOENT;
a5b5beebcf96d5 David Howells 2024-12-16  175  found:
a5b5beebcf96d5 David Howells 2024-12-16  176  	if (iter->block) {
a5b5beebcf96d5 David Howells 2024-12-16  177  		kunmap_local(iter->block);
a5b5beebcf96d5 David Howells 2024-12-16  178  		iter->block = NULL;
a5b5beebcf96d5 David Howells 2024-12-16  179  	}
a5b5beebcf96d5 David Howells 2024-12-16  180  
a5b5beebcf96d5 David Howells 2024-12-16  181  bad:
a5b5beebcf96d5 David Howells 2024-12-16  182  	if (ret == -ESTALE)
a5b5beebcf96d5 David Howells 2024-12-16  183  		afs_invalidate_dir(iter->dvnode, afs_dir_invalid_iter_stale);
a5b5beebcf96d5 David Howells 2024-12-16  184  	_leave(" = %d", ret);
a5b5beebcf96d5 David Howells 2024-12-16  185  	return ret;
a5b5beebcf96d5 David Howells 2024-12-16  186  }
a5b5beebcf96d5 David Howells 2024-12-16  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
