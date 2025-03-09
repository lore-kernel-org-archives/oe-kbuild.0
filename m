Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64738AD2C
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741486827; cv=none; b=aJdCTGxhbx42v2V5O/xEavfoUVz9bckVHmTmxsSjpcbHdwCCJBAPw39q2YJirjdFq+6ly6iD13xrb7SOSLgSd2fTuoLZgzWDwl5CVeZag9UXj03IF9AZWI5FGhLPqSXXVxWCHjZnAPgWiucFTgnrg08W+WeJ8pqQ2ahCDY737Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741486827; c=relaxed/simple;
	bh=GDMMvvAuPEz5kC4HJo9fte20fUiTZY/+W3vhGnaCqCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vB7j79GhPi3wPu5BwcI8eAW8jyOfDrhbh5YmYg6GHs9C0llqaelAapaVivRneLOAdYmJrUrWp0JWUF9JvLQnuYHRplwbVUVnWx4yu/pFRKuonVd/HWV01AxElgX7mfLsftve1nTiW2FoBZGGymip9HeHrdlmoqwhuIjegvl/RNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFq9IOqK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFq9IOqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741486825; x=1773022825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDMMvvAuPEz5kC4HJo9fte20fUiTZY/+W3vhGnaCqCs=;
  b=PFq9IOqK4B6zT9bDpcGwGbfwFVGiwNJ8x1d08J1baEoq8wnOVyOShHKX
   skzpAsAmP1b2JDkhwShJfcyqBuudeXWTIfEhOs9ee1hXsWIPcixSwsKhV
   XekCSA5RQ97qfyOgtr+4RUT5Y7kLiSFAW18eb51ewvL3gDjTXj5A/zcK4
   fNnv9/1N+FIKSrpXt0CcRDP4n1DoKYu63roPfnWnkcvQRmrn3IJztThrj
   BwoeetPdXIbcFlvFLjDO/Ts60SGMwaP81WPpfj8a/Km0DNMehi4ryjOrH
   E1zvhjX3KDG2uYXIod+sFofzjLsZQ7gHKQ0ln2ZU+bw5/u+KJmF159fxm
   Q==;
X-CSE-ConnectionGUID: tJong+d5S6a19tTOk3rQsw==
X-CSE-MsgGUID: e3CUiix/Q4Otlol/PXiCrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42724694"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42724694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 18:20:24 -0800
X-CSE-ConnectionGUID: MOQb7vxnRgW8sKSf13SF5A==
X-CSE-MsgGUID: XYgBRweIRG+Ud639eyhRzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156874576"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2025 18:20:23 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr6H7-0002Ye-0e;
	Sun, 09 Mar 2025 02:20:21 +0000
Date: Sun, 9 Mar 2025 10:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Message-ID: <202503091053.Hg9hUB8c-lkp@intel.com>
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
In-Reply-To: <20250307224125.111430-7-jonathan.cavitt@intel.com>
References: <20250307224125.111430-7-jonathan.cavitt@intel.com>
TO: Jonathan Cavitt <jonathan.cavitt@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: saurabhg.gupta@intel.com
CC: alex.zuo@intel.com
CC: jonathan.cavitt@intel.com
CC: joonas.lahtinen@linux.intel.com
CC: matthew.brost@intel.com
CC: jianxun.zhang@intel.com
CC: shuicheng.lin@intel.com
CC: dri-devel@lists.freedesktop.org

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250307]
[cannot apply to linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_gt_pagefault-Disallow-writes-to-read-only-VMAs/20250308-064247
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250307224125.111430-7-jonathan.cavitt%40intel.com
patch subject: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091053.Hg9hUB8c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503091053.Hg9hUB8c-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:3557 fill_faults() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2368 new_vma() error: we previously assumed 'bo' could be null (see line 2342)
drivers/gpu/drm/xe/xe_vm.c:3084 vm_bind_ioctl_ops_execute() error: uninitialized symbol 'fence'.
drivers/gpu/drm/xe/xe_vm.c:3950 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/i +3557 drivers/gpu/drm/xe/xe_vm.c

24e54814071dd04 Jonathan Cavitt 2025-03-07  3551  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3552  static int fill_faults(struct xe_vm *vm,
24e54814071dd04 Jonathan Cavitt 2025-03-07  3553  		       struct drm_xe_vm_get_faults *args)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3554  {
24e54814071dd04 Jonathan Cavitt 2025-03-07  3555  	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->faults);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3556  	struct xe_vm_pf_entry *entry;
24e54814071dd04 Jonathan Cavitt 2025-03-07 @3557  	int ret = 0, i = 0;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3558  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3559  	spin_lock(&vm->pfs.lock);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3560  	list_for_each_entry(entry, &vm->pfs.list, list) {
24e54814071dd04 Jonathan Cavitt 2025-03-07  3561  		struct xe_pagefault *pf = entry->pf;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3562  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3563  		ret = put_user(pf->page_addr, &usr_ptr->address);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3564  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3565  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3566  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3567  		ret = put_user(pf->address_type, &usr_ptr->address_type);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3568  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3569  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3570  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3571  		ret = put_user(1, &usr_ptr->address_precision);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3572  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3573  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3574  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3575  		usr_ptr++;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3576  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3577  		if (i == args->fault_count)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3578  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3579  	}
24e54814071dd04 Jonathan Cavitt 2025-03-07  3580  	spin_unlock(&vm->pfs.lock);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3581  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3582  	return ret ? -EFAULT : 0;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3583  }
24e54814071dd04 Jonathan Cavitt 2025-03-07  3584  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
