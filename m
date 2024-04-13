Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F92C9D
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713011079; cv=none; b=lXyHjwYoO+s+1js/V9yMznk7OF9Q/9qym0sgqFkcHbIMmYt2T9NaYbBPpJPJ6UBF1BYp7n9GgyMRmW24lx9FfnLXxM3T1ltExYybsOJrTPfFPQSRS0xqP23HBFXel91AKhZ6JThg6uGo0EJpB+0/lu+i2Co+AMwrL8sNaBr3iiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713011079; c=relaxed/simple;
	bh=d4B8fI6A69ha2iKY7laNYLS4xx3YvwkahJ6XuBO95+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aEVGpMw1Rwa44rYbhtR//KVEzF76XweK/c6TpyxNynYsiMAyBF/5p6elo2vBfa4BMptLNTRT6MtG7wdn5goB9++MQIzRoFAnJeHHcxwTMcmtjyS2fyQhA9mE9DPlAuJ1tUp4lByMOgfAuJO4V1+0a1cXwYmrbLSgX4DgFBxyI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFEBk8BK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFEBk8BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713011076; x=1744547076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d4B8fI6A69ha2iKY7laNYLS4xx3YvwkahJ6XuBO95+E=;
  b=ZFEBk8BK9lh05X4v7D+9UYsYpEeQ2ZPTXyLz5O6tk6/qd/z+TcUmFCX5
   TBrYVWlF8788rOUmbL8FmGIIrD2WN/Z1ZcRJYOvt5m1JVlOLzxgqn59Me
   Kj4BQw2ykWfaRH7XHRJMNAB2QEgbblNKRS84H5/+PHbCnVX6xjYMdR1cK
   9w7zmyAE0ebpZOq57H7wr8IvzvxoWJr2nlfio01wsGdXGTayKkw1YFHHB
   JIVqow2cDWYajrgTEgbGRCoGk2cxa0BTpv9cP5b+BS/EBSJSN1DYxvnoz
   5HqSwRoHrcGw3UlMlO2UTWwJQtRmtmsIph60Nbf1SuR9EjBNruLuZN7of
   Q==;
X-CSE-ConnectionGUID: WNWtHSAFSFSRNnE8kGOl8g==
X-CSE-MsgGUID: a53+zbAGQCWz9alD1kvnRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19019532"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="19019532"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 05:24:36 -0700
X-CSE-ConnectionGUID: PORfMtqkQRGgthyqSeCsKg==
X-CSE-MsgGUID: dxOohbqmT/63V0QjBjjkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="21966700"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Apr 2024 05:24:33 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvcQp-0002WO-19;
	Sat, 13 Apr 2024 12:24:31 +0000
Date: Sat, 13 Apr 2024 20:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mkp-scsi:for-next 99/119] drivers/scsi/scsi_scan.c:1126
 scsi_add_lun() warn: inconsistent returns
 '&sdev->request_queue->limits_lock'.
Message-ID: <202404132006.uEyZu33S-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Hannes Reinecke <hare@suse.de>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   f92141e18c8b466027e226f3388de15b059b6f65
commit: b7eefcf11f3fb1703ddfa075d4f4bc30b9c50eb4 [99/119] scsi: core: Add a device_configure method to the host template
:::::: branch date: 26 hours ago
:::::: commit date: 35 hours ago
config: mips-randconfig-r071-20240413 (https://download.01.org/0day-ci/archive/20240413/202404132006.uEyZu33S-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404132006.uEyZu33S-lkp@intel.com/

smatch warnings:
drivers/scsi/scsi_scan.c:1126 scsi_add_lun() warn: inconsistent returns '&sdev->request_queue->limits_lock'.

vim +1126 drivers/scsi/scsi_scan.c

^1da177e4c3f41 Linus Torvalds      2005-04-16   858  
^1da177e4c3f41 Linus Torvalds      2005-04-16   859  /**
f64a181d898e05 Christoph Hellwig   2005-10-31   860   * scsi_add_lun - allocate and fully initialze a scsi_device
6d877688ef4113 Matthew Wilcox      2007-07-11   861   * @sdev:	holds information to be stored in the new scsi_device
^1da177e4c3f41 Linus Torvalds      2005-04-16   862   * @inq_result:	holds the result of a previous INQUIRY to the LUN
^1da177e4c3f41 Linus Torvalds      2005-04-16   863   * @bflags:	black/white list flag
6d877688ef4113 Matthew Wilcox      2007-07-11   864   * @async:	1 if this device is being scanned asynchronously
^1da177e4c3f41 Linus Torvalds      2005-04-16   865   *
^1da177e4c3f41 Linus Torvalds      2005-04-16   866   * Description:
6d877688ef4113 Matthew Wilcox      2007-07-11   867   *     Initialize the scsi_device @sdev.  Optionally set fields based
6d877688ef4113 Matthew Wilcox      2007-07-11   868   *     on values in *@bflags.
^1da177e4c3f41 Linus Torvalds      2005-04-16   869   *
^1da177e4c3f41 Linus Torvalds      2005-04-16   870   * Return:
f64a181d898e05 Christoph Hellwig   2005-10-31   871   *     SCSI_SCAN_NO_RESPONSE: could not allocate or setup a scsi_device
f64a181d898e05 Christoph Hellwig   2005-10-31   872   *     SCSI_SCAN_LUN_PRESENT: a new scsi_device was allocated and initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16   873   **/
e5b3cd42960a10 Alan Stern          2006-08-21   874  static int scsi_add_lun(struct scsi_device *sdev, unsigned char *inq_result,
093b8886f446c9 Bart Van Assche     2017-12-12   875  		blist_flags_t *bflags, int async)
^1da177e4c3f41 Linus Torvalds      2005-04-16   876  {
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09   877  	const struct scsi_host_template *hostt = sdev->host->hostt;
693a1e8cbe121b Christoph Hellwig   2024-04-09   878  	struct queue_limits lim;
6f4267e3bd1211 James Bottomley     2008-08-22   879  	int ret;
6f4267e3bd1211 James Bottomley     2008-08-22   880  
^1da177e4c3f41 Linus Torvalds      2005-04-16   881  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16   882  	 * XXX do not save the inquiry, since it can change underneath us,
^1da177e4c3f41 Linus Torvalds      2005-04-16   883  	 * save just vendor/model/rev.
^1da177e4c3f41 Linus Torvalds      2005-04-16   884  	 *
^1da177e4c3f41 Linus Torvalds      2005-04-16   885  	 * Rather than save it and have an ioctl that retrieves the saved
^1da177e4c3f41 Linus Torvalds      2005-04-16   886  	 * value, have an ioctl that executes the same INQUIRY code used
^1da177e4c3f41 Linus Torvalds      2005-04-16   887  	 * in scsi_probe_lun, let user level programs doing INQUIRY
^1da177e4c3f41 Linus Torvalds      2005-04-16   888  	 * scanning run at their own risk, or supply a user level program
^1da177e4c3f41 Linus Torvalds      2005-04-16   889  	 * that can correctly scan.
^1da177e4c3f41 Linus Torvalds      2005-04-16   890  	 */
09123d230a294c Alan Stern          2006-11-10   891  
09123d230a294c Alan Stern          2006-11-10   892  	/*
09123d230a294c Alan Stern          2006-11-10   893  	 * Copy at least 36 bytes of INQUIRY data, so that we don't
09123d230a294c Alan Stern          2006-11-10   894  	 * dereference unallocated memory when accessing the Vendor,
09123d230a294c Alan Stern          2006-11-10   895  	 * Product, and Revision strings.  Badly behaved devices may set
09123d230a294c Alan Stern          2006-11-10   896  	 * the INQUIRY Additional Length byte to a small value, indicating
09123d230a294c Alan Stern          2006-11-10   897  	 * these strings are invalid, but often they contain plausible data
09123d230a294c Alan Stern          2006-11-10   898  	 * nonetheless.  It doesn't matter if the device sent < 36 bytes
09123d230a294c Alan Stern          2006-11-10   899  	 * total, since scsi_probe_lun() initializes inq_result with 0s.
09123d230a294c Alan Stern          2006-11-10   900  	 */
09123d230a294c Alan Stern          2006-11-10   901  	sdev->inquiry = kmemdup(inq_result,
09123d230a294c Alan Stern          2006-11-10   902  				max_t(size_t, sdev->inquiry_len, 36),
1749ef00f73126 Benjamin Block      2019-02-21   903  				GFP_KERNEL);
09123d230a294c Alan Stern          2006-11-10   904  	if (sdev->inquiry == NULL)
^1da177e4c3f41 Linus Torvalds      2005-04-16   905  		return SCSI_SCAN_NO_RESPONSE;
^1da177e4c3f41 Linus Torvalds      2005-04-16   906  
^1da177e4c3f41 Linus Torvalds      2005-04-16   907  	sdev->vendor = (char *) (sdev->inquiry + 8);
^1da177e4c3f41 Linus Torvalds      2005-04-16   908  	sdev->model = (char *) (sdev->inquiry + 16);
^1da177e4c3f41 Linus Torvalds      2005-04-16   909  	sdev->rev = (char *) (sdev->inquiry + 32);
^1da177e4c3f41 Linus Torvalds      2005-04-16   910  
14216561e16467 James Bottomley     2012-07-25   911  	if (strncmp(sdev->vendor, "ATA     ", 8) == 0) {
14216561e16467 James Bottomley     2012-07-25   912  		/*
14216561e16467 James Bottomley     2012-07-25   913  		 * sata emulation layer device.  This is a hack to work around
14216561e16467 James Bottomley     2012-07-25   914  		 * the SATL power management specifications which state that
14216561e16467 James Bottomley     2012-07-25   915  		 * when the SATL detects the device has gone into standby
14216561e16467 James Bottomley     2012-07-25   916  		 * mode, it shall respond with NOT READY.
14216561e16467 James Bottomley     2012-07-25   917  		 */
14216561e16467 James Bottomley     2012-07-25   918  		sdev->allow_restart = 1;
14216561e16467 James Bottomley     2012-07-25   919  	}
14216561e16467 James Bottomley     2012-07-25   920  
^1da177e4c3f41 Linus Torvalds      2005-04-16   921  	if (*bflags & BLIST_ISROM) {
6d877688ef4113 Matthew Wilcox      2007-07-11   922  		sdev->type = TYPE_ROM;
6d877688ef4113 Matthew Wilcox      2007-07-11   923  		sdev->removable = 1;
6d877688ef4113 Matthew Wilcox      2007-07-11   924  	} else {
6d877688ef4113 Matthew Wilcox      2007-07-11   925  		sdev->type = (inq_result[0] & 0x1f);
6d877688ef4113 Matthew Wilcox      2007-07-11   926  		sdev->removable = (inq_result[1] & 0x80) >> 7;
45341ca3fcacc8 Subhash Jadavani    2014-09-25   927  
45341ca3fcacc8 Subhash Jadavani    2014-09-25   928  		/*
45341ca3fcacc8 Subhash Jadavani    2014-09-25   929  		 * some devices may respond with wrong type for
45341ca3fcacc8 Subhash Jadavani    2014-09-25   930  		 * well-known logical units. Force well-known type
45341ca3fcacc8 Subhash Jadavani    2014-09-25   931  		 * to enumerate them correctly.
45341ca3fcacc8 Subhash Jadavani    2014-09-25   932  		 */
45341ca3fcacc8 Subhash Jadavani    2014-09-25   933  		if (scsi_is_wlun(sdev->lun) && sdev->type != TYPE_WLUN) {
45341ca3fcacc8 Subhash Jadavani    2014-09-25   934  			sdev_printk(KERN_WARNING, sdev,
45341ca3fcacc8 Subhash Jadavani    2014-09-25   935  				"%s: correcting incorrect peripheral device type 0x%x for W-LUN 0x%16xhN\n",
45341ca3fcacc8 Subhash Jadavani    2014-09-25   936  				__func__, sdev->type, (unsigned int)sdev->lun);
45341ca3fcacc8 Subhash Jadavani    2014-09-25   937  			sdev->type = TYPE_WLUN;
45341ca3fcacc8 Subhash Jadavani    2014-09-25   938  		}
45341ca3fcacc8 Subhash Jadavani    2014-09-25   939  
6d877688ef4113 Matthew Wilcox      2007-07-11   940  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   941  
6d877688ef4113 Matthew Wilcox      2007-07-11   942  	if (sdev->type == TYPE_RBC || sdev->type == TYPE_ROM) {
6d877688ef4113 Matthew Wilcox      2007-07-11   943  		/* RBC and MMC devices can return SCSI-3 compliance and yet
6d877688ef4113 Matthew Wilcox      2007-07-11   944  		 * still not support REPORT LUNS, so make them act as
6d877688ef4113 Matthew Wilcox      2007-07-11   945  		 * BLIST_NOREPORTLUN unless BLIST_REPORTLUN2 is
6d877688ef4113 Matthew Wilcox      2007-07-11   946  		 * specifically set */
6d877688ef4113 Matthew Wilcox      2007-07-11   947  		if ((*bflags & BLIST_REPORTLUN2) == 0)
6d877688ef4113 Matthew Wilcox      2007-07-11   948  			*bflags |= BLIST_NOREPORTLUN;
6d877688ef4113 Matthew Wilcox      2007-07-11   949  	}
6d877688ef4113 Matthew Wilcox      2007-07-11   950  
^1da177e4c3f41 Linus Torvalds      2005-04-16   951  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16   952  	 * For a peripheral qualifier (PQ) value of 1 (001b), the SCSI
^1da177e4c3f41 Linus Torvalds      2005-04-16   953  	 * spec says: The device server is capable of supporting the
^1da177e4c3f41 Linus Torvalds      2005-04-16   954  	 * specified peripheral device type on this logical unit. However,
^1da177e4c3f41 Linus Torvalds      2005-04-16   955  	 * the physical device is not currently connected to this logical
^1da177e4c3f41 Linus Torvalds      2005-04-16   956  	 * unit.
^1da177e4c3f41 Linus Torvalds      2005-04-16   957  	 *
^1da177e4c3f41 Linus Torvalds      2005-04-16   958  	 * The above is vague, as it implies that we could treat 001 and
^1da177e4c3f41 Linus Torvalds      2005-04-16   959  	 * 011 the same. Stay compatible with previous code, and create a
f64a181d898e05 Christoph Hellwig   2005-10-31   960  	 * scsi_device for a PQ of 1
^1da177e4c3f41 Linus Torvalds      2005-04-16   961  	 *
^1da177e4c3f41 Linus Torvalds      2005-04-16   962  	 * Don't set the device offline here; rather let the upper
^1da177e4c3f41 Linus Torvalds      2005-04-16   963  	 * level drivers eval the PQ to decide whether they should
^1da177e4c3f41 Linus Torvalds      2005-04-16   964  	 * attach. So remove ((inq_result[0] >> 5) & 7) == 1 check.
^1da177e4c3f41 Linus Torvalds      2005-04-16   965  	 */ 
^1da177e4c3f41 Linus Torvalds      2005-04-16   966  
^1da177e4c3f41 Linus Torvalds      2005-04-16   967  	sdev->inq_periph_qual = (inq_result[0] >> 5) & 7;
^1da177e4c3f41 Linus Torvalds      2005-04-16   968  	sdev->lockable = sdev->removable;
^1da177e4c3f41 Linus Torvalds      2005-04-16   969  	sdev->soft_reset = (inq_result[7] & 1) && ((inq_result[3] & 7) == 2);
^1da177e4c3f41 Linus Torvalds      2005-04-16   970  
6d877688ef4113 Matthew Wilcox      2007-07-11   971  	if (sdev->scsi_level >= SCSI_3 ||
6d877688ef4113 Matthew Wilcox      2007-07-11   972  			(sdev->inquiry_len > 56 && inq_result[56] & 0x04))
^1da177e4c3f41 Linus Torvalds      2005-04-16   973  		sdev->ppr = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16   974  	if (inq_result[7] & 0x60)
^1da177e4c3f41 Linus Torvalds      2005-04-16   975  		sdev->wdtr = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16   976  	if (inq_result[7] & 0x10)
^1da177e4c3f41 Linus Torvalds      2005-04-16   977  		sdev->sdtr = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16   978  
19ac0db3e22de3 James Bottomley     2006-08-06   979  	sdev_printk(KERN_NOTICE, sdev, "%s %.8s %.16s %.4s PQ: %d "
4ff36718ede26e Matthew Wilcox      2006-07-04   980  			"ANSI: %d%s\n", scsi_device_type(sdev->type),
4ff36718ede26e Matthew Wilcox      2006-07-04   981  			sdev->vendor, sdev->model, sdev->rev,
4ff36718ede26e Matthew Wilcox      2006-07-04   982  			sdev->inq_periph_qual, inq_result[2] & 0x07,
4ff36718ede26e Matthew Wilcox      2006-07-04   983  			(inq_result[3] & 0x0f) == 1 ? " CCS" : "");
4ff36718ede26e Matthew Wilcox      2006-07-04   984  
^1da177e4c3f41 Linus Torvalds      2005-04-16   985  	if ((sdev->scsi_level >= SCSI_2) && (inq_result[7] & 2) &&
c8b09f6fb67df7 Christoph Hellwig   2014-11-03   986  	    !(*bflags & BLIST_NOTQ)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   987  		sdev->tagged_supported = 1;
c8b09f6fb67df7 Christoph Hellwig   2014-11-03   988  		sdev->simple_tags = 1;
c8b09f6fb67df7 Christoph Hellwig   2014-11-03   989  	}
6d877688ef4113 Matthew Wilcox      2007-07-11   990  
^1da177e4c3f41 Linus Torvalds      2005-04-16   991  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16   992  	 * Some devices (Texel CD ROM drives) have handshaking problems
^1da177e4c3f41 Linus Torvalds      2005-04-16   993  	 * when used with the Seagate controllers. borken is initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16   994  	 * to 1, and then set it to 0 here.
^1da177e4c3f41 Linus Torvalds      2005-04-16   995  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16   996  	if ((*bflags & BLIST_BORKEN) == 0)
^1da177e4c3f41 Linus Torvalds      2005-04-16   997  		sdev->borken = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16   998  
6d877688ef4113 Matthew Wilcox      2007-07-11   999  	if (*bflags & BLIST_NO_ULD_ATTACH)
6d877688ef4113 Matthew Wilcox      2007-07-11  1000  		sdev->no_uld_attach = 1;
6d877688ef4113 Matthew Wilcox      2007-07-11  1001  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1002  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1003  	 * Apparently some really broken devices (contrary to the SCSI
^1da177e4c3f41 Linus Torvalds      2005-04-16  1004  	 * standards) need to be selected without asserting ATN
^1da177e4c3f41 Linus Torvalds      2005-04-16  1005  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1006  	if (*bflags & BLIST_SELECT_NO_ATN)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1007  		sdev->select_no_atn = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1008  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1009  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1010  	 * Some devices may not want to have a start command automatically
^1da177e4c3f41 Linus Torvalds      2005-04-16  1011  	 * issued when a device is added.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1012  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1013  	if (*bflags & BLIST_NOSTARTONADD)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1014  		sdev->no_start_on_add = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1015  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1016  	if (*bflags & BLIST_SINGLELUN)
25d7c363f2663f Tony Battersby      2007-11-12  1017  		scsi_target(sdev)->single_lun = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1018  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1019  	sdev->use_10_for_rw = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1020  
0213436a2cc5e4 Janusz Dziemidowicz 2014-07-24  1021  	/* some devices don't like REPORT SUPPORTED OPERATION CODES
0213436a2cc5e4 Janusz Dziemidowicz 2014-07-24  1022  	 * and will simply timeout causing sd_mod init to take a very
0213436a2cc5e4 Janusz Dziemidowicz 2014-07-24  1023  	 * very long time */
0213436a2cc5e4 Janusz Dziemidowicz 2014-07-24  1024  	if (*bflags & BLIST_NO_RSOC)
0213436a2cc5e4 Janusz Dziemidowicz 2014-07-24  1025  		sdev->no_report_opcodes = 1;
0213436a2cc5e4 Janusz Dziemidowicz 2014-07-24  1026  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1027  	/* set the device running here so that slave configure
^1da177e4c3f41 Linus Torvalds      2005-04-16  1028  	 * may do I/O */
0db6ca8a5e1ea5 Bart Van Assche     2017-06-02  1029  	mutex_lock(&sdev->state_mutex);
6f4267e3bd1211 James Bottomley     2008-08-22  1030  	ret = scsi_device_set_state(sdev, SDEV_RUNNING);
0db6ca8a5e1ea5 Bart Van Assche     2017-06-02  1031  	if (ret)
6f4267e3bd1211 James Bottomley     2008-08-22  1032  		ret = scsi_device_set_state(sdev, SDEV_BLOCK);
0db6ca8a5e1ea5 Bart Van Assche     2017-06-02  1033  	mutex_unlock(&sdev->state_mutex);
6f4267e3bd1211 James Bottomley     2008-08-22  1034  
6f4267e3bd1211 James Bottomley     2008-08-22  1035  	if (ret) {
6f4267e3bd1211 James Bottomley     2008-08-22  1036  		sdev_printk(KERN_ERR, sdev,
6f4267e3bd1211 James Bottomley     2008-08-22  1037  			    "in wrong state %s to complete scan\n",
6f4267e3bd1211 James Bottomley     2008-08-22  1038  			    scsi_device_state_name(sdev->sdev_state));
6f4267e3bd1211 James Bottomley     2008-08-22  1039  		return SCSI_SCAN_NO_RESPONSE;
6f4267e3bd1211 James Bottomley     2008-08-22  1040  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1041  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1042  	if (*bflags & BLIST_NOT_LOCKABLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1043  		sdev->lockable = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1044  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1045  	if (*bflags & BLIST_RETRY_HWERROR)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1046  		sdev->retry_hwerror = 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1047  
d974e4265dbd35 Martin K. Petersen  2012-08-28  1048  	if (*bflags & BLIST_NO_DIF)
d974e4265dbd35 Martin K. Petersen  2012-08-28  1049  		sdev->no_dif = 1;
d974e4265dbd35 Martin K. Petersen  2012-08-28  1050  
28a0bc4120d38a Martin K. Petersen  2017-09-27  1051  	if (*bflags & BLIST_UNMAP_LIMIT_WS)
28a0bc4120d38a Martin K. Petersen  2017-09-27  1052  		sdev->unmap_limit_for_ws = 1;
28a0bc4120d38a Martin K. Petersen  2017-09-27  1053  
f591a2e0548da8 Martin Kepplinger   2021-07-04  1054  	if (*bflags & BLIST_IGN_MEDIA_CHANGE)
f591a2e0548da8 Martin Kepplinger   2021-07-04  1055  		sdev->ignore_media_change = 1;
f591a2e0548da8 Martin Kepplinger   2021-07-04  1056  
0816c9251a7180 Martin K. Petersen  2013-05-10  1057  	sdev->eh_timeout = SCSI_DEFAULT_EH_TIMEOUT;
0816c9251a7180 Martin K. Petersen  2013-05-10  1058  
c1d40a527e885a Martin K. Petersen  2014-07-15  1059  	if (*bflags & BLIST_TRY_VPD_PAGES)
c1d40a527e885a Martin K. Petersen  2014-07-15  1060  		sdev->try_vpd_pages = 1;
c1d40a527e885a Martin K. Petersen  2014-07-15  1061  	else if (*bflags & BLIST_SKIP_VPD_PAGES)
56f2a8016e0ab5 Martin K. Petersen  2013-04-24  1062  		sdev->skip_vpd_pages = 1;
56f2a8016e0ab5 Martin K. Petersen  2013-04-24  1063  
4b1a2c2a8e0ddc Lee Duncan          2022-09-28  1064  	if (*bflags & BLIST_NO_VPD_SIZE)
4b1a2c2a8e0ddc Lee Duncan          2022-09-28  1065  		sdev->no_vpd_size = 1;
4b1a2c2a8e0ddc Lee Duncan          2022-09-28  1066  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1067  	transport_configure_device(&sdev->sdev_gendev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1068  
693a1e8cbe121b Christoph Hellwig   2024-04-09  1069  	/*
693a1e8cbe121b Christoph Hellwig   2024-04-09  1070  	 * No need to freeze the queue as it isn't reachable to anyone else yet.
693a1e8cbe121b Christoph Hellwig   2024-04-09  1071  	 */
693a1e8cbe121b Christoph Hellwig   2024-04-09  1072  	lim = queue_limits_start_update(sdev->request_queue);
693a1e8cbe121b Christoph Hellwig   2024-04-09  1073  	if (*bflags & BLIST_MAX_512)
693a1e8cbe121b Christoph Hellwig   2024-04-09  1074  		lim.max_hw_sectors = 512;
693a1e8cbe121b Christoph Hellwig   2024-04-09  1075  	else if (*bflags & BLIST_MAX_1024)
693a1e8cbe121b Christoph Hellwig   2024-04-09  1076  		lim.max_hw_sectors = 1024;
693a1e8cbe121b Christoph Hellwig   2024-04-09  1077  
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1078  	if (hostt->device_configure)
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1079  		ret = hostt->device_configure(sdev, &lim);
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1080  	else if (hostt->slave_configure)
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1081  		ret = hostt->slave_configure(sdev);
938050916f57f0 Christoph Hellwig   2006-02-17  1082  	if (ret) {
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1083  		queue_limits_cancel_update(sdev->request_queue);
938050916f57f0 Christoph Hellwig   2006-02-17  1084  		/*
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1085  		 * If the LLDD reports device not present, don't clutter the
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1086  		 * console with failure messages.
938050916f57f0 Christoph Hellwig   2006-02-17  1087  		 */
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1088  		if (ret != -ENXIO)
938050916f57f0 Christoph Hellwig   2006-02-17  1089  			sdev_printk(KERN_ERR, sdev,
938050916f57f0 Christoph Hellwig   2006-02-17  1090  				"failed to configure device\n");
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1091  		return SCSI_SCAN_NO_RESPONSE;
938050916f57f0 Christoph Hellwig   2006-02-17  1092  	}
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1093  
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1094  	ret = queue_limits_commit_update(sdev->request_queue, &lim);
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1095  	if (ret) {
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1096  		sdev_printk(KERN_ERR, sdev, "failed to apply queue limits.\n");
938050916f57f0 Christoph Hellwig   2006-02-17  1097  		return SCSI_SCAN_NO_RESPONSE;
938050916f57f0 Christoph Hellwig   2006-02-17  1098  	}
edb854a3680bac Ming Lei            2022-01-27  1099  
edb854a3680bac Ming Lei            2022-01-27  1100  	/*
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1101  	 * The queue_depth is often changed in ->device_configure.
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1102  	 *
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1103  	 * Set up budget map again since memory consumption of the map depends
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1104  	 * on actual queue depth.
edb854a3680bac Ming Lei            2022-01-27  1105  	 */
b7eefcf11f3fb1 Christoph Hellwig   2024-04-09  1106  	if (hostt->device_configure || hostt->slave_configure)
edb854a3680bac Ming Lei            2022-01-27  1107  		scsi_realloc_sdev_budget_map(sdev, sdev->queue_depth);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1108  
b3ae8780b42918 Hannes Reinecke     2014-03-15  1109  	if (sdev->scsi_level >= SCSI_3)
b3ae8780b42918 Hannes Reinecke     2014-03-15  1110  		scsi_attach_vpd(sdev);
b3ae8780b42918 Hannes Reinecke     2014-03-15  1111  
624885209f31eb Damien Le Moal      2023-05-11  1112  	scsi_cdl_check(sdev);
624885209f31eb Damien Le Moal      2023-05-11  1113  
4a84067dbfce43 Vasu Dev            2009-10-22  1114  	sdev->max_queue_depth = sdev->queue_depth;
020b0f0a31920e Ming Lei            2021-01-22  1115  	WARN_ON_ONCE(sdev->max_queue_depth > sdev->budget_map.depth);
345e29608b4bb4 Hannes Reinecke     2017-10-02  1116  	sdev->sdev_bflags = *bflags;
4a84067dbfce43 Vasu Dev            2009-10-22  1117  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1118  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1119  	 * Ok, the device is now all set up, we can
^1da177e4c3f41 Linus Torvalds      2005-04-16  1120  	 * register it and tell the rest of the kernel
^1da177e4c3f41 Linus Torvalds      2005-04-16  1121  	 * about it.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1122  	 */
3e082a910d217b Matthew Wilcox      2006-09-28  1123  	if (!async && scsi_sysfs_add_sdev(sdev) != 0)
b24b1033451fcc Alan Stern          2005-07-27  1124  		return SCSI_SCAN_NO_RESPONSE;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1125  
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1126  	return SCSI_SCAN_LUN_PRESENT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1127  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  1128  

:::::: The code at line 1126 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
