Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF01FD4
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777621844; cv=none; b=djk7Jl86ZqI4rx8yxWfYtHfLjV2azypDLxkotB5DLVkRqoI4ex256x6UegwPznyeBquluoSJWN8zrCUl2D0vkXciJAgRXGFE2WDeFJluu7ZSgKyjac+3f8ToHn1mWwOCHnHKiS3HCF63nW7GnjKAgBF9gEkpprE037QNUgU7Kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777621844; c=relaxed/simple;
	bh=HYm6nqNcyo5M3ir71YWXU13xEi5YhT9GvhsEQQYhrpY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hyDnMJ6CqzhfEsy8diFQtbVKNTThCtJLOflXvGAEk0TrWN0XoRldvJG6ijX+Fi4ttMPGlvxC5bp52jaOd4zcZUuGn4qtqZuZnv0y/KOWGfokawlJcNuAV581yEJib0B4uRQPxBgLJOhi5/wWagX2Qspz2nDqniqR+wmo9aFGNd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIoq6f2A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIoq6f2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777621842; x=1809157842;
  h=date:from:to:cc:subject:message-id;
  bh=HYm6nqNcyo5M3ir71YWXU13xEi5YhT9GvhsEQQYhrpY=;
  b=dIoq6f2AjhddULpF+rWcLFCo9wVYtpH45cCVdpIwWsP9CEhf+9N/4+r1
   bWtxsqr5dn6UcCaN8MZ7vEZ4kUSFWo2Ul3GIdW81Zbux3MEaaFu8U056R
   KuAvgp/zC2VoDW1niqYzhTUBh88I+pB4b/EGNzWUxGz2BezvZXWgy0o2R
   DmY2/1gofIGsC5cOnhvUnzGG4RJaT1rdx4UiL5ZWofP1elln8LrMqqyxJ
   DmlzEsO1uVOKbbs/d/sptmJ86IefZzyaaF3VenY25SoTjRGavo6XddNeh
   AGjggih2YaAcM+y/6HVMtOUGPa7i/vFZLqCQRMpFzh4qtVkLR6sZpxFAz
   Q==;
X-CSE-ConnectionGUID: fztYF3NWRGicJ6HHrvBLUw==
X-CSE-MsgGUID: hrwUio29R0itnk5yxWxisw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="104034346"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="104034346"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 00:50:41 -0700
X-CSE-ConnectionGUID: E+txHWsfRJCxRkr6GflVtQ==
X-CSE-MsgGUID: TJVzGkgCTrWXrH79qOI8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="230460682"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2026 00:50:40 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIidx-000000000Kx-42jE;
	Fri, 01 May 2026 07:50:37 +0000
Date: Fri, 01 May 2026 15:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn:
 variable dereferenced before check 'ni' (see line 122)
Message-ID: <202605011540.0FJWFGIn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26fd6bff2c050196005312d1d306889220952a99
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
date:   2 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-161-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011540.0FJWFGIn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605011540.0FJWFGIn-lkp@intel.com/

New smatch warnings:
fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'ni' (see line 122)
fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'attr' (see line 122)
fs/ntfs/attrib.c:2807 ntfs_attr_open() warn: variable dereferenced before check 'ni' (see line 2804)

Old smatch warnings:
fs/ntfs/attrib.c:2115 ntfs_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2111)
fs/ntfs/attrib.c:2237 ntfs_non_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2232)
fs/ntfs/attrib.c:4951 ntfs_attr_remove() warn: variable dereferenced before check 'ni' (see line 4950)

vim +/ni +126 fs/ntfs/attrlist.c

495e90fa334828d Namjae Jeon 2026-02-13  104  
495e90fa334828d Namjae Jeon 2026-02-13  105  /*
495e90fa334828d Namjae Jeon 2026-02-13  106   * ntfs_attrlist_entry_add - add an attribute list attribute entry
495e90fa334828d Namjae Jeon 2026-02-13  107   * @ni:	opened ntfs inode, which contains that attribute
495e90fa334828d Namjae Jeon 2026-02-13  108   * @attr: attribute record to add to attribute list
495e90fa334828d Namjae Jeon 2026-02-13  109   *
495e90fa334828d Namjae Jeon 2026-02-13  110   * Return 0 on success and -errno on error.
495e90fa334828d Namjae Jeon 2026-02-13  111   */
495e90fa334828d Namjae Jeon 2026-02-13  112  int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
495e90fa334828d Namjae Jeon 2026-02-13  113  {
495e90fa334828d Namjae Jeon 2026-02-13  114  	struct attr_list_entry *ale;
495e90fa334828d Namjae Jeon 2026-02-13  115  	__le64 mref;
495e90fa334828d Namjae Jeon 2026-02-13  116  	struct ntfs_attr_search_ctx *ctx;
495e90fa334828d Namjae Jeon 2026-02-13  117  	u8 *new_al;
495e90fa334828d Namjae Jeon 2026-02-13  118  	int entry_len, entry_offset, err;
495e90fa334828d Namjae Jeon 2026-02-13  119  	struct mft_record *ni_mrec;
495e90fa334828d Namjae Jeon 2026-02-13  120  	u8 *old_al;
495e90fa334828d Namjae Jeon 2026-02-13  121  
495e90fa334828d Namjae Jeon 2026-02-13 @122  	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
495e90fa334828d Namjae Jeon 2026-02-13  123  			(long long) ni->mft_no,
495e90fa334828d Namjae Jeon 2026-02-13  124  			(unsigned int) le32_to_cpu(attr->type));
495e90fa334828d Namjae Jeon 2026-02-13  125  
495e90fa334828d Namjae Jeon 2026-02-13 @126  	if (!ni || !attr) {
495e90fa334828d Namjae Jeon 2026-02-13  127  		ntfs_debug("Invalid arguments.\n");
495e90fa334828d Namjae Jeon 2026-02-13  128  		return -EINVAL;
495e90fa334828d Namjae Jeon 2026-02-13  129  	}
495e90fa334828d Namjae Jeon 2026-02-13  130  
495e90fa334828d Namjae Jeon 2026-02-13  131  	ni_mrec = map_mft_record(ni);
495e90fa334828d Namjae Jeon 2026-02-13  132  	if (IS_ERR(ni_mrec)) {
495e90fa334828d Namjae Jeon 2026-02-13  133  		ntfs_debug("Invalid arguments.\n");
495e90fa334828d Namjae Jeon 2026-02-13  134  		return -EIO;
495e90fa334828d Namjae Jeon 2026-02-13  135  	}
495e90fa334828d Namjae Jeon 2026-02-13  136  
495e90fa334828d Namjae Jeon 2026-02-13  137  	mref = MK_LE_MREF(ni->mft_no, le16_to_cpu(ni_mrec->sequence_number));
495e90fa334828d Namjae Jeon 2026-02-13  138  	unmap_mft_record(ni);
495e90fa334828d Namjae Jeon 2026-02-13  139  
495e90fa334828d Namjae Jeon 2026-02-13  140  	if (ni->nr_extents == -1)
495e90fa334828d Namjae Jeon 2026-02-13  141  		ni = ni->ext.base_ntfs_ino;
495e90fa334828d Namjae Jeon 2026-02-13  142  
495e90fa334828d Namjae Jeon 2026-02-13  143  	if (!NInoAttrList(ni)) {
495e90fa334828d Namjae Jeon 2026-02-13  144  		ntfs_debug("Attribute list isn't present.\n");
495e90fa334828d Namjae Jeon 2026-02-13  145  		return -ENOENT;
495e90fa334828d Namjae Jeon 2026-02-13  146  	}
495e90fa334828d Namjae Jeon 2026-02-13  147  
495e90fa334828d Namjae Jeon 2026-02-13  148  	/* Determine size and allocate memory for new attribute list. */
495e90fa334828d Namjae Jeon 2026-02-13  149  	entry_len = (sizeof(struct attr_list_entry) + sizeof(__le16) *
495e90fa334828d Namjae Jeon 2026-02-13  150  			attr->name_length + 7) & ~7;
495e90fa334828d Namjae Jeon 2026-02-13  151  	new_al = kvzalloc(ni->attr_list_size + entry_len, GFP_NOFS);
495e90fa334828d Namjae Jeon 2026-02-13  152  	if (!new_al)
495e90fa334828d Namjae Jeon 2026-02-13  153  		return -ENOMEM;
495e90fa334828d Namjae Jeon 2026-02-13  154  
495e90fa334828d Namjae Jeon 2026-02-13  155  	/* Find place for the new entry. */
495e90fa334828d Namjae Jeon 2026-02-13  156  	ctx = ntfs_attr_get_search_ctx(ni, NULL);
495e90fa334828d Namjae Jeon 2026-02-13  157  	if (!ctx) {
495e90fa334828d Namjae Jeon 2026-02-13  158  		err = -ENOMEM;
495e90fa334828d Namjae Jeon 2026-02-13  159  		ntfs_error(ni->vol->sb, "Failed to get search context");
495e90fa334828d Namjae Jeon 2026-02-13  160  		goto err_out;
495e90fa334828d Namjae Jeon 2026-02-13  161  	}
495e90fa334828d Namjae Jeon 2026-02-13  162  
495e90fa334828d Namjae Jeon 2026-02-13  163  	err = ntfs_attr_lookup(attr->type, (attr->name_length) ? (__le16 *)
495e90fa334828d Namjae Jeon 2026-02-13  164  			((u8 *)attr + le16_to_cpu(attr->name_offset)) :
495e90fa334828d Namjae Jeon 2026-02-13  165  			AT_UNNAMED, attr->name_length, CASE_SENSITIVE,
495e90fa334828d Namjae Jeon 2026-02-13  166  			(attr->non_resident) ? le64_to_cpu(attr->data.non_resident.lowest_vcn) :
495e90fa334828d Namjae Jeon 2026-02-13  167  			0, (attr->non_resident) ? NULL : ((u8 *)attr +
495e90fa334828d Namjae Jeon 2026-02-13  168  			le16_to_cpu(attr->data.resident.value_offset)), (attr->non_resident) ?
495e90fa334828d Namjae Jeon 2026-02-13  169  			0 : le32_to_cpu(attr->data.resident.value_length), ctx);
495e90fa334828d Namjae Jeon 2026-02-13  170  	if (!err) {
495e90fa334828d Namjae Jeon 2026-02-13  171  		/* Found some extent, check it to be before new extent. */
495e90fa334828d Namjae Jeon 2026-02-13  172  		if (ctx->al_entry->lowest_vcn == attr->data.non_resident.lowest_vcn) {
495e90fa334828d Namjae Jeon 2026-02-13  173  			err = -EEXIST;
495e90fa334828d Namjae Jeon 2026-02-13  174  			ntfs_debug("Such attribute already present in the attribute list.\n");
495e90fa334828d Namjae Jeon 2026-02-13  175  			ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon 2026-02-13  176  			goto err_out;
495e90fa334828d Namjae Jeon 2026-02-13  177  		}
495e90fa334828d Namjae Jeon 2026-02-13  178  		/* Add new entry after this extent. */
495e90fa334828d Namjae Jeon 2026-02-13  179  		ale = (struct attr_list_entry *)((u8 *)ctx->al_entry +
495e90fa334828d Namjae Jeon 2026-02-13  180  				le16_to_cpu(ctx->al_entry->length));
495e90fa334828d Namjae Jeon 2026-02-13  181  	} else {
495e90fa334828d Namjae Jeon 2026-02-13  182  		/* Check for real errors. */
495e90fa334828d Namjae Jeon 2026-02-13  183  		if (err != -ENOENT) {
495e90fa334828d Namjae Jeon 2026-02-13  184  			ntfs_debug("Attribute lookup failed.\n");
495e90fa334828d Namjae Jeon 2026-02-13  185  			ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon 2026-02-13  186  			goto err_out;
495e90fa334828d Namjae Jeon 2026-02-13  187  		}
495e90fa334828d Namjae Jeon 2026-02-13  188  		/* No previous extents found. */
495e90fa334828d Namjae Jeon 2026-02-13  189  		ale = ctx->al_entry;
495e90fa334828d Namjae Jeon 2026-02-13  190  	}
495e90fa334828d Namjae Jeon 2026-02-13  191  	/* Don't need it anymore, @ctx->al_entry points to @ni->attr_list. */
495e90fa334828d Namjae Jeon 2026-02-13  192  	ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon 2026-02-13  193  
495e90fa334828d Namjae Jeon 2026-02-13  194  	/* Determine new entry offset. */
495e90fa334828d Namjae Jeon 2026-02-13  195  	entry_offset = ((u8 *)ale - ni->attr_list);
495e90fa334828d Namjae Jeon 2026-02-13  196  	/* Set pointer to new entry. */
495e90fa334828d Namjae Jeon 2026-02-13  197  	ale = (struct attr_list_entry *)(new_al + entry_offset);
495e90fa334828d Namjae Jeon 2026-02-13  198  	memset(ale, 0, entry_len);
495e90fa334828d Namjae Jeon 2026-02-13  199  	/* Form new entry. */
495e90fa334828d Namjae Jeon 2026-02-13  200  	ale->type = attr->type;
495e90fa334828d Namjae Jeon 2026-02-13  201  	ale->length = cpu_to_le16(entry_len);
495e90fa334828d Namjae Jeon 2026-02-13  202  	ale->name_length = attr->name_length;
495e90fa334828d Namjae Jeon 2026-02-13  203  	ale->name_offset = offsetof(struct attr_list_entry, name);
495e90fa334828d Namjae Jeon 2026-02-13  204  	if (attr->non_resident)
495e90fa334828d Namjae Jeon 2026-02-13  205  		ale->lowest_vcn = attr->data.non_resident.lowest_vcn;
495e90fa334828d Namjae Jeon 2026-02-13  206  	else
495e90fa334828d Namjae Jeon 2026-02-13  207  		ale->lowest_vcn = 0;
495e90fa334828d Namjae Jeon 2026-02-13  208  	ale->mft_reference = mref;
495e90fa334828d Namjae Jeon 2026-02-13  209  	ale->instance = attr->instance;
495e90fa334828d Namjae Jeon 2026-02-13  210  	memcpy(ale->name, (u8 *)attr + le16_to_cpu(attr->name_offset),
495e90fa334828d Namjae Jeon 2026-02-13  211  			attr->name_length * sizeof(__le16));
495e90fa334828d Namjae Jeon 2026-02-13  212  
495e90fa334828d Namjae Jeon 2026-02-13  213  	/* Copy entries from old attribute list to new. */
495e90fa334828d Namjae Jeon 2026-02-13  214  	memcpy(new_al, ni->attr_list, entry_offset);
495e90fa334828d Namjae Jeon 2026-02-13  215  	memcpy(new_al + entry_offset + entry_len, ni->attr_list +
495e90fa334828d Namjae Jeon 2026-02-13  216  			entry_offset, ni->attr_list_size - entry_offset);
495e90fa334828d Namjae Jeon 2026-02-13  217  
495e90fa334828d Namjae Jeon 2026-02-13  218  	/* Set new runlist. */
495e90fa334828d Namjae Jeon 2026-02-13  219  	old_al = ni->attr_list;
495e90fa334828d Namjae Jeon 2026-02-13  220  	ni->attr_list = new_al;
495e90fa334828d Namjae Jeon 2026-02-13  221  	ni->attr_list_size = ni->attr_list_size + entry_len;
495e90fa334828d Namjae Jeon 2026-02-13  222  
495e90fa334828d Namjae Jeon 2026-02-13  223  	err = ntfs_attrlist_update(ni);
495e90fa334828d Namjae Jeon 2026-02-13  224  	if (err) {
495e90fa334828d Namjae Jeon 2026-02-13  225  		ni->attr_list = old_al;
495e90fa334828d Namjae Jeon 2026-02-13  226  		ni->attr_list_size -= entry_len;
495e90fa334828d Namjae Jeon 2026-02-13  227  		goto err_out;
495e90fa334828d Namjae Jeon 2026-02-13  228  	}
495e90fa334828d Namjae Jeon 2026-02-13  229  	kvfree(old_al);
495e90fa334828d Namjae Jeon 2026-02-13  230  	return 0;
495e90fa334828d Namjae Jeon 2026-02-13  231  err_out:
495e90fa334828d Namjae Jeon 2026-02-13  232  	kvfree(new_al);
495e90fa334828d Namjae Jeon 2026-02-13  233  	return err;
495e90fa334828d Namjae Jeon 2026-02-13  234  }
495e90fa334828d Namjae Jeon 2026-02-13  235  

:::::: The code at line 126 was first introduced by commit
:::::: 495e90fa334828d4119061e2726af51d0a0fb4ed ntfs: update attrib operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
