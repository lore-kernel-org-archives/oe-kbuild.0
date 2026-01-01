Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F832BAF4
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 02:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767235529; cv=none; b=FX5d/a0atn0JzRSKzENxtyWQeb3k1dnh3rBbx5ELaJ4fpdkIreB43p1KifI+Y3ew/63OOa0Yy5Vt44Wfb7jirsppiXh/rPfnqcp086d0/bapT23hpzJ8pA9aJE69G+ddwA13jISBXyqJxpvU3kLympeKIona2tlgm2EYLtPgDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767235529; c=relaxed/simple;
	bh=ADA7tGQslF6A7GwdD9g5be9LigRn0s+n2uNb4UNSGBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BqAcl8NLUkN6eQoB+fhGhDigpFw+VBxDDJIHoA5TdshWlRUYEsF2R35IG39R+Plcu8O08WsovL2jR+Tr3nxxD2D1PLlhlAXz32b14ri0ljsnrMgMx1BF2o2cvrpHp5PuoGgo204X4tzbnOX8Dr3D5WRlvW2yDVIiI7yF35gWz+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SimmDyMj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SimmDyMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767235527; x=1798771527;
  h=date:from:to:cc:subject:message-id;
  bh=ADA7tGQslF6A7GwdD9g5be9LigRn0s+n2uNb4UNSGBM=;
  b=SimmDyMj1wZw/g6y65tzj72/b1PUD88ZeqoRY33XrDTBdhPEcH6jhQ5g
   S8bzHVLVxM1J5nATYglBlOnjTRT/P0vTbcN7rL9m+02NslaxfG1FUyWoP
   HNZQ7cQEVujUjhuSXqWXm6AGIsMefNJKQy71w+kDkbvPGoB+qLJGmJp0A
   qlcZpdJfP3yDczf8VYRWM8oR2NObpBRy/HPdjGXqXyMNLO4LW5K5T2Q8c
   0Q0NiZMEK0LaJHSrjJfdC32Qh9zk11E0mvVLZEoo5HDjZI7ugBsLBKR6H
   dU9xyx7IZTzHzSUf5aKfVbVQzRmlJDFMHkafrEnEA+49TV1IKK63sHr39
   w==;
X-CSE-ConnectionGUID: Z0nS4XaaTfeaZ4kcL+owGQ==
X-CSE-MsgGUID: 8gLVdpgiQUqmPUzarb0XTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="80234184"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="80234184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 18:45:26 -0800
X-CSE-ConnectionGUID: YG+b8K+lQeyFanD1dWETZA==
X-CSE-MsgGUID: 6mR2HmIgRkaaFofjVf6HPw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Dec 2025 18:45:24 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb8gk-000000001dB-0168;
	Thu, 01 Jan 2026 02:45:22 +0000
Date: Thu, 01 Jan 2026 10:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/aops.c:189
 ntfs_write_mft_block() error: uninitialized symbol 'rl'.
Message-ID: <202601011039.XQz6IhJU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   8d80646ca301cf38045a4b3e64f5cd2e9f81ba85
commit: 48dfd6c60be6089e6349b7124222b12d2607691d [13/14] ntfs: add Kconfig and Makefile
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011039.XQz6IhJU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011039.XQz6IhJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601011039.XQz6IhJU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/ntfs/collate.c:68 function parameter 'vol' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data1' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data1_len' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data2' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data2_len' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:107 function parameter 'vol' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data1' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data1_len' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data2' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data2_len' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:68 function parameter 'vol' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data1' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data1_len' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data2' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:68 function parameter 'data2_len' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfs/collate.c:107 function parameter 'vol' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data1' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data1_len' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data2' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfs/collate.c:107 function parameter 'data2_len' not described in 'ntfs_collate_file_name'
--
>> Warning: fs/ntfs/aops.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel address space operations and page cache handling.
--
>> Warning: fs/ntfs/unistr.c:225 function parameter 'vol' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins_len' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'outs' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'max_name_len' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'vol' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins_len' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'outs' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'max_name_len' not described in 'ntfs_nlstoucs'
--
>> Warning: fs/ntfs/namei.c:1555 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Inode operations for directories.
--
>> Warning: fs/ntfs/index.c:279 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Get the subnode vcn to which the index entry refers.
   Warning: fs/ntfs/index.c:307 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Find the last entry in the index block
   Warning: fs/ntfs/index.c:393 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Insert @ie index entry at @pos entry. Used @ih values should be ok already.
   Warning: fs/ntfs/index.c:558 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Find a key in the index block.
   Warning: fs/ntfs/index.c:883 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Find the median by going through all the entries
>> Warning: fs/ntfs/index.c:1286 function parameter 'icx' not described in 'ntfs_ir_truncate'
>> Warning: fs/ntfs/index.c:1286 function parameter 'data_size' not described in 'ntfs_ir_truncate'
>> Warning: fs/ntfs/index.c:1313 function parameter 'icx' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfs/index.c:1313 function parameter 'data_size' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfs/index.c:1467 function parameter 'icx' not described in 'ntfs_ib_split'
>> Warning: fs/ntfs/index.c:1467 function parameter 'ib' not described in 'ntfs_ib_split'
   Warning: fs/ntfs/index.c:1680 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Used if an empty index block to be deleted has END entry as the parent
   Warning: fs/ntfs/index.c:1702 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Used if an empty index block to be deleted has END entry as the parent
>> Warning: fs/ntfs/index.c:2009 function parameter 'ie' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2009 function parameter 'ictx' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ie' not described in 'ntfs_index_next'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ictx' not described in 'ntfs_index_next'
>> Warning: fs/ntfs/index.c:1286 function parameter 'icx' not described in 'ntfs_ir_truncate'
>> Warning: fs/ntfs/index.c:1286 function parameter 'data_size' not described in 'ntfs_ir_truncate'
>> Warning: fs/ntfs/index.c:1313 function parameter 'icx' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfs/index.c:1313 function parameter 'data_size' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfs/index.c:1467 function parameter 'icx' not described in 'ntfs_ib_split'
>> Warning: fs/ntfs/index.c:1467 function parameter 'ib' not described in 'ntfs_ib_split'
>> Warning: fs/ntfs/index.c:2009 function parameter 'ie' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2009 function parameter 'ictx' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ie' not described in 'ntfs_index_next'
   Warning: fs/ntfs/index.c:2075 function parameter 'ictx' not described in 'ntfs_index_next'
--
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'vol' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'start_vcn' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'count' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'start_lcn' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'zone' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'is_extension' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'is_contig' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'is_dealloc' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'vol' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'start_vcn' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'count' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'start_lcn' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'zone' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'is_extension' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'is_contig' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfs/lcnalloc.c:177 function parameter 'is_dealloc' not described in 'ntfs_cluster_alloc'
--
>> Warning: fs/ntfs/super.c:1025 function parameter 'vol' not described in 'load_and_check_logfile'
>> Warning: fs/ntfs/super.c:1025 function parameter 'rp' not described in 'load_and_check_logfile'
>> Warning: fs/ntfs/super.c:2217 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * The complete super operations.
>> Warning: fs/ntfs/super.c:2256 cannot understand function prototype: 'struct lock_class_key ntfs_mft_inval_lock_key;'
>> Warning: fs/ntfs/super.c:1025 function parameter 'vol' not described in 'load_and_check_logfile'
>> Warning: fs/ntfs/super.c:1025 function parameter 'rp' not described in 'load_and_check_logfile'
--
>> Warning: fs/ntfs/mft.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel mft record operations. Part of the Linux-NTFS project.
>> Warning: fs/ntfs/mft.c:93 expecting prototype for map_mft_record_page(). Prototype was for map_mft_record_folio() instead
>> Warning: fs/ntfs/mft.c:2116 function parameter 'ni' not described in 'ntfs_mft_record_alloc'
>> Warning: fs/ntfs/mft.c:2116 function parameter 'ni' not described in 'ntfs_mft_record_alloc'
--
>> Warning: fs/ntfs/runlist.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS runlist handling code.
>> Warning: fs/ntfs/runlist.c:28 function parameter 'base' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:28 function parameter 'dst' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:28 function parameter 'src' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:28 function parameter 'size' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'dstbase' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'dst' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'srcbase' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'src' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'size' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'dst' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'dsize' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'src' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'ssize' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'loc' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'new_size' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:249 function parameter 'dst' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfs/runlist.c:249 function parameter 'dsize' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfs/runlist.c:249 function parameter 'src' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfs/runlist.c:249 function parameter 'ssize' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'loc' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'new_size' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:336 function parameter 'dst' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'dsize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'src' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'ssize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'loc' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'new_size' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dst' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dsize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'src' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'ssize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'loc' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'new_size' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:468 function parameter 'd_runlist' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'srl' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 's_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'new_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:677 function parameter 'vol' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'attr' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'old_runlist' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'new_rl_count' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'vol' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'rl' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'first_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'last_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'max_mp_size' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'vol' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst_len' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'first_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'last_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'de_cluster_count' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:28 function parameter 'base' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'dst' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'src' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'size' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:41 function parameter 'dstbase' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'dst' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'srcbase' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'src' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'size' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:192 function parameter 'dst' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'dsize' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'src' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'ssize' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'loc' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'new_size' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:249 function parameter 'dst' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'dsize' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'src' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'ssize' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'loc' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'new_size' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:336 function parameter 'dst' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'dsize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'src' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'ssize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'loc' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'new_size' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dst' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dsize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'src' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'ssize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'loc' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'new_size' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:468 function parameter 'd_runlist' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'srl' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 's_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'new_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:677 function parameter 'vol' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'attr' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'old_runlist' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'new_rl_count' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'vol' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'rl' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'first_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'last_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'max_mp_size' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'vol' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst_len' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'first_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'last_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'de_cluster_count' not described in 'ntfs_mapping_pairs_build'
--
>> Warning: fs/ntfs/compress.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel compressed attributes handling.
>> Warning: fs/ntfs/compress.c:53 expecting prototype for enum of. Prototype was for enum  instead
>> Warning: fs/ntfs/compress.c:58 cannot understand function prototype: 'u8 *ntfs_compression_buffer;'
>> Warning: fs/ntfs/compress.c:63 function parameter 'ntfs_cb_lock' not described in 'DEFINE_MUTEX'
>> Warning: fs/ntfs/compress.c:63 expecting prototype for ntfs_cb_lock(). Prototype was for DEFINE_MUTEX() instead
>> Warning: fs/ntfs/compress.c:106 function parameter 'page' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfs/compress.c:106 function parameter 'initialized_size' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'page' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'i_size' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'initialized_size' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:106 function parameter 'page' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfs/compress.c:106 function parameter 'initialized_size' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'page' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'i_size' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'initialized_size' not described in 'handle_bounds_compressed_page'
--
>> Warning: fs/ntfs/dir.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel directory operations. Part of the Linux-NTFS project.
   Warning: fs/ntfs/dir.c:18 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * The little endian Unicode string $I30 as a global constant.
..

New smatch warnings:
fs/ntfs/aops.c:189 ntfs_write_mft_block() error: uninitialized symbol 'rl'.
fs/ntfs/namei.c:360 ntfs_sd_add_everyone() warn: assigning (-32764) to unsigned variable 'sd->control'
fs/ntfs/namei.c:1079 ntfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ntfs/iomap.c:454 ntfs_write_iomap_begin_non_resident() error: uninitialized symbol 'err'.
fs/ntfs/file.c:72 ntfs_file_open() error: we previously assumed 'ni->runlist.rl' could be null (see line 64)
fs/ntfs/ea.c:437 ntfs_ea_set_wsl_inode() error: uninitialized symbol 'err'.
fs/ntfs/bitmap.c:273 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/dir.c:1032 ntfs_readdir() error: we previously assumed 'private' could be null (see line 848)
fs/ntfs/lcnalloc.c:338 ntfs_cluster_alloc() warn: mask and shift to zero: expr='lcn >> 3'
fs/ntfs/lcnalloc.c:706 ntfs_cluster_alloc() error: we previously assumed 'rl' could be null (see line 688)
fs/ntfs/index.c:1274 ntfs_ir_reparent() warn: variable dereferenced before check 'ctx' (see line 1245)
fs/ntfs/index.c:2042 ntfs_index_walk_up() warn: inconsistent indenting
fs/ntfs/runlist.c:1586 ntfs_rl_insert_range() warn: variable dereferenced before check 'src_rl' (see line 1583)
fs/ntfs/mft.c:1054 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn: mask and shift to zero: expr='bit >> 3'
fs/ntfs/mft.c:2554 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2132)
fs/ntfs/inode.c:3265 ntfs_inode_close() warn: variable dereferenced before check 'tmp_nis' (see line 3242)
fs/ntfs/attrib.c:176 ntfs_map_runlist_nolock() error: uninitialized symbol 'ctx_needs_reset'.
fs/ntfs/attrib.c:4909 ntfs_attr_remove() warn: variable dereferenced before check 'ni' (see line 4908)

Old smatch warnings:
fs/ntfs/namei.c:239 ntfs_lookup() warn: passing zero to 'ERR_PTR'
fs/ntfs/bitmap.c:281 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/bitmap.c:286 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/bitmap.c:291 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/inode.c:2144 ntfs_read_inode_mount() warn: missing unwind goto?

vim +/rl +189 fs/ntfs/aops.c

c8ac6fa986ca7a Namjae Jeon 2025-12-29   @2  /**
c8ac6fa986ca7a Namjae Jeon 2025-12-29    3   * NTFS kernel address space operations and page cache handling.
9099d47575938c Namjae Jeon 2025-12-18    4   *
9099d47575938c Namjae Jeon 2025-12-18    5   * Copyright (c) 2001-2014 Anton Altaparmakov and Tuxera Inc.
9099d47575938c Namjae Jeon 2025-12-18    6   * Copyright (c) 2002 Richard Russon
c8ac6fa986ca7a Namjae Jeon 2025-12-29    7   * Copyright (c) 2025 LG Electronics Co., Ltd.
9099d47575938c Namjae Jeon 2025-12-18    8   */
9099d47575938c Namjae Jeon 2025-12-18    9  
9099d47575938c Namjae Jeon 2025-12-18   10  #include <linux/writeback.h>
c8ac6fa986ca7a Namjae Jeon 2025-12-29   11  #include <linux/mpage.h>
c8ac6fa986ca7a Namjae Jeon 2025-12-29   12  #include <linux/uio.h>
9099d47575938c Namjae Jeon 2025-12-18   13  
9099d47575938c Namjae Jeon 2025-12-18   14  #include "aops.h"
9099d47575938c Namjae Jeon 2025-12-18   15  #include "attrib.h"
9099d47575938c Namjae Jeon 2025-12-18   16  #include "mft.h"
9099d47575938c Namjae Jeon 2025-12-18   17  #include "ntfs.h"
c8ac6fa986ca7a Namjae Jeon 2025-12-29   18  #include "debug.h"
c8ac6fa986ca7a Namjae Jeon 2025-12-29   19  #include "iomap.h"
9099d47575938c Namjae Jeon 2025-12-18   20  
c8ac6fa986ca7a Namjae Jeon 2025-12-29   21  static s64 ntfs_convert_folio_index_into_lcn(struct ntfs_volume *vol, struct ntfs_inode *ni,
c8ac6fa986ca7a Namjae Jeon 2025-12-29   22  		unsigned long folio_index)
9099d47575938c Namjae Jeon 2025-12-18   23  {
c8ac6fa986ca7a Namjae Jeon 2025-12-29   24  	s64 vcn;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   25  	s64 lcn;
9099d47575938c Namjae Jeon 2025-12-18   26  
c8ac6fa986ca7a Namjae Jeon 2025-12-29   27  	vcn = NTFS_PIDX_TO_CLU(vol, folio_index);
9099d47575938c Namjae Jeon 2025-12-18   28  
9099d47575938c Namjae Jeon 2025-12-18   29  	down_read(&ni->runlist.lock);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   30  	lcn = ntfs_attr_vcn_to_lcn_nolock(ni, vcn, false);
9099d47575938c Namjae Jeon 2025-12-18   31  	up_read(&ni->runlist.lock);
9099d47575938c Namjae Jeon 2025-12-18   32  
c8ac6fa986ca7a Namjae Jeon 2025-12-29   33  	return lcn;
9099d47575938c Namjae Jeon 2025-12-18   34  }
9099d47575938c Namjae Jeon 2025-12-18   35  
9099d47575938c Namjae Jeon 2025-12-18   36  /**
9099d47575938c Namjae Jeon 2025-12-18   37   * ntfs_read_folio - fill a @folio of a @file with data from the device
9099d47575938c Namjae Jeon 2025-12-18   38   * @file:	open file to which the folio @folio belongs or NULL
9099d47575938c Namjae Jeon 2025-12-18   39   * @folio:	page cache folio to fill with data
9099d47575938c Namjae Jeon 2025-12-18   40   *
9099d47575938c Namjae Jeon 2025-12-18   41   * For non-resident attributes, ntfs_read_folio() fills the @folio of the open
9099d47575938c Namjae Jeon 2025-12-18   42   * file @file by calling the ntfs version of the generic block_read_full_folio()
c8ac6fa986ca7a Namjae Jeon 2025-12-29   43   * function, which in turn creates and reads in the buffers associated with
c8ac6fa986ca7a Namjae Jeon 2025-12-29   44   * the folio asynchronously.
9099d47575938c Namjae Jeon 2025-12-18   45   *
9099d47575938c Namjae Jeon 2025-12-18   46   * For resident attributes, OTOH, ntfs_read_folio() fills @folio by copying the
9099d47575938c Namjae Jeon 2025-12-18   47   * data from the mft record (which at this stage is most likely in memory) and
9099d47575938c Namjae Jeon 2025-12-18   48   * fills the remainder with zeroes. Thus, in this case, I/O is synchronous, as
9099d47575938c Namjae Jeon 2025-12-18   49   * even if the mft record is not cached at this point in time, we need to wait
9099d47575938c Namjae Jeon 2025-12-18   50   * for it to be read in before we can do the copy.
9099d47575938c Namjae Jeon 2025-12-18   51   *
9099d47575938c Namjae Jeon 2025-12-18   52   * Return 0 on success and -errno on error.
9099d47575938c Namjae Jeon 2025-12-18   53   */
9099d47575938c Namjae Jeon 2025-12-18   54  static int ntfs_read_folio(struct file *file, struct folio *folio)
9099d47575938c Namjae Jeon 2025-12-18   55  {
c8ac6fa986ca7a Namjae Jeon 2025-12-29   56  	struct ntfs_inode *ni = NTFS_I(folio->mapping->host);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   57  
9099d47575938c Namjae Jeon 2025-12-18   58  	/*
9099d47575938c Namjae Jeon 2025-12-18   59  	 * Only $DATA attributes can be encrypted and only unnamed $DATA
9099d47575938c Namjae Jeon 2025-12-18   60  	 * attributes can be compressed.  Index root can have the flags set but
9099d47575938c Namjae Jeon 2025-12-18   61  	 * this means to create compressed/encrypted files, not that the
9099d47575938c Namjae Jeon 2025-12-18   62  	 * attribute is compressed/encrypted.  Note we need to check for
9099d47575938c Namjae Jeon 2025-12-18   63  	 * AT_INDEX_ALLOCATION since this is the type of both directory and
9099d47575938c Namjae Jeon 2025-12-18   64  	 * index inodes.
9099d47575938c Namjae Jeon 2025-12-18   65  	 */
9099d47575938c Namjae Jeon 2025-12-18   66  	if (ni->type != AT_INDEX_ALLOCATION) {
9099d47575938c Namjae Jeon 2025-12-18   67  		/* If attribute is encrypted, deny access, just like NT4. */
9099d47575938c Namjae Jeon 2025-12-18   68  		if (NInoEncrypted(ni)) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29   69  			folio_unlock(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   70  			return -EACCES;
9099d47575938c Namjae Jeon 2025-12-18   71  		}
9099d47575938c Namjae Jeon 2025-12-18   72  		/* Compressed data streams are handled in compress.c. */
c8ac6fa986ca7a Namjae Jeon 2025-12-29   73  		if (NInoNonResident(ni) && NInoCompressed(ni))
c8ac6fa986ca7a Namjae Jeon 2025-12-29   74  			return ntfs_read_compressed_block(folio);
9099d47575938c Namjae Jeon 2025-12-18   75  	}
9099d47575938c Namjae Jeon 2025-12-18   76  
c8ac6fa986ca7a Namjae Jeon 2025-12-29   77  	iomap_bio_read_folio(folio, &ntfs_read_iomap_ops);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   78  	return 0;
9099d47575938c Namjae Jeon 2025-12-18   79  }
9099d47575938c Namjae Jeon 2025-12-18   80  
c8ac6fa986ca7a Namjae Jeon 2025-12-29   81  static int ntfs_write_mft_block(struct ntfs_inode *ni, struct folio *folio,
c8ac6fa986ca7a Namjae Jeon 2025-12-29   82  		struct writeback_control *wbc)
c8ac6fa986ca7a Namjae Jeon 2025-12-29   83  {
c8ac6fa986ca7a Namjae Jeon 2025-12-29   84  	struct inode *vi = VFS_I(ni);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   85  	struct ntfs_volume *vol = ni->vol;
9099d47575938c Namjae Jeon 2025-12-18   86  	u8 *kaddr;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   87  	struct ntfs_inode *locked_nis[PAGE_SIZE / NTFS_BLOCK_SIZE];
c8ac6fa986ca7a Namjae Jeon 2025-12-29   88  	int nr_locked_nis = 0, err = 0, mft_ofs, prev_mft_ofs;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   89  	struct bio *bio = NULL;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   90  	unsigned long mft_no;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   91  	struct ntfs_inode *tni;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   92  	s64 lcn;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   93  	s64 vcn = NTFS_PIDX_TO_CLU(vol, folio->index);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   94  	s64 end_vcn = NTFS_B_TO_CLU(vol, ni->allocated_size);
c8ac6fa986ca7a Namjae Jeon 2025-12-29   95  	unsigned int folio_sz;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   96  	struct runlist_element *rl;
c8ac6fa986ca7a Namjae Jeon 2025-12-29   97  
c8ac6fa986ca7a Namjae Jeon 2025-12-29   98  	ntfs_debug("Entering for inode 0x%lx, attribute type 0x%x, folio index 0x%lx.",
c8ac6fa986ca7a Namjae Jeon 2025-12-29   99  			vi->i_ino, ni->type, folio->index);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  100  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  101  	lcn = ntfs_convert_folio_index_into_lcn(vol, ni, folio->index);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  102  	if (lcn <= LCN_HOLE) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  103  		folio_start_writeback(folio);
9099d47575938c Namjae Jeon 2025-12-18  104  		folio_unlock(folio);
9099d47575938c Namjae Jeon 2025-12-18  105  		folio_end_writeback(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  106  		return -EIO;
9099d47575938c Namjae Jeon 2025-12-18  107  	}
9099d47575938c Namjae Jeon 2025-12-18  108  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  109  	/* Map folio so we can access its contents. */
c8ac6fa986ca7a Namjae Jeon 2025-12-29  110  	kaddr = kmap_local_folio(folio, 0);
9099d47575938c Namjae Jeon 2025-12-18  111  	/* Clear the page uptodate flag whilst the mst fixups are applied. */
c8ac6fa986ca7a Namjae Jeon 2025-12-29  112  	folio_clear_uptodate(folio);
9099d47575938c Namjae Jeon 2025-12-18  113  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  114  	for (mft_ofs = 0; mft_ofs < PAGE_SIZE && vcn < end_vcn;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  115  	     mft_ofs += vol->mft_record_size) {
9099d47575938c Namjae Jeon 2025-12-18  116  		/* Get the mft record number. */
c8ac6fa986ca7a Namjae Jeon 2025-12-29  117  		mft_no = (((s64)folio->index << PAGE_SHIFT) + mft_ofs) >>
c8ac6fa986ca7a Namjae Jeon 2025-12-29  118  			vol->mft_record_size_bits;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  119  		vcn = NTFS_MFT_NR_TO_CLU(vol, mft_no);
9099d47575938c Namjae Jeon 2025-12-18  120  		/* Check whether to write this mft record. */
9099d47575938c Namjae Jeon 2025-12-18  121  		tni = NULL;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  122  		if (ntfs_may_write_mft_record(vol, mft_no,
c8ac6fa986ca7a Namjae Jeon 2025-12-29  123  					(struct mft_record *)(kaddr + mft_ofs), &tni)) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  124  			unsigned int mft_record_off = 0;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  125  			s64 vcn_off = vcn;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  126  
9099d47575938c Namjae Jeon 2025-12-18  127  			/*
c8ac6fa986ca7a Namjae Jeon 2025-12-29  128  			 * Skip $MFT extent mft records and let them being written
c8ac6fa986ca7a Namjae Jeon 2025-12-29  129  			 * by writeback to avioid deadlocks. the $MFT runlist
c8ac6fa986ca7a Namjae Jeon 2025-12-29  130  			 * lock must be taken before $MFT extent mrec_lock is taken.
9099d47575938c Namjae Jeon 2025-12-18  131  			 */
c8ac6fa986ca7a Namjae Jeon 2025-12-29  132  			if (tni && tni->nr_extents < 0 &&
c8ac6fa986ca7a Namjae Jeon 2025-12-29  133  				tni->ext.base_ntfs_ino == NTFS_I(vol->mft_ino)) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  134  				mutex_unlock(&tni->mrec_lock);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  135  				atomic_dec(&tni->count);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  136  				iput(vol->mft_ino);
9099d47575938c Namjae Jeon 2025-12-18  137  				continue;
9099d47575938c Namjae Jeon 2025-12-18  138  			}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  139  
9099d47575938c Namjae Jeon 2025-12-18  140  			/*
9099d47575938c Namjae Jeon 2025-12-18  141  			 * The record should be written.  If a locked ntfs
9099d47575938c Namjae Jeon 2025-12-18  142  			 * inode was returned, add it to the array of locked
9099d47575938c Namjae Jeon 2025-12-18  143  			 * ntfs inodes.
9099d47575938c Namjae Jeon 2025-12-18  144  			 */
9099d47575938c Namjae Jeon 2025-12-18  145  			if (tni)
9099d47575938c Namjae Jeon 2025-12-18  146  				locked_nis[nr_locked_nis++] = tni;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  147  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  148  			if (bio && (mft_ofs != prev_mft_ofs + vol->mft_record_size)) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  149  flush_bio:
c8ac6fa986ca7a Namjae Jeon 2025-12-29  150  				flush_dcache_folio(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  151  				submit_bio_wait(bio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  152  				bio_put(bio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  153  				bio = NULL;
9099d47575938c Namjae Jeon 2025-12-18  154  			}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  155  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  156  			if (vol->cluster_size < folio_size(folio)) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  157  				down_write(&ni->runlist.lock);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  158  				rl = ntfs_attr_vcn_to_rl(ni, vcn_off, &lcn);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  159  				up_write(&ni->runlist.lock);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  160  				if (IS_ERR(rl) || lcn < 0) {
9099d47575938c Namjae Jeon 2025-12-18  161  					err = -EIO;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  162  					goto unm_done;
9099d47575938c Namjae Jeon 2025-12-18  163  				}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  164  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  165  				if (bio &&
c8ac6fa986ca7a Namjae Jeon 2025-12-29  166  				   (bio_end_sector(bio) >> (vol->cluster_size_bits - 9)) !=
c8ac6fa986ca7a Namjae Jeon 2025-12-29  167  				    lcn) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  168  					flush_dcache_folio(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  169  					submit_bio_wait(bio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  170  					bio_put(bio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  171  					bio = NULL;
9099d47575938c Namjae Jeon 2025-12-18  172  				}
9099d47575938c Namjae Jeon 2025-12-18  173  			}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  174  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  175  			if (!bio) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  176  				unsigned int off;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  177  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  178  				off = ((mft_no << vol->mft_record_size_bits) +
c8ac6fa986ca7a Namjae Jeon 2025-12-29  179  				       mft_record_off) & vol->cluster_size_mask;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  180  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  181  				bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
c8ac6fa986ca7a Namjae Jeon 2025-12-29  182  						GFP_NOIO);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  183  				bio->bi_iter.bi_sector =
c8ac6fa986ca7a Namjae Jeon 2025-12-29  184  					NTFS_B_TO_SECTOR(vol, NTFS_CLU_TO_B(vol, lcn) + off);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  185  			}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  186  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  187  			if (vol->cluster_size == NTFS_BLOCK_SIZE &&
c8ac6fa986ca7a Namjae Jeon 2025-12-29  188  			    (mft_record_off ||
c8ac6fa986ca7a Namjae Jeon 2025-12-29 @189  			     rl->length - (vcn_off - rl->vcn) == 1 ||
c8ac6fa986ca7a Namjae Jeon 2025-12-29  190  			     mft_ofs + NTFS_BLOCK_SIZE >= PAGE_SIZE))
c8ac6fa986ca7a Namjae Jeon 2025-12-29  191  				folio_sz = NTFS_BLOCK_SIZE;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  192  			else
c8ac6fa986ca7a Namjae Jeon 2025-12-29  193  				folio_sz = vol->mft_record_size;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  194  			if (!bio_add_folio(bio, folio, folio_sz,
c8ac6fa986ca7a Namjae Jeon 2025-12-29  195  					   mft_ofs + mft_record_off)) {
9099d47575938c Namjae Jeon 2025-12-18  196  				err = -EIO;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  197  				bio_put(bio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  198  				goto unm_done;
9099d47575938c Namjae Jeon 2025-12-18  199  			}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  200  			mft_record_off += folio_sz;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  201  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  202  			if (mft_record_off != vol->mft_record_size) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  203  				vcn_off++;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  204  				goto flush_bio;
9099d47575938c Namjae Jeon 2025-12-18  205  			}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  206  			prev_mft_ofs = mft_ofs;
9099d47575938c Namjae Jeon 2025-12-18  207  
9099d47575938c Namjae Jeon 2025-12-18  208  			if (mft_no < vol->mftmirr_size)
9099d47575938c Namjae Jeon 2025-12-18  209  				ntfs_sync_mft_mirror(vol, mft_no,
c8ac6fa986ca7a Namjae Jeon 2025-12-29  210  						(struct mft_record *)(kaddr + mft_ofs));
9099d47575938c Namjae Jeon 2025-12-18  211  		}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  212  
9099d47575938c Namjae Jeon 2025-12-18  213  	}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  214  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  215  	if (bio) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  216  		flush_dcache_folio(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  217  		submit_bio_wait(bio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  218  		bio_put(bio);
9099d47575938c Namjae Jeon 2025-12-18  219  	}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  220  	flush_dcache_folio(folio);
9099d47575938c Namjae Jeon 2025-12-18  221  unm_done:
c8ac6fa986ca7a Namjae Jeon 2025-12-29  222  	folio_mark_uptodate(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  223  	kunmap_local(kaddr);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  224  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  225  	folio_start_writeback(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  226  	folio_unlock(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  227  	folio_end_writeback(folio);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  228  
9099d47575938c Namjae Jeon 2025-12-18  229  	/* Unlock any locked inodes. */
9099d47575938c Namjae Jeon 2025-12-18  230  	while (nr_locked_nis-- > 0) {
c8ac6fa986ca7a Namjae Jeon 2025-12-29  231  		struct ntfs_inode *base_tni;
9099d47575938c Namjae Jeon 2025-12-18  232  
9099d47575938c Namjae Jeon 2025-12-18  233  		tni = locked_nis[nr_locked_nis];
c8ac6fa986ca7a Namjae Jeon 2025-12-29  234  		mutex_unlock(&tni->mrec_lock);
c8ac6fa986ca7a Namjae Jeon 2025-12-29  235  
9099d47575938c Namjae Jeon 2025-12-18  236  		/* Get the base inode. */
9099d47575938c Namjae Jeon 2025-12-18  237  		mutex_lock(&tni->extent_lock);
9099d47575938c Namjae Jeon 2025-12-18  238  		if (tni->nr_extents >= 0)
9099d47575938c Namjae Jeon 2025-12-18  239  			base_tni = tni;
c8ac6fa986ca7a Namjae Jeon 2025-12-29  240  		else
9099d47575938c Namjae Jeon 2025-12-18  241  			base_tni = tni->ext.base_ntfs_ino;
9099d47575938c Namjae Jeon 2025-12-18  242  		mutex_unlock(&tni->extent_lock);
9099d47575938c Namjae Jeon 2025-12-18  243  		ntfs_debug("Unlocking %s inode 0x%lx.",
9099d47575938c Namjae Jeon 2025-12-18  244  				tni == base_tni ? "base" : "extent",
9099d47575938c Namjae Jeon 2025-12-18  245  				tni->mft_no);
9099d47575938c Namjae Jeon 2025-12-18  246  		atomic_dec(&tni->count);
9099d47575938c Namjae Jeon 2025-12-18  247  		iput(VFS_I(base_tni));
9099d47575938c Namjae Jeon 2025-12-18  248  	}
c8ac6fa986ca7a Namjae Jeon 2025-12-29  249  
c8ac6fa986ca7a Namjae Jeon 2025-12-29  250  	if (unlikely(err && err != -ENOMEM))
9099d47575938c Namjae Jeon 2025-12-18  251  		NVolSetErrors(vol);
9099d47575938c Namjae Jeon 2025-12-18  252  	if (likely(!err))
9099d47575938c Namjae Jeon 2025-12-18  253  		ntfs_debug("Done.");
9099d47575938c Namjae Jeon 2025-12-18  254  	return err;
9099d47575938c Namjae Jeon 2025-12-18  255  }
9099d47575938c Namjae Jeon 2025-12-18  256  

:::::: The code at line 189 was first introduced by commit
:::::: c8ac6fa986ca7a4253c9b0c7cd742824e6eef2dd ntfs: update iomap and address space operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
