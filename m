Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDB1E8337
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Feb 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770559209; cv=none; b=pm+WJ7VpyJojSngO7GjMVTsJgCJaPkkMLuMMCkV3AV6Yc81/odyEHRHAD1FZxRnY/MBC6yc5VUhRGSGXDangAnAVZwybbw9JIwOb6YLfZP2Ec1n+fjcEPZvEwPRqg/g424IrM5yxt6ylzaVh5E/bFCwM7nUH/Z37ztChV/T0bOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770559209; c=relaxed/simple;
	bh=xBDHThOvu79XWj0q/gg53eW1lFlTXE4ynZk++iXLzRE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MUQaEL+Jd+NzIl2YzHCcYLdWIzbep8TydCsq8eFxOO+HONJLWzqSrcfcX26SqJj+AasLy4K0P/tax0AeEcn4eJGTO0cQE4yhyISysY83er+6gjjVzMEZcsT0CNhEDweuXOXBh9bsfk6FA2Oaroh/7mvIbWPspB+cBBHjXOBRcf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6BduOt8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6BduOt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770559209; x=1802095209;
  h=date:from:to:cc:subject:message-id;
  bh=xBDHThOvu79XWj0q/gg53eW1lFlTXE4ynZk++iXLzRE=;
  b=Z6BduOt8HC3y6eMcn78cDeHSt2Tr5PAwsCWIgD2O87gC9Q2YouLApjwJ
   6EKUpk1/+mcNDFTGGDZzioVnkyh2kBnGCxK40/CJULR9FmVZncpOs/oTF
   4JULllll3/FMlBvWiFf0tBCoovfaOKL92+fkVOEPoVHT3ml4O94uQ8Wnm
   s1ihcgkogs3dXJbefDF+ulFOCXkNiCfhNCXkEdfMFq57g1YvcBWR06mI8
   E826tQIQY9gT2gZPz5rbS5KUcqQJ0YN362r+56OcBUEkChyUNuPxTr2Xd
   G4Ohq1xY1R7Mfcx9Xbykb1of8/9TXkd4uIMxfRc71cZgH10icyiqkCSXT
   Q==;
X-CSE-ConnectionGUID: 9RxINWnoQ3Gyqfe4rdyyLw==
X-CSE-MsgGUID: 9JTV11NbS1qKJcMvMGrVLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="74290334"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="74290334"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 06:00:09 -0800
X-CSE-ConnectionGUID: b5HAYp9XSu2iwpXjqKuc0w==
X-CSE-MsgGUID: HAWBlRQ3QcqxSvnD04R3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="234279109"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Feb 2026 06:00:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vp5KW-00000000mDY-2lHR;
	Sun, 08 Feb 2026 14:00:04 +0000
Date: Sun, 08 Feb 2026 21:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8329/12094]
 drivers/scsi/mpi3mr/mpi3mr_app.c:3277:8-16: WARNING: please use sysfs_emit or
 sysfs_emit_at
Message-ID: <202602082157.F1uYIFg7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ranjan Kumar <ranjan.kumar@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Salomon Dushimirimana <salomondush@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: ec54b348f274fdd2bd32bbe74de6d62ae1a10a18 [8329/12094] scsi: mpi3mr: Record and report controller firmware faults
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-054-20260208 (https://download.01.org/0day-ci/archive/20260208/202602082157.F1uYIFg7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602082157.F1uYIFg7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/mpi3mr/mpi3mr_app.c:3277:8-16: WARNING: please use sysfs_emit or sysfs_emit_at

vim +3277 drivers/scsi/mpi3mr/mpi3mr_app.c

986d6bad2103fb2 Sumit Saxena 2022-04-29  3257  
ec54b348f274fdd Ranjan Kumar 2026-01-16  3258  /**
ec54b348f274fdd Ranjan Kumar 2026-01-16  3259   * fwfault_count_show() - SysFS callback to show firmware fault count
ec54b348f274fdd Ranjan Kumar 2026-01-16  3260   * @dev: class device
ec54b348f274fdd Ranjan Kumar 2026-01-16  3261   * @attr: Device attribute
ec54b348f274fdd Ranjan Kumar 2026-01-16  3262   * @buf: Buffer to copy data into
ec54b348f274fdd Ranjan Kumar 2026-01-16  3263   *
ec54b348f274fdd Ranjan Kumar 2026-01-16  3264   * Displays the total number of firmware faults detected by the driver
ec54b348f274fdd Ranjan Kumar 2026-01-16  3265   * since the controller was initialized.
ec54b348f274fdd Ranjan Kumar 2026-01-16  3266   *
ec54b348f274fdd Ranjan Kumar 2026-01-16  3267   * Return: Number of bytes written to @buf
ec54b348f274fdd Ranjan Kumar 2026-01-16  3268   */
ec54b348f274fdd Ranjan Kumar 2026-01-16  3269  
ec54b348f274fdd Ranjan Kumar 2026-01-16  3270  static ssize_t
ec54b348f274fdd Ranjan Kumar 2026-01-16  3271  fwfault_count_show(struct device *dev, struct device_attribute *attr,
ec54b348f274fdd Ranjan Kumar 2026-01-16  3272  	char *buf)
ec54b348f274fdd Ranjan Kumar 2026-01-16  3273  {
ec54b348f274fdd Ranjan Kumar 2026-01-16  3274  	struct Scsi_Host *shost = class_to_shost(dev);
ec54b348f274fdd Ranjan Kumar 2026-01-16  3275  	struct mpi3mr_ioc *mrioc = shost_priv(shost);
ec54b348f274fdd Ranjan Kumar 2026-01-16  3276  
ec54b348f274fdd Ranjan Kumar 2026-01-16 @3277  	return snprintf(buf, PAGE_SIZE, "%llu\n", mrioc->fwfault_counter);
ec54b348f274fdd Ranjan Kumar 2026-01-16  3278  }
ec54b348f274fdd Ranjan Kumar 2026-01-16  3279  static DEVICE_ATTR_RO(fwfault_count);
ec54b348f274fdd Ranjan Kumar 2026-01-16  3280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
