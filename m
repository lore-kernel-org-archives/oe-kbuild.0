Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567CED299
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Apr 2025 03:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745119435; cv=none; b=LXjv2oet+gwcokAP6OsgxVgUruIGenRdW2UcmkDHoTdt8qUlyEFUqHglVODKQJmHRCMjPi6aywMbmaqrQCXxb4sJwi9k6eujc7aLh+Y4zTzqj5bGxustVYdjgsCS0cy88gM+llFQbSoQvpzkXkJqKhYJObvm0MT16Nnq+0wQYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745119435; c=relaxed/simple;
	bh=RbVsj1X6+xvoOCb1IbqGFx6tjRqKHSMKGscc9XfV/5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NDgOmrm32FtUkSDL9BGhd3kcemJnaNGL54Eg1/4oGwVKEm2WHxnPI9wK9qIpFapx7bpmz4r3IENOTv/F/S5O66kSgTWQpjn8tzeDw+GVeXwLKZKp2HqoiLEVpOgA2BHlGBMxSELqqcO16DeJz7dLj07O2X07LlwrLGEU4olB4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fi8wFd9p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fi8wFd9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745119432; x=1776655432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RbVsj1X6+xvoOCb1IbqGFx6tjRqKHSMKGscc9XfV/5o=;
  b=Fi8wFd9pA/ITfrYUSu4BV8QeMsz7d9ozfzdiJHj/4iLpmYoyhgth6Bf2
   049C1ZoNZ2bFkB3BnhWZS9qZxQ0tVJ+ZNRuDLy13xb1OztQVQe3zhkF8y
   U4DGgbEWYcBAWN61GkOVOpV4nLOc2xY/KJ+W6B9XTy2EocX4Fl661ikd1
   z8M4daBL39RUmvzmhZwC+ZSfAGgnBF3ShYltZ8keVhEj3LLEFfaRmL3n2
   i16M9GirsjJ1lzKX9HKLzZgWijQGkvH3f/ljtElMSiZP8Sjzq/+B1EPrS
   AHRYNwc2mXk1VFzeLBHdUwl7Cc2SLiZiO1BKoPUhO50gPFx7WbYQPunoo
   w==;
X-CSE-ConnectionGUID: zWEAoaokS32NcrKvIlUytw==
X-CSE-MsgGUID: y+dl3b3+T7a2usNJx90NUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72083348"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72083348"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 20:23:51 -0700
X-CSE-ConnectionGUID: zQV8v0UaQ2W+pzTvjsL48g==
X-CSE-MsgGUID: ZUR70gz7TeG5awJVuH4V+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131401234"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Apr 2025 20:23:50 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6LHY-0004Nh-05;
	Sun, 20 Apr 2025 03:23:48 +0000
Date: Sun, 20 Apr 2025 11:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bcachefs:bcachefs-testing 75/113] fs/bcachefs/opts.c:590:33-40:
 ERROR: ca is NULL but dereferenced.
Message-ID: <202504201103.ztoPaSQ0-lkp@intel.com>
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
head:   079f1fc87119d47fa5c2ca76f0089a3bd8b0f2f8
commit: 071bda240fdbf9621ac202ab1049c1d4101607c9 [75/113] bcachefs: Clean up option pre/post hooks, small fixes
:::::: branch date: 4 hours ago
:::::: commit date: 20 hours ago
config: hexagon-randconfig-r051-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201103.ztoPaSQ0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504201103.ztoPaSQ0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/opts.c:590:33-40: ERROR: ca is NULL but dereferenced.
   fs/bcachefs/opts.c:590:49-56: ERROR: ca is NULL but dereferenced.

vim +590 fs/bcachefs/opts.c

cd575ddf57af00 Kent Overstreet 2018-11-01  556  
071bda240fdbf9 Kent Overstreet 2025-04-15  557  void bch2_opt_hook_post_set(struct bch_fs *c, struct bch_dev *ca, u64 inum,
071bda240fdbf9 Kent Overstreet 2025-04-15  558  			    struct bch_opts *new_opts, enum bch_opt_id id)
071bda240fdbf9 Kent Overstreet 2025-04-15  559  {
071bda240fdbf9 Kent Overstreet 2025-04-15  560  	switch (id) {
071bda240fdbf9 Kent Overstreet 2025-04-15  561  	case Opt_foreground_target:
071bda240fdbf9 Kent Overstreet 2025-04-15  562  		if (new_opts->foreground_target &&
071bda240fdbf9 Kent Overstreet 2025-04-15  563  		    !new_opts->background_target)
071bda240fdbf9 Kent Overstreet 2025-04-15  564  			bch2_set_rebalance_needs_scan(c, inum);
071bda240fdbf9 Kent Overstreet 2025-04-15  565  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  566  	case Opt_compression:
071bda240fdbf9 Kent Overstreet 2025-04-15  567  		if (new_opts->compression &&
071bda240fdbf9 Kent Overstreet 2025-04-15  568  		    !new_opts->background_compression)
071bda240fdbf9 Kent Overstreet 2025-04-15  569  			bch2_set_rebalance_needs_scan(c, inum);
071bda240fdbf9 Kent Overstreet 2025-04-15  570  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  571  	case Opt_background_target:
071bda240fdbf9 Kent Overstreet 2025-04-15  572  		if (new_opts->background_target)
071bda240fdbf9 Kent Overstreet 2025-04-15  573  			bch2_set_rebalance_needs_scan(c, inum);
071bda240fdbf9 Kent Overstreet 2025-04-15  574  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  575  	case Opt_background_compression:
071bda240fdbf9 Kent Overstreet 2025-04-15  576  		if (new_opts->background_compression)
071bda240fdbf9 Kent Overstreet 2025-04-15  577  			bch2_set_rebalance_needs_scan(c, inum);
071bda240fdbf9 Kent Overstreet 2025-04-15  578  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  579  	case Opt_rebalance_enabled:
071bda240fdbf9 Kent Overstreet 2025-04-15  580  		bch2_rebalance_wakeup(c);
071bda240fdbf9 Kent Overstreet 2025-04-15  581  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  582  	case Opt_copygc_enabled:
071bda240fdbf9 Kent Overstreet 2025-04-15  583  		bch2_copygc_wakeup(c);
071bda240fdbf9 Kent Overstreet 2025-04-15  584  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  585  	case Opt_discard:
071bda240fdbf9 Kent Overstreet 2025-04-15  586  		if (!ca) {
071bda240fdbf9 Kent Overstreet 2025-04-15  587  			mutex_lock(&c->sb_lock);
071bda240fdbf9 Kent Overstreet 2025-04-15  588  			for_each_member_device(c, ca) {
071bda240fdbf9 Kent Overstreet 2025-04-15  589  				struct bch_member *m =
071bda240fdbf9 Kent Overstreet 2025-04-15 @590  					bch2_members_v2_get_mut(ca->disk_sb.sb, ca->dev_idx);
071bda240fdbf9 Kent Overstreet 2025-04-15  591  				SET_BCH_MEMBER_DISCARD(m, c->opts.discard);
071bda240fdbf9 Kent Overstreet 2025-04-15  592  			}
071bda240fdbf9 Kent Overstreet 2025-04-15  593  
071bda240fdbf9 Kent Overstreet 2025-04-15  594  			bch2_write_super(c);
071bda240fdbf9 Kent Overstreet 2025-04-15  595  			mutex_unlock(&c->sb_lock);
071bda240fdbf9 Kent Overstreet 2025-04-15  596  		}
071bda240fdbf9 Kent Overstreet 2025-04-15  597  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  598  	default:
071bda240fdbf9 Kent Overstreet 2025-04-15  599  		break;
071bda240fdbf9 Kent Overstreet 2025-04-15  600  	}
071bda240fdbf9 Kent Overstreet 2025-04-15  601  }
071bda240fdbf9 Kent Overstreet 2025-04-15  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
