Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFA2AE6A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 21:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748122240; cv=none; b=Bk7NGupxJGSa5srUfUP7sNNK/btFLcFVzNAc54nwlHJWaM+igDfCcUqjtEq4yKeW4rm86A5kIAgSB6tlKrC3E8SntsGETzvn1gtj6G6HqAF/YIo5okOD2P4BLFT4ax/x5MX+o5m23PYq00t6Gk+r9UEbJagOVhZbkA/N1CcUlO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748122240; c=relaxed/simple;
	bh=F8W2/8YfE+eZnJiyVx7NqdQZLZXhayfON6M50YT2Pzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHb5S5p8s8/+vxJuub53xcvBms76Sr2zLHP08UfWKAK0YKReqpbDDT0O5GEhhe9X3q1pjtY56sTmsZQBary+tDT00pw6uvNNNb4pQcl2VjzUViwR0Apl8Tl/df1taXfbtXOv/f6dsVmOS5Hl6YAg/KSMyfMSY+skeFqRwon9HHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcGXJyZh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcGXJyZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748122238; x=1779658238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8W2/8YfE+eZnJiyVx7NqdQZLZXhayfON6M50YT2Pzc=;
  b=PcGXJyZhg7qasNdLC9D7T1oQ3Sh6xsP7xgLnPHBd7buU8P8exmJyJFrK
   StlR7LtinSX3SrutohEdrLc2KDoU2sgjtMZu8tBXtt38CSgJqMjAMqlvz
   gqjBFwUSD37wPQP2VovVHo0fW5BFkThU+o9gPJ5Ax+Uo0vddfAsdCNNvk
   62AD9qUn36v8AR67KCrlxaCsDxPC5L9qq5FXe7X1z+mEoftUB6p/NFVwx
   /24iX4eXu5mvK41P6s+qKL21lDl/B624AbOKO9as6O3fEF+x5i5N7O96y
   ZA6BcJJJqy+kce/h5b6Tqy7+VqjLKFby96IJ+nMGBgbo2tF3SqkKHQM+f
   Q==;
X-CSE-ConnectionGUID: L/debpVWTm+2kw2gc5BHXw==
X-CSE-MsgGUID: fRt5c99dQre8nKgipjMMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53948091"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="53948091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 14:30:38 -0700
X-CSE-ConnectionGUID: ly452A9GTyuVKanxiIPg4g==
X-CSE-MsgGUID: CV6CCbCzSK6HqKMxTTFwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="172601909"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 May 2025 14:30:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIwRv-000RTE-08;
	Sat, 24 May 2025 21:30:35 +0000
Date: Sun, 25 May 2025 05:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ocfs2/alloc.o: warning: objtool: ocfs2_grab_eof_folios+0x6c:
 unreachable instruction
Message-ID: <202505250524.svAmojHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Tinguely <mark.tinguely@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b1427432d3b656fac71b3f42824ff4aea3c9f93b
commit: 9a5e08652dc4bea7de6495d84855439769208eab ocfs2: use an array of folios instead of an array of pages
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r052-20250523 (https://download.01.org/0day-ci/archive/20250525/202505250524.svAmojHG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250524.svAmojHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505250524.svAmojHG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ocfs2/alloc.o: warning: objtool: ocfs2_adjust_adjacent_records+0x38: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_dinode_insert_check+0xc8: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_shift_records_right+0x24: unreachable instruction
>> fs/ocfs2/alloc.o: warning: objtool: ocfs2_grab_eof_folios+0x6c: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_complete_edge_insert+0xd4: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_rotate_leaf+0x94: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_shift_tree_depth+0x144: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_rotate_subtree_right+0x1f8: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_update_edge_lengths.isra.0+0xe0: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_insert_at_leaf+0x78: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_split_record+0x70: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_find_subtree_root+0xe0: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_add_branch+0x84: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_grow_tree+0x124: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_get_left_path.constprop.0+0xd4: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_split_and_insert+0x224: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_get_right_path.constprop.0+0x60: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_merge_rec_right.isra.0+0x130: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_add_clusters_in_btree+0x1b4: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_truncate_log_append+0xa8: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: __ocfs2_flush_truncate_log+0x80: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_rotate_subtree_left+0x280: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: __ocfs2_rotate_tree_left+0x184: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_merge_rec_left+0x138: unreachable instruction
   fs/ocfs2/alloc.o: warning: objtool: ocfs2_try_to_merge_extent+0x1b4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
