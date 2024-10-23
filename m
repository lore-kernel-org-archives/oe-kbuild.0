Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F11FEFC2
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729721845; cv=none; b=KodoovG0mzPLW6olvOO3CwIOQ8hROTTiA9BXTnYTXQNpragTAt0rS9Bactqti1EpU5Je/TPoiERWqS39TGndWE1b1zZb3zPyksV4bBkHg+BjUchq4gCX/9KjgcSZrZifZSEeeQBgaVQsD25AuzzsqWxF+GG3Qh+ggVrfIQRLqxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729721845; c=relaxed/simple;
	bh=n+cB/U74GbX9nPFPjpniVhKpA9QzsAReRDMeMlvpVGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfQGN217+FuJ8BHgYUOJyhN0IwTn5Kq6MwE7rraAfSq1EHE3NDkhXl8SsUh6ZwCUhWJ9UV2N5/G2DcnF/KxsQ6sibNyTu1SdqzGeK5lWxA590oH1gzgmhEAryOXBsLrkWgTNeb7T6bz+wjALNJZBoJlcJhUDPhYtpxXJ5XyjI1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1Yi7NAN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1Yi7NAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729721842; x=1761257842;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n+cB/U74GbX9nPFPjpniVhKpA9QzsAReRDMeMlvpVGE=;
  b=F1Yi7NANt2nU1/pWmM8cIi08BWUEj1qUArqavfqfrqzM+8hxCH2zJe2v
   NTC7bwYHG+eYo7FDRRD2IN97LMPwIT/by6zlMTjpyb6WiNpSFoM/0oJLq
   OPjllgF4FibUi6KE7sc8y0dLJT7/cM+BstjK2J3sUJT2q9Ofi9+xrLMla
   P1fkx8uemiQI73tKsesXdTLBwJgCfA1V/hObgfoybYcaLcqAeVsIc7M0M
   iy2wlmUJ/2/+P/cNwXMBhH+weCyswOcU0/UhKm7Dz1h0ereJ30ADNfbim
   kmpdxlIpxxLDi7uRh8qX+yxAwnmE9aQmibhCf4nlQWQwMTgWxaz9DqVsG
   A==;
X-CSE-ConnectionGUID: +12WqIDqSjGlT8rXm7icnw==
X-CSE-MsgGUID: 74ys1eB8RRCn43sYdvr3ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29495459"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29495459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 15:17:21 -0700
X-CSE-ConnectionGUID: EzYer+UKSUSEF2XLWdhIWg==
X-CSE-MsgGUID: SV3ydjz0SCCpAni7wH242g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="103725405"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2024 15:17:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3jfJ-000VeU-2e;
	Wed, 23 Oct 2024 22:17:17 +0000
Date: Thu, 24 Oct 2024 06:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.xattr2 12/12] fs/xattr.c:731 __do_sys_setxattrat()
 warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5,
 usize)
Message-ID: <202410240646.qWgTr2UR-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: "Christian Göttsche" <cgzones@googlemail.com>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.xattr2
head:   716f46e637c3e787c5f119ae590dcfc0a2355f93
commit: 716f46e637c3e787c5f119ae590dcfc0a2355f93 [12/12] fs/xattr: add *at family syscalls
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r073-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240646.qWgTr2UR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410240646.qWgTr2UR-lkp@intel.com/

smatch warnings:
fs/xattr.c:731 __do_sys_setxattrat() warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5, usize)
fs/xattr.c:731 __do_sys_setxattrat() warn: comparison of a potentially tagged address (__do_sys_setxattrat, 5, usize)
fs/xattr.c:874 __do_sys_getxattrat() warn: comparison of a potentially tagged address (__do_sys_getxattrat, 5, usize)
fs/xattr.c:874 __do_sys_getxattrat() warn: comparison of a potentially tagged address (__do_sys_getxattrat, 5, usize)

vim +731 fs/xattr.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  718  
716f46e637c3e78 Christian Göttsche 2024-04-26  719  SYSCALL_DEFINE6(setxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
716f46e637c3e78 Christian Göttsche 2024-04-26  720  		const char __user *, name, const struct xattr_args __user *, uargs,
716f46e637c3e78 Christian Göttsche 2024-04-26  721  		size_t, usize)
716f46e637c3e78 Christian Göttsche 2024-04-26  722  {
716f46e637c3e78 Christian Göttsche 2024-04-26  723  	struct xattr_args args = {};
716f46e637c3e78 Christian Göttsche 2024-04-26  724  	int error;
716f46e637c3e78 Christian Göttsche 2024-04-26  725  
716f46e637c3e78 Christian Göttsche 2024-04-26  726  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
716f46e637c3e78 Christian Göttsche 2024-04-26  727  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
716f46e637c3e78 Christian Göttsche 2024-04-26  728  
716f46e637c3e78 Christian Göttsche 2024-04-26  729  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
716f46e637c3e78 Christian Göttsche 2024-04-26  730  		return -EINVAL;
716f46e637c3e78 Christian Göttsche 2024-04-26 @731  	if (usize > PAGE_SIZE)
716f46e637c3e78 Christian Göttsche 2024-04-26  732  		return -E2BIG;
716f46e637c3e78 Christian Göttsche 2024-04-26  733  
716f46e637c3e78 Christian Göttsche 2024-04-26  734  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
716f46e637c3e78 Christian Göttsche 2024-04-26  735  	if (error)
716f46e637c3e78 Christian Göttsche 2024-04-26  736  		return error;
716f46e637c3e78 Christian Göttsche 2024-04-26  737  
716f46e637c3e78 Christian Göttsche 2024-04-26  738  	return path_setxattrat(dfd, pathname, at_flags, name,
716f46e637c3e78 Christian Göttsche 2024-04-26  739  			       u64_to_user_ptr(args.value), args.size,
716f46e637c3e78 Christian Göttsche 2024-04-26  740  			       args.flags);
716f46e637c3e78 Christian Göttsche 2024-04-26  741  }
716f46e637c3e78 Christian Göttsche 2024-04-26  742  
8cc431165d8fbda Eric Biggers       2014-10-12  743  SYSCALL_DEFINE5(setxattr, const char __user *, pathname,
64fd1de3d821659 Heiko Carstens     2009-01-14  744  		const char __user *, name, const void __user *, value,
64fd1de3d821659 Heiko Carstens     2009-01-14  745  		size_t, size, int, flags)
^1da177e4c3f415 Linus Torvalds     2005-04-16  746  {
716f46e637c3e78 Christian Göttsche 2024-04-26  747  	return path_setxattrat(AT_FDCWD, pathname, 0, name, value, size, flags);
18f335aff86913d Dave Hansen        2008-02-15  748  }
8cc431165d8fbda Eric Biggers       2014-10-12  749  
8cc431165d8fbda Eric Biggers       2014-10-12  750  SYSCALL_DEFINE5(lsetxattr, const char __user *, pathname,
8cc431165d8fbda Eric Biggers       2014-10-12  751  		const char __user *, name, const void __user *, value,
8cc431165d8fbda Eric Biggers       2014-10-12  752  		size_t, size, int, flags)
8cc431165d8fbda Eric Biggers       2014-10-12  753  {
716f46e637c3e78 Christian Göttsche 2024-04-26  754  	return path_setxattrat(AT_FDCWD, pathname, AT_SYMLINK_NOFOLLOW, name,
716f46e637c3e78 Christian Göttsche 2024-04-26  755  			       value, size, flags);
^1da177e4c3f415 Linus Torvalds     2005-04-16  756  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  757  
64fd1de3d821659 Heiko Carstens     2009-01-14  758  SYSCALL_DEFINE5(fsetxattr, int, fd, const char __user *, name,
64fd1de3d821659 Heiko Carstens     2009-01-14  759  		const void __user *,value, size_t, size, int, flags)
^1da177e4c3f415 Linus Torvalds     2005-04-16  760  {
716f46e637c3e78 Christian Göttsche 2024-04-26  761  	return path_setxattrat(fd, NULL, AT_EMPTY_PATH, name,
716f46e637c3e78 Christian Göttsche 2024-04-26  762  			       value, size, flags);
^1da177e4c3f415 Linus Torvalds     2005-04-16  763  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  764  
^1da177e4c3f415 Linus Torvalds     2005-04-16  765  /*
^1da177e4c3f415 Linus Torvalds     2005-04-16  766   * Extended attribute GET operations
^1da177e4c3f415 Linus Torvalds     2005-04-16  767   */
61a02f83dd87c8b Al Viro            2024-09-26  768  static ssize_t
5a6f52d20ce3cd6 Christian Brauner  2022-10-28  769  do_getxattr(struct mnt_idmap *idmap, struct dentry *d,
c39d4c54c311b3e Christian Göttsche 2024-04-26  770  	struct kernel_xattr_ctx *ctx)
^1da177e4c3f415 Linus Torvalds     2005-04-16  771  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  772  	ssize_t error;
c975cad93157000 Stefan Roesch      2022-04-24  773  	char *kname = ctx->kname->name;
61a02f83dd87c8b Al Viro            2024-09-26  774  	void *kvalue = NULL;
^1da177e4c3f415 Linus Torvalds     2005-04-16  775  
c975cad93157000 Stefan Roesch      2022-04-24  776  	if (ctx->size) {
c975cad93157000 Stefan Roesch      2022-04-24  777  		if (ctx->size > XATTR_SIZE_MAX)
c975cad93157000 Stefan Roesch      2022-04-24  778  			ctx->size = XATTR_SIZE_MAX;
61a02f83dd87c8b Al Viro            2024-09-26  779  		kvalue = kvzalloc(ctx->size, GFP_KERNEL);
61a02f83dd87c8b Al Viro            2024-09-26  780  		if (!kvalue)
^1da177e4c3f415 Linus Torvalds     2005-04-16  781  			return -ENOMEM;
779302e67835fe9 Sasha Levin        2012-07-30  782  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  783  
61a02f83dd87c8b Al Viro            2024-09-26  784  	if (is_posix_acl_xattr(kname))
61a02f83dd87c8b Al Viro            2024-09-26  785  		error = do_get_acl(idmap, d, kname, kvalue, ctx->size);
318e66856ddec05 Christian Brauner  2022-09-22  786  	else
61a02f83dd87c8b Al Viro            2024-09-26  787  		error = vfs_getxattr(idmap, d, kname, kvalue, ctx->size);
^1da177e4c3f415 Linus Torvalds     2005-04-16  788  	if (error > 0) {
61a02f83dd87c8b Al Viro            2024-09-26  789  		if (ctx->size && copy_to_user(ctx->value, kvalue, error))
^1da177e4c3f415 Linus Torvalds     2005-04-16  790  			error = -EFAULT;
c975cad93157000 Stefan Roesch      2022-04-24  791  	} else if (error == -ERANGE && ctx->size >= XATTR_SIZE_MAX) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  792  		/* The file system tried to returned a value bigger
^1da177e4c3f415 Linus Torvalds     2005-04-16  793  		   than XATTR_SIZE_MAX bytes. Not possible. */
^1da177e4c3f415 Linus Torvalds     2005-04-16  794  		error = -E2BIG;
^1da177e4c3f415 Linus Torvalds     2005-04-16  795  	}
0b2a6f231dcbc7b Richard Weinberger 2016-01-02  796  
61a02f83dd87c8b Al Viro            2024-09-26  797  	kvfree(kvalue);
c975cad93157000 Stefan Roesch      2022-04-24  798  	return error;
c975cad93157000 Stefan Roesch      2022-04-24  799  }
0b2a6f231dcbc7b Richard Weinberger 2016-01-02  800  
61a02f83dd87c8b Al Viro            2024-09-26  801  ssize_t file_getxattr(struct file *f, struct kernel_xattr_ctx *ctx)
c975cad93157000 Stefan Roesch      2022-04-24  802  {
61a02f83dd87c8b Al Viro            2024-09-26  803  	audit_file(f);
61a02f83dd87c8b Al Viro            2024-09-26  804  	return do_getxattr(file_mnt_idmap(f), f->f_path.dentry, ctx);
^1da177e4c3f415 Linus Torvalds     2005-04-16  805  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  806  
61a02f83dd87c8b Al Viro            2024-09-26  807  /* unconditionally consumes filename */
61a02f83dd87c8b Al Viro            2024-09-26  808  ssize_t filename_getxattr(int dfd, struct filename *filename,
61a02f83dd87c8b Al Viro            2024-09-26  809  			  unsigned int lookup_flags, struct kernel_xattr_ctx *ctx)
^1da177e4c3f415 Linus Torvalds     2005-04-16  810  {
2d8f30380ab8c70 Al Viro            2008-07-22  811  	struct path path;
^1da177e4c3f415 Linus Torvalds     2005-04-16  812  	ssize_t error;
60e66b48ca20819 Jeff Layton        2012-12-11  813  retry:
61a02f83dd87c8b Al Viro            2024-09-26  814  	error = filename_lookup(dfd, filename, lookup_flags, &path, NULL);
^1da177e4c3f415 Linus Torvalds     2005-04-16  815  	if (error)
61a02f83dd87c8b Al Viro            2024-09-26  816  		goto out;
61a02f83dd87c8b Al Viro            2024-09-26  817  	error = do_getxattr(mnt_idmap(path.mnt), path.dentry, ctx);
2d8f30380ab8c70 Al Viro            2008-07-22  818  	path_put(&path);
60e66b48ca20819 Jeff Layton        2012-12-11  819  	if (retry_estale(error, lookup_flags)) {
60e66b48ca20819 Jeff Layton        2012-12-11  820  		lookup_flags |= LOOKUP_REVAL;
60e66b48ca20819 Jeff Layton        2012-12-11  821  		goto retry;
60e66b48ca20819 Jeff Layton        2012-12-11  822  	}
61a02f83dd87c8b Al Viro            2024-09-26  823  out:
61a02f83dd87c8b Al Viro            2024-09-26  824  	putname(filename);
^1da177e4c3f415 Linus Torvalds     2005-04-16  825  	return error;
^1da177e4c3f415 Linus Torvalds     2005-04-16  826  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  827  
716f46e637c3e78 Christian Göttsche 2024-04-26  828  static ssize_t path_getxattrat(int dfd, const char __user *pathname,
716f46e637c3e78 Christian Göttsche 2024-04-26  829  			       unsigned int at_flags, const char __user *name,
716f46e637c3e78 Christian Göttsche 2024-04-26  830  			       void __user *value, size_t size)
61a02f83dd87c8b Al Viro            2024-09-26  831  {
61a02f83dd87c8b Al Viro            2024-09-26  832  	struct xattr_name kname;
61a02f83dd87c8b Al Viro            2024-09-26  833  	struct kernel_xattr_ctx ctx = {
61a02f83dd87c8b Al Viro            2024-09-26  834  		.value    = value,
61a02f83dd87c8b Al Viro            2024-09-26  835  		.size     = size,
61a02f83dd87c8b Al Viro            2024-09-26  836  		.kname    = &kname,
61a02f83dd87c8b Al Viro            2024-09-26  837  		.flags    = 0,
61a02f83dd87c8b Al Viro            2024-09-26  838  	};
716f46e637c3e78 Christian Göttsche 2024-04-26  839  	struct filename *filename;
716f46e637c3e78 Christian Göttsche 2024-04-26  840  	ssize_t error;
716f46e637c3e78 Christian Göttsche 2024-04-26  841  
716f46e637c3e78 Christian Göttsche 2024-04-26  842  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
716f46e637c3e78 Christian Göttsche 2024-04-26  843  		return -EINVAL;
61a02f83dd87c8b Al Viro            2024-09-26  844  
61a02f83dd87c8b Al Viro            2024-09-26  845  	error = import_xattr_name(&kname, name);
61a02f83dd87c8b Al Viro            2024-09-26  846  	if (error)
61a02f83dd87c8b Al Viro            2024-09-26  847  		return error;
716f46e637c3e78 Christian Göttsche 2024-04-26  848  
716f46e637c3e78 Christian Göttsche 2024-04-26  849  	filename = getname_maybe_null(pathname, at_flags);
716f46e637c3e78 Christian Göttsche 2024-04-26  850  	if (!filename) {
716f46e637c3e78 Christian Göttsche 2024-04-26  851  		CLASS(fd, f)(dfd);
716f46e637c3e78 Christian Göttsche 2024-04-26  852  		if (fd_empty(f))
716f46e637c3e78 Christian Göttsche 2024-04-26  853  			return -EBADF;
716f46e637c3e78 Christian Göttsche 2024-04-26  854  		return file_getxattr(fd_file(f), &ctx);
716f46e637c3e78 Christian Göttsche 2024-04-26  855  	} else {
716f46e637c3e78 Christian Göttsche 2024-04-26  856  		int lookup_flags = 0;
716f46e637c3e78 Christian Göttsche 2024-04-26  857  		if (!(at_flags & AT_SYMLINK_NOFOLLOW))
716f46e637c3e78 Christian Göttsche 2024-04-26  858  			lookup_flags = LOOKUP_FOLLOW;
716f46e637c3e78 Christian Göttsche 2024-04-26  859  		return filename_getxattr(dfd, filename, lookup_flags, &ctx);
716f46e637c3e78 Christian Göttsche 2024-04-26  860  	}
716f46e637c3e78 Christian Göttsche 2024-04-26  861  }
716f46e637c3e78 Christian Göttsche 2024-04-26  862  
716f46e637c3e78 Christian Göttsche 2024-04-26  863  SYSCALL_DEFINE6(getxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
716f46e637c3e78 Christian Göttsche 2024-04-26  864  		const char __user *, name, struct xattr_args __user *, uargs, size_t, usize)
716f46e637c3e78 Christian Göttsche 2024-04-26  865  {
716f46e637c3e78 Christian Göttsche 2024-04-26  866  	struct xattr_args args = {};
716f46e637c3e78 Christian Göttsche 2024-04-26  867  	int error;
716f46e637c3e78 Christian Göttsche 2024-04-26  868  
716f46e637c3e78 Christian Göttsche 2024-04-26  869  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
716f46e637c3e78 Christian Göttsche 2024-04-26  870  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
716f46e637c3e78 Christian Göttsche 2024-04-26  871  
716f46e637c3e78 Christian Göttsche 2024-04-26  872  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
716f46e637c3e78 Christian Göttsche 2024-04-26  873  		return -EINVAL;
716f46e637c3e78 Christian Göttsche 2024-04-26 @874  	if (usize > PAGE_SIZE)
716f46e637c3e78 Christian Göttsche 2024-04-26  875  		return -E2BIG;
716f46e637c3e78 Christian Göttsche 2024-04-26  876  
716f46e637c3e78 Christian Göttsche 2024-04-26  877  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
716f46e637c3e78 Christian Göttsche 2024-04-26  878  	if (error)
716f46e637c3e78 Christian Göttsche 2024-04-26  879  		return error;
716f46e637c3e78 Christian Göttsche 2024-04-26  880  
716f46e637c3e78 Christian Göttsche 2024-04-26  881  	if (args.flags != 0)
716f46e637c3e78 Christian Göttsche 2024-04-26  882  		return -EINVAL;
716f46e637c3e78 Christian Göttsche 2024-04-26  883  
716f46e637c3e78 Christian Göttsche 2024-04-26  884  	return path_getxattrat(dfd, pathname, at_flags, name,
716f46e637c3e78 Christian Göttsche 2024-04-26  885  			       u64_to_user_ptr(args.value), args.size);
61a02f83dd87c8b Al Viro            2024-09-26  886  }
61a02f83dd87c8b Al Viro            2024-09-26  887  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
