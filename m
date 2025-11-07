Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AAB1DA60D
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 05:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762492285; cv=none; b=hQ1UesBMxvcjdKchH/hLTuymFaIb3X5Whvx/M4OwP6FxXgJZop2ixYzQuU0vZrDjqfAFhSlnQbRS3pPZh5mDiuNbwz9ZVBtqPqnxreWT/QWqLZjDGpUqo7c6kTjsEyf5TIbyXcztOGyEEK3GPytDwQTUeyUkUqLQUHPS2CGkI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762492285; c=relaxed/simple;
	bh=17NKO+cGAHVFjoCqgILeRxlJ1rUveYn3ZqCGK6j66Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a30MGSVx57rOFrHvTtu6YzkHDhGKJt2OYZIdmqNlVT2H1AKYbGu0O1T2cjQD4jz/eolGgyPEHkmyJ+54r4HF7TQpbukCKoSmQGZtehIy1Dspfe8lEOJUxeBpHv0wgJ1iiXOY6UxBJH2ChrmDV4C7BkizHGCD21mRG/lv/yiM9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmOpzQEm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmOpzQEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762492282; x=1794028282;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=17NKO+cGAHVFjoCqgILeRxlJ1rUveYn3ZqCGK6j66Vg=;
  b=LmOpzQEmUOmxGePwNemEQQq6DTmbChqeeDhvuuh8Ac5zhGT5iCV7Ss6k
   dshBxmwgt5Av3ilAYnirthiMoAeXku98xc5OsCCKLSYIusbZcdIQG2Yzc
   7zjV7uD8szJIj/OihwVnyHskvm+jd6zElBAapmR+iT92S3Syg5tOOzOwk
   x520wTzLLPUAsL4fR6eckbyRB9RljD7VbSCjqBk4K/t8k41MKbjtO6PJs
   KgHIjcYRTf16u1RdEQ5gHXAL2Equg3niOWYiJ0WW1FUJhJDfoicvxFus4
   SPtezgdoZJqf+JCPy082VTtXrU5a57y2+daljboElUjs+JGjSKUQrz1tL
   w==;
X-CSE-ConnectionGUID: vKx+/uFxQCSEN2bdOFjo6Q==
X-CSE-MsgGUID: 0TInFx2gQD6VcTnonqm4hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63652302"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="63652302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 21:11:21 -0800
X-CSE-ConnectionGUID: oXZXKv7LTIyVHXZcvOXLKQ==
X-CSE-MsgGUID: qI2louF5TCyY+cnmUCdmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="193119810"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 21:11:20 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHEkn-000UjE-2K;
	Fri, 07 Nov 2025 05:11:17 +0000
Date: Fri, 7 Nov 2025 13:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] st: separate st-unique ioctl handling from scsi
 common ioctl  handling
Message-ID: <202511071217.Q9FXQ96m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251104154709.6436-1-djeffery@redhat.com>
References: <20251104154709.6436-1-djeffery@redhat.com>
TO: David Jeffery <djeffery@redhat.com>
TO: "Kai Mäkisara" <Kai.Makisara@kolumbus.fi>
TO: linux-scsi@vger.kernel.org
CC: David Jeffery <djeffery@redhat.com>
CC: Laurence Oberman <loberman@redhat.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Jeffery/st-skip-buffer-flush-for-information-ioctls/20251104-235445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20251104154709.6436-1-djeffery%40redhat.com
patch subject: [PATCH 1/2] st: separate st-unique ioctl handling from scsi common ioctl  handling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071217.Q9FXQ96m-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511071217.Q9FXQ96m-lkp@intel.com/

smatch warnings:
drivers/scsi/st.c:3943 st_ioctl() warn: inconsistent returns '&STp->lock'.

vim +3943 drivers/scsi/st.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3583  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3584  /* The ioctl command */
dba7688fc9037c Christoph Hellwig 2021-07-24  3585  static long st_ioctl(struct file *file, unsigned int cmd_in, unsigned long arg)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3586  {
dba7688fc9037c Christoph Hellwig 2021-07-24  3587  	void __user *p = (void __user *)arg;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3588  	int i, cmd_nr, cmd_type, bt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3589  	int retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3590  	unsigned int blk;
0b120edb37dc9d Kai Mäkisara      2024-11-06  3591  	bool cmd_mtiocget;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3592  	struct scsi_tape *STp = file->private_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3593  	struct st_modedef *STm;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3594  	struct st_partstat *STps;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3595  
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3596  	if (mutex_lock_interruptible(&STp->lock))
^1da177e4c3f41 Linus Torvalds    2005-04-16  3597  		return -ERESTARTSYS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3598  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3599  	DEB(
^1da177e4c3f41 Linus Torvalds    2005-04-16  3600  	if (debugging && !STp->in_use) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3601  		st_printk(ST_DEB_MSG, STp, "Incorrect device.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3602  		retval = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3603  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3604  	} ) /* end DEB */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3605  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3606  	STm = &(STp->modes[STp->current_mode]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3607  	STps = &(STp->ps[STp->partition]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3608  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3609  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3610  	 * If we are in the middle of error recovery, don't let anyone
^1da177e4c3f41 Linus Torvalds    2005-04-16  3611  	 * else try and use this device.  Also, if error recovery fails, it
^1da177e4c3f41 Linus Torvalds    2005-04-16  3612  	 * may try and take the device offline, in which case all further
^1da177e4c3f41 Linus Torvalds    2005-04-16  3613  	 * access to the device is prohibited.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3614  	 */
906d15fbd23c12 Christoph Hellwig 2014-10-11  3615  	retval = scsi_ioctl_block_when_processing_errors(STp->device, cmd_in,
83ff6fe8580a7c Al Viro           2008-03-02  3616  			file->f_flags & O_NDELAY);
906d15fbd23c12 Christoph Hellwig 2014-10-11  3617  	if (retval)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3618  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3619  
224689682b4c19 David Jeffery     2025-11-04  3620  	switch(cmd_in) {
224689682b4c19 David Jeffery     2025-11-04  3621  	case MTIOCPOS:
224689682b4c19 David Jeffery     2025-11-04  3622  	case MTIOCGET:
224689682b4c19 David Jeffery     2025-11-04  3623  	case MTIOCTOP:
224689682b4c19 David Jeffery     2025-11-04  3624  		break;
224689682b4c19 David Jeffery     2025-11-04  3625  	default:
224689682b4c19 David Jeffery     2025-11-04  3626  		return st_common_ioctl(STp, STm, file, cmd_in, arg);
224689682b4c19 David Jeffery     2025-11-04  3627  	}
224689682b4c19 David Jeffery     2025-11-04  3628  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3629  	cmd_type = _IOC_TYPE(cmd_in);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3630  	cmd_nr = _IOC_NR(cmd_in);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3631  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3632  	if (cmd_type == _IOC_TYPE(MTIOCTOP) && cmd_nr == _IOC_NR(MTIOCTOP)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3633  		struct mtop mtc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3634  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3635  		if (_IOC_SIZE(cmd_in) != sizeof(mtc)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3636  			retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3637  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3638  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3639  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3640  		i = copy_from_user(&mtc, p, sizeof(struct mtop));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3641  		if (i) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3642  			retval = (-EFAULT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3643  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3644  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3645  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3646  		if (mtc.mt_op == MTSETDRVBUFFER && !capable(CAP_SYS_ADMIN)) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3647  			st_printk(KERN_WARNING, STp,
b30d8bca5b525b Hannes Reinecke   2014-06-25  3648  				  "MTSETDRVBUFFER only allowed for root.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3649  			retval = (-EPERM);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3650  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3651  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3652  		if (!STm->defined &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3653  		    (mtc.mt_op != MTSETDRVBUFFER &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3654  		     (mtc.mt_count & MT_ST_OPTIONS) == 0)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3655  			retval = (-ENXIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3656  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3657  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3658  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3659  		if (!STp->pos_unknown) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3660  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3661  			if (STps->eof == ST_FM_HIT) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3662  				if (mtc.mt_op == MTFSF || mtc.mt_op == MTFSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3663                                      mtc.mt_op == MTEOM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3664  					mtc.mt_count -= 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3665  					if (STps->drv_file >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3666  						STps->drv_file += 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3667  				} else if (mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3668  					mtc.mt_count += 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3669  					if (STps->drv_file >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3670  						STps->drv_file += 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3671  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3672  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3673  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3674  			if (mtc.mt_op == MTSEEK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3675  				/* Old position must be restored if partition will be
^1da177e4c3f41 Linus Torvalds    2005-04-16  3676                                     changed */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3677  				i = !STp->can_partitions ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3678  				    (STp->new_partition != STp->partition);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3679  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3680  				i = mtc.mt_op == MTREW || mtc.mt_op == MTOFFL ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3681  				    mtc.mt_op == MTRETEN || mtc.mt_op == MTEOM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3682  				    mtc.mt_op == MTLOCK || mtc.mt_op == MTLOAD ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3683  				    mtc.mt_op == MTFSF || mtc.mt_op == MTFSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3684  				    mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3685  				    mtc.mt_op == MTCOMPRESSION;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3686  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3687  			i = flush_buffer(STp, i);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3688  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3689  				retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3690  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3691  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3692  			if (STps->rw == ST_WRITING &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3693  			    (mtc.mt_op == MTREW || mtc.mt_op == MTOFFL ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3694  			     mtc.mt_op == MTSEEK ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3695  			     mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3696  				i = st_int_ioctl(STp, MTWEOF, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3697  				if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3698  					retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3699  					goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3700  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3701  				if (mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3702  					mtc.mt_count++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3703  				STps->rw = ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3704  			     }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3705  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3706  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3707  			/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3708  			 * If there was a bus reset, block further access
^1da177e4c3f41 Linus Torvalds    2005-04-16  3709  			 * to this device.  If the user wants to rewind the tape,
^1da177e4c3f41 Linus Torvalds    2005-04-16  3710  			 * then reset the flag and allow access again.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3711  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3712  			if (mtc.mt_op != MTREW &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3713  			    mtc.mt_op != MTOFFL &&
0b120edb37dc9d Kai Mäkisara      2024-11-06  3714  			    mtc.mt_op != MTLOAD &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3715  			    mtc.mt_op != MTRETEN &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3716  			    mtc.mt_op != MTERASE &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3717  			    mtc.mt_op != MTSEEK &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3718  			    mtc.mt_op != MTEOM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3719  				retval = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3720  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3721  			}
7081dc75df7969 Kai Mäkisara      2025-01-20  3722  			reset_state(STp); /* Clears pos_unknown */
7081dc75df7969 Kai Mäkisara      2025-01-20  3723  
7081dc75df7969 Kai Mäkisara      2025-01-20  3724  			/* Fix the device settings after reset, ignore errors */
7081dc75df7969 Kai Mäkisara      2025-01-20  3725  			if (mtc.mt_op == MTREW || mtc.mt_op == MTSEEK ||
7081dc75df7969 Kai Mäkisara      2025-01-20  3726  				mtc.mt_op == MTEOM) {
7081dc75df7969 Kai Mäkisara      2025-01-20  3727  				if (STp->can_partitions) {
7081dc75df7969 Kai Mäkisara      2025-01-20  3728  					/* STp->new_partition contains the
7081dc75df7969 Kai Mäkisara      2025-01-20  3729  					 *  latest partition set
7081dc75df7969 Kai Mäkisara      2025-01-20  3730  					 */
7081dc75df7969 Kai Mäkisara      2025-01-20  3731  					STp->partition = 0;
7081dc75df7969 Kai Mäkisara      2025-01-20  3732  					switch_partition(STp);
7081dc75df7969 Kai Mäkisara      2025-01-20  3733  				}
7081dc75df7969 Kai Mäkisara      2025-01-20  3734  				if (STp->density_changed)
7081dc75df7969 Kai Mäkisara      2025-01-20  3735  					st_int_ioctl(STp, MTSETDENSITY, STp->changed_density);
7081dc75df7969 Kai Mäkisara      2025-01-20  3736  				if (STp->blksize_changed)
7081dc75df7969 Kai Mäkisara      2025-01-20  3737  					st_int_ioctl(STp, MTSETBLK, STp->changed_blksize);
7081dc75df7969 Kai Mäkisara      2025-01-20  3738  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3739  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3740  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3741  		if (mtc.mt_op != MTNOP && mtc.mt_op != MTSETBLK &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3742  		    mtc.mt_op != MTSETDENSITY && mtc.mt_op != MTWSM &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3743  		    mtc.mt_op != MTSETDRVBUFFER && mtc.mt_op != MTSETPART)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3744  			STps->rw = ST_IDLE;	/* Prevent automatic WEOF and fsf */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3745  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3746  		if (mtc.mt_op == MTOFFL && STp->door_locked != ST_UNLOCKED)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3747  			do_door_lock(STp, 0);	/* Ignore result! */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3748  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3749  		if (mtc.mt_op == MTSETDRVBUFFER &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3750  		    (mtc.mt_count & MT_ST_OPTIONS) != 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3751  			retval = st_set_options(STp, mtc.mt_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3752  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3753  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3754  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3755  		if (mtc.mt_op == MTSETPART) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3756  			if (!STp->can_partitions ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3757  			    mtc.mt_count < 0 || mtc.mt_count >= ST_NBR_PARTITIONS) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3758  				retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3759  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3760  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3761  			if (mtc.mt_count >= STp->nbr_partitions &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3762  			    (STp->nbr_partitions = nbr_partitions(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3763  				retval = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3764  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3765  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3766  			if (mtc.mt_count >= STp->nbr_partitions) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3767  				retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3768  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3769  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3770  			STp->new_partition = mtc.mt_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3771  			retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3772  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3773  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3774  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3775  		if (mtc.mt_op == MTMKPART) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3776  			if (!STp->can_partitions) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3777  				retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3778  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3779  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3780  			i = do_load_unload(STp, file, 1);
8038e6456a3e6f Kai Makisara      2016-02-09  3781  			if (i < 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3782  				retval = i;
8038e6456a3e6f Kai Makisara      2016-02-09  3783  				goto out;
8038e6456a3e6f Kai Makisara      2016-02-09  3784  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3785  			i = partition_tape(STp, mtc.mt_count);
8038e6456a3e6f Kai Makisara      2016-02-09  3786  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3787  				retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3788  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3789  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3790  			for (i = 0; i < ST_NBR_PARTITIONS; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3791  				STp->ps[i].rw = ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3792  				STp->ps[i].at_sm = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3793  				STp->ps[i].last_block_valid = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3794  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3795  			STp->partition = STp->new_partition = 0;
8038e6456a3e6f Kai Makisara      2016-02-09  3796  			STp->nbr_partitions = mtc.mt_count != 0 ? 2 : 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3797  			STps->drv_block = STps->drv_file = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3798  			retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3799  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3800  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3801  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3802  		if (mtc.mt_op == MTSEEK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3803  			i = set_location(STp, mtc.mt_count, STp->new_partition, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3804  			if (!STp->can_partitions)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3805  				STp->ps[0].rw = ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3806  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3807  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3808  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3809  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3810  		if (mtc.mt_op == MTUNLOAD || mtc.mt_op == MTOFFL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3811  			retval = do_load_unload(STp, file, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3812  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3813  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3814  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3815  		if (mtc.mt_op == MTLOAD) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3816  			retval = do_load_unload(STp, file, max(1, mtc.mt_count));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3817  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3818  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3819  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3820  		if (mtc.mt_op == MTLOCK || mtc.mt_op == MTUNLOCK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3821  			retval = do_door_lock(STp, (mtc.mt_op == MTLOCK));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3822  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3823  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3824  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3825  		if (STp->can_partitions && STp->ready == ST_READY &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3826  		    (i = switch_partition(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3827  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3828  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3829  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3830  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3831  		if (mtc.mt_op == MTCOMPRESSION)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3832  			retval = st_compression(STp, (mtc.mt_count & 1));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3833  		else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3834  			retval = st_int_ioctl(STp, mtc.mt_op, mtc.mt_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3835  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3836  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3837  	if (!STm->defined) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3838  		retval = (-ENXIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3839  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3840  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3841  
0b120edb37dc9d Kai Mäkisara      2024-11-06  3842  	cmd_mtiocget = cmd_type == _IOC_TYPE(MTIOCGET) && cmd_nr == _IOC_NR(MTIOCGET);
0b120edb37dc9d Kai Mäkisara      2024-11-06  3843  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3844  	if ((i = flush_buffer(STp, 0)) < 0) {
0b120edb37dc9d Kai Mäkisara      2024-11-06  3845  		if (cmd_mtiocget && STp->pos_unknown) {
0b120edb37dc9d Kai Mäkisara      2024-11-06  3846  			/* flush fails -> modify status accordingly */
0b120edb37dc9d Kai Mäkisara      2024-11-06  3847  			reset_state(STp);
0b120edb37dc9d Kai Mäkisara      2024-11-06  3848  			STp->pos_unknown = 1;
0b120edb37dc9d Kai Mäkisara      2024-11-06  3849  		} else { /* return error */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3850  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3851  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3852  		}
0b120edb37dc9d Kai Mäkisara      2024-11-06  3853  	} else { /* flush_buffer succeeds */
0b120edb37dc9d Kai Mäkisara      2024-11-06  3854  		if (STp->can_partitions) {
0b120edb37dc9d Kai Mäkisara      2024-11-06  3855  			i = switch_partition(STp);
0b120edb37dc9d Kai Mäkisara      2024-11-06  3856  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3857  				retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3858  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3859  			}
0b120edb37dc9d Kai Mäkisara      2024-11-06  3860  		}
0b120edb37dc9d Kai Mäkisara      2024-11-06  3861  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3862  
0b120edb37dc9d Kai Mäkisara      2024-11-06  3863  	if (cmd_mtiocget) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3864  		struct mtget mt_status;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3865  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3866  		if (_IOC_SIZE(cmd_in) != sizeof(struct mtget)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3867  			 retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3868  			 goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3869  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3870  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3871  		mt_status.mt_type = STp->tape_type;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3872  		mt_status.mt_dsreg =
^1da177e4c3f41 Linus Torvalds    2005-04-16  3873  		    ((STp->block_size << MT_ST_BLKSIZE_SHIFT) & MT_ST_BLKSIZE_MASK) |
^1da177e4c3f41 Linus Torvalds    2005-04-16  3874  		    ((STp->density << MT_ST_DENSITY_SHIFT) & MT_ST_DENSITY_MASK);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3875  		mt_status.mt_blkno = STps->drv_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3876  		mt_status.mt_fileno = STps->drv_file;
5bb2d6179d1a80 Kai Mäkisara      2024-11-06  3877  		if (STp->block_size != 0 && mt_status.mt_blkno >= 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3878  			if (STps->rw == ST_WRITING)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3879  				mt_status.mt_blkno +=
^1da177e4c3f41 Linus Torvalds    2005-04-16  3880  				    (STp->buffer)->buffer_bytes / STp->block_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3881  			else if (STps->rw == ST_READING)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3882  				mt_status.mt_blkno -=
^1da177e4c3f41 Linus Torvalds    2005-04-16  3883                                          ((STp->buffer)->buffer_bytes +
^1da177e4c3f41 Linus Torvalds    2005-04-16  3884                                           STp->block_size - 1) / STp->block_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3885  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3886  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3887  		mt_status.mt_gstat = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3888  		if (STp->drv_write_prot)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3889  			mt_status.mt_gstat |= GMT_WR_PROT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3890  		if (mt_status.mt_blkno == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3891  			if (mt_status.mt_fileno == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3892  				mt_status.mt_gstat |= GMT_BOT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3893  			else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3894  				mt_status.mt_gstat |= GMT_EOF(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3895  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3896  		mt_status.mt_erreg = (STp->recover_reg << MT_ST_SOFTERR_SHIFT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3897  		mt_status.mt_resid = STp->partition;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3898  		if (STps->eof == ST_EOM_OK || STps->eof == ST_EOM_ERROR)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3899  			mt_status.mt_gstat |= GMT_EOT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3900  		else if (STps->eof >= ST_EOM_OK)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3901  			mt_status.mt_gstat |= GMT_EOD(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3902  		if (STp->density == 1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3903  			mt_status.mt_gstat |= GMT_D_800(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3904  		else if (STp->density == 2)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3905  			mt_status.mt_gstat |= GMT_D_1600(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3906  		else if (STp->density == 3)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3907  			mt_status.mt_gstat |= GMT_D_6250(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3908  		if (STp->ready == ST_READY)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3909  			mt_status.mt_gstat |= GMT_ONLINE(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3910  		if (STp->ready == ST_NO_TAPE)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3911  			mt_status.mt_gstat |= GMT_DR_OPEN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3912  		if (STps->at_sm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3913  			mt_status.mt_gstat |= GMT_SM(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3914  		if (STm->do_async_writes ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3915                      (STm->do_buffer_writes && STp->block_size != 0) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3916  		    STp->drv_buffer != 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3917  			mt_status.mt_gstat |= GMT_IM_REP_EN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3918  		if (STp->cleaning_req)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3919  			mt_status.mt_gstat |= GMT_CLN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3920  
1207045da5a7c9 Arnd Bergmann     2018-09-07  3921  		retval = put_user_mtget(p, &mt_status);
1207045da5a7c9 Arnd Bergmann     2018-09-07  3922  		if (retval)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3923  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3924  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3925  		STp->recover_reg = 0;		/* Clear after read */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3926  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3927  	}			/* End of MTIOCGET */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3928  	if (cmd_type == _IOC_TYPE(MTIOCPOS) && cmd_nr == _IOC_NR(MTIOCPOS)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3929  		struct mtpos mt_pos;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3930  		if (_IOC_SIZE(cmd_in) != sizeof(struct mtpos)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3931  			 retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3932  			 goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3933  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3934  		if ((i = get_location(STp, &blk, &bt, 0)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3935  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3936  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3937  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3938  		mt_pos.mt_blkno = blk;
1207045da5a7c9 Arnd Bergmann     2018-09-07  3939  		retval = put_user_mtpos(p, &mt_pos);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3940  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3941   out:
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3942  	mutex_unlock(&STp->lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16 @3943  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3944  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3945  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
