Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA215575A
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715013260; cv=none; b=MOu039VjCILboHjgdgz7MQZk25zKrjXYdWxA2mnNBDuzSKIqBXIt5UCxqvs01QIiPZAMGqmiFSqAH74h5yZX2NH7OHxVv2+ke0TTiNXxGVDbKHSNMmtlN89eeMU7CfcQa8VAPfYXy/zSkNQhaYzUharv1cAjKdRXKSKoO+oPoa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715013260; c=relaxed/simple;
	bh=u6Viv6cGqo6giO8JqtYguUQ6Am6gwXHmn7D6Vp2poyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ucTIQ799NuJrytD8DC3pZf1zPlT18hQQIQMX/SOHa4mNhmzoU0m8xarAbAVU5GmvbxBr2fNkoA5SLiyJFCjb6B/jcjPnZNBn5MomusDaFvcJpztNnMB3w9/uq5orJNz4NcEyMyQQZT6ozpp4Y+kD8jpOt2cy9xovNHJwpVBosRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFGpa14z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFGpa14z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715013257; x=1746549257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6Viv6cGqo6giO8JqtYguUQ6Am6gwXHmn7D6Vp2poyc=;
  b=oFGpa14zwsOslgSWKeHUKDFTxWYtQsTO+rGgW6qyi4zOKXVdR2dwwQ2+
   8WZjdJQxIsnmxAJRSuMXmfrIoN8KNDX8rEtrOu0K28tsOj7Xtgj0PbTuH
   kYqZFed8VboeOpu04KMCxcaGyllg2UiZxoTxqDtyH68McqZfbvcExqtO9
   VtRnP9F4nCchiUSD0jmWbpNgGBLlivRh75b0j04bUjxfMRNYmUwYrpNNS
   xG48rQbvxdqSC/k/fvVhkCBwwAVEGZTD8TiBo9KmZr1x2ZAnT5Mxj/5cb
   DN1KcqUQUAatwjSqOnBXX5WnCJ1v6Vh7Ipl4PajGI9+EbNntZdnzMZCmR
   w==;
X-CSE-ConnectionGUID: iYIn8YwURymK7Oc+XXchYg==
X-CSE-MsgGUID: bz8rzCtwTY6EWTWbQQjjBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="36154227"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="36154227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 09:34:16 -0700
X-CSE-ConnectionGUID: N5G7xkMPScSVb9ldsqi59Q==
X-CSE-MsgGUID: WQ50wtRwSIyXXwNimTeqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28799988"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2024 09:34:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s41I4-0000ni-1u;
	Mon, 06 May 2024 16:34:12 +0000
Date: Tue, 7 May 2024 00:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 316/436] drivers/net/netdevsim/health.c:157
 nsim_dev_health_break_write() warn: potential spectre issue 'break_msg' [w]
Message-ID: <202405070042.4u6GwyhI-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   76357cc68895161ff344c4524f2cd138bcedd4ce
commit: 671ba72769562d2424bc059a425d08864dc83e4b [316/436] drivers/net/netdevsim: convert to read/write iterators
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20240506 (https://download.01.org/0day-ci/archive/20240507/202405070042.4u6GwyhI-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405070042.4u6GwyhI-lkp@intel.com/

smatch warnings:
drivers/net/netdevsim/health.c:157 nsim_dev_health_break_write() warn: potential spectre issue 'break_msg' [w]
drivers/net/netdevsim/dev.c:257 nsim_bus_dev_max_vfs_write() warn: potential spectre issue 'buf' [w]

vim +/break_msg +157 drivers/net/netdevsim/health.c

82c93a87bf8bc0 Jiri Pirko  2019-10-10  142  
671ba72769562d Jens Axboe  2024-04-06  143  static ssize_t nsim_dev_health_break_write(struct kiocb *iocb,
671ba72769562d Jens Axboe  2024-04-06  144  					   struct iov_iter *from)
82c93a87bf8bc0 Jiri Pirko  2019-10-10  145  {
671ba72769562d Jens Axboe  2024-04-06  146  	struct nsim_dev_health *health = iocb->ki_filp->private_data;
82c93a87bf8bc0 Jiri Pirko  2019-10-10  147  	struct nsim_dev_dummy_reporter_ctx ctx;
671ba72769562d Jens Axboe  2024-04-06  148  	size_t count = iov_iter_count(from);
82c93a87bf8bc0 Jiri Pirko  2019-10-10  149  	char *break_msg;
82c93a87bf8bc0 Jiri Pirko  2019-10-10  150  	int err;
82c93a87bf8bc0 Jiri Pirko  2019-10-10  151  
671ba72769562d Jens Axboe  2024-04-06  152  	break_msg = iterdup_nul(from, count);
20fd4f421cf4c2 Wei Yongjun 2021-03-24  153  	if (IS_ERR(break_msg))
20fd4f421cf4c2 Wei Yongjun 2021-03-24  154  		return PTR_ERR(break_msg);
82c93a87bf8bc0 Jiri Pirko  2019-10-10  155  
82c93a87bf8bc0 Jiri Pirko  2019-10-10  156  	if (break_msg[count - 1] == '\n')
82c93a87bf8bc0 Jiri Pirko  2019-10-10 @157  		break_msg[count - 1] = '\0';
82c93a87bf8bc0 Jiri Pirko  2019-10-10  158  
82c93a87bf8bc0 Jiri Pirko  2019-10-10  159  	ctx.break_msg = break_msg;
82c93a87bf8bc0 Jiri Pirko  2019-10-10  160  	err = devlink_health_report(health->dummy_reporter, break_msg, &ctx);
82c93a87bf8bc0 Jiri Pirko  2019-10-10  161  	if (err)
82c93a87bf8bc0 Jiri Pirko  2019-10-10  162  		goto out;
82c93a87bf8bc0 Jiri Pirko  2019-10-10  163  
82c93a87bf8bc0 Jiri Pirko  2019-10-10  164  out:
82c93a87bf8bc0 Jiri Pirko  2019-10-10  165  	kfree(break_msg);
82c93a87bf8bc0 Jiri Pirko  2019-10-10  166  	return err ?: count;
82c93a87bf8bc0 Jiri Pirko  2019-10-10  167  }
82c93a87bf8bc0 Jiri Pirko  2019-10-10  168  

:::::: The code at line 157 was first introduced by commit
:::::: 82c93a87bf8bc0cdb5ec2ab99da7d87715ff889f netdevsim: implement couple of testing devlink health reporters

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
