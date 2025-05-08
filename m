Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A7220F56
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746739315; cv=none; b=Y7eiddZjm8xat4IDGS8fCsBwPXonMryXex2Jb9W+YOXR35TYFl6/dt6STxp03TwH93UAWfDelz5hlzQPfr/nZ6TWI0Jd5gprWATfnoaDClnO7CZFs8EpbTcGqDXHk3LoFq8mPM2MEH5Y9jjsRm/7WOH3h8Ov5g7UJJ1cLxjVL3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746739315; c=relaxed/simple;
	bh=341l7ChyUYt9kLOKUwSx5iK+YZSdsFDBm8xGEMuaoA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nxdzNnTtxopQRxoPcVQDaA6V8zWtK43G2HJd6pz7ZNVZkGV8r3QTqKcqIdomjNOAFdqF/l5YNHn9uoy5YFMDh5f/zTtz6N3489eEJ3tToUdHgdDbVsdf4DUNo+flNPphncg32Oo1giOhIqtY9Zeg8F0CR+FtTfy974vUHorL6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O199+jb/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O199+jb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746739314; x=1778275314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=341l7ChyUYt9kLOKUwSx5iK+YZSdsFDBm8xGEMuaoA0=;
  b=O199+jb/JS8qdzPC/toKH16GAJ26vSkyTS7alZhFe0He3g7wHnbv/1nG
   uAsIlsfNnM/D9UiC/i94brgf+BVqarAX4bwIOrZ1trYxmao+0p6YEgAmz
   fL2CnAc3icnHl1bOwdLTyxxN2Nf69uVtgUjDnTC35+ozqKKH9t9UXnsJ8
   ZClYIgtIXJmRZ+aaRi7s8fdDIo0tRqQXcPvrzMs9Et9/+lttjgBTMYFJO
   zuNfAlQMzMkkKtzmzYStDA67C/s34wcHVNFtryAlZ2ax2BfehDWwJzLiU
   A2HJBAkoOc0qSA7OElga+wJnTrSlgtQ4bUIqYIxhs3qf5oaEPJffflJHM
   A==;
X-CSE-ConnectionGUID: RBTISwLZR1KCT/PQ0yScIA==
X-CSE-MsgGUID: QMBpZdX/Tr2Yt9n++6ANMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71063295"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="71063295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 14:21:50 -0700
X-CSE-ConnectionGUID: 2I/gNnguSmuKK0md4qscyA==
X-CSE-MsgGUID: LWI+SxccR+CnajrG1o6urA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="140458147"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2025 14:21:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD8gb-000BO3-2B;
	Thu, 08 May 2025 21:21:45 +0000
Date: Fri, 9 May 2025 05:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8486/9729] fs/bcachefs/extents.c:1169
 bch2_extent_ptr_set_cached() warn: variable dereferenced before check 'ptr'
 (see line 1143)
Message-ID: <202505090524.k8EEodjl-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: c1f26d7667d0b31c989356c6a7c63b44332ffd04 [8486/9729] bcachefs: Improve bch2_extent_ptr_set_cached()
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090524.k8EEodjl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505090524.k8EEodjl-lkp@intel.com/

smatch warnings:
fs/bcachefs/extents.c:1169 bch2_extent_ptr_set_cached() warn: variable dereferenced before check 'ptr' (see line 1143)

vim +/ptr +1169 fs/bcachefs/extents.c

a34eef6dd17946 Kent Overstreet 2024-10-20  1133  
a34eef6dd17946 Kent Overstreet 2024-10-20  1134  void bch2_extent_ptr_set_cached(struct bch_fs *c,
a34eef6dd17946 Kent Overstreet 2024-10-20  1135  				struct bch_io_opts *opts,
a34eef6dd17946 Kent Overstreet 2024-10-20  1136  				struct bkey_s k,
a34eef6dd17946 Kent Overstreet 2024-10-20  1137  				struct bch_extent_ptr *ptr)
c9163bb03b81e4 Kent Overstreet 2023-02-21  1138  {
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1139  	struct bkey_ptrs ptrs;
c9163bb03b81e4 Kent Overstreet 2023-02-21  1140  	union bch_extent_entry *entry;
a34eef6dd17946 Kent Overstreet 2024-10-20  1141  	struct extent_ptr_decoded p;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1142  	bool have_cached_ptr;
c1f26d7667d0b3 Kent Overstreet 2025-05-04 @1143  	unsigned drop_dev = ptr->dev;
c9163bb03b81e4 Kent Overstreet 2023-02-21  1144  
a34eef6dd17946 Kent Overstreet 2024-10-20  1145  	rcu_read_lock();
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1146  restart_drop_ptrs:
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1147  	ptrs = bch2_bkey_ptrs(k);
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1148  	have_cached_ptr = false;
c9163bb03b81e4 Kent Overstreet 2023-02-21  1149  
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1150  	bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
a34eef6dd17946 Kent Overstreet 2024-10-20  1151  		/*
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1152  		 * Check if it's erasure coded - stripes can't contain cached
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1153  		 * data. Possibly something we can fix in the future?
a34eef6dd17946 Kent Overstreet 2024-10-20  1154  		 */
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1155  		if (&entry->ptr == ptr && p.has_ec)
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1156  			goto drop;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1157  
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1158  		if (p.ptr.cached) {
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1159  			if (have_cached_ptr || !want_cached_ptr(c, opts, &p.ptr)) {
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1160  				bch2_bkey_drop_ptr_noerror(k, &entry->ptr);
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1161  				ptr = NULL;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1162  				goto restart_drop_ptrs;
c9163bb03b81e4 Kent Overstreet 2023-02-21  1163  			}
c9163bb03b81e4 Kent Overstreet 2023-02-21  1164  
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1165  			have_cached_ptr = true;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1166  		}
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1167  	}
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1168  
c1f26d7667d0b3 Kent Overstreet 2025-05-04 @1169  	if (!ptr)
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1170  		bkey_for_each_ptr(ptrs, ptr2)
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1171  			if (ptr2->dev == drop_dev)
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1172  				ptr = ptr2;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1173  
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1174  	if (have_cached_ptr || !want_cached_ptr(c, opts, ptr))
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1175  		goto drop;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1176  
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1177  	ptr->cached = true;
a34eef6dd17946 Kent Overstreet 2024-10-20  1178  	rcu_read_unlock();
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1179  	return;
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1180  drop:
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1181  	rcu_read_unlock();
c1f26d7667d0b3 Kent Overstreet 2025-05-04  1182  	bch2_bkey_drop_ptr_noerror(k, ptr);
c9163bb03b81e4 Kent Overstreet 2023-02-21  1183  }
c9163bb03b81e4 Kent Overstreet 2023-02-21  1184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
