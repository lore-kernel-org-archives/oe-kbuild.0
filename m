Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43992158A09
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jan 2025 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738179582; cv=none; b=O+lLx7+mg5t2atwQOZQhD9N6PG/MjVNKeHIJMpNapSeFRcoxN9e+Aq3J3dCHV0zAOraw1XVz2iACzmdZ/Z7Tg6NcIAlRdku/l/EacNxhEh3aaxnQ+hhH05SO5oy7cDAHPjT/NQiexEANBGDdduoNZmuOauD8Dnrh1S1D9LcqjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738179582; c=relaxed/simple;
	bh=Jm50sEme/Yd+AKGzcufgG1TADaJLlFBHtuvFPa1injw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrqjF92QwHOMkkv6eCKnx+fsGzmrmS7vR7f6GDhB3c5ls4gve3LOfSaLBkoEVSMhA2r321AYPaZujxggiY/8etw+qnr1Zq4BVF9lG02ohYFMrPvUcCgFjY7+/0QX6gGTT9kmKYpeweAZ9EVeXFkFdgI53fvOptHvPyRR0eHcL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggM7ZC0/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggM7ZC0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738179580; x=1769715580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jm50sEme/Yd+AKGzcufgG1TADaJLlFBHtuvFPa1injw=;
  b=ggM7ZC0/mJ/IDcgsgGym5z4GPsjB4zTYGZv55Vi8YQuoMBvu22/B5Fvw
   1Z7lvMmS14CDXAU4tKw8a+a/O0v90VTx0Jy+D+NXKEf5VBYh2mUwQ1XPe
   hSCPW6kSF5nrGHRo15uuX8UCcIcbg2l91tRXKAoTMpCIoGAt6m6hfXZiY
   QtqyoNTHvhTeUN//wmdjHTHjyzpo7M3fWdeWRBFu98Gs5+suYUZ3vtbHJ
   fax/wGHEqlxDjBigvZo538BKcrrp4m3g7ZfwYTqc0MynzKSYeFZtmBJgL
   pOTzuIyeeIghoV8i7ZUtxpi2EUKzBIYKgHnOBqB/Y9zNTRVeSlVVtgShK
   w==;
X-CSE-ConnectionGUID: we2OCLlVQpOg04+dL+FrEQ==
X-CSE-MsgGUID: Mc2dk3/LShet4H6HMUDlGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56251809"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="56251809"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 11:39:40 -0800
X-CSE-ConnectionGUID: pchSQBm4R6q3p2HVQ7yREQ==
X-CSE-MsgGUID: cQFbFQZNRuuetX3UDyRKBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="108946657"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2025 11:39:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdDuS-000jHr-1M;
	Wed, 29 Jan 2025 19:39:36 +0000
Date: Thu, 30 Jan 2025 03:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [norov:compat_get_cpumask 7/8] io_uring/register.c:227
 copy_iowq_aff_cpus() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202501300333.mxQ1QbD6-lkp@intel.com>
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
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux compat_get_cpumask
head:   b7162e407638adc57cdf6d6f1acea90f9d84a638
commit: bba742e7f4aab4b879cc1620c1b57be76607bff8 [7/8] io_uring/register.c: use compat_get_cpumask
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300333.mxQ1QbD6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501300333.mxQ1QbD6-lkp@intel.com/

New smatch warnings:
io_uring/register.c:227 copy_iowq_aff_cpus() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
io_uring/register.c:532 io_register_resize_rings() warn: potential spectre issue 'n.sq_sqes' [w]
io_uring/register.c:552 io_register_resize_rings() warn: potential spectre issue 'n.rings->cqes' [w]

vim +227 io_uring/register.c

c43203154d8ac5 Jens Axboe 2023-12-19  218  
bba742e7f4aab4 Yury Norov 2025-01-23  219  static inline int copy_iowq_aff_cpus(cpumask_var_t new_mask, void __user *arg, unsigned len)
bba742e7f4aab4 Yury Norov 2025-01-23  220  {
bba742e7f4aab4 Yury Norov 2025-01-23  221  	int ret = copy_from_user(new_mask, arg, len);
bba742e7f4aab4 Yury Norov 2025-01-23  222  	unsigned ncpus = len * BITS_PER_BYTE;
bba742e7f4aab4 Yury Norov 2025-01-23  223  
bba742e7f4aab4 Yury Norov 2025-01-23  224  	if (ret == 0 && ncpus < large_cpumask_bits)
bba742e7f4aab4 Yury Norov 2025-01-23  225  		cpumask_clear_from(new_mask, len);
bba742e7f4aab4 Yury Norov 2025-01-23  226  
bba742e7f4aab4 Yury Norov 2025-01-23 @227  	return ret;
bba742e7f4aab4 Yury Norov 2025-01-23  228  }
bba742e7f4aab4 Yury Norov 2025-01-23  229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
