Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035475;
	b=XKdszNp1ZKyeSOVknN82GuxxvzQxI20JXKH1HofQTe7k1HxOJA573s8FBZrbirIOM6ki
	 MYeG8qm/PHL0Tieu5XZ+lVmXMMcvXfIl8iAtbWscYA/PYiYZC0S6cmlEkrDDQhaNfcih1
	 pg849DjKPY5yFAliSarbAIh4yT4BhMlRRKennjcp+8c/zXUzqeEuXKY9i3iBZ5P5ABgKY
	 EeKtnJlcsfC3KDZSi/+ai0ybLIxaNuryWd68eeCaUSmqz6xwPCFIfJJ7mhd7UGgBElNBc
	 XNlhw3h0FaXk9zupW3pYEm0Y000aI2xKR/LZ1KRbXwBpLRrqn+pfmqaezqCnLZX4O8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035475;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9//TzqL6F7SsO9x4vm/fz5zjDk51ZmX9pNBspKBaagg=;
	b=3mx6oS/3YIgp0XgFqj+Jcb5H8xtgl09uIG+TmZNERkrn0sxur14Oy2zbm1ywh6FdmpHa
	 J1hKlfVH1hquK56ylcZVC+fapuQJwP5LfTuBAUB6QEJ9NATxD7MWP5sjsO03v1oFl+nQd
	 1DvPONVteCh9fUBNVb7aQ+ojFZo4umr6Hjf08jIK9bM+HAm40rGQf8yXJIhCrpEucrvQ8
	 lzyGTUWWwEdQpiB+s8JL/vWIpjh8YLKkKZKHtqnNhk7fjhe3DdQEGZS0+T2A1zGuFrEzK
	 ltVrk+YN9euGWlL7kJInxZk7hn8H0uh641I0cVmvnaygtf3CAE7Er2qgH0SZmHHNZfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SeN7Sm+l;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC7606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 07:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SeN7Sm+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794035473; x=1825571473;
  h=date:from:to:cc:subject:message-id;
  bh=9FRndKL+XgyiiwUJlA4GLWoOQ4Ez/Aq9D0mbyURdt3A=;
  b=SeN7Sm+lakxgn3CubahEml4clwnLn5d5pejdoF9b2G1XMaIhukzpttUv
   mgTw9yQBQMjqss/SKH39aReSkcarfnn9Xl06zSMGgG8Jvs3+ft3K39p5z
   QMPJQ9Q8zrI8Ubf8/+5kTOYDqL37Z/9tfBxOBBYRHlE+mM9gf9HGUgmXh
   d3E1Asose5typGeBCU/jmMcgfXW3peeXHEYXkxRyP68/XLIchQs2hRLwR
   mKARwyekrf6er98orb3kT/Rw4bny/nEopMSTEexuJ91/kXh7moRBoXkoa
   KRKkZL7V6JV9LhN1SeHZZz0CjbFe3im/Vv6uxcMc4ZS2l80xmH+bDpjyf
   w==;
X-CSE-ConnectionGUID: VIKKZsy/RW+e36LtDOZdKA==
X-CSE-MsgGUID: ybhMVK8nQKeCbWAbVu7YoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2836817"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2836817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 23:11:13 -0800
X-CSE-ConnectionGUID: KoKOPZ/wRVOKgYmiGzj95w==
X-CSE-MsgGUID: SpsUOijfRR6194bDcXYSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7779632"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2026 23:11:11 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPaZw-00000000Aal-1WUo;
	Sat, 07 Nov 2026 07:11:08 +0000
Date: Sat, 07 Nov 2026 08:10:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [drm-misc:drm-misc-next 15/19]
 drivers/accel/amdxdna/amdxdna_gem.c:380:6-10: ERROR: invalid reference to the
 index variable of the iterator on line 349
Message-ID: <202611070859.5wKjeDOy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: David Zhang <yidong.zhang@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   2d5a8313d9cf989b8f53a5689a96e891bf99fb2c
commit: 2cd0fa4c0f4ed9cba065f64fc11a27e47994806f [15/19] accel/amdxdna: Make populate_range common for AIE2 and AIE4
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-2105-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070859.5wKjeDOy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611070859.5wKjeDOy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/amdxdna_gem.c:380:6-10: ERROR: invalid reference to the index variable of the iterator on line 349

vim +380 drivers/accel/amdxdna/amdxdna_gem.c

e486147c912f65 Lizhi Hou   2025-03-25  335  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  336  int amdxdna_populate_range(struct amdxdna_gem_obj *abo)
2cd0fa4c0f4ed9 David Zhang 2026-10-19  337  {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  338  	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  339  	struct amdxdna_umap *mapp;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  340  	unsigned long timeout;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  341  	struct mm_struct *mm;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  342  	bool found;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  343  	int ret;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  344  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  345  	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  346  again:
2cd0fa4c0f4ed9 David Zhang 2026-10-19  347  	found = false;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  348  	down_write(&xdna->notifier_lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19 @349  	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  350  		/*
2cd0fa4c0f4ed9 David Zhang 2026-10-19  351  		 * Skip entries that have already been unmapped.
2cd0fa4c0f4ed9 David Zhang 2026-10-19  352  		 *
2cd0fa4c0f4ed9 David Zhang 2026-10-19  353  		 * If userspace unmaps the address and later submits I/O using
2cd0fa4c0f4ed9 David Zhang 2026-10-19  354  		 * it, the IOMMU will reject the access and report a fault.
2cd0fa4c0f4ed9 David Zhang 2026-10-19  355  		 * Ignore such entries here.
2cd0fa4c0f4ed9 David Zhang 2026-10-19  356  		 */
2cd0fa4c0f4ed9 David Zhang 2026-10-19  357  		if (mapp->unmapped)
2cd0fa4c0f4ed9 David Zhang 2026-10-19  358  			continue;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  359  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  360  		if (mapp->invalid && kref_get_unless_zero(&mapp->refcnt)) {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  361  			found = true;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  362  			break;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  363  		}
2cd0fa4c0f4ed9 David Zhang 2026-10-19  364  	}
2cd0fa4c0f4ed9 David Zhang 2026-10-19  365  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  366  	if (!found) {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  367  		/*
2cd0fa4c0f4ed9 David Zhang 2026-10-19  368  		 * This also covers the case where all mappings have been
2cd0fa4c0f4ed9 David Zhang 2026-10-19  369  		 * removed. There are no invalid mappings left to process.
2cd0fa4c0f4ed9 David Zhang 2026-10-19  370  		 * Any subsequent I/O using the unmapped address will be
2cd0fa4c0f4ed9 David Zhang 2026-10-19  371  		 * rejected by the IOMMU.
2cd0fa4c0f4ed9 David Zhang 2026-10-19  372  		 */
2cd0fa4c0f4ed9 David Zhang 2026-10-19  373  		abo->mem.map_invalid = false;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  374  		up_write(&xdna->notifier_lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  375  		return 0;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  376  	}
2cd0fa4c0f4ed9 David Zhang 2026-10-19  377  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  378  	up_write(&xdna->notifier_lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  379  
2cd0fa4c0f4ed9 David Zhang 2026-10-19 @380  	mm = mapp->notifier.mm;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  381  	if (!mmget_not_zero(mm)) {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  382  		amdxdna_umap_put(mapp);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  383  		return -EFAULT;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  384  	}
2cd0fa4c0f4ed9 David Zhang 2026-10-19  385  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  386  	mutex_lock(&mapp->lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  387  	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  388  	if (ret) {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  389  		mutex_unlock(&mapp->lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  390  		goto put_mm;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  391  	}
2cd0fa4c0f4ed9 David Zhang 2026-10-19  392  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  393  	down_write(&xdna->notifier_lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  394  	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
2cd0fa4c0f4ed9 David Zhang 2026-10-19  395  		up_write(&xdna->notifier_lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  396  		mutex_unlock(&mapp->lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  397  		amdxdna_umap_put(mapp);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  398  		mmput(mm);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  399  		goto again;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  400  	}
2cd0fa4c0f4ed9 David Zhang 2026-10-19  401  	mapp->invalid = false;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  402  	up_write(&xdna->notifier_lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  403  	mutex_unlock(&mapp->lock);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  404  	amdxdna_umap_put(mapp);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  405  	mmput(mm);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  406  	goto again;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  407  
2cd0fa4c0f4ed9 David Zhang 2026-10-19  408  put_mm:
2cd0fa4c0f4ed9 David Zhang 2026-10-19  409  	amdxdna_umap_put(mapp);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  410  	mmput(mm);
2cd0fa4c0f4ed9 David Zhang 2026-10-19  411  	return ret == -EBUSY ? -ETIME : ret;
2cd0fa4c0f4ed9 David Zhang 2026-10-19  412  }
2cd0fa4c0f4ed9 David Zhang 2026-10-19  413  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
