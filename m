Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B73168EF
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 00:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362803; cv=none; b=b5ajWA1ao8DlJF4K3BpTrNkG8nckJUD2hq0SAo/6NhgJYM6NxKX0iEBau+sVlrfKOtQMQdZgCSvww75powFEonCsTN5GylswsLXNWn0GbZw3l/P5HgHs4Xb+evAQYuyenYTvTa8ZfcjZ0emVYbHBDeR3lSS+QPgYD5Ohq1WoCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362803; c=relaxed/simple;
	bh=Rq3ehXhWCbECYVO9WzsxJZCEfc3s5iHQELQ4ufD3dSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cuIhUBafhoRzlTLVsLDRlgHxc4n/Yq9p1YKqI5fh2wZ2yL8mhCqzEPN7Wy5nRzg5RskLUbl74zXgdHbBqU4Y12OAXJB/CoBKGEoCb2JP0hRPIRN8kLv1tjo8f6HoFe1AgQDfGjBCjLaxwXdmHjiTGkQ3pPc6l4TblWs3qB+Y+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BiRqO8kI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiRqO8kI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773362800; x=1804898800;
  h=date:from:to:cc:subject:message-id;
  bh=Rq3ehXhWCbECYVO9WzsxJZCEfc3s5iHQELQ4ufD3dSU=;
  b=BiRqO8kISR/nulNqFS7MDL0N9vDsMXeQi8bwf27cD12YYBWeNXGVRHU5
   4YkVg7zaUVQzp+UVAkvEmumKTKGYUEUxcIHB62VMuDfLqn1KwwuiuJxu0
   rpgAy1zcVS7yIYMwYop2vSSlhqHLF+O6buVFjfi3LW4uDNZ054BmDNOqA
   SFyyIWXBaPeO6YFfw8v1t5MqETAzqNAi+JsAb6oDbEUecgpQSlFsydH0g
   FN/XRLf3I2RxUk5lBifd+OqgP18uqsk4x5q+BYe3FNMH1WqTnCXDBjLkn
   +6pXSyIS+Hl1JCioKJ/X+SzO81K/Av/cBeA0j1C1DDiByMTdCBxjXssIB
   Q==;
X-CSE-ConnectionGUID: hkGeiZd3QEevOUJLh/DeUw==
X-CSE-MsgGUID: xY4TAC/wRZe0sEsiWCGUsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="84788401"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="84788401"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:46:40 -0700
X-CSE-ConnectionGUID: xPord0zwSCSjYB0Vlef6NA==
X-CSE-MsgGUID: qA0xSkL6QRWvB0zkgJL0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220252743"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Mar 2026 17:46:39 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0qfl-000000003HP-0UJw;
	Fri, 13 Mar 2026 00:46:37 +0000
Date: Fri, 13 Mar 2026 08:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 217/471] drivers/mfd/aat2870-core.c:285
 aat2870_reg_write_file() warn: potential spectre issue 'buf' [w]
Message-ID: <202603130833.0WzPUmNM-lkp@intel.com>
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
commit: f8b2d0d3f1fd513693311c803cc09afa2195c2b9 [217/471] drivers/mfd: convert to read/write iterators
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260313/202603130833.0WzPUmNM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603130833.0WzPUmNM-lkp@intel.com/

smatch warnings:
drivers/mfd/aat2870-core.c:285 aat2870_reg_write_file() warn: potential spectre issue 'buf' [w]

vim +/buf +285 drivers/mfd/aat2870-core.c

09d6292befba8c Jin Park     2011-07-04  269  
f8b2d0d3f1fd51 Jens Axboe   2024-04-06  270  static ssize_t aat2870_reg_write_file(struct kiocb *iocb, struct iov_iter *from)
09d6292befba8c Jin Park     2011-07-04  271  {
f8b2d0d3f1fd51 Jens Axboe   2024-04-06  272  	struct aat2870_data *aat2870 = iocb->ki_filp->private_data;
f8b2d0d3f1fd51 Jens Axboe   2024-04-06  273  	size_t count = iov_iter_count(from);
09d6292befba8c Jin Park     2011-07-04  274  	char buf[32];
c38d66ac924e84 Jin Park     2011-10-04  275  	ssize_t buf_size;
09d6292befba8c Jin Park     2011-07-04  276  	char *start = buf;
09d6292befba8c Jin Park     2011-07-04  277  	unsigned long addr, val;
09d6292befba8c Jin Park     2011-07-04  278  	int ret;
09d6292befba8c Jin Park     2011-07-04  279  
ecf67ac335bba0 Sachin Kamat 2013-09-10  280  	buf_size = min(count, (size_t)(sizeof(buf)-1));
f8b2d0d3f1fd51 Jens Axboe   2024-04-06  281  	if (!copy_from_iter_full(buf, buf_size, from)) {
09d6292befba8c Jin Park     2011-07-04  282  		dev_err(aat2870->dev, "Failed to copy from user\n");
09d6292befba8c Jin Park     2011-07-04  283  		return -EFAULT;
09d6292befba8c Jin Park     2011-07-04  284  	}
09d6292befba8c Jin Park     2011-07-04 @285  	buf[buf_size] = 0;
09d6292befba8c Jin Park     2011-07-04  286  
09d6292befba8c Jin Park     2011-07-04  287  	while (*start == ' ')
09d6292befba8c Jin Park     2011-07-04  288  		start++;
09d6292befba8c Jin Park     2011-07-04  289  
0ebc1c25ca2921 Lee Jones    2014-05-08  290  	ret = kstrtoul(start, 16, &addr);
0ebc1c25ca2921 Lee Jones    2014-05-08  291  	if (ret)
0ebc1c25ca2921 Lee Jones    2014-05-08  292  		return ret;
0ebc1c25ca2921 Lee Jones    2014-05-08  293  
09d6292befba8c Jin Park     2011-07-04  294  	if (addr >= AAT2870_REG_NUM) {
09d6292befba8c Jin Park     2011-07-04  295  		dev_err(aat2870->dev, "Invalid address, 0x%lx\n", addr);
09d6292befba8c Jin Park     2011-07-04  296  		return -EINVAL;
09d6292befba8c Jin Park     2011-07-04  297  	}
09d6292befba8c Jin Park     2011-07-04  298  
09d6292befba8c Jin Park     2011-07-04  299  	while (*start == ' ')
09d6292befba8c Jin Park     2011-07-04  300  		start++;
09d6292befba8c Jin Park     2011-07-04  301  
8420a24138e4ad Jingoo Han   2013-06-04  302  	ret = kstrtoul(start, 16, &val);
8420a24138e4ad Jingoo Han   2013-06-04  303  	if (ret)
8420a24138e4ad Jingoo Han   2013-06-04  304  		return ret;
09d6292befba8c Jin Park     2011-07-04  305  
09d6292befba8c Jin Park     2011-07-04  306  	ret = aat2870->write(aat2870, (u8)addr, (u8)val);
09d6292befba8c Jin Park     2011-07-04  307  	if (ret)
09d6292befba8c Jin Park     2011-07-04  308  		return ret;
09d6292befba8c Jin Park     2011-07-04  309  
09d6292befba8c Jin Park     2011-07-04  310  	return buf_size;
09d6292befba8c Jin Park     2011-07-04  311  }
09d6292befba8c Jin Park     2011-07-04  312  

:::::: The code at line 285 was first introduced by commit
:::::: 09d6292befba8c6319d9471803149573ea6ed170 mfd: Add AAT2870 mfd driver

:::::: TO: Jin Park <jinyoungp@nvidia.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
