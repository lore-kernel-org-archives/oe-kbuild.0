Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241CD254861
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Feb 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760861; cv=none; b=M8V2EdEYqGxpXFri889zFRo8crHWUOsQYRrTnFsV9kWqRM+TPg6PlMB562mvwul0ewRiXh8F9IsweGlzm3m3OFiMTAyIcPXARnuuMymW9wzCpasePuOZodAlz2LnT98c69eAsO2M1yL5w6h6s3TrCvXet2eIAcuwosWXSrqmXlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760861; c=relaxed/simple;
	bh=aOz4l6wrkHOEnlbWU1RaAHVjCxupjG4LG3Nw81BDjIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Um1XCZhSefhwFR6mf+KXS8NrXdhXonVzseV3Wef+xiIvF17ZoD6wiwKxy4LhY+aIhvanNMY19BbnVc/8D9R+9fMLgcxgzid5jURPitrIYcEUj6XlOdd4vHRepDZXfCCczxgQO/NnDJ5Q2Kotm2I52r0giy3judiqA23pfme+hoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeLbTIZ1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeLbTIZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740760859; x=1772296859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOz4l6wrkHOEnlbWU1RaAHVjCxupjG4LG3Nw81BDjIE=;
  b=MeLbTIZ1plZUxPvi9qp8s47QnOFpyrP0FHC1RqnainX93o5JL23hqSzk
   3i/Rggzc7E2oO2DCOwn46nBXomaFEa4cG10gopnKa2lG4z3S7EAc6K90u
   3VRvmBmvN2kABgdiZW9I2DI5/um3+msxUOepMjnURppOlNPAYvaSmo/5b
   +wsMWGeAdpBfr3deoLcXNzCPcaqMePBcqfgQ7Ua5i+11LhVnPofk6hlhg
   HcXEw0hwngVOjtTXh8qKI0thjWKllJhBDr1sV0qrGHKXnwyI1kAE6xxHg
   eLg1Pyz68xusyBcxoVQmLJAf1/ZcEFUyyGWN1DstHJBP/3/MXWVuI/Czi
   Q==;
X-CSE-ConnectionGUID: liE5uieHQYuT7CBLeEABVw==
X-CSE-MsgGUID: UgENU10zQDakwAiFUXNgqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53104261"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53104261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 08:40:58 -0800
X-CSE-ConnectionGUID: H4BJcr1sQ+SQSFhahNRqaA==
X-CSE-MsgGUID: 56QMKFT/TyCKXVVgARrITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154550713"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 08:40:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to3Pt-000FDe-26;
	Fri, 28 Feb 2025 16:40:51 +0000
Date: Sat, 1 Mar 2025 00:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6569/7423] mm/shmem.c:2232
 shmem_split_large_entry() error: uninitialized symbol 'entry_order'.
Message-ID: <202503010015.hCDpuDYw-lkp@intel.com>
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
TO: Zi Yan <ziy@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 6dbc440b79b695cf3c68c8741a247819caff78a1 [6569/7423] mm/shmem: use xas_try_split() in shmem_split_large_entry()
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250228 (https://download.01.org/0day-ci/archive/20250301/202503010015.hCDpuDYw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503010015.hCDpuDYw-lkp@intel.com/

smatch warnings:
mm/shmem.c:2232 shmem_split_large_entry() error: uninitialized symbol 'entry_order'.

vim +/entry_order +2232 mm/shmem.c

6cec2b95dadf77c Miaohe Lin  2022-05-19  2159  
12885cbe88ddf6c Baolin Wang 2024-08-12  2160  static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
12885cbe88ddf6c Baolin Wang 2024-08-12  2161  				   swp_entry_t swap, gfp_t gfp)
12885cbe88ddf6c Baolin Wang 2024-08-12  2162  {
12885cbe88ddf6c Baolin Wang 2024-08-12  2163  	struct address_space *mapping = inode->i_mapping;
12885cbe88ddf6c Baolin Wang 2024-08-12  2164  	XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
6dbc440b79b695c Zi Yan      2025-02-26  2165  	int split_order = 0, entry_order;
6dbc440b79b695c Zi Yan      2025-02-26  2166  	int i;
12885cbe88ddf6c Baolin Wang 2024-08-12  2167  
12885cbe88ddf6c Baolin Wang 2024-08-12  2168  	/* Convert user data gfp flags to xarray node gfp flags */
12885cbe88ddf6c Baolin Wang 2024-08-12  2169  	gfp &= GFP_RECLAIM_MASK;
12885cbe88ddf6c Baolin Wang 2024-08-12  2170  
12885cbe88ddf6c Baolin Wang 2024-08-12  2171  	for (;;) {
12885cbe88ddf6c Baolin Wang 2024-08-12  2172  		void *old = NULL;
6dbc440b79b695c Zi Yan      2025-02-26  2173  		int cur_order;
6dbc440b79b695c Zi Yan      2025-02-26  2174  		pgoff_t swap_index;
12885cbe88ddf6c Baolin Wang 2024-08-12  2175  
12885cbe88ddf6c Baolin Wang 2024-08-12  2176  		xas_lock_irq(&xas);
12885cbe88ddf6c Baolin Wang 2024-08-12  2177  		old = xas_load(&xas);
12885cbe88ddf6c Baolin Wang 2024-08-12  2178  		if (!xa_is_value(old) || swp_to_radix_entry(swap) != old) {
12885cbe88ddf6c Baolin Wang 2024-08-12  2179  			xas_set_err(&xas, -EEXIST);
12885cbe88ddf6c Baolin Wang 2024-08-12  2180  			goto unlock;
12885cbe88ddf6c Baolin Wang 2024-08-12  2181  		}
12885cbe88ddf6c Baolin Wang 2024-08-12  2182  
6dbc440b79b695c Zi Yan      2025-02-26  2183  		entry_order = xas_get_order(&xas);
12885cbe88ddf6c Baolin Wang 2024-08-12  2184  
6dbc440b79b695c Zi Yan      2025-02-26  2185  		if (!entry_order)
6dbc440b79b695c Zi Yan      2025-02-26  2186  			goto unlock;
12885cbe88ddf6c Baolin Wang 2024-08-12  2187  
12885cbe88ddf6c Baolin Wang 2024-08-12  2188  		/* Try to split large swap entry in pagecache */
6dbc440b79b695c Zi Yan      2025-02-26  2189  		cur_order = entry_order;
6dbc440b79b695c Zi Yan      2025-02-26  2190  		swap_index = round_down(index, 1 << entry_order);
6dbc440b79b695c Zi Yan      2025-02-26  2191  
6dbc440b79b695c Zi Yan      2025-02-26  2192  		split_order = xas_try_split_min_order(cur_order);
6dbc440b79b695c Zi Yan      2025-02-26  2193  
6dbc440b79b695c Zi Yan      2025-02-26  2194  		while (cur_order > 0) {
6dbc440b79b695c Zi Yan      2025-02-26  2195  			pgoff_t aligned_index =
6dbc440b79b695c Zi Yan      2025-02-26  2196  				round_down(index, 1 << cur_order);
6dbc440b79b695c Zi Yan      2025-02-26  2197  			pgoff_t swap_offset = aligned_index - swap_index;
6dbc440b79b695c Zi Yan      2025-02-26  2198  
6dbc440b79b695c Zi Yan      2025-02-26  2199  			xas_set_order(&xas, index, split_order);
6dbc440b79b695c Zi Yan      2025-02-26  2200  			xas_try_split(&xas, old, cur_order);
6dbc440b79b695c Zi Yan      2025-02-26  2201  			if (xas_error(&xas))
12885cbe88ddf6c Baolin Wang 2024-08-12  2202  				goto unlock;
12885cbe88ddf6c Baolin Wang 2024-08-12  2203  
12885cbe88ddf6c Baolin Wang 2024-08-12  2204  			/*
12885cbe88ddf6c Baolin Wang 2024-08-12  2205  			 * Re-set the swap entry after splitting, and the swap
12885cbe88ddf6c Baolin Wang 2024-08-12  2206  			 * offset of the original large entry must be continuous.
12885cbe88ddf6c Baolin Wang 2024-08-12  2207  			 */
6dbc440b79b695c Zi Yan      2025-02-26  2208  			for (i = 0; i < 1 << cur_order;
6dbc440b79b695c Zi Yan      2025-02-26  2209  			     i += (1 << split_order)) {
12885cbe88ddf6c Baolin Wang 2024-08-12  2210  				swp_entry_t tmp;
12885cbe88ddf6c Baolin Wang 2024-08-12  2211  
6dbc440b79b695c Zi Yan      2025-02-26  2212  				tmp = swp_entry(swp_type(swap),
6dbc440b79b695c Zi Yan      2025-02-26  2213  						swp_offset(swap) + swap_offset +
6dbc440b79b695c Zi Yan      2025-02-26  2214  							i);
12885cbe88ddf6c Baolin Wang 2024-08-12  2215  				__xa_store(&mapping->i_pages, aligned_index + i,
12885cbe88ddf6c Baolin Wang 2024-08-12  2216  					   swp_to_radix_entry(tmp), 0);
12885cbe88ddf6c Baolin Wang 2024-08-12  2217  			}
6dbc440b79b695c Zi Yan      2025-02-26  2218  			cur_order = split_order;
6dbc440b79b695c Zi Yan      2025-02-26  2219  			split_order = xas_try_split_min_order(split_order);
12885cbe88ddf6c Baolin Wang 2024-08-12  2220  		}
12885cbe88ddf6c Baolin Wang 2024-08-12  2221  
12885cbe88ddf6c Baolin Wang 2024-08-12  2222  unlock:
12885cbe88ddf6c Baolin Wang 2024-08-12  2223  		xas_unlock_irq(&xas);
12885cbe88ddf6c Baolin Wang 2024-08-12  2224  
12885cbe88ddf6c Baolin Wang 2024-08-12  2225  		if (!xas_nomem(&xas, gfp))
12885cbe88ddf6c Baolin Wang 2024-08-12  2226  			break;
12885cbe88ddf6c Baolin Wang 2024-08-12  2227  	}
12885cbe88ddf6c Baolin Wang 2024-08-12  2228  
12885cbe88ddf6c Baolin Wang 2024-08-12  2229  	if (xas_error(&xas))
12885cbe88ddf6c Baolin Wang 2024-08-12  2230  		return xas_error(&xas);
12885cbe88ddf6c Baolin Wang 2024-08-12  2231  
6dbc440b79b695c Zi Yan      2025-02-26 @2232  	return entry_order;
6cec2b95dadf77c Miaohe Lin  2022-05-19  2233  }
6cec2b95dadf77c Miaohe Lin  2022-05-19  2234  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
