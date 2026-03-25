Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943AA2D0635
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432459; cv=none; b=EWopSAf0LV5u3OTmYYzXm0yXibi9Ghm2lKppyoMiWdZZCZyozMWwtXfRds0jWJ3voH7hAXkZzMEPv3pecbQbw2E+4z2XFW4VbrAAABqvM2YQ1d2pqMVD7dDXJ0j+R0YzWJ5Xdr3Dpp4J8s7arivtaLN7UWmyC1VMitVZKeaDeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432459; c=relaxed/simple;
	bh=aKsPd1mWqDYOjS4qUV8FLz6kRsRdoxnL8TsoEV0yFo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W7jOjgz8S8c2neV8eR+WRgUD9rl5g4kp5BncIodJuPxlprneL4DmTzjqqBenAnqi4C2HFgdMunAlxq3BMVIXVj0+6kdYhxhgwmKD7UgZTH/ycDaPyeL9GeFFCdEWG/A26Zq+z/mcrn8aT2jkIRbR1MUoHz0Bf9dz25GDUG5W0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrSwWdfh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrSwWdfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774432458; x=1805968458;
  h=date:from:to:cc:subject:message-id;
  bh=aKsPd1mWqDYOjS4qUV8FLz6kRsRdoxnL8TsoEV0yFo4=;
  b=mrSwWdfhN4BSWppyZwpmHDQ3qJGiqJQTpOL7AYXg4UjFKEO2U9FBbjfx
   iJbwaUkFJascI0Ue9eQOobWYIV1bQeUj1mDwxhe0tu4P3OTziIHQTp0Z+
   qNbRmTmR/71mZbj6qNO/plBUU/5Gc5fKtTaFY+tnEG//uV5SH5ijmD5VH
   I4JstXFE0FhhC6vAwA1i0GhI9f7dD6bMn32aWdyoHVM6v3fbzKCxJy9u9
   i+6WN1o0LyfYjygF7a/KnUOxFN/m4YG1c87MGD6dJhYWtE4Kdq6el981R
   jpwXaihKasQMy/1ZAzB7JYJ+924GkQZj5BJtZIO+mwIN+7CNpj34ATXV/
   Q==;
X-CSE-ConnectionGUID: niwEWbfBTC2cfs5tYpIbgQ==
X-CSE-MsgGUID: 38WbK4DPQI2tWtFPxDVRLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74491879"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="74491879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:54:17 -0700
X-CSE-ConnectionGUID: t+VpiPAbT3eaBdOWLp/rOA==
X-CSE-MsgGUID: o3fQ6JI0Qsior6d+1DtS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="247663756"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Mar 2026 02:54:15 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5KwH-000000006bF-1r56;
	Wed, 25 Mar 2026 09:54:13 +0000
Date: Wed, 25 Mar 2026 17:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hv/mshv_root_main.c:1005
 mshv_partition_ioctl_create_vp() warn: potential spectre issue
 'partition->pt_vp_array' [w]
Message-ID: <202603251739.jxWU331g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nuno Das Neves <nunodasneves@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Anirudh Rayabharam <anrayabh@linux.microsoft.com>
CC: Jinank Jain <jinankjain@microsoft.com>
CC: Mukesh Rathor <mrathor@linux.microsoft.com>
CC: Muminul Islam <muislam@microsoft.com>
CC: Praveen K Paladugu <prapal@linux.microsoft.com>
CC: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
CC: Roman Kisel <romank@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
date:   1 year ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-r071-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251739.jxWU331g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251739.jxWU331g-lkp@intel.com/

smatch warnings:
drivers/hv/mshv_root_main.c:1005 mshv_partition_ioctl_create_vp() warn: potential spectre issue 'partition->pt_vp_array' [w]

vim +1005 drivers/hv/mshv_root_main.c

621191d709b148 Nuno Das Neves 2025-03-14   911  
621191d709b148 Nuno Das Neves 2025-03-14   912  static long
621191d709b148 Nuno Das Neves 2025-03-14   913  mshv_partition_ioctl_create_vp(struct mshv_partition *partition,
621191d709b148 Nuno Das Neves 2025-03-14   914  			       void __user *arg)
621191d709b148 Nuno Das Neves 2025-03-14   915  {
621191d709b148 Nuno Das Neves 2025-03-14   916  	struct mshv_create_vp args;
621191d709b148 Nuno Das Neves 2025-03-14   917  	struct mshv_vp *vp;
621191d709b148 Nuno Das Neves 2025-03-14   918  	struct page *intercept_message_page, *register_page, *ghcb_page;
621191d709b148 Nuno Das Neves 2025-03-14   919  	void *stats_pages[2];
621191d709b148 Nuno Das Neves 2025-03-14   920  	long ret;
621191d709b148 Nuno Das Neves 2025-03-14   921  
621191d709b148 Nuno Das Neves 2025-03-14   922  	if (copy_from_user(&args, arg, sizeof(args)))
621191d709b148 Nuno Das Neves 2025-03-14   923  		return -EFAULT;
621191d709b148 Nuno Das Neves 2025-03-14   924  
621191d709b148 Nuno Das Neves 2025-03-14   925  	if (args.vp_index >= MSHV_MAX_VPS)
621191d709b148 Nuno Das Neves 2025-03-14   926  		return -EINVAL;
621191d709b148 Nuno Das Neves 2025-03-14   927  
621191d709b148 Nuno Das Neves 2025-03-14   928  	if (partition->pt_vp_array[args.vp_index])
621191d709b148 Nuno Das Neves 2025-03-14   929  		return -EEXIST;
621191d709b148 Nuno Das Neves 2025-03-14   930  
621191d709b148 Nuno Das Neves 2025-03-14   931  	ret = hv_call_create_vp(NUMA_NO_NODE, partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14   932  				0 /* Only valid for root partition VPs */);
621191d709b148 Nuno Das Neves 2025-03-14   933  	if (ret)
621191d709b148 Nuno Das Neves 2025-03-14   934  		return ret;
621191d709b148 Nuno Das Neves 2025-03-14   935  
621191d709b148 Nuno Das Neves 2025-03-14   936  	ret = hv_call_map_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14   937  					HV_VP_STATE_PAGE_INTERCEPT_MESSAGE,
621191d709b148 Nuno Das Neves 2025-03-14   938  					input_vtl_zero,
621191d709b148 Nuno Das Neves 2025-03-14   939  					&intercept_message_page);
621191d709b148 Nuno Das Neves 2025-03-14   940  	if (ret)
621191d709b148 Nuno Das Neves 2025-03-14   941  		goto destroy_vp;
621191d709b148 Nuno Das Neves 2025-03-14   942  
621191d709b148 Nuno Das Neves 2025-03-14   943  	if (!mshv_partition_encrypted(partition)) {
621191d709b148 Nuno Das Neves 2025-03-14   944  		ret = hv_call_map_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14   945  						HV_VP_STATE_PAGE_REGISTERS,
621191d709b148 Nuno Das Neves 2025-03-14   946  						input_vtl_zero,
621191d709b148 Nuno Das Neves 2025-03-14   947  						&register_page);
621191d709b148 Nuno Das Neves 2025-03-14   948  		if (ret)
621191d709b148 Nuno Das Neves 2025-03-14   949  			goto unmap_intercept_message_page;
621191d709b148 Nuno Das Neves 2025-03-14   950  	}
621191d709b148 Nuno Das Neves 2025-03-14   951  
621191d709b148 Nuno Das Neves 2025-03-14   952  	if (mshv_partition_encrypted(partition) &&
621191d709b148 Nuno Das Neves 2025-03-14   953  	    is_ghcb_mapping_available()) {
621191d709b148 Nuno Das Neves 2025-03-14   954  		ret = hv_call_map_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14   955  						HV_VP_STATE_PAGE_GHCB,
621191d709b148 Nuno Das Neves 2025-03-14   956  						input_vtl_normal,
621191d709b148 Nuno Das Neves 2025-03-14   957  						&ghcb_page);
621191d709b148 Nuno Das Neves 2025-03-14   958  		if (ret)
621191d709b148 Nuno Das Neves 2025-03-14   959  			goto unmap_register_page;
621191d709b148 Nuno Das Neves 2025-03-14   960  	}
621191d709b148 Nuno Das Neves 2025-03-14   961  
621191d709b148 Nuno Das Neves 2025-03-14   962  	if (hv_parent_partition()) {
621191d709b148 Nuno Das Neves 2025-03-14   963  		ret = mshv_vp_stats_map(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14   964  					stats_pages);
621191d709b148 Nuno Das Neves 2025-03-14   965  		if (ret)
621191d709b148 Nuno Das Neves 2025-03-14   966  			goto unmap_ghcb_page;
621191d709b148 Nuno Das Neves 2025-03-14   967  	}
621191d709b148 Nuno Das Neves 2025-03-14   968  
621191d709b148 Nuno Das Neves 2025-03-14   969  	vp = kzalloc(sizeof(*vp), GFP_KERNEL);
621191d709b148 Nuno Das Neves 2025-03-14   970  	if (!vp)
621191d709b148 Nuno Das Neves 2025-03-14   971  		goto unmap_stats_pages;
621191d709b148 Nuno Das Neves 2025-03-14   972  
621191d709b148 Nuno Das Neves 2025-03-14   973  	vp->vp_partition = mshv_partition_get(partition);
621191d709b148 Nuno Das Neves 2025-03-14   974  	if (!vp->vp_partition) {
621191d709b148 Nuno Das Neves 2025-03-14   975  		ret = -EBADF;
621191d709b148 Nuno Das Neves 2025-03-14   976  		goto free_vp;
621191d709b148 Nuno Das Neves 2025-03-14   977  	}
621191d709b148 Nuno Das Neves 2025-03-14   978  
621191d709b148 Nuno Das Neves 2025-03-14   979  	mutex_init(&vp->vp_mutex);
621191d709b148 Nuno Das Neves 2025-03-14   980  	init_waitqueue_head(&vp->run.vp_suspend_queue);
621191d709b148 Nuno Das Neves 2025-03-14   981  	atomic64_set(&vp->run.vp_signaled_count, 0);
621191d709b148 Nuno Das Neves 2025-03-14   982  
621191d709b148 Nuno Das Neves 2025-03-14   983  	vp->vp_index = args.vp_index;
621191d709b148 Nuno Das Neves 2025-03-14   984  	vp->vp_intercept_msg_page = page_to_virt(intercept_message_page);
621191d709b148 Nuno Das Neves 2025-03-14   985  	if (!mshv_partition_encrypted(partition))
621191d709b148 Nuno Das Neves 2025-03-14   986  		vp->vp_register_page = page_to_virt(register_page);
621191d709b148 Nuno Das Neves 2025-03-14   987  
621191d709b148 Nuno Das Neves 2025-03-14   988  	if (mshv_partition_encrypted(partition) && is_ghcb_mapping_available())
621191d709b148 Nuno Das Neves 2025-03-14   989  		vp->vp_ghcb_page = page_to_virt(ghcb_page);
621191d709b148 Nuno Das Neves 2025-03-14   990  
621191d709b148 Nuno Das Neves 2025-03-14   991  	if (hv_parent_partition())
621191d709b148 Nuno Das Neves 2025-03-14   992  		memcpy(vp->vp_stats_pages, stats_pages, sizeof(stats_pages));
621191d709b148 Nuno Das Neves 2025-03-14   993  
621191d709b148 Nuno Das Neves 2025-03-14   994  	/*
621191d709b148 Nuno Das Neves 2025-03-14   995  	 * Keep anon_inode_getfd last: it installs fd in the file struct and
621191d709b148 Nuno Das Neves 2025-03-14   996  	 * thus makes the state accessible in user space.
621191d709b148 Nuno Das Neves 2025-03-14   997  	 */
621191d709b148 Nuno Das Neves 2025-03-14   998  	ret = anon_inode_getfd("mshv_vp", &mshv_vp_fops, vp,
621191d709b148 Nuno Das Neves 2025-03-14   999  			       O_RDWR | O_CLOEXEC);
621191d709b148 Nuno Das Neves 2025-03-14  1000  	if (ret < 0)
621191d709b148 Nuno Das Neves 2025-03-14  1001  		goto put_partition;
621191d709b148 Nuno Das Neves 2025-03-14  1002  
621191d709b148 Nuno Das Neves 2025-03-14  1003  	/* already exclusive with the partition mutex for all ioctls */
621191d709b148 Nuno Das Neves 2025-03-14  1004  	partition->pt_vp_count++;
621191d709b148 Nuno Das Neves 2025-03-14 @1005  	partition->pt_vp_array[args.vp_index] = vp;
621191d709b148 Nuno Das Neves 2025-03-14  1006  
621191d709b148 Nuno Das Neves 2025-03-14  1007  	return ret;
621191d709b148 Nuno Das Neves 2025-03-14  1008  
621191d709b148 Nuno Das Neves 2025-03-14  1009  put_partition:
621191d709b148 Nuno Das Neves 2025-03-14  1010  	mshv_partition_put(partition);
621191d709b148 Nuno Das Neves 2025-03-14  1011  free_vp:
621191d709b148 Nuno Das Neves 2025-03-14  1012  	kfree(vp);
621191d709b148 Nuno Das Neves 2025-03-14  1013  unmap_stats_pages:
621191d709b148 Nuno Das Neves 2025-03-14  1014  	if (hv_parent_partition())
621191d709b148 Nuno Das Neves 2025-03-14  1015  		mshv_vp_stats_unmap(partition->pt_id, args.vp_index);
621191d709b148 Nuno Das Neves 2025-03-14  1016  unmap_ghcb_page:
621191d709b148 Nuno Das Neves 2025-03-14  1017  	if (mshv_partition_encrypted(partition) && is_ghcb_mapping_available()) {
621191d709b148 Nuno Das Neves 2025-03-14  1018  		hv_call_unmap_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14  1019  					    HV_VP_STATE_PAGE_GHCB,
621191d709b148 Nuno Das Neves 2025-03-14  1020  					    input_vtl_normal);
621191d709b148 Nuno Das Neves 2025-03-14  1021  	}
621191d709b148 Nuno Das Neves 2025-03-14  1022  unmap_register_page:
621191d709b148 Nuno Das Neves 2025-03-14  1023  	if (!mshv_partition_encrypted(partition)) {
621191d709b148 Nuno Das Neves 2025-03-14  1024  		hv_call_unmap_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14  1025  					    HV_VP_STATE_PAGE_REGISTERS,
621191d709b148 Nuno Das Neves 2025-03-14  1026  					    input_vtl_zero);
621191d709b148 Nuno Das Neves 2025-03-14  1027  	}
621191d709b148 Nuno Das Neves 2025-03-14  1028  unmap_intercept_message_page:
621191d709b148 Nuno Das Neves 2025-03-14  1029  	hv_call_unmap_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves 2025-03-14  1030  				    HV_VP_STATE_PAGE_INTERCEPT_MESSAGE,
621191d709b148 Nuno Das Neves 2025-03-14  1031  				    input_vtl_zero);
621191d709b148 Nuno Das Neves 2025-03-14  1032  destroy_vp:
621191d709b148 Nuno Das Neves 2025-03-14  1033  	hv_call_delete_vp(partition->pt_id, args.vp_index);
621191d709b148 Nuno Das Neves 2025-03-14  1034  	return ret;
621191d709b148 Nuno Das Neves 2025-03-14  1035  }
621191d709b148 Nuno Das Neves 2025-03-14  1036  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
