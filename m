Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCA731ED9F
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554897; cv=none; b=gk81jUG+BSfb83dNXku4cFXrqK+YQnPSA1zf4udHtGeXYb9fE54eHo7hGh7f+0wWQz69sGNFrA4XGQJz/dVHPuhnIzUZdUQ5EsZ5psLsSr76Ul1b/39HtOBV0fG3WP38EgjKwBLt6gtNhXkSY3d+9hYnyANDmlvqSn0oKaWtwNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554897; c=relaxed/simple;
	bh=UCmsOBxlipTfFpYoOg5kosDO4XJSZBv067kaWzvFMXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BEyNANpJHmPkpBerTbph3chMRBSk98vWGwBYJ5E4q/yoyER74ZiTDdV0uL0fkdVCMMld0l1BjZyWz0VFw4bHUnaY7m2tlMWkXw+A9nv7nNR7JaWcAuJ+RH1IiuqbEeoyLKMIdXY1bNi4vBqAEUE7DpXk9k3tShUlb0K+qxoIrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IT6fyZIi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IT6fyZIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768554892; x=1800090892;
  h=date:from:to:cc:subject:message-id;
  bh=UCmsOBxlipTfFpYoOg5kosDO4XJSZBv067kaWzvFMXQ=;
  b=IT6fyZIivjN1q0mezQtfUXCayUmEr26OeJPRgal34Xt2NRzdji1w5voT
   FAtwikoGOjEf4zFCTc/8hcilcNVUjp1eIhJZBMlns1/HGgLkuimYAYUjV
   wXXeE4wlpSGHwXcOyZv0k+l7dB8gUMXnISkbqnKOP14/tWrveB4v10QLU
   cCd+Mnl1gwGB4u/fqaYaU7RM/hcINh5yuJotBUyNTXEaQLDBahEkqTKq9
   6qRPc7Lx5sA5w50REPh5bAa4qBKHtp0G/Uoyqk+hSnTDtxkyWXVmNgP0Z
   uSRNtLyyQOn0J/3K3kFb279Z780Z1KF8J4E0WJp9czEbkBZ3UfDSUbWRo
   g==;
X-CSE-ConnectionGUID: G7BcffZvRluvfepZSaPk8g==
X-CSE-MsgGUID: TsgCxEBAS7iapuaUD4lv5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69071491"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69071491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:14:51 -0800
X-CSE-ConnectionGUID: pK0emZaEQCW4yfpmG0hz7w==
X-CSE-MsgGUID: UX3nAngIRNWLitDCuf5ISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="210222649"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 01:14:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgfup-00000000Kdu-1Byc;
	Fri, 16 Jan 2026 09:14:47 +0000
Date: Fri, 16 Jan 2026 17:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4] fs/afs/dir_edit.c:427
 afs_edit_dir_remove() error: buffer overflow 'meta->meta.alloc_ctrs' 128 <=
 128
Message-ID: <202601161720.SkpQfhoJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 7e8ea8e80a469742993b1aa006b44ef8911001a0 [4/4] afs: Fix directory format encoding struct
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161720.SkpQfhoJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601161720.SkpQfhoJ-lkp@intel.com/

smatch warnings:
fs/afs/dir_edit.c:427 afs_edit_dir_remove() error: buffer overflow 'meta->meta.alloc_ctrs' 128 <= 128

vim +427 fs/afs/dir_edit.c

63a4681ff39cb6 David Howells 2018-04-06  366  
63a4681ff39cb6 David Howells 2018-04-06  367  /*
63a4681ff39cb6 David Howells 2018-04-06  368   * Edit a directory's file data to remove a new directory entry.  Doing this
63a4681ff39cb6 David Howells 2018-04-06  369   * after unlink, rmdir or rename if the data version number is incremented by
63a4681ff39cb6 David Howells 2018-04-06  370   * exactly one avoids the need to re-download the entire directory contents.
63a4681ff39cb6 David Howells 2018-04-06  371   *
63a4681ff39cb6 David Howells 2018-04-06  372   * The caller must hold the inode locked.
63a4681ff39cb6 David Howells 2018-04-06  373   */
63a4681ff39cb6 David Howells 2018-04-06  374  void afs_edit_dir_remove(struct afs_vnode *vnode,
63a4681ff39cb6 David Howells 2018-04-06  375  			 struct qstr *name, enum afs_edit_dir_reason why)
63a4681ff39cb6 David Howells 2018-04-06  376  {
63a4681ff39cb6 David Howells 2018-04-06  377  	union afs_xdr_dir_block *meta, *block;
63a4681ff39cb6 David Howells 2018-04-06  378  	union afs_xdr_dirent *de;
255ed63638da19 David Howells 2021-08-11  379  	struct folio *folio0, *folio;
63a4681ff39cb6 David Howells 2018-04-06  380  	unsigned int need_slots, nr_blocks, b;
63a4681ff39cb6 David Howells 2018-04-06  381  	pgoff_t index;
63a4681ff39cb6 David Howells 2018-04-06  382  	loff_t i_size;
63a4681ff39cb6 David Howells 2018-04-06  383  	int slot;
63a4681ff39cb6 David Howells 2018-04-06  384  
63a4681ff39cb6 David Howells 2018-04-06  385  	_enter(",,{%d,%s},", name->len, name->name);
63a4681ff39cb6 David Howells 2018-04-06  386  
874c8ca1e60b2c David Howells 2022-06-09  387  	i_size = i_size_read(&vnode->netfs.inode);
63a4681ff39cb6 David Howells 2018-04-06  388  	if (i_size < AFS_DIR_BLOCK_SIZE ||
63a4681ff39cb6 David Howells 2018-04-06  389  	    i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
63a4681ff39cb6 David Howells 2018-04-06  390  	    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
63a4681ff39cb6 David Howells 2018-04-06  391  		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
63a4681ff39cb6 David Howells 2018-04-06  392  		return;
63a4681ff39cb6 David Howells 2018-04-06  393  	}
63a4681ff39cb6 David Howells 2018-04-06  394  	nr_blocks = i_size / AFS_DIR_BLOCK_SIZE;
63a4681ff39cb6 David Howells 2018-04-06  395  
255ed63638da19 David Howells 2021-08-11  396  	folio0 = afs_dir_get_folio(vnode, 0);
255ed63638da19 David Howells 2021-08-11  397  	if (!folio0) {
63a4681ff39cb6 David Howells 2018-04-06  398  		_leave(" [fgp]");
63a4681ff39cb6 David Howells 2018-04-06  399  		return;
63a4681ff39cb6 David Howells 2018-04-06  400  	}
63a4681ff39cb6 David Howells 2018-04-06  401  
63a4681ff39cb6 David Howells 2018-04-06  402  	/* Work out how many slots we're going to discard. */
366911cd762db0 David Howells 2020-12-23  403  	need_slots = afs_dir_calc_slots(name->len);
63a4681ff39cb6 David Howells 2018-04-06  404  
255ed63638da19 David Howells 2021-08-11  405  	meta = kmap_local_folio(folio0, 0);
63a4681ff39cb6 David Howells 2018-04-06  406  
255ed63638da19 David Howells 2021-08-11  407  	/* Find a block that has sufficient slots available.  Each folio
63a4681ff39cb6 David Howells 2018-04-06  408  	 * contains two or more directory blocks.
63a4681ff39cb6 David Howells 2018-04-06  409  	 */
63a4681ff39cb6 David Howells 2018-04-06  410  	for (b = 0; b < nr_blocks; b++) {
63a4681ff39cb6 David Howells 2018-04-06  411  		index = b / AFS_DIR_BLOCKS_PER_PAGE;
255ed63638da19 David Howells 2021-08-11  412  		if (index >= folio_nr_pages(folio0)) {
255ed63638da19 David Howells 2021-08-11  413  			folio = afs_dir_get_folio(vnode, index);
255ed63638da19 David Howells 2021-08-11  414  			if (!folio)
63a4681ff39cb6 David Howells 2018-04-06  415  				goto error;
63a4681ff39cb6 David Howells 2018-04-06  416  		} else {
255ed63638da19 David Howells 2021-08-11  417  			folio = folio0;
63a4681ff39cb6 David Howells 2018-04-06  418  		}
63a4681ff39cb6 David Howells 2018-04-06  419  
255ed63638da19 David Howells 2021-08-11  420  		block = kmap_local_folio(folio, b * AFS_DIR_BLOCK_SIZE - folio_file_pos(folio));
255ed63638da19 David Howells 2021-08-11  421  
63a4681ff39cb6 David Howells 2018-04-06  422  		/* Abandon the edit if we got a callback break. */
63a4681ff39cb6 David Howells 2018-04-06  423  		if (!test_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
63a4681ff39cb6 David Howells 2018-04-06  424  			goto invalidated;
63a4681ff39cb6 David Howells 2018-04-06  425  
63a4681ff39cb6 David Howells 2018-04-06  426  		if (b > AFS_DIR_BLOCKS_WITH_CTR ||
63a4681ff39cb6 David Howells 2018-04-06 @427  		    meta->meta.alloc_ctrs[b] <= AFS_DIR_SLOTS_PER_BLOCK - 1 - need_slots) {
63a4681ff39cb6 David Howells 2018-04-06  428  			slot = afs_dir_scan_block(block, name, b);
63a4681ff39cb6 David Howells 2018-04-06  429  			if (slot >= 0)
63a4681ff39cb6 David Howells 2018-04-06  430  				goto found_dirent;
63a4681ff39cb6 David Howells 2018-04-06  431  		}
63a4681ff39cb6 David Howells 2018-04-06  432  
255ed63638da19 David Howells 2021-08-11  433  		kunmap_local(block);
255ed63638da19 David Howells 2021-08-11  434  		if (folio != folio0) {
255ed63638da19 David Howells 2021-08-11  435  			folio_unlock(folio);
255ed63638da19 David Howells 2021-08-11  436  			folio_put(folio);
63a4681ff39cb6 David Howells 2018-04-06  437  		}
63a4681ff39cb6 David Howells 2018-04-06  438  	}
63a4681ff39cb6 David Howells 2018-04-06  439  
63a4681ff39cb6 David Howells 2018-04-06  440  	/* Didn't find the dirent to clobber.  Download the directory again. */
63a4681ff39cb6 David Howells 2018-04-06  441  	trace_afs_edit_dir(vnode, why, afs_edit_dir_delete_noent,
63a4681ff39cb6 David Howells 2018-04-06  442  			   0, 0, 0, 0, name->name);
63a4681ff39cb6 David Howells 2018-04-06  443  	clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
63a4681ff39cb6 David Howells 2018-04-06  444  	goto out_unmap;
63a4681ff39cb6 David Howells 2018-04-06  445  
63a4681ff39cb6 David Howells 2018-04-06  446  found_dirent:
63a4681ff39cb6 David Howells 2018-04-06  447  	de = &block->dirents[slot];
63a4681ff39cb6 David Howells 2018-04-06  448  
63a4681ff39cb6 David Howells 2018-04-06  449  	trace_afs_edit_dir(vnode, why, afs_edit_dir_delete, b, slot,
63a4681ff39cb6 David Howells 2018-04-06  450  			   ntohl(de->u.vnode), ntohl(de->u.unique),
63a4681ff39cb6 David Howells 2018-04-06  451  			   name->name);
63a4681ff39cb6 David Howells 2018-04-06  452  
63a4681ff39cb6 David Howells 2018-04-06  453  	memset(de, 0, sizeof(*de) * need_slots);
63a4681ff39cb6 David Howells 2018-04-06  454  
63a4681ff39cb6 David Howells 2018-04-06  455  	/* Adjust the bitmap. */
63a4681ff39cb6 David Howells 2018-04-06  456  	afs_clear_contig_bits(block, slot, need_slots);
255ed63638da19 David Howells 2021-08-11  457  	kunmap_local(block);
255ed63638da19 David Howells 2021-08-11  458  	if (folio != folio0) {
255ed63638da19 David Howells 2021-08-11  459  		folio_unlock(folio);
255ed63638da19 David Howells 2021-08-11  460  		folio_put(folio);
63a4681ff39cb6 David Howells 2018-04-06  461  	}
63a4681ff39cb6 David Howells 2018-04-06  462  
63a4681ff39cb6 David Howells 2018-04-06  463  	/* Adjust the allocation counter. */
63a4681ff39cb6 David Howells 2018-04-06  464  	if (b < AFS_DIR_BLOCKS_WITH_CTR)
63a4681ff39cb6 David Howells 2018-04-06  465  		meta->meta.alloc_ctrs[b] += need_slots;
63a4681ff39cb6 David Howells 2018-04-06  466  
874c8ca1e60b2c David Howells 2022-06-09  467  	inode_set_iversion_raw(&vnode->netfs.inode, vnode->status.data_version);
63a4681ff39cb6 David Howells 2018-04-06  468  	afs_stat_v(vnode, n_dir_rm);
63a4681ff39cb6 David Howells 2018-04-06  469  	_debug("Remove %s from %u[%u]", name->name, b, slot);
63a4681ff39cb6 David Howells 2018-04-06  470  
63a4681ff39cb6 David Howells 2018-04-06  471  out_unmap:
255ed63638da19 David Howells 2021-08-11  472  	kunmap_local(meta);
255ed63638da19 David Howells 2021-08-11  473  	folio_unlock(folio0);
255ed63638da19 David Howells 2021-08-11  474  	folio_put(folio0);
63a4681ff39cb6 David Howells 2018-04-06  475  	_leave("");
63a4681ff39cb6 David Howells 2018-04-06  476  	return;
63a4681ff39cb6 David Howells 2018-04-06  477  
63a4681ff39cb6 David Howells 2018-04-06  478  invalidated:
63a4681ff39cb6 David Howells 2018-04-06  479  	trace_afs_edit_dir(vnode, why, afs_edit_dir_delete_inval,
63a4681ff39cb6 David Howells 2018-04-06  480  			   0, 0, 0, 0, name->name);
63a4681ff39cb6 David Howells 2018-04-06  481  	clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
255ed63638da19 David Howells 2021-08-11  482  	kunmap_local(block);
255ed63638da19 David Howells 2021-08-11  483  	if (folio != folio0) {
255ed63638da19 David Howells 2021-08-11  484  		folio_unlock(folio);
255ed63638da19 David Howells 2021-08-11  485  		folio_put(folio);
63a4681ff39cb6 David Howells 2018-04-06  486  	}
63a4681ff39cb6 David Howells 2018-04-06  487  	goto out_unmap;
63a4681ff39cb6 David Howells 2018-04-06  488  
63a4681ff39cb6 David Howells 2018-04-06  489  error:
63a4681ff39cb6 David Howells 2018-04-06  490  	trace_afs_edit_dir(vnode, why, afs_edit_dir_delete_error,
63a4681ff39cb6 David Howells 2018-04-06  491  			   0, 0, 0, 0, name->name);
63a4681ff39cb6 David Howells 2018-04-06  492  	clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
63a4681ff39cb6 David Howells 2018-04-06  493  	goto out_unmap;
63a4681ff39cb6 David Howells 2018-04-06  494  }
790dc90b96481c David Howells 2024-10-23  495  

:::::: The code at line 427 was first introduced by commit
:::::: 63a4681ff39cb63314b8ff41319e70fb0e606ed2 afs: Locally edit directory data for mkdir/create/unlink/...

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
