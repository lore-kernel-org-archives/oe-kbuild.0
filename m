Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288117;
	b=ms0gI0P06Cif8v86R2DQW6OK+cTfAX6AAGuHQ/IR4LxBISLtf8e5giBiuu8NVD/EIhK9
	 3pRlgpzAJl4tKSRkKfQx8g0itCHTENSk+Ix64gas+rJ3FfwTafFiOa//yXS/htqlhbLYe
	 WkeSeAD0SRcuiTkqu6K24bFzA4dr1NeOMqgqz+Nhfc75jzgw0lbIynuPT5jWoRp7hbOqw
	 zZ71/KR0TiIvlhHp3jqM8mTDnQzaGns7U3AI2Gq+2d8N6gE4sek43pFz/SiH7SCKrAi1i
	 S6mS14FkPQyNLSSHho4dqjZ5UpDHo1WVwqAgda2aPEyFTvTc0NL0LNREam+vvhAJDfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288117;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1JG6Tf7/gjkUDb9BVqlqQhdVNH5NoX3MYQb/doUhJbc=;
	b=5UGHs3vFjLtHeIieE1M90/qW/rY90AD/xHl8XbxPmaRJXx+bRc4mvTE/G57OPfwIFkSd
	 exh/buc2Oy7kNbvwZcTlIgk3EuEfOnCmehmFrRHGiIkKPxwZxdnbaKtDhyw3xKFzrRdCx
	 C9MORWcKhQFxp/hY7Dj43lRcAWzeYefGMT411ge99DdzqhQePUzy2LYF02JJLtaM1SQyT
	 MAG4NzJqnIvffPAocxhDOUpxdxH3YxlJhFmGPWDek85+4jfP7YF5jd9YqUvbC25SVPlop
	 u3cTYzD/Fa+Gzr/ZhQw3tl3Z7IRvV7C+DemYQCU6Hy7ir2p+ThZtG2TD+/pPJBRHDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VW3i/f/g";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C403606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 05:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C403606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VW3i/f/g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794288117; x=1825824117;
  h=date:from:to:cc:subject:message-id;
  bh=dNj+lBynTuhFmfzqDBXzyxzi5+tu+LVJDS0yKX2Efic=;
  b=VW3i/f/gyeqZEvrMMdkOtajEMLMm580zMvxzYB293ERsUJdGMXWSm9O4
   3Vpm6jUtZtvB8LrFjz2zxR0nWKwkZIHOzHiKAZyG2yqvcNJMRboLbZToY
   plLT7IKqM2+H37dNcMC58cQSyJWtBEWrg1HSdZdhgIstyavdC0UaC2U3r
   S8+udlXfiemyzncAud9gqJt+itAj8SinjJ2DXG4aTzorn0E+YHtxNIXf5
   0VOxxlyz1vqvlnCId+ldsT/F6p7Lm5LfC8309rWMWbtHAZm8TPJFkH3mI
   BgXKNQub+NHjxJKiy3mXzKQPKGzGlADG7WU7wnQ5hVMk/+ejOTsDVEcul
   Q==;
X-CSE-ConnectionGUID: EyiJhJPmQx+/Q6918529ug==
X-CSE-MsgGUID: h/Y2tIF0Q82TcudBn8xfOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2943455"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2943455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 21:21:56 -0800
X-CSE-ConnectionGUID: yEWRXYLHQOCt59tDlClglA==
X-CSE-MsgGUID: M9bYkmXbT2azfS6Ynudwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8367445"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2026 21:21:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQeIh-000000000Bi-1TT4;
	Tue, 10 Nov 2026 05:21:43 +0000
Date: Tue, 10 Nov 2026 06:20:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15-2026-10 10/10]
 drivers/block/drbd/drbd_req.c:1605 drbd_submit_bio() warn: variable
 dereferenced before check 'bio' (see line 1602)
Message-ID: <202611100654.fRKuoEUU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-10
head:   05be85d1a8b5b298b37833e869b7bcb986f054a1
commit: 7ec9a45fc4ee7fc1054c2cabf8b09a6bc708472e [10/10] block: handle bio_split_to_limits() NULL return
:::::: branch date: 7 hours ago
:::::: commit date: 3 years, 10 months ago
config: arm64-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261110/202611100654.fRKuoEUU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611100654.fRKuoEUU-lkp@intel.com/

New smatch warnings:
drivers/block/drbd/drbd_req.c:1605 drbd_submit_bio() warn: variable dereferenced before check 'bio' (see line 1602)

Old smatch warnings:
drivers/block/drbd/drbd_req.c:238 drbd_req_complete() warn: passing zero to 'PTR_ERR'

vim +/bio +1605 drivers/block/drbd/drbd_req.c

113fef9e20e0d61 Lars Ellenberg      2013-03-22  1599  
c62b37d96b6eb3e Christoph Hellwig   2020-07-01  1600  blk_qc_t drbd_submit_bio(struct bio *bio)
b411b3637fa71fc Philipp Reisner     2009-09-25  1601  {
309dca309fc39a9 Christoph Hellwig   2021-01-24 @1602  	struct drbd_device *device = bio->bi_bdev->bd_disk->private_data;
9a25a04c8079725 Philipp Reisner     2010-05-10  1603  
f695ca3886ce72b Christoph Hellwig   2020-07-01  1604  	blk_queue_split(&bio);
7ec9a45fc4ee7fc Jens Axboe          2023-01-04 @1605  	if (!bio)
7ec9a45fc4ee7fc Jens Axboe          2023-01-04  1606  		return BLK_QC_T_NONE;
54efd50bfd873e2 Kent Overstreet     2015-04-23  1607  
b411b3637fa71fc Philipp Reisner     2009-09-25  1608  	/*
b411b3637fa71fc Philipp Reisner     2009-09-25  1609  	 * what we "blindly" assume:
b411b3637fa71fc Philipp Reisner     2009-09-25  1610  	 */
0b0ba1efc7b887b Andreas Gruenbacher 2011-06-27  1611  	D_ASSERT(device, IS_ALIGNED(bio->bi_iter.bi_size, 512));
9a25a04c8079725 Philipp Reisner     2010-05-10  1612  
b30ab7913b0a7b1 Andreas Gruenbacher 2011-07-03  1613  	inc_ap_bio(device);
370276bac8ec6f7 Guoqing Jiang       2021-01-21  1614  	__drbd_make_request(device, bio);
dece16353ef47d8 Jens Axboe          2015-11-05  1615  	return BLK_QC_T_NONE;
b411b3637fa71fc Philipp Reisner     2009-09-25  1616  }
b411b3637fa71fc Philipp Reisner     2009-09-25  1617  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
