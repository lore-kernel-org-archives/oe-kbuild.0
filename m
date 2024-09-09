Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B812E4A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 04:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725856893; cv=none; b=B1KVLjJ1zHQxamcwJwcU4I31Ubte2IwtRiNIC4ZYmR3JfwC0fxds0CGBTIrUjP8yoscAaU1b//kf3kKyi9oeEMAM8Di8FJUnLgZApZbJSrIjj+6L6i5j06/8+T5MUxgkzuMAhZs/epqjOAdA+xMRcQ8igkdC78yqg0bkxr7wE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725856893; c=relaxed/simple;
	bh=y6Xm/spRtTMErgSCFVLU6Phck4ZMBeWNJadlg1GZoWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+20jXETwDfNLvh7VnwkxsH5Cc8tBcgnLR45ceWAeoGzEiqXyPc6u1iTyD8PSOzKq3wU+dalwF0U1941KfG1P6d0DVT3LTji0oOzvkMgoZHgicTyOOKSXeStmSAuDPPxbeBOBQxajLj+Kj/cXN6EGZXZEGzLRsWpe0kLLdkU7pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT9Uhzcu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT9Uhzcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725856891; x=1757392891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y6Xm/spRtTMErgSCFVLU6Phck4ZMBeWNJadlg1GZoWk=;
  b=NT9UhzcuuFN4Eof/bu2Wp6/apjfRYhGPhEB73fqebMHB6TlUFybvzo5M
   QIfiouujh7/oPLXRu7rzJPzh/l8CrafPtfRJ+Q1z7evUIvpvOJ5JYjmt9
   1qnKySC0gwkt2FnQpKIPrpCDPNuyaoFtKpgimhMuni1MLw4+vYobVo8Cr
   P9lC0Ulo0eyd70Zx0kldhEjuSyoM0tcxN3AWB+Zr/ca7Quj2+KsxDfsbV
   sdfwfdZbhKXXqRqzH4bnR4RBAmiARK0XMjOvv65L+KMSzHPcryoFjWF7x
   KLa+IfR6QoHnMKQ3VqtzNBSQqwtyJJnV+khkqz1JQHleIM/wcNvEVIhA6
   Q==;
X-CSE-ConnectionGUID: W7vJ2MiZRwG5hGGq+X6iKg==
X-CSE-MsgGUID: ywq3FWmnT9GpOxGba9O5jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="13434250"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="13434250"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:41:28 -0700
X-CSE-ConnectionGUID: FO/9k3duTV+EWreILME3zg==
X-CSE-MsgGUID: m/czF9OxS4u3bdFWjKxwXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="71493172"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2024 21:41:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snWDM-000EIi-0o;
	Mon, 09 Sep 2024 04:41:24 +0000
Date: Mon, 9 Sep 2024 12:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2 04/10] openat2: add CHECK_FIELDS flag to usize
 argument
Message-ID: <202409091242.KVFltqkq-lkp@intel.com>
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
In-Reply-To: <20240906-extensible-structs-check_fields-v2-4-0f46d2de9bad@cyphar.com>
References: <20240906-extensible-structs-check_fields-v2-4-0f46d2de9bad@cyphar.com>
TO: Aleksa Sarai <cyphar@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/uaccess-add-copy_struct_to_user-helper/20240905-230518
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240906-extensible-structs-check_fields-v2-4-0f46d2de9bad%40cyphar.com
patch subject: [PATCH RFC v2 04/10] openat2: add CHECK_FIELDS flag to usize argument
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091242.KVFltqkq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409091242.KVFltqkq-lkp@intel.com/

smatch warnings:
include/linux/uaccess.h:477 copy_struct_to_user() warn: maybe return -EFAULT instead of the bytes remaining?

vim +477 include/linux/uaccess.h

f5a1a536fa1489 Aleksa Sarai 2019-10-01  389  
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  390  /**
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  391   * copy_struct_to_user: copy a struct to userspace
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  392   * @dst:   Destination address, in userspace. This buffer must be @ksize
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  393   *         bytes long.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  394   * @usize: (Alleged) size of @dst struct.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  395   * @src:   Source address, in kernel space.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  396   * @ksize: Size of @src struct.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  397   * @ignored_trailing: Set to %true if there was a non-zero byte in @src that
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  398   * userspace cannot see because they are using an smaller struct.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  399   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  400   * Copies a struct from kernel space to userspace, in a way that guarantees
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  401   * backwards-compatibility for struct syscall arguments (as long as future
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  402   * struct extensions are made such that all new fields are *appended* to the
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  403   * old struct, and zeroed-out new fields have the same meaning as the old
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  404   * struct).
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  405   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  406   * Some syscalls may wish to make sure that userspace knows about everything in
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  407   * the struct, and if there is a non-zero value that userspce doesn't know
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  408   * about, they want to return an error (such as -EMSGSIZE) or have some other
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  409   * fallback (such as adding a "you're missing some information" flag). If
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  410   * @ignored_trailing is non-%NULL, it will be set to %true if there was a
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  411   * non-zero byte that could not be copied to userspace (ie. was past @usize).
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  412   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  413   * While unconditionally returning an error in this case is the simplest
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  414   * solution, for maximum backward compatibility you should try to only return
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  415   * -EMSGSIZE if the user explicitly requested the data that couldn't be copied.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  416   * Note that structure sizes can change due to header changes and simple
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  417   * recompilations without code changes(!), so if you care about
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  418   * @ignored_trailing you probably want to make sure that any new field data is
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  419   * associated with a flag. Otherwise you might assume that a program knows
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  420   * about data it does not.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  421   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  422   * @ksize is just sizeof(*src), and @usize should've been passed by userspace.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  423   * The recommended usage is something like the following:
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  424   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  425   *   SYSCALL_DEFINE2(foobar, struct foo __user *, uarg, size_t, usize)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  426   *   {
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  427   *      int err;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  428   *      bool ignored_trailing;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  429   *      struct foo karg = {};
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  430   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  431   *      if (usize > PAGE_SIZE)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  432   *		return -E2BIG;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  433   *      if (usize < FOO_SIZE_VER0)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  434   *		return -EINVAL;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  435   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  436   *      // ... modify karg somehow ...
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  437   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  438   *      err = copy_struct_to_user(uarg, usize, &karg, sizeof(karg),
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  439   *				  &ignored_trailing);
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  440   *      if (err)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  441   *		return err;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  442   *      if (ignored_trailing)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  443   *		return -EMSGSIZE:
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  444   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  445   *      // ...
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  446   *   }
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  447   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  448   * There are three cases to consider:
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  449   *  * If @usize == @ksize, then it's copied verbatim.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  450   *  * If @usize < @ksize, then the kernel is trying to pass userspace a newer
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  451   *    struct than it supports. Thus we only copy the interoperable portions
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  452   *    (@usize) and ignore the rest (but @ignored_trailing is set to %true if
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  453   *    any of the trailing (@ksize - @usize) bytes are non-zero).
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  454   *  * If @usize > @ksize, then the kernel is trying to pass userspace an older
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  455   *    struct than userspace supports. In order to make sure the
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  456   *    unknown-to-the-kernel fields don't contain garbage values, we zero the
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  457   *    trailing (@usize - @ksize) bytes.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  458   *
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  459   * Returns (in all cases, some data may have been copied):
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  460   *  * -EFAULT: access to userspace failed.
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  461   */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  462  static __always_inline __must_check int
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  463  copy_struct_to_user(void __user *dst, size_t usize, const void *src,
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  464  		    size_t ksize, bool *ignored_trailing)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  465  {
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  466  	size_t size = min(ksize, usize);
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  467  	size_t rest = max(ksize, usize) - size;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  468  
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  469  	/* Double check if ksize is larger than a known object size. */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  470  	if (WARN_ON_ONCE(ksize > __builtin_object_size(src, 1)))
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  471  		return -E2BIG;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  472  
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  473  	/* Deal with trailing bytes. */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  474  	if (usize > ksize) {
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  475  		int ret = clear_user(dst + size, rest);
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  476  		if (ret)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06 @477  			return ret;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  478  	}
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  479  	if (ignored_trailing)
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  480  		*ignored_trailing = ksize < usize &&
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  481  			memchr_inv(src + size, 0, rest) != NULL;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  482  	/* Copy the interoperable parts of the struct. */
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  483  	if (copy_to_user(dst, src, size))
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  484  		return -EFAULT;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  485  	return 0;
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  486  }
7f6f15ec9e2720 Aleksa Sarai 2024-09-06  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
