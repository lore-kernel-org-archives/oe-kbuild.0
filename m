Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB6F4E2
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746668752; cv=none; b=tZUDk6O8n1HHI64ZoTXsdN8wMRY57G6EmgGC30udelhO+SAC3hwTjmITx8Wz01lsKvyApi0wRxCOhikMcD2YGOtHlCI7lxFY71qDb7hZJUJFRpa/hTrRRgALoquwBaVoEyexLQ7SnRl22ZrvSD/NpzHNpGVEQ3LbwnDiDLRijQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746668752; c=relaxed/simple;
	bh=HZvcaP2oIE+oSIKi+mYCPGgXdDLqccgWEgkXb+JNKBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kriJj6Pnht9qITyioA2KhYTVgMQU63vCbw/fM0iRrOeSSi0Az44VdzisP/tUj+KD/v1rt4Utyu/1Fgu7/yd2knZF+XFntdFpSXJQ9HTT91iEKLdRMLhjmxPEnSz/O5nOv3PLCO3ck/tS0atlZG6B9DgMkn/Z/la3+n8oMaP9n7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZe+ExeN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZe+ExeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746668751; x=1778204751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZvcaP2oIE+oSIKi+mYCPGgXdDLqccgWEgkXb+JNKBA=;
  b=MZe+ExeNjs0Idfw9YbUqr2JMKWmLGeAWPo1eZOj+vk6eZyu93NHPHqXS
   VB1ZqTmmfozUnqYLGa9KK6vOLIRZKlu2pEyl8PZWGiOwrZTNgADTjKM9W
   BBp8ei8zz/nCnn9Vf+zP5WbxWUxv7Ce8iYKq8xXIhFjvnEbjPMRXNgCtb
   uZlyr82q4xsdCnhjuyBFshy5teFY5JXebi6hIo8VhUPu/lRsQCgEvx+1S
   TY0E1W2Zy24UlT0gDq6/j7zT5ev2wrCqTZorisjdsv+Xq8Hes0JKKHsiD
   tDDoKa60CElOcBDSdE4H15PwOFGF3rfQ4RE3rdnbn2MzurOgKyt4TBtBD
   A==;
X-CSE-ConnectionGUID: jTP+L5huQCmEX/8tleFX+A==
X-CSE-MsgGUID: y4mvKLWvSQuz0klO2aXtmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52085190"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52085190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:45:50 -0700
X-CSE-ConnectionGUID: EC+2PWYySoqBuH7LO3bm+w==
X-CSE-MsgGUID: oYaJJd/8RP2ZFZCiCsALtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136096038"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 18:45:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCqKY-0009C4-23;
	Thu, 08 May 2025 01:45:46 +0000
Date: Thu, 8 May 2025 09:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/accel/ivpu/ivpu_debugfs.c:467 priority_bands_fops_write()
 warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
Message-ID: <202505080949.XCql2vnB-lkp@intel.com>
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
TO: Karol Wachowski <karol.wachowski@intel.com>
CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
commit: 320323d2e5456df9d6236ac1ce9c030b1a74aa5b accel/ivpu: Add debugfs interface for setting HWS priority bands
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20250430 (https://download.01.org/0day-ci/archive/20250508/202505080949.XCql2vnB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505080949.XCql2vnB-lkp@intel.com/

smatch warnings:
drivers/accel/ivpu/ivpu_debugfs.c:467 priority_bands_fops_write() warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
drivers/accel/ivpu/ivpu_debugfs.c:468 priority_bands_fops_write() warn: potential spectre issue 'vdev->hw->hws.process_grace_period' [w] (local cap)
drivers/accel/ivpu/ivpu_debugfs.c:469 priority_bands_fops_write() warn: potential spectre issue 'vdev->hw->hws.process_quantum' [w] (local cap)

vim +467 drivers/accel/ivpu/ivpu_debugfs.c

320323d2e5456df Karol Wachowski 2025-02-04  438  
320323d2e5456df Karol Wachowski 2025-02-04  439  static ssize_t
320323d2e5456df Karol Wachowski 2025-02-04  440  priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
320323d2e5456df Karol Wachowski 2025-02-04  441  {
320323d2e5456df Karol Wachowski 2025-02-04  442  	struct seq_file *s = file->private_data;
320323d2e5456df Karol Wachowski 2025-02-04  443  	struct ivpu_device *vdev = s->private;
320323d2e5456df Karol Wachowski 2025-02-04  444  	char buf[64];
320323d2e5456df Karol Wachowski 2025-02-04  445  	u32 grace_period;
320323d2e5456df Karol Wachowski 2025-02-04  446  	u32 process_grace_period;
320323d2e5456df Karol Wachowski 2025-02-04  447  	u32 process_quantum;
320323d2e5456df Karol Wachowski 2025-02-04  448  	u32 band;
320323d2e5456df Karol Wachowski 2025-02-04  449  	int ret;
320323d2e5456df Karol Wachowski 2025-02-04  450  
320323d2e5456df Karol Wachowski 2025-02-04  451  	if (size >= sizeof(buf))
320323d2e5456df Karol Wachowski 2025-02-04  452  		return -EINVAL;
320323d2e5456df Karol Wachowski 2025-02-04  453  
320323d2e5456df Karol Wachowski 2025-02-04  454  	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, user_buf, size);
320323d2e5456df Karol Wachowski 2025-02-04  455  	if (ret < 0)
320323d2e5456df Karol Wachowski 2025-02-04  456  		return ret;
320323d2e5456df Karol Wachowski 2025-02-04  457  
320323d2e5456df Karol Wachowski 2025-02-04  458  	buf[size] = '\0';
320323d2e5456df Karol Wachowski 2025-02-04  459  	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
320323d2e5456df Karol Wachowski 2025-02-04  460  		     &process_quantum);
320323d2e5456df Karol Wachowski 2025-02-04  461  	if (ret != 4)
320323d2e5456df Karol Wachowski 2025-02-04  462  		return -EINVAL;
320323d2e5456df Karol Wachowski 2025-02-04  463  
320323d2e5456df Karol Wachowski 2025-02-04  464  	if (band >= VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT)
320323d2e5456df Karol Wachowski 2025-02-04  465  		return -EINVAL;
320323d2e5456df Karol Wachowski 2025-02-04  466  
320323d2e5456df Karol Wachowski 2025-02-04 @467  	vdev->hw->hws.grace_period[band] = grace_period;
320323d2e5456df Karol Wachowski 2025-02-04 @468  	vdev->hw->hws.process_grace_period[band] = process_grace_period;
320323d2e5456df Karol Wachowski 2025-02-04 @469  	vdev->hw->hws.process_quantum[band] = process_quantum;
320323d2e5456df Karol Wachowski 2025-02-04  470  
320323d2e5456df Karol Wachowski 2025-02-04  471  	return size;
320323d2e5456df Karol Wachowski 2025-02-04  472  }
320323d2e5456df Karol Wachowski 2025-02-04  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
