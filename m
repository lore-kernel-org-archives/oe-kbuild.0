Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C01195
	for <oe-kbuild@lists.linux.dev>; Sun, 26 May 2024 00:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716681810; cv=none; b=lxIC65fCQK4dTAJI66uEy2oFXoxlCBMYcbZvw509BmTwTTTJCsJGAwVUkjoPqWNBBqXN6yhUCYVUsPiyV8UMU+Vzj9yz4tUBmDBVyf5U0XnASPEkBjkHer9K9+lkCIx38OG0zsrOR138VZwVbetP5iXj5FmdQQPj2gc10WEsMEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716681810; c=relaxed/simple;
	bh=YYN8uKLwE36dsIhNkC7lqw2mGqZuz8sj9xf68iZiVLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVS3ryTneIGSayJ0gKc4OeOo1+lmgfA3vfc/7L0S3LBV5hC6SOuGJF/f2+pZ1XcVpKy+/8zr0CnXUj1I3B7bAPEsaG1BhD+JrV0kcDhJn/K3L340CQwYyqlk+J8gWhpFqVXkF/MPQiKJJEj9WYZ6TtkTYR/5hQUu8L+ucnUvuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3DU5tht; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3DU5tht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716681808; x=1748217808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YYN8uKLwE36dsIhNkC7lqw2mGqZuz8sj9xf68iZiVLs=;
  b=g3DU5thtR6At3d/nBAKvh7ip8vUHAo1a41Vyjd740sL8UYdufTXLPkLG
   kaNOlptTfT5HGzxYShaA9Ff9jKPiWX8IdFv3pPOTti8ih0sYBa2SAoLHu
   GK3IQfjxBp2t9j9PpgSD35NMcC/KFxNqDIqXV9GpCRFae0iI1NTW477dT
   eAZqdz5Cx/6w3QkW1Fkvqd9pKeEzbeeRt1IUUqbgHvRblo3Y2SHKn6QxC
   C1/YvD/GwAwgfqs2LUcInzAfDWybsmS90QLFmPu2Qj8hhn2vlmfj/AlGY
   JZyYWtsE+eRY3V4K9/EdrDjaXOQLiez/eCrL0vGtUProHtmFOcPdUs90A
   Q==;
X-CSE-ConnectionGUID: pD016LjyQAKkQMkaHTqJlQ==
X-CSE-MsgGUID: HRPOsy8QQW2BdcmqbXaWKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="11697134"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="11697134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 17:03:28 -0700
X-CSE-ConnectionGUID: /DlQA6nyQ++1ER1nQMxWGw==
X-CSE-MsgGUID: 5Ic+zzWFS4WjTYe8A/eKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="65605005"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2024 17:03:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB1MC-0007Y3-0D;
	Sun, 26 May 2024 00:03:24 +0000
Date: Sun, 26 May 2024 08:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC] : fhandle: relax open_by_handle_at() permission
 checks
Message-ID: <202405260707.w8Nh9Nv6-lkp@intel.com>
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
In-Reply-To: <20240524-vfs-open_by_handle_at-v1-1-3d4b7d22736b@kernel.org>
References: <20240524-vfs-open_by_handle_at-v1-1-3d4b7d22736b@kernel.org>
TO: Christian Brauner <brauner@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/fhandle-relax-open_by_handle_at-permission-checks/20240524-182059
base:   8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6
patch link:    https://lore.kernel.org/r/20240524-vfs-open_by_handle_at-v1-1-3d4b7d22736b%40kernel.org
patch subject: [PATCH RFC] : fhandle: relax open_by_handle_at() permission checks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240525 (https://download.01.org/0day-ci/archive/20240526/202405260707.w8Nh9Nv6-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405260707.w8Nh9Nv6-lkp@intel.com/

smatch warnings:
fs/fhandle.c:296 handle_to_path() warn: fd re-used after fget(): 'mountdirfd'

vim +/mountdirfd +296 fs/fhandle.c

becfd1f3754479 Aneesh Kumar K.V    2011-01-29  219  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  220  static int handle_to_path(int mountdirfd, struct file_handle __user *ufh,
9ca8b65e411ba7 Christian Brauner   2024-05-24  221  		   struct path *path, unsigned int o_flags)
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  222  {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  223  	int retval = 0;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  224  	struct file_handle f_handle;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  225  	struct file_handle *handle = NULL;
9ca8b65e411ba7 Christian Brauner   2024-05-24  226  	struct handle_to_path_ctx ctx = {};
9ca8b65e411ba7 Christian Brauner   2024-05-24  227  
9ca8b65e411ba7 Christian Brauner   2024-05-24  228  	retval = get_path_from_fd(mountdirfd, &ctx.root);
9ca8b65e411ba7 Christian Brauner   2024-05-24  229  	if (retval)
9ca8b65e411ba7 Christian Brauner   2024-05-24  230  		goto out_err;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  231  
9ca8b65e411ba7 Christian Brauner   2024-05-24  232  	if (!capable(CAP_DAC_READ_SEARCH)) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  233  		/*
9ca8b65e411ba7 Christian Brauner   2024-05-24  234  		 * Allow relaxed permissions of file handles if the caller has
9ca8b65e411ba7 Christian Brauner   2024-05-24  235  		 * the ability to mount the filesystem or create a bind-mount
9ca8b65e411ba7 Christian Brauner   2024-05-24  236  		 * of the provided @mountdirfd.
9ca8b65e411ba7 Christian Brauner   2024-05-24  237  		 *
9ca8b65e411ba7 Christian Brauner   2024-05-24  238  		 * In both cases the caller may be able to get an unobstructed
9ca8b65e411ba7 Christian Brauner   2024-05-24  239  		 * way to the encoded file handle. If the caller is only able
9ca8b65e411ba7 Christian Brauner   2024-05-24  240  		 * to create a bind-mount we need to verify that there are no
9ca8b65e411ba7 Christian Brauner   2024-05-24  241  		 * locked mounts on top of it that could prevent us from
9ca8b65e411ba7 Christian Brauner   2024-05-24  242  		 * getting to the encoded file.
9ca8b65e411ba7 Christian Brauner   2024-05-24  243  		 *
9ca8b65e411ba7 Christian Brauner   2024-05-24  244  		 * In principle, locked mounts can prevent the caller from
9ca8b65e411ba7 Christian Brauner   2024-05-24  245  		 * mounting the filesystem but that only applies to procfs and
9ca8b65e411ba7 Christian Brauner   2024-05-24  246  		 * sysfs neither of which support decoding file handles.
9ca8b65e411ba7 Christian Brauner   2024-05-24  247  		 *
9ca8b65e411ba7 Christian Brauner   2024-05-24  248  		 * This is currently restricted to O_DIRECTORY to provide a
9ca8b65e411ba7 Christian Brauner   2024-05-24  249  		 * deterministic API that avoids a confusing api in the face of
9ca8b65e411ba7 Christian Brauner   2024-05-24  250  		 * disconnected non-dir dentries.
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  251  		 */
9ca8b65e411ba7 Christian Brauner   2024-05-24  252  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  253  		retval = -EPERM;
9ca8b65e411ba7 Christian Brauner   2024-05-24  254  		if (!(o_flags & O_DIRECTORY))
9ca8b65e411ba7 Christian Brauner   2024-05-24  255  			goto out_path;
9ca8b65e411ba7 Christian Brauner   2024-05-24  256  
9ca8b65e411ba7 Christian Brauner   2024-05-24  257  		if (ns_capable(ctx.root.mnt->mnt_sb->s_user_ns, CAP_SYS_ADMIN))
9ca8b65e411ba7 Christian Brauner   2024-05-24  258  			ctx.flags = HANDLE_CHECK_PERMS;
9ca8b65e411ba7 Christian Brauner   2024-05-24  259  		else if (ns_capable(real_mount(ctx.root.mnt)->mnt_ns->user_ns, CAP_SYS_ADMIN) &&
9ca8b65e411ba7 Christian Brauner   2024-05-24  260  			   !has_locked_children(real_mount(ctx.root.mnt), ctx.root.dentry))
9ca8b65e411ba7 Christian Brauner   2024-05-24  261  			ctx.flags = HANDLE_CHECK_PERMS | HANDLE_CHECK_SUBTREE;
9ca8b65e411ba7 Christian Brauner   2024-05-24  262  		else
9ca8b65e411ba7 Christian Brauner   2024-05-24  263  			goto out_path;
9ca8b65e411ba7 Christian Brauner   2024-05-24  264  
9ca8b65e411ba7 Christian Brauner   2024-05-24  265  		/* Are we able to override DAC permissions? */
9ca8b65e411ba7 Christian Brauner   2024-05-24  266  		if (!ns_capable(current_user_ns(), CAP_DAC_READ_SEARCH))
9ca8b65e411ba7 Christian Brauner   2024-05-24  267  			goto out_path;
9ca8b65e411ba7 Christian Brauner   2024-05-24  268  
9ca8b65e411ba7 Christian Brauner   2024-05-24  269  		ctx.directory = true;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  270  	}
9ca8b65e411ba7 Christian Brauner   2024-05-24  271  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  272  	if (copy_from_user(&f_handle, ufh, sizeof(struct file_handle))) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  273  		retval = -EFAULT;
9ca8b65e411ba7 Christian Brauner   2024-05-24  274  		goto out_path;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  275  	}
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  276  	if ((f_handle.handle_bytes > MAX_HANDLE_SZ) ||
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  277  	    (f_handle.handle_bytes == 0)) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  278  		retval = -EINVAL;
9ca8b65e411ba7 Christian Brauner   2024-05-24  279  		goto out_path;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  280  	}
68d6f4f3fbd9b1 Gustavo A. R. Silva 2024-03-25  281  	handle = kmalloc(struct_size(handle, f_handle, f_handle.handle_bytes),
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  282  			 GFP_KERNEL);
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  283  	if (!handle) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  284  		retval = -ENOMEM;
9ca8b65e411ba7 Christian Brauner   2024-05-24  285  		goto out_path;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  286  	}
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  287  	/* copy the full handle */
161f873b89136e Sasha Levin         2015-01-28  288  	*handle = f_handle;
161f873b89136e Sasha Levin         2015-01-28  289  	if (copy_from_user(&handle->f_handle,
161f873b89136e Sasha Levin         2015-01-28  290  			   &ufh->f_handle,
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  291  			   f_handle.handle_bytes)) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  292  		retval = -EFAULT;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  293  		goto out_handle;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  294  	}
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  295  
9ca8b65e411ba7 Christian Brauner   2024-05-24 @296  	retval = do_handle_to_path(mountdirfd, handle, path, &ctx);
9ca8b65e411ba7 Christian Brauner   2024-05-24  297  	if (retval)
9ca8b65e411ba7 Christian Brauner   2024-05-24  298  		goto out_handle;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  299  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  300  out_handle:
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  301  	kfree(handle);
9ca8b65e411ba7 Christian Brauner   2024-05-24  302  out_path:
9ca8b65e411ba7 Christian Brauner   2024-05-24  303  	path_put(&ctx.root);
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  304  out_err:
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  305  	return retval;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  306  }
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
