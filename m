Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3081859
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725154049; cv=none; b=UBbYzQN4/Mn3A57pOgJZaRvJSWXfN1M6Kp/CLMTRXK2AXEp05KXw8pcdbP52EaI8cKnZMVzYCtsvtcW9sF1jAOENIVZHX7KFEXymZuQPfNAJ5gnsZzqUjyuFSHBYq73heIpyi5B/kG2R7phVcFlQKEYDNmv5+RokZ3QqzPu/il0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725154049; c=relaxed/simple;
	bh=mP3+x38vlftdok9+Zl/Pw7+MtoNPOkId7Bt21gDjjmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I5vJmOFhs9F1yEM8mmlGlvKbFhWkJGVemZRGqV9kokf22gxGqU2f4vKRmfm8gzRpWoBb6rt+Vn02wGAbRg5GkVpXe7CIYRdnvlJ4+OY4JgO/RftmqOuD+hKlkfaxTu8CeCAzrYG9qlRg4D5i8q17wxIIeSnQSeU2L+RIgUU7/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mzt11AEj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mzt11AEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725154047; x=1756690047;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mP3+x38vlftdok9+Zl/Pw7+MtoNPOkId7Bt21gDjjmY=;
  b=Mzt11AEjevsseRg7jTH3KVrU4M2KBZf36F81Ws2SV3eX6WA6Vo4DcXVd
   BYtMgCMs2ySkCDv2/HIaqk5OdM/TxM3oMsA+kUL4+YUhd9EI8PdtqKJU0
   D+mr8sb8pp+M5tBhN4M2Pzo01yyntex9tkL2dCOXdAOBu9D4upTdTUkrA
   fpFsaL7MKq1BcXwDuS4iUtQqOksn2ASi1velWuQki7XgUGxnlRkOGncUB
   1ZqfKQGnqWdDuOu9jCayiETQVsBf4NaeePxUevOBUTC2IThPWg6fRh9Rn
   1zCzah8Z3nprhhrmsU4GQun/ZAa0BdiODgZm1yQfShvUKORb0IuaBfNzz
   A==;
X-CSE-ConnectionGUID: 8Tn0hf54R8y6SMVXcweMAw==
X-CSE-MsgGUID: moRNjovjS8SOiAuy9YTe3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34381415"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="34381415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 18:27:27 -0700
X-CSE-ConnectionGUID: oYZJuoWPRWSpXZz0RdMqiA==
X-CSE-MsgGUID: WBINH484SVK81r8eBiqc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="68910255"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2024 18:27:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skZND-0003GQ-1H;
	Sun, 01 Sep 2024 01:27:23 +0000
Date: Sun, 1 Sep 2024 09:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3689/8126] fs/xattr.c:692 __do_sys_setxattrat()
 warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5,
 usize)
Message-ID: <202409010924.1NBtrsYA-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian Göttsche" <cgzones@googlemail.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 6a7fb6ebe3718ca5f56468b163ff82c65bdf7b7f [3689/8126] fs/xattr: add *at family syscalls
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r071-20240901 (https://download.01.org/0day-ci/archive/20240901/202409010924.1NBtrsYA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409010924.1NBtrsYA-lkp@intel.com/

smatch warnings:
fs/xattr.c:692 __do_sys_setxattrat() warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5, usize)
fs/xattr.c:692 __do_sys_setxattrat() warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5, usize)
fs/xattr.c:849 __do_sys_getxattrat() warn: comparison of a potentially tagged address (__do_sys_getxattrat, 5, usize)
fs/xattr.c:849 __do_sys_getxattrat() warn: comparison of a potentially tagged address (__do_sys_getxattrat, 5, usize)

vim +692 fs/xattr.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  679  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  680  SYSCALL_DEFINE6(setxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  681  		const char __user *, name, const struct xattr_args __user *, uargs,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  682  		size_t, usize)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  683  {
6a7fb6ebe3718c Christian Göttsche 2024-04-26  684  	struct xattr_args args = {};
6a7fb6ebe3718c Christian Göttsche 2024-04-26  685  	int error;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  686  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  687  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  688  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  689  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  690  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
6a7fb6ebe3718c Christian Göttsche 2024-04-26  691  		return -EINVAL;
6a7fb6ebe3718c Christian Göttsche 2024-04-26 @692  	if (usize > PAGE_SIZE)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  693  		return -E2BIG;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  694  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  695  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  696  	if (error)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  697  		return error;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  698  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  699  	return path_setxattrat(dfd, pathname, at_flags, name,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  700  			       u64_to_user_ptr(args.value), args.size,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  701  			       args.flags);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  702  }
6a7fb6ebe3718c Christian Göttsche 2024-04-26  703  
8cc431165d8fbd Eric Biggers       2014-10-12  704  SYSCALL_DEFINE5(setxattr, const char __user *, pathname,
64fd1de3d82165 Heiko Carstens     2009-01-14  705  		const char __user *, name, const void __user *, value,
64fd1de3d82165 Heiko Carstens     2009-01-14  706  		size_t, size, int, flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  707  {
6a7fb6ebe3718c Christian Göttsche 2024-04-26  708  	return path_setxattrat(AT_FDCWD, pathname, 0, name, value, size, flags);
18f335aff86913 Dave Hansen        2008-02-15  709  }
8cc431165d8fbd Eric Biggers       2014-10-12  710  
8cc431165d8fbd Eric Biggers       2014-10-12  711  SYSCALL_DEFINE5(lsetxattr, const char __user *, pathname,
8cc431165d8fbd Eric Biggers       2014-10-12  712  		const char __user *, name, const void __user *, value,
8cc431165d8fbd Eric Biggers       2014-10-12  713  		size_t, size, int, flags)
8cc431165d8fbd Eric Biggers       2014-10-12  714  {
6a7fb6ebe3718c Christian Göttsche 2024-04-26  715  	return path_setxattrat(AT_FDCWD, pathname, AT_SYMLINK_NOFOLLOW, name,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  716  			       value, size, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  717  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  718  
64fd1de3d82165 Heiko Carstens     2009-01-14  719  SYSCALL_DEFINE5(fsetxattr, int, fd, const char __user *, name,
64fd1de3d82165 Heiko Carstens     2009-01-14  720  		const void __user *,value, size_t, size, int, flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  721  {
c3a5e3e872f368 David Howells      2024-07-23  722  	struct xattr_name kname;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  723  	struct kernel_xattr_ctx ctx = {
c3a5e3e872f368 David Howells      2024-07-23  724  		.cvalue   = value,
c3a5e3e872f368 David Howells      2024-07-23  725  		.kvalue   = NULL,
c3a5e3e872f368 David Howells      2024-07-23  726  		.size     = size,
c3a5e3e872f368 David Howells      2024-07-23  727  		.kname    = &kname,
c3a5e3e872f368 David Howells      2024-07-23  728  		.flags    = flags,
c3a5e3e872f368 David Howells      2024-07-23  729  	};
c3a5e3e872f368 David Howells      2024-07-23  730  	int error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  731  
c3a5e3e872f368 David Howells      2024-07-23  732  	CLASS(fd, f)(fd);
2903ff019b346a Al Viro            2012-08-28  733  	if (!f.file)
c3a5e3e872f368 David Howells      2024-07-23  734  		return -EBADF;
c3a5e3e872f368 David Howells      2024-07-23  735  
9f45f5bf302daa Al Viro            2014-10-31  736  	audit_file(f.file);
c3a5e3e872f368 David Howells      2024-07-23  737  	error = setxattr_copy(name, &ctx);
c3a5e3e872f368 David Howells      2024-07-23  738  	if (error)
c3a5e3e872f368 David Howells      2024-07-23  739  		return error;
c3a5e3e872f368 David Howells      2024-07-23  740  
6742cee0435323 Miklos Szeredi     2018-07-18  741  	error = mnt_want_write_file(f.file);
18f335aff86913 Dave Hansen        2008-02-15  742  	if (!error) {
c3a5e3e872f368 David Howells      2024-07-23  743  		error = do_setxattr(file_mnt_idmap(f.file),
c3a5e3e872f368 David Howells      2024-07-23  744  				    f.file->f_path.dentry, &ctx);
6742cee0435323 Miklos Szeredi     2018-07-18  745  		mnt_drop_write_file(f.file);
18f335aff86913 Dave Hansen        2008-02-15  746  	}
c3a5e3e872f368 David Howells      2024-07-23  747  	kvfree(ctx.kvalue);
^1da177e4c3f41 Linus Torvalds     2005-04-16  748  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  749  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  750  
^1da177e4c3f41 Linus Torvalds     2005-04-16  751  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  752   * Extended attribute GET operations
^1da177e4c3f41 Linus Torvalds     2005-04-16  753   */
c975cad9315700 Stefan Roesch      2022-04-24  754  ssize_t
5a6f52d20ce3cd Christian Brauner  2022-10-28  755  do_getxattr(struct mnt_idmap *idmap, struct dentry *d,
53566cca34de34 Christian Göttsche 2024-04-26  756  	struct kernel_xattr_ctx *ctx)
^1da177e4c3f41 Linus Torvalds     2005-04-16  757  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  758  	ssize_t error;
c975cad9315700 Stefan Roesch      2022-04-24  759  	char *kname = ctx->kname->name;
^1da177e4c3f41 Linus Torvalds     2005-04-16  760  
c975cad9315700 Stefan Roesch      2022-04-24  761  	if (ctx->size) {
c975cad9315700 Stefan Roesch      2022-04-24  762  		if (ctx->size > XATTR_SIZE_MAX)
c975cad9315700 Stefan Roesch      2022-04-24  763  			ctx->size = XATTR_SIZE_MAX;
c975cad9315700 Stefan Roesch      2022-04-24  764  		ctx->kvalue = kvzalloc(ctx->size, GFP_KERNEL);
c975cad9315700 Stefan Roesch      2022-04-24  765  		if (!ctx->kvalue)
^1da177e4c3f41 Linus Torvalds     2005-04-16  766  			return -ENOMEM;
779302e67835fe Sasha Levin        2012-07-30  767  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  768  
318e66856ddec0 Christian Brauner  2022-09-22  769  	if (is_posix_acl_xattr(ctx->kname->name))
5a6f52d20ce3cd Christian Brauner  2022-10-28  770  		error = do_get_acl(idmap, d, kname, ctx->kvalue, ctx->size);
318e66856ddec0 Christian Brauner  2022-09-22  771  	else
4609e1f18e19c3 Christian Brauner  2023-01-13  772  		error = vfs_getxattr(idmap, d, kname, ctx->kvalue, ctx->size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  773  	if (error > 0) {
c975cad9315700 Stefan Roesch      2022-04-24  774  		if (ctx->size && copy_to_user(ctx->value, ctx->kvalue, error))
^1da177e4c3f41 Linus Torvalds     2005-04-16  775  			error = -EFAULT;
c975cad9315700 Stefan Roesch      2022-04-24  776  	} else if (error == -ERANGE && ctx->size >= XATTR_SIZE_MAX) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  777  		/* The file system tried to returned a value bigger
^1da177e4c3f41 Linus Torvalds     2005-04-16  778  		   than XATTR_SIZE_MAX bytes. Not possible. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  779  		error = -E2BIG;
^1da177e4c3f41 Linus Torvalds     2005-04-16  780  	}
0b2a6f231dcbc7 Richard Weinberger 2016-01-02  781  
c975cad9315700 Stefan Roesch      2022-04-24  782  	return error;
c975cad9315700 Stefan Roesch      2022-04-24  783  }
0b2a6f231dcbc7 Richard Weinberger 2016-01-02  784  
c975cad9315700 Stefan Roesch      2022-04-24  785  static ssize_t
5a6f52d20ce3cd Christian Brauner  2022-10-28  786  getxattr(struct mnt_idmap *idmap, struct dentry *d,
c975cad9315700 Stefan Roesch      2022-04-24  787  	 const char __user *name, void __user *value, size_t size)
c975cad9315700 Stefan Roesch      2022-04-24  788  {
c975cad9315700 Stefan Roesch      2022-04-24  789  	ssize_t error;
c975cad9315700 Stefan Roesch      2022-04-24  790  	struct xattr_name kname;
53566cca34de34 Christian Göttsche 2024-04-26  791  	struct kernel_xattr_ctx ctx = {
c975cad9315700 Stefan Roesch      2022-04-24  792  		.value    = value,
c975cad9315700 Stefan Roesch      2022-04-24  793  		.kvalue   = NULL,
c975cad9315700 Stefan Roesch      2022-04-24  794  		.size     = size,
c975cad9315700 Stefan Roesch      2022-04-24  795  		.kname    = &kname,
c975cad9315700 Stefan Roesch      2022-04-24  796  		.flags    = 0,
c975cad9315700 Stefan Roesch      2022-04-24  797  	};
c975cad9315700 Stefan Roesch      2022-04-24  798  
c975cad9315700 Stefan Roesch      2022-04-24  799  	error = strncpy_from_user(kname.name, name, sizeof(kname.name));
c975cad9315700 Stefan Roesch      2022-04-24  800  	if (error == 0 || error == sizeof(kname.name))
c975cad9315700 Stefan Roesch      2022-04-24  801  		error = -ERANGE;
c975cad9315700 Stefan Roesch      2022-04-24  802  	if (error < 0)
c975cad9315700 Stefan Roesch      2022-04-24  803  		return error;
c975cad9315700 Stefan Roesch      2022-04-24  804  
5a6f52d20ce3cd Christian Brauner  2022-10-28  805  	error =  do_getxattr(idmap, d, &ctx);
c975cad9315700 Stefan Roesch      2022-04-24  806  
c975cad9315700 Stefan Roesch      2022-04-24  807  	kvfree(ctx.kvalue);
^1da177e4c3f41 Linus Torvalds     2005-04-16  808  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  809  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  810  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  811  static ssize_t path_getxattrat(int dfd, const char __user *pathname,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  812  			       unsigned int at_flags, const char __user *name,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  813  			       void __user *value, size_t size)
^1da177e4c3f41 Linus Torvalds     2005-04-16  814  {
2d8f30380ab8c7 Al Viro            2008-07-22  815  	struct path path;
^1da177e4c3f41 Linus Torvalds     2005-04-16  816  	ssize_t error;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  817  	int lookup_flags;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  818  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  819  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  820  		return -EINVAL;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  821  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  822  	lookup_flags = (at_flags & AT_SYMLINK_NOFOLLOW) ? 0 : LOOKUP_FOLLOW;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  823  	if (at_flags & AT_EMPTY_PATH)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  824  		lookup_flags |= LOOKUP_EMPTY;
60e66b48ca2081 Jeff Layton        2012-12-11  825  retry:
6a7fb6ebe3718c Christian Göttsche 2024-04-26  826  	error = user_path_at(dfd, pathname, lookup_flags, &path);
^1da177e4c3f41 Linus Torvalds     2005-04-16  827  	if (error)
^1da177e4c3f41 Linus Torvalds     2005-04-16  828  		return error;
5a6f52d20ce3cd Christian Brauner  2022-10-28  829  	error = getxattr(mnt_idmap(path.mnt), path.dentry, name, value, size);
2d8f30380ab8c7 Al Viro            2008-07-22  830  	path_put(&path);
60e66b48ca2081 Jeff Layton        2012-12-11  831  	if (retry_estale(error, lookup_flags)) {
60e66b48ca2081 Jeff Layton        2012-12-11  832  		lookup_flags |= LOOKUP_REVAL;
60e66b48ca2081 Jeff Layton        2012-12-11  833  		goto retry;
60e66b48ca2081 Jeff Layton        2012-12-11  834  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  835  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  836  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  837  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  838  SYSCALL_DEFINE6(getxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  839  		const char __user *, name, struct xattr_args __user *, uargs, size_t, usize)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  840  {
6a7fb6ebe3718c Christian Göttsche 2024-04-26  841  	struct xattr_args args = {};
6a7fb6ebe3718c Christian Göttsche 2024-04-26  842  	int error;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  843  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  844  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  845  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  846  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  847  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
6a7fb6ebe3718c Christian Göttsche 2024-04-26  848  		return -EINVAL;
6a7fb6ebe3718c Christian Göttsche 2024-04-26 @849  	if (usize > PAGE_SIZE)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  850  		return -E2BIG;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  851  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  852  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  853  	if (error)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  854  		return error;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  855  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  856  	if (args.flags != 0)
6a7fb6ebe3718c Christian Göttsche 2024-04-26  857  		return -EINVAL;
6a7fb6ebe3718c Christian Göttsche 2024-04-26  858  
6a7fb6ebe3718c Christian Göttsche 2024-04-26  859  	return path_getxattrat(dfd, pathname, at_flags, name,
6a7fb6ebe3718c Christian Göttsche 2024-04-26  860  			       u64_to_user_ptr(args.value), args.size);
6a7fb6ebe3718c Christian Göttsche 2024-04-26  861  }
6a7fb6ebe3718c Christian Göttsche 2024-04-26  862  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
