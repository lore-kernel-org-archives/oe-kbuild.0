Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA109332614
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 22:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773009008; cv=none; b=A4IH9lK2/LIbaQXphMQZxOU5SKPjIM//ulKqKVso39ALx4xFtMSEZ/F+Wh/MqAV/Hz25yDPGt6HNgjKIGKHAGVQ5HTdpvwHd8H86A2aPcRUS5we/FrROQXOWoaTkLGuh2tM/26Okz9Lqq0Q5kF5AGyQMJEB/WrVZMl0OOSa5nbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773009008; c=relaxed/simple;
	bh=NNqp6QYnGBCln82vnhCO0ZoqZ2JdLbiHhj9WSL4j730=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TzkAnZy5fcWN3MzM+xJjOYxQdmmvJacxT01VtVPMuH1IxeWubMOM37T9/UwIzJF3kmlIM9/j/0x2Jl/vnLwx26H5y3xVgu2w2XS2CrzGyPAIHvPOA+cVouA+NHxUCSo60Y1q2oHG/RFPVqn5gC8zvCw5kiTI1p6G2OB1LK3Vc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gypv5KfL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gypv5KfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773009005; x=1804545005;
  h=date:from:to:cc:subject:message-id;
  bh=NNqp6QYnGBCln82vnhCO0ZoqZ2JdLbiHhj9WSL4j730=;
  b=Gypv5KfLlr8r9oGgP46tTThrveG/mWKhHi4WiXA3D2eH3ZFlryOEKVpA
   jBax8R9+33S3yWyTS5TFjyIfA/Id5n1+6oSjUnYg3xGJ+X7x9ggsI56Cz
   xZXrnO9HNT2OODAaDBiec6cjmYjPhJZKTXI4eNlF1Equt2GflpQq2hsT2
   pJMXTCeD5q1WDbPAKt90SjA7OxRsbguV7JPl+/qf+ikxJA4/4c0qVuA31
   /xdK7X+Pi31iCUYYwcRbUQcK+F7Zz06iP8hLhMVW5RIlEaSSI/jJqQL/M
   LOhclUeacAZ7oX+IRB3ooV1Csok0kN3U5pdJu2Di77fA9IfPPRJNYFgya
   g==;
X-CSE-ConnectionGUID: QaqsOsjLRgyGU7BqLwpBOQ==
X-CSE-MsgGUID: BOKnDbHqTC6jj9sDCUNEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74080444"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74080444"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 15:30:05 -0700
X-CSE-ConnectionGUID: itF3tMAeQba3I88Z0IudZg==
X-CSE-MsgGUID: Tmq4KOgwTOivgyZ0C/DA2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218713151"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2026 15:30:04 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzMdM-000000003Qu-2tFf;
	Sun, 08 Mar 2026 22:30:00 +0000
Date: Mon, 09 Mar 2026 06:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 143/471]
 drivers/gpu/drm/loongson/lsdc_crtc.c:647 lsdc_crtc_man_op_write() warn:
 potential spectre issue 'buf' [w]
Message-ID: <202603090633.tFwzlZSd-lkp@intel.com>
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
commit: 76dedd5c839e0bd2c29550f6a8491a5676f9b0f3 [143/471] drm/loongson: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090633.tFwzlZSd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603090633.tFwzlZSd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/loongson/lsdc_crtc.c:647 lsdc_crtc_man_op_write() warn: potential spectre issue 'buf' [w]

vim +/buf +647 drivers/gpu/drm/loongson/lsdc_crtc.c

f39db26c54281d Sui Jingfeng 2023-06-15  632  
76dedd5c839e0b Jens Axboe   2024-04-09  633  static ssize_t lsdc_crtc_man_op_write(struct kiocb *iocb, struct iov_iter *from)
f39db26c54281d Sui Jingfeng 2023-06-15  634  {
76dedd5c839e0b Jens Axboe   2024-04-09  635  	struct seq_file *m = iocb->ki_filp->private_data;
f39db26c54281d Sui Jingfeng 2023-06-15  636  	struct lsdc_crtc *lcrtc = m->private;
f39db26c54281d Sui Jingfeng 2023-06-15  637  	const struct lsdc_crtc_hw_ops *ops = lcrtc->hw_ops;
76dedd5c839e0b Jens Axboe   2024-04-09  638  	size_t len = iov_iter_count(from);
f39db26c54281d Sui Jingfeng 2023-06-15  639  	char buf[16];
f39db26c54281d Sui Jingfeng 2023-06-15  640  
f39db26c54281d Sui Jingfeng 2023-06-15  641  	if (len > sizeof(buf) - 1)
f39db26c54281d Sui Jingfeng 2023-06-15  642  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  643  
76dedd5c839e0b Jens Axboe   2024-04-09  644  	if (!copy_from_iter_full(buf, len, from))
f39db26c54281d Sui Jingfeng 2023-06-15  645  		return -EFAULT;
f39db26c54281d Sui Jingfeng 2023-06-15  646  
f39db26c54281d Sui Jingfeng 2023-06-15 @647  	buf[len] = '\0';
f39db26c54281d Sui Jingfeng 2023-06-15  648  
f39db26c54281d Sui Jingfeng 2023-06-15  649  	if (sysfs_streq(buf, "soft_reset"))
f39db26c54281d Sui Jingfeng 2023-06-15  650  		ops->soft_reset(lcrtc);
f39db26c54281d Sui Jingfeng 2023-06-15  651  	else if (sysfs_streq(buf, "enable"))
f39db26c54281d Sui Jingfeng 2023-06-15  652  		ops->enable(lcrtc);
f39db26c54281d Sui Jingfeng 2023-06-15  653  	else if (sysfs_streq(buf, "disable"))
f39db26c54281d Sui Jingfeng 2023-06-15  654  		ops->disable(lcrtc);
f39db26c54281d Sui Jingfeng 2023-06-15  655  	else if (sysfs_streq(buf, "flip"))
f39db26c54281d Sui Jingfeng 2023-06-15  656  		ops->flip(lcrtc);
f39db26c54281d Sui Jingfeng 2023-06-15  657  	else if (sysfs_streq(buf, "clone"))
f39db26c54281d Sui Jingfeng 2023-06-15  658  		ops->clone(lcrtc);
f39db26c54281d Sui Jingfeng 2023-06-15  659  
f39db26c54281d Sui Jingfeng 2023-06-15  660  	return len;
f39db26c54281d Sui Jingfeng 2023-06-15  661  }
f39db26c54281d Sui Jingfeng 2023-06-15  662  

:::::: The code at line 647 was first introduced by commit
:::::: f39db26c54281da6a785259498ca74b5e470476f drm: Add kms driver for loongson display controller

:::::: TO: Sui Jingfeng <suijingfeng@loongson.cn>
:::::: CC: Sui Jingfeng <suijingfeng@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
