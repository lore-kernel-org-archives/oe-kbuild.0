Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9133E360
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773278074; cv=none; b=WI3K1hRt6+E/N1oxsRND3gBl/U3/O3BJyaQ1R1CtqI2CsLRX5FOtC35RIARmBsiTlsVBB6HmOe7BNLoihLF1Fv/AOw2d/QCLGiA3zMOURTBiDYFT58KBMc4i/9SvLWt0uE1QO8+eQtZuXlCuoGZ9BaMvLmotsL5aRJOmKV7a03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773278074; c=relaxed/simple;
	bh=3igNpbjqCY2oPLlTvMtvml7AJQx3cqm+HJOBeHFm+L8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bx9GWcWotwZ6HJozafmnVmtz5t4+ZAG5Gu1WVZciKLZph7X+6dzOM1MhXo2yYWszIsRumANpeM4xmqc+q0bGvO0zcpcgUOQDiOZ6PrYw4V98rijDYFXheza/K4yCYXKYzfOrYwdGwEIME2waqRGql6BjCUj8lguZqMXL9033WY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJvl6+bo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJvl6+bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773278073; x=1804814073;
  h=date:from:to:cc:subject:message-id;
  bh=3igNpbjqCY2oPLlTvMtvml7AJQx3cqm+HJOBeHFm+L8=;
  b=QJvl6+bo9/Pe1p3KkeJp5sjle7SdtWVJjEcMKWA1A/psNqEs9S++8w55
   nRZfR0myYq03rVi1VXpOaCGwpBGGImuf9gyorgmpWq4rxT10vqQH4GfTz
   5Gk284XO9uD2xl9e/5C2GHFZ1N4tt+92I0DCjTQBm9uTad0xbxvyyA7IU
   ua/vfbn4J4Nv2Sc/k9s1qTS0ip4ozJP5wI0mE/D4cQ6wOJT7OCIkR/VFv
   Qm1mWqQJLqtKWs4NMmu6baNP+E25uv1ynNGpFyt7uv5WHYu3or3pj79xX
   H4IMZ7PNar/MqsEZfC1bL93wVzdS88Z8bIyPulMhwJS0amxYFAxh9gnfW
   A==;
X-CSE-ConnectionGUID: +WFlNvOrSa+pgOxO1JGZXg==
X-CSE-MsgGUID: xVoHHNfORc2y6kIxJVNN8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74478435"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74478435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 18:14:30 -0700
X-CSE-ConnectionGUID: kgCa7u3zQ12wCd+Ri9tODg==
X-CSE-MsgGUID: I4J+1ZLYRk2Pwb+TQ22kSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="219923014"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2026 18:14:29 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Ud8-000000001tB-2edq;
	Thu, 12 Mar 2026 01:14:26 +0000
Date: Thu, 12 Mar 2026 09:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 134/471]
 drivers/gpu/drm/drm_debugfs_crc.c:145 crc_control_write() warn: potential
 spectre issue 'source' [w]
Message-ID: <202603120928.sg0Xk3Bv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 89c24f70314e152ada59b288a4cf3f0dbe7d9f46 [134/471] drm: convert debugfs helpers to be read/write iterator based
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260312/202603120928.sg0Xk3Bv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603120928.sg0Xk3Bv-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_debugfs_crc.c:145 crc_control_write() warn: potential spectre issue 'source' [w]
drivers/gpu/drm/drm_debugfs.c:532 connector_write() warn: potential spectre issue 'buf' [w]

Old smatch warnings:
drivers/gpu/drm/drm_debugfs.c:230 drm_debugfs_gpuva_info() warn: argument 6 to %016llx specifier is cast from pointer

vim +/source +145 drivers/gpu/drm/drm_debugfs_crc.c

9edbf1fa600a2e Tomeu Vizoso   2016-10-06  120  
89c24f70314e15 Jens Axboe     2024-04-09  121  static ssize_t crc_control_write(struct kiocb *iocb, struct iov_iter *from)
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  122  {
89c24f70314e15 Jens Axboe     2024-04-09  123  	struct seq_file *m = iocb->ki_filp->private_data;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  124  	struct drm_crtc *crtc = m->private;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  125  	struct drm_crtc_crc *crc = &crtc->crc;
89c24f70314e15 Jens Axboe     2024-04-09  126  	size_t len = iov_iter_count(from);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  127  	char *source;
d5cc15a0c66e20 Mahesh Kumar   2018-07-13  128  	size_t values_cnt;
d5cc15a0c66e20 Mahesh Kumar   2018-07-13  129  	int ret;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  130  
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  131  	if (len == 0)
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  132  		return 0;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  133  
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  134  	if (len > PAGE_SIZE - 1) {
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  135  		DRM_DEBUG_KMS("Expected < %lu bytes into crtc crc control\n",
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  136  			      PAGE_SIZE);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  137  		return -E2BIG;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  138  	}
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  139  
89c24f70314e15 Jens Axboe     2024-04-09  140  	source = iterdup_nul(from, len);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  141  	if (IS_ERR(source))
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  142  		return PTR_ERR(source);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  143  
72a848f5c46bab Dingchen Zhang 2019-06-10  144  	if (source[len - 1] == '\n')
72a848f5c46bab Dingchen Zhang 2019-06-10 @145  		source[len - 1] = '\0';
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  146  
d5cc15a0c66e20 Mahesh Kumar   2018-07-13  147  	ret = crtc->funcs->verify_crc_source(crtc, source, &values_cnt);
f7ec68b341dbd5 Dinghao Liu    2020-08-19  148  	if (ret) {
f7ec68b341dbd5 Dinghao Liu    2020-08-19  149  		kfree(source);
d5cc15a0c66e20 Mahesh Kumar   2018-07-13  150  		return ret;
f7ec68b341dbd5 Dinghao Liu    2020-08-19  151  	}
d5cc15a0c66e20 Mahesh Kumar   2018-07-13  152  
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  153  	spin_lock_irq(&crc->lock);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  154  
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  155  	if (crc->opened) {
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  156  		spin_unlock_irq(&crc->lock);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  157  		kfree(source);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  158  		return -EBUSY;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  159  	}
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  160  
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  161  	kfree(crc->source);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  162  	crc->source = source;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  163  
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  164  	spin_unlock_irq(&crc->lock);
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  165  
89c24f70314e15 Jens Axboe     2024-04-09  166  	iocb->ki_pos += len;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  167  	return len;
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  168  }
9edbf1fa600a2e Tomeu Vizoso   2016-10-06  169  

:::::: The code at line 145 was first introduced by commit
:::::: 72a848f5c46bab4c921edc9cbffd1ab273b2be17 drm: remove the newline for CRC source name.

:::::: TO: Dingchen Zhang <dingchen.zhang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
