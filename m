Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF3158538
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Mar 2025 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241396; cv=none; b=hmgeASnpd3oG8vofi/05Kg63YsUSQ9umWc8lObaBeYCfOI/eTIImxeF9fRf0c0+OpFAFZnjpaEtDUe60GV6tkibM9+IgAuCxH1EoI3wV8lAAgveJ31nAbT/IbWr3+U1Z44N9AXtUt+asqRL4vjmYY8spmq5IueM8C3jQUaL2bc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241396; c=relaxed/simple;
	bh=Qjn5eGr5oXFOZYkUnaHCFO5s3AnyqAgKh1hRR1oDDxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lu6vnIAwm89wMof0NY/dqch5nkKvWHRv3tXCVcoko4GZxy0+LM7IzCcLF9XhK97ucswAzqlME/KxmSyjB9mnSB/e7wGp+qMs+oqc4WHIBzZj8fQxrI+sriR/jZ9fUqoGBIdVhmef6f/vygkC43aZEpSG8Lh2hAbBB9THaiDKLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSwOydNh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSwOydNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743241394; x=1774777394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qjn5eGr5oXFOZYkUnaHCFO5s3AnyqAgKh1hRR1oDDxA=;
  b=aSwOydNhPX8TbaPv8Wy6+hxw4pU/tXQNmVCHCvNAua+al+sSdlT6kGBO
   vG5X0Fx2x83jl9fO8nJocWl5q94h0mnCpr14hPToAAHu4xPC24ukVfzqP
   JEOzVIOAk9xQCD7qR0VR+yOwAMJWewpzp2BTK9I1AluJ+WD49QC+HmNqM
   E3CLUNSvznStOV1LGf1CpHsUdOA8slnPm92vyGg2aC3FDXMA3msRpSyus
   HCZZHahYofPuqCQIwloeg6XvE/t0V28Yqy74rToxrkIRvptI2JqIEBaJ5
   GESLA8n4f3OzOZ+LdwFcT/ySQKiI8Qja1+OqofLdjhAkF/pSxD972z+0N
   A==;
X-CSE-ConnectionGUID: XoAlyZmSTaqriF0qcKSgmg==
X-CSE-MsgGUID: hC+R/RoCSBWNJYK4jS3Qrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55258829"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="55258829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 02:43:13 -0700
X-CSE-ConnectionGUID: A3KMU2h2QF+cWEyfUnMuGA==
X-CSE-MsgGUID: ni/EvSCGRSWYfTgzL8jXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="126463662"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Mar 2025 02:43:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tySib-00081u-2V;
	Sat, 29 Mar 2025 09:43:09 +0000
Date: Sat, 29 Mar 2025 17:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 499/499]
 mm/vmscan.c:4035 folio_update_gen() error: uninitialized symbol 'activate'.
Message-ID: <202503291752.TM4z2VVR-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   05387f6649b8b2e90387b0f30e788b96413e54d0
commit: 502d91a72b9c5bef5d3ae1b7b2b3a9901a8a4e2f [499/499] CHROMIUM: mm/mglru: slow down promotion through page tables
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291752.TM4z2VVR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503291752.TM4z2VVR-lkp@intel.com/

smatch warnings:
mm/vmscan.c:4035 folio_update_gen() error: uninitialized symbol 'activate'.

vim +/activate +4035 mm/vmscan.c

018ee47f14893d5 Yu Zhao       2022-09-18  3967  
502d91a72b9c5be David Stevens 2024-10-09  3968  /* promote pages accessed through page tables */
502d91a72b9c5be David Stevens 2024-10-09  3969  static int folio_update_gen(struct folio *folio, int active_gen,
502d91a72b9c5be David Stevens 2024-10-09  3970  			    int *new_gen, bool *activate_out)
502d91a72b9c5be David Stevens 2024-10-09  3971  {
502d91a72b9c5be David Stevens 2024-10-09  3972  	unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
502d91a72b9c5be David Stevens 2024-10-09  3973  	int old_gen;
502d91a72b9c5be David Stevens 2024-10-09  3974  	bool activate;
502d91a72b9c5be David Stevens 2024-10-09  3975  
502d91a72b9c5be David Stevens 2024-10-09  3976  	if (lru_gen_aggressive_mm()) {
502d91a72b9c5be David Stevens 2024-10-09  3977  		*new_gen = active_gen;
502d91a72b9c5be David Stevens 2024-10-09  3978  		if (activate_out)
502d91a72b9c5be David Stevens 2024-10-09  3979  			*activate_out = true;
502d91a72b9c5be David Stevens 2024-10-09  3980  		return folio_update_gen_active(folio, active_gen);
502d91a72b9c5be David Stevens 2024-10-09  3981  	}
502d91a72b9c5be David Stevens 2024-10-09  3982  
502d91a72b9c5be David Stevens 2024-10-09  3983  	VM_WARN_ON_ONCE(active_gen >= (int) MAX_NR_GENS);
502d91a72b9c5be David Stevens 2024-10-09  3984  	VM_WARN_ON_ONCE(!rcu_read_lock_held());
502d91a72b9c5be David Stevens 2024-10-09  3985  
502d91a72b9c5be David Stevens 2024-10-09  3986  	do {
502d91a72b9c5be David Stevens 2024-10-09  3987  		old_gen = lru_raw_gen_from_flags(old_flags);
502d91a72b9c5be David Stevens 2024-10-09  3988  
502d91a72b9c5be David Stevens 2024-10-09  3989  		/* lru_gen_del_folio() has isolated this page? */
502d91a72b9c5be David Stevens 2024-10-09  3990  		if (old_gen >= (int) ISOLATED_FOLIO_MIN) {
502d91a72b9c5be David Stevens 2024-10-09  3991  			unsigned long new_gen = min(old_gen + 1, (int) ISOLATED_FOLIO_MAX);
502d91a72b9c5be David Stevens 2024-10-09  3992  
502d91a72b9c5be David Stevens 2024-10-09  3993  			/* for folio_check_references() */
502d91a72b9c5be David Stevens 2024-10-09  3994  			new_flags = old_flags & ~LRU_GEN_MASK;
502d91a72b9c5be David Stevens 2024-10-09  3995  			new_flags |= (new_gen + 1UL) << LRU_GEN_PGOFF;
502d91a72b9c5be David Stevens 2024-10-09  3996  			old_gen = -1;
502d91a72b9c5be David Stevens 2024-10-09  3997  			continue;
502d91a72b9c5be David Stevens 2024-10-09  3998  		}
502d91a72b9c5be David Stevens 2024-10-09  3999  
502d91a72b9c5be David Stevens 2024-10-09  4000  		activate = old_flags & BIT(PG_referenced);
502d91a72b9c5be David Stevens 2024-10-09  4001  
502d91a72b9c5be David Stevens 2024-10-09  4002  		if (activate)
502d91a72b9c5be David Stevens 2024-10-09  4003  			new_flags = old_flags & ~BIT(PG_referenced);
502d91a72b9c5be David Stevens 2024-10-09  4004  		else
502d91a72b9c5be David Stevens 2024-10-09  4005  			new_flags = old_flags | BIT(PG_referenced);
502d91a72b9c5be David Stevens 2024-10-09  4006  
502d91a72b9c5be David Stevens 2024-10-09  4007  		/*
502d91a72b9c5be David Stevens 2024-10-09  4008  		 * ptes are created before pages are added to the lru, so we can
502d91a72b9c5be David Stevens 2024-10-09  4009  		 * come across a page with no generation when walking page
502d91a72b9c5be David Stevens 2024-10-09  4010  		 * tables. Set the active flag if necessary so they get inserted
502d91a72b9c5be David Stevens 2024-10-09  4011  		 * into the newest generation.
502d91a72b9c5be David Stevens 2024-10-09  4012  		 */
502d91a72b9c5be David Stevens 2024-10-09  4013  		if (old_gen == -1) {
502d91a72b9c5be David Stevens 2024-10-09  4014  			if (activate)
502d91a72b9c5be David Stevens 2024-10-09  4015  				new_flags |= BIT(PG_active);
502d91a72b9c5be David Stevens 2024-10-09  4016  		} else if (active_gen >= 0) {
502d91a72b9c5be David Stevens 2024-10-09  4017  			int new_gen;
502d91a72b9c5be David Stevens 2024-10-09  4018  
502d91a72b9c5be David Stevens 2024-10-09  4019  			if (activate) {
502d91a72b9c5be David Stevens 2024-10-09  4020  				new_gen = active_gen;
502d91a72b9c5be David Stevens 2024-10-09  4021  			} else if (old_gen == active_gen) {
502d91a72b9c5be David Stevens 2024-10-09  4022  				new_gen = old_gen;
502d91a72b9c5be David Stevens 2024-10-09  4023  			} else {
502d91a72b9c5be David Stevens 2024-10-09  4024  				new_gen = (old_gen + 1) % MAX_NR_GENS;
502d91a72b9c5be David Stevens 2024-10-09  4025  				if (new_gen == active_gen)
502d91a72b9c5be David Stevens 2024-10-09  4026  					new_gen = old_gen;
502d91a72b9c5be David Stevens 2024-10-09  4027  			}
502d91a72b9c5be David Stevens 2024-10-09  4028  
502d91a72b9c5be David Stevens 2024-10-09  4029  			new_flags &= ~(LRU_GEN_MASK | LRU_REFS_MASK | BIT(PG_workingset));
502d91a72b9c5be David Stevens 2024-10-09  4030  			new_flags |= (new_gen + 1UL) << LRU_GEN_PGOFF;
502d91a72b9c5be David Stevens 2024-10-09  4031  		}
502d91a72b9c5be David Stevens 2024-10-09  4032  	} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
502d91a72b9c5be David Stevens 2024-10-09  4033  
502d91a72b9c5be David Stevens 2024-10-09  4034  	if (activate_out)
502d91a72b9c5be David Stevens 2024-10-09 @4035  		*activate_out = activate;
502d91a72b9c5be David Stevens 2024-10-09  4036  
502d91a72b9c5be David Stevens 2024-10-09  4037  	*new_gen = lru_raw_gen_from_flags(new_flags);
502d91a72b9c5be David Stevens 2024-10-09  4038  	return old_gen;
502d91a72b9c5be David Stevens 2024-10-09  4039  }
502d91a72b9c5be David Stevens 2024-10-09  4040  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
