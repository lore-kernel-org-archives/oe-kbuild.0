Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F6183CB8
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732137884; cv=none; b=Q8NzrqNX2F2DVUlTWINDmKQyw/cKNQpScZHrvCcfmE4tBsxZ8RKl4SnuCLQ5erwuXV/pPt11ITeVKonkJ/J0Wmc9FpmStRLVwSoSaapQdX78++N/f5Kcok2zSv2Dujln44IHR/2o4pmVwHbbiqZnf9NSYGhXtIGAqp9q93FeXvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732137884; c=relaxed/simple;
	bh=j1ZkXa44jelaqwL/pr8W4GrnW4HV4QfPEZ6NcrXl8hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPP8e8P4n/9DktFQ595x49cj+1dTcGnP9bN4BW3rk7o956xs0J/GWnVAmCXyUyCNdSnX2/vpu4FSk9wdRcuT/myGI0jaSNb4O6ykxldnOoDclXe3wTibvPmoA4sDerJ2tX1YB/ntwfUK/CDgRKIVA8zRM4EpigDTyUUJHLsZkZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NF31TlU9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NF31TlU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732137882; x=1763673882;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j1ZkXa44jelaqwL/pr8W4GrnW4HV4QfPEZ6NcrXl8hc=;
  b=NF31TlU9jTiy1UTjyM0A/PaSspH28ppJXCiBhvjS9Ue3sL+VwWsYADm/
   t5ckl7U5dRVPSBrWRlhyyydvlr0ifQ1Q1V+/ADP4+LYwYuz4/NPARJeU+
   t7bBSxN85wH5Qgty7wIeeta7KSFFuQQcZ/6xc6RdKw4d+NRMc57prDMQt
   cO23grUc5S0CBwb0XPIpGXonUZ3FlS/mtYGqkj/B6G+hN5Asm+WNf6snM
   FG1HQRGA9TG+GkPqW5ktOckOPeccVDNHP36MpjEK3wPGJdnUEleD9s0+h
   MGaHbgAnElOy/DKeaEqfLNUe0e1LPiIQlscp83kUuPft2Hb/FmKNYqF+/
   w==;
X-CSE-ConnectionGUID: OVRtIDQwSqOixOV2oDCWzQ==
X-CSE-MsgGUID: TYeTos9iRqiHGm0K7jUtEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36134967"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="36134967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 13:24:41 -0800
X-CSE-ConnectionGUID: 1xug+rq2TA2C3XR13S86BQ==
X-CSE-MsgGUID: Qx4kWZyLQmWAStChqkJ3XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="90441617"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2024 13:24:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDsBh-0001Ap-2l;
	Wed, 20 Nov 2024 21:24:37 +0000
Date: Thu, 21 Nov 2024 05:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xattr.c:731 __do_sys_setxattrat() warn: comparison of a
 potentially tagged address (__do_sys_setxattrat, 5, usize)
Message-ID: <202411210510.w5HqGSml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Christian Göttsche" <cgzones@googlemail.com>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   856385e0c56e7739bddea869e7a17f040211a2fc
commit: 6140be90ec70c39fa844741ca3cc807dd0866394 fs/xattr: add *at family syscalls
date:   2 weeks ago
:::::: branch date: 86 minutes ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-r073-20241119 (https://download.01.org/0day-ci/archive/20241121/202411210510.w5HqGSml-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411210510.w5HqGSml-lkp@intel.com/

smatch warnings:
fs/xattr.c:731 __do_sys_setxattrat() warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5, usize)
fs/xattr.c:731 __do_sys_setxattrat() warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5, usize)
fs/xattr.c:874 __do_sys_getxattrat() warn: comparison of a potentially tagged address (__do_sys_getxattrat, 5, usize)
fs/xattr.c:874 __do_sys_getxattrat() warn: comparison of a potentially tagged address (__do_sys_getxattrat, 5, usize)

vim +731 fs/xattr.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  718  
6140be90ec70c3 Christian Göttsche 2024-04-26  719  SYSCALL_DEFINE6(setxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
6140be90ec70c3 Christian Göttsche 2024-04-26  720  		const char __user *, name, const struct xattr_args __user *, uargs,
6140be90ec70c3 Christian Göttsche 2024-04-26  721  		size_t, usize)
6140be90ec70c3 Christian Göttsche 2024-04-26  722  {
6140be90ec70c3 Christian Göttsche 2024-04-26  723  	struct xattr_args args = {};
6140be90ec70c3 Christian Göttsche 2024-04-26  724  	int error;
6140be90ec70c3 Christian Göttsche 2024-04-26  725  
6140be90ec70c3 Christian Göttsche 2024-04-26  726  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
6140be90ec70c3 Christian Göttsche 2024-04-26  727  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
6140be90ec70c3 Christian Göttsche 2024-04-26  728  
6140be90ec70c3 Christian Göttsche 2024-04-26  729  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
6140be90ec70c3 Christian Göttsche 2024-04-26  730  		return -EINVAL;
6140be90ec70c3 Christian Göttsche 2024-04-26 @731  	if (usize > PAGE_SIZE)
6140be90ec70c3 Christian Göttsche 2024-04-26  732  		return -E2BIG;
6140be90ec70c3 Christian Göttsche 2024-04-26  733  
6140be90ec70c3 Christian Göttsche 2024-04-26  734  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
6140be90ec70c3 Christian Göttsche 2024-04-26  735  	if (error)
6140be90ec70c3 Christian Göttsche 2024-04-26  736  		return error;
6140be90ec70c3 Christian Göttsche 2024-04-26  737  
6140be90ec70c3 Christian Göttsche 2024-04-26  738  	return path_setxattrat(dfd, pathname, at_flags, name,
6140be90ec70c3 Christian Göttsche 2024-04-26  739  			       u64_to_user_ptr(args.value), args.size,
6140be90ec70c3 Christian Göttsche 2024-04-26  740  			       args.flags);
6140be90ec70c3 Christian Göttsche 2024-04-26  741  }
6140be90ec70c3 Christian Göttsche 2024-04-26  742  
8cc431165d8fbd Eric Biggers       2014-10-12  743  SYSCALL_DEFINE5(setxattr, const char __user *, pathname,
64fd1de3d82165 Heiko Carstens     2009-01-14  744  		const char __user *, name, const void __user *, value,
64fd1de3d82165 Heiko Carstens     2009-01-14  745  		size_t, size, int, flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  746  {
6140be90ec70c3 Christian Göttsche 2024-04-26  747  	return path_setxattrat(AT_FDCWD, pathname, 0, name, value, size, flags);
18f335aff86913 Dave Hansen        2008-02-15  748  }
8cc431165d8fbd Eric Biggers       2014-10-12  749  
8cc431165d8fbd Eric Biggers       2014-10-12  750  SYSCALL_DEFINE5(lsetxattr, const char __user *, pathname,
8cc431165d8fbd Eric Biggers       2014-10-12  751  		const char __user *, name, const void __user *, value,
8cc431165d8fbd Eric Biggers       2014-10-12  752  		size_t, size, int, flags)
8cc431165d8fbd Eric Biggers       2014-10-12  753  {
6140be90ec70c3 Christian Göttsche 2024-04-26  754  	return path_setxattrat(AT_FDCWD, pathname, AT_SYMLINK_NOFOLLOW, name,
6140be90ec70c3 Christian Göttsche 2024-04-26  755  			       value, size, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  756  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  757  
64fd1de3d82165 Heiko Carstens     2009-01-14  758  SYSCALL_DEFINE5(fsetxattr, int, fd, const char __user *, name,
64fd1de3d82165 Heiko Carstens     2009-01-14  759  		const void __user *,value, size_t, size, int, flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  760  {
6140be90ec70c3 Christian Göttsche 2024-04-26  761  	return path_setxattrat(fd, NULL, AT_EMPTY_PATH, name,
6140be90ec70c3 Christian Göttsche 2024-04-26  762  			       value, size, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  763  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  764  
^1da177e4c3f41 Linus Torvalds     2005-04-16  765  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  766   * Extended attribute GET operations
^1da177e4c3f41 Linus Torvalds     2005-04-16  767   */
0158005aaa3c94 Al Viro            2024-09-26  768  static ssize_t
5a6f52d20ce3cd Christian Brauner  2022-10-28  769  do_getxattr(struct mnt_idmap *idmap, struct dentry *d,
537c76629d7855 Christian Göttsche 2024-04-26  770  	struct kernel_xattr_ctx *ctx)
^1da177e4c3f41 Linus Torvalds     2005-04-16  771  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  772  	ssize_t error;
c975cad9315700 Stefan Roesch      2022-04-24  773  	char *kname = ctx->kname->name;
0158005aaa3c94 Al Viro            2024-09-26  774  	void *kvalue = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  775  
c975cad9315700 Stefan Roesch      2022-04-24  776  	if (ctx->size) {
c975cad9315700 Stefan Roesch      2022-04-24  777  		if (ctx->size > XATTR_SIZE_MAX)
c975cad9315700 Stefan Roesch      2022-04-24  778  			ctx->size = XATTR_SIZE_MAX;
0158005aaa3c94 Al Viro            2024-09-26  779  		kvalue = kvzalloc(ctx->size, GFP_KERNEL);
0158005aaa3c94 Al Viro            2024-09-26  780  		if (!kvalue)
^1da177e4c3f41 Linus Torvalds     2005-04-16  781  			return -ENOMEM;
779302e67835fe Sasha Levin        2012-07-30  782  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  783  
0158005aaa3c94 Al Viro            2024-09-26  784  	if (is_posix_acl_xattr(kname))
0158005aaa3c94 Al Viro            2024-09-26  785  		error = do_get_acl(idmap, d, kname, kvalue, ctx->size);
318e66856ddec0 Christian Brauner  2022-09-22  786  	else
0158005aaa3c94 Al Viro            2024-09-26  787  		error = vfs_getxattr(idmap, d, kname, kvalue, ctx->size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  788  	if (error > 0) {
0158005aaa3c94 Al Viro            2024-09-26  789  		if (ctx->size && copy_to_user(ctx->value, kvalue, error))
^1da177e4c3f41 Linus Torvalds     2005-04-16  790  			error = -EFAULT;
c975cad9315700 Stefan Roesch      2022-04-24  791  	} else if (error == -ERANGE && ctx->size >= XATTR_SIZE_MAX) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  792  		/* The file system tried to returned a value bigger
^1da177e4c3f41 Linus Torvalds     2005-04-16  793  		   than XATTR_SIZE_MAX bytes. Not possible. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  794  		error = -E2BIG;
^1da177e4c3f41 Linus Torvalds     2005-04-16  795  	}
0b2a6f231dcbc7 Richard Weinberger 2016-01-02  796  
0158005aaa3c94 Al Viro            2024-09-26  797  	kvfree(kvalue);
c975cad9315700 Stefan Roesch      2022-04-24  798  	return error;
c975cad9315700 Stefan Roesch      2022-04-24  799  }
0b2a6f231dcbc7 Richard Weinberger 2016-01-02  800  
0158005aaa3c94 Al Viro            2024-09-26  801  ssize_t file_getxattr(struct file *f, struct kernel_xattr_ctx *ctx)
c975cad9315700 Stefan Roesch      2022-04-24  802  {
0158005aaa3c94 Al Viro            2024-09-26  803  	audit_file(f);
0158005aaa3c94 Al Viro            2024-09-26  804  	return do_getxattr(file_mnt_idmap(f), f->f_path.dentry, ctx);
^1da177e4c3f41 Linus Torvalds     2005-04-16  805  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  806  
0158005aaa3c94 Al Viro            2024-09-26  807  /* unconditionally consumes filename */
0158005aaa3c94 Al Viro            2024-09-26  808  ssize_t filename_getxattr(int dfd, struct filename *filename,
0158005aaa3c94 Al Viro            2024-09-26  809  			  unsigned int lookup_flags, struct kernel_xattr_ctx *ctx)
^1da177e4c3f41 Linus Torvalds     2005-04-16  810  {
2d8f30380ab8c7 Al Viro            2008-07-22  811  	struct path path;
^1da177e4c3f41 Linus Torvalds     2005-04-16  812  	ssize_t error;
60e66b48ca2081 Jeff Layton        2012-12-11  813  retry:
0158005aaa3c94 Al Viro            2024-09-26  814  	error = filename_lookup(dfd, filename, lookup_flags, &path, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  815  	if (error)
0158005aaa3c94 Al Viro            2024-09-26  816  		goto out;
0158005aaa3c94 Al Viro            2024-09-26  817  	error = do_getxattr(mnt_idmap(path.mnt), path.dentry, ctx);
2d8f30380ab8c7 Al Viro            2008-07-22  818  	path_put(&path);
60e66b48ca2081 Jeff Layton        2012-12-11  819  	if (retry_estale(error, lookup_flags)) {
60e66b48ca2081 Jeff Layton        2012-12-11  820  		lookup_flags |= LOOKUP_REVAL;
60e66b48ca2081 Jeff Layton        2012-12-11  821  		goto retry;
60e66b48ca2081 Jeff Layton        2012-12-11  822  	}
0158005aaa3c94 Al Viro            2024-09-26  823  out:
0158005aaa3c94 Al Viro            2024-09-26  824  	putname(filename);
^1da177e4c3f41 Linus Torvalds     2005-04-16  825  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  826  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  827  
6140be90ec70c3 Christian Göttsche 2024-04-26  828  static ssize_t path_getxattrat(int dfd, const char __user *pathname,
6140be90ec70c3 Christian Göttsche 2024-04-26  829  			       unsigned int at_flags, const char __user *name,
6140be90ec70c3 Christian Göttsche 2024-04-26  830  			       void __user *value, size_t size)
0158005aaa3c94 Al Viro            2024-09-26  831  {
0158005aaa3c94 Al Viro            2024-09-26  832  	struct xattr_name kname;
0158005aaa3c94 Al Viro            2024-09-26  833  	struct kernel_xattr_ctx ctx = {
0158005aaa3c94 Al Viro            2024-09-26  834  		.value    = value,
0158005aaa3c94 Al Viro            2024-09-26  835  		.size     = size,
0158005aaa3c94 Al Viro            2024-09-26  836  		.kname    = &kname,
0158005aaa3c94 Al Viro            2024-09-26  837  		.flags    = 0,
0158005aaa3c94 Al Viro            2024-09-26  838  	};
6140be90ec70c3 Christian Göttsche 2024-04-26  839  	struct filename *filename;
6140be90ec70c3 Christian Göttsche 2024-04-26  840  	ssize_t error;
6140be90ec70c3 Christian Göttsche 2024-04-26  841  
6140be90ec70c3 Christian Göttsche 2024-04-26  842  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
6140be90ec70c3 Christian Göttsche 2024-04-26  843  		return -EINVAL;
0158005aaa3c94 Al Viro            2024-09-26  844  
0158005aaa3c94 Al Viro            2024-09-26  845  	error = import_xattr_name(&kname, name);
0158005aaa3c94 Al Viro            2024-09-26  846  	if (error)
0158005aaa3c94 Al Viro            2024-09-26  847  		return error;
6140be90ec70c3 Christian Göttsche 2024-04-26  848  
6140be90ec70c3 Christian Göttsche 2024-04-26  849  	filename = getname_maybe_null(pathname, at_flags);
6140be90ec70c3 Christian Göttsche 2024-04-26  850  	if (!filename) {
6140be90ec70c3 Christian Göttsche 2024-04-26  851  		CLASS(fd, f)(dfd);
6140be90ec70c3 Christian Göttsche 2024-04-26  852  		if (fd_empty(f))
6140be90ec70c3 Christian Göttsche 2024-04-26  853  			return -EBADF;
6140be90ec70c3 Christian Göttsche 2024-04-26  854  		return file_getxattr(fd_file(f), &ctx);
6140be90ec70c3 Christian Göttsche 2024-04-26  855  	} else {
6140be90ec70c3 Christian Göttsche 2024-04-26  856  		int lookup_flags = 0;
6140be90ec70c3 Christian Göttsche 2024-04-26  857  		if (!(at_flags & AT_SYMLINK_NOFOLLOW))
6140be90ec70c3 Christian Göttsche 2024-04-26  858  			lookup_flags = LOOKUP_FOLLOW;
6140be90ec70c3 Christian Göttsche 2024-04-26  859  		return filename_getxattr(dfd, filename, lookup_flags, &ctx);
6140be90ec70c3 Christian Göttsche 2024-04-26  860  	}
6140be90ec70c3 Christian Göttsche 2024-04-26  861  }
6140be90ec70c3 Christian Göttsche 2024-04-26  862  
6140be90ec70c3 Christian Göttsche 2024-04-26  863  SYSCALL_DEFINE6(getxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
6140be90ec70c3 Christian Göttsche 2024-04-26  864  		const char __user *, name, struct xattr_args __user *, uargs, size_t, usize)
6140be90ec70c3 Christian Göttsche 2024-04-26  865  {
6140be90ec70c3 Christian Göttsche 2024-04-26  866  	struct xattr_args args = {};
6140be90ec70c3 Christian Göttsche 2024-04-26  867  	int error;
6140be90ec70c3 Christian Göttsche 2024-04-26  868  
6140be90ec70c3 Christian Göttsche 2024-04-26  869  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
6140be90ec70c3 Christian Göttsche 2024-04-26  870  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
6140be90ec70c3 Christian Göttsche 2024-04-26  871  
6140be90ec70c3 Christian Göttsche 2024-04-26  872  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
6140be90ec70c3 Christian Göttsche 2024-04-26  873  		return -EINVAL;
6140be90ec70c3 Christian Göttsche 2024-04-26 @874  	if (usize > PAGE_SIZE)
6140be90ec70c3 Christian Göttsche 2024-04-26  875  		return -E2BIG;
6140be90ec70c3 Christian Göttsche 2024-04-26  876  
6140be90ec70c3 Christian Göttsche 2024-04-26  877  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
6140be90ec70c3 Christian Göttsche 2024-04-26  878  	if (error)
6140be90ec70c3 Christian Göttsche 2024-04-26  879  		return error;
6140be90ec70c3 Christian Göttsche 2024-04-26  880  
6140be90ec70c3 Christian Göttsche 2024-04-26  881  	if (args.flags != 0)
6140be90ec70c3 Christian Göttsche 2024-04-26  882  		return -EINVAL;
6140be90ec70c3 Christian Göttsche 2024-04-26  883  
6140be90ec70c3 Christian Göttsche 2024-04-26  884  	return path_getxattrat(dfd, pathname, at_flags, name,
6140be90ec70c3 Christian Göttsche 2024-04-26  885  			       u64_to_user_ptr(args.value), args.size);
0158005aaa3c94 Al Viro            2024-09-26  886  }
0158005aaa3c94 Al Viro            2024-09-26  887  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
