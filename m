Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4183769FD
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426763; cv=none; b=QzftsVtfgyE7cGTOt6OLACCRgAcIsPBQB5ymGKtc0QP/0UTZ6AysV+0hAa1ZEfoya6sWcxDqdyWpdgKKhvQVFoGjfI6F7ogo7Tn2VINTfl5pife5p9JJB8vZyixQtHeBl3okvUyUC+VdnatbTMjFEzhakpB6iD9tii9mkAYTmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426763; c=relaxed/simple;
	bh=uVZ4ZyEmCKh2U/+anxxejUupufIv8Cgaq+KYPYNERr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J0PeWxntR8vjgYv8Uwi7Me69+HHiU+JE2PA+FTjpEvVlquCxXcBi0drwVafETtVrjnThP49CEqTMvZbpsUfIICvlCUaFcUoIm4Cw/A63EFwsubXY2q3h30Vc6ejz45gTvhApUhNtFWTkIQ9UBgcUiothJrrV4iVQ+tmGAE85ahY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVKqVlqM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVKqVlqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785426761; x=1816962761;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uVZ4ZyEmCKh2U/+anxxejUupufIv8Cgaq+KYPYNERr0=;
  b=JVKqVlqMRDc2p7Sb9KyJEjpCNwEGZVGHGKEpNWM3a8iIvlh+I35jO7Cp
   4ruWXzq/dWA0mzZI99ylcpoctyEIv9qOj43jIo3xqU/PyvNHbASZqczLS
   P6rB4GWEHhSCRInASx0cZv6TccrCiTkVTAfP7eJtsntZ4uR5ypE2CvoUB
   qPkdAvgB6mUHfb6PCagT2mS+CmzWAaRnSx0hWuAKZ2PyvHG3GDDyrnth+
   BdoHWqnOAAYKXZ8g+LlRmeR8A0EBBjZ/bQ9N6EPt/LgoUJkzMB38wpcMw
   Fv75nG/N+WxuO3pnFP3hfQU9IfKytYem+yoxFrgm3k1fIf40Svm1ohOMs
   w==;
X-CSE-ConnectionGUID: 3jFS7jH9Rf2AXGGGWe0//g==
X-CSE-MsgGUID: 6T91eCS1RcCc0JeLLAFzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103456772"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103456772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 08:52:40 -0700
X-CSE-ConnectionGUID: kmnZ2kSoR9Cn1pJs19pfQg==
X-CSE-MsgGUID: 5C5pshuYQ0udEKrOLuvU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256028029"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2026 08:52:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpT3k-00000000h3Z-19oY;
	Thu, 30 Jul 2026 15:52:36 +0000
Date: Thu, 30 Jul 2026 23:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/st.c:3943 st_ioctl() warn: inconsistent returns
 '&STp->lock'.
Message-ID: <202607302328.6Th0s3xj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: David Jeffery <djeffery@redhat.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: John Meneghini <jmeneghi@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   11028ab62899e4191e074ee364c712b77823a9c4
commit: b37d70c0df85e217a868ecdf535500ff926427ae scsi: st: Separate st-uniq=
ue ioctl handling from SCSI common ioctl handling
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20260730 (https://download.01.org/0day-ci/arc=
hive/20260730/202607302328.6Th0s3xj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b37d70c0df85 ("scsi: st: Separate st-unique ioctl handling from SC=
SI common ioctl handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607302328.6Th0s3xj-lkp@intel.com/

smatch warnings:
drivers/scsi/st.c:3943 st_ioctl() warn: inconsistent returns '&STp->lock'.

vim +3943 drivers/scsi/st.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3583 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3584  /* The ioctl command */
dba7688fc9037c Christoph Hellwig 2021-07-24  3585  static long st_ioctl(str=
uct file *file, unsigned int cmd_in, unsigned long arg)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3586  {
dba7688fc9037c Christoph Hellwig 2021-07-24  3587  	void __user *p =3D (voi=
d __user *)arg;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3588  	int i, cmd_nr, cmd_type=
, bt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3589  	int retval =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3590  	unsigned int blk;
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3591  	bool cmd_mtiocget;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3592  	struct scsi_tape *STp =
=3D file->private_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3593  	struct st_modedef *STm;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3594  	struct st_partstat *STp=
s;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3595 =20
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3596  	if (mutex_lock_interrup=
tible(&STp->lock))
^1da177e4c3f41 Linus Torvalds    2005-04-16  3597  		return -ERESTARTSYS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3598 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3599  	DEB(
^1da177e4c3f41 Linus Torvalds    2005-04-16  3600  	if (debugging && !STp->=
in_use) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3601  		st_printk(ST_DEB_MSG, =
STp, "Incorrect device.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3602  		retval =3D (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3603  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3604  	} ) /* end DEB */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3605 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3606  	STm =3D &(STp->modes[ST=
p->current_mode]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3607  	STps =3D &(STp->ps[STp-=
>partition]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3608 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3609  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3610  	 * If we are in the mid=
dle of error recovery, don't let anyone
^1da177e4c3f41 Linus Torvalds    2005-04-16  3611  	 * else try and use thi=
s device.  Also, if error recovery fails, it
^1da177e4c3f41 Linus Torvalds    2005-04-16  3612  	 * may try and take the=
 device offline, in which case all further
^1da177e4c3f41 Linus Torvalds    2005-04-16  3613  	 * access to the device=
 is prohibited.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3614  	 */
906d15fbd23c12 Christoph Hellwig 2014-10-11  3615  	retval =3D scsi_ioctl_b=
lock_when_processing_errors(STp->device, cmd_in,
83ff6fe8580a7c Al Viro           2008-03-02  3616  			file->f_flags & O_NDE=
LAY);
906d15fbd23c12 Christoph Hellwig 2014-10-11  3617  	if (retval)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3618  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3619 =20
b37d70c0df85e2 David Jeffery     2025-11-04  3620  	switch (cmd_in) {
b37d70c0df85e2 David Jeffery     2025-11-04  3621  	case MTIOCPOS:
b37d70c0df85e2 David Jeffery     2025-11-04  3622  	case MTIOCGET:
b37d70c0df85e2 David Jeffery     2025-11-04  3623  	case MTIOCTOP:
b37d70c0df85e2 David Jeffery     2025-11-04  3624  		break;
b37d70c0df85e2 David Jeffery     2025-11-04  3625  	default:
b37d70c0df85e2 David Jeffery     2025-11-04  3626  		return st_common_ioctl=
(STp, STm, file, cmd_in, arg);
b37d70c0df85e2 David Jeffery     2025-11-04  3627  	}
b37d70c0df85e2 David Jeffery     2025-11-04  3628 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3629  	cmd_type =3D _IOC_TYPE(=
cmd_in);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3630  	cmd_nr =3D _IOC_NR(cmd_=
in);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3631 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3632  	if (cmd_type =3D=3D _IO=
C_TYPE(MTIOCTOP) && cmd_nr =3D=3D _IOC_NR(MTIOCTOP)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3633  		struct mtop mtc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3634 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3635  		if (_IOC_SIZE(cmd_in) =
!=3D sizeof(mtc)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3636  			retval =3D (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3637  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3638  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3639 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3640  		i =3D copy_from_user(&=
mtc, p, sizeof(struct mtop));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3641  		if (i) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3642  			retval =3D (-EFAULT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3643  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3644  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3645 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3646  		if (mtc.mt_op =3D=3D M=
TSETDRVBUFFER && !capable(CAP_SYS_ADMIN)) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3647  			st_printk(KERN_WARNIN=
G, STp,
b30d8bca5b525b Hannes Reinecke   2014-06-25  3648  				  "MTSETDRVBUFFER on=
ly allowed for root.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3649  			retval =3D (-EPERM);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3650  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3651  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3652  		if (!STm->defined &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3653  		    (mtc.mt_op !=3D MT=
SETDRVBUFFER &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3654  		     (mtc.mt_count & M=
T_ST_OPTIONS) =3D=3D 0)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3655  			retval =3D (-ENXIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3656  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3657  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3658 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3659  		if (!STp->pos_unknown)=
 {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3660 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3661  			if (STps->eof =3D=3D =
ST_FM_HIT) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3662  				if (mtc.mt_op =3D=3D =
MTFSF || mtc.mt_op =3D=3D MTFSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3663                          =
            mtc.mt_op =3D=3D MTEOM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3664  					mtc.mt_count -=3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3665  					if (STps->drv_file =
>=3D 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3666  						STps->drv_file +=
=3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3667  				} else if (mtc.mt_op=
 =3D=3D MTBSF || mtc.mt_op =3D=3D MTBSFM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3668  					mtc.mt_count +=3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3669  					if (STps->drv_file =
>=3D 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3670  						STps->drv_file +=
=3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3671  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3672  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3673 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3674  			if (mtc.mt_op =3D=3D =
MTSEEK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3675  				/* Old position must=
 be restored if partition will be
^1da177e4c3f41 Linus Torvalds    2005-04-16  3676                          =
           changed */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3677  				i =3D !STp->can_part=
itions ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3678  				    (STp->new_partit=
ion !=3D STp->partition);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3679  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3680  				i =3D mtc.mt_op =3D=
=3D MTREW || mtc.mt_op =3D=3D MTOFFL ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3681  				    mtc.mt_op =3D=3D =
MTRETEN || mtc.mt_op =3D=3D MTEOM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3682  				    mtc.mt_op =3D=3D =
MTLOCK || mtc.mt_op =3D=3D MTLOAD ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3683  				    mtc.mt_op =3D=3D =
MTFSF || mtc.mt_op =3D=3D MTFSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3684  				    mtc.mt_op =3D=3D =
MTBSF || mtc.mt_op =3D=3D MTBSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3685  				    mtc.mt_op =3D=3D =
MTCOMPRESSION;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3686  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3687  			i =3D flush_buffer(ST=
p, i);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3688  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3689  				retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3690  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3691  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3692  			if (STps->rw =3D=3D S=
T_WRITING &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3693  			    (mtc.mt_op =3D=3D =
MTREW || mtc.mt_op =3D=3D MTOFFL ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3694  			     mtc.mt_op =3D=3D =
MTSEEK ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3695  			     mtc.mt_op =3D=3D =
MTBSF || mtc.mt_op =3D=3D MTBSFM)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3696  				i =3D st_int_ioctl(S=
Tp, MTWEOF, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3697  				if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3698  					retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3699  					goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3700  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3701  				if (mtc.mt_op =3D=3D =
MTBSF || mtc.mt_op =3D=3D MTBSFM)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3702  					mtc.mt_count++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3703  				STps->rw =3D ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3704  			     }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3705 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3706  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3707  			/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3708  			 * If there was a bus=
 reset, block further access
^1da177e4c3f41 Linus Torvalds    2005-04-16  3709  			 * to this device.  I=
f the user wants to rewind the tape,
^1da177e4c3f41 Linus Torvalds    2005-04-16  3710  			 * then reset the fla=
g and allow access again.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3711  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3712  			if (mtc.mt_op !=3D MT=
REW &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3713  			    mtc.mt_op !=3D MT=
OFFL &&
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3714  			    mtc.mt_op !=
=3D MTLOAD &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3715  			    mtc.mt_op !=3D MT=
RETEN &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3716  			    mtc.mt_op !=3D MT=
ERASE &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3717  			    mtc.mt_op !=3D MT=
SEEK &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3718  			    mtc.mt_op !=3D MT=
EOM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3719  				retval =3D (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3720  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3721  			}
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3722  			reset_state(STp)=
; /* Clears pos_unknown */
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3723 =20
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3724  			/* Fix the devic=
e settings after reset, ignore errors */
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3725  			if (mtc.mt_op =
=3D=3D MTREW || mtc.mt_op =3D=3D MTSEEK ||
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3726  				mtc.mt_op =3D=
=3D MTEOM) {
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3727  				if (STp->can_pa=
rtitions) {
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3728  					/* STp->new_pa=
rtition contains the
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3729  					 *  latest par=
tition set
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3730  					 */
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3731  					STp->partition=
 =3D 0;
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3732  					switch_partiti=
on(STp);
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3733  				}
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3734  				if (STp->densit=
y_changed)
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3735  					st_int_ioctl(S=
Tp, MTSETDENSITY, STp->changed_density);
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3736  				if (STp->blksiz=
e_changed)
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3737  					st_int_ioctl(S=
Tp, MTSETBLK, STp->changed_blksize);
7081dc75df7969 Kai M=C3=A4kisara      2025-01-20  3738  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3739  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3740 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3741  		if (mtc.mt_op !=3D MTN=
OP && mtc.mt_op !=3D MTSETBLK &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3742  		    mtc.mt_op !=3D MTS=
ETDENSITY && mtc.mt_op !=3D MTWSM &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3743  		    mtc.mt_op !=3D MTS=
ETDRVBUFFER && mtc.mt_op !=3D MTSETPART)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3744  			STps->rw =3D ST_IDLE;=
	/* Prevent automatic WEOF and fsf */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3745 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3746  		if (mtc.mt_op =3D=3D M=
TOFFL && STp->door_locked !=3D ST_UNLOCKED)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3747  			do_door_lock(STp, 0);=
	/* Ignore result! */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3748 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3749  		if (mtc.mt_op =3D=3D M=
TSETDRVBUFFER &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3750  		    (mtc.mt_count & MT=
_ST_OPTIONS) !=3D 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3751  			retval =3D st_set_opt=
ions(STp, mtc.mt_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3752  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3753  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3754 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3755  		if (mtc.mt_op =3D=3D M=
TSETPART) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3756  			if (!STp->can_partiti=
ons ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3757  			    mtc.mt_count < 0 =
|| mtc.mt_count >=3D ST_NBR_PARTITIONS) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3758  				retval =3D (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3759  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3760  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3761  			if (mtc.mt_count >=3D =
STp->nbr_partitions &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3762  			    (STp->nbr_partiti=
ons =3D nbr_partitions(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3763  				retval =3D (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3764  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3765  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3766  			if (mtc.mt_count >=3D =
STp->nbr_partitions) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3767  				retval =3D (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3768  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3769  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3770  			STp->new_partition =
=3D mtc.mt_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3771  			retval =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3772  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3773  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3774 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3775  		if (mtc.mt_op =3D=3D M=
TMKPART) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3776  			if (!STp->can_partiti=
ons) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3777  				retval =3D (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3778  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3779  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3780  			i =3D do_load_unload(=
STp, file, 1);
8038e6456a3e6f Kai Makisara      2016-02-09  3781  			if (i < 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3782  				retval =3D i;
8038e6456a3e6f Kai Makisara      2016-02-09  3783  				goto out;
8038e6456a3e6f Kai Makisara      2016-02-09  3784  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3785  			i =3D partition_tape(=
STp, mtc.mt_count);
8038e6456a3e6f Kai Makisara      2016-02-09  3786  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3787  				retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3788  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3789  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3790  			for (i =3D 0; i < ST_=
NBR_PARTITIONS; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3791  				STp->ps[i].rw =3D ST=
_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3792  				STp->ps[i].at_sm =3D =
0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3793  				STp->ps[i].last_bloc=
k_valid =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3794  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3795  			STp->partition =3D ST=
p->new_partition =3D 0;
8038e6456a3e6f Kai Makisara      2016-02-09  3796  			STp->nbr_partitions =
=3D mtc.mt_count !=3D 0 ? 2 : 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3797  			STps->drv_block =3D S=
Tps->drv_file =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3798  			retval =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3799  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3800  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3801 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3802  		if (mtc.mt_op =3D=3D M=
TSEEK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3803  			i =3D set_location(ST=
p, mtc.mt_count, STp->new_partition, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3804  			if (!STp->can_partiti=
ons)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3805  				STp->ps[0].rw =3D ST=
_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3806  			retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3807  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3808  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3809 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3810  		if (mtc.mt_op =3D=3D M=
TUNLOAD || mtc.mt_op =3D=3D MTOFFL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3811  			retval =3D do_load_un=
load(STp, file, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3812  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3813  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3814 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3815  		if (mtc.mt_op =3D=3D M=
TLOAD) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3816  			retval =3D do_load_un=
load(STp, file, max(1, mtc.mt_count));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3817  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3818  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3819 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3820  		if (mtc.mt_op =3D=3D M=
TLOCK || mtc.mt_op =3D=3D MTUNLOCK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3821  			retval =3D do_door_lo=
ck(STp, (mtc.mt_op =3D=3D MTLOCK));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3822  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3823  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3824 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3825  		if (STp->can_partition=
s && STp->ready =3D=3D ST_READY &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3826  		    (i =3D switch_part=
ition(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3827  			retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3828  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3829  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3830 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3831  		if (mtc.mt_op =3D=3D M=
TCOMPRESSION)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3832  			retval =3D st_compres=
sion(STp, (mtc.mt_count & 1));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3833  		else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3834  			retval =3D st_int_ioc=
tl(STp, mtc.mt_op, mtc.mt_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3835  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3836  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3837  	if (!STm->defined) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3838  		retval =3D (-ENXIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3839  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3840  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3841 =20
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3842  	cmd_mtiocget =3D c=
md_type =3D=3D _IOC_TYPE(MTIOCGET) && cmd_nr =3D=3D _IOC_NR(MTIOCGET);
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3843 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3844  	if ((i =3D flush_buffer=
(STp, 0)) < 0) {
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3845  		if (cmd_mtiocget =
&& STp->pos_unknown) {
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3846  			/* flush fails -=
> modify status accordingly */
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3847  			reset_state(STp);
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3848  			STp->pos_unknown=
 =3D 1;
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3849  		} else { /* retur=
n error */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3850  			retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3851  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3852  		}
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3853  	} else { /* flush_=
buffer succeeds */
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3854  		if (STp->can_part=
itions) {
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3855  			i =3D switch_par=
tition(STp);
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3856  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3857  				retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3858  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3859  			}
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3860  		}
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3861  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3862 =20
0b120edb37dc9d Kai M=C3=A4kisara      2024-11-06  3863  	if (cmd_mtiocget) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3864  		struct mtget mt_status;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3865 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3866  		if (_IOC_SIZE(cmd_in) =
!=3D sizeof(struct mtget)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3867  			 retval =3D (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3868  			 goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3869  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3870 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3871  		mt_status.mt_type =3D =
STp->tape_type;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3872  		mt_status.mt_dsreg =3D
^1da177e4c3f41 Linus Torvalds    2005-04-16  3873  		    ((STp->block_size =
<< MT_ST_BLKSIZE_SHIFT) & MT_ST_BLKSIZE_MASK) |
^1da177e4c3f41 Linus Torvalds    2005-04-16  3874  		    ((STp->density << =
MT_ST_DENSITY_SHIFT) & MT_ST_DENSITY_MASK);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3875  		mt_status.mt_blkno =3D =
STps->drv_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3876  		mt_status.mt_fileno =
=3D STps->drv_file;
5bb2d6179d1a80 Kai M=C3=A4kisara      2024-11-06  3877  		if (STp->block_si=
ze !=3D 0 && mt_status.mt_blkno >=3D 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3878  			if (STps->rw =3D=3D S=
T_WRITING)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3879  				mt_status.mt_blkno +=
=3D
^1da177e4c3f41 Linus Torvalds    2005-04-16  3880  				    (STp->buffer)->b=
uffer_bytes / STp->block_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3881  			else if (STps->rw =3D=
=3D ST_READING)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3882  				mt_status.mt_blkno -=
=3D
^1da177e4c3f41 Linus Torvalds    2005-04-16  3883                          =
                ((STp->buffer)->buffer_bytes +
^1da177e4c3f41 Linus Torvalds    2005-04-16  3884                          =
                 STp->block_size - 1) / STp->block_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3885  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3886 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3887  		mt_status.mt_gstat =3D =
0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3888  		if (STp->drv_write_pro=
t)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3889  			mt_status.mt_gstat |=
=3D GMT_WR_PROT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3890  		if (mt_status.mt_blkno=
 =3D=3D 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3891  			if (mt_status.mt_file=
no =3D=3D 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3892  				mt_status.mt_gstat |=
=3D GMT_BOT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3893  			else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3894  				mt_status.mt_gstat |=
=3D GMT_EOF(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3895  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3896  		mt_status.mt_erreg =3D =
(STp->recover_reg << MT_ST_SOFTERR_SHIFT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3897  		mt_status.mt_resid =3D =
STp->partition;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3898  		if (STps->eof =3D=3D S=
T_EOM_OK || STps->eof =3D=3D ST_EOM_ERROR)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3899  			mt_status.mt_gstat |=
=3D GMT_EOT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3900  		else if (STps->eof >=
=3D ST_EOM_OK)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3901  			mt_status.mt_gstat |=
=3D GMT_EOD(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3902  		if (STp->density =3D=
=3D 1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3903  			mt_status.mt_gstat |=
=3D GMT_D_800(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3904  		else if (STp->density =
=3D=3D 2)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3905  			mt_status.mt_gstat |=
=3D GMT_D_1600(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3906  		else if (STp->density =
=3D=3D 3)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3907  			mt_status.mt_gstat |=
=3D GMT_D_6250(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3908  		if (STp->ready =3D=3D =
ST_READY)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3909  			mt_status.mt_gstat |=
=3D GMT_ONLINE(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3910  		if (STp->ready =3D=3D =
ST_NO_TAPE)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3911  			mt_status.mt_gstat |=
=3D GMT_DR_OPEN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3912  		if (STps->at_sm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3913  			mt_status.mt_gstat |=
=3D GMT_SM(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3914  		if (STm->do_async_writ=
es ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3915                      (STm=
->do_buffer_writes && STp->block_size !=3D 0) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3916  		    STp->drv_buffer !=
=3D 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3917  			mt_status.mt_gstat |=
=3D GMT_IM_REP_EN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3918  		if (STp->cleaning_req)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3919  			mt_status.mt_gstat |=
=3D GMT_CLN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3920 =20
1207045da5a7c9 Arnd Bergmann     2018-09-07  3921  		retval =3D put_user_mt=
get(p, &mt_status);
1207045da5a7c9 Arnd Bergmann     2018-09-07  3922  		if (retval)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3923  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3924 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  3925  		STp->recover_reg =3D 0=
;		/* Clear after read */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3926  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3927  	}			/* End of MTIOCGET =
*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  3928  	if (cmd_type =3D=3D _IO=
C_TYPE(MTIOCPOS) && cmd_nr =3D=3D _IOC_NR(MTIOCPOS)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3929  		struct mtpos mt_pos;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3930  		if (_IOC_SIZE(cmd_in) =
!=3D sizeof(struct mtpos)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3931  			 retval =3D (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3932  			 goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3933  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3934  		if ((i =3D get_locatio=
n(STp, &blk, &bt, 0)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3935  			retval =3D i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3936  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3937  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3938  		mt_pos.mt_blkno =3D bl=
k;
1207045da5a7c9 Arnd Bergmann     2018-09-07  3939  		retval =3D put_user_mt=
pos(p, &mt_pos);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3940  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3941   out:
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3942  	mutex_unlock(&STp->lock=
);
^1da177e4c3f41 Linus Torvalds    2005-04-16 @3943  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3944  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3945 =20

:::::: The code at line 3943 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
