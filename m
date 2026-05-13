Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC0371CEA
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 20:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704652; cv=none; b=NLoUPUAQeskeGczU0kEusheOckvJkvQc0j2AxesluRH+IQxcVl+YRhqyk3Ak0SzChfKBm7Wcfsp8yMMIjkpoK4wbPtAnTdfeKJ3tKau6i/suDPhR8kN5vRMhCerLJHhL+Wna++KhoLvUMeXSMQM5qQQwdzxPDSmf7Sv7HvXWBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704652; c=relaxed/simple;
	bh=nOHhwdxEm5GvHZ07pdCjlB+PYgpdanf65VawXLkFUVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jM1ozSqc0qc41AV7M44EL+24ecFwuzuCL6xzSr0XJTIoktjeoIU1c8HcYx+/baTdB9/zs3TWUalw6UP3A5BmNM5wAqRgtaa6ri4wQcT3DW80Skvdf7+DbSkp4V5z639YM7erguzbTUqePz1c2w2Mh2LOlWkCKSmBiqYZc14oRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHOC9AER; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHOC9AER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778704650; x=1810240650;
  h=date:from:to:cc:subject:message-id;
  bh=nOHhwdxEm5GvHZ07pdCjlB+PYgpdanf65VawXLkFUVg=;
  b=eHOC9AERGwe4zsB7cOMzGnOYnAngrr/d/Ww1YpyrTF1Z4sbnI1JwZPgC
   xgutMbaF1Q9NWBHesLrYjmM7H0veN17GM9fbaNKJDmHKvzZr69dTleLws
   /nZADpTPTFfsFZTFLdVb/FkGJDrJrQHq0aPtOiPDLu0YBsIyAFH6nh3il
   f0byHYi40KeBy8s2gBuAkrpHLpmDgqmU1PYcs/c6fYo2I9S/5OT+b+AdS
   b6yvm2K7EmaAw/2lXxxp2/5ho+a67UwiTg4Q1XcDGMaz0FQcGedAnZ1OB
   EVyNLyTgnrdW2Iv/I52PxwwnvSCdMQwRja/6obcfEcWiiWGsvYu93PVhd
   Q==;
X-CSE-ConnectionGUID: uI5LyFZLTMS3h5+8ISHQgQ==
X-CSE-MsgGUID: crXKl2k/R5azGvb7rvVG6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97070194"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97070194"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:37:29 -0700
X-CSE-ConnectionGUID: 8nSmbn7QSVSwg0PlJne5Zw==
X-CSE-MsgGUID: uF7I03T2SkO4pfgfeApqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233915682"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2026 13:37:27 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNGKa-0000000052Z-3h1x;
	Wed, 13 May 2026 20:37:24 +0000
Date: Thu, 14 May 2026 04:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 459/799]
 fs/bcachefs/alloc/buckets.c:578 bch2_trans_account_disk_usage_change() error:
 we previously assumed 'trans->disk_res' could be null (see line 550)
Message-ID: <202605140445.bYKDUEz6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/799] bcachefs: move alloc files to subdir
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140445.bYKDUEz6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605140445.bYKDUEz6-lkp@intel.com/

smatch warnings:
fs/bcachefs/alloc/buckets.c:578 bch2_trans_account_disk_usage_change() error: we previously assumed 'trans->disk_res' could be null (see line 550)
fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/alloc/backpointers.c:363 __bch2_backpointer_get_key() warn: passing zero to 'ERR_CAST'

vim +578 fs/bcachefs/alloc/buckets.c

39283c712e6df92 fs/bcachefs/buckets.c Kent Overstreet 2020-10-19  546  
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11  547  void bch2_trans_account_disk_usage_change(struct btree_trans *trans)
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  548  {
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  549  	struct bch_fs *c = trans->c;
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11 @550  	u64 disk_res_sectors = trans->disk_res ? trans->disk_res->sectors : 0;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  551  	static int warned_disk_usage = 0;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  552  	bool warn = false;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  553  
156600751419b2d fs/bcachefs/buckets.c Kent Overstreet 2025-07-14  554  	guard(percpu_read)(&c->mark_lock);
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11  555  	struct bch_fs_usage_base *src = &trans->fs_usage_delta;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  556  
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11  557  	s64 added = src->btree + src->data + src->reserved;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  558  
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  559  	/*
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  560  	 * Not allowed to reduce sectors_available except by getting a
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  561  	 * reservation:
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  562  	 */
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11  563  	s64 should_not_have_added = added - (s64) disk_res_sectors;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  564  	if (unlikely(should_not_have_added > 0)) {
68573b936d3fced fs/bcachefs/buckets.c Uros Bizjak     2024-05-23  565  		u64 old, new;
290448ed2e0ac11 fs/bcachefs/buckets.c Kent Overstreet 2021-06-10  566  
68573b936d3fced fs/bcachefs/buckets.c Uros Bizjak     2024-05-23  567  		old = atomic64_read(&c->sectors_available);
290448ed2e0ac11 fs/bcachefs/buckets.c Kent Overstreet 2021-06-10  568  		do {
290448ed2e0ac11 fs/bcachefs/buckets.c Kent Overstreet 2021-06-10  569  			new = max_t(s64, 0, old - should_not_have_added);
68573b936d3fced fs/bcachefs/buckets.c Uros Bizjak     2024-05-23  570  		} while (!atomic64_try_cmpxchg(&c->sectors_available,
68573b936d3fced fs/bcachefs/buckets.c Uros Bizjak     2024-05-23  571  					       &old, new));
290448ed2e0ac11 fs/bcachefs/buckets.c Kent Overstreet 2021-06-10  572  
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  573  		added -= should_not_have_added;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  574  		warn = true;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  575  	}
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  576  
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  577  	if (added > 0) {
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03 @578  		trans->disk_res->sectors -= added;
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  579  		this_cpu_sub(*c->online_reserved, added);
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  580  	}
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  581  
156600751419b2d fs/bcachefs/buckets.c Kent Overstreet 2025-07-14  582  	scoped_guard(preempt) {
fb23d57a6dfc4e5 fs/bcachefs/buckets.c Kent Overstreet 2024-02-11  583  		struct bch_fs_usage_base *dst = this_cpu_ptr(c->usage);
fb23d57a6dfc4e5 fs/bcachefs/buckets.c Kent Overstreet 2024-02-11  584  		acc_u64s((u64 *) dst, (u64 *) src, sizeof(*src) / sizeof(u64));
156600751419b2d fs/bcachefs/buckets.c Kent Overstreet 2025-07-14  585  	}
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  586  
35d5aff263629ca fs/bcachefs/buckets.c Kent Overstreet 2021-04-03  587  	if (unlikely(warn) && !xchg(&warned_disk_usage, 1))
ad5d3d820a97500 fs/bcachefs/buckets.c Kent Overstreet 2023-01-25  588  		bch2_trans_inconsistent(trans,
df94cb2e57b2cc5 fs/bcachefs/buckets.c Kent Overstreet 2023-10-27  589  					"disk usage increased %lli more than %llu sectors reserved)",
ad5d3d820a97500 fs/bcachefs/buckets.c Kent Overstreet 2023-01-25  590  					should_not_have_added, disk_res_sectors);
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11  591  }
5b14ce35af90185 fs/bcachefs/buckets.c Kent Overstreet 2023-11-11  592  

:::::: The code at line 578 was first introduced by commit
:::::: 35d5aff263629caf98305d12c02d8b64d6981625 bcachefs: Kill bch2_fs_usage_scratch_get()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
