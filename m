Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46D120E31D
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729467747; cv=none; b=IQz1VDtFHAMC75bAUcwLpiyft1RibD+7YITx9CSitrpa7oVCCavTc6lhcagEfOw4gkOtunAXsh/W73u7AK1dekh/ztKzDZTy5VIJFDf2HHG4ubaK11bO5afbuGdS+d8xRW4fRLcSqdl3dEZ4EF6OM6rCNN26IM0ZuZNhKBuwKPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729467747; c=relaxed/simple;
	bh=R13e34CNtYvQbNFudrLySVx4DJcgDsJ3wOIbu3MZ2Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+gnS2JpU9iYuAEsRQ6cb8PYbcxyGLDihVeSydrTt9pD0eg0aNnTRsLIEayo0M+v8qW5UeqBYSw+rQZvnAJo6UrmCPnP3dMIvSR7lDlGv5wB63x+7xqBs1aWD6e4Pr/N3i21H2bsDTOXsbHRltKQ0K+YohXL69cnjo69QQDd958=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPMXq8ke; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPMXq8ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729467746; x=1761003746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R13e34CNtYvQbNFudrLySVx4DJcgDsJ3wOIbu3MZ2Wo=;
  b=lPMXq8kev07DonKR1gVChRqVN/JOKBcjuZgXUwdM8PuGYUqd3rsF9sCn
   xUt7OcaooneodoCbCPLgXQnzNmLOZBur6RJJK/KheMU6mP++WJ8HESH7L
   Bv2svwo2fr/dyUy8tvi/oS6JhYNLRVwGo3TLUrT/gvxPTTDYckSPoaiiU
   dpdVX5Ou/ZV15CFvg5DIZDfAFeATOhPnImFWNEmUVwbQFIfNuVTvFQjGl
   eMQSVTnuDKpN6OmbCh96Cs+H69iEy29MBJJ2lOstcXfsQVboiORgQxWQ+
   l83hHEACyOnqGtrvK6PfbaRjHBg3vlWG99tmE7pYfY0MNAfpXKtf2MG9s
   g==;
X-CSE-ConnectionGUID: Ezw5bEZuSWWIu/Gng3hc3A==
X-CSE-MsgGUID: mxd2HvG5QpSgH0Kbpm9GLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40059830"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40059830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 16:42:26 -0700
X-CSE-ConnectionGUID: 2VtR6KpdTxONaF5SivdmTw==
X-CSE-MsgGUID: 2bkT4NHsTCO5ZeoczwW3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79429605"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2024 16:42:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2fYz-000QtX-28;
	Sun, 20 Oct 2024 23:42:21 +0000
Date: Mon, 21 Oct 2024 07:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4161/5686]
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1603
 amdgpu_xgmi_request_nps_change() warn: inconsistent returns
 '&hive->hive_lock'.
Message-ID: <202410210715.QUUqxaDa-lkp@intel.com>
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
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
CC: Feifei Xu <Feifei.Xu@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: ee52489d1210dbb894fda71957e1e9832126efda [4161/5686] drm/amdgpu: Place NPS mode request on unload
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210715.QUUqxaDa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210715.QUUqxaDa-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1603 amdgpu_xgmi_request_nps_change() warn: inconsistent returns '&hive->hive_lock'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:629 amdgpu_get_xgmi_hive() warn: Calling kobject_put|get with state->initialized unset from line: 614
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:652 amdgpu_get_xgmi_hive() warn: Calling kobject_put|get with state->initialized unset from line: 614
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:681 amdgpu_get_xgmi_hive() warn: Calling kobject_put|get with state->initialized unset from line: 614

vim +1603 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c

ee52489d1210db Lijo Lazar 2024-09-20  1567  
ee52489d1210db Lijo Lazar 2024-09-20  1568  int amdgpu_xgmi_request_nps_change(struct amdgpu_device *adev,
ee52489d1210db Lijo Lazar 2024-09-20  1569  				   struct amdgpu_hive_info *hive,
ee52489d1210db Lijo Lazar 2024-09-20  1570  				   int req_nps_mode)
ee52489d1210db Lijo Lazar 2024-09-20  1571  {
ee52489d1210db Lijo Lazar 2024-09-20  1572  	struct amdgpu_device *tmp_adev;
ee52489d1210db Lijo Lazar 2024-09-20  1573  	int cur_nps_mode, r;
ee52489d1210db Lijo Lazar 2024-09-20  1574  
ee52489d1210db Lijo Lazar 2024-09-20  1575  	/* This is expected to be called only during unload of driver. The
ee52489d1210db Lijo Lazar 2024-09-20  1576  	 * request needs to be placed only once for all devices in the hive. If
ee52489d1210db Lijo Lazar 2024-09-20  1577  	 * one of them fail, revert the request for previous successful devices.
ee52489d1210db Lijo Lazar 2024-09-20  1578  	 * After placing the request, make hive mode as UNKNOWN so that other
ee52489d1210db Lijo Lazar 2024-09-20  1579  	 * devices don't request anymore.
ee52489d1210db Lijo Lazar 2024-09-20  1580  	 */
ee52489d1210db Lijo Lazar 2024-09-20  1581  	mutex_lock(&hive->hive_lock);
ee52489d1210db Lijo Lazar 2024-09-20  1582  	list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
ee52489d1210db Lijo Lazar 2024-09-20  1583  		r = adev->gmc.gmc_funcs->request_mem_partition_mode(
ee52489d1210db Lijo Lazar 2024-09-20  1584  			tmp_adev, req_nps_mode);
ee52489d1210db Lijo Lazar 2024-09-20  1585  		if (r)
ee52489d1210db Lijo Lazar 2024-09-20  1586  			goto err;
ee52489d1210db Lijo Lazar 2024-09-20  1587  	}
ee52489d1210db Lijo Lazar 2024-09-20  1588  	/* Set to UNKNOWN so that other devices don't request anymore */
ee52489d1210db Lijo Lazar 2024-09-20  1589  	atomic_set(&hive->requested_nps_mode, UNKNOWN_MEMORY_PARTITION_MODE);
ee52489d1210db Lijo Lazar 2024-09-20  1590  
ee52489d1210db Lijo Lazar 2024-09-20  1591  	mutex_unlock(&hive->hive_lock);
ee52489d1210db Lijo Lazar 2024-09-20  1592  
ee52489d1210db Lijo Lazar 2024-09-20  1593  	return 0;
ee52489d1210db Lijo Lazar 2024-09-20  1594  err:
ee52489d1210db Lijo Lazar 2024-09-20  1595  	/* Request back current mode if one of the requests failed */
ee52489d1210db Lijo Lazar 2024-09-20  1596  	cur_nps_mode = adev->gmc.gmc_funcs->query_mem_partition_mode(tmp_adev);
ee52489d1210db Lijo Lazar 2024-09-20  1597  	list_for_each_entry_continue_reverse(tmp_adev, &hive->device_list,
ee52489d1210db Lijo Lazar 2024-09-20  1598  					     gmc.xgmi.head)
ee52489d1210db Lijo Lazar 2024-09-20  1599  		adev->gmc.gmc_funcs->request_mem_partition_mode(tmp_adev,
ee52489d1210db Lijo Lazar 2024-09-20  1600  								cur_nps_mode);
ee52489d1210db Lijo Lazar 2024-09-20  1601  	mutex_lock(&hive->hive_lock);
ee52489d1210db Lijo Lazar 2024-09-20  1602  
ee52489d1210db Lijo Lazar 2024-09-20 @1603  	return r;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
