Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158042D7DE9
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645214; cv=none; b=P5VRGAwpv42ydiYaXT6QnYE2XKx3UwCnvFWi+B8B+z/IISzOqQvXo4Iab3cEYpxlWzoyFYkwe2N/bl8JLn+RITckk7DTl/R/7R2oueQh0qVFpEGTuPFyYafslTtiFQrHwRovfLld0yKqD+Y4nNqqtt/leC3KQ9GpnBek2Q19gsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645214; c=relaxed/simple;
	bh=FKRemWGNhfvyf1WcVEY1s+4kyjnnf532zyAjYRZ4Lm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwiQ9mhJ2Qp/MOEqJixFvC63NxbQVNyIEGFvZ8WM13xr+iSWYh+BagypIlepSO9gPPJ+qU4Xvm0y1KcZNBLiNz/RkHkV7eIzQDNN2aYDeh457Femqest8qIimH0uIsJkkqxMMdgkfYEv82GCZoFpwN7C4o5gi2ImRxdxdgnf+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmQSEGJ+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmQSEGJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765645209; x=1797181209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKRemWGNhfvyf1WcVEY1s+4kyjnnf532zyAjYRZ4Lm4=;
  b=GmQSEGJ+13UbKmV4koiSYo16TREPEEAWaZ6DWDTWUsZfWIByYdC9RVW2
   4ZO8QproBwni50+RNiRfYXcScCTVg9w+7V7zlBp9+NNy71Hb9uKD56rBZ
   xUw7f58fJg/cMxkX1tsyWNR0jxIvmA9zeKpvyLV6q9af3+SF6Ae0m4cqp
   HudQmX3Bf2X6c5aamX+a0AAjKVyAs8I16brlOofl076/bQzlNpVIk1gFD
   lGrfw4QqHhClEEFA6wTowRNBLZEPPbqOI88omfeZN4SilGuKj24j53D8d
   Mu99igjbufGyspBX9yl5jiwATh4N0Ic9KpqT0Jotc3IZs0uCOKVKig83I
   A==;
X-CSE-ConnectionGUID: NNl20m1KSDOL2CYKg77nQw==
X-CSE-MsgGUID: NSVdO+6yQDODvGGgeWX7yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66789662"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66789662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:00:06 -0800
X-CSE-ConnectionGUID: klEaBNL9QbOh6KryDJjwuA==
X-CSE-MsgGUID: 09KDwSQfSyaOOvan7NUv2g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 09:00:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSyQ-000000007xF-30ra;
	Sat, 13 Dec 2025 17:00:02 +0000
Date: Sun, 14 Dec 2025 00:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1942/1942] fs/ext2/xattr.c:381:34:
 warning: 'here' may be used uninitialized in this function
Message-ID: <202512140050.ZKsl2sal-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Yang Yingliang <yangyingliang@huawei.com>

Hi Jan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: c34dcc731a8f3cfe6051af7c1c6d8cf31872f42a [1942/1942] ext2: Merge loops in ext2_xattr_set()
:::::: branch date: 10 hours ago
:::::: commit date: 4 years, 4 months ago
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140050.ZKsl2sal-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140050.ZKsl2sal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140050.ZKsl2sal-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/ext2/xattr.c: In function 'ext2_xattr_get':
   fs/ext2/xattr.c:218:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     218 |                 ea_idebug(inode, "cache insert failed");
         |                                                        ^
   fs/ext2/xattr.c:227:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     227 |                 ea_idebug(inode, "cache insert failed");
         |                                                        ^
   fs/ext2/xattr.c: In function 'ext2_xattr_list':
   fs/ext2/xattr.c:300:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     300 |                 ea_idebug(inode, "cache insert failed");
         |                                                        ^
   fs/ext2/xattr.c: In function 'ext2_xattr_cache_insert':
   fs/ext2/xattr.c:853:59: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
     853 |                 ea_bdebug(bh, "inserting [%x]", (int)hash);
         |                                                           ^
   fs/ext2/xattr.c: In function 'ext2_xattr_set':
>> fs/ext2/xattr.c:381:34: warning: 'here' may be used uninitialized in this function [-Wmaybe-uninitialized]
     381 |         struct ext2_xattr_entry *here, *last;
         |                                  ^~~~


vim +/here +381 fs/ext2/xattr.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  361  
^1da177e4c3f41 Linus Torvalds     2005-04-16  362  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  363   * ext2_xattr_set()
^1da177e4c3f41 Linus Torvalds     2005-04-16  364   *
6e9510b0e0de65 Wang Sheng-Hui     2011-01-10  365   * Create, replace or remove an extended attribute for this inode.  Value
^1da177e4c3f41 Linus Torvalds     2005-04-16  366   * is NULL to remove an existing extended attribute, and non-NULL to
^1da177e4c3f41 Linus Torvalds     2005-04-16  367   * either replace an existing extended attribute, or create a new extended
^1da177e4c3f41 Linus Torvalds     2005-04-16  368   * attribute. The flags XATTR_REPLACE and XATTR_CREATE
^1da177e4c3f41 Linus Torvalds     2005-04-16  369   * specify that an extended attribute must exist and must not exist
^1da177e4c3f41 Linus Torvalds     2005-04-16  370   * previous to the call, respectively.
^1da177e4c3f41 Linus Torvalds     2005-04-16  371   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  372   * Returns 0, or a negative error number on failure.
^1da177e4c3f41 Linus Torvalds     2005-04-16  373   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  374  int
^1da177e4c3f41 Linus Torvalds     2005-04-16  375  ext2_xattr_set(struct inode *inode, int name_index, const char *name,
^1da177e4c3f41 Linus Torvalds     2005-04-16  376  	       const void *value, size_t value_len, int flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  377  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  378  	struct super_block *sb = inode->i_sb;
^1da177e4c3f41 Linus Torvalds     2005-04-16  379  	struct buffer_head *bh = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  380  	struct ext2_xattr_header *header = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16 @381  	struct ext2_xattr_entry *here, *last;
^1da177e4c3f41 Linus Torvalds     2005-04-16  382  	size_t name_len, free, min_offs = sb->s_blocksize;
^1da177e4c3f41 Linus Torvalds     2005-04-16  383  	int not_found = 1, error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  384  	char *end;
^1da177e4c3f41 Linus Torvalds     2005-04-16  385  	
^1da177e4c3f41 Linus Torvalds     2005-04-16  386  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  387  	 * header -- Points either into bh, or to a temporarily
^1da177e4c3f41 Linus Torvalds     2005-04-16  388  	 *           allocated buffer.
^1da177e4c3f41 Linus Torvalds     2005-04-16  389  	 * here -- The named entry found, or the place for inserting, within
^1da177e4c3f41 Linus Torvalds     2005-04-16  390  	 *         the block pointed to by header.
^1da177e4c3f41 Linus Torvalds     2005-04-16  391  	 * last -- Points right after the last named entry within the block
^1da177e4c3f41 Linus Torvalds     2005-04-16  392  	 *         pointed to by header.
^1da177e4c3f41 Linus Torvalds     2005-04-16  393  	 * min_offs -- The offset of the first value (values are aligned
^1da177e4c3f41 Linus Torvalds     2005-04-16  394  	 *             towards the end of the block).
^1da177e4c3f41 Linus Torvalds     2005-04-16  395  	 * end -- Points right after the block pointed to by header.
^1da177e4c3f41 Linus Torvalds     2005-04-16  396  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  397  	
^1da177e4c3f41 Linus Torvalds     2005-04-16  398  	ea_idebug(inode, "name=%d.%s, value=%p, value_len=%ld",
^1da177e4c3f41 Linus Torvalds     2005-04-16  399  		  name_index, name, value, (long)value_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  400  
^1da177e4c3f41 Linus Torvalds     2005-04-16  401  	if (value == NULL)
^1da177e4c3f41 Linus Torvalds     2005-04-16  402  		value_len = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  403  	if (name == NULL)
^1da177e4c3f41 Linus Torvalds     2005-04-16  404  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  405  	name_len = strlen(name);
^1da177e4c3f41 Linus Torvalds     2005-04-16  406  	if (name_len > 255 || value_len > sb->s_blocksize)
^1da177e4c3f41 Linus Torvalds     2005-04-16  407  		return -ERANGE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  408  	down_write(&EXT2_I(inode)->xattr_sem);
^1da177e4c3f41 Linus Torvalds     2005-04-16  409  	if (EXT2_I(inode)->i_file_acl) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  410  		/* The inode already has an extended attribute block. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  411  		bh = sb_bread(sb, EXT2_I(inode)->i_file_acl);
^1da177e4c3f41 Linus Torvalds     2005-04-16  412  		error = -EIO;
^1da177e4c3f41 Linus Torvalds     2005-04-16  413  		if (!bh)
^1da177e4c3f41 Linus Torvalds     2005-04-16  414  			goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  415  		ea_bdebug(bh, "b_count=%d, refcount=%d",
^1da177e4c3f41 Linus Torvalds     2005-04-16  416  			atomic_read(&(bh->b_count)),
^1da177e4c3f41 Linus Torvalds     2005-04-16  417  			le32_to_cpu(HDR(bh)->h_refcount));
^1da177e4c3f41 Linus Torvalds     2005-04-16  418  		header = HDR(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  419  		end = bh->b_data + bh->b_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  420  		if (header->h_magic != cpu_to_le32(EXT2_XATTR_MAGIC) ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  421  		    header->h_blocks != cpu_to_le32(1)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  422  bad_block:		ext2_error(sb, "ext2_xattr_set",
^1da177e4c3f41 Linus Torvalds     2005-04-16  423  				"inode %ld: bad block %d", inode->i_ino, 
^1da177e4c3f41 Linus Torvalds     2005-04-16  424  				   EXT2_I(inode)->i_file_acl);
^1da177e4c3f41 Linus Torvalds     2005-04-16  425  			error = -EIO;
^1da177e4c3f41 Linus Torvalds     2005-04-16  426  			goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  427  		}
c34dcc731a8f3c Jan Kara           2021-08-24  428  		/*
c34dcc731a8f3c Jan Kara           2021-08-24  429  		 * Find the named attribute. If not found, 'here' will point
c34dcc731a8f3c Jan Kara           2021-08-24  430  		 * to entry where the new attribute should be inserted to
c34dcc731a8f3c Jan Kara           2021-08-24  431  		 * maintain sorting.
c34dcc731a8f3c Jan Kara           2021-08-24  432  		 */
c34dcc731a8f3c Jan Kara           2021-08-24  433  		last = FIRST_ENTRY(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  434  		while (!IS_LAST_ENTRY(last)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  435  			struct ext2_xattr_entry *next = EXT2_XATTR_NEXT(last);
^1da177e4c3f41 Linus Torvalds     2005-04-16  436  			if ((char *)next >= end)
^1da177e4c3f41 Linus Torvalds     2005-04-16  437  				goto bad_block;
^1da177e4c3f41 Linus Torvalds     2005-04-16  438  			if (!last->e_value_block && last->e_value_size) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  439  				size_t offs = le16_to_cpu(last->e_value_offs);
^1da177e4c3f41 Linus Torvalds     2005-04-16  440  				if (offs < min_offs)
^1da177e4c3f41 Linus Torvalds     2005-04-16  441  					min_offs = offs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  442  			}
c34dcc731a8f3c Jan Kara           2021-08-24  443  			if (not_found > 0) {
c34dcc731a8f3c Jan Kara           2021-08-24  444  				not_found = name_index - last->e_name_index;
c34dcc731a8f3c Jan Kara           2021-08-24  445  				if (!not_found)
c34dcc731a8f3c Jan Kara           2021-08-24  446  					not_found = name_len - last->e_name_len;
c34dcc731a8f3c Jan Kara           2021-08-24  447  				if (!not_found) {
c34dcc731a8f3c Jan Kara           2021-08-24  448  					not_found = memcmp(name, last->e_name,
c34dcc731a8f3c Jan Kara           2021-08-24  449  							   name_len);
c34dcc731a8f3c Jan Kara           2021-08-24  450  				}
c34dcc731a8f3c Jan Kara           2021-08-24  451  				if (not_found <= 0)
c34dcc731a8f3c Jan Kara           2021-08-24  452  					here = last;
c34dcc731a8f3c Jan Kara           2021-08-24  453  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  454  			last = next;
^1da177e4c3f41 Linus Torvalds     2005-04-16  455  		}
c34dcc731a8f3c Jan Kara           2021-08-24  456  		if (not_found > 0)
c34dcc731a8f3c Jan Kara           2021-08-24  457  			here = last;
^1da177e4c3f41 Linus Torvalds     2005-04-16  458  
^1da177e4c3f41 Linus Torvalds     2005-04-16  459  		/* Check whether we have enough space left. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  460  		free = min_offs - ((char*)last - (char*)header) - sizeof(__u32);
^1da177e4c3f41 Linus Torvalds     2005-04-16  461  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  462  		/* We will use a new extended attribute block. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  463  		free = sb->s_blocksize -
^1da177e4c3f41 Linus Torvalds     2005-04-16  464  			sizeof(struct ext2_xattr_header) - sizeof(__u32);
^1da177e4c3f41 Linus Torvalds     2005-04-16  465  		here = last = NULL;  /* avoid gcc uninitialized warning. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  466  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  467  
^1da177e4c3f41 Linus Torvalds     2005-04-16  468  	if (not_found) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  469  		/* Request to remove a nonexistent attribute? */
^1da177e4c3f41 Linus Torvalds     2005-04-16  470  		error = -ENODATA;
^1da177e4c3f41 Linus Torvalds     2005-04-16  471  		if (flags & XATTR_REPLACE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  472  			goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  473  		error = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  474  		if (value == NULL)
^1da177e4c3f41 Linus Torvalds     2005-04-16  475  			goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  476  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  477  		/* Request to create an existing attribute? */
^1da177e4c3f41 Linus Torvalds     2005-04-16  478  		error = -EEXIST;
^1da177e4c3f41 Linus Torvalds     2005-04-16  479  		if (flags & XATTR_CREATE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  480  			goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  481  		if (!here->e_value_block && here->e_value_size) {
1d57bdebf64621 Chengguang Xu      2021-08-24  482  			if (!ext2_xattr_entry_valid(here, sb->s_blocksize))
^1da177e4c3f41 Linus Torvalds     2005-04-16  483  				goto bad_block;
1d57bdebf64621 Chengguang Xu      2021-08-24  484  			free += EXT2_XATTR_SIZE(
1d57bdebf64621 Chengguang Xu      2021-08-24  485  					le32_to_cpu(here->e_value_size));
^1da177e4c3f41 Linus Torvalds     2005-04-16  486  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  487  		free += EXT2_XATTR_LEN(name_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  488  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  489  	error = -ENOSPC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  490  	if (free < EXT2_XATTR_LEN(name_len) + EXT2_XATTR_SIZE(value_len))
^1da177e4c3f41 Linus Torvalds     2005-04-16  491  		goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  492  
^1da177e4c3f41 Linus Torvalds     2005-04-16  493  	/* Here we know that we can set the new attribute. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  494  
^1da177e4c3f41 Linus Torvalds     2005-04-16  495  	if (header) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  496  		/* assert(header == HDR(bh)); */
^1da177e4c3f41 Linus Torvalds     2005-04-16  497  		lock_buffer(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  498  		if (header->h_refcount == cpu_to_le32(1)) {
be0726d33cb8f4 Jan Kara           2016-02-22  499  			__u32 hash = le32_to_cpu(header->h_hash);
be0726d33cb8f4 Jan Kara           2016-02-22  500  
^1da177e4c3f41 Linus Torvalds     2005-04-16  501  			ea_bdebug(bh, "modifying in-place");
be0726d33cb8f4 Jan Kara           2016-02-22  502  			/*
be0726d33cb8f4 Jan Kara           2016-02-22  503  			 * This must happen under buffer lock for
be0726d33cb8f4 Jan Kara           2016-02-22  504  			 * ext2_xattr_set2() to reliably detect modified block
be0726d33cb8f4 Jan Kara           2016-02-22  505  			 */
47387409ee2e09 Tahsin Erdogan     2017-06-22  506  			mb_cache_entry_delete(EA_BLOCK_CACHE(inode), hash,
c07dfcb45877fb Tahsin Erdogan     2017-06-22  507  					      bh->b_blocknr);
be0726d33cb8f4 Jan Kara           2016-02-22  508  
^1da177e4c3f41 Linus Torvalds     2005-04-16  509  			/* keep the buffer locked while modifying it. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  510  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  511  			int offset;
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  
^1da177e4c3f41 Linus Torvalds     2005-04-16  513  			unlock_buffer(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  514  			ea_bdebug(bh, "cloning");
^1da177e4c3f41 Linus Torvalds     2005-04-16  515  			header = kmalloc(bh->b_size, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  516  			error = -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  517  			if (header == NULL)
^1da177e4c3f41 Linus Torvalds     2005-04-16  518  				goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  519  			memcpy(header, HDR(bh), bh->b_size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  520  			header->h_refcount = cpu_to_le32(1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  521  
^1da177e4c3f41 Linus Torvalds     2005-04-16  522  			offset = (char *)here - bh->b_data;
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  			here = ENTRY((char *)header + offset);
^1da177e4c3f41 Linus Torvalds     2005-04-16  524  			offset = (char *)last - bh->b_data;
^1da177e4c3f41 Linus Torvalds     2005-04-16  525  			last = ENTRY((char *)header + offset);
^1da177e4c3f41 Linus Torvalds     2005-04-16  526  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  527  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  528  		/* Allocate a buffer where we construct the new block. */
f8314dc60ccba7 Panagiotis Issaris 2006-09-27  529  		header = kzalloc(sb->s_blocksize, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  530  		error = -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  531  		if (header == NULL)
^1da177e4c3f41 Linus Torvalds     2005-04-16  532  			goto cleanup;
^1da177e4c3f41 Linus Torvalds     2005-04-16  533  		end = (char *)header + sb->s_blocksize;
^1da177e4c3f41 Linus Torvalds     2005-04-16  534  		header->h_magic = cpu_to_le32(EXT2_XATTR_MAGIC);
^1da177e4c3f41 Linus Torvalds     2005-04-16  535  		header->h_blocks = header->h_refcount = cpu_to_le32(1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  536  		last = here = ENTRY(header+1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  537  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  538  
^1da177e4c3f41 Linus Torvalds     2005-04-16  539  	/* Iff we are modifying the block in-place, bh is locked here. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  540  
^1da177e4c3f41 Linus Torvalds     2005-04-16  541  	if (not_found) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  542  		/* Insert the new name. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  543  		size_t size = EXT2_XATTR_LEN(name_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  544  		size_t rest = (char *)last - (char *)here;
^1da177e4c3f41 Linus Torvalds     2005-04-16  545  		memmove((char *)here + size, here, rest);
^1da177e4c3f41 Linus Torvalds     2005-04-16  546  		memset(here, 0, size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  547  		here->e_name_index = name_index;
^1da177e4c3f41 Linus Torvalds     2005-04-16  548  		here->e_name_len = name_len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  549  		memcpy(here->e_name, name, name_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  550  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  551  		if (!here->e_value_block && here->e_value_size) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  552  			char *first_val = (char *)header + min_offs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  553  			size_t offs = le16_to_cpu(here->e_value_offs);
^1da177e4c3f41 Linus Torvalds     2005-04-16  554  			char *val = (char *)header + offs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  555  			size_t size = EXT2_XATTR_SIZE(
^1da177e4c3f41 Linus Torvalds     2005-04-16  556  				le32_to_cpu(here->e_value_size));
^1da177e4c3f41 Linus Torvalds     2005-04-16  557  
^1da177e4c3f41 Linus Torvalds     2005-04-16  558  			if (size == EXT2_XATTR_SIZE(value_len)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  559  				/* The old and the new value have the same
^1da177e4c3f41 Linus Torvalds     2005-04-16  560  				   size. Just replace. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  561  				here->e_value_size = cpu_to_le32(value_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  562  				memset(val + size - EXT2_XATTR_PAD, 0,
^1da177e4c3f41 Linus Torvalds     2005-04-16  563  				       EXT2_XATTR_PAD); /* Clear pad bytes. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  564  				memcpy(val, value, value_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  565  				goto skip_replace;
^1da177e4c3f41 Linus Torvalds     2005-04-16  566  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  567  
^1da177e4c3f41 Linus Torvalds     2005-04-16  568  			/* Remove the old value. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  569  			memmove(first_val + size, first_val, val - first_val);
^1da177e4c3f41 Linus Torvalds     2005-04-16  570  			memset(first_val, 0, size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  571  			here->e_value_offs = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  572  			min_offs += size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  573  
^1da177e4c3f41 Linus Torvalds     2005-04-16  574  			/* Adjust all value offsets. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  575  			last = ENTRY(header+1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  576  			while (!IS_LAST_ENTRY(last)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  577  				size_t o = le16_to_cpu(last->e_value_offs);
^1da177e4c3f41 Linus Torvalds     2005-04-16  578  				if (!last->e_value_block && o < offs)
^1da177e4c3f41 Linus Torvalds     2005-04-16  579  					last->e_value_offs =
^1da177e4c3f41 Linus Torvalds     2005-04-16  580  						cpu_to_le16(o + size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  581  				last = EXT2_XATTR_NEXT(last);
^1da177e4c3f41 Linus Torvalds     2005-04-16  582  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  583  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  584  		if (value == NULL) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  585  			/* Remove the old name. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  586  			size_t size = EXT2_XATTR_LEN(name_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  587  			last = ENTRY((char *)last - size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  588  			memmove(here, (char*)here + size,
^1da177e4c3f41 Linus Torvalds     2005-04-16  589  				(char*)last - (char*)here);
^1da177e4c3f41 Linus Torvalds     2005-04-16  590  			memset(last, 0, size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  591  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  592  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  593  
^1da177e4c3f41 Linus Torvalds     2005-04-16  594  	if (value != NULL) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  595  		/* Insert the new value. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  596  		here->e_value_size = cpu_to_le32(value_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  597  		if (value_len) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  598  			size_t size = EXT2_XATTR_SIZE(value_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  599  			char *val = (char *)header + min_offs - size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  600  			here->e_value_offs =
^1da177e4c3f41 Linus Torvalds     2005-04-16  601  				cpu_to_le16((char *)val - (char *)header);
^1da177e4c3f41 Linus Torvalds     2005-04-16  602  			memset(val + size - EXT2_XATTR_PAD, 0,
^1da177e4c3f41 Linus Torvalds     2005-04-16  603  			       EXT2_XATTR_PAD); /* Clear the pad bytes. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  604  			memcpy(val, value, value_len);
^1da177e4c3f41 Linus Torvalds     2005-04-16  605  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  606  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  607  
^1da177e4c3f41 Linus Torvalds     2005-04-16  608  skip_replace:
^1da177e4c3f41 Linus Torvalds     2005-04-16  609  	if (IS_LAST_ENTRY(ENTRY(header+1))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  610  		/* This block is now empty. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  611  		if (bh && header == HDR(bh))
^1da177e4c3f41 Linus Torvalds     2005-04-16  612  			unlock_buffer(bh);  /* we were modifying in-place. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  613  		error = ext2_xattr_set2(inode, bh, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  614  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  615  		ext2_xattr_rehash(header, here);
^1da177e4c3f41 Linus Torvalds     2005-04-16  616  		if (bh && header == HDR(bh))
^1da177e4c3f41 Linus Torvalds     2005-04-16  617  			unlock_buffer(bh);  /* we were modifying in-place. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  618  		error = ext2_xattr_set2(inode, bh, header);
^1da177e4c3f41 Linus Torvalds     2005-04-16  619  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  620  
^1da177e4c3f41 Linus Torvalds     2005-04-16  621  cleanup:
^1da177e4c3f41 Linus Torvalds     2005-04-16  622  	if (!(bh && header == HDR(bh)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  623  		kfree(header);
ffaaaf68be1e3c Pan Bian           2018-11-25  624  	brelse(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  625  	up_write(&EXT2_I(inode)->xattr_sem);
^1da177e4c3f41 Linus Torvalds     2005-04-16  626  
^1da177e4c3f41 Linus Torvalds     2005-04-16  627  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  628  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  629  

:::::: The code at line 381 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
