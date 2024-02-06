Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8912F1367
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Feb 2024 01:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182990; cv=none; b=To98DQRdUACPz7I9igHWb7M4uHfvYT4R6Lf0ohbRLQnEhxcHxCvg31pkOEIsGKElMGcV7u65YGjSRkRMAuERNsTn4k2WPZIS0G3zrCsMX5maLkibSchwNlGsVERQO3cKyFCiTMbjnLAyZI7/T84EeEZuNIXJtW/a6QMqfyn83s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182990; c=relaxed/simple;
	bh=+LmGqKgAAEqPf1roUKIPUr5HbNh1TbcGj+9ST6OO2Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KsuPuickSmzjv09HuekRvloLo+bXXF+d5dChGXxfNuPJZtpkXWProsuRqbOB9n0FEDKJv0zg9AcUGX7d5gU2SWzF6nfxVEMcnmzRoYbL5PPpF5ocsITqsvA5iVgPzsRwQsmPCztdMSBqhjFyRtIfe2zYkc8J5wV+TyLf5eesuvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKAxT2o5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKAxT2o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707182988; x=1738718988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LmGqKgAAEqPf1roUKIPUr5HbNh1TbcGj+9ST6OO2Ac=;
  b=SKAxT2o5TOCwaI36Uh+M0kTW/gPrtbHfEMPhe1YsjdSQPSDDZLMMq1tq
   A9n7sEJIXAi7ZirNKQemtHv4JjTDjVMGrP8u9DKujcExOhdBAW9fxj+1V
   fZfJzYx6LOZnHqET9D948w/n8mwuIJO/NwLHMEXZ8EU3LLeyWirX7KCye
   sL3calPhHPPds/KuuvCd0QVwUBVzHd62/cdywG+M6uslS3iSFZl70NQMP
   Xgwx75w3BUvGWdUDabGbt3xjJriYrmFGCB20xAKq67ly4drjkAoBD8eEP
   4ucaOpZ0wmE7g5p8yCcn4VxlEHD+qSLWV25zSRiuGUYr8etdArKI/fO9e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11289729"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11289729"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="878550"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2024 17:29:47 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXAHQ-0000yG-2M;
	Tue, 06 Feb 2024 01:29:44 +0000
Date: Tue, 6 Feb 2024 09:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21328/21616]
 drivers/scsi/sssraid/sssraid_os.c:2107:8-16: WARNING: please use sysfs_emit
 or sysfs_emit_at
Message-ID: <202402060911.iGKJasLv-lkp@intel.com>
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
TO: Steven Song <steven.song@3snic.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [21328/21616] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-104-20240206 (https://download.01.org/0day-ci/archive/20240206/202402060911.iGKJasLv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402060911.iGKJasLv-lkp@intel.com/

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
--
>> drivers/scsi/sssraid/sssraid_fw.c:672:5-6: WARNING: Unsigned expression compared with zero: i     <=     0

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
