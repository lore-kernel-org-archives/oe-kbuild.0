Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0330659
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7dxrEFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702061242; x=1733597242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFEdqcxOQBfoJwMzfVsGtBHGYrKGok2rwllzOSi7a5w=;
  b=Z7dxrEFiSk0ahGo4XzlJOGBMfdcywR880RQZBJCjpVchBxYBYbR4rcWi
   UqugAoKpnN3f2+R2gc+yvun7lfCnjbmhAHeu/WRm6/6LUTCk71JNCgcCF
   ayW6/mIOrNTcuk5RfjkNpWmBhlmFEJT+HISs2OshjM4x2BYsAK1EG71OX
   /Vq/4ad8q8NNfF6lEMu3ZC1/QISqD8dZ0qvkQsa0VBCQW5C9cvvX9tkTd
   oHUGwcExXq8MyswrYnBkx7gaqOjStB/2CVHJCp77XmRqXErqWt1gqmJwO
   vU/YZhCW+ZAv47SLtXXbLAoVwG1lhoF9vXOj1Q/sB4MlN9/LIrLsLJscB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1533250"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1533250"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 10:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806492493"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="806492493"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 08 Dec 2023 10:47:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBfsY-000ECV-2c;
	Fri, 08 Dec 2023 18:47:14 +0000
Date: Sat, 9 Dec 2023 02:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ntfs3/bitmap.c:662 wnd_init() warn: Please consider using
 kvcalloc instead of kvmalloc_array
Message-ID: <202312090212.D7ei9V2v-lkp@intel.com>
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
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: fc471e39e38fea6677017cbdd6d928088a59fc67 fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)
date:   2 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231209/202312090212.D7ei9V2v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312090212.D7ei9V2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312090212.D7ei9V2v-lkp@intel.com/

smatch warnings:
fs/ntfs3/bitmap.c:662 wnd_init() warn: Please consider using kvcalloc instead of kvmalloc_array

vim +662 fs/ntfs3/bitmap.c

3f3b442b5ad245 Konstantin Komarov 2021-08-13  642  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  643  int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
3f3b442b5ad245 Konstantin Komarov 2021-08-13  644  {
3f3b442b5ad245 Konstantin Komarov 2021-08-13  645  	int err;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  646  	u32 blocksize = sb->s_blocksize;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  647  	u32 wbits = blocksize * 8;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  648  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  649  	init_rwsem(&wnd->rw_lock);
3f3b442b5ad245 Konstantin Komarov 2021-08-13  650  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  651  	wnd->sb = sb;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  652  	wnd->nbits = nbits;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  653  	wnd->total_zeroes = nbits;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  654  	wnd->extent_max = MINUS_ONE_T;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  655  	wnd->zone_bit = wnd->zone_end = 0;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  656  	wnd->nwnd = bytes_to_block(sb, bitmap_size(nbits));
3f3b442b5ad245 Konstantin Komarov 2021-08-13  657  	wnd->bits_last = nbits & (wbits - 1);
3f3b442b5ad245 Konstantin Komarov 2021-08-13  658  	if (!wnd->bits_last)
3f3b442b5ad245 Konstantin Komarov 2021-08-13  659  		wnd->bits_last = wbits;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  660  
6827d50b2c430c Konstantin Komarov 2022-12-30  661  	wnd->free_bits =
fc471e39e38fea Konstantin Komarov 2023-06-30 @662  		kvmalloc_array(wnd->nwnd, sizeof(u16), GFP_KERNEL | __GFP_ZERO);
fc471e39e38fea Konstantin Komarov 2023-06-30  663  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  664  	if (!wnd->free_bits)
3f3b442b5ad245 Konstantin Komarov 2021-08-13  665  		return -ENOMEM;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  666  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  667  	err = wnd_rescan(wnd);
3f3b442b5ad245 Konstantin Komarov 2021-08-13  668  	if (err)
3f3b442b5ad245 Konstantin Komarov 2021-08-13  669  		return err;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  670  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  671  	wnd->inited = true;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  672  
3f3b442b5ad245 Konstantin Komarov 2021-08-13  673  	return 0;
3f3b442b5ad245 Konstantin Komarov 2021-08-13  674  }
3f3b442b5ad245 Konstantin Komarov 2021-08-13  675  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
