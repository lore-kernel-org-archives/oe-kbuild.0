Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E1423D7E3
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761842010; cv=none; b=P8KB2pOwIm2k5etZxlnk19KtPHmOC859yzjAYi9soZWDws0n76+CCJQXMOeF5Fx7bSe9YGt8AIEq2h15qtfLTtvF+ueHyJEHG8l9YwKmDusBWAxk2P/k3LQx+mpszKOIuucV4gmobHaTasjEXfgrYpc3V0I2HRk9x9moNqYYwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761842010; c=relaxed/simple;
	bh=Ege9pyBj+Cx8vWXbDJkReTgvsaHFMZeIMjKsLh+nlSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsdoqKd+APChNsUAEfTx4F4/5rvorCvJ4lQyLUhbY8V7P8UM9gxO7eyeNdsVOrUzYnB2XhiKsITDuMgBBADk4FEPl3WhevZZ4lm8sr2oL1GeIFZ1lwYF7/IvmcjP5YZad9V9X6EBhVTJ2bVfS9Ec26KFSGLurdxmB6Nw6xpm/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgOSzbUL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgOSzbUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761842008; x=1793378008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ege9pyBj+Cx8vWXbDJkReTgvsaHFMZeIMjKsLh+nlSI=;
  b=XgOSzbUL3jUTnyYgI9KlZb6gFqiSosSkZBum0Bw3jJFYDl+b6pOB0Se5
   ULH/ET8IgW4iTWlMyxYxS99gNcXeiWZB/kFVdpi4LSTE8P4jxwUat6q8w
   pa+M0ReGXDUDVRSU1gDN504Fw8djG1Q/fDz05u07QWZShs7PdZOAKQ3oY
   ZsI7rFw+N46t5IEco8ovhBvBqhDZxa5QIjV+EFe2tx0iWBZFckaZWcxxt
   Ag98wBIutQ37ZN38IssG+vxf8yFLn4rR9uOB7Ob6Ivgq6Rqaa+jOReWDb
   0C+ZMA1rNMIRKlV73lG8J9s6iVhfO4lZQWtdZPrhIIIDKuL+nX4Gk76gB
   Q==;
X-CSE-ConnectionGUID: mBkiK0QCSeiJaqVApeCfxA==
X-CSE-MsgGUID: vjdck2SuQBSOHX9/QQBEkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51562860"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="51562860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 09:33:27 -0700
X-CSE-ConnectionGUID: vGJgC+ZBRsWhb4JiApZMIA==
X-CSE-MsgGUID: Yx643wO+Qh66Ig1LvKpb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185936160"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2025 09:33:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEVaV-000MDo-2F;
	Thu, 30 Oct 2025 16:33:23 +0000
Date: Fri, 31 Oct 2025 00:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/rme.c:553
 realm_fold_rtt_level() error: uninitialized symbol 'rtt_granule'.
Message-ID: <202510310013.Jtx8d2Tu-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Xu Raoqing <xuraoqing@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 4afc6444175955a0d1fb8a01a12ff2ca29191cad [3064/3064] [v8-15-43]arm64: RME: Allow VMM to set RIPAS
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510310013.Jtx8d2Tu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510310013.Jtx8d2Tu-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/rme.c:553 realm_fold_rtt_level() error: uninitialized symbol 'rtt_granule'.

Old smatch warnings:
arch/arm64/kvm/rme.c:380 realm_create_rd() error: uninitialized symbol 'r'.
arch/arm64/kvm/rme.c:384 realm_create_rd() error: uninitialized symbol 'r'.

vim +/rtt_granule +553 arch/arm64/kvm/rme.c

2db822cdbd4c9ce Steven Price 2025-06-14  525  
4afc6444175955a Steven Price 2025-06-14  526  /*
4afc6444175955a Steven Price 2025-06-14  527   * Returns 0 on successful fold, a negative value on error, a positive value if
4afc6444175955a Steven Price 2025-06-14  528   * we were not able to fold all tables at this level.
4afc6444175955a Steven Price 2025-06-14  529   */
4afc6444175955a Steven Price 2025-06-14  530  static int realm_fold_rtt_level(struct realm *realm, int level,
4afc6444175955a Steven Price 2025-06-14  531  				unsigned long start, unsigned long end)
4afc6444175955a Steven Price 2025-06-14  532  {
4afc6444175955a Steven Price 2025-06-14  533  	int not_folded = 0;
4afc6444175955a Steven Price 2025-06-14  534  	ssize_t map_size;
4afc6444175955a Steven Price 2025-06-14  535  	unsigned long addr, next_addr;
4afc6444175955a Steven Price 2025-06-14  536  
4afc6444175955a Steven Price 2025-06-14  537  	if (WARN_ON(level > RMM_RTT_MAX_LEVEL))
4afc6444175955a Steven Price 2025-06-14  538  		return -EINVAL;
4afc6444175955a Steven Price 2025-06-14  539  
4afc6444175955a Steven Price 2025-06-14  540  	map_size = rme_rtt_level_mapsize(level - 1);
4afc6444175955a Steven Price 2025-06-14  541  
4afc6444175955a Steven Price 2025-06-14  542  	for (addr = start; addr < end; addr = next_addr) {
4afc6444175955a Steven Price 2025-06-14  543  		phys_addr_t rtt_granule;
4afc6444175955a Steven Price 2025-06-14  544  		int ret;
4afc6444175955a Steven Price 2025-06-14  545  		unsigned long align_addr = ALIGN(addr, map_size);
4afc6444175955a Steven Price 2025-06-14  546  
4afc6444175955a Steven Price 2025-06-14  547  		next_addr = ALIGN(addr + 1, map_size);
4afc6444175955a Steven Price 2025-06-14  548  
4afc6444175955a Steven Price 2025-06-14  549  		ret = realm_rtt_fold(realm, align_addr, level, &rtt_granule);
4afc6444175955a Steven Price 2025-06-14  550  
4afc6444175955a Steven Price 2025-06-14  551  		switch (RMI_RETURN_STATUS(ret)) {
4afc6444175955a Steven Price 2025-06-14  552  		case RMI_SUCCESS:
4afc6444175955a Steven Price 2025-06-14 @553  			free_delegated_granule(rtt_granule);
4afc6444175955a Steven Price 2025-06-14  554  			break;
4afc6444175955a Steven Price 2025-06-14  555  		case RMI_ERROR_RTT:
4afc6444175955a Steven Price 2025-06-14  556  			if (level == RMM_RTT_MAX_LEVEL ||
4afc6444175955a Steven Price 2025-06-14  557  			    RMI_RETURN_INDEX(ret) < level) {
4afc6444175955a Steven Price 2025-06-14  558  				not_folded++;
4afc6444175955a Steven Price 2025-06-14  559  				break;
4afc6444175955a Steven Price 2025-06-14  560  			}
4afc6444175955a Steven Price 2025-06-14  561  			/* Recurse a level deeper */
4afc6444175955a Steven Price 2025-06-14  562  			ret = realm_fold_rtt_level(realm,
4afc6444175955a Steven Price 2025-06-14  563  						   level + 1,
4afc6444175955a Steven Price 2025-06-14  564  						   addr,
4afc6444175955a Steven Price 2025-06-14  565  						   next_addr);
4afc6444175955a Steven Price 2025-06-14  566  			if (ret < 0)
4afc6444175955a Steven Price 2025-06-14  567  				return ret;
4afc6444175955a Steven Price 2025-06-14  568  			else if (ret == 0)
4afc6444175955a Steven Price 2025-06-14  569  				/* Try again at this level */
4afc6444175955a Steven Price 2025-06-14  570  				next_addr = addr;
4afc6444175955a Steven Price 2025-06-14  571  			break;
4afc6444175955a Steven Price 2025-06-14  572  		default:
4afc6444175955a Steven Price 2025-06-14  573  			WARN_ON(1);
4afc6444175955a Steven Price 2025-06-14  574  			return -ENXIO;
4afc6444175955a Steven Price 2025-06-14  575  		}
4afc6444175955a Steven Price 2025-06-14  576  	}
4afc6444175955a Steven Price 2025-06-14  577  
4afc6444175955a Steven Price 2025-06-14  578  	return not_folded;
4afc6444175955a Steven Price 2025-06-14  579  }
4afc6444175955a Steven Price 2025-06-14  580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
