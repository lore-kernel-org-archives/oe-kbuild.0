Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAE3D3305
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791156304; cv=none; b=GtAzz1e2z3hVvBl6SavkVQpac3fKQYgKwvTJie8xjN2ohHdnyLIc6TtUEwjAsMzP7chSS3hTPYCKxD1RgYaxZ9LJo7TMTi+LqHHDM2DpD8V0StDKfB8rX7QfwwHxTVfQkl6gJMPBQhe9l5XjCRZeOen+GKavU4w+euY2a5L0V9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791156304; c=relaxed/simple;
	bh=hK8vAipSUoKdNswUDWMUs5+uwaoSu1+Hx2XXU/Eqdf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jU2kx0Ik3DRmpzI7+Xfam5gt5Gc1Gz9gkfNJ1yD5UoYmapikd6hzPJnR9LT67HigfbUHZ5ZGGG9BQgw1zvUgN4MS10jDumaDCyLU335pOqV2f5IHb6D4aCLsRMTOfz7ysmHaTPoJahMqcOh5fYGv8iT8FVNzJhYa4i0FkEZbdcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw1ntpZr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mw1ntpZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791156303; x=1822692303;
  h=date:from:to:cc:subject:message-id;
  bh=hK8vAipSUoKdNswUDWMUs5+uwaoSu1+Hx2XXU/Eqdf4=;
  b=mw1ntpZrMcKMuuYam7f8+gOfidesbzjuo9m4dlbPg25FWMnV3BgW8+qB
   IPbQCBitq3bgDch+Irmg61ZcZ2G9LX/qwCFMQhQZm8uhJCT4neFqJ/yZj
   DNH7a0jmTEJImr9ilHV4yR2/Mk85BITPr2vwzFgd/ZTeYE3+30lmcBtWc
   R1CVN3NGDlZgnVgqlH+mQgdHkTMJBeFMji6UHmq7pBxgpC5YDEkBATc5g
   yyDephdhJlnCBFWnaKjWcQxOG265NXAQbPfRk5zJjMCk4Xzqf1RukYLnR
   p0hg5NZPnPszcHk8HWG5WGY0yzm5UTrgb/f+g9g1msrm95W1dFCY9GYSW
   Q==;
X-CSE-ConnectionGUID: oOYZn0mCRayyG6vMu/Nb/A==
X-CSE-MsgGUID: QUV5GWMxSAelCbir4SXFVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91851043"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91851043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 16:25:02 -0700
X-CSE-ConnectionGUID: lI2tTtAZQKir6Nxe72yjEw==
X-CSE-MsgGUID: Ut28rY8rSOeY2+1qQ6D1cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280427634"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2026 16:25:02 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDVZj-000000000St-0bIN;
	Sun, 04 Oct 2026 23:24:59 +0000
Date: Mon, 05 Oct 2026 01:24:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/scsi_debug.c:5383 __resp_write_same() warn:
 missing error code? 'ret'
Message-ID: <202610050136.H4begmau-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>
CC: 0day robot <lkp@intel.com>
CC: Christoph Hellwig <hch@lst.de>
CC: John Garry <john.garry@linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/scsi-scsi_debug-Fix-a-locking-bug-in-resp_write_same/20260929-162257
head:   c079182dda2500860fe9887ff4d62cabf2bc1ff4
commit: 9dadaae56494a8f88b7fa60b3543f187ae076377 scsi: scsi_debug: Split resp_write_same()
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: nios2-randconfig-r2201-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050136.H4begmau-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610050136.H4begmau-lkp@intel.com/

New smatch warnings:
drivers/scsi/scsi_debug.c:5383 __resp_write_same() warn: missing error code? 'ret'

Old smatch warnings:
drivers/scsi/scsi_debug.c:9523 scsi_debug_queuecommand() warn: missing error code? 'ret'

vim +/ret +5383 drivers/scsi/scsi_debug.c

481b5e5c7949ed3 Douglas Gilbert    2017-12-23  5362  
9dadaae56494a8f Bart Van Assche    2026-09-29  5363  static int __resp_write_same(struct scsi_cmnd *scp, u64 lba, u32 num,
fd32119b0deac1a Douglas Gilbert    2016-04-25  5364  			     u32 ei_lba, bool unmap, bool ndob)
44d9269481bb43d Martin K. Petersen 2009-10-15  5365  {
f0d1cf9378bd403 Douglas Gilbert    2020-04-22  5366  	struct scsi_device *sdp = scp->device;
f0d1cf9378bd403 Douglas Gilbert    2020-04-22  5367  	struct sdebug_dev_info *devip = (struct sdebug_dev_info *)sdp->hostdata;
44d9269481bb43d Martin K. Petersen 2009-10-15  5368  	unsigned long long i;
40d07b523cf434f Douglas Gilbert    2019-01-25  5369  	u64 block, lbaa;
87c715dcde633f4 Douglas Gilbert    2020-04-21  5370  	u32 lb_size = sdebug_sector_size;
87c715dcde633f4 Douglas Gilbert    2020-04-21  5371  	int ret;
87c715dcde633f4 Douglas Gilbert    2020-04-21  5372  	struct sdeb_store_info *sip = devip2sip((struct sdebug_dev_info *)
b6ff8ca733500a7 Douglas Gilbert    2020-05-12  5373  						scp->device->hostdata, true);
40d07b523cf434f Douglas Gilbert    2019-01-25  5374  	u8 *fs1p;
87c715dcde633f4 Douglas Gilbert    2020-04-21  5375  	u8 *fsp;
f0d1cf9378bd403 Douglas Gilbert    2020-04-22  5376  
9447b6ce944b294 Martin K. Petersen 2019-02-08  5377  	ret = check_device_access_params(scp, lba, num, true);
84f3a3c01d70efb John Garry         2024-06-20  5378  	if (ret)
9dadaae56494a8f Bart Van Assche    2026-09-29  5379  		return ret;
44d9269481bb43d Martin K. Petersen 2009-10-15  5380  
9ed8d3dc5b46f86 Akinobu Mita       2013-04-16  5381  	if (unmap && scsi_debug_lbp()) {
87c715dcde633f4 Douglas Gilbert    2020-04-21  5382  		unmap_region(sip, lba, num);
9dadaae56494a8f Bart Van Assche    2026-09-29 @5383  		return ret;
44d9269481bb43d Martin K. Petersen 2009-10-15  5384  	}
40d07b523cf434f Douglas Gilbert    2019-01-25  5385  	lbaa = lba;
40d07b523cf434f Douglas Gilbert    2019-01-25  5386  	block = do_div(lbaa, sdebug_store_sectors);
c2248fc974df7be Douglas Gilbert    2014-11-24  5387  	/* if ndob then zero 1 logical block, else fetch 1 logical block */
87c715dcde633f4 Douglas Gilbert    2020-04-21  5388  	fsp = sip->storep;
87c715dcde633f4 Douglas Gilbert    2020-04-21  5389  	fs1p = fsp + (block * lb_size);
84f3a3c01d70efb John Garry         2024-06-20  5390  	sdeb_data_write_lock(sip);
c2248fc974df7be Douglas Gilbert    2014-11-24  5391  	if (ndob) {
40d07b523cf434f Douglas Gilbert    2019-01-25  5392  		memset(fs1p, 0, lb_size);
c2248fc974df7be Douglas Gilbert    2014-11-24  5393  		ret = 0;
c2248fc974df7be Douglas Gilbert    2014-11-24  5394  	} else
40d07b523cf434f Douglas Gilbert    2019-01-25  5395  		ret = fetch_to_dev_buffer(scp, fs1p, lb_size);
44d9269481bb43d Martin K. Petersen 2009-10-15  5396  
44d9269481bb43d Martin K. Petersen 2009-10-15  5397  	if (-1 == ret) {
84f3a3c01d70efb John Garry         2024-06-20  5398  		ret = DID_ERROR << 16;
fa32891e0b6ca71 Bart Van Assche    2026-09-29  5399  		goto unlock;
40d07b523cf434f Douglas Gilbert    2019-01-25  5400  	} else if (sdebug_verbose && !ndob && (ret < lb_size))
c2248fc974df7be Douglas Gilbert    2014-11-24  5401  		sdev_printk(KERN_INFO, scp->device,
e33d7c56450b0a5 Douglas Gilbert    2017-10-29  5402  			    "%s: %s: lb size=%u, IO sent=%d bytes\n",
40d07b523cf434f Douglas Gilbert    2019-01-25  5403  			    my_name, "write same", lb_size, ret);
44d9269481bb43d Martin K. Petersen 2009-10-15  5404  
44d9269481bb43d Martin K. Petersen 2009-10-15  5405  	/* Copy first sector to remaining blocks */
40d07b523cf434f Douglas Gilbert    2019-01-25  5406  	for (i = 1 ; i < num ; i++) {
40d07b523cf434f Douglas Gilbert    2019-01-25  5407  		lbaa = lba + i;
40d07b523cf434f Douglas Gilbert    2019-01-25  5408  		block = do_div(lbaa, sdebug_store_sectors);
87c715dcde633f4 Douglas Gilbert    2020-04-21  5409  		memmove(fsp + (block * lb_size), fs1p, lb_size);
40d07b523cf434f Douglas Gilbert    2019-01-25  5410  	}
9ed8d3dc5b46f86 Akinobu Mita       2013-04-16  5411  	if (scsi_debug_lbp())
87c715dcde633f4 Douglas Gilbert    2020-04-21  5412  		map_region(sip, lba, num);
f0d1cf9378bd403 Douglas Gilbert    2020-04-22  5413  	/* If ZBC zone then bump its write pointer */
f0d1cf9378bd403 Douglas Gilbert    2020-04-22  5414  	if (sdebug_dev_is_zoned(devip))
f0d1cf9378bd403 Douglas Gilbert    2020-04-22  5415  		zbc_inc_wp(devip, lba, num);
84f3a3c01d70efb John Garry         2024-06-20  5416  	ret = 0;
fa32891e0b6ca71 Bart Van Assche    2026-09-29  5417  unlock:
fa32891e0b6ca71 Bart Van Assche    2026-09-29  5418  	sdeb_data_write_unlock(sip);
9dadaae56494a8f Bart Van Assche    2026-09-29  5419  	return ret;
9dadaae56494a8f Bart Van Assche    2026-09-29  5420  }
9dadaae56494a8f Bart Van Assche    2026-09-29  5421  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
