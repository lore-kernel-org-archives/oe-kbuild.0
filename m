Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8593B2FFE
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321452; cv=none; b=ioTE7AwuGohliu0MEvxDxv7kaPtDL8pP90iQOGCwe53Sr/Bc5bkwNBXJ6AnonAAXPnumAelWPkv0Nj5XPl49LXPn71v08pfMUCDuEFC92MhYGDIRYICa9ofwko7uibUQxhLG82kn1l4IQ/FxBUsg6pewU6o1OHBoOAFuLcK481U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321452; c=relaxed/simple;
	bh=A4+JHA5pxHwmKgrldDXm0JNT+ttteE3Am2z4QI3ubGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LdzJNByingaPAeZ6GmM7KIgacUAxzAjY9lMW+8GnhkvoxUrCUpwKGRHsJL2m8PRonH+zLBor8y6P/fjXk+201eZQhANvsYQh2GwV4mCYQObKPAyXBL7kY/Khk1O0kKC3JJ9/9O2pl6+XQ9ffoadvhkH83yBDHOQrrFSdq7M/Jx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2N+Pc4W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2N+Pc4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773321448; x=1804857448;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A4+JHA5pxHwmKgrldDXm0JNT+ttteE3Am2z4QI3ubGI=;
  b=a2N+Pc4WJ6X4DMTxj7Q8aSSAMnsp5Mh8V7jou/JvIPHr7fcTyl3sMGpE
   QeRF4U8UlBeMSSxqAGBJgv+DFYr3zBbkx2RHo0d1mu4iruK0DH0gtHalG
   7XVN5NIoy5b6X76psrhJWB/GrvDMj9dhMvVqbCL/wd6DBtVnWRHs4cdbM
   u/YNKDjdpvL1cgEk6Que2LXNZgwCbwfggC7PsbIOy76ApTzteJy1eOwlE
   ScEMWN0gwpfB5CM59AsZVY+XPgThvzDCRWlLvjhUQx8IeEcFyB35qh4/4
   djsUUd9OIhmO34pBkjpxPz5omWrD1y3d13os7WVi+r+iaU9AjzFP+D4NP
   Q==;
X-CSE-ConnectionGUID: FBwNbU1TQbqtvgQ4/DIGIQ==
X-CSE-MsgGUID: klqMtwneTEeCooI0uSUV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78302958"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="78302958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 06:17:27 -0700
X-CSE-ConnectionGUID: ph1nvInmSVmYH2GFvU23TA==
X-CSE-MsgGUID: UH0dmzjsTheYa6hlzm+8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220880073"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2026 06:17:26 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0fuk-000000002Uh-3ye6;
	Thu, 12 Mar 2026 13:17:22 +0000
Date: Thu, 12 Mar 2026 21:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 156/471] drivers/usb/class/cdc-wdm.c:607
 wdm_read() warn: potential spectre issue 'desc->ubuf' [r]
Message-ID: <202603122157.zBxKC9bE-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_=
iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 6b52f3009edf69a19d0243bdbb614e940180ba24 [156/471] usb: class: conv=
ert to read/write iterators
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/=
archive/20260312/202603122157.zBxKC9bE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603122157.zBxKC9bE-lkp@intel.com/

smatch warnings:
drivers/usb/class/cdc-wdm.c:607 wdm_read() warn: potential spectre issue 'd=
esc->ubuf' [r]

vim +607 drivers/usb/class/cdc-wdm.c

8dd5cd5395b9007 Bj=C3=B8rn Mork          2013-12-20  523 =20
6b52f3009edf69a Jens Axboe          2024-04-11  524  static ssize_t wdm_rea=
d(struct kiocb *iocb, struct iov_iter *to)
afba937e540c902 Oliver Neukum       2008-05-13  525  {
711c68b3c0f7a92 Ben Hutchings       2012-02-12  526  	int rv, cntr;
afba937e540c902 Oliver Neukum       2008-05-13  527  	int i =3D 0;
6b52f3009edf69a Jens Axboe          2024-04-11  528  	struct wdm_device *de=
sc =3D iocb->ki_filp->private_data;
6b52f3009edf69a Jens Axboe          2024-04-11  529  	size_t count =3D iov_=
iter_count(to);
afba937e540c902 Oliver Neukum       2008-05-13  530 =20
e8537bd2c4f325a Bj=C3=B8rn Mork          2012-01-16  531  	rv =3D mutex_loc=
k_interruptible(&desc->rlock); /*concurrent reads */
afba937e540c902 Oliver Neukum       2008-05-13  532  	if (rv < 0)
afba937e540c902 Oliver Neukum       2008-05-13  533  		return -ERESTARTSYS;
afba937e540c902 Oliver Neukum       2008-05-13  534 =20
6aa7de059173a98 Mark Rutland        2017-10-23  535  	cntr =3D READ_ONCE(de=
sc->length);
711c68b3c0f7a92 Ben Hutchings       2012-02-12  536  	if (cntr =3D=3D 0) {
afba937e540c902 Oliver Neukum       2008-05-13  537  		desc->read =3D 0;
afba937e540c902 Oliver Neukum       2008-05-13  538  retry:
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  539  		if (test_bit(WDM_DIS=
CONNECTING, &desc->flags)) {
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  540  			rv =3D -ENODEV;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  541  			goto err;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  542  		}
c0f5ecee4e74166 Oliver Neukum       2013-03-12  543  		if (test_bit(WDM_OVE=
RFLOW, &desc->flags)) {
c0f5ecee4e74166 Oliver Neukum       2013-03-12  544  			clear_bit(WDM_OVERF=
LOW, &desc->flags);
c0f5ecee4e74166 Oliver Neukum       2013-03-12  545  			rv =3D -ENOBUFS;
c0f5ecee4e74166 Oliver Neukum       2013-03-12  546  			goto err;
c0f5ecee4e74166 Oliver Neukum       2013-03-12  547  		}
afba937e540c902 Oliver Neukum       2008-05-13  548  		i++;
6b52f3009edf69a Jens Axboe          2024-04-11  549  		if (iocb->ki_filp->f=
_flags & O_NONBLOCK) {
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  550  			if (!test_bit(WDM_R=
EAD, &desc->flags)) {
53b7f7b53d83727 Gustavo A. R. Silva 2017-02-14  551  				rv =3D -EAGAIN;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  552  				goto err;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  553  			}
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  554  			rv =3D 0;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  555  		} else {
afba937e540c902 Oliver Neukum       2008-05-13  556  			rv =3D wait_event_i=
nterruptible(desc->wait,
afba937e540c902 Oliver Neukum       2008-05-13  557  				test_bit(WDM_READ,=
 &desc->flags));
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  558  		}
afba937e540c902 Oliver Neukum       2008-05-13  559 =20
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  560  		/* may have happened=
 while we slept */
17d80d562fd78a0 Oliver Neukum       2008-06-24  561  		if (test_bit(WDM_DIS=
CONNECTING, &desc->flags)) {
17d80d562fd78a0 Oliver Neukum       2008-06-24  562  			rv =3D -ENODEV;
17d80d562fd78a0 Oliver Neukum       2008-06-24  563  			goto err;
17d80d562fd78a0 Oliver Neukum       2008-06-24  564  		}
88044202756925a Bj=C3=B8rn Mork          2012-02-10  565  		if (test_bit(WD=
M_RESETTING, &desc->flags)) {
88044202756925a Bj=C3=B8rn Mork          2012-02-10  566  			rv =3D -EIO;
88044202756925a Bj=C3=B8rn Mork          2012-02-10  567  			goto err;
88044202756925a Bj=C3=B8rn Mork          2012-02-10  568  		}
17d80d562fd78a0 Oliver Neukum       2008-06-24  569  		usb_mark_last_busy(i=
nterface_to_usbdev(desc->intf));
afba937e540c902 Oliver Neukum       2008-05-13  570  		if (rv < 0) {
afba937e540c902 Oliver Neukum       2008-05-13  571  			rv =3D -ERESTARTSYS;
afba937e540c902 Oliver Neukum       2008-05-13  572  			goto err;
afba937e540c902 Oliver Neukum       2008-05-13  573  		}
afba937e540c902 Oliver Neukum       2008-05-13  574 =20
afba937e540c902 Oliver Neukum       2008-05-13  575  		spin_lock_irq(&desc-=
>iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  576 =20
afba937e540c902 Oliver Neukum       2008-05-13  577  		if (desc->rerr) { /*=
 read completed, error happened */
85e8a0b9a3565c8 Oliver Neukum       2015-03-23  578  			rv =3D usb_translat=
e_errors(desc->rerr);
afba937e540c902 Oliver Neukum       2008-05-13  579  			desc->rerr =3D 0;
afba937e540c902 Oliver Neukum       2008-05-13  580  			spin_unlock_irq(&de=
sc->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  581  			goto err;
afba937e540c902 Oliver Neukum       2008-05-13  582  		}
afba937e540c902 Oliver Neukum       2008-05-13  583  		/*
afba937e540c902 Oliver Neukum       2008-05-13  584  		 * recheck whether w=
e've lost the race
afba937e540c902 Oliver Neukum       2008-05-13  585  		 * against the compl=
etion handler
afba937e540c902 Oliver Neukum       2008-05-13  586  		 */
afba937e540c902 Oliver Neukum       2008-05-13  587  		if (!test_bit(WDM_RE=
AD, &desc->flags)) { /* lost race */
afba937e540c902 Oliver Neukum       2008-05-13  588  			spin_unlock_irq(&de=
sc->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  589  			goto retry;
afba937e540c902 Oliver Neukum       2008-05-13  590  		}
c0f5ecee4e74166 Oliver Neukum       2013-03-12  591 =20
711c68b3c0f7a92 Ben Hutchings       2012-02-12  592  		cntr =3D desc->lengt=
h;
afba937e540c902 Oliver Neukum       2008-05-13  593  		spin_unlock_irq(&des=
c->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  594  	}
afba937e540c902 Oliver Neukum       2008-05-13  595 =20
711c68b3c0f7a92 Ben Hutchings       2012-02-12  596  	if (cntr > count)
711c68b3c0f7a92 Ben Hutchings       2012-02-12  597  		cntr =3D count;
6b52f3009edf69a Jens Axboe          2024-04-11  598  	rv =3D !copy_to_iter_=
full(desc->ubuf, cntr, to);
6b52f3009edf69a Jens Axboe          2024-04-11  599  	if (rv) {
afba937e540c902 Oliver Neukum       2008-05-13  600  		rv =3D -EFAULT;
afba937e540c902 Oliver Neukum       2008-05-13  601  		goto err;
afba937e540c902 Oliver Neukum       2008-05-13  602  	}
afba937e540c902 Oliver Neukum       2008-05-13  603 =20
711c68b3c0f7a92 Ben Hutchings       2012-02-12  604  	spin_lock_irq(&desc->=
iuspin);
711c68b3c0f7a92 Ben Hutchings       2012-02-12  605 =20
afba937e540c902 Oliver Neukum       2008-05-13  606  	for (i =3D 0; i < des=
c->length - cntr; i++)
afba937e540c902 Oliver Neukum       2008-05-13 @607  		desc->ubuf[i] =3D de=
sc->ubuf[i + cntr];
afba937e540c902 Oliver Neukum       2008-05-13  608 =20
afba937e540c902 Oliver Neukum       2008-05-13  609  	desc->length -=3D cnt=
r;
87d65e54b6d5ff6 Oliver Neukum       2008-06-19  610  	/* in case we had out=
standing data */
c1da59dad0ebd3f Robert Foss         2016-08-09  611  	if (!desc->length) {
c1da59dad0ebd3f Robert Foss         2016-08-09  612  		clear_bit(WDM_READ, =
&desc->flags);
c1da59dad0ebd3f Robert Foss         2016-08-09  613  		service_outstanding_=
interrupt(desc);
c1da59dad0ebd3f Robert Foss         2016-08-09  614  	}
73e06865ead1bec Greg Suarez         2013-10-29  615  	spin_unlock_irq(&desc=
->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  616  	rv =3D cntr;
afba937e540c902 Oliver Neukum       2008-05-13  617 =20
afba937e540c902 Oliver Neukum       2008-05-13  618  err:
e8537bd2c4f325a Bj=C3=B8rn Mork          2012-01-16  619  	mutex_unlock(&de=
sc->rlock);
afba937e540c902 Oliver Neukum       2008-05-13  620  	return rv;
afba937e540c902 Oliver Neukum       2008-05-13  621  }
afba937e540c902 Oliver Neukum       2008-05-13  622 =20

:::::: The code at line 607 was first introduced by commit
:::::: afba937e540c902c989cd516fd97ea0c8499bb27 USB: CDC WDM driver

:::::: TO: Oliver Neukum <oliver@neukum.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
