Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234776C70
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Feb 2024 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707312781; cv=none; b=I5/lAoWx1okL0ug0IR/3fn413TMp+8ODIbUBB22wTdmLFSGtxrHin5hkeaUGuT0641Q14UoZu0XiHGYlHW2Hp3cDANLSx1rHZF2SYDBt+jpze1HipEZJUdrooTWlp2Vmj5Fb+0f7OKT8NKEYFO4l9NfrvP01bqPx58rEATr7X5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707312781; c=relaxed/simple;
	bh=zNsnzrTlF7iJrBsmJeV3Fe0li0/1dJ1uulTnUxhgQ9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8exn1mCrE3+jEjBlKahz39VoXcIAcTquZDcZmzafPNns8tVg1kTRm2e3T8WcPPmmbDZq5TkuBlyMmR0CpRbOVmA2uP03dm6mW2iiFO+nMt1tdM/cRTcb/zWAvQwSMBlffKAUEPoxzBnr+8d4trOBSLxdz3W0sMDCXV+lHHAV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Why8aK3H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Why8aK3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707312780; x=1738848780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNsnzrTlF7iJrBsmJeV3Fe0li0/1dJ1uulTnUxhgQ9w=;
  b=Why8aK3HKc3VuSnR/8r7njE0Jj4k7/18+KHCNojYlTkpyZcWTcw2nkXX
   zxx/bAWq6YCSdmat/YV3BHJNpWZxOfJDVirKtukIGAvltOUclIdeFPLYA
   KcNGEEuBFbUB4qtbjE4ANEz7vpricXOI3cw/EAlK5e2sUpbd5aznLAWiy
   RZeACE0EoCbAo4DM+kSEfxBew/+FBTfz+kWY7LEun2QC57tmLHn9D84R3
   K1JBXsy6N2g/T17NTQJqE5Ox9fFtUrTrhQgvOa4pcFxL4i9tcimm///Wo
   9yLiZCO7KGXR6g7o2HSxxSdb0WeB1e2qrbaYWI9s5y+D3ccCC0HFN46hV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1135910"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1135910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 05:32:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="933774618"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="933774618"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2024 05:32:56 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXi2o-0002fu-1K;
	Wed, 07 Feb 2024 13:32:54 +0000
Date: Wed, 7 Feb 2024 21:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21466/21625]
 drivers/scsi/hisi_raid/hiraid_main.c:3497:8-16: WARNING: please use
 sysfs_emit or sysfs_emit_at
Message-ID: <202402072151.GeJWv2MH-lkp@intel.com>
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
TO: zhanglei <zhanglei48@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: f153a1e5e708c7cf9607ad375bf7145060ababd4 [21466/21625] SCSI: hisi_raid: support SPxxx serial RAID/HBA controllers
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-r053-20240206 (https://download.01.org/0day-ci/archive/20240207/202402072151.GeJWv2MH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402072151.GeJWv2MH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/hisi_raid/hiraid_main.c:3497:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3465:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3510:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3481:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3773:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3548:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3519:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3573:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3682:9-17: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3744:9-17: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/hisi_raid/hiraid_main.c:3711:9-17: WARNING: please use sysfs_emit or sysfs_emit_at

vim +3497 drivers/scsi/hisi_raid/hiraid_main.c

f153a1e5e708c7 zhanglei 2023-12-15  3483  
f153a1e5e708c7 zhanglei 2023-12-15  3484  static ssize_t csts_cfs_show(struct device *cdev,
f153a1e5e708c7 zhanglei 2023-12-15  3485  				struct device_attribute *attr, char *buf)
f153a1e5e708c7 zhanglei 2023-12-15  3486  {
f153a1e5e708c7 zhanglei 2023-12-15  3487  	struct Scsi_Host *shost = class_to_shost(cdev);
f153a1e5e708c7 zhanglei 2023-12-15  3488  	struct hiraid_dev *hdev = shost_priv(shost);
f153a1e5e708c7 zhanglei 2023-12-15  3489  	int ret = -1;
f153a1e5e708c7 zhanglei 2023-12-15  3490  
f153a1e5e708c7 zhanglei 2023-12-15  3491  	if (pci_device_is_present(hdev->pdev)) {
f153a1e5e708c7 zhanglei 2023-12-15  3492  		ret = (readl(hdev->bar + HIRAID_REG_CSTS) &
f153a1e5e708c7 zhanglei 2023-12-15  3493  			HIRAID_CSTS_CFS_MASK);
f153a1e5e708c7 zhanglei 2023-12-15  3494  		ret >>= HIRAID_CSTS_CFS_SHIFT;
f153a1e5e708c7 zhanglei 2023-12-15  3495  	}
f153a1e5e708c7 zhanglei 2023-12-15  3496  
f153a1e5e708c7 zhanglei 2023-12-15 @3497  	return snprintf(buf, PAGE_SIZE, "%d\n", ret);
f153a1e5e708c7 zhanglei 2023-12-15  3498  }
f153a1e5e708c7 zhanglei 2023-12-15  3499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
