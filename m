Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8601FBEB9
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754309230; cv=none; b=i7qu3Zu+avYdyBu9qb/x3BG8FRVDDzjPE+1MmX26LuuY8gi2mrGFCj2XuARSHDOsjQhBN2OwNl4af3IkETzV4+Z9Jbq0TjwN76cBYeUWEGknO6nF8F7YkvELV8rkNL/9SZ5wK2g+nneOBx2cXF/BQQMbvn540tedzz7Ie5CfyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754309230; c=relaxed/simple;
	bh=yjTxlA44R5JDzg0AJn/DmwJptZqvj6Jxf6czFxziE0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fssCrQyc+5d1fYpZaGitnep4oKgnOfd7Fh/9qXuzMIzay+HyXeLnEbNYM1eveS4+x3TUqk1L7KVyTcHM9cXNCT1J37aTlSJJYs+ho6NB9P2yFDEd5AZ6O5L6pkTTJjTc75ZM5f/HQF3OjagYiLzM4xLfnDcb5ajOwGHsqxqK14c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drqiuS/V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drqiuS/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754309229; x=1785845229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjTxlA44R5JDzg0AJn/DmwJptZqvj6Jxf6czFxziE0o=;
  b=drqiuS/VprD1a2XGLamVXILRg89grs2mnQEM5+c2HmnV09fUd0XGYXgL
   yKMtps+zQQNGFRkqPVdObUSsT+pJY0j9bygReXGxLi7Lhw1d0KvsGRVTK
   00HjSwTxUL9tfr8sq29j8U899aX96W2t4W8D6JAw96QF/Pfo1WvnqUFUx
   gAk8USQJ2X7yXdW39z/J18lsUbqECfoIpl9xX3r9qNNJaDALL87PXN+Nv
   phPEyVQHy83RfXW95nnI+bttRbeYp/tvARCE24bZV80EwTLB6himAO51p
   riXXhvNQobUYZ7iSowa5UtNQMYlkHzvEqrXS98wqxRjc4hUBC7Jf91OQk
   A==;
X-CSE-ConnectionGUID: M3OPksekT7ycNCDqSkWaWg==
X-CSE-MsgGUID: XMcV8pniRIGuW1la8EUHWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="82022109"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="82022109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 05:07:09 -0700
X-CSE-ConnectionGUID: N6edc+2jSCe5cNhrtFpjtw==
X-CSE-MsgGUID: kjjOUosRRoSBOVBzo18YWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168351801"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Aug 2025 05:07:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uity5-00072O-0j;
	Mon, 04 Aug 2025 12:07:05 +0000
Date: Mon, 4 Aug 2025 20:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 258/261] fs/bcachefs/journal_sb.c:213
 bch2_journal_buckets_to_sb() error: we previously assumed 'c' could be null
 (see line 197)
Message-ID: <202508042026.zdOLyIxZ-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ed4630b2454ac5f86822533ca3def453d96f2fb2
commit: f30cafd8e9d14c7acd7d7409b9fd8e04259291a1 [258/261] bcachefs: error_throw counter
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20250804 (https://download.01.org/0day-ci/archive/20250804/202508042026.zdOLyIxZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508042026.zdOLyIxZ-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal_sb.c:213 bch2_journal_buckets_to_sb() error: we previously assumed 'c' could be null (see line 197)

vim +/c +213 fs/bcachefs/journal_sb.c

25be2e5d4a051f Kent Overstreet 2022-03-10  190  
2640faeb1741db Kent Overstreet 2023-03-06  191  int bch2_journal_buckets_to_sb(struct bch_fs *c, struct bch_dev *ca,
2640faeb1741db Kent Overstreet 2023-03-06  192  			       u64 *buckets, unsigned nr)
25be2e5d4a051f Kent Overstreet 2022-03-10  193  {
25be2e5d4a051f Kent Overstreet 2022-03-10  194  	struct bch_sb_field_journal_v2 *j;
2640faeb1741db Kent Overstreet 2023-03-06  195  	unsigned i, dst = 0, nr_compacted = 1;
25be2e5d4a051f Kent Overstreet 2022-03-10  196  
25be2e5d4a051f Kent Overstreet 2022-03-10 @197  	if (c)
25be2e5d4a051f Kent Overstreet 2022-03-10  198  		lockdep_assert_held(&c->sb_lock);
25be2e5d4a051f Kent Overstreet 2022-03-10  199  
2640faeb1741db Kent Overstreet 2023-03-06  200  	if (!nr) {
25be2e5d4a051f Kent Overstreet 2022-03-10  201  		bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal);
25be2e5d4a051f Kent Overstreet 2022-03-10  202  		bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal_v2);
25be2e5d4a051f Kent Overstreet 2022-03-10  203  		return 0;
25be2e5d4a051f Kent Overstreet 2022-03-10  204  	}
25be2e5d4a051f Kent Overstreet 2022-03-10  205  
2640faeb1741db Kent Overstreet 2023-03-06  206  	for (i = 0; i + 1 < nr; i++)
2640faeb1741db Kent Overstreet 2023-03-06  207  		if (buckets[i] + 1 != buckets[i + 1])
2640faeb1741db Kent Overstreet 2023-03-06  208  			nr_compacted++;
25be2e5d4a051f Kent Overstreet 2022-03-10  209  
4637429e3946d0 Kent Overstreet 2023-09-26  210  	j = bch2_sb_field_resize(&ca->disk_sb, journal_v2,
2640faeb1741db Kent Overstreet 2023-03-06  211  			 (sizeof(*j) + sizeof(j->d[0]) * nr_compacted) / sizeof(u64));
25be2e5d4a051f Kent Overstreet 2022-03-10  212  	if (!j)
09b9c72bd4b77a Kent Overstreet 2025-05-28 @213  		return bch_err_throw(c, ENOSPC_sb_journal);

:::::: The code at line 213 was first introduced by commit
:::::: 09b9c72bd4b77a954123997377665fb30f1d07e1 bcachefs: bch_err_throw()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
