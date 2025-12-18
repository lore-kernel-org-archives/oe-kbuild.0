Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB0B27B353
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766033559; cv=none; b=DE0chJt1uSivHOnjgcvK8nvsC9b5TR4xAYg/ie5Ob0Pnz6K9uHrF6XMNQg8c0m+xKWrSZrfmiDgwYIjjZwiTwUhxaBNcB7VIe0w4I9pSB1p8zJckO9jMq6Qr6CpxHlOsAau38a9lbq2JKYMOjnevry0SG4OP2EwNsQUcl4hl8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766033559; c=relaxed/simple;
	bh=uQRmHRixqSV3yI+0ONDkvo+EXt2WZyAdRG1tOc7VhBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7+7GS6SbrXdf4D701cztemwtVBfKg3EXaNrc4dVuwbPL1UejRw0UzK/bUhbYI1WtgarABOMxKjQ3WF0tav25gDCPjTCNZNL0Nn1Zqxdq/+fPBAMYuouDSfd1cCLFKZyAYSf5iADDccsQ1OJj5J0ZImaSjMZKt9taAOJRsZOEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4QhaGw8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4QhaGw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766033558; x=1797569558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQRmHRixqSV3yI+0ONDkvo+EXt2WZyAdRG1tOc7VhBA=;
  b=S4QhaGw8M1Yy7S2uteC4ucTeaSUjPcZ3E+mAmSSzHqAOTVsT7QmhX5B8
   Rnk9IFXTUwPtQsJA5usgeY0TF4xDbPmumjBynpPR8Jch2KL+IaYhHP2j0
   LSOPM8ghIT2xCLIUg1aMYGJ9hFVpauiYVJKmhG1zqrcUjb9foVQMv5y3e
   F/z4c2ohXzJ/DPsckwly17EdaA81pnJ2LTcHlGgAhPvWmvdySwEoJX3hP
   oFsu4H0pM5q9lir8B0D8nu6hLgsrs+ZW4P2zmndDALSLKKdY4bbV0Wipf
   ILCtz31qTnGM566o62kw95ST8ibG+C0P4gXHO8vhz51h9Q5F5ur/2d5W8
   Q==;
X-CSE-ConnectionGUID: +lbeOTWDS6iIKruJfKdcoA==
X-CSE-MsgGUID: 5Q0oRHABTYiyajwo+HSTnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67872895"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67872895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:52:36 -0800
X-CSE-ConnectionGUID: zX8o9UkbTK6e6lHhNE5KYQ==
X-CSE-MsgGUID: LDhiGeOyRfCHutV5IAyJ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198496017"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Dec 2025 20:52:35 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW608-000000001b0-2XTA;
	Thu, 18 Dec 2025 04:52:32 +0000
Date: Thu, 18 Dec 2025 12:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/android/binder/rust_binderfs.c:134
 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <202512181203.IOv6IChH-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alice Ryhl <aliceryhl@google.com>
CC: Wedson Almeida Filho <wedsonaf@gmail.com>
CC: Matt Gilbride <mattgilbride@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r071-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181203.IOv6IChH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181203.IOv6IChH-lkp@intel.com/

smatch warnings:
drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
drivers/android/binder/rust_binderfs.c:418 binderfs_binder_ctl_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +134 drivers/android/binder/rust_binderfs.c

eafedbc7c050c4 Alice Ryhl 2025-09-19  130  
eafedbc7c050c4 Alice Ryhl 2025-09-19  131  	/* Reserve new minor number for the new device. */
eafedbc7c050c4 Alice Ryhl 2025-09-19  132  	mutex_lock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  133  	if (++info->device_count <= info->mount_opts.max)
eafedbc7c050c4 Alice Ryhl 2025-09-19 @134  		minor = ida_alloc_max(&binderfs_minors,
eafedbc7c050c4 Alice Ryhl 2025-09-19  135  				      use_reserve ? BINDERFS_MAX_MINOR :
eafedbc7c050c4 Alice Ryhl 2025-09-19  136  						    BINDERFS_MAX_MINOR_CAPPED,
eafedbc7c050c4 Alice Ryhl 2025-09-19  137  				      GFP_KERNEL);
eafedbc7c050c4 Alice Ryhl 2025-09-19  138  	else
eafedbc7c050c4 Alice Ryhl 2025-09-19  139  		minor = -ENOSPC;
eafedbc7c050c4 Alice Ryhl 2025-09-19  140  	if (minor < 0) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  141  		--info->device_count;
eafedbc7c050c4 Alice Ryhl 2025-09-19  142  		mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  143  		return minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  144  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  145  	mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  146  
eafedbc7c050c4 Alice Ryhl 2025-09-19  147  	ret = -ENOMEM;
eafedbc7c050c4 Alice Ryhl 2025-09-19  148  	device = kzalloc(sizeof(*device), GFP_KERNEL);
eafedbc7c050c4 Alice Ryhl 2025-09-19  149  	if (!device)
eafedbc7c050c4 Alice Ryhl 2025-09-19  150  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  151  
eafedbc7c050c4 Alice Ryhl 2025-09-19  152  	req->name[BINDERFS_MAX_NAME] = '\0'; /* NUL-terminate */
eafedbc7c050c4 Alice Ryhl 2025-09-19  153  
eafedbc7c050c4 Alice Ryhl 2025-09-19  154  	ctx = rust_binder_new_context(req->name);
eafedbc7c050c4 Alice Ryhl 2025-09-19  155  	if (!ctx)
eafedbc7c050c4 Alice Ryhl 2025-09-19  156  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  157  
eafedbc7c050c4 Alice Ryhl 2025-09-19  158  	inode = new_inode(sb);
eafedbc7c050c4 Alice Ryhl 2025-09-19  159  	if (!inode)
eafedbc7c050c4 Alice Ryhl 2025-09-19  160  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  161  
eafedbc7c050c4 Alice Ryhl 2025-09-19  162  	inode->i_ino = minor + INODE_OFFSET;
eafedbc7c050c4 Alice Ryhl 2025-09-19  163  	simple_inode_init_ts(inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  164  	init_special_inode(inode, S_IFCHR | 0600,
eafedbc7c050c4 Alice Ryhl 2025-09-19  165  			   MKDEV(MAJOR(binderfs_dev), minor));
eafedbc7c050c4 Alice Ryhl 2025-09-19  166  	inode->i_fop = &rust_binder_fops;
eafedbc7c050c4 Alice Ryhl 2025-09-19  167  	inode->i_uid = info->root_uid;
eafedbc7c050c4 Alice Ryhl 2025-09-19  168  	inode->i_gid = info->root_gid;
eafedbc7c050c4 Alice Ryhl 2025-09-19  169  
eafedbc7c050c4 Alice Ryhl 2025-09-19  170  	req->major = MAJOR(binderfs_dev);
eafedbc7c050c4 Alice Ryhl 2025-09-19  171  	req->minor = minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  172  	device->ctx = ctx;
eafedbc7c050c4 Alice Ryhl 2025-09-19  173  	device->minor = minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  174  
eafedbc7c050c4 Alice Ryhl 2025-09-19  175  	if (userp && copy_to_user(userp, req, sizeof(*req))) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  176  		ret = -EFAULT;
eafedbc7c050c4 Alice Ryhl 2025-09-19  177  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  178  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  179  
eafedbc7c050c4 Alice Ryhl 2025-09-19  180  	root = sb->s_root;
eafedbc7c050c4 Alice Ryhl 2025-09-19  181  	inode_lock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  182  
eafedbc7c050c4 Alice Ryhl 2025-09-19  183  	/* look it up */
eafedbc7c050c4 Alice Ryhl 2025-09-19  184  	dentry = lookup_noperm(&QSTR(req->name), root);
eafedbc7c050c4 Alice Ryhl 2025-09-19  185  	if (IS_ERR(dentry)) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  186  		inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  187  		ret = PTR_ERR(dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  188  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  189  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  190  
eafedbc7c050c4 Alice Ryhl 2025-09-19  191  	if (d_really_is_positive(dentry)) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  192  		/* already exists */
eafedbc7c050c4 Alice Ryhl 2025-09-19  193  		dput(dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  194  		inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  195  		ret = -EEXIST;
eafedbc7c050c4 Alice Ryhl 2025-09-19  196  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  197  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  198  
eafedbc7c050c4 Alice Ryhl 2025-09-19  199  	inode->i_private = device;
eafedbc7c050c4 Alice Ryhl 2025-09-19  200  	d_instantiate(dentry, inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  201  	fsnotify_create(root->d_inode, dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  202  	inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  203  
eafedbc7c050c4 Alice Ryhl 2025-09-19  204  	return 0;
eafedbc7c050c4 Alice Ryhl 2025-09-19  205  
eafedbc7c050c4 Alice Ryhl 2025-09-19  206  err:
eafedbc7c050c4 Alice Ryhl 2025-09-19  207  	kfree(device);
eafedbc7c050c4 Alice Ryhl 2025-09-19  208  	rust_binder_remove_context(ctx);
eafedbc7c050c4 Alice Ryhl 2025-09-19  209  	mutex_lock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  210  	--info->device_count;
eafedbc7c050c4 Alice Ryhl 2025-09-19  211  	ida_free(&binderfs_minors, minor);
eafedbc7c050c4 Alice Ryhl 2025-09-19  212  	mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  213  	iput(inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  214  
eafedbc7c050c4 Alice Ryhl 2025-09-19  215  	return ret;
eafedbc7c050c4 Alice Ryhl 2025-09-19  216  }
eafedbc7c050c4 Alice Ryhl 2025-09-19  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
