Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC62D1931
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324517; cv=none; b=eVOVzRz7yzNst6FBx1tcjXkSt32YkgHH6v/ZPTPaiaJ/SGNo1aL++Pnw+LRQlyOcDpBU2zBzBYWexv4wC/qo+4gw33sAuTIviUV5w6TNkEID13xTSB+saWiHSLvEM3S4ne4L45tpdY+pll0I2TSn63QHYNTkNHFV5Be3cNFkeSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324517; c=relaxed/simple;
	bh=kkNT+zreZtsqyF6Kt3rvxmlQIEPUYqUCbrlSjJb6PhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nb/ZWqMU8v1j3/+wpGADRq4b5GK4JyZJTY89LMQ0R/4X1rQNIJt+x/FQ9oLX4ggi4YQ6vFFHsvJ79lKQFKwGfGZLbtawTHTM6Hc8o/ubAFbDP2R1yfVAgIh63h5XWgm7LmMllR5lpQldtwrbSGFRmZAW025HBc+OWGA6rNzHI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6unA2Aj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6unA2Aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776324516; x=1807860516;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kkNT+zreZtsqyF6Kt3rvxmlQIEPUYqUCbrlSjJb6PhU=;
  b=W6unA2AjNlop1Ieh2w1GgZkb6+jkW8QavMdR1ikKnyXazO6fco8f2lqO
   mH3fwLfUvSS218psZzAVmloduqiTytES03P8m1fJ54xA9HHO8/yL+GUy9
   NpGijIJcrw5Zvx+HM/YUWg3i7l6jPbdagtnNYvU8ludCZC15zIy4Mjdz8
   VX1+4alcvO1u7ie5unng0kO4QkZqpsSzuBaq34Opuz5Leo8WWERUGt3pB
   5cbcOGeLQLpXhBAzKv3AGWDF4JdaWzJqBvLUeqxOS3uxlWY6XZNbkN2tM
   1FKBqT0cI2bhsct0hGu6iNZYn/tfI7TnYDDLHNmkJ4IP06daTyYyoGyrp
   A==;
X-CSE-ConnectionGUID: bRokqm57SuWU4lrA1Tyndg==
X-CSE-MsgGUID: 6ABCf6aGRD+QlmNtmsKFCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77335520"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77335520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 00:28:35 -0700
X-CSE-ConnectionGUID: ltwKvja9SmKoIJEF8vlPjA==
X-CSE-MsgGUID: EUB8B54wSH6MMUuSoryhNw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2026 00:28:31 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDH9K-000000001Na-0wAE;
	Thu, 16 Apr 2026 07:28:30 +0000
Date: Thu, 16 Apr 2026 15:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/st.c:3943 st_ioctl() warn: inconsistent returns
 '&STp->lock'.
Message-ID: <202604161523.JFDbH5wq-lkp@intel.com>
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
head:   1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2
commit: b37d70c0df85e217a868ecdf535500ff926427ae scsi: st: Separate st-uniq=
ue ioctl handling from SCSI common ioctl handling
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r071-20260416 (https://download.01.org/0day-ci/a=
rchive/20260416/202604161523.JFDbH5wq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b37d70c0df85 ("scsi: st: Separate st-unique ioctl handling from SC=
SI common ioctl handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604161523.JFDbH5wq-lkp@intel.com/

smatch warnings:
drivers/scsi/st.c:3943 st_ioctl() warn: inconsistent returns '&STp->lock'.

vim +3943 drivers/scsi/st.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  3583 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3584  /* The ioctl command */
dba7688fc9037c8 Christoph Hellwig 2021-07-24  3585  static long st_ioctl(st=
ruct file *file, unsigned int cmd_in, unsigned long arg)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3586  {
dba7688fc9037c8 Christoph Hellwig 2021-07-24  3587  	void __user *p =3D (vo=
id __user *)arg;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3588  	int i, cmd_nr, cmd_typ=
e, bt;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3589  	int retval =3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3590  	unsigned int blk;
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3591  	bool cmd_mtiocget;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3592  	struct scsi_tape *STp =
=3D file->private_data;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3593  	struct st_modedef *STm;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3594  	struct st_partstat *ST=
ps;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3595 =20
28f85009e0cf6a5 Matthias Kaehlcke 2007-07-29  3596  	if (mutex_lock_interru=
ptible(&STp->lock))
^1da177e4c3f415 Linus Torvalds    2005-04-16  3597  		return -ERESTARTSYS;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3598 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3599  	DEB(
^1da177e4c3f415 Linus Torvalds    2005-04-16  3600  	if (debugging && !STp-=
>in_use) {
b30d8bca5b525ba Hannes Reinecke   2014-06-25  3601  		st_printk(ST_DEB_MSG,=
 STp, "Incorrect device.\n");
^1da177e4c3f415 Linus Torvalds    2005-04-16  3602  		retval =3D (-EIO);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3603  		goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3604  	} ) /* end DEB */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3605 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3606  	STm =3D &(STp->modes[S=
Tp->current_mode]);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3607  	STps =3D &(STp->ps[STp=
->partition]);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3608 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3609  	/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  3610  	 * If we are in the mi=
ddle of error recovery, don't let anyone
^1da177e4c3f415 Linus Torvalds    2005-04-16  3611  	 * else try and use th=
is device.  Also, if error recovery fails, it
^1da177e4c3f415 Linus Torvalds    2005-04-16  3612  	 * may try and take th=
e device offline, in which case all further
^1da177e4c3f415 Linus Torvalds    2005-04-16  3613  	 * access to the devic=
e is prohibited.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3614  	 */
906d15fbd23c126 Christoph Hellwig 2014-10-11  3615  	retval =3D scsi_ioctl_=
block_when_processing_errors(STp->device, cmd_in,
83ff6fe8580a7c8 Al Viro           2008-03-02  3616  			file->f_flags & O_ND=
ELAY);
906d15fbd23c126 Christoph Hellwig 2014-10-11  3617  	if (retval)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3618  		goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3619 =20
b37d70c0df85e21 David Jeffery     2025-11-04  3620  	switch (cmd_in) {
b37d70c0df85e21 David Jeffery     2025-11-04  3621  	case MTIOCPOS:
b37d70c0df85e21 David Jeffery     2025-11-04  3622  	case MTIOCGET:
b37d70c0df85e21 David Jeffery     2025-11-04  3623  	case MTIOCTOP:
b37d70c0df85e21 David Jeffery     2025-11-04  3624  		break;
b37d70c0df85e21 David Jeffery     2025-11-04  3625  	default:
b37d70c0df85e21 David Jeffery     2025-11-04  3626  		return st_common_ioct=
l(STp, STm, file, cmd_in, arg);
b37d70c0df85e21 David Jeffery     2025-11-04  3627  	}
b37d70c0df85e21 David Jeffery     2025-11-04  3628 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3629  	cmd_type =3D _IOC_TYPE=
(cmd_in);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3630  	cmd_nr =3D _IOC_NR(cmd=
_in);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3631 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3632  	if (cmd_type =3D=3D _I=
OC_TYPE(MTIOCTOP) && cmd_nr =3D=3D _IOC_NR(MTIOCTOP)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3633  		struct mtop mtc;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3634 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3635  		if (_IOC_SIZE(cmd_in)=
 !=3D sizeof(mtc)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3636  			retval =3D (-EINVAL);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3637  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3638  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3639 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3640  		i =3D copy_from_user(=
&mtc, p, sizeof(struct mtop));
^1da177e4c3f415 Linus Torvalds    2005-04-16  3641  		if (i) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3642  			retval =3D (-EFAULT);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3643  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3644  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3645 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3646  		if (mtc.mt_op =3D=3D =
MTSETDRVBUFFER && !capable(CAP_SYS_ADMIN)) {
b30d8bca5b525ba Hannes Reinecke   2014-06-25  3647  			st_printk(KERN_WARNI=
NG, STp,
b30d8bca5b525ba Hannes Reinecke   2014-06-25  3648  				  "MTSETDRVBUFFER o=
nly allowed for root.\n");
^1da177e4c3f415 Linus Torvalds    2005-04-16  3649  			retval =3D (-EPERM);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3650  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3651  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3652  		if (!STm->defined &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3653  		    (mtc.mt_op !=3D M=
TSETDRVBUFFER &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3654  		     (mtc.mt_count & =
MT_ST_OPTIONS) =3D=3D 0)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3655  			retval =3D (-ENXIO);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3656  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3657  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3658 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3659  		if (!STp->pos_unknown=
) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3660 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3661  			if (STps->eof =3D=3D =
ST_FM_HIT) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3662  				if (mtc.mt_op =3D=
=3D MTFSF || mtc.mt_op =3D=3D MTFSFM ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3663                         =
             mtc.mt_op =3D=3D MTEOM) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3664  					mtc.mt_count -=3D =
1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3665  					if (STps->drv_file=
 >=3D 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3666  						STps->drv_file +=
=3D 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3667  				} else if (mtc.mt_o=
p =3D=3D MTBSF || mtc.mt_op =3D=3D MTBSFM) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3668  					mtc.mt_count +=3D =
1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3669  					if (STps->drv_file=
 >=3D 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3670  						STps->drv_file +=
=3D 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3671  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3672  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3673 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3674  			if (mtc.mt_op =3D=3D =
MTSEEK) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3675  				/* Old position mus=
t be restored if partition will be
^1da177e4c3f415 Linus Torvalds    2005-04-16  3676                         =
            changed */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3677  				i =3D !STp->can_par=
titions ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3678  				    (STp->new_parti=
tion !=3D STp->partition);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3679  			} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3680  				i =3D mtc.mt_op =3D=
=3D MTREW || mtc.mt_op =3D=3D MTOFFL ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3681  				    mtc.mt_op =3D=
=3D MTRETEN || mtc.mt_op =3D=3D MTEOM ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3682  				    mtc.mt_op =3D=
=3D MTLOCK || mtc.mt_op =3D=3D MTLOAD ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3683  				    mtc.mt_op =3D=
=3D MTFSF || mtc.mt_op =3D=3D MTFSFM ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3684  				    mtc.mt_op =3D=
=3D MTBSF || mtc.mt_op =3D=3D MTBSFM ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3685  				    mtc.mt_op =3D=
=3D MTCOMPRESSION;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3686  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3687  			i =3D flush_buffer(S=
Tp, i);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3688  			if (i < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3689  				retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3690  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3691  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3692  			if (STps->rw =3D=3D =
ST_WRITING &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3693  			    (mtc.mt_op =3D=
=3D MTREW || mtc.mt_op =3D=3D MTOFFL ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3694  			     mtc.mt_op =3D=
=3D MTSEEK ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3695  			     mtc.mt_op =3D=
=3D MTBSF || mtc.mt_op =3D=3D MTBSFM)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3696  				i =3D st_int_ioctl(=
STp, MTWEOF, 1);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3697  				if (i < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3698  					retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3699  					goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3700  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3701  				if (mtc.mt_op =3D=
=3D MTBSF || mtc.mt_op =3D=3D MTBSFM)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3702  					mtc.mt_count++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3703  				STps->rw =3D ST_IDL=
E;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3704  			     }
^1da177e4c3f415 Linus Torvalds    2005-04-16  3705 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3706  		} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3707  			/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  3708  			 * If there was a bu=
s reset, block further access
^1da177e4c3f415 Linus Torvalds    2005-04-16  3709  			 * to this device.  =
If the user wants to rewind the tape,
^1da177e4c3f415 Linus Torvalds    2005-04-16  3710  			 * then reset the fl=
ag and allow access again.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3711  			 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3712  			if (mtc.mt_op !=3D M=
TREW &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3713  			    mtc.mt_op !=3D M=
TOFFL &&
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3714  			    mtc.mt_op !=
=3D MTLOAD &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3715  			    mtc.mt_op !=3D M=
TRETEN &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3716  			    mtc.mt_op !=3D M=
TERASE &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3717  			    mtc.mt_op !=3D M=
TSEEK &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3718  			    mtc.mt_op !=3D M=
TEOM) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3719  				retval =3D (-EIO);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3720  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3721  			}
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3722  			reset_state(STp=
); /* Clears pos_unknown */
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3723 =20
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3724  			/* Fix the devi=
ce settings after reset, ignore errors */
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3725  			if (mtc.mt_op =
=3D=3D MTREW || mtc.mt_op =3D=3D MTSEEK ||
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3726  				mtc.mt_op =3D=
=3D MTEOM) {
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3727  				if (STp->can_p=
artitions) {
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3728  					/* STp->new_p=
artition contains the
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3729  					 *  latest pa=
rtition set
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3730  					 */
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3731  					STp->partitio=
n =3D 0;
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3732  					switch_partit=
ion(STp);
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3733  				}
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3734  				if (STp->densi=
ty_changed)
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3735  					st_int_ioctl(=
STp, MTSETDENSITY, STp->changed_density);
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3736  				if (STp->blksi=
ze_changed)
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3737  					st_int_ioctl(=
STp, MTSETBLK, STp->changed_blksize);
7081dc75df79696 Kai M=C3=A4kisara      2025-01-20  3738  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3739  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3740 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3741  		if (mtc.mt_op !=3D MT=
NOP && mtc.mt_op !=3D MTSETBLK &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3742  		    mtc.mt_op !=3D MT=
SETDENSITY && mtc.mt_op !=3D MTWSM &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3743  		    mtc.mt_op !=3D MT=
SETDRVBUFFER && mtc.mt_op !=3D MTSETPART)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3744  			STps->rw =3D ST_IDLE=
;	/* Prevent automatic WEOF and fsf */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3745 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3746  		if (mtc.mt_op =3D=3D =
MTOFFL && STp->door_locked !=3D ST_UNLOCKED)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3747  			do_door_lock(STp, 0)=
;	/* Ignore result! */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3748 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3749  		if (mtc.mt_op =3D=3D =
MTSETDRVBUFFER &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3750  		    (mtc.mt_count & M=
T_ST_OPTIONS) !=3D 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3751  			retval =3D st_set_op=
tions(STp, mtc.mt_count);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3752  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3753  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3754 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3755  		if (mtc.mt_op =3D=3D =
MTSETPART) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3756  			if (!STp->can_partit=
ions ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3757  			    mtc.mt_count < 0=
 || mtc.mt_count >=3D ST_NBR_PARTITIONS) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3758  				retval =3D (-EINVAL=
);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3759  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3760  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3761  			if (mtc.mt_count >=
=3D STp->nbr_partitions &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3762  			    (STp->nbr_partit=
ions =3D nbr_partitions(STp)) < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3763  				retval =3D (-EIO);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3764  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3765  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3766  			if (mtc.mt_count >=
=3D STp->nbr_partitions) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3767  				retval =3D (-EINVAL=
);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3768  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3769  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3770  			STp->new_partition =
=3D mtc.mt_count;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3771  			retval =3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3772  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3773  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3774 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3775  		if (mtc.mt_op =3D=3D =
MTMKPART) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3776  			if (!STp->can_partit=
ions) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3777  				retval =3D (-EINVAL=
);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3778  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3779  			}
8038e6456a3e6f5 Kai Makisara      2016-02-09  3780  			i =3D do_load_unload=
(STp, file, 1);
8038e6456a3e6f5 Kai Makisara      2016-02-09  3781  			if (i < 0) {
8038e6456a3e6f5 Kai Makisara      2016-02-09  3782  				retval =3D i;
8038e6456a3e6f5 Kai Makisara      2016-02-09  3783  				goto out;
8038e6456a3e6f5 Kai Makisara      2016-02-09  3784  			}
8038e6456a3e6f5 Kai Makisara      2016-02-09  3785  			i =3D partition_tape=
(STp, mtc.mt_count);
8038e6456a3e6f5 Kai Makisara      2016-02-09  3786  			if (i < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3787  				retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3788  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3789  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3790  			for (i =3D 0; i < ST=
_NBR_PARTITIONS; i++) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3791  				STp->ps[i].rw =3D S=
T_IDLE;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3792  				STp->ps[i].at_sm =
=3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3793  				STp->ps[i].last_blo=
ck_valid =3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3794  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3795  			STp->partition =3D S=
Tp->new_partition =3D 0;
8038e6456a3e6f5 Kai Makisara      2016-02-09  3796  			STp->nbr_partitions =
=3D mtc.mt_count !=3D 0 ? 2 : 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3797  			STps->drv_block =3D =
STps->drv_file =3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3798  			retval =3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3799  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3800  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3801 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3802  		if (mtc.mt_op =3D=3D =
MTSEEK) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3803  			i =3D set_location(S=
Tp, mtc.mt_count, STp->new_partition, 0);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3804  			if (!STp->can_partit=
ions)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3805  				STp->ps[0].rw =3D S=
T_IDLE;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3806  			retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3807  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3808  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3809 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3810  		if (mtc.mt_op =3D=3D =
MTUNLOAD || mtc.mt_op =3D=3D MTOFFL) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3811  			retval =3D do_load_u=
nload(STp, file, 0);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3812  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3813  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3814 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3815  		if (mtc.mt_op =3D=3D =
MTLOAD) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3816  			retval =3D do_load_u=
nload(STp, file, max(1, mtc.mt_count));
^1da177e4c3f415 Linus Torvalds    2005-04-16  3817  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3818  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3819 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3820  		if (mtc.mt_op =3D=3D =
MTLOCK || mtc.mt_op =3D=3D MTUNLOCK) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3821  			retval =3D do_door_l=
ock(STp, (mtc.mt_op =3D=3D MTLOCK));
^1da177e4c3f415 Linus Torvalds    2005-04-16  3822  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3823  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3824 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3825  		if (STp->can_partitio=
ns && STp->ready =3D=3D ST_READY &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  3826  		    (i =3D switch_par=
tition(STp)) < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3827  			retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3828  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3829  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3830 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3831  		if (mtc.mt_op =3D=3D =
MTCOMPRESSION)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3832  			retval =3D st_compre=
ssion(STp, (mtc.mt_count & 1));
^1da177e4c3f415 Linus Torvalds    2005-04-16  3833  		else
^1da177e4c3f415 Linus Torvalds    2005-04-16  3834  			retval =3D st_int_io=
ctl(STp, mtc.mt_op, mtc.mt_count);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3835  		goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3836  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3837  	if (!STm->defined) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3838  		retval =3D (-ENXIO);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3839  		goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3840  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3841 =20
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3842  	cmd_mtiocget =3D =
cmd_type =3D=3D _IOC_TYPE(MTIOCGET) && cmd_nr =3D=3D _IOC_NR(MTIOCGET);
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3843 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3844  	if ((i =3D flush_buffe=
r(STp, 0)) < 0) {
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3845  		if (cmd_mtiocget=
 && STp->pos_unknown) {
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3846  			/* flush fails =
-> modify status accordingly */
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3847  			reset_state(STp=
);
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3848  			STp->pos_unknow=
n =3D 1;
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3849  		} else { /* retu=
rn error */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3850  			retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3851  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3852  		}
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3853  	} else { /* flush=
_buffer succeeds */
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3854  		if (STp->can_par=
titions) {
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3855  			i =3D switch_pa=
rtition(STp);
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3856  			if (i < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3857  				retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3858  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3859  			}
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3860  		}
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3861  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3862 =20
0b120edb37dc9dd Kai M=C3=A4kisara      2024-11-06  3863  	if (cmd_mtiocget)=
 {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3864  		struct mtget mt_statu=
s;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3865 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3866  		if (_IOC_SIZE(cmd_in)=
 !=3D sizeof(struct mtget)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3867  			 retval =3D (-EINVAL=
);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3868  			 goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3869  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3870 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3871  		mt_status.mt_type =3D =
STp->tape_type;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3872  		mt_status.mt_dsreg =
=3D
^1da177e4c3f415 Linus Torvalds    2005-04-16  3873  		    ((STp->block_size=
 << MT_ST_BLKSIZE_SHIFT) & MT_ST_BLKSIZE_MASK) |
^1da177e4c3f415 Linus Torvalds    2005-04-16  3874  		    ((STp->density <<=
 MT_ST_DENSITY_SHIFT) & MT_ST_DENSITY_MASK);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3875  		mt_status.mt_blkno =
=3D STps->drv_block;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3876  		mt_status.mt_fileno =
=3D STps->drv_file;
5bb2d6179d1a803 Kai M=C3=A4kisara      2024-11-06  3877  		if (STp->block_s=
ize !=3D 0 && mt_status.mt_blkno >=3D 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3878  			if (STps->rw =3D=3D =
ST_WRITING)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3879  				mt_status.mt_blkno =
+=3D
^1da177e4c3f415 Linus Torvalds    2005-04-16  3880  				    (STp->buffer)->=
buffer_bytes / STp->block_size;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3881  			else if (STps->rw =
=3D=3D ST_READING)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3882  				mt_status.mt_blkno =
-=3D
^1da177e4c3f415 Linus Torvalds    2005-04-16  3883                         =
                 ((STp->buffer)->buffer_bytes +
^1da177e4c3f415 Linus Torvalds    2005-04-16  3884                         =
                  STp->block_size - 1) / STp->block_size;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3885  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3886 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3887  		mt_status.mt_gstat =
=3D 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3888  		if (STp->drv_write_pr=
ot)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3889  			mt_status.mt_gstat |=
=3D GMT_WR_PROT(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3890  		if (mt_status.mt_blkn=
o =3D=3D 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3891  			if (mt_status.mt_fil=
eno =3D=3D 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3892  				mt_status.mt_gstat =
|=3D GMT_BOT(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3893  			else
^1da177e4c3f415 Linus Torvalds    2005-04-16  3894  				mt_status.mt_gstat =
|=3D GMT_EOF(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3895  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3896  		mt_status.mt_erreg =
=3D (STp->recover_reg << MT_ST_SOFTERR_SHIFT);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3897  		mt_status.mt_resid =
=3D STp->partition;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3898  		if (STps->eof =3D=3D =
ST_EOM_OK || STps->eof =3D=3D ST_EOM_ERROR)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3899  			mt_status.mt_gstat |=
=3D GMT_EOT(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3900  		else if (STps->eof >=
=3D ST_EOM_OK)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3901  			mt_status.mt_gstat |=
=3D GMT_EOD(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3902  		if (STp->density =3D=
=3D 1)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3903  			mt_status.mt_gstat |=
=3D GMT_D_800(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3904  		else if (STp->density=
 =3D=3D 2)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3905  			mt_status.mt_gstat |=
=3D GMT_D_1600(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3906  		else if (STp->density=
 =3D=3D 3)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3907  			mt_status.mt_gstat |=
=3D GMT_D_6250(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3908  		if (STp->ready =3D=3D =
ST_READY)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3909  			mt_status.mt_gstat |=
=3D GMT_ONLINE(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3910  		if (STp->ready =3D=3D =
ST_NO_TAPE)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3911  			mt_status.mt_gstat |=
=3D GMT_DR_OPEN(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3912  		if (STps->at_sm)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3913  			mt_status.mt_gstat |=
=3D GMT_SM(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3914  		if (STm->do_async_wri=
tes ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3915                      (ST=
m->do_buffer_writes && STp->block_size !=3D 0) ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  3916  		    STp->drv_buffer !=
=3D 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3917  			mt_status.mt_gstat |=
=3D GMT_IM_REP_EN(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3918  		if (STp->cleaning_req)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3919  			mt_status.mt_gstat |=
=3D GMT_CLN(0xffffffff);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3920 =20
1207045da5a7c94 Arnd Bergmann     2018-09-07  3921  		retval =3D put_user_m=
tget(p, &mt_status);
1207045da5a7c94 Arnd Bergmann     2018-09-07  3922  		if (retval)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3923  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3924 =20
^1da177e4c3f415 Linus Torvalds    2005-04-16  3925  		STp->recover_reg =3D =
0;		/* Clear after read */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3926  		goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3927  	}			/* End of MTIOCGET=
 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3928  	if (cmd_type =3D=3D _I=
OC_TYPE(MTIOCPOS) && cmd_nr =3D=3D _IOC_NR(MTIOCPOS)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3929  		struct mtpos mt_pos;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3930  		if (_IOC_SIZE(cmd_in)=
 !=3D sizeof(struct mtpos)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3931  			 retval =3D (-EINVAL=
);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3932  			 goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3933  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3934  		if ((i =3D get_locati=
on(STp, &blk, &bt, 0)) < 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3935  			retval =3D i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3936  			goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3937  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3938  		mt_pos.mt_blkno =3D b=
lk;
1207045da5a7c94 Arnd Bergmann     2018-09-07  3939  		retval =3D put_user_m=
tpos(p, &mt_pos);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3940  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3941   out:
28f85009e0cf6a5 Matthias Kaehlcke 2007-07-29  3942  	mutex_unlock(&STp->loc=
k);
^1da177e4c3f415 Linus Torvalds    2005-04-16 @3943  	return retval;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3944  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  3945 =20

:::::: The code at line 3943 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
