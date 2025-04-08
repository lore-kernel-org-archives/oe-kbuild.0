Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276472405EB
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Apr 2025 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152789; cv=none; b=WHJ4BLw/VH3G/FOUc3mgC8/cb8lOPI6/onoGKtzf5exyxwKpsw+wQ2Wz2zKgixXfUAoIJuNPCm4I/7GEgL7++EyqAUpeiqnph8SM1dvQm/apNkUYV9OkOvvOhhQAFlrsJFjUuXIwf45FobArh27Bjcv+El2SgUF2KmFi9MTImx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152789; c=relaxed/simple;
	bh=sEaBVDaTKlUIWDRVr+VaDiOPSntVdWbFeLMSqVlQd7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ML9Jx3HXt8Y6opNLzsYinUv65fGcshd//E+ChFStdmmd4lqrqO/eJs6RhYMN0FXWQ76hyCEZWupOre5Sc1hhb55XFdd3lKKZY6CSUDCmDrjcfHmdObp410FmeijX6JCb0gzc1GoZ0fnbxy2OlOg1H1ADEuWqu72Vjsnc9cEWXj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9nH6AGC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9nH6AGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744152787; x=1775688787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sEaBVDaTKlUIWDRVr+VaDiOPSntVdWbFeLMSqVlQd7E=;
  b=V9nH6AGC/Ky82HIwc9u7n7rDuZMJ9NVs9JpzmDydozRDs/ic6+K+x+zM
   DLHwigLWX6kOwgP9OBA9nHrv6gb8Yfi1LosSSBMPoQXzFezR06Bz7mIDX
   r8+HBy1P6jTYmX10iRPo8KIYplSEb7m+OYpfw2KhqvaLBiTiWsmL6yo8i
   qvw+F4qZA6sm3loL2VaUvmzheKVc07ZCU11jFfAi63hS1943LFTfPX/kE
   BTMCpge8mJDYcWwHzTGiNP3CNmdX2QX4INmNdYCMM3LXPvIx3ZqI8DI18
   k0cwgtLQoS45Y/7+nz0SZDnuHR3Fh7el2eFDoXXGSs5B7Kd6V13Sb14kF
   A==;
X-CSE-ConnectionGUID: D7/KPXuuQ/+DoIMutvFD7Q==
X-CSE-MsgGUID: rfUixneeSy+zf2UaT+U1kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45770160"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45770160"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 15:53:07 -0700
X-CSE-ConnectionGUID: b002KXkmTKewszmztdk1VQ==
X-CSE-MsgGUID: Pk0F7s3dR4Gl1m3DuB0Ayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="132533088"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2025 15:53:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2HoV-00082v-03;
	Tue, 08 Apr 2025 22:53:03 +0000
Date: Wed, 9 Apr 2025 06:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hv/mshv_root_hv_call.c:85 hv_call_withdraw_memory() error:
 uninitialized symbol 'status'.
Message-ID: <202504090616.nq8gpISj-lkp@intel.com>
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
head:   bec7dcbc242c6c087cede1a6fdfaeb5d6eaf25bf
commit: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r071-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090616.nq8gpISj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504090616.nq8gpISj-lkp@intel.com/

New smatch warnings:
drivers/hv/mshv_root_hv_call.c:85 hv_call_withdraw_memory() error: uninitialized symbol 'status'.
drivers/hv/mshv_root_main.c:989 mshv_partition_ioctl_create_vp() error: uninitialized symbol 'ghcb_page'.
drivers/hv/mshv_root_main.c:1005 mshv_partition_ioctl_create_vp() warn: potential spectre issue 'partition->pt_vp_array' [w]

Old smatch warnings:
arch/x86/include/asm/mshyperv.h:157 _hv_do_fast_hypercall8() warn: inconsistent indenting

vim +/status +85 drivers/hv/mshv_root_hv_call.c

621191d709b148 Nuno Das Neves 2025-03-14  22  
621191d709b148 Nuno Das Neves 2025-03-14  23  #define HV_WITHDRAW_BATCH_SIZE	(HV_HYP_PAGE_SIZE / sizeof(u64))
621191d709b148 Nuno Das Neves 2025-03-14  24  #define HV_MAP_GPA_BATCH_SIZE	\
621191d709b148 Nuno Das Neves 2025-03-14  25  	((HV_HYP_PAGE_SIZE - sizeof(struct hv_input_map_gpa_pages)) \
621191d709b148 Nuno Das Neves 2025-03-14  26  		/ sizeof(u64))
621191d709b148 Nuno Das Neves 2025-03-14  27  #define HV_GET_VP_STATE_BATCH_SIZE	\
621191d709b148 Nuno Das Neves 2025-03-14  28  	((HV_HYP_PAGE_SIZE - sizeof(struct hv_input_get_vp_state)) \
621191d709b148 Nuno Das Neves 2025-03-14  29  		/ sizeof(u64))
621191d709b148 Nuno Das Neves 2025-03-14  30  #define HV_SET_VP_STATE_BATCH_SIZE	\
621191d709b148 Nuno Das Neves 2025-03-14  31  	((HV_HYP_PAGE_SIZE - sizeof(struct hv_input_set_vp_state)) \
621191d709b148 Nuno Das Neves 2025-03-14  32  		/ sizeof(u64))
621191d709b148 Nuno Das Neves 2025-03-14  33  #define HV_GET_GPA_ACCESS_STATES_BATCH_SIZE	\
621191d709b148 Nuno Das Neves 2025-03-14  34  	((HV_HYP_PAGE_SIZE - sizeof(union hv_gpa_page_access_state)) \
621191d709b148 Nuno Das Neves 2025-03-14  35  		/ sizeof(union hv_gpa_page_access_state))
621191d709b148 Nuno Das Neves 2025-03-14  36  #define HV_MODIFY_SPARSE_SPA_PAGE_HOST_ACCESS_MAX_PAGE_COUNT		       \
621191d709b148 Nuno Das Neves 2025-03-14  37  	((HV_HYP_PAGE_SIZE -						       \
621191d709b148 Nuno Das Neves 2025-03-14  38  	  sizeof(struct hv_input_modify_sparse_spa_page_host_access)) /        \
621191d709b148 Nuno Das Neves 2025-03-14  39  	 sizeof(u64))
621191d709b148 Nuno Das Neves 2025-03-14  40  
621191d709b148 Nuno Das Neves 2025-03-14  41  int hv_call_withdraw_memory(u64 count, int node, u64 partition_id)
621191d709b148 Nuno Das Neves 2025-03-14  42  {
621191d709b148 Nuno Das Neves 2025-03-14  43  	struct hv_input_withdraw_memory *input_page;
621191d709b148 Nuno Das Neves 2025-03-14  44  	struct hv_output_withdraw_memory *output_page;
621191d709b148 Nuno Das Neves 2025-03-14  45  	struct page *page;
621191d709b148 Nuno Das Neves 2025-03-14  46  	u16 completed;
621191d709b148 Nuno Das Neves 2025-03-14  47  	unsigned long remaining = count;
621191d709b148 Nuno Das Neves 2025-03-14  48  	u64 status;
621191d709b148 Nuno Das Neves 2025-03-14  49  	int i;
621191d709b148 Nuno Das Neves 2025-03-14  50  	unsigned long flags;
621191d709b148 Nuno Das Neves 2025-03-14  51  
621191d709b148 Nuno Das Neves 2025-03-14  52  	page = alloc_page(GFP_KERNEL);
621191d709b148 Nuno Das Neves 2025-03-14  53  	if (!page)
621191d709b148 Nuno Das Neves 2025-03-14  54  		return -ENOMEM;
621191d709b148 Nuno Das Neves 2025-03-14  55  	output_page = page_address(page);
621191d709b148 Nuno Das Neves 2025-03-14  56  
621191d709b148 Nuno Das Neves 2025-03-14  57  	while (remaining) {
621191d709b148 Nuno Das Neves 2025-03-14  58  		local_irq_save(flags);
621191d709b148 Nuno Das Neves 2025-03-14  59  
621191d709b148 Nuno Das Neves 2025-03-14  60  		input_page = *this_cpu_ptr(hyperv_pcpu_input_arg);
621191d709b148 Nuno Das Neves 2025-03-14  61  
621191d709b148 Nuno Das Neves 2025-03-14  62  		memset(input_page, 0, sizeof(*input_page));
621191d709b148 Nuno Das Neves 2025-03-14  63  		input_page->partition_id = partition_id;
621191d709b148 Nuno Das Neves 2025-03-14  64  		status = hv_do_rep_hypercall(HVCALL_WITHDRAW_MEMORY,
621191d709b148 Nuno Das Neves 2025-03-14  65  					     min(remaining, HV_WITHDRAW_BATCH_SIZE),
621191d709b148 Nuno Das Neves 2025-03-14  66  					     0, input_page, output_page);
621191d709b148 Nuno Das Neves 2025-03-14  67  
621191d709b148 Nuno Das Neves 2025-03-14  68  		local_irq_restore(flags);
621191d709b148 Nuno Das Neves 2025-03-14  69  
621191d709b148 Nuno Das Neves 2025-03-14  70  		completed = hv_repcomp(status);
621191d709b148 Nuno Das Neves 2025-03-14  71  
621191d709b148 Nuno Das Neves 2025-03-14  72  		for (i = 0; i < completed; i++)
621191d709b148 Nuno Das Neves 2025-03-14  73  			__free_page(pfn_to_page(output_page->gpa_page_list[i]));
621191d709b148 Nuno Das Neves 2025-03-14  74  
621191d709b148 Nuno Das Neves 2025-03-14  75  		if (!hv_result_success(status)) {
621191d709b148 Nuno Das Neves 2025-03-14  76  			if (hv_result(status) == HV_STATUS_NO_RESOURCES)
621191d709b148 Nuno Das Neves 2025-03-14  77  				status = HV_STATUS_SUCCESS;
621191d709b148 Nuno Das Neves 2025-03-14  78  			break;
621191d709b148 Nuno Das Neves 2025-03-14  79  		}
621191d709b148 Nuno Das Neves 2025-03-14  80  
621191d709b148 Nuno Das Neves 2025-03-14  81  		remaining -= completed;
621191d709b148 Nuno Das Neves 2025-03-14  82  	}
621191d709b148 Nuno Das Neves 2025-03-14  83  	free_page((unsigned long)output_page);
621191d709b148 Nuno Das Neves 2025-03-14  84  
621191d709b148 Nuno Das Neves 2025-03-14 @85  	return hv_result_to_errno(status);
621191d709b148 Nuno Das Neves 2025-03-14  86  }
621191d709b148 Nuno Das Neves 2025-03-14  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
