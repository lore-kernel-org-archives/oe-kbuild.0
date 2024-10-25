Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C156176AAD
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729834488; cv=none; b=BCmQTUaMKjFNZkBcMaZGVpuzBc2A16ErzoyVlELW7sXdU1SxsoTqepdVwVURWgu692KGVu3F25LD/2tOGLu8kD3c2+uZtepmGkflWBXCpVg3glCzn6l0uV+qT+s9LKfjmkgSma/BnJyEcGdWF8HrFcKTydGault6jjUb8WPZ6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729834488; c=relaxed/simple;
	bh=WaqDo3uuBkCa4yMd4kI9GBmoJj2jllUn337NMXzS2zM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=he7mfcobwuIdD29QfziH2qHxooyOhe8A7d3KUquFVmMs/hDO8N4GAh70Ze1O8GLjLy7O4t/HXTedg3ZmykI/rIJJtRt611r6ge3Iy4Glw0R8NnlyIusSRo9jvkey9vyqX4QLXtk6po15DQrNaOqtlHYZwoD/umBN2+jJ/MxRhAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UthXl+G7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UthXl+G7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729834485; x=1761370485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaqDo3uuBkCa4yMd4kI9GBmoJj2jllUn337NMXzS2zM=;
  b=UthXl+G7smw9Us3nOtxtho4YUIoWj5D3e2Fo7ItdESCKgB8hcHLH+jas
   dKB+nOkSwHatbNByAco3oZbJ/qHx8WEQLvMGiUQ9NtZWvxJ6yMn0wLBwz
   vlkGFLZCbrlp2tgI5Vsca71ANPR+P380d4qZ960gcmhLgsMVlzD4YHCD9
   f4bbZP/jvjqmKH5XL5HNl23PfzEkDk6dWIxRdjM9YfpKzHVezzxDZKGHq
   d5bHsDBv3bnP10hjJLUzticobW0z3a31Iwj7Yl6NOE2j8+UTPRjG8ETI4
   QHX4rkDPRtaL2cvM3HJUKE7Cj277SqrihlKjM7wP6wmIztEVQTNaPUtfe
   A==;
X-CSE-ConnectionGUID: Jq3ZJQiCTCuFDJoVPth9PQ==
X-CSE-MsgGUID: IYE5JjU8QqCAe1iOmvI4ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29618336"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29618336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:34:44 -0700
X-CSE-ConnectionGUID: HwilGImgQVioxanVxUItqQ==
X-CSE-MsgGUID: cJp0niS2TiSz9iurYksw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80914723"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2024 22:34:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Cy8-000XdU-1G;
	Fri, 25 Oct 2024 05:34:40 +0000
Date: Fri, 25 Oct 2024 13:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/5] btrfs: add io_uring command for encoded reads
Message-ID: <202410251226.ZgQuLxZr-lkp@intel.com>
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
In-Reply-To: <20241022145024.1046883-6-maharmstone@fb.com>
References: <20241022145024.1046883-6-maharmstone@fb.com>
TO: Mark Harmstone <maharmstone@fb.com>

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20241024]
[cannot apply to linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Harmstone/btrfs-remove-pointless-addition-in-btrfs_encoded_read/20241022-225240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20241022145024.1046883-6-maharmstone%40fb.com
patch subject: [PATCH 5/5] btrfs: add io_uring command for encoded reads
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: xtensa-randconfig-r072-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251226.ZgQuLxZr-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410251226.ZgQuLxZr-lkp@intel.com/

New smatch warnings:
fs/btrfs/ioctl.c:4980 btrfs_uring_encoded_read() warn: potential user controlled sizeof overflow '8 * args.iovcnt' '8 * 0-u32max'

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
fs/btrfs/ioctl.c:4990 btrfs_uring_encoded_read() warn: potential user controlled sizeof overflow '8 * args.iovcnt' '8 * 0-u32max'

vim +4980 fs/btrfs/ioctl.c

dd13a57c79e014 Mark Harmstone 2024-10-22  4875  
dd13a57c79e014 Mark Harmstone 2024-10-22  4876  static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd,
dd13a57c79e014 Mark Harmstone 2024-10-22  4877  				    unsigned int issue_flags)
dd13a57c79e014 Mark Harmstone 2024-10-22  4878  {
dd13a57c79e014 Mark Harmstone 2024-10-22  4879  	size_t copy_end_kernel = offsetofend(struct btrfs_ioctl_encoded_io_args,
dd13a57c79e014 Mark Harmstone 2024-10-22  4880  					     flags);
dd13a57c79e014 Mark Harmstone 2024-10-22  4881  	size_t copy_end;
dd13a57c79e014 Mark Harmstone 2024-10-22  4882  	struct btrfs_ioctl_encoded_io_args args = { 0 };
dd13a57c79e014 Mark Harmstone 2024-10-22  4883  	int ret;
dd13a57c79e014 Mark Harmstone 2024-10-22  4884  	u64 disk_bytenr, disk_io_size;
dd13a57c79e014 Mark Harmstone 2024-10-22  4885  	struct file *file = cmd->file;
dd13a57c79e014 Mark Harmstone 2024-10-22  4886  	struct btrfs_inode *inode = BTRFS_I(file->f_inode);
dd13a57c79e014 Mark Harmstone 2024-10-22  4887  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
dd13a57c79e014 Mark Harmstone 2024-10-22  4888  	struct extent_io_tree *io_tree = &inode->io_tree;
dd13a57c79e014 Mark Harmstone 2024-10-22  4889  	struct iovec iovstack[UIO_FASTIOV];
dd13a57c79e014 Mark Harmstone 2024-10-22  4890  	struct iovec *iov = iovstack;
dd13a57c79e014 Mark Harmstone 2024-10-22  4891  	struct iov_iter iter;
dd13a57c79e014 Mark Harmstone 2024-10-22  4892  	loff_t pos;
dd13a57c79e014 Mark Harmstone 2024-10-22  4893  	struct kiocb kiocb;
dd13a57c79e014 Mark Harmstone 2024-10-22  4894  	struct extent_state *cached_state = NULL;
dd13a57c79e014 Mark Harmstone 2024-10-22  4895  	u64 start, lockend;
dd13a57c79e014 Mark Harmstone 2024-10-22  4896  	void __user *sqe_addr = u64_to_user_ptr(READ_ONCE(cmd->sqe->addr));
dd13a57c79e014 Mark Harmstone 2024-10-22  4897  
dd13a57c79e014 Mark Harmstone 2024-10-22  4898  	if (!capable(CAP_SYS_ADMIN)) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4899  		ret = -EPERM;
dd13a57c79e014 Mark Harmstone 2024-10-22  4900  		goto out_acct;
dd13a57c79e014 Mark Harmstone 2024-10-22  4901  	}
dd13a57c79e014 Mark Harmstone 2024-10-22  4902  
dd13a57c79e014 Mark Harmstone 2024-10-22  4903  	if (issue_flags & IO_URING_F_COMPAT) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4904  #if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
dd13a57c79e014 Mark Harmstone 2024-10-22  4905  		struct btrfs_ioctl_encoded_io_args_32 args32;
dd13a57c79e014 Mark Harmstone 2024-10-22  4906  
dd13a57c79e014 Mark Harmstone 2024-10-22  4907  		copy_end = offsetofend(struct btrfs_ioctl_encoded_io_args_32,
dd13a57c79e014 Mark Harmstone 2024-10-22  4908  				       flags);
dd13a57c79e014 Mark Harmstone 2024-10-22  4909  		if (copy_from_user(&args32, sqe_addr, copy_end)) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4910  			ret = -EFAULT;
dd13a57c79e014 Mark Harmstone 2024-10-22  4911  			goto out_acct;
dd13a57c79e014 Mark Harmstone 2024-10-22  4912  		}
dd13a57c79e014 Mark Harmstone 2024-10-22  4913  		args.iov = compat_ptr(args32.iov);
dd13a57c79e014 Mark Harmstone 2024-10-22  4914  		args.iovcnt = args32.iovcnt;
dd13a57c79e014 Mark Harmstone 2024-10-22  4915  		args.offset = args32.offset;
dd13a57c79e014 Mark Harmstone 2024-10-22  4916  		args.flags = args32.flags;
dd13a57c79e014 Mark Harmstone 2024-10-22  4917  #else
dd13a57c79e014 Mark Harmstone 2024-10-22  4918  		return -ENOTTY;
dd13a57c79e014 Mark Harmstone 2024-10-22  4919  #endif
dd13a57c79e014 Mark Harmstone 2024-10-22  4920  	} else {
dd13a57c79e014 Mark Harmstone 2024-10-22  4921  		copy_end = copy_end_kernel;
dd13a57c79e014 Mark Harmstone 2024-10-22  4922  		if (copy_from_user(&args, sqe_addr, copy_end)) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4923  			ret = -EFAULT;
dd13a57c79e014 Mark Harmstone 2024-10-22  4924  			goto out_acct;
dd13a57c79e014 Mark Harmstone 2024-10-22  4925  		}
dd13a57c79e014 Mark Harmstone 2024-10-22  4926  	}
dd13a57c79e014 Mark Harmstone 2024-10-22  4927  
dd13a57c79e014 Mark Harmstone 2024-10-22  4928  	if (args.flags != 0)
dd13a57c79e014 Mark Harmstone 2024-10-22  4929  		return -EINVAL;
dd13a57c79e014 Mark Harmstone 2024-10-22  4930  
dd13a57c79e014 Mark Harmstone 2024-10-22  4931  	ret = import_iovec(ITER_DEST, args.iov, args.iovcnt, ARRAY_SIZE(iovstack),
dd13a57c79e014 Mark Harmstone 2024-10-22  4932  			   &iov, &iter);
dd13a57c79e014 Mark Harmstone 2024-10-22  4933  	if (ret < 0)
dd13a57c79e014 Mark Harmstone 2024-10-22  4934  		goto out_acct;
dd13a57c79e014 Mark Harmstone 2024-10-22  4935  
dd13a57c79e014 Mark Harmstone 2024-10-22  4936  	if (iov_iter_count(&iter) == 0) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4937  		ret = 0;
dd13a57c79e014 Mark Harmstone 2024-10-22  4938  		goto out_free;
dd13a57c79e014 Mark Harmstone 2024-10-22  4939  	}
dd13a57c79e014 Mark Harmstone 2024-10-22  4940  
dd13a57c79e014 Mark Harmstone 2024-10-22  4941  	pos = args.offset;
dd13a57c79e014 Mark Harmstone 2024-10-22  4942  	ret = rw_verify_area(READ, file, &pos, args.len);
dd13a57c79e014 Mark Harmstone 2024-10-22  4943  	if (ret < 0)
dd13a57c79e014 Mark Harmstone 2024-10-22  4944  		goto out_free;
dd13a57c79e014 Mark Harmstone 2024-10-22  4945  
dd13a57c79e014 Mark Harmstone 2024-10-22  4946  	init_sync_kiocb(&kiocb, file);
dd13a57c79e014 Mark Harmstone 2024-10-22  4947  	kiocb.ki_pos = pos;
dd13a57c79e014 Mark Harmstone 2024-10-22  4948  
dd13a57c79e014 Mark Harmstone 2024-10-22  4949  	if (issue_flags & IO_URING_F_NONBLOCK)
dd13a57c79e014 Mark Harmstone 2024-10-22  4950  		kiocb.ki_flags |= IOCB_NOWAIT;
dd13a57c79e014 Mark Harmstone 2024-10-22  4951  
dd13a57c79e014 Mark Harmstone 2024-10-22  4952  	start = ALIGN_DOWN(pos, fs_info->sectorsize);
dd13a57c79e014 Mark Harmstone 2024-10-22  4953  	lockend = start + BTRFS_MAX_UNCOMPRESSED - 1;
dd13a57c79e014 Mark Harmstone 2024-10-22  4954  
dd13a57c79e014 Mark Harmstone 2024-10-22  4955  	ret = btrfs_encoded_read(&kiocb, &iter, &args, &cached_state,
dd13a57c79e014 Mark Harmstone 2024-10-22  4956  				 &disk_bytenr, &disk_io_size);
dd13a57c79e014 Mark Harmstone 2024-10-22  4957  	if (ret < 0 && ret != -EIOCBQUEUED)
dd13a57c79e014 Mark Harmstone 2024-10-22  4958  		goto out_free;
dd13a57c79e014 Mark Harmstone 2024-10-22  4959  
dd13a57c79e014 Mark Harmstone 2024-10-22  4960  	file_accessed(file);
dd13a57c79e014 Mark Harmstone 2024-10-22  4961  
dd13a57c79e014 Mark Harmstone 2024-10-22  4962  	if (copy_to_user(sqe_addr + copy_end, (char *)&args + copy_end_kernel,
dd13a57c79e014 Mark Harmstone 2024-10-22  4963  			 sizeof(args) - copy_end_kernel)) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4964  		if (ret == -EIOCBQUEUED) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4965  			unlock_extent(io_tree, start, lockend, &cached_state);
dd13a57c79e014 Mark Harmstone 2024-10-22  4966  			btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
dd13a57c79e014 Mark Harmstone 2024-10-22  4967  		}
dd13a57c79e014 Mark Harmstone 2024-10-22  4968  		ret = -EFAULT;
dd13a57c79e014 Mark Harmstone 2024-10-22  4969  		goto out_free;
dd13a57c79e014 Mark Harmstone 2024-10-22  4970  	}
dd13a57c79e014 Mark Harmstone 2024-10-22  4971  
dd13a57c79e014 Mark Harmstone 2024-10-22  4972  	if (ret == -EIOCBQUEUED) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4973  		u64 count;
dd13a57c79e014 Mark Harmstone 2024-10-22  4974  
dd13a57c79e014 Mark Harmstone 2024-10-22  4975  		/*
dd13a57c79e014 Mark Harmstone 2024-10-22  4976  		 * If we've optimized things by storing the iovecs on the stack,
dd13a57c79e014 Mark Harmstone 2024-10-22  4977  		 * undo this.
dd13a57c79e014 Mark Harmstone 2024-10-22  4978  		 */
dd13a57c79e014 Mark Harmstone 2024-10-22  4979  		if (!iov) {
dd13a57c79e014 Mark Harmstone 2024-10-22 @4980  			iov = kmalloc(sizeof(struct iovec) * args.iovcnt,
dd13a57c79e014 Mark Harmstone 2024-10-22  4981  				      GFP_NOFS);
dd13a57c79e014 Mark Harmstone 2024-10-22  4982  			if (!iov) {
dd13a57c79e014 Mark Harmstone 2024-10-22  4983  				unlock_extent(io_tree, start, lockend,
dd13a57c79e014 Mark Harmstone 2024-10-22  4984  					      &cached_state);
dd13a57c79e014 Mark Harmstone 2024-10-22  4985  				btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
dd13a57c79e014 Mark Harmstone 2024-10-22  4986  				ret = -ENOMEM;
dd13a57c79e014 Mark Harmstone 2024-10-22  4987  				goto out_acct;
dd13a57c79e014 Mark Harmstone 2024-10-22  4988  			}
dd13a57c79e014 Mark Harmstone 2024-10-22  4989  
dd13a57c79e014 Mark Harmstone 2024-10-22  4990  			memcpy(iov, iovstack,
dd13a57c79e014 Mark Harmstone 2024-10-22  4991  			       sizeof(struct iovec) * args.iovcnt);
dd13a57c79e014 Mark Harmstone 2024-10-22  4992  		}
dd13a57c79e014 Mark Harmstone 2024-10-22  4993  
dd13a57c79e014 Mark Harmstone 2024-10-22  4994  		count = min_t(u64, iov_iter_count(&iter), disk_io_size);
dd13a57c79e014 Mark Harmstone 2024-10-22  4995  
dd13a57c79e014 Mark Harmstone 2024-10-22  4996  		/* Match ioctl by not returning past EOF if uncompressed */
dd13a57c79e014 Mark Harmstone 2024-10-22  4997  		if (!args.compression)
dd13a57c79e014 Mark Harmstone 2024-10-22  4998  			count = min_t(u64, count, args.len);
dd13a57c79e014 Mark Harmstone 2024-10-22  4999  
dd13a57c79e014 Mark Harmstone 2024-10-22  5000  		ret = btrfs_uring_read_extent(&kiocb, &iter, start, lockend,
dd13a57c79e014 Mark Harmstone 2024-10-22  5001  					      cached_state, disk_bytenr,
dd13a57c79e014 Mark Harmstone 2024-10-22  5002  					      disk_io_size, count,
dd13a57c79e014 Mark Harmstone 2024-10-22  5003  					      args.compression, iov, cmd);
dd13a57c79e014 Mark Harmstone 2024-10-22  5004  
dd13a57c79e014 Mark Harmstone 2024-10-22  5005  		goto out_acct;
dd13a57c79e014 Mark Harmstone 2024-10-22  5006  	}
dd13a57c79e014 Mark Harmstone 2024-10-22  5007  
dd13a57c79e014 Mark Harmstone 2024-10-22  5008  out_free:
dd13a57c79e014 Mark Harmstone 2024-10-22  5009  	kfree(iov);
dd13a57c79e014 Mark Harmstone 2024-10-22  5010  
dd13a57c79e014 Mark Harmstone 2024-10-22  5011  out_acct:
dd13a57c79e014 Mark Harmstone 2024-10-22  5012  	if (ret > 0)
dd13a57c79e014 Mark Harmstone 2024-10-22  5013  		add_rchar(current, ret);
dd13a57c79e014 Mark Harmstone 2024-10-22  5014  	inc_syscr(current);
dd13a57c79e014 Mark Harmstone 2024-10-22  5015  
dd13a57c79e014 Mark Harmstone 2024-10-22  5016  	return ret;
dd13a57c79e014 Mark Harmstone 2024-10-22  5017  }
dd13a57c79e014 Mark Harmstone 2024-10-22  5018  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
