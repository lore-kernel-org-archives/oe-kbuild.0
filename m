Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D5139579
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763124460; cv=none; b=U4PnJJ+7Q5UD+sMYZkUIOTxx1PsG/v1hfsobb44RCpnRMTtbw4Nv3ebWXuDBLgRp+tftwaYYee/ggIB8iYqEb3GUj+XBY1jMjgssZrelVo+6oRGEe6zQGBvDWQKxPOFQRJh6KdfGNDx0bph5v463QNFlpoTsCDaScDmFUdVLBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763124460; c=relaxed/simple;
	bh=ifuJZU/ng9Sy29+wgNokKEdwhvglj4lwjRIYq2vCliw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZyyEEPn2JE+It1U9Uy+xmm3UwPGIZL5IgXF58L44SMjHF8x2PvuSQefYL+FPIuxkIr30FRfWip19bIodUk4C6oAZHvIVnlaT/85CWkeSRQMHNKWb4+oF8oM73TBWkTZ3ZyBraGJ5S4ZstPnamCM6HI5uQUF38yvMM795vJ2uog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDYxKZ4S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDYxKZ4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763124458; x=1794660458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifuJZU/ng9Sy29+wgNokKEdwhvglj4lwjRIYq2vCliw=;
  b=KDYxKZ4S/fg90UJGROMrYUHKu8Nt/fXZwjyym2sDJmFxGHOr8y4lUcxK
   YemsIVvfoEL63TmaGNMx0Tw9of75oo8DV5AI+BE5V5dai1yApgBXWOnMP
   aEZtiXhJGXJeTHnWvQJQBlES7CMUFIV5YS+F4XslJzceIZ5/+m2XnwE+C
   UM2aV0fhMD5ABtYbiLeNavJdUgTd68oa5PVKuxGiPlEiRIGVNk3XPKgv5
   Fn6En/xMvUznGtiDymGG8b+R6tEFbDDSV1y18yjXjgkDk2+NIyZ3ZLMki
   90dGD3N5bgIp7VXunK7rJKHTwSHU6Q+LNuFafp0zwZyoaBE0LpmTcons7
   A==;
X-CSE-ConnectionGUID: 8fUdWFxJQPyNXxD9X+fDEA==
X-CSE-MsgGUID: CNXX7MLjSk6sblhKFjXJbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69085840"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="69085840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:47:38 -0800
X-CSE-ConnectionGUID: Bk/AW6KmRymsk0A+OfI0sw==
X-CSE-MsgGUID: 3GrBg/1WSCOfkB21KqYu6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189780233"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Nov 2025 04:47:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJtDC-0006bD-0V;
	Fri, 14 Nov 2025 12:47:34 +0000
Date: Fri, 14 Nov 2025 20:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 34/46] fs/overlayfs/xattrs.c:49
 ovl_xattr_set() error: uninitialized symbol 'err'.
Message-ID: <202511142005.dn4tpBG5-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 14be61f717bbc8010dde602fbba948b912d95e38 [34/46] ovl: port ovl_xattr_set() to cred guard
:::::: branch date: 16 hours ago
:::::: commit date: 25 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142005.dn4tpBG5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511142005.dn4tpBG5-lkp@intel.com/

smatch warnings:
fs/overlayfs/xattrs.c:49 ovl_xattr_set() error: uninitialized symbol 'err'.

vim +/err +49 fs/overlayfs/xattrs.c

dad02fad84cbce3 Alexander Larsson 2023-08-15  35  
420a62dde6ebca7 Amir Goldstein    2023-10-10  36  static int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *name,
420a62dde6ebca7 Amir Goldstein    2023-10-10  37  			 const void *value, size_t size, int flags)
420a62dde6ebca7 Amir Goldstein    2023-10-10  38  {
420a62dde6ebca7 Amir Goldstein    2023-10-10  39  	int err;
420a62dde6ebca7 Amir Goldstein    2023-10-10  40  	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
420a62dde6ebca7 Amir Goldstein    2023-10-10  41  	struct dentry *upperdentry = ovl_i_dentry_upper(inode);
420a62dde6ebca7 Amir Goldstein    2023-10-10  42  	struct dentry *realdentry = upperdentry ?: ovl_dentry_lower(dentry);
420a62dde6ebca7 Amir Goldstein    2023-10-10  43  	struct path realpath;
420a62dde6ebca7 Amir Goldstein    2023-10-10  44  
420a62dde6ebca7 Amir Goldstein    2023-10-10  45  	if (!value && !upperdentry) {
420a62dde6ebca7 Amir Goldstein    2023-10-10  46  		ovl_path_lower(dentry, &realpath);
14be61f717bbc80 Christian Brauner 2025-11-12  47  		with_ovl_creds(dentry->d_sb)
420a62dde6ebca7 Amir Goldstein    2023-10-10  48  			err = vfs_getxattr(mnt_idmap(realpath.mnt), realdentry, name, NULL, 0);
420a62dde6ebca7 Amir Goldstein    2023-10-10 @49  		if (err < 0)
420a62dde6ebca7 Amir Goldstein    2023-10-10  50  			goto out;
420a62dde6ebca7 Amir Goldstein    2023-10-10  51  	}
420a62dde6ebca7 Amir Goldstein    2023-10-10  52  
420a62dde6ebca7 Amir Goldstein    2023-10-10  53  	if (!upperdentry) {
420a62dde6ebca7 Amir Goldstein    2023-10-10  54  		err = ovl_copy_up(dentry);
420a62dde6ebca7 Amir Goldstein    2023-10-10  55  		if (err)
420a62dde6ebca7 Amir Goldstein    2023-10-10  56  			goto out;
420a62dde6ebca7 Amir Goldstein    2023-10-10  57  
420a62dde6ebca7 Amir Goldstein    2023-10-10  58  		realdentry = ovl_dentry_upper(dentry);
420a62dde6ebca7 Amir Goldstein    2023-10-10  59  	}
420a62dde6ebca7 Amir Goldstein    2023-10-10  60  
420a62dde6ebca7 Amir Goldstein    2023-10-10  61  	err = ovl_want_write(dentry);
420a62dde6ebca7 Amir Goldstein    2023-10-10  62  	if (err)
420a62dde6ebca7 Amir Goldstein    2023-10-10  63  		goto out;
420a62dde6ebca7 Amir Goldstein    2023-10-10  64  
14be61f717bbc80 Christian Brauner 2025-11-12  65  	with_ovl_creds(dentry->d_sb) {
420a62dde6ebca7 Amir Goldstein    2023-10-10  66  		if (value) {
14be61f717bbc80 Christian Brauner 2025-11-12  67  			err = ovl_do_setxattr(ofs, realdentry, name, value, size, flags);
420a62dde6ebca7 Amir Goldstein    2023-10-10  68  		} else {
420a62dde6ebca7 Amir Goldstein    2023-10-10  69  			WARN_ON(flags != XATTR_REPLACE);
420a62dde6ebca7 Amir Goldstein    2023-10-10  70  			err = ovl_do_removexattr(ofs, realdentry, name);
420a62dde6ebca7 Amir Goldstein    2023-10-10  71  		}
14be61f717bbc80 Christian Brauner 2025-11-12  72  	}
420a62dde6ebca7 Amir Goldstein    2023-10-10  73  	ovl_drop_write(dentry);
420a62dde6ebca7 Amir Goldstein    2023-10-10  74  
420a62dde6ebca7 Amir Goldstein    2023-10-10  75  	/* copy c/mtime */
420a62dde6ebca7 Amir Goldstein    2023-10-10  76  	ovl_copyattr(inode);
420a62dde6ebca7 Amir Goldstein    2023-10-10  77  out:
420a62dde6ebca7 Amir Goldstein    2023-10-10  78  	return err;
420a62dde6ebca7 Amir Goldstein    2023-10-10  79  }
420a62dde6ebca7 Amir Goldstein    2023-10-10  80  

:::::: The code at line 49 was first introduced by commit
:::::: 420a62dde6ebca7bc22e6c57c9cb25d7967ff1ea ovl: Move xattr support to new xattrs.c file

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
