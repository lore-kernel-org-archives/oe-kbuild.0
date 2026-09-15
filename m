Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4D4A2A7A
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484156; cv=none; b=t9jxZLMmepQQDcNWuKTmCjXUQp+L0eIBqDVt68+X8m/pzKMemIpjaGjYsr3Sjnwy4UtECx+otKrAqR28S5rHa+d0bR0Yv/JOVF7D0z3bTWsX/aol+R0piBclkXP5J2sWC4zR349jpBAEeudLFvxyc/FaFJhDNHDfWOnvwp3h2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484156; c=relaxed/simple;
	bh=9sjkwtdv/T3tRjBSiuxThcWlIlai3WQkmdKErd6i1bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RiRs/QELgI7uDsslHRZQiwy8PcLctvHSeg2JxJrQqqP1faJWoEvbFylcBbu0Lg4jVXb4T8BA/p4jJSB2NVFLkAJq4Y/2/MetF3Z0bwisA0PCfnyocQ9bYZl+E2LN/BeLDT27aUKm8/4s/IS5xsKaRd95JtMNX3MNYGUJ/MchjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9xqkJNr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9xqkJNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789484151; x=1821020151;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9sjkwtdv/T3tRjBSiuxThcWlIlai3WQkmdKErd6i1bs=;
  b=n9xqkJNrjf9Vqa8R4K0WyBqjw7AeT1tHkQNvaqbXQveEJ841VPs1CgD+
   TE/kuNdt4Hb1G+b7yh8jeo3yGH8aIYfCIo6za5b98ZU0Du4EOpFuJL55O
   sYx0mS9oJYRM2ASG6qzbIzHB4NSfbhmWWEBLfewtPrEcnFmB+/qEVtep+
   r0WpL4pwcmt1ML/TNSiOj3VMDD0EBPoetcZMZlqVXs/VEVdvUfGjwgEfy
   Xg3SM/ne0o0xrhY9xGY2abaBN3YTshnTA5yrWX9U+bXollXe03Ek6Hpfj
   6LUN3cHFmFCy7/FjpqePOv6U9A4kL+rYXKxlD1RzP5rogJA+Rh0tEWhfx
   w==;
X-CSE-ConnectionGUID: h+2orwSySieG8BJtUBHsNw==
X-CSE-MsgGUID: KdVeJf/1TrC2YmTD4egbQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101002081"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101002081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:55:45 -0700
X-CSE-ConnectionGUID: uVLjT9y8SHqo1/9yrA6CTA==
X-CSE-MsgGUID: zUC+pBx2RauYfnU4mms6XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270413371"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2026 07:55:43 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6UZR-000000000dd-1mYO;
	Tue, 15 Sep 2026 14:55:41 +0000
Date: Tue, 15 Sep 2026 16:54:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-new 502/560] drivers/scsi/sg.c:294:1-17: ERROR:
 sg_fops: .read() can deadlock .write(); change nonseekable_open ->
 stream_open to fix.
Message-ID: <202609151628.hydefVEV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   b08a65b93426d86e3f354d655d6225397b591877
commit: e5b708382008997a5d8652c78d32c4ac43bdc07e [502/560] scsi: sg: conver=
t mmap hook to mmap_prepare and rework
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: csky-randconfig-r053-20260915 (https://download.01.org/0day-ci/arch=
ive/20260915/202609151628.hydefVEV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609151628.hydefVEV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/sg.c:294:1-17: ERROR: sg_fops: .read() can deadlock .write(=
); change nonseekable_open -> stream_open to fix.

vim +294 drivers/scsi/sg.c

035d12e658fba28 J=C3=B6rn Engel         2012-04-25  281 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  282  /* Returns 0 on success=
, else a negated errno value */
^1da177e4c3f415 Linus Torvalds     2005-04-16  283  static int
^1da177e4c3f415 Linus Torvalds     2005-04-16  284  sg_open(struct inode *i=
node, struct file *filp)
^1da177e4c3f415 Linus Torvalds     2005-04-16  285  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  286  	int dev =3D iminor(ino=
de);
^1da177e4c3f415 Linus Torvalds     2005-04-16  287  	int flags =3D filp->f_=
flags;
d6b10348f939794 Mike Christie      2005-11-08  288  	struct request_queue *=
q;
d4e655c49f474de Alexander Wetzel   2024-04-01  289  	struct scsi_device *de=
vice;
^1da177e4c3f415 Linus Torvalds     2005-04-16  290  	Sg_device *sdp;
^1da177e4c3f415 Linus Torvalds     2005-04-16  291  	Sg_fd *sfp;
^1da177e4c3f415 Linus Torvalds     2005-04-16  292  	int retval;
^1da177e4c3f415 Linus Torvalds     2005-04-16  293 =20
^1da177e4c3f415 Linus Torvalds     2005-04-16 @294  	nonseekable_open(inode=
, filp);
cc833acbee9db5c Douglas Gilbert    2014-06-25  295  	if ((flags & O_EXCL) &=
& (O_RDONLY =3D=3D (flags & O_ACCMODE)))
cc833acbee9db5c Douglas Gilbert    2014-06-25  296  		return -EPERM; /* Can=
't lock it with read only access */
^1da177e4c3f415 Linus Torvalds     2005-04-16  297  	sdp =3D sg_get_dev(dev=
);
cc833acbee9db5c Douglas Gilbert    2014-06-25  298  	if (IS_ERR(sdp))
cc833acbee9db5c Douglas Gilbert    2014-06-25  299  		return PTR_ERR(sdp);
^1da177e4c3f415 Linus Torvalds     2005-04-16  300 =20
95e159d6dd808b2 Hannes Reinecke    2014-06-25  301  	SCSI_LOG_TIMEOUT(3, sg=
_printk(KERN_INFO, sdp,
95e159d6dd808b2 Hannes Reinecke    2014-06-25  302  				      "sg_open: fla=
gs=3D0x%x\n", flags));
95e159d6dd808b2 Hannes Reinecke    2014-06-25  303 =20
^1da177e4c3f415 Linus Torvalds     2005-04-16  304  	/* This driver's modul=
e count bumped by fops_get in <linux/fs.h> */
^1da177e4c3f415 Linus Torvalds     2005-04-16  305  	/* Prevent the device =
driver from vanishing while we sleep */
d4e655c49f474de Alexander Wetzel   2024-04-01  306  	device =3D sdp->device;
d4e655c49f474de Alexander Wetzel   2024-04-01  307  	retval =3D scsi_device=
_get(device);
c6517b7942fad66 Tony Battersby     2009-01-21  308  	if (retval)
c6517b7942fad66 Tony Battersby     2009-01-21  309  		goto sg_put;
^1da177e4c3f415 Linus Torvalds     2005-04-16  310 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  311  	/* scsi_block_when_pro=
cessing_errors() may block so bypass
cc833acbee9db5c Douglas Gilbert    2014-06-25  312  	 * check if O_NONBLOCK=
. Permits SCSI commands to be issued
cc833acbee9db5c Douglas Gilbert    2014-06-25  313  	 * during error recove=
ry. Tread carefully. */
^1da177e4c3f415 Linus Torvalds     2005-04-16  314  	if (!((flags & O_NONBL=
OCK) ||
d4e655c49f474de Alexander Wetzel   2024-04-01  315  	      scsi_block_when_=
processing_errors(device))) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  316  		retval =3D -ENXIO;
^1da177e4c3f415 Linus Torvalds     2005-04-16  317  		/* we are in error re=
covery for this device */
4045de893f691f7 Bart Van Assche    2024-10-30  318  		goto sdp_put;
^1da177e4c3f415 Linus Torvalds     2005-04-16  319  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  320 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  321  	mutex_lock(&sdp->open_=
rel_lock);
cc833acbee9db5c Douglas Gilbert    2014-06-25  322  	if (flags & O_NONBLOCK=
) {
065b4a2f5952df2 James Bottomley    2013-10-25  323  		if (flags & O_EXCL) {
cc833acbee9db5c Douglas Gilbert    2014-06-25  324  			if (sdp->open_cnt > =
0) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  325  				retval =3D -EBUSY;
cc833acbee9db5c Douglas Gilbert    2014-06-25  326  				goto error_mutex_lo=
cked;
065b4a2f5952df2 James Bottomley    2013-10-25  327  			}
cc833acbee9db5c Douglas Gilbert    2014-06-25  328  		} else {
cc833acbee9db5c Douglas Gilbert    2014-06-25  329  			if (sdp->exclude) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  330  				retval =3D -EBUSY;
cc833acbee9db5c Douglas Gilbert    2014-06-25  331  				goto error_mutex_lo=
cked;
^1da177e4c3f415 Linus Torvalds     2005-04-16  332  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  333  		}
cc833acbee9db5c Douglas Gilbert    2014-06-25  334  	} else {
cc833acbee9db5c Douglas Gilbert    2014-06-25  335  		retval =3D open_wait(=
sdp, flags);
cc833acbee9db5c Douglas Gilbert    2014-06-25  336  		if (retval) /* -EREST=
ARTSYS or -ENODEV */
cc833acbee9db5c Douglas Gilbert    2014-06-25  337  			goto error_mutex_loc=
ked;
bafc8ad82d482f9 James Bottomley    2013-10-25  338  	}
cc833acbee9db5c Douglas Gilbert    2014-06-25  339 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  340  	/* N.B. at this point =
we are holding the open_rel_lock */
cc833acbee9db5c Douglas Gilbert    2014-06-25  341  	if (flags & O_EXCL)
cc833acbee9db5c Douglas Gilbert    2014-06-25  342  		sdp->exclude =3D true;
cc833acbee9db5c Douglas Gilbert    2014-06-25  343 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  344  	if (sdp->open_cnt < 1)=
 {  /* no existing opens */
^1da177e4c3f415 Linus Torvalds     2005-04-16  345  		sdp->sgdebug =3D 0;
d4e655c49f474de Alexander Wetzel   2024-04-01  346  		q =3D device->request=
_queue;
8a78362c4eefc1d Martin K. Petersen 2010-02-26  347  		sdp->sg_tablesize =3D =
queue_max_segments(q);
^1da177e4c3f415 Linus Torvalds     2005-04-16  348  	}
95e159d6dd808b2 Hannes Reinecke    2014-06-25  349  	sfp =3D sg_add_sfp(sdp=
);
cc833acbee9db5c Douglas Gilbert    2014-06-25  350  	if (IS_ERR(sfp)) {
cc833acbee9db5c Douglas Gilbert    2014-06-25  351  		retval =3D PTR_ERR(sf=
p);
cc833acbee9db5c Douglas Gilbert    2014-06-25  352  		goto out_undo;
cc833acbee9db5c Douglas Gilbert    2014-06-25  353  	}
cc833acbee9db5c Douglas Gilbert    2014-06-25  354 =20
^1da177e4c3f415 Linus Torvalds     2005-04-16  355  	filp->private_data =3D =
sfp;
cc833acbee9db5c Douglas Gilbert    2014-06-25  356  	sdp->open_cnt++;
cc833acbee9db5c Douglas Gilbert    2014-06-25  357  	mutex_unlock(&sdp->ope=
n_rel_lock);
cc833acbee9db5c Douglas Gilbert    2014-06-25  358 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  359  	retval =3D 0;
cc833acbee9db5c Douglas Gilbert    2014-06-25  360  sg_put:
cc833acbee9db5c Douglas Gilbert    2014-06-25  361  	kref_put(&sdp->d_ref, =
sg_device_destroy);
cc833acbee9db5c Douglas Gilbert    2014-06-25  362  	return retval;
cc833acbee9db5c Douglas Gilbert    2014-06-25  363 =20
cc833acbee9db5c Douglas Gilbert    2014-06-25  364  out_undo:
c6517b7942fad66 Tony Battersby     2009-01-21  365  	if (flags & O_EXCL) {
cc833acbee9db5c Douglas Gilbert    2014-06-25  366  		sdp->exclude =3D fals=
e;   /* undo if error */
cc833acbee9db5c Douglas Gilbert    2014-06-25  367  		wake_up_interruptible=
(&sdp->open_wait);
065b4a2f5952df2 James Bottomley    2013-10-25  368  	}
cc833acbee9db5c Douglas Gilbert    2014-06-25  369  error_mutex_locked:
cc833acbee9db5c Douglas Gilbert    2014-06-25  370  	mutex_unlock(&sdp->ope=
n_rel_lock);
bc4f24014de58f0 Alan Stern         2010-06-17  371  sdp_put:
d4e655c49f474de Alexander Wetzel   2024-04-01  372  	kref_put(&sdp->d_ref, =
sg_device_destroy);
d4e655c49f474de Alexander Wetzel   2024-04-01  373  	scsi_device_put(device=
);
d4e655c49f474de Alexander Wetzel   2024-04-01  374  	return retval;
^1da177e4c3f415 Linus Torvalds     2005-04-16  375  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  376 =20

:::::: The code at line 294 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
