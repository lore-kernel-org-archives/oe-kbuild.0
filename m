Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486755784
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4rc6I+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702568810; x=1734104810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fB9M0KNNNWdXAxS6BuRO1YwR54v7GYXqud6sJ5NTF5Q=;
  b=A4rc6I+sTaQA0WvQt83zb2beyxaYfBfvtzdV4CBWeGP9Dv3072jEuZBY
   nO0TwGIZhi6eyK+0fg4jtJKyTdnRVqJYqiQjkEurVKfgWBN17QgV8XHvw
   tc3vcTjizKPqc7IJYIcEwSLzo/fYjRNcjcXYOstbba7bMGW9U2y8Gf9oo
   dKJ3UVjlrbPfvVjhI7iYeZO7yVuRH/MmESMK2mHjM/NV3N/vL1m81Mp9i
   iNYqhEdXJFEqQIQHAXqqkeB1Ctz6uHT9dMru2OQ62Kk16X3X7eD3Tt36d
   Ut7ysgt0fQLfFBvBgC5/KAG6lux/JrBEn5m9d2cm+ifrnenreFaBQylvV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8495714"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="8495714"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="15888617"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2023 07:46:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDnvA-000MEy-2o;
	Thu, 14 Dec 2023 15:46:44 +0000
Date: Thu, 14 Dec 2023 23:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in diNewExt
Message-ID: <202312142348.6HRZtXTB-lkp@intel.com>
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
In-Reply-To: <tencent_B86ECD2ECECC92A7ED86EF92D0064A499206@qq.com>
References: <tencent_B86ECD2ECECC92A7ED86EF92D0064A499206@qq.com>
TO: Edward Adam Davis <eadavis@qq.com>
TO: syzbot+553d90297e6d2f50dbc7@syzkaller.appspotmail.com
CC: jfs-discussion@lists.sourceforge.net
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: shaggy@kernel.org
CC: syzkaller-bugs@googlegroups.com

Hi Edward,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kleikamp-shaggy/jfs-next]
[also build test WARNING on linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Adam-Davis/jfs-fix-array-index-out-of-bounds-in-diNewExt/20231212-095530
base:   https://github.com/kleikamp/linux-shaggy jfs-next
patch link:    https://lore.kernel.org/r/tencent_B86ECD2ECECC92A7ED86EF92D0064A499206%40qq.com
patch subject: [PATCH] jfs: fix array-index-out-of-bounds in diNewExt
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20231212 (https://download.01.org/0day-ci/archive/20231214/202312142348.6HRZtXTB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312142348.6HRZtXTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312142348.6HRZtXTB-lkp@intel.com/

New smatch warnings:
fs/jfs/jfs_imap.c:2213 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128

Old smatch warnings:
fs/jfs/jfs_imap.c:2229 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
fs/jfs/jfs_imap.c:2304 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
fs/jfs/jfs_imap.c:2318 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
fs/jfs/jfs_imap.c:2330 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
fs/jfs/jfs_imap.c:2332 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
fs/jfs/jfs_imap.c:2363 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
fs/jfs/jfs_imap.c:2364 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128

vim +2213 fs/jfs/jfs_imap.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2107  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2108  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2109  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2110   * NAME:	diNewExt(imap,iagp,extno)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2111   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2112   * FUNCTION:	initialize a new extent of inodes for an iag, allocating
^1da177e4c3f41 Linus Torvalds    2005-04-16  2113   *		the first inode of the extent for use for the current
^1da177e4c3f41 Linus Torvalds    2005-04-16  2114   *		allocation request.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2115   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2116   *		disk resources are allocated for the new extent of inodes
^1da177e4c3f41 Linus Torvalds    2005-04-16  2117   *		and the inodes themselves are initialized to reflect their
^1da177e4c3f41 Linus Torvalds    2005-04-16  2118   *		existence within the extent (i.e. their inode numbers and
^1da177e4c3f41 Linus Torvalds    2005-04-16  2119   *		inode extent addresses are set) and their initial state
^1da177e4c3f41 Linus Torvalds    2005-04-16  2120   *		(mode and link count are set to zero).
^1da177e4c3f41 Linus Torvalds    2005-04-16  2121   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2122   *		if the iag is new, it is not yet on an ag extent free list
^1da177e4c3f41 Linus Torvalds    2005-04-16  2123   *		but will now be placed on this list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2124   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2125   *		if the allocation of the new extent causes the iag to
^1da177e4c3f41 Linus Torvalds    2005-04-16  2126   *		have no free extent, the iag will be removed from the
^1da177e4c3f41 Linus Torvalds    2005-04-16  2127   *		ag extent free list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2128   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2129   *		if the iag has no free backed inodes, it will be placed
^1da177e4c3f41 Linus Torvalds    2005-04-16  2130   *		on the ag free inode list, since the addition of the new
^1da177e4c3f41 Linus Torvalds    2005-04-16  2131   *		extent will now cause it to have free inodes.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2132   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2133   *		a careful update approach is used to provide consistency
^1da177e4c3f41 Linus Torvalds    2005-04-16  2134   *		(i.e. list consistency) in the face of updates to multiple
^1da177e4c3f41 Linus Torvalds    2005-04-16  2135   *		buffers.  under this approach, all required buffers are
^1da177e4c3f41 Linus Torvalds    2005-04-16  2136   *		obtained before making any updates and are held until all
^1da177e4c3f41 Linus Torvalds    2005-04-16  2137   *		updates are complete.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2138   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2139   * PRE CONDITION: Already have buffer lock on iagp.  Already have AG lock on
^1da177e4c3f41 Linus Torvalds    2005-04-16  2140   *	this AG.  Must have read lock on imap inode.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2141   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2142   * PARAMETERS:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2143   *	imap	- pointer to inode map control structure.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2144   *	iagp	- pointer to iag.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2145   *	extno	- extent number.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2146   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  2147   * RETURN VALUES:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2148   *	0	- success.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2149   *	-ENOSPC	- insufficient disk resources.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2150   *	-EIO	- i/o error.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2151   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2152  static int diNewExt(struct inomap * imap, struct iag * iagp, int extno)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2153  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2154  	int agno, iagno, fwd, back, freei = 0, sword, rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2155  	struct iag *aiagp = NULL, *biagp = NULL, *ciagp = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2156  	struct metapage *amp, *bmp, *cmp, *dmp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2157  	struct inode *ipimap;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2158  	s64 blkno, hint;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2159  	int i, j;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2160  	u32 mask;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2161  	ino_t ino;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2162  	struct dinode *dp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2163  	struct jfs_sb_info *sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2164  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2165  	/* better have free extents.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2166  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2167  	if (!iagp->nfreeexts) {
eb8630d7d2fd13 Joe Perches       2013-06-04  2168  		jfs_error(imap->im_ipimap->i_sb, "no free extents\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  2169  		return -EIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2170  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2171  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2172  	/* get the inode map inode.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2173  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2174  	ipimap = imap->im_ipimap;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2175  	sbi = JFS_SBI(ipimap->i_sb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2176  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2177  	amp = bmp = cmp = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2178  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2179  	/* get the ag and iag numbers for this iag.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2180  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2181  	agno = BLKTOAG(le64_to_cpu(iagp->agstart), sbi);
f93b91b82fcf16 Edward Adam Davis 2023-12-12  2182  	if (agno > MAXAG || agno < 0)
f93b91b82fcf16 Edward Adam Davis 2023-12-12  2183  		return -EIO;
f93b91b82fcf16 Edward Adam Davis 2023-12-12  2184  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2185  	iagno = le32_to_cpu(iagp->iagnum);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2186  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2187  	/* check if this is the last free extent within the
^1da177e4c3f41 Linus Torvalds    2005-04-16  2188  	 * iag.  if so, the iag must be removed from the ag
25985edcedea63 Lucas De Marchi   2011-03-30  2189  	 * free extent list, so get the iags preceding and
^1da177e4c3f41 Linus Torvalds    2005-04-16  2190  	 * following the iag on this list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2191  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2192  	if (iagp->nfreeexts == cpu_to_le32(1)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2193  		if ((fwd = le32_to_cpu(iagp->extfreefwd)) >= 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2194  			if ((rc = diIAGRead(imap, fwd, &amp)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2195  				return (rc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2196  			aiagp = (struct iag *) amp->data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2197  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2198  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2199  		if ((back = le32_to_cpu(iagp->extfreeback)) >= 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2200  			if ((rc = diIAGRead(imap, back, &bmp)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2201  				goto error_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2202  			biagp = (struct iag *) bmp->data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2203  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2204  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2205  		/* the iag has free extents.  if all extents are free
^1da177e4c3f41 Linus Torvalds    2005-04-16  2206  		 * (as is the case for a newly allocated iag), the iag
^1da177e4c3f41 Linus Torvalds    2005-04-16  2207  		 * must be added to the ag free extent list, so get
^1da177e4c3f41 Linus Torvalds    2005-04-16  2208  		 * the iag at the head of the list in preparation for
^1da177e4c3f41 Linus Torvalds    2005-04-16  2209  		 * adding this iag to this list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2210  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2211  		fwd = back = -1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2212  		if (iagp->nfreeexts == cpu_to_le32(EXTSPERIAG)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16 @2213  			if ((fwd = imap->im_agctl[agno].extfree) >= 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2214  				if ((rc = diIAGRead(imap, fwd, &amp)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2215  					goto error_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2216  				aiagp = (struct iag *) amp->data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2217  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2218  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2219  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2220  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2221  	/* check if the iag has no free inodes.  if so, the iag
^1da177e4c3f41 Linus Torvalds    2005-04-16  2222  	 * will have to be added to the ag free inode list, so get
^1da177e4c3f41 Linus Torvalds    2005-04-16  2223  	 * the iag at the head of the list in preparation for
^1da177e4c3f41 Linus Torvalds    2005-04-16  2224  	 * adding this iag to this list.  in doing this, we must
^1da177e4c3f41 Linus Torvalds    2005-04-16  2225  	 * check if we already have the iag at the head of
^1da177e4c3f41 Linus Torvalds    2005-04-16  2226  	 * the list in hand.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2227  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2228  	if (iagp->nfreeinos == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2229  		freei = imap->im_agctl[agno].inofree;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2230  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2231  		if (freei >= 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2232  			if (freei == fwd) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2233  				ciagp = aiagp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2234  			} else if (freei == back) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2235  				ciagp = biagp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2236  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2237  				if ((rc = diIAGRead(imap, freei, &cmp)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2238  					goto error_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2239  				ciagp = (struct iag *) cmp->data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2240  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2241  			if (ciagp == NULL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2242  				jfs_error(imap->im_ipimap->i_sb,
eb8630d7d2fd13 Joe Perches       2013-06-04  2243  					  "ciagp == NULL\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  2244  				rc = -EIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2245  				goto error_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2246  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2247  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2248  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2249  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2250  	/* allocate disk space for the inode extent.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2251  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2252  	if ((extno == 0) || (addressPXD(&iagp->inoext[extno - 1]) == 0))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2253  		hint = ((s64) agno << sbi->bmap->db_agl2size) - 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2254  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  2255  		hint = addressPXD(&iagp->inoext[extno - 1]) +
^1da177e4c3f41 Linus Torvalds    2005-04-16  2256  		    lengthPXD(&iagp->inoext[extno - 1]) - 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2257  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2258  	if ((rc = dbAlloc(ipimap, hint, (s64) imap->im_nbperiext, &blkno)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2259  		goto error_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2260  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2261  	/* compute the inode number of the first inode within the
^1da177e4c3f41 Linus Torvalds    2005-04-16  2262  	 * extent.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2263  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2264  	ino = (iagno << L2INOSPERIAG) + (extno << L2INOSPEREXT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2265  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2266  	/* initialize the inodes within the newly allocated extent a
^1da177e4c3f41 Linus Torvalds    2005-04-16  2267  	 * page at a time.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2268  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2269  	for (i = 0; i < imap->im_nbperiext; i += sbi->nbperpage) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2270  		/* get a buffer for this page of disk inodes.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2271  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2272  		dmp = get_metapage(ipimap, blkno + i, PSIZE, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2273  		if (dmp == NULL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2274  			rc = -EIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2275  			goto error_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2276  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2277  		dp = (struct dinode *) dmp->data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2278  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2279  		/* initialize the inode number, mode, link count and
^1da177e4c3f41 Linus Torvalds    2005-04-16  2280  		 * inode extent address.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2281  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2282  		for (j = 0; j < INOSPERPAGE; j++, dp++, ino++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2283  			dp->di_inostamp = cpu_to_le32(sbi->inostamp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2284  			dp->di_number = cpu_to_le32(ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2285  			dp->di_fileset = cpu_to_le32(FILESYSTEM_I);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2286  			dp->di_mode = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2287  			dp->di_nlink = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2288  			PXDaddress(&(dp->di_ixpxd), blkno);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2289  			PXDlength(&(dp->di_ixpxd), imap->im_nbperiext);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2290  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2291  		write_metapage(dmp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2292  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2293  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2294  	/* if this is the last free extent within the iag, remove the
^1da177e4c3f41 Linus Torvalds    2005-04-16  2295  	 * iag from the ag free extent list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2296  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2297  	if (iagp->nfreeexts == cpu_to_le32(1)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2298  		if (fwd >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2299  			aiagp->extfreeback = iagp->extfreeback;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2300  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2301  		if (back >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2302  			biagp->extfreefwd = iagp->extfreefwd;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2303  		else
^1da177e4c3f41 Linus Torvalds    2005-04-16  2304  			imap->im_agctl[agno].extfree =
^1da177e4c3f41 Linus Torvalds    2005-04-16  2305  			    le32_to_cpu(iagp->extfreefwd);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2306  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2307  		iagp->extfreefwd = iagp->extfreeback = cpu_to_le32(-1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2308  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2309  		/* if the iag has all free extents (newly allocated iag),
^1da177e4c3f41 Linus Torvalds    2005-04-16  2310  		 * add the iag to the ag free extent list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2311  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2312  		if (iagp->nfreeexts == cpu_to_le32(EXTSPERIAG)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2313  			if (fwd >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2314  				aiagp->extfreeback = cpu_to_le32(iagno);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2315  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2316  			iagp->extfreefwd = cpu_to_le32(fwd);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2317  			iagp->extfreeback = cpu_to_le32(-1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2318  			imap->im_agctl[agno].extfree = iagno;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2319  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2320  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2321  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2322  	/* if the iag has no free inodes, add the iag to the
^1da177e4c3f41 Linus Torvalds    2005-04-16  2323  	 * ag free inode list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2324  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2325  	if (iagp->nfreeinos == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2326  		if (freei >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2327  			ciagp->inofreeback = cpu_to_le32(iagno);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2328  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2329  		iagp->inofreefwd =
^1da177e4c3f41 Linus Torvalds    2005-04-16  2330  		    cpu_to_le32(imap->im_agctl[agno].inofree);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2331  		iagp->inofreeback = cpu_to_le32(-1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2332  		imap->im_agctl[agno].inofree = iagno;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2333  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2334  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2335  	/* initialize the extent descriptor of the extent. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2336  	PXDlength(&iagp->inoext[extno], imap->im_nbperiext);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2337  	PXDaddress(&iagp->inoext[extno], blkno);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2338  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2339  	/* initialize the working and persistent map of the extent.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2340  	 * the working map will be initialized such that
^1da177e4c3f41 Linus Torvalds    2005-04-16  2341  	 * it indicates the first inode of the extent is allocated.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2342  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2343  	iagp->wmap[extno] = cpu_to_le32(HIGHORDER);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2344  	iagp->pmap[extno] = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2345  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2346  	/* update the free inode and free extent summary maps
^1da177e4c3f41 Linus Torvalds    2005-04-16  2347  	 * for the extent to indicate the extent has free inodes
^1da177e4c3f41 Linus Torvalds    2005-04-16  2348  	 * and no longer represents a free extent.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2349  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2350  	sword = extno >> L2EXTSPERSUM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2351  	mask = HIGHORDER >> (extno & (EXTSPERSUM - 1));
^1da177e4c3f41 Linus Torvalds    2005-04-16  2352  	iagp->extsmap[sword] |= cpu_to_le32(mask);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2353  	iagp->inosmap[sword] &= cpu_to_le32(~mask);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2354  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2355  	/* update the free inode and free extent counts for the
^1da177e4c3f41 Linus Torvalds    2005-04-16  2356  	 * iag.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2357  	 */
891456227881da Marcin Slusarz    2008-02-13  2358  	le32_add_cpu(&iagp->nfreeinos, (INOSPEREXT - 1));
891456227881da Marcin Slusarz    2008-02-13  2359  	le32_add_cpu(&iagp->nfreeexts, -1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2360  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2361  	/* update the free and backed inode counts for the ag.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2362  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2363  	imap->im_agctl[agno].numfree += (INOSPEREXT - 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2364  	imap->im_agctl[agno].numinos += INOSPEREXT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2365  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2366  	/* update the free and backed inode counts for the inode map.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2367  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2368  	atomic_add(INOSPEREXT - 1, &imap->im_numfree);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2369  	atomic_add(INOSPEREXT, &imap->im_numinos);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2370  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2371  	/* write the iags.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2372  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2373  	if (amp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2374  		write_metapage(amp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2375  	if (bmp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2376  		write_metapage(bmp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2377  	if (cmp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2378  		write_metapage(cmp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2379  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2380  	return (0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2381  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2382        error_out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2383  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2384  	/* release the iags.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2385  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2386  	if (amp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2387  		release_metapage(amp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2388  	if (bmp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2389  		release_metapage(bmp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2390  	if (cmp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2391  		release_metapage(cmp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2392  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2393  	return (rc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2394  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2395  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
