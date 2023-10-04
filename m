Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47206101FB
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Oct 2023 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696416532; x=1727952532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4f/RXHCKQvehMqrkYoJ1FYJt3tCQtpZQbhzsQrEBZjs=;
  b=HJYMQgdShdw2HPmMht+wWBb1n2kHqRZkehm9Itx/wUMDlAd2fDHGt9M4
   I7AMxZ5/6Oo9yE+unPCGHf5kTdz9F4P+MnTUpoQgP+3jq8fnarRi15jaV
   nnKS50Te5195BcsUPvZo0KzSc7ZOZK8y5/FUrAnwZ56czj7wDEg/LGgot
   Hv5GWB7HxcGOyAJRenIaduRmHcjwL+fOpdT6DIubbPai6JivuSIJceumD
   Ak+NSFDtH+jHZeRRgd+fE4tvzfC1kNK0DkSJjPQqah5sbwi7q2PxZvn3u
   wcqHOprZsPPDfpJlmzkeCFIlYeozwauD5qNVW7saiQtXOmiojoLs7td86
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380408133"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="380408133"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 03:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727951715"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="727951715"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Oct 2023 03:48:49 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnzQt-000HVD-0S;
	Wed, 04 Oct 2023 10:48:47 +0000
Date: Wed, 4 Oct 2023 18:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7909/9570] fs/ntfs3/bitmap.c:662 wnd_init() warn:
 Please consider using kvcalloc instead of kvmalloc_array
Message-ID: <202310041837.OerQ8qKC-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33b64befb1a28bca3f5a9ed9807d2f87e976c63a
commit: fc471e39e38fea6677017cbdd6d928088a59fc67 [7909/9570] fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)
:::::: branch date: 5 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231004/202310041837.OerQ8qKC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310041837.OerQ8qKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310041837.OerQ8qKC-lkp@intel.com/

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
