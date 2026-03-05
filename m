Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156E3B2BA
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772683258; cv=none; b=HYwC8hEZxg7/X/GhUmTnkzsLTQHWhmwrbqmN4yi7yIikKoZKdWdJzY3R1ZPv7uBO3zwM7uFk7NnRJoNRMhpPFMctYb20/xgyH7IV6Q7ji4yr/a8swguN4PcL0G8IMtH8PIrz2HTcHwnW0yZ83MwXaOwjitBogZUwvntMVO5dHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772683258; c=relaxed/simple;
	bh=mo/Vtrlq7AGEY0DOTPJayNZAhhGhaAiJAOGc/enovgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=phKgHH6TRaMhOv+W4aOgJ5Ys3quJ+6+Z6if/8XQ7FJpawzqbEOvoPdwT06vXS8GVuBCk0vml+FOHeqx6+EEZrXzyNITs+b5iMq0I2Zqte29flbBbW4U0wckzYGgogpKkAZTk0hjnSeNmAUeLZVrqmeLO+6IcFtN8gu5SbxYT5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0TCsdbE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0TCsdbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772683257; x=1804219257;
  h=date:from:to:cc:subject:message-id;
  bh=mo/Vtrlq7AGEY0DOTPJayNZAhhGhaAiJAOGc/enovgE=;
  b=i0TCsdbEhaogPI0UDC4Z5NRqey+ZcCikCEKHEOSwNNG0Hy/sXz3HSczI
   NX7ByuanZAUCjMk0LTO1Mty2w+s0mkMn9kiL5vQgCnrE18xI7e2AXBTFS
   gAVaNpD1OWf3M62ac1lNascaqVfU1+n5uP6UumF79BySPghf6tOwaVZxk
   xELXVn6l/rv1ZLOVN3XlrBPHsJHaBe6sToyq1EQQtDfD3ZU6BNTHGjjkI
   RSAYGRxg7i4TgsbxJP9Z2PVLY2Oi8k7cFTedw05OCZ1PjF+G6VAKdl9pl
   xDmhQ4jysW+w0bGg6MgL3391uIxF/s2UCn8zmj7vmSuQH0+8REhd7FBPD
   g==;
X-CSE-ConnectionGUID: xMy2EX20R4ugy+sWIV1z2g==
X-CSE-MsgGUID: TsRVoBMMQ5S4tl9zZmUHbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84393987"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84393987"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:00:56 -0800
X-CSE-ConnectionGUID: 2L/ZeYBJSe6KjBwrr+mPOA==
X-CSE-MsgGUID: GD2qa9oJQqGrOurA0du3ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="215833144"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 20:00:55 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzt7-0000000002R-00u1;
	Thu, 05 Mar 2026 04:00:41 +0000
Date: Thu, 05 Mar 2026 11:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-linux-5.15.y 410/410]
 drivers/block/drbd/drbd_req.c:1605 drbd_submit_bio() warn: variable
 dereferenced before check 'bio' (see line 1602)
Message-ID: <202603051119.NAXcWtSU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   91d48252ad4b17577cf8cc8d3e1353402e4da8f1
commit: 7ec9a45fc4ee7fc1054c2cabf8b09a6bc708472e [410/410] block: handle bio_split_to_limits() NULL return
:::::: branch date: 15 hours ago
:::::: commit date: 3 years, 2 months ago
config: x86_64-randconfig-161-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051119.NAXcWtSU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603051119.NAXcWtSU-lkp@intel.com/

New smatch warnings:
drivers/block/drbd/drbd_req.c:1605 drbd_submit_bio() warn: variable dereferenced before check 'bio' (see line 1602)

Old smatch warnings:
drivers/block/drbd/drbd_req.c:238 drbd_req_complete() warn: passing zero to 'PTR_ERR'

vim +/bio +1605 drivers/block/drbd/drbd_req.c

113fef9e20e0d6 Lars Ellenberg      2013-03-22  1599  
c62b37d96b6eb3 Christoph Hellwig   2020-07-01  1600  blk_qc_t drbd_submit_bio(struct bio *bio)
b411b3637fa71f Philipp Reisner     2009-09-25  1601  {
309dca309fc39a Christoph Hellwig   2021-01-24 @1602  	struct drbd_device *device = bio->bi_bdev->bd_disk->private_data;
9a25a04c807972 Philipp Reisner     2010-05-10  1603  
f695ca3886ce72 Christoph Hellwig   2020-07-01  1604  	blk_queue_split(&bio);
7ec9a45fc4ee7f Jens Axboe          2023-01-04 @1605  	if (!bio)
7ec9a45fc4ee7f Jens Axboe          2023-01-04  1606  		return BLK_QC_T_NONE;
54efd50bfd873e Kent Overstreet     2015-04-23  1607  
b411b3637fa71f Philipp Reisner     2009-09-25  1608  	/*
b411b3637fa71f Philipp Reisner     2009-09-25  1609  	 * what we "blindly" assume:
b411b3637fa71f Philipp Reisner     2009-09-25  1610  	 */
0b0ba1efc7b887 Andreas Gruenbacher 2011-06-27  1611  	D_ASSERT(device, IS_ALIGNED(bio->bi_iter.bi_size, 512));
9a25a04c807972 Philipp Reisner     2010-05-10  1612  
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  1613  	inc_ap_bio(device);
370276bac8ec6f Guoqing Jiang       2021-01-21  1614  	__drbd_make_request(device, bio);
dece16353ef47d Jens Axboe          2015-11-05  1615  	return BLK_QC_T_NONE;
b411b3637fa71f Philipp Reisner     2009-09-25  1616  }
b411b3637fa71f Philipp Reisner     2009-09-25  1617  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
