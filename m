Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997195;
	b=CmiEPt67xguhJ21KguGHhPvvFbsGKPxW7XrVikOLk3R1xT/ZmaKbEFy98kGZjxLQ3v1P
	 C2oa/Tkk0LIqM68ZA71+iLHS0MWA48CV8Z+gx5l4TgkMdaH6BoMz9F49wyOcWCgxVp+Fj
	 eJVggl15UWKxujg6vzoYkGMApOnjM6bGjWzNZ1+1nnwg3GZscvjZUD8BnugCS1TVMewyu
	 4UnXD8tcDgarxN6aXionxuhs3AvStqtEFQAmTNH6VjBfRh44Gs+WVywHbIknzm38xApwP
	 CBnceZNYiF724O3XIh7jpNNjMK/tlopruB5jxMJMnjM1P9tVHz52wXuOXsZjXZmsmhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997195;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oI8DUYS7ZtHSXAkwufX527BzxAHKewHyFnMn8XoeqSI=;
	b=4XdmZZ5r/lO8tIGlp5DYYTXMMJ6AT5205mTL0LIZUkYF/h1R+YeePHwehEnQ9ivoU6BM
	 kpwGZwhuD8ExHh+eN5F7BPz0FIrRHg5ILl/syYEj9O9kNs7u8yAJcWwaVc9Zpm18eTOQv
	 sGTpwpPQ8KEJdzfUPmsUf67rRYY62fXkWXEnlmX9/BT6QcOyZRxQa5rqdRBm9AbNejosF
	 yPr8hwC4FDBT0oJMnz7DtUwM/S5oyqvP/ZA6PKthrfR9hiDZhY8NqRjiq8APCP67CALS9
	 jdapawwDaj7+tWpJpq8QjjgbaLlDpytLESJOuNsjouznvXu3t3NGb5K/GSA9yabrvTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KPs8oTz3;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E691606A31A
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Oct 2026 06:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E691606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KPs8oTz3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792997194; x=1824533194;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bnNBMuWYURu4sZsTBlAcVhWOXlkJpoC+BxtJHP3GwQc=;
  b=KPs8oTz3wEaZpcHIvlQ1HZHbVnferrnzFxGendiWtAFfgXXFTloBZEa7
   O4k83PuZENrWJST9eODKP6Bp6k6m1wJMSuTH6b5tv0jdVoey/T7bzIdyq
   to9nC4h9k0jQDH7JthVB0JCzOqcVQgDNpGLowFrN6Z7phkXcmSkbs0a+Q
   o20Jd7qKBW+ZM22tMo/8MERCW0vQl9f48/D5TkloqNZO796MrzU+GvxIb
   +RhgHKF8NGsCvNWhKSeBmr7Z2Oh+FS3nuVuIhphep8ZRCzpJbRGaWXQqZ
   SaruYI5JUrrJ/Emq+KYs22pJwDcJ+BHf3fFtPT21UjonCMJQ/H9s6Io8m
   w==;
X-CSE-ConnectionGUID: xTzerG9ySjKpWaAz2jjnIA==
X-CSE-MsgGUID: RvvZxfhwSKq7A+5S0l2bFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1554756"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1554756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 23:46:33 -0700
X-CSE-ConnectionGUID: F4dRCzIGSdORzwo4LvLxMQ==
X-CSE-MsgGUID: BLkRJ0rZQeKaRaJjjQUnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4204694"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2026 23:46:31 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLETV-000000003zv-0g5A;
	Mon, 26 Oct 2026 06:46:29 +0000
Date: Mon, 26 Oct 2026 07:46:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-stable 648/753] drivers/scsi/sg.c:294:1-17:
 ERROR: sg_fops: .read() can deadlock .write(); change nonseekable_open ->
 stream_open to fix.
Message-ID: <202610260709.0AaOI2kj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
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
CC: Suren Baghdasaryan <surenb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stab=
le
head:   183895979c441e52dbd651b388553b09eaa35cfa
commit: abdd54cef5fcf6e50367224663035386d9f6bfb3 [648/753] scsi: sg: conver=
t mmap hook to mmap_prepare and rework
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r2111-20261026 (https://download.01.org/0day-c=
i/archive/20261026/202610260709.0AaOI2kj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610260709.0AaOI2kj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/sg.c:294:1-17: ERROR: sg_fops: .read() can deadlock .write(=
); change nonseekable_open -> stream_open to fix.

vim +294 drivers/scsi/sg.c

035d12e658fba2 J=C3=B6rn Engel         2012-04-25  281 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  282  /* Returns 0 on success,=
 else a negated errno value */
^1da177e4c3f41 Linus Torvalds     2005-04-16  283  static int
^1da177e4c3f41 Linus Torvalds     2005-04-16  284  sg_open(struct inode *in=
ode, struct file *filp)
^1da177e4c3f41 Linus Torvalds     2005-04-16  285  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  286  	int dev =3D iminor(inod=
e);
^1da177e4c3f41 Linus Torvalds     2005-04-16  287  	int flags =3D filp->f_f=
lags;
d6b10348f93979 Mike Christie      2005-11-08  288  	struct request_queue *q;
d4e655c49f474d Alexander Wetzel   2024-04-01  289  	struct scsi_device *dev=
ice;
^1da177e4c3f41 Linus Torvalds     2005-04-16  290  	Sg_device *sdp;
^1da177e4c3f41 Linus Torvalds     2005-04-16  291  	Sg_fd *sfp;
^1da177e4c3f41 Linus Torvalds     2005-04-16  292  	int retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  293 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16 @294  	nonseekable_open(inode,=
 filp);
cc833acbee9db5 Douglas Gilbert    2014-06-25  295  	if ((flags & O_EXCL) &&=
 (O_RDONLY =3D=3D (flags & O_ACCMODE)))
cc833acbee9db5 Douglas Gilbert    2014-06-25  296  		return -EPERM; /* Can'=
t lock it with read only access */
^1da177e4c3f41 Linus Torvalds     2005-04-16  297  	sdp =3D sg_get_dev(dev);
cc833acbee9db5 Douglas Gilbert    2014-06-25  298  	if (IS_ERR(sdp))
cc833acbee9db5 Douglas Gilbert    2014-06-25  299  		return PTR_ERR(sdp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  300 =20
95e159d6dd808b Hannes Reinecke    2014-06-25  301  	SCSI_LOG_TIMEOUT(3, sg_=
printk(KERN_INFO, sdp,
95e159d6dd808b Hannes Reinecke    2014-06-25  302  				      "sg_open: flag=
s=3D0x%x\n", flags));
95e159d6dd808b Hannes Reinecke    2014-06-25  303 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  304  	/* This driver's module=
 count bumped by fops_get in <linux/fs.h> */
^1da177e4c3f41 Linus Torvalds     2005-04-16  305  	/* Prevent the device d=
river from vanishing while we sleep */
d4e655c49f474d Alexander Wetzel   2024-04-01  306  	device =3D sdp->device;
d4e655c49f474d Alexander Wetzel   2024-04-01  307  	retval =3D scsi_device_=
get(device);
c6517b7942fad6 Tony Battersby     2009-01-21  308  	if (retval)
c6517b7942fad6 Tony Battersby     2009-01-21  309  		goto sg_put;
^1da177e4c3f41 Linus Torvalds     2005-04-16  310 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  311  	/* scsi_block_when_proc=
essing_errors() may block so bypass
cc833acbee9db5 Douglas Gilbert    2014-06-25  312  	 * check if O_NONBLOCK.=
 Permits SCSI commands to be issued
cc833acbee9db5 Douglas Gilbert    2014-06-25  313  	 * during error recover=
y. Tread carefully. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  314  	if (!((flags & O_NONBLO=
CK) ||
d4e655c49f474d Alexander Wetzel   2024-04-01  315  	      scsi_block_when_p=
rocessing_errors(device))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  316  		retval =3D -ENXIO;
^1da177e4c3f41 Linus Torvalds     2005-04-16  317  		/* we are in error rec=
overy for this device */
4045de893f691f Bart Van Assche    2024-10-30  318  		goto sdp_put;
^1da177e4c3f41 Linus Torvalds     2005-04-16  319  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  320 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  321  	mutex_lock(&sdp->open_r=
el_lock);
cc833acbee9db5 Douglas Gilbert    2014-06-25  322  	if (flags & O_NONBLOCK)=
 {
065b4a2f5952df James Bottomley    2013-10-25  323  		if (flags & O_EXCL) {
cc833acbee9db5 Douglas Gilbert    2014-06-25  324  			if (sdp->open_cnt > 0=
) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  325  				retval =3D -EBUSY;
cc833acbee9db5 Douglas Gilbert    2014-06-25  326  				goto error_mutex_loc=
ked;
065b4a2f5952df James Bottomley    2013-10-25  327  			}
cc833acbee9db5 Douglas Gilbert    2014-06-25  328  		} else {
cc833acbee9db5 Douglas Gilbert    2014-06-25  329  			if (sdp->exclude) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  330  				retval =3D -EBUSY;
cc833acbee9db5 Douglas Gilbert    2014-06-25  331  				goto error_mutex_loc=
ked;
^1da177e4c3f41 Linus Torvalds     2005-04-16  332  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  333  		}
cc833acbee9db5 Douglas Gilbert    2014-06-25  334  	} else {
cc833acbee9db5 Douglas Gilbert    2014-06-25  335  		retval =3D open_wait(s=
dp, flags);
cc833acbee9db5 Douglas Gilbert    2014-06-25  336  		if (retval) /* -ERESTA=
RTSYS or -ENODEV */
cc833acbee9db5 Douglas Gilbert    2014-06-25  337  			goto error_mutex_lock=
ed;
bafc8ad82d482f James Bottomley    2013-10-25  338  	}
cc833acbee9db5 Douglas Gilbert    2014-06-25  339 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  340  	/* N.B. at this point w=
e are holding the open_rel_lock */
cc833acbee9db5 Douglas Gilbert    2014-06-25  341  	if (flags & O_EXCL)
cc833acbee9db5 Douglas Gilbert    2014-06-25  342  		sdp->exclude =3D true;
cc833acbee9db5 Douglas Gilbert    2014-06-25  343 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  344  	if (sdp->open_cnt < 1) =
{  /* no existing opens */
^1da177e4c3f41 Linus Torvalds     2005-04-16  345  		sdp->sgdebug =3D 0;
d4e655c49f474d Alexander Wetzel   2024-04-01  346  		q =3D device->request_=
queue;
8a78362c4eefc1 Martin K. Petersen 2010-02-26  347  		sdp->sg_tablesize =3D =
queue_max_segments(q);
^1da177e4c3f41 Linus Torvalds     2005-04-16  348  	}
95e159d6dd808b Hannes Reinecke    2014-06-25  349  	sfp =3D sg_add_sfp(sdp);
cc833acbee9db5 Douglas Gilbert    2014-06-25  350  	if (IS_ERR(sfp)) {
cc833acbee9db5 Douglas Gilbert    2014-06-25  351  		retval =3D PTR_ERR(sfp=
);
cc833acbee9db5 Douglas Gilbert    2014-06-25  352  		goto out_undo;
cc833acbee9db5 Douglas Gilbert    2014-06-25  353  	}
cc833acbee9db5 Douglas Gilbert    2014-06-25  354 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  355  	filp->private_data =3D =
sfp;
cc833acbee9db5 Douglas Gilbert    2014-06-25  356  	sdp->open_cnt++;
cc833acbee9db5 Douglas Gilbert    2014-06-25  357  	mutex_unlock(&sdp->open=
_rel_lock);
cc833acbee9db5 Douglas Gilbert    2014-06-25  358 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  359  	retval =3D 0;
cc833acbee9db5 Douglas Gilbert    2014-06-25  360  sg_put:
cc833acbee9db5 Douglas Gilbert    2014-06-25  361  	kref_put(&sdp->d_ref, s=
g_device_destroy);
cc833acbee9db5 Douglas Gilbert    2014-06-25  362  	return retval;
cc833acbee9db5 Douglas Gilbert    2014-06-25  363 =20
cc833acbee9db5 Douglas Gilbert    2014-06-25  364  out_undo:
c6517b7942fad6 Tony Battersby     2009-01-21  365  	if (flags & O_EXCL) {
cc833acbee9db5 Douglas Gilbert    2014-06-25  366  		sdp->exclude =3D false=
;   /* undo if error */
cc833acbee9db5 Douglas Gilbert    2014-06-25  367  		wake_up_interruptible(=
&sdp->open_wait);
065b4a2f5952df James Bottomley    2013-10-25  368  	}
cc833acbee9db5 Douglas Gilbert    2014-06-25  369  error_mutex_locked:
cc833acbee9db5 Douglas Gilbert    2014-06-25  370  	mutex_unlock(&sdp->open=
_rel_lock);
bc4f24014de58f Alan Stern         2010-06-17  371  sdp_put:
d4e655c49f474d Alexander Wetzel   2024-04-01  372  	kref_put(&sdp->d_ref, s=
g_device_destroy);
d4e655c49f474d Alexander Wetzel   2024-04-01  373  	scsi_device_put(device);
d4e655c49f474d Alexander Wetzel   2024-04-01  374  	return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  375  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  376 =20

:::::: The code at line 294 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
