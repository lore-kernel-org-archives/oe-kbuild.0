Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14C1DFCE
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Aug 2025 21:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756242516; cv=none; b=kFNllbDzP7ZjPYd7e3hKLuF/MqKkMpl/evWodMTxGa+PquFYhUc+V6DwWFBJ5KKTIqmI3pGRbJEZ1d6vz73NyeVY83w9n/cGankjXjdHx9U9yUVrvlSZiDGa7KKDKp+lq7ytkcA+4uazvPvcSSZBvgwgD7N7fOOBNz2lfaIK54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756242516; c=relaxed/simple;
	bh=tmcfkDuzE+kRtxfLVheBlhdfNADZ/zzwTiMl6Ol/yAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJWNhg/g/WYyO1joWiEWWE+XcqWXFA4JOFLCU9XE4gyEowXm8kw4IbyfMMM8DLw5kAvlCqqyqpNxDcSdr7iv9Qzmpzp9Z+bBU12gbWVaxqVfj802n9JP3Ho6WLlFsurP1Yc5lmA5Kisr7mHukZkEqjPcMQTRYU7b29005qtB0Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgOWXwSa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgOWXwSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756242514; x=1787778514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmcfkDuzE+kRtxfLVheBlhdfNADZ/zzwTiMl6Ol/yAM=;
  b=XgOWXwSasRDqpNKG0NtH6gHErkaT/QTNkb/QJyhQb3yqcDIXVycshZrK
   M5Ggg38yPTAMGoH5iMn6qapUGFr4kTZJ5cK5FgabfTM3WpOYilxpVbVj4
   /tYMNNR6d42s4mMs9Y9KT56mXzGnoEtsR+P1zBpYgKLgWCqCF23MQxz8t
   T2C8d/sMxr5HyshoGOnPyVCUDjWqtolm6K98L19ydqwoX0YC6MDZJ92VG
   XsR+spjUp81SuNX8jHxGWQeztrBVrg/c5hJjQY9U66Sw82GKHrn4NBpq1
   RO3+LUnweIvJJ6gpRrXMEZypm4G21LSjfYdXM3kmykj5K/UMmZ3CP/xxJ
   w==;
X-CSE-ConnectionGUID: aphWIi6VTlKpTN2MbFAqnA==
X-CSE-MsgGUID: /8Je/ePWQ7qSPYfWv9qTeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58410964"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58410964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 14:08:34 -0700
X-CSE-ConnectionGUID: F49zoW0GTsCnquaito2pjQ==
X-CSE-MsgGUID: CS/Jvc/fTL+MlkxAQdrX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169184781"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2025 14:08:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur0tN-000SOh-27;
	Tue, 26 Aug 2025 21:07:52 +0000
Date: Wed, 27 Aug 2025 05:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 1764/1764]
 drivers/scsi/sssraid/sssraid_os.c:2107:8-16: WARNING: please use sysfs_emit
 or sysfs_emit_at
Message-ID: <202508270558.ibI5rpIF-lkp@intel.com>
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

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9f15a7fad9b673525b3e0334f90c7f7d60da06fb
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [1764/1764] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 10 months ago
config: x86_64-randconfig-101-20250827 (https://download.01.org/0day-ci/archive/20250827/202508270558.ibI5rpIF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508270558.ibI5rpIF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/sssraid/sssraid_os.c:2107:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2050:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2018:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2063:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2034:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2301:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2072:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2098:8-16: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2208:9-17: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2272:9-17: WARNING: please use sysfs_emit or sysfs_emit_at
   drivers/scsi/sssraid/sssraid_os.c:2238:9-17: WARNING: please use sysfs_emit or sysfs_emit_at

vim +2107 drivers/scsi/sssraid/sssraid_os.c

2e2a4edd9d4a72 Steven Song 2023-11-07  2100  
2e2a4edd9d4a72 Steven Song 2023-11-07  2101  static ssize_t can_queue_count_show(struct device *dev,
2e2a4edd9d4a72 Steven Song 2023-11-07  2102  				    struct device_attribute *attr, char *buf)
2e2a4edd9d4a72 Steven Song 2023-11-07  2103  {
2e2a4edd9d4a72 Steven Song 2023-11-07  2104  	struct Scsi_Host *shost = class_to_shost(dev);
2e2a4edd9d4a72 Steven Song 2023-11-07  2105  	struct blk_mq_tag_set *tag_set = &shost->tag_set;
2e2a4edd9d4a72 Steven Song 2023-11-07  2106  
2e2a4edd9d4a72 Steven Song 2023-11-07 @2107  	return snprintf(buf, 20, "%d\n", tag_set->nr_hw_queues + 1);
2e2a4edd9d4a72 Steven Song 2023-11-07  2108  }
2e2a4edd9d4a72 Steven Song 2023-11-07  2109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
