Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0844A59;
	Thu, 27 Feb 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644535; cv=none; b=JQ2YJ5JVAsx2D8CEGwVg7ADLe8E7S5wE9ca7BENE7ZLx6etrpze5Mic9ZNbSOrn6l7Mc/3yqeD8akGM6OoSx6urh1eBaXh49DmD4arHumQk7xNL/ifGXzDaSrieEByxHjX6+qgpB4CTh4IsFa3VY0RtxFqCPGZV2fTI8Qr3qFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644535; c=relaxed/simple;
	bh=i1tZQ1KuwXwY1mpyJhajQ5uEpeTFDlu9mBg1cydprLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjczjP9g7BSQr2Qst7lzvE0ILN5Zmygh69R3df29GmC1EqanR+7pSYzX4D9kCZ2QH1DuJk22MKEPk0Mrnffzyt5kxcKuEBP6GmlfRK2GBEshN/fIX8IwTqaDSIe1UbkfZsxUXnUIEnwaBGQR01g14hZI3zIStDT1sW/Mqhz+pLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gghl67Az; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gghl67Az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFD1C4CEDD;
	Thu, 27 Feb 2025 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740644534;
	bh=i1tZQ1KuwXwY1mpyJhajQ5uEpeTFDlu9mBg1cydprLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gghl67AzbmKpCkocUr8laoREpRbdf3xbUGqpQbmD9LiVxM8Ta4DE+dn3Waf9A1uL2
	 obHEK6FpIKDtwBtfa5pPqPOKUGlWn2cj5yNI7xjb5lsYZY7038bm0qP+SIc2KOs4Ad
	 gTNFz3mgPBf/Q0dgnjs5oIt9BqilMGT3WDQT9byfm8CXUijw8X5CMRWJulBI10XWzR
	 bvFzXpJx5FaheXQjGCNPzDA9X/BgEqG7FiGtGSDfIeIR5UlorXrBa8fkNhZBSsg0Ay
	 OBWVLpMfxrPKHMtc0J3Gl/MLC4Z9LPdULO4y7zIFBkl6Xk3oDmb8CkH9viRo9UDsV8
	 x3RVOy76qqHXA==
Date: Thu, 27 Feb 2025 09:22:10 +0100
From: Christian Brauner <brauner@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 6012/6583] fs/namespace.c:4442
 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
Message-ID: <20250227-fortgehen-kaleidoskop-53bbd5f32e71@brauner>
References: <3908ce12-4db7-4408-9d5e-98ad94c141dd@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3908ce12-4db7-4408-9d5e-98ad94c141dd@stanley.mountain>

On Wed, Feb 26, 2025 at 03:24:12PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
> commit: b1e9423d65e330346f9e80e819872ab66f1e35b6 [6012/6583] fs: support getname_maybe_null() in move_mount()
> config: x86_64-randconfig-161-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262044.uRrhoaDw-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502262044.uRrhoaDw-lkp@intel.com/
> 
> New smatch warnings:
> fs/namespace.c:4442 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
> fs/namespace.c:4442 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
> 
> vim +/uflags +4442 fs/namespace.c

Thanks for the report, Dan!
I've already accepted a patch that fixes this issue!

> 
> 2db154b3ea8e14 David Howells     2018-11-05  4412  SYSCALL_DEFINE5(move_mount,
> 2658ce095df583 Ben Dooks         2019-10-15  4413  		int, from_dfd, const char __user *, from_pathname,
> 2658ce095df583 Ben Dooks         2019-10-15  4414  		int, to_dfd, const char __user *, to_pathname,
> 2db154b3ea8e14 David Howells     2018-11-05  4415  		unsigned int, flags)
> 2db154b3ea8e14 David Howells     2018-11-05  4416  {
> b1e9423d65e330 Christian Brauner 2025-02-21  4417  	struct path to_path __free(path_put) = {};
> b1e9423d65e330 Christian Brauner 2025-02-21  4418  	struct path from_path __free(path_put) = {};
> b1e9423d65e330 Christian Brauner 2025-02-21  4419  	struct filename *to_name __free(putname) = NULL;
> b1e9423d65e330 Christian Brauner 2025-02-21  4420  	struct filename *from_name __free(putname) = NULL;
> b1e9423d65e330 Christian Brauner 2025-02-21  4421  	unsigned int lflags, uflags;
> b1e9423d65e330 Christian Brauner 2025-02-21  4422  	enum mnt_tree_flags_t mflags = 0;
> 2db154b3ea8e14 David Howells     2018-11-05  4423  	int ret = 0;
> 2db154b3ea8e14 David Howells     2018-11-05  4424  
> 2db154b3ea8e14 David Howells     2018-11-05  4425  	if (!may_mount())
> 2db154b3ea8e14 David Howells     2018-11-05  4426  		return -EPERM;
> 2db154b3ea8e14 David Howells     2018-11-05  4427  
> 2db154b3ea8e14 David Howells     2018-11-05  4428  	if (flags & ~MOVE_MOUNT__MASK)
> 2db154b3ea8e14 David Howells     2018-11-05  4429  		return -EINVAL;
> 2db154b3ea8e14 David Howells     2018-11-05  4430  
> 6ac392815628f3 Christian Brauner 2023-05-03  4431  	if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
> 6ac392815628f3 Christian Brauner 2023-05-03  4432  	    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
> 6ac392815628f3 Christian Brauner 2023-05-03  4433  		return -EINVAL;
> 6ac392815628f3 Christian Brauner 2023-05-03  4434  
> b1e9423d65e330 Christian Brauner 2025-02-21  4435  	if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
> b1e9423d65e330 Christian Brauner 2025-02-21  4436  	if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
> b1e9423d65e330 Christian Brauner 2025-02-21  4437  
> 2db154b3ea8e14 David Howells     2018-11-05  4438  	lflags = 0;
> 2db154b3ea8e14 David Howells     2018-11-05  4439  	if (flags & MOVE_MOUNT_F_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
> 2db154b3ea8e14 David Howells     2018-11-05  4440  	if (flags & MOVE_MOUNT_F_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
> b1e9423d65e330 Christian Brauner 2025-02-21  4441  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
> 
> uflags is uninitialized on the else path.
> 
> b1e9423d65e330 Christian Brauner 2025-02-21 @4442  	from_name = getname_maybe_null(from_pathname, uflags);
> b1e9423d65e330 Christian Brauner 2025-02-21  4443  	if (IS_ERR(from_name))
> b1e9423d65e330 Christian Brauner 2025-02-21  4444  		return PTR_ERR(from_name);
> 2db154b3ea8e14 David Howells     2018-11-05  4445  
> 2db154b3ea8e14 David Howells     2018-11-05  4446  	lflags = 0;
> 2db154b3ea8e14 David Howells     2018-11-05  4447  	if (flags & MOVE_MOUNT_T_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
> 2db154b3ea8e14 David Howells     2018-11-05  4448  	if (flags & MOVE_MOUNT_T_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
> b1e9423d65e330 Christian Brauner 2025-02-21  4449  	if (flags & MOVE_MOUNT_T_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
> b1e9423d65e330 Christian Brauner 2025-02-21  4450  	to_name = getname_maybe_null(to_pathname, uflags);
> b1e9423d65e330 Christian Brauner 2025-02-21  4451  	if (IS_ERR(to_name))
> b1e9423d65e330 Christian Brauner 2025-02-21  4452  		return PTR_ERR(to_name);
> b1e9423d65e330 Christian Brauner 2025-02-21  4453  
> b1e9423d65e330 Christian Brauner 2025-02-21  4454  	if (!to_name && to_dfd >= 0) {
> b1e9423d65e330 Christian Brauner 2025-02-21  4455  		CLASS(fd_raw, f_to)(to_dfd);
> b1e9423d65e330 Christian Brauner 2025-02-21  4456  		if (fd_empty(f_to))
> b1e9423d65e330 Christian Brauner 2025-02-21  4457  			return -EBADF;
> 2db154b3ea8e14 David Howells     2018-11-05  4458  
> b1e9423d65e330 Christian Brauner 2025-02-21  4459  		to_path = fd_file(f_to)->f_path;
> b1e9423d65e330 Christian Brauner 2025-02-21  4460  		path_get(&to_path);
> b1e9423d65e330 Christian Brauner 2025-02-21  4461  	} else {
> b1e9423d65e330 Christian Brauner 2025-02-21  4462  		ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
> b1e9423d65e330 Christian Brauner 2025-02-21  4463  		if (ret)
> b1e9423d65e330 Christian Brauner 2025-02-21  4464  			return ret;
> b1e9423d65e330 Christian Brauner 2025-02-21  4465  	}
> 2db154b3ea8e14 David Howells     2018-11-05  4466  
> b1e9423d65e330 Christian Brauner 2025-02-21  4467  	if (!from_name && from_dfd >= 0) {
> b1e9423d65e330 Christian Brauner 2025-02-21  4468  		CLASS(fd_raw, f_from)(from_dfd);
> b1e9423d65e330 Christian Brauner 2025-02-21  4469  		if (fd_empty(f_from))
> b1e9423d65e330 Christian Brauner 2025-02-21  4470  			return -EBADF;
> 2db154b3ea8e14 David Howells     2018-11-05  4471  
> b1e9423d65e330 Christian Brauner 2025-02-21  4472  		return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
> b1e9423d65e330 Christian Brauner 2025-02-21  4473  	}
> 2db154b3ea8e14 David Howells     2018-11-05  4474  
> b1e9423d65e330 Christian Brauner 2025-02-21  4475  	ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
> b1e9423d65e330 Christian Brauner 2025-02-21  4476  	if (ret)
> 2db154b3ea8e14 David Howells     2018-11-05  4477  		return ret;
> b1e9423d65e330 Christian Brauner 2025-02-21  4478  
> b1e9423d65e330 Christian Brauner 2025-02-21  4479  	return vfs_move_mount(&from_path, &to_path, mflags);
> 2db154b3ea8e14 David Howells     2018-11-05  4480  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
