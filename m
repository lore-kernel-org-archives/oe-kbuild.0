Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC2C2580E1
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Nov 2025 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375868; cv=none; b=JnRt0QXkam3fOUMJTIzNun7ukhGBO5M0VyH8mR6dX9TsAyckjswfrDEUWGmnD4wjBnwLENsspyeReUua6N6A9hBz62fcA432m8cdqLzwnb/Ul6ro2RSWfm7Oi3YR88EcnksXV5HvdJEIHv/xeg9UpssldErzpv+Iwipb/f73Evo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375868; c=relaxed/simple;
	bh=I357shyyFF9mXJTyuMuA3mQddqydiRSoQ1eo9QKFrA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5WddL1dWoxP0hXqfZQ5zLwyrxRGLQ/866MagNl01ACE0Gl7nfmAqettLBoa3uuuOaVtUktBitn7KAeFSN3FBDdz2kwMjz+uGkTuCKQcbioQU+cx4eMZb8PHvzgN3nQTApTRbz7WEvnYJmRQGPOUqa5QDsoDDbTwXXTmMop9oPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLEVDwjU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLEVDwjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763375867; x=1794911867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I357shyyFF9mXJTyuMuA3mQddqydiRSoQ1eo9QKFrA8=;
  b=eLEVDwjURQJdX2wuMwolo+nazee4pAbWsGX2L171kcW5OOYc5GaXG00u
   TvwhUNCoiNgTOoIdpFz5pirX31q/vg6lq2jkweaaIsHYobC5A16Thb17l
   vecarHOJcJTI3P8ii87myyri9+jYN63VISIddSEfpd+gtwRmUc586cmDt
   tsfBGiYy/dnAxcACInfFS/IZMAOdDVivoJPwmg1Ia4ZmbkIcLZoiK7xwC
   7bZbmnFy0pAHHnB2ekmi0nKXxBnXtGcUCF7LYXtzfL2G1/zfhbOvAtxkE
   iWOLBnRaMZUXB+Tt54NDp42z+sR30BaPD6smJdEd7IrtF0g9ywgajLfS2
   w==;
X-CSE-ConnectionGUID: 85LLEtz3Tv+uJmzBTuJ6NA==
X-CSE-MsgGUID: hMojdKCeSK2NijcejlMtog==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65524426"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65524426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 02:37:46 -0800
X-CSE-ConnectionGUID: Qbpg0BlxTJiSqAKKxRFWEg==
X-CSE-MsgGUID: J16ShPL+QvyF4WsDaJ+4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189666162"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2025 02:37:44 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKwcA-0000R7-0J;
	Mon, 17 Nov 2025 10:37:42 +0000
Date: Mon, 17 Nov 2025 18:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:master 464/903] fs/bcachefs/journal/sb.c:213
 bch2_journal_buckets_to_sb() error: we previously assumed 'c' could be null
 (see line 197)
Message-ID: <202511171844.Cww9WIp3-lkp@intel.com>
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

tree:   https://github.com/koverstreet/bcachefs master
head:   ca748d1945bfa1208b1d32e5a246a352b09ad271
commit: 3d1f4469e2743eb10d5450c26d37cac439a002f1 [464/903] bcachefs: move journal code to subdir
:::::: branch date: 8 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171844.Cww9WIp3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511171844.Cww9WIp3-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal/sb.c:213 bch2_journal_buckets_to_sb() error: we previously assumed 'c' could be null (see line 197)

vim +/c +213 fs/bcachefs/journal/sb.c

25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  190  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  191  int bch2_journal_buckets_to_sb(struct bch_fs *c, struct bch_dev *ca,
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  192  			       u64 *buckets, unsigned nr)
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  193  {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  194  	struct bch_sb_field_journal_v2 *j;
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  195  	unsigned i, dst = 0, nr_compacted = 1;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  196  
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10 @197  	if (c)
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  198  		lockdep_assert_held(&c->sb_lock);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  199  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  200  	if (!nr) {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  201  		bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  202  		bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal_v2);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  203  		return 0;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  204  	}
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  205  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  206  	for (i = 0; i + 1 < nr; i++)
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  207  		if (buckets[i] + 1 != buckets[i + 1])
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  208  			nr_compacted++;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  209  
4637429e3946d0 fs/bcachefs/journal_sb.c Kent Overstreet 2023-09-26  210  	j = bch2_sb_field_resize(&ca->disk_sb, journal_v2,
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  211  			 (sizeof(*j) + sizeof(j->d[0]) * nr_compacted) / sizeof(u64));
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  212  	if (!j)
09b9c72bd4b77a fs/bcachefs/journal_sb.c Kent Overstreet 2025-05-28 @213  		return bch_err_throw(c, ENOSPC_sb_journal);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  214  
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  215  	bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  216  
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  217  	j->d[dst].start = cpu_to_le64(buckets[0]);
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  218  	j->d[dst].nr	= cpu_to_le64(1);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  219  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  220  	for (i = 1; i < nr; i++) {
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  221  		if (buckets[i] == buckets[i - 1] + 1) {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  222  			le64_add_cpu(&j->d[dst].nr, 1);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  223  		} else {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  224  			dst++;
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  225  			j->d[dst].start = cpu_to_le64(buckets[i]);
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  226  			j->d[dst].nr	= cpu_to_le64(1);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  227  		}
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  228  	}
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  229  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  230  	BUG_ON(dst + 1 != nr_compacted);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  231  	return 0;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  232  }
8e7d3f6a43f5c9 fs/bcachefs/journal_sb.c Kent Overstreet 2025-09-02  233  

:::::: The code at line 213 was first introduced by commit
:::::: 09b9c72bd4b77a954123997377665fb30f1d07e1 bcachefs: bch_err_throw()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
