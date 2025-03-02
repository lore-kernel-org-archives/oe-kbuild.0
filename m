Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C31E9B1D
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 16:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740933408; cv=none; b=dgr1qQLr5/m8Ks2FGO8l+ba67POvAOw2RePCNkTVI0IO/Wf0TQjgEYOnm3Um6ClpUMe5/fqGz6H9SuDc4xyoSJAlJCQANuTJoJ0azXu24PqbOkrMAkNx6KCEENkEMuON00xPC0XwvvEXsKNCCMIBLFbcA1ot2lIBFg9TcbSTyKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740933408; c=relaxed/simple;
	bh=J4SMpx7+bpCugMPxK/vJF+z6vrsTbRhADY16roWSM88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ndXY6a+3F4+qJbTa809eLn+JL5QUus+ZAEkbeBeyWAUNOsWc7H/5ieTWR9ceD9XzkUA6DKeZIYkEgu41AGu8NhsxZf8gWVinmQpOlt5uyTGApl1V/Z1HLLSIFuWZHTDzt4UEVnp/FRcM3HFCxrvroO2DHTuv3hwi8QDzyBZyBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP2Dojix; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP2Dojix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740933406; x=1772469406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4SMpx7+bpCugMPxK/vJF+z6vrsTbRhADY16roWSM88=;
  b=GP2Dojixwl8PwjnycvoNAqHYqBvlyFaB2bXYyIaqubdkabekZsEeAVuY
   jaiU7UYak3LiXU++dbcyP2GKmcnpS70i7aCv8gk/cM8fiOHlZd5jyMIl8
   RaXLVXN6p+da9ZzlLbqflo8yg+t7PyzBaFUBXl3pSAaxMDWg4GBwJ3LHU
   M1epYuWuki3WiRYe10Z4IOfWI7e6oQooHZAtGyzqY5eAAgVaM0S0+kjv9
   nD92g5MJAbj84tuEStnfKK1qigPtEjyhH1pnZcCqwW38OTWFHd9zFOag/
   rbKMvPr/+TvM+2A+pmSBmmyZZnUuHgNjtF9BJCxDWpD9nw0P9Ju2Lg0++
   A==;
X-CSE-ConnectionGUID: NAZl+IbKQMeFSZjP1ezS6w==
X-CSE-MsgGUID: FQ2L47VjSz6Rz1AquU2wQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="67182851"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="67182851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 08:36:45 -0800
X-CSE-ConnectionGUID: 97H30X1UTL62CR65uFHGeQ==
X-CSE-MsgGUID: QIdits0MTH+PDkbXYfphXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="122754369"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Mar 2025 08:36:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tomIz-000HSY-1v;
	Sun, 02 Mar 2025 16:36:41 +0000
Date: Mon, 3 Mar 2025 00:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 127/139] fs/bcachefs/extents.c:137
 bch2_bkey_pick_read_device() warn: bitwise AND condition is false here
Message-ID: <202503030001.bR4xKK8m-lkp@intel.com>
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
head:   7577e40265098969656d8a1a14fbfdead7eb3e18
commit: a32d248c66703f54e594d13571cd7ea376600304 [127/139] bcachefs: bcachefs_metadata_version_extent_flags
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030001.bR4xKK8m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503030001.bR4xKK8m-lkp@intel.com/

smatch warnings:
fs/bcachefs/extents.c:137 bch2_bkey_pick_read_device() warn: bitwise AND condition is false here

vim +137 fs/bcachefs/extents.c

26609b619fa230 Kent Overstreet 2018-11-01  117  
26609b619fa230 Kent Overstreet 2018-11-01  118  /*
26609b619fa230 Kent Overstreet 2018-11-01  119   * This picks a non-stale pointer, preferably from a device other than @avoid.
26609b619fa230 Kent Overstreet 2018-11-01  120   * Avoid can be NULL, meaning pick any. If there are no non-stale pointers to
26609b619fa230 Kent Overstreet 2018-11-01  121   * other devices, it will still pick a pointer from avoid.
26609b619fa230 Kent Overstreet 2018-11-01  122   */
26609b619fa230 Kent Overstreet 2018-11-01  123  int bch2_bkey_pick_read_device(struct bch_fs *c, struct bkey_s_c k,
26609b619fa230 Kent Overstreet 2018-11-01  124  			      struct bch_io_failures *failed,
fe81cbd449a43d Kent Overstreet 2024-12-28  125  			      struct extent_ptr_decoded *pick,
fe81cbd449a43d Kent Overstreet 2024-12-28  126  			      int dev)
26609b619fa230 Kent Overstreet 2018-11-01  127  {
26609b619fa230 Kent Overstreet 2018-11-01  128  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
26609b619fa230 Kent Overstreet 2018-11-01  129  	const union bch_extent_entry *entry;
26609b619fa230 Kent Overstreet 2018-11-01  130  	struct extent_ptr_decoded p;
26609b619fa230 Kent Overstreet 2018-11-01  131  	struct bch_dev_io_failures *f;
26609b619fa230 Kent Overstreet 2018-11-01  132  	int ret = 0;
26609b619fa230 Kent Overstreet 2018-11-01  133  
26609b619fa230 Kent Overstreet 2018-11-01  134  	if (k.k->type == KEY_TYPE_error)
54a12984a9a29d Kent Overstreet 2024-09-04  135  		return -BCH_ERR_key_type_error;
26609b619fa230 Kent Overstreet 2018-11-01  136  
a32d248c66703f Kent Overstreet 2025-02-24 @137  	if (bch2_bkey_extent_ptrs_flags(ptrs) & BCH_EXTENT_poisoned)
a32d248c66703f Kent Overstreet 2025-02-24  138  		return -BCH_ERR_extent_poisened;
a32d248c66703f Kent Overstreet 2025-02-24  139  
a9422fd4041084 Kent Overstreet 2024-04-30  140  	rcu_read_lock();
26609b619fa230 Kent Overstreet 2018-11-01  141  	bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
792031116bee35 Kent Overstreet 2022-11-13  142  		/*
792031116bee35 Kent Overstreet 2022-11-13  143  		 * Unwritten extent: no need to actually read, treat it as a
792031116bee35 Kent Overstreet 2022-11-13  144  		 * hole and return 0s:
792031116bee35 Kent Overstreet 2022-11-13  145  		 */
a9422fd4041084 Kent Overstreet 2024-04-30  146  		if (p.ptr.unwritten) {
a9422fd4041084 Kent Overstreet 2024-04-30  147  			ret = 0;
a9422fd4041084 Kent Overstreet 2024-04-30  148  			break;
a9422fd4041084 Kent Overstreet 2024-04-30  149  		}
26609b619fa230 Kent Overstreet 2018-11-01  150  
fe81cbd449a43d Kent Overstreet 2024-12-28  151  		/* Are we being asked to read from a specific device? */
fe81cbd449a43d Kent Overstreet 2024-12-28  152  		if (dev >= 0 && p.ptr.dev != dev)
fe81cbd449a43d Kent Overstreet 2024-12-28  153  			continue;
fe81cbd449a43d Kent Overstreet 2024-12-28  154  
26609b619fa230 Kent Overstreet 2018-11-01  155  		/*
26609b619fa230 Kent Overstreet 2018-11-01  156  		 * If there are any dirty pointers it's an error if we can't
26609b619fa230 Kent Overstreet 2018-11-01  157  		 * read:
26609b619fa230 Kent Overstreet 2018-11-01  158  		 */
26609b619fa230 Kent Overstreet 2018-11-01  159  		if (!ret && !p.ptr.cached)
54a12984a9a29d Kent Overstreet 2024-09-04  160  			ret = -BCH_ERR_no_device_to_read_from;
26609b619fa230 Kent Overstreet 2018-11-01  161  
a9422fd4041084 Kent Overstreet 2024-04-30  162  		struct bch_dev *ca = bch2_dev_rcu(c, p.ptr.dev);
a9422fd4041084 Kent Overstreet 2024-04-30  163  
9432e90df1b8a5 Kent Overstreet 2024-06-06  164  		if (p.ptr.cached && (!ca || dev_ptr_stale_rcu(ca, &p.ptr)))
26609b619fa230 Kent Overstreet 2018-11-01  165  			continue;
26609b619fa230 Kent Overstreet 2018-11-01  166  
a2cb8a6236daaf Kent Overstreet 2024-06-28  167  		f = failed ? bch2_dev_io_failures(failed, p.ptr.dev) : NULL;
26609b619fa230 Kent Overstreet 2018-11-01  168  		if (f)
26609b619fa230 Kent Overstreet 2018-11-01  169  			p.idx = f->nr_failed < f->nr_retries
26609b619fa230 Kent Overstreet 2018-11-01  170  				? f->idx
26609b619fa230 Kent Overstreet 2018-11-01  171  				: f->idx + 1;
26609b619fa230 Kent Overstreet 2018-11-01  172  
54a12984a9a29d Kent Overstreet 2024-09-04  173  		if (!p.idx && (!ca || !bch2_dev_is_readable(ca)))
a9422fd4041084 Kent Overstreet 2024-04-30  174  			p.idx++;
a9422fd4041084 Kent Overstreet 2024-04-30  175  
a9422fd4041084 Kent Overstreet 2024-04-30  176  		if (!p.idx && p.has_ec && bch2_force_reconstruct_read)
26609b619fa230 Kent Overstreet 2018-11-01  177  			p.idx++;
26609b619fa230 Kent Overstreet 2018-11-01  178  
54a12984a9a29d Kent Overstreet 2024-09-04  179  		if (p.idx > (unsigned) p.has_ec)
26609b619fa230 Kent Overstreet 2018-11-01  180  			continue;
26609b619fa230 Kent Overstreet 2018-11-01  181  
26609b619fa230 Kent Overstreet 2018-11-01  182  		if (ret > 0 && !ptr_better(c, p, *pick))
26609b619fa230 Kent Overstreet 2018-11-01  183  			continue;
26609b619fa230 Kent Overstreet 2018-11-01  184  
26609b619fa230 Kent Overstreet 2018-11-01  185  		*pick = p;
26609b619fa230 Kent Overstreet 2018-11-01  186  		ret = 1;
26609b619fa230 Kent Overstreet 2018-11-01  187  	}
a9422fd4041084 Kent Overstreet 2024-04-30  188  	rcu_read_unlock();
26609b619fa230 Kent Overstreet 2018-11-01  189  
26609b619fa230 Kent Overstreet 2018-11-01  190  	return ret;
26609b619fa230 Kent Overstreet 2018-11-01  191  }
26609b619fa230 Kent Overstreet 2018-11-01  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
