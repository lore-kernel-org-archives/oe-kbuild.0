Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E6229B12
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773974879; cv=none; b=dNNmBIyVgaC3mkeGTOogu+FJnMQtVUYc8dvM8D1lEGo7ejwbv0zy1/rsQv3DJb6UoYVaX1Prq7ktKcTeIPVgTeMcY94L2BSErc+pYxncZAQBSKlm2AWRXsDm0u9W62Z8fVGNvQV9XAUVkcfaCMnkepcpG8Kf1aQ90UVTqovMqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773974879; c=relaxed/simple;
	bh=9sj+att5Pyqp6RJf7y5gKdIqXgK6ND2v8dxdIOPQIuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPIcy7GvuqoDka0ot8/OOfWKMf7Fw7Q9lkXEa1ynpmvHw/pBltxD4EjddF+75W0lIAoO/rJeci8H+wH0mmoSinHhRnsPlm2fm9615UYshb/lI6URnqDAUylEWBBj6oe2pawKBCSVOg7C54K94E+Hb51ORZpd7xnEKP+UMNHprx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdtxEfsx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdtxEfsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773974878; x=1805510878;
  h=date:from:to:cc:subject:message-id;
  bh=9sj+att5Pyqp6RJf7y5gKdIqXgK6ND2v8dxdIOPQIuk=;
  b=RdtxEfsxNs5wBam/q+A8fen4ysY3+bIPzdaEt+r+7pWCn8PgI0Y3+j6h
   AgpahTPSmye4Oj/w+0KYjgGlGKfmIoLKjz+zx3VvIEzHIPHixmX+TXKhZ
   TmFug9xqJOmDE/V/HWZzvvs5/I26IZSMgm3fbv8N+twdPXPZHEglmP035
   M4tI8VKh+VsU3yBLH3bzP+wQjQgk7pZfLyPa6whRjaUfrj1YQM++JX2Sm
   PMxLug1jdNCVZcMqYrMjrrqemjkno4VhrI27PFVGgT3YG9TD3X3HDEEyp
   YBzgpW9T+txI1+dsNq/VyZ3RC5Hp5C/n1Atmxsq5rGv+DUgAB+tVTyMx+
   w==;
X-CSE-ConnectionGUID: N4oZg0/1S7KiZRBCVUeozw==
X-CSE-MsgGUID: +3yC2rZ0SVa/3y91noCm1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78915958"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78915958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:47:57 -0700
X-CSE-ConnectionGUID: sdmml63JTLW029W8VFpJ4w==
X-CSE-MsgGUID: qdCviDjHQxeQlz3TuvcRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227866611"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 19:47:56 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Ptc-000000001t7-1iIY;
	Fri, 20 Mar 2026 02:47:40 +0000
Date: Fri, 20 Mar 2026 10:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 518/539] drivers/scsi/scsi_devinfo.c:701
 proc_scsi_devinfo_write() warn: potential spectre issue 'buffer' [w] (local
 cap)
Message-ID: <202603201019.KEVHCm6n-lkp@intel.com>
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
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: c4fabaec10014ac6d30694e7756e146f70c2df09 [518/539] scsi: scsi_devinfo: convert proc_write to ->proc_write_iter()
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201019.KEVHCm6n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603201019.KEVHCm6n-lkp@intel.com/

smatch warnings:
drivers/scsi/scsi_devinfo.c:701 proc_scsi_devinfo_write() warn: potential spectre issue 'buffer' [w] (local cap)

vim +/buffer +701 drivers/scsi/scsi_devinfo.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  676  
^1da177e4c3f41 Linus Torvalds  2005-04-16  677  /*
eb44820c28bc9a Rob Landley     2007-11-03  678   * proc_scsi_dev_info_write - allow additions to scsi_dev_info_list via /proc.
^1da177e4c3f41 Linus Torvalds  2005-04-16  679   *
eb44820c28bc9a Rob Landley     2007-11-03  680   * Description: Adds a black/white list entry for vendor and model with an
eb44820c28bc9a Rob Landley     2007-11-03  681   * integer value of flag to the scsi device info list.
eb44820c28bc9a Rob Landley     2007-11-03  682   * To use, echo "vendor:model:flag" > /proc/scsi/device_info
^1da177e4c3f41 Linus Torvalds  2005-04-16  683   */
c4fabaec10014a Jens Axboe      2026-03-18  684  static ssize_t proc_scsi_devinfo_write(struct kiocb *iocb,
c4fabaec10014a Jens Axboe      2026-03-18  685  				       struct iov_iter *from)
^1da177e4c3f41 Linus Torvalds  2005-04-16  686  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  687  	char *buffer;
c4fabaec10014a Jens Axboe      2026-03-18  688  	size_t length = iov_iter_count(from);
352ced8e594091 Alexey Dobriyan 2008-04-29  689  	ssize_t err = length;
^1da177e4c3f41 Linus Torvalds  2005-04-16  690  
c4fabaec10014a Jens Axboe      2026-03-18  691  	if (length > PAGE_SIZE)
^1da177e4c3f41 Linus Torvalds  2005-04-16  692  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  693  	if (!(buffer = (char *) __get_free_page(GFP_KERNEL)))
^1da177e4c3f41 Linus Torvalds  2005-04-16  694  		return -ENOMEM;
c4fabaec10014a Jens Axboe      2026-03-18  695  	if (!copy_from_iter_full(buffer, length, from)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  696  		err =-EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  697  		goto out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  698  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  699  
^1da177e4c3f41 Linus Torvalds  2005-04-16  700  	if (length < PAGE_SIZE)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @701  		buffer[length] = '\0';
^1da177e4c3f41 Linus Torvalds  2005-04-16  702  	else if (buffer[PAGE_SIZE-1]) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  703  		err = -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  704  		goto out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  705  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  706  
^1da177e4c3f41 Linus Torvalds  2005-04-16  707  	scsi_dev_info_list_add_str(buffer);
^1da177e4c3f41 Linus Torvalds  2005-04-16  708  
^1da177e4c3f41 Linus Torvalds  2005-04-16  709  out:
^1da177e4c3f41 Linus Torvalds  2005-04-16  710  	free_page((unsigned long)buffer);
^1da177e4c3f41 Linus Torvalds  2005-04-16  711  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  712  }
352ced8e594091 Alexey Dobriyan 2008-04-29  713  

:::::: The code at line 701 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
