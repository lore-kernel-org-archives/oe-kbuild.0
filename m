Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE791C69D
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772928573; cv=none; b=jVH3yXB/pwctTd1w/9fXS4iYOqsOsMaKxPa32fA2nHopPZPf2BZSNUU3z+hyVO87GAQzY3GBR700ZszQNn5UapH0+madquAscyi8XdHf/u2P8dddfiMkZryPzGIFN3EziqVibDO2aBtUFQqwu88me3E6u3PSVbJ5hfMAhh3PhL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772928573; c=relaxed/simple;
	bh=SnKXqi9+hljlwrU1aP6ZQ7VS/rFyMUZummUDm6hDm5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVJ7ge/YON9N7/iJ9em4z8SyX50xjWW6ohydQTU01zvz6Uz8Ffw+AMm2VrOFa3vwjpJzgstTt2EPIAh3GljF7/3+9Ln/hFCVCNnBgbI1NwBK6Csk5dfMdXX3ALMaDYBiJFE8Q3nvr45rExnNSwTUCz8yeGB6AudJWteQvPSXXng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3Iedigr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3Iedigr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772928569; x=1804464569;
  h=date:from:to:cc:subject:message-id;
  bh=SnKXqi9+hljlwrU1aP6ZQ7VS/rFyMUZummUDm6hDm5A=;
  b=U3IedigrgvWTLdouZAWYVE4zWaiEz30IhTghEe0y2N1/0+0hRPZUoRrb
   830e+7xHOpOJZJ9IR1zvFdL0iLNX20Tr4nOUlSTAZQpAUTAgpqxbxYW9P
   UqSvjLig5OPvWvRxryiT9TuxG6MQoHGH3Ho2CHtLUXWO/mJigBPgovc9F
   /KpmcBFPUYkJqpB4lq8xzTl2oBCCiPEVQiZB9dAC7SQkCPQKEEW7Dalj2
   XbdgHhka/m4D2PyTf7swRi/uUjrZw3dVdTfu2wlLbJsMy0Fl16HU+RQMr
   zSkwL45KCEuvcd4a/D4r7ZSkwWJt12BdN95MdPZ9VGMjG7ULsKw9AXDgX
   Q==;
X-CSE-ConnectionGUID: /ze0id05RzasxPzxEwZrWQ==
X-CSE-MsgGUID: GZLPRAKzSBGeyOTVt2P0OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="96614410"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="96614410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 16:09:29 -0800
X-CSE-ConnectionGUID: B/Xn1JqtSlmaXOVwKRhfkA==
X-CSE-MsgGUID: kJl81BeDR+WXUCrHZVDeUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="219477016"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2026 16:09:28 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz1i1-000000002k9-2X0B;
	Sun, 08 Mar 2026 00:09:25 +0000
Date: Sun, 08 Mar 2026 08:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 39/471] fs/libfs.c:1514 __simple_write_iter()
 warn: potential spectre issue 'attr->set_buf' [w]
Message-ID: <202603080845.NsMJ7Ye0-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080845.NsMJ7Ye0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603080845.NsMJ7Ye0-lkp@intel.com/

smatch warnings:
fs/libfs.c:1514 __simple_write_iter() warn: potential spectre issue 'attr->set_buf' [w]

vim +1514 fs/libfs.c

7b40f9995773bf2 Jens Axboe 2024-04-03  1491  
7b40f9995773bf2 Jens Axboe 2024-04-03  1492  static ssize_t __simple_write_iter(struct kiocb *iocb, struct iov_iter *from,
7b40f9995773bf2 Jens Axboe 2024-04-03  1493  				   bool is_signed)
7b40f9995773bf2 Jens Axboe 2024-04-03  1494  {
7b40f9995773bf2 Jens Axboe 2024-04-03  1495  	struct simple_attr *attr;
7b40f9995773bf2 Jens Axboe 2024-04-03  1496  	unsigned long long val;
7b40f9995773bf2 Jens Axboe 2024-04-03  1497  	size_t len = iov_iter_count(from);
7b40f9995773bf2 Jens Axboe 2024-04-03  1498  	size_t size;
7b40f9995773bf2 Jens Axboe 2024-04-03  1499  	ssize_t ret;
7b40f9995773bf2 Jens Axboe 2024-04-03  1500  
7b40f9995773bf2 Jens Axboe 2024-04-03  1501  	attr = iocb->ki_filp->private_data;
7b40f9995773bf2 Jens Axboe 2024-04-03  1502  	if (!attr->set)
7b40f9995773bf2 Jens Axboe 2024-04-03  1503  		return -EACCES;
7b40f9995773bf2 Jens Axboe 2024-04-03  1504  
7b40f9995773bf2 Jens Axboe 2024-04-03  1505  	ret = mutex_lock_interruptible(&attr->mutex);
7b40f9995773bf2 Jens Axboe 2024-04-03  1506  	if (ret)
7b40f9995773bf2 Jens Axboe 2024-04-03  1507  		return ret;
7b40f9995773bf2 Jens Axboe 2024-04-03  1508  
7b40f9995773bf2 Jens Axboe 2024-04-03  1509  	ret = -EFAULT;
7b40f9995773bf2 Jens Axboe 2024-04-03  1510  	size = min(sizeof(attr->set_buf) - 1, len);
7b40f9995773bf2 Jens Axboe 2024-04-03  1511  	if (!copy_from_iter(attr->set_buf, size, from))
7b40f9995773bf2 Jens Axboe 2024-04-03  1512  		goto out;
7b40f9995773bf2 Jens Axboe 2024-04-03  1513  
7b40f9995773bf2 Jens Axboe 2024-04-03 @1514  	attr->set_buf[size] = '\0';
7b40f9995773bf2 Jens Axboe 2024-04-03  1515  	if (is_signed)
7b40f9995773bf2 Jens Axboe 2024-04-03  1516  		ret = kstrtoll(attr->set_buf, 0, &val);
7b40f9995773bf2 Jens Axboe 2024-04-03  1517  	else
7b40f9995773bf2 Jens Axboe 2024-04-03  1518  		ret = kstrtoull(attr->set_buf, 0, &val);
7b40f9995773bf2 Jens Axboe 2024-04-03  1519  	if (ret)
7b40f9995773bf2 Jens Axboe 2024-04-03  1520  		goto out;
7b40f9995773bf2 Jens Axboe 2024-04-03  1521  	ret = attr->set(attr->data, val);
7b40f9995773bf2 Jens Axboe 2024-04-03  1522  	if (ret == 0)
7b40f9995773bf2 Jens Axboe 2024-04-03  1523  		ret = len; /* on success, claim we got the whole input */
7b40f9995773bf2 Jens Axboe 2024-04-03  1524  out:
7b40f9995773bf2 Jens Axboe 2024-04-03  1525  	mutex_unlock(&attr->mutex);
7b40f9995773bf2 Jens Axboe 2024-04-03  1526  	return ret;
7b40f9995773bf2 Jens Axboe 2024-04-03  1527  }
7b40f9995773bf2 Jens Axboe 2024-04-03  1528  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
