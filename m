Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46074286415
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152035; cv=none; b=aio5qwC1Vo/PNafo+HT2TfIKKRnZkGXnIOvw3kndgPP2SYlvzYVUhUTDKX3mSzARRxlozII4e532FfCuBKW37DCRxYHJwLHoqMP4+jcNHid6J4BkOSgDi8xHWxGQs2sGS9fm/UtylKuFZTrJn1ldo59CgPf3cNIY0VtegcIr9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152035; c=relaxed/simple;
	bh=mXa5e/flPR51kxQmb1rDEogWUQl/nMTENZyjtha2qVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eFPHb+G1+5t1gtG2aEfxFQ4SVGKa2CobeBmAz+60Nk6r6V5fO0tTH5CwoztS/WuFKACprJGz+BUmhwFheco2lPNnSyrfyEzBs59MjYXOr/WKeJJ2PsMh3AeazF5q6v2KLsU7/OUQHE3uYerYDy/clbNarRCoFBZm4tbWSv5VOTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcyQoGRD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcyQoGRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773152034; x=1804688034;
  h=date:from:to:cc:subject:message-id;
  bh=mXa5e/flPR51kxQmb1rDEogWUQl/nMTENZyjtha2qVg=;
  b=PcyQoGRDKp2bXDWU6m5NPgP44EWd2if/A6w92INOA+vvE8XMuMEshIB6
   QqgivFK+Ls7IBmGhcEJ0eZoA1WFjarhn/lCwmRzugvRsl0O/sadgTZo5t
   IPL9wPtUiX6SJVfoqafa6yD5aFEdH5BNGbL3qiOtCwmOevDx0UpA/ozjW
   3c+yP02I3kABg8BA+f8Qhwhax7hrtsoRXqAB+X0fTa/z+ZZw9OT/awXr4
   w16nZB/4qVEYLmy5l63kUMqIJiXAWtAe6RcIMvozARv54RNbDnQtPi6a5
   iglWBKt9tCJP6AlHWlYTcury5ggDGXhsauPMC2ff/XhZtgAcdTpoB8Swa
   w==;
X-CSE-ConnectionGUID: iWBRj4ZDQbGX5xAn8etwAA==
X-CSE-MsgGUID: tEHtJFC8Q4OAWtfMRhvGWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73222467"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73222467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:13:53 -0700
X-CSE-ConnectionGUID: j+1+QnGBTWy7MnutXogJbw==
X-CSE-MsgGUID: dpPrJGFhTpWcfWG1iLSSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216497563"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 07:13:52 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzxqI-0000000023K-0Mtv;
	Tue, 10 Mar 2026 14:13:50 +0000
Date: Tue, 10 Mar 2026 22:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 39/471] fs/libfs.c:1514 __simple_write_iter()
 warn: potential spectre issue 'attr->set_buf' [w]
Message-ID: <202603102208.xRXDgO2R-lkp@intel.com>
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
commit: 7b40f9995773bf20c745784d976fc4e3cfc54699 [39/471] libfs: switch to read iter and add copy helpers
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260310/202603102208.xRXDgO2R-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603102208.xRXDgO2R-lkp@intel.com/

smatch warnings:
fs/libfs.c:1514 __simple_write_iter() warn: potential spectre issue 'attr->set_buf' [w]

vim +1514 fs/libfs.c

7b40f9995773bf Jens Axboe 2024-04-03  1491  
7b40f9995773bf Jens Axboe 2024-04-03  1492  static ssize_t __simple_write_iter(struct kiocb *iocb, struct iov_iter *from,
7b40f9995773bf Jens Axboe 2024-04-03  1493  				   bool is_signed)
7b40f9995773bf Jens Axboe 2024-04-03  1494  {
7b40f9995773bf Jens Axboe 2024-04-03  1495  	struct simple_attr *attr;
7b40f9995773bf Jens Axboe 2024-04-03  1496  	unsigned long long val;
7b40f9995773bf Jens Axboe 2024-04-03  1497  	size_t len = iov_iter_count(from);
7b40f9995773bf Jens Axboe 2024-04-03  1498  	size_t size;
7b40f9995773bf Jens Axboe 2024-04-03  1499  	ssize_t ret;
7b40f9995773bf Jens Axboe 2024-04-03  1500  
7b40f9995773bf Jens Axboe 2024-04-03  1501  	attr = iocb->ki_filp->private_data;
7b40f9995773bf Jens Axboe 2024-04-03  1502  	if (!attr->set)
7b40f9995773bf Jens Axboe 2024-04-03  1503  		return -EACCES;
7b40f9995773bf Jens Axboe 2024-04-03  1504  
7b40f9995773bf Jens Axboe 2024-04-03  1505  	ret = mutex_lock_interruptible(&attr->mutex);
7b40f9995773bf Jens Axboe 2024-04-03  1506  	if (ret)
7b40f9995773bf Jens Axboe 2024-04-03  1507  		return ret;
7b40f9995773bf Jens Axboe 2024-04-03  1508  
7b40f9995773bf Jens Axboe 2024-04-03  1509  	ret = -EFAULT;
7b40f9995773bf Jens Axboe 2024-04-03  1510  	size = min(sizeof(attr->set_buf) - 1, len);
7b40f9995773bf Jens Axboe 2024-04-03  1511  	if (!copy_from_iter(attr->set_buf, size, from))
7b40f9995773bf Jens Axboe 2024-04-03  1512  		goto out;
7b40f9995773bf Jens Axboe 2024-04-03  1513  
7b40f9995773bf Jens Axboe 2024-04-03 @1514  	attr->set_buf[size] = '\0';
7b40f9995773bf Jens Axboe 2024-04-03  1515  	if (is_signed)
7b40f9995773bf Jens Axboe 2024-04-03  1516  		ret = kstrtoll(attr->set_buf, 0, &val);
7b40f9995773bf Jens Axboe 2024-04-03  1517  	else
7b40f9995773bf Jens Axboe 2024-04-03  1518  		ret = kstrtoull(attr->set_buf, 0, &val);
7b40f9995773bf Jens Axboe 2024-04-03  1519  	if (ret)
7b40f9995773bf Jens Axboe 2024-04-03  1520  		goto out;
7b40f9995773bf Jens Axboe 2024-04-03  1521  	ret = attr->set(attr->data, val);
7b40f9995773bf Jens Axboe 2024-04-03  1522  	if (ret == 0)
7b40f9995773bf Jens Axboe 2024-04-03  1523  		ret = len; /* on success, claim we got the whole input */
7b40f9995773bf Jens Axboe 2024-04-03  1524  out:
7b40f9995773bf Jens Axboe 2024-04-03  1525  	mutex_unlock(&attr->mutex);
7b40f9995773bf Jens Axboe 2024-04-03  1526  	return ret;
7b40f9995773bf Jens Axboe 2024-04-03  1527  }
7b40f9995773bf Jens Axboe 2024-04-03  1528  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
