Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754E52E11C2
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749888498; cv=none; b=WrnY46h+3rwA87QFsoPqtombgCCRu+ir7HeQQ+DN1FoEEfZ2u8iWEsb//YrBjVfSQKQN/w5XUqhUg2rmIiCpLqbPYbiCt4qZWkjhQfwX/F0B28YxZeG7d0aZMN3IxioosXDrIKfv4cCAv3zFzheGzD1Q7j8JRsPFD9/nHSoUB50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749888498; c=relaxed/simple;
	bh=Mgz/nN4wVHNeHpywhoGStKM18oLP12KnmaVxbg9i0WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xdx0up3kuVu4Uv4qf4o1MO1VIYYKm0fiGdpSXQkm2bYxAanGJJSwQrFtx60kZNfKK7xhX+TRnsQ6cnWm724Gxgn8okoZO26jFUJPKM5rfxPl7ATiq6QEcBoUsR8nRd4e5241IKUMI0uuC6kYDBB/Yc75SoAOkXcYJtrZGSXwhs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDufvCOT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDufvCOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749888497; x=1781424497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mgz/nN4wVHNeHpywhoGStKM18oLP12KnmaVxbg9i0WM=;
  b=bDufvCOTABHRMGycyxL5dgPjNPNLnoB9aom8JYjBuLfChUv939Rn7Ikf
   DUl4OiXUtTNTOq8IUYxUyX5XIFvyl8N7IbMKLH99bK8RwpQfafUWiGavi
   tQCXzL+hY9jqsNiuU7PUy2n5TaMPCNZz77y+lDWcpcqDCmbTXa7NG4svF
   XLGunMaieos+sAffr9PtZCnsEYMK4NF2PnTP1irHI5SZHyCcaHXQBR6+x
   ROKiNnKvIjr41EWJx2E/qhwgKRBnzdyMCfXU+w+AW3hjvdG7Im9BeWyXo
   B3QiNThfmlgOmE4QsDjlA/GQ+KMykbxvtZDcsdMKSsx9q8bRJkcytyPD5
   w==;
X-CSE-ConnectionGUID: GECYgFibR4CPuDDBt1ObXQ==
X-CSE-MsgGUID: /tNB1FYGSXOmjECn0HOMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63512739"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63512739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 01:08:16 -0700
X-CSE-ConnectionGUID: Er2pl+JrSz69qwRFAqBqWw==
X-CSE-MsgGUID: 7TcWTBTEQY6AIo+Z+kSR4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="153306708"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2025 01:08:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQLvw-000DNi-17;
	Sat, 14 Jun 2025 08:08:12 +0000
Date: Sat, 14 Jun 2025 16:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized
 symbol 'entry_order'.
Message-ID: <202506141535.tjdnCMqW-lkp@intel.com>
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
TO: Zi Yan <ziy@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4774cfe3543abb8ee98089f535e28ebfd45b975a
commit: d53c78fffe7ad364397c693522ceb4d152c2aacd mm/shmem: use xas_try_split() in shmem_split_large_entry()
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141535.tjdnCMqW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506141535.tjdnCMqW-lkp@intel.com/

smatch warnings:
mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized symbol 'entry_order'.

vim +/entry_order +2223 mm/shmem.c

6cec2b95dadf77 Miaohe Lin  2022-05-19  2150  
12885cbe88ddf6 Baolin Wang 2024-08-12  2151  static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
12885cbe88ddf6 Baolin Wang 2024-08-12  2152  				   swp_entry_t swap, gfp_t gfp)
12885cbe88ddf6 Baolin Wang 2024-08-12  2153  {
12885cbe88ddf6 Baolin Wang 2024-08-12  2154  	struct address_space *mapping = inode->i_mapping;
12885cbe88ddf6 Baolin Wang 2024-08-12  2155  	XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
d53c78fffe7ad3 Zi Yan      2025-03-14  2156  	int split_order = 0, entry_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2157  	int i;
12885cbe88ddf6 Baolin Wang 2024-08-12  2158  
12885cbe88ddf6 Baolin Wang 2024-08-12  2159  	/* Convert user data gfp flags to xarray node gfp flags */
12885cbe88ddf6 Baolin Wang 2024-08-12  2160  	gfp &= GFP_RECLAIM_MASK;
12885cbe88ddf6 Baolin Wang 2024-08-12  2161  
12885cbe88ddf6 Baolin Wang 2024-08-12  2162  	for (;;) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2163  		void *old = NULL;
d53c78fffe7ad3 Zi Yan      2025-03-14  2164  		int cur_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2165  		pgoff_t swap_index;
12885cbe88ddf6 Baolin Wang 2024-08-12  2166  
12885cbe88ddf6 Baolin Wang 2024-08-12  2167  		xas_lock_irq(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2168  		old = xas_load(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2169  		if (!xa_is_value(old) || swp_to_radix_entry(swap) != old) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2170  			xas_set_err(&xas, -EEXIST);
12885cbe88ddf6 Baolin Wang 2024-08-12  2171  			goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2172  		}
12885cbe88ddf6 Baolin Wang 2024-08-12  2173  
d53c78fffe7ad3 Zi Yan      2025-03-14  2174  		entry_order = xas_get_order(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2175  
d53c78fffe7ad3 Zi Yan      2025-03-14  2176  		if (!entry_order)
d53c78fffe7ad3 Zi Yan      2025-03-14  2177  			goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2178  
12885cbe88ddf6 Baolin Wang 2024-08-12  2179  		/* Try to split large swap entry in pagecache */
d53c78fffe7ad3 Zi Yan      2025-03-14  2180  		cur_order = entry_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2181  		swap_index = round_down(index, 1 << entry_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2182  
d53c78fffe7ad3 Zi Yan      2025-03-14  2183  		split_order = xas_try_split_min_order(cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2184  
d53c78fffe7ad3 Zi Yan      2025-03-14  2185  		while (cur_order > 0) {
d53c78fffe7ad3 Zi Yan      2025-03-14  2186  			pgoff_t aligned_index =
d53c78fffe7ad3 Zi Yan      2025-03-14  2187  				round_down(index, 1 << cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2188  			pgoff_t swap_offset = aligned_index - swap_index;
d53c78fffe7ad3 Zi Yan      2025-03-14  2189  
d53c78fffe7ad3 Zi Yan      2025-03-14  2190  			xas_set_order(&xas, index, split_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2191  			xas_try_split(&xas, old, cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2192  			if (xas_error(&xas))
12885cbe88ddf6 Baolin Wang 2024-08-12  2193  				goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2194  
12885cbe88ddf6 Baolin Wang 2024-08-12  2195  			/*
12885cbe88ddf6 Baolin Wang 2024-08-12  2196  			 * Re-set the swap entry after splitting, and the swap
12885cbe88ddf6 Baolin Wang 2024-08-12  2197  			 * offset of the original large entry must be continuous.
12885cbe88ddf6 Baolin Wang 2024-08-12  2198  			 */
d53c78fffe7ad3 Zi Yan      2025-03-14  2199  			for (i = 0; i < 1 << cur_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2200  			     i += (1 << split_order)) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2201  				swp_entry_t tmp;
12885cbe88ddf6 Baolin Wang 2024-08-12  2202  
d53c78fffe7ad3 Zi Yan      2025-03-14  2203  				tmp = swp_entry(swp_type(swap),
d53c78fffe7ad3 Zi Yan      2025-03-14  2204  						swp_offset(swap) + swap_offset +
d53c78fffe7ad3 Zi Yan      2025-03-14  2205  							i);
12885cbe88ddf6 Baolin Wang 2024-08-12  2206  				__xa_store(&mapping->i_pages, aligned_index + i,
12885cbe88ddf6 Baolin Wang 2024-08-12  2207  					   swp_to_radix_entry(tmp), 0);
12885cbe88ddf6 Baolin Wang 2024-08-12  2208  			}
d53c78fffe7ad3 Zi Yan      2025-03-14  2209  			cur_order = split_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2210  			split_order = xas_try_split_min_order(split_order);
12885cbe88ddf6 Baolin Wang 2024-08-12  2211  		}
12885cbe88ddf6 Baolin Wang 2024-08-12  2212  
12885cbe88ddf6 Baolin Wang 2024-08-12  2213  unlock:
12885cbe88ddf6 Baolin Wang 2024-08-12  2214  		xas_unlock_irq(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2215  
12885cbe88ddf6 Baolin Wang 2024-08-12  2216  		if (!xas_nomem(&xas, gfp))
12885cbe88ddf6 Baolin Wang 2024-08-12  2217  			break;
12885cbe88ddf6 Baolin Wang 2024-08-12  2218  	}
12885cbe88ddf6 Baolin Wang 2024-08-12  2219  
12885cbe88ddf6 Baolin Wang 2024-08-12  2220  	if (xas_error(&xas))
12885cbe88ddf6 Baolin Wang 2024-08-12  2221  		return xas_error(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2222  
d53c78fffe7ad3 Zi Yan      2025-03-14 @2223  	return entry_order;
6cec2b95dadf77 Miaohe Lin  2022-05-19  2224  }
6cec2b95dadf77 Miaohe Lin  2022-05-19  2225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
