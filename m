Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A22DEA79
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 23:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408538; cv=none; b=CdMom5qRXVSEozXWvU+/ILhbKffSmz6924DpS2DFz4yqxubWMAWR/pDvDRJLMcxvSYyyiMBUaurOIEkYR8xwyO4lsQRaVhIU0+7vAuYbRidxD44d7IM+irxcsEVgXCbXlZj54mgzsPTXIQZKEfi6HO+chr/pLMeYF1jffsb6sHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408538; c=relaxed/simple;
	bh=FYWs8sQ7ZcFep5GTcXyju9JdtTJDIIpcltqAsPzvWcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O21zgGNDpBdzI/muifkMPnUYom9FYc8UY0mHXIxA5eLXR3XpEdEuWDYrU4TGGukDzcoX8b1Phvm50XEs5Wfn570EJIR6d1PQlO52KgTCbXhMyl1jh6ujjEtdoTvUlMoayDqlIukHdG821p60E8XvkB/YNet1GT1cGIJpfNeAEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv358ifs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv358ifs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765408528; x=1796944528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYWs8sQ7ZcFep5GTcXyju9JdtTJDIIpcltqAsPzvWcQ=;
  b=Fv358ifsjHeoa0cakThiE4rTcB4RGM1df5X7y4+etFKTGqGOdnxLFO50
   u8ZVuNhVCa0mDtUG5BrcINVVzXCg5VcI0gnNLb73IQ+FU0B9wCh2TgddD
   7C5Y4B4pomnbrY27z17mTNUk8rVQPLr5YR9ZrA/fkXWvV80RATCbmjt7A
   7VvPyhuZyVjYfA238imkGt9WxEi55DK8akb9SHJHL0vJiwUJ8oji/0vkV
   +HEVeGGL4kRiAWu7qlOQANIAiCeKGaPQxSzsNAkP0hgV2xrqbfsf0OIC1
   WmxQ5Cv6ApAtkitqWF8EMymIYT2xLfq3yNLqVkOhAbWdgkc0OI0lYEy2m
   Q==;
X-CSE-ConnectionGUID: pn48yop2RsSsPNjqH7HdAA==
X-CSE-MsgGUID: 9qij5oH2TyGgUK4te+RkdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78087536"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78087536"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 15:15:05 -0800
X-CSE-ConnectionGUID: HwSRRrPeQt6Kvl5sK1NJNA==
X-CSE-MsgGUID: s4oDTD5sSDKuaSQPPtx2FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196699060"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 15:15:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTTOf-000000003rd-2KOF;
	Wed, 10 Dec 2025 23:15:01 +0000
Date: Thu, 11 Dec 2025 07:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/extents.c:4450 ext4_ext_map_blocks() error: uninitialized
 symbol 'depth'.
Message-ID: <202512110712.ZAlEMJVb-lkp@intel.com>
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
TO: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Ojaswin Mujoo <ojaswin@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: 7acd1b315cdcc03b11a3aa1f9c9c85d99ddb4f0e ext4: Add a WARN_ON_ONCE for querying LAST_IN_LEAF instead
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: csky-randconfig-r073-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110712.ZAlEMJVb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110712.ZAlEMJVb-lkp@intel.com/

New smatch warnings:
fs/ext4/extents.c:4450 ext4_ext_map_blocks() error: uninitialized symbol 'depth'.

Old smatch warnings:
fs/ext4/extents.c:4450 ext4_ext_map_blocks() error: uninitialized symbol 'ex'.

vim +/depth +4450 fs/ext4/extents.c

4d33b1ef10995d Theodore Ts'o        2011-09-09  4172  
c278bfecebfb1e Aneesh Kumar K.V     2008-01-28  4173  /*
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4174   * Block allocation/map/preallocation routine for extents based files
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4175   *
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4176   *
c278bfecebfb1e Aneesh Kumar K.V     2008-01-28  4177   * Need to be called with
0e855ac8b103ef Aneesh Kumar K.V     2008-01-28  4178   * down_read(&EXT4_I(inode)->i_data_sem) if not allocating file system block
547e64bda9c7bd Cheng Nie            2024-01-18  4179   * (ie, flags is zero). Otherwise down_write(&EXT4_I(inode)->i_data_sem)
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4180   *
b483bb77194b4e Randy Dunlap         2020-08-04  4181   * return > 0, number of blocks already mapped/allocated
547e64bda9c7bd Cheng Nie            2024-01-18  4182   *          if flags doesn't contain EXT4_GET_BLOCKS_CREATE and these are pre-allocated blocks
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4183   *          	buffer head is unmapped
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4184   *          otherwise blocks are mapped
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4185   *
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4186   * return = 0, if plain look up failed (blocks have not been allocated)
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4187   *          buffer head is unmapped
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4188   *
f5ab0d1f8f7df9 Mingming Cao         2008-02-25  4189   * return < 0, error case.
c278bfecebfb1e Aneesh Kumar K.V     2008-01-28  4190   */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4191  int ext4_ext_map_blocks(handle_t *handle, struct inode *inode,
e35fd6609b2fee Theodore Ts'o        2010-05-16  4192  			struct ext4_map_blocks *map, int flags)
a86c61812637c7 Alex Tomas           2006-10-11  4193  {
a86c61812637c7 Alex Tomas           2006-10-11  4194  	struct ext4_ext_path *path = NULL;
d7dce9e08595e8 yangerkun            2020-10-28  4195  	struct ext4_extent newex, *ex, ex2;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4196  	struct ext4_sb_info *sbi = EXT4_SB(inode->i_sb);
8ad8d710035edf Eric Whitney         2020-05-10  4197  	ext4_fsblk_t newblock = 0, pblk;
2ec2e1043473b3 Baokun Li            2024-08-22  4198  	int err = 0, depth;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4199  	unsigned int allocated = 0, offset = 0;
81fdbb4a8d3424 Yongqiang Yang       2011-10-29  4200  	unsigned int allocated_clusters = 0;
c9de560ded61fa Alex Tomas           2008-01-29  4201  	struct ext4_allocation_request ar;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4202  	ext4_lblk_t cluster_offset;
a86c61812637c7 Alex Tomas           2006-10-11  4203  
70aa1554b01474 Ritesh Harjani       2020-05-10  4204  	ext_debug(inode, "blocks %u/%u requested\n", map->m_lblk, map->m_len);
0562e0bad483d1 Jiaying Zhang        2011-03-21  4205  	trace_ext4_ext_map_blocks_enter(inode, map->m_lblk, map->m_len, flags);
a86c61812637c7 Alex Tomas           2006-10-11  4206  
a86c61812637c7 Alex Tomas           2006-10-11  4207  	/* find extent for this block */
402e38e6b71f57 Zhang Yi             2025-04-23  4208  	path = ext4_find_extent(inode, map->m_lblk, NULL, flags);
a86c61812637c7 Alex Tomas           2006-10-11  4209  	if (IS_ERR(path)) {
a86c61812637c7 Alex Tomas           2006-10-11  4210  		err = PTR_ERR(path);
8ad8d710035edf Eric Whitney         2020-05-10  4211  		goto out;
a86c61812637c7 Alex Tomas           2006-10-11  4212  	}
a86c61812637c7 Alex Tomas           2006-10-11  4213  
a86c61812637c7 Alex Tomas           2006-10-11  4214  	depth = ext_depth(inode);
a86c61812637c7 Alex Tomas           2006-10-11  4215  
a86c61812637c7 Alex Tomas           2006-10-11  4216  	/*
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4217  	 * consistent leaf must not be empty;
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4218  	 * this situation is possible, though, _during_ tree modification;
ed8a1a766af737 Theodore Ts'o        2014-09-01  4219  	 * this is why assert can't be put in ext4_find_extent()
a86c61812637c7 Alex Tomas           2006-10-11  4220  	 */
273df556b6ee20 Frank Mayhar         2010-03-02  4221  	if (unlikely(path[depth].p_ext == NULL && depth != 0)) {
273df556b6ee20 Frank Mayhar         2010-03-02  4222  		EXT4_ERROR_INODE(inode, "bad extent address "
f70f362b4a6fe4 Theodore Ts'o        2010-05-16  4223  				 "lblock: %lu, depth: %d pblock %lld",
f70f362b4a6fe4 Theodore Ts'o        2010-05-16  4224  				 (unsigned long) map->m_lblk, depth,
f70f362b4a6fe4 Theodore Ts'o        2010-05-16  4225  				 path[depth].p_block);
6a797d27378389 Darrick J. Wong      2015-10-17  4226  		err = -EFSCORRUPTED;
8ad8d710035edf Eric Whitney         2020-05-10  4227  		goto out;
034fb4c95fc0fe Surbhi Palande       2009-12-14  4228  	}
a86c61812637c7 Alex Tomas           2006-10-11  4229  
7e0289766a0750 Avantika Mathur      2006-12-06  4230  	ex = path[depth].p_ext;
7e0289766a0750 Avantika Mathur      2006-12-06  4231  	if (ex) {
725d26d3f09ccb Aneesh Kumar K.V     2008-01-28  4232  		ext4_lblk_t ee_block = le32_to_cpu(ex->ee_block);
bf89d16f6ef538 Theodore Ts'o        2010-10-27  4233  		ext4_fsblk_t ee_start = ext4_ext_pblock(ex);
a2df2a63407803 Amit Arora           2007-07-17  4234  		unsigned short ee_len;
471d4011a9862e Suparna Bhattacharya 2006-10-11  4235  
b8a8684502a0fc Lukas Czerner        2014-03-18  4236  
471d4011a9862e Suparna Bhattacharya 2006-10-11  4237  		/*
556615dcbf38b0 Lukas Czerner        2014-04-20  4238  		 * unwritten extents are treated as holes, except that
56055d3ae4cc7f Amit Arora           2007-07-17  4239  		 * we split out initialized portions during a write.
471d4011a9862e Suparna Bhattacharya 2006-10-11  4240  		 */
a2df2a63407803 Amit Arora           2007-07-17  4241  		ee_len = ext4_ext_get_actual_len(ex);
d8990240d8c911 Aditya Kali          2011-09-09  4242  
d8990240d8c911 Aditya Kali          2011-09-09  4243  		trace_ext4_ext_show_extent(inode, ee_block, ee_start, ee_len);
d8990240d8c911 Aditya Kali          2011-09-09  4244  
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4245  		/* if found extent covers block, simply return it */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4246  		if (in_range(map->m_lblk, ee_block, ee_len)) {
e35fd6609b2fee Theodore Ts'o        2010-05-16  4247  			newblock = map->m_lblk - ee_block + ee_start;
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4248  			/* number of remaining blocks in the extent */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4249  			allocated = ee_len - (map->m_lblk - ee_block);
70aa1554b01474 Ritesh Harjani       2020-05-10  4250  			ext_debug(inode, "%u fit into %u:%d -> %llu\n",
70aa1554b01474 Ritesh Harjani       2020-05-10  4251  				  map->m_lblk, ee_block, ee_len, newblock);
56055d3ae4cc7f Amit Arora           2007-07-17  4252  
b8a8684502a0fc Lukas Czerner        2014-03-18  4253  			/*
b8a8684502a0fc Lukas Czerner        2014-03-18  4254  			 * If the extent is initialized check whether the
b8a8684502a0fc Lukas Czerner        2014-03-18  4255  			 * caller wants to convert it to unwritten.
b8a8684502a0fc Lukas Czerner        2014-03-18  4256  			 */
556615dcbf38b0 Lukas Czerner        2014-04-20  4257  			if ((!ext4_ext_is_unwritten(ex)) &&
b8a8684502a0fc Lukas Czerner        2014-03-18  4258  			    (flags & EXT4_GET_BLOCKS_CONVERT_UNWRITTEN)) {
4191eefef978d7 Baokun Li            2024-08-22  4259  				path = convert_initialized_extent(handle,
4191eefef978d7 Baokun Li            2024-08-22  4260  					inode, map, path, &allocated);
4191eefef978d7 Baokun Li            2024-08-22  4261  				if (IS_ERR(path))
4191eefef978d7 Baokun Li            2024-08-22  4262  					err = PTR_ERR(path);
8ad8d710035edf Eric Whitney         2020-05-10  4263  				goto out;
f064a9d6e7dbd3 Eric Whitney         2020-02-18  4264  			} else if (!ext4_ext_is_unwritten(ex)) {
8ad8d710035edf Eric Whitney         2020-05-10  4265  				map->m_flags |= EXT4_MAP_MAPPED;
8ad8d710035edf Eric Whitney         2020-05-10  4266  				map->m_pblk = newblock;
8ad8d710035edf Eric Whitney         2020-05-10  4267  				if (allocated > map->m_len)
8ad8d710035edf Eric Whitney         2020-05-10  4268  					allocated = map->m_len;
8ad8d710035edf Eric Whitney         2020-05-10  4269  				map->m_len = allocated;
8ad8d710035edf Eric Whitney         2020-05-10  4270  				ext4_ext_show_leaf(inode, path);
a86c61812637c7 Alex Tomas           2006-10-11  4271  				goto out;
f064a9d6e7dbd3 Eric Whitney         2020-02-18  4272  			}
69eb33dc24dc44 Zheng Liu            2013-02-18  4273  
2ec2e1043473b3 Baokun Li            2024-08-22  4274  			path = ext4_ext_handle_unwritten_extents(
2ec2e1043473b3 Baokun Li            2024-08-22  4275  				handle, inode, map, path, flags,
2ec2e1043473b3 Baokun Li            2024-08-22  4276  				&allocated, newblock);
2ec2e1043473b3 Baokun Li            2024-08-22  4277  			if (IS_ERR(path))
2ec2e1043473b3 Baokun Li            2024-08-22  4278  				err = PTR_ERR(path);
8ad8d710035edf Eric Whitney         2020-05-10  4279  			goto out;
56055d3ae4cc7f Amit Arora           2007-07-17  4280  		}
a86c61812637c7 Alex Tomas           2006-10-11  4281  	}
a86c61812637c7 Alex Tomas           2006-10-11  4282  
a86c61812637c7 Alex Tomas           2006-10-11  4283  	/*
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4284  	 * requested block isn't allocated yet;
547e64bda9c7bd Cheng Nie            2024-01-18  4285  	 * we couldn't try to create block if flags doesn't contain EXT4_GET_BLOCKS_CREATE
a86c61812637c7 Alex Tomas           2006-10-11  4286  	 */
c2177057331992 Theodore Ts'o        2009-05-14  4287  	if ((flags & EXT4_GET_BLOCKS_CREATE) == 0) {
6430dea07e8595 Zhang Yi             2024-01-27  4288  		ext4_lblk_t len;
140a52508a6838 Jan Kara             2016-03-09  4289  
6430dea07e8595 Zhang Yi             2024-01-27  4290  		len = ext4_ext_determine_insert_hole(inode, path, map->m_lblk);
facab4d9711e7a Jan Kara             2016-03-09  4291  
facab4d9711e7a Jan Kara             2016-03-09  4292  		map->m_pblk = 0;
6430dea07e8595 Zhang Yi             2024-01-27  4293  		map->m_len = min_t(unsigned int, map->m_len, len);
8ad8d710035edf Eric Whitney         2020-05-10  4294  		goto out;
a86c61812637c7 Alex Tomas           2006-10-11  4295  	}
4d33b1ef10995d Theodore Ts'o        2011-09-09  4296  
a86c61812637c7 Alex Tomas           2006-10-11  4297  	/*
c2ea3fde61f1df Theodore Ts'o        2008-10-10  4298  	 * Okay, we need to do block allocation.
a86c61812637c7 Alex Tomas           2006-10-11  4299  	 */
4d33b1ef10995d Theodore Ts'o        2011-09-09  4300  	newex.ee_block = cpu_to_le32(map->m_lblk);
d0abafac8c9162 Eric Whitney         2014-01-06  4301  	cluster_offset = EXT4_LBLK_COFF(sbi, map->m_lblk);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4302  
4d33b1ef10995d Theodore Ts'o        2011-09-09  4303  	/*
4d33b1ef10995d Theodore Ts'o        2011-09-09  4304  	 * If we are doing bigalloc, check to see if the extent returned
ed8a1a766af737 Theodore Ts'o        2014-09-01  4305  	 * by ext4_find_extent() implies a cluster we can use.
4d33b1ef10995d Theodore Ts'o        2011-09-09  4306  	 */
4d33b1ef10995d Theodore Ts'o        2011-09-09  4307  	if (cluster_offset && ex &&
d8990240d8c911 Aditya Kali          2011-09-09  4308  	    get_implied_cluster_alloc(inode->i_sb, map, ex, path)) {
4d33b1ef10995d Theodore Ts'o        2011-09-09  4309  		ar.len = allocated = map->m_len;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4310  		newblock = map->m_pblk;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4311  		goto got_allocated_blocks;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4312  	}
a86c61812637c7 Alex Tomas           2006-10-11  4313  
c9de560ded61fa Alex Tomas           2008-01-29  4314  	/* find neighbour allocated blocks */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4315  	ar.lleft = map->m_lblk;
c9de560ded61fa Alex Tomas           2008-01-29  4316  	err = ext4_ext_search_left(inode, path, &ar.lleft, &ar.pleft);
c9de560ded61fa Alex Tomas           2008-01-29  4317  	if (err)
8ad8d710035edf Eric Whitney         2020-05-10  4318  		goto out;
e35fd6609b2fee Theodore Ts'o        2010-05-16  4319  	ar.lright = map->m_lblk;
53ce42accd2002 Zhang Yi             2025-04-23  4320  	err = ext4_ext_search_right(inode, path, &ar.lright, &ar.pright,
402e38e6b71f57 Zhang Yi             2025-04-23  4321  				    &ex2, flags);
d7dce9e08595e8 yangerkun            2020-10-28  4322  	if (err < 0)
8ad8d710035edf Eric Whitney         2020-05-10  4323  		goto out;
25d14f983f70dd Amit Arora           2007-05-24  4324  
4d33b1ef10995d Theodore Ts'o        2011-09-09  4325  	/* Check if the extent after searching to the right implies a
4d33b1ef10995d Theodore Ts'o        2011-09-09  4326  	 * cluster we can use. */
d7dce9e08595e8 yangerkun            2020-10-28  4327  	if ((sbi->s_cluster_ratio > 1) && err &&
d7dce9e08595e8 yangerkun            2020-10-28  4328  	    get_implied_cluster_alloc(inode->i_sb, map, &ex2, path)) {
4d33b1ef10995d Theodore Ts'o        2011-09-09  4329  		ar.len = allocated = map->m_len;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4330  		newblock = map->m_pblk;
f7d1331f16a869 Baokun Li            2024-08-22  4331  		err = 0;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4332  		goto got_allocated_blocks;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4333  	}
4d33b1ef10995d Theodore Ts'o        2011-09-09  4334  
749269facaf87f Amit Arora           2007-07-18  4335  	/*
749269facaf87f Amit Arora           2007-07-18  4336  	 * See if request is beyond maximum number of blocks we can have in
749269facaf87f Amit Arora           2007-07-18  4337  	 * a single extent. For an initialized extent this limit is
556615dcbf38b0 Lukas Czerner        2014-04-20  4338  	 * EXT_INIT_MAX_LEN and for an unwritten extent this limit is
556615dcbf38b0 Lukas Czerner        2014-04-20  4339  	 * EXT_UNWRITTEN_MAX_LEN.
749269facaf87f Amit Arora           2007-07-18  4340  	 */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4341  	if (map->m_len > EXT_INIT_MAX_LEN &&
556615dcbf38b0 Lukas Czerner        2014-04-20  4342  	    !(flags & EXT4_GET_BLOCKS_UNWRIT_EXT))
e35fd6609b2fee Theodore Ts'o        2010-05-16  4343  		map->m_len = EXT_INIT_MAX_LEN;
556615dcbf38b0 Lukas Czerner        2014-04-20  4344  	else if (map->m_len > EXT_UNWRITTEN_MAX_LEN &&
556615dcbf38b0 Lukas Czerner        2014-04-20  4345  		 (flags & EXT4_GET_BLOCKS_UNWRIT_EXT))
556615dcbf38b0 Lukas Czerner        2014-04-20  4346  		map->m_len = EXT_UNWRITTEN_MAX_LEN;
749269facaf87f Amit Arora           2007-07-18  4347  
e35fd6609b2fee Theodore Ts'o        2010-05-16  4348  	/* Check if we can really insert (m_lblk)::(m_lblk + m_len) extent */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4349  	newex.ee_len = cpu_to_le16(map->m_len);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4350  	err = ext4_ext_check_overlap(sbi, inode, &newex, path);
25d14f983f70dd Amit Arora           2007-05-24  4351  	if (err)
b939e3766ec19e Aneesh Kumar K.V     2008-01-28  4352  		allocated = ext4_ext_get_actual_len(&newex);
25d14f983f70dd Amit Arora           2007-05-24  4353  	else
e35fd6609b2fee Theodore Ts'o        2010-05-16  4354  		allocated = map->m_len;
c9de560ded61fa Alex Tomas           2008-01-29  4355  
c9de560ded61fa Alex Tomas           2008-01-29  4356  	/* allocate new block */
c9de560ded61fa Alex Tomas           2008-01-29  4357  	ar.inode = inode;
e35fd6609b2fee Theodore Ts'o        2010-05-16  4358  	ar.goal = ext4_ext_find_goal(inode, path, map->m_lblk);
e35fd6609b2fee Theodore Ts'o        2010-05-16  4359  	ar.logical = map->m_lblk;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4360  	/*
4d33b1ef10995d Theodore Ts'o        2011-09-09  4361  	 * We calculate the offset from the beginning of the cluster
4d33b1ef10995d Theodore Ts'o        2011-09-09  4362  	 * for the logical block number, since when we allocate a
4d33b1ef10995d Theodore Ts'o        2011-09-09  4363  	 * physical cluster, the physical block should start at the
4d33b1ef10995d Theodore Ts'o        2011-09-09  4364  	 * same offset from the beginning of the cluster.  This is
4d33b1ef10995d Theodore Ts'o        2011-09-09  4365  	 * needed so that future calls to get_implied_cluster_alloc()
4d33b1ef10995d Theodore Ts'o        2011-09-09  4366  	 * work correctly.
4d33b1ef10995d Theodore Ts'o        2011-09-09  4367  	 */
f5a44db5d2d677 Theodore Ts'o        2013-12-20  4368  	offset = EXT4_LBLK_COFF(sbi, map->m_lblk);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4369  	ar.len = EXT4_NUM_B2C(sbi, offset+allocated);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4370  	ar.goal -= offset;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4371  	ar.logical -= offset;
c9de560ded61fa Alex Tomas           2008-01-29  4372  	if (S_ISREG(inode->i_mode))
c9de560ded61fa Alex Tomas           2008-01-29  4373  		ar.flags = EXT4_MB_HINT_DATA;
c9de560ded61fa Alex Tomas           2008-01-29  4374  	else
c9de560ded61fa Alex Tomas           2008-01-29  4375  		/* disable in-core preallocation for non-regular files */
c9de560ded61fa Alex Tomas           2008-01-29  4376  		ar.flags = 0;
556b27abf73833 Vivek Haldar         2011-05-25  4377  	if (flags & EXT4_GET_BLOCKS_NO_NORMALIZE)
556b27abf73833 Vivek Haldar         2011-05-25  4378  		ar.flags |= EXT4_MB_HINT_NOPREALLOC;
e3cf5d5d9a86df Theodore Ts'o        2014-09-04  4379  	if (flags & EXT4_GET_BLOCKS_DELALLOC_RESERVE)
e3cf5d5d9a86df Theodore Ts'o        2014-09-04  4380  		ar.flags |= EXT4_MB_DELALLOC_RESERVED;
c5e298ae53dc2e Theodore Ts'o        2015-06-21  4381  	if (flags & EXT4_GET_BLOCKS_METADATA_NOFAIL)
c5e298ae53dc2e Theodore Ts'o        2015-06-21  4382  		ar.flags |= EXT4_MB_USE_RESERVED;
c9de560ded61fa Alex Tomas           2008-01-29  4383  	newblock = ext4_mb_new_blocks(handle, &ar, &err);
a86c61812637c7 Alex Tomas           2006-10-11  4384  	if (!newblock)
8ad8d710035edf Eric Whitney         2020-05-10  4385  		goto out;
7b415bf60f6afb Aditya Kali          2011-09-09  4386  	allocated_clusters = ar.len;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4387  	ar.len = EXT4_C2B(sbi, ar.len) - offset;
70aa1554b01474 Ritesh Harjani       2020-05-10  4388  	ext_debug(inode, "allocate new block: goal %llu, found %llu/%u, requested %u\n",
ec8c60be96d6de Ritesh Harjani       2020-05-10  4389  		  ar.goal, newblock, ar.len, allocated);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4390  	if (ar.len > allocated)
4d33b1ef10995d Theodore Ts'o        2011-09-09  4391  		ar.len = allocated;
a86c61812637c7 Alex Tomas           2006-10-11  4392  
4d33b1ef10995d Theodore Ts'o        2011-09-09  4393  got_allocated_blocks:
a86c61812637c7 Alex Tomas           2006-10-11  4394  	/* try to insert new extent into found leaf and return */
8ad8d710035edf Eric Whitney         2020-05-10  4395  	pblk = newblock + offset;
8ad8d710035edf Eric Whitney         2020-05-10  4396  	ext4_ext_store_pblock(&newex, pblk);
c9de560ded61fa Alex Tomas           2008-01-29  4397  	newex.ee_len = cpu_to_le16(ar.len);
556615dcbf38b0 Lukas Czerner        2014-04-20  4398  	/* Mark unwritten */
556615dcbf38b0 Lukas Czerner        2014-04-20  4399  	if (flags & EXT4_GET_BLOCKS_UNWRIT_EXT) {
556615dcbf38b0 Lukas Czerner        2014-04-20  4400  		ext4_ext_mark_unwritten(&newex);
a25a4e1a5d5dc0 Zheng Liu            2013-02-18  4401  		map->m_flags |= EXT4_MAP_UNWRITTEN;
8d5d02e6b17656 Mingming Cao         2009-09-28  4402  	}
c8d46e41bc744c Jiaying Zhang        2010-02-24  4403  
f7d1331f16a869 Baokun Li            2024-08-22  4404  	path = ext4_ext_insert_extent(handle, inode, path, &newex, flags);
f7d1331f16a869 Baokun Li            2024-08-22  4405  	if (IS_ERR(path)) {
f7d1331f16a869 Baokun Li            2024-08-22  4406  		err = PTR_ERR(path);
34990461342fc9 Eric Whitney         2020-03-11  4407  		if (allocated_clusters) {
34990461342fc9 Eric Whitney         2020-03-11  4408  			int fb_flags = 0;
82e54229118785 Dmitry Monakhov      2012-09-28  4409  
34990461342fc9 Eric Whitney         2020-03-11  4410  			/*
34990461342fc9 Eric Whitney         2020-03-11  4411  			 * free data blocks we just allocated.
34990461342fc9 Eric Whitney         2020-03-11  4412  			 * not a good idea to call discard here directly,
34990461342fc9 Eric Whitney         2020-03-11  4413  			 * but otherwise we'd need to call it every free().
34990461342fc9 Eric Whitney         2020-03-11  4414  			 */
2ffd2a6ad1d3a8 Kemeng Shi           2024-01-05  4415  			ext4_discard_preallocations(inode);
34990461342fc9 Eric Whitney         2020-03-11  4416  			if (flags & EXT4_GET_BLOCKS_DELALLOC_RESERVE)
34990461342fc9 Eric Whitney         2020-03-11  4417  				fb_flags = EXT4_FREE_BLOCKS_NO_QUOT_UPDATE;
c8e15130e1636f Theodore Ts'o        2013-07-15  4418  			ext4_free_blocks(handle, inode, NULL, newblock,
34990461342fc9 Eric Whitney         2020-03-11  4419  					 EXT4_C2B(sbi, allocated_clusters),
34990461342fc9 Eric Whitney         2020-03-11  4420  					 fb_flags);
34990461342fc9 Eric Whitney         2020-03-11  4421  		}
8ad8d710035edf Eric Whitney         2020-05-10  4422  		goto out;
315054f023d28e Alex Tomas           2007-05-24  4423  	}
a86c61812637c7 Alex Tomas           2006-10-11  4424  
b436b9bef84de6 Jan Kara             2009-12-08  4425  	/*
b436b9bef84de6 Jan Kara             2009-12-08  4426  	 * Cache the extent and update transaction to commit on fdatasync only
556615dcbf38b0 Lukas Czerner        2014-04-20  4427  	 * when it is _not_ an unwritten extent.
b436b9bef84de6 Jan Kara             2009-12-08  4428  	 */
556615dcbf38b0 Lukas Czerner        2014-04-20  4429  	if ((flags & EXT4_GET_BLOCKS_UNWRIT_EXT) == 0)
b436b9bef84de6 Jan Kara             2009-12-08  4430  		ext4_update_inode_fsync_trans(handle, inode, 1);
69eb33dc24dc44 Zheng Liu            2013-02-18  4431  	else
b436b9bef84de6 Jan Kara             2009-12-08  4432  		ext4_update_inode_fsync_trans(handle, inode, 0);
8ad8d710035edf Eric Whitney         2020-05-10  4433  
8ad8d710035edf Eric Whitney         2020-05-10  4434  	map->m_flags |= (EXT4_MAP_NEW | EXT4_MAP_MAPPED);
8ad8d710035edf Eric Whitney         2020-05-10  4435  	map->m_pblk = pblk;
8ad8d710035edf Eric Whitney         2020-05-10  4436  	map->m_len = ar.len;
e35fd6609b2fee Theodore Ts'o        2010-05-16  4437  	allocated = map->m_len;
a86c61812637c7 Alex Tomas           2006-10-11  4438  	ext4_ext_show_leaf(inode, path);
8ad8d710035edf Eric Whitney         2020-05-10  4439  out:
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4440) 	/*
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4441) 	 * We never use EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF with CREATE flag.
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4442) 	 * So we know that the depth used here is correct, since there was no
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4443) 	 * block allocation done if EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF is set.
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4444) 	 * If tomorrow we start using this QUERY flag with CREATE, then we will
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4445) 	 * need to re-calculate the depth as it might have changed due to block
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4446) 	 * allocation.
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4447) 	 */
7acd1b315cdcc0 Ritesh Harjani (IBM  2025-05-19  4448) 	if (flags & EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF) {
7acd1b315cdcc0 Ritesh Harjani (IBM  2025-05-19  4449) 		WARN_ON_ONCE(flags & EXT4_GET_BLOCKS_CREATE);
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16 @4450) 		if (!err && ex && (ex == EXT_LAST_EXTENT(path[depth].p_hdr)))
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4451) 			map->m_flags |= EXT4_MAP_QUERY_LAST_IN_LEAF;
7acd1b315cdcc0 Ritesh Harjani (IBM  2025-05-19  4452) 	}
5bb12b1837c0bf Ritesh Harjani (IBM  2025-05-16  4453) 
7ff5fddaddf2cc Ye Bin               2022-09-24  4454  	ext4_free_ext_path(path);
e861304b8ed83f Allison Henderson    2011-05-25  4455  
63b999685cb372 Theodore Ts'o        2013-07-16  4456  	trace_ext4_ext_map_blocks_exit(inode, flags, map,
63b999685cb372 Theodore Ts'o        2013-07-16  4457  				       err ? err : allocated);
7877191c28b1e1 Lukas Czerner        2012-03-19  4458  	return err ? err : allocated;
a86c61812637c7 Alex Tomas           2006-10-11  4459  }
a86c61812637c7 Alex Tomas           2006-10-11  4460  

:::::: The code at line 4450 was first introduced by commit
:::::: 5bb12b1837c0bf7ddc84e27812f1693a126fe27a ext4: Add support for EXT4_GET_BLOCKS_QUERY_LEAF_BLOCKS

:::::: TO: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
