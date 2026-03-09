Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D196387560
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050881; cv=none; b=W36UZNyjJP8nZ4WwMvL+Sk8K6w90NNZYztuw/I1eKnqMIckJg2xb7DZIWr8BJSRl6U0+VX7Ey1ei1bl49tVbF+kredX4eT1Tg2MjduoDUwSvwSqPI4K2fEvorwTQXbYglSwUB+Vce8hsgOaEzN1z/lb/SdDYY0+RN5V9i5VrLOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050881; c=relaxed/simple;
	bh=QBUXJytfRqvMbbkogjYMyCFyeYv6+X6OAOxVCzfAZ9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rX0Q48Of1EtOUdQOfSkj0CMlTx5SWyepaXfXaTU+OqvFxgoJ+jPOCX28FBrXd0nJwuI0rKQerBHZK2gF7MhkHUB53TMOAQJnCw3kT/PMEwQLlj0FZQRPFD5CSayZntQ+XvixN0bOCcd2DN4vRs46ZcluuZ8TwzUNUR79TkXKN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPfaeQ6l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPfaeQ6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773050877; x=1804586877;
  h=date:from:to:cc:subject:message-id;
  bh=QBUXJytfRqvMbbkogjYMyCFyeYv6+X6OAOxVCzfAZ9M=;
  b=TPfaeQ6lmS1roEpyStrFiUQxIrr5vt1csl8auQpPL7VdqBcitzzAmPNd
   Mvw6Cy4JsVPi4L32+jXkPfcCStGKhIzNDJZHfPtistkkYrjispspcxcah
   jVnL9pZr8ptJOXLBeGwhgIhWBSnkKEwb2P0oNxJ4sr+85rfo32+LGnTPb
   pRoFzEZVyY0aDdZaFogyRk6c46PRISnG1679zDRuCudJ6m0QdphYsi82C
   2+whOk5XPT6fDxTotP6F+KLjaC70LIlpHhE3sm8h+4H4HfuhoeLb/SkQi
   Lp4lkATED9iDtU/YaZ7MuXfKT0XOpUImZO4kC8sZCIfB1nRrCHUJzJTd7
   A==;
X-CSE-ConnectionGUID: /U6w7VPuQ3yyEgn73dKmcg==
X-CSE-MsgGUID: csBez5RZTM+1cvpjaAeyog==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84704865"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84704865"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:07:56 -0700
X-CSE-ConnectionGUID: fYEZlV56SnWX5TceAqdDIw==
X-CSE-MsgGUID: iFGWd2MwQ++YOMawYplKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219650389"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Mar 2026 03:07:54 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzXWi-0000000003g-0GOq;
	Mon, 09 Mar 2026 10:07:52 +0000
Date: Mon, 09 Mar 2026 18:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 39/471] fs/libfs.c:1514 __simple_write_iter()
 warn: potential spectre issue 'attr->set_buf' [w]
Message-ID: <202603091757.ly8Bx20l-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260309/202603091757.ly8Bx20l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603091757.ly8Bx20l-lkp@intel.com/

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
