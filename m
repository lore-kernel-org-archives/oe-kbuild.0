Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B40208C6
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706444911; cv=none; b=EW6Y6HyO01PPjqFLJ4P8rM9YDVHEfPKA0+0KkzM6TG8u1OKgZF1g06P8c013azHZaVywq+jAIY5V0ID1Kpz5VYNE3i9HnmTv9HppD6Tkc/u9JfMIQzVFYcybltwoIJk7TtoRic90uUlboR3y80Bd3QDwm5IA38ykTnysAkalWXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706444911; c=relaxed/simple;
	bh=u1CqUSX4yXCcZ8TvBniluIpN6p4b0/wsjjSrRlxOii4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQmJNY7FKVzfyRbWfnedUiM7xwFHcTdtoGtrbQLnOAL33cpbNB/GR2CbCWJRuk71oorphWTDMudCV2RDNnw6dZXj8Uox983CnkeHFaMJVj7/CUIBSQf/R44nGJD5tFazi4x+ciNqFSLMSxYfbFKub7Doa76k9PFwORxO/ZpO1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqU3qfmk; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqU3qfmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706444908; x=1737980908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1CqUSX4yXCcZ8TvBniluIpN6p4b0/wsjjSrRlxOii4=;
  b=bqU3qfmkG9katQC/RcgbFpnV9cpg+FEzmtUvN4tYEWn/KLbfxQQwDul0
   wvj+mGjTF4m8tfO3QdDgIZi7D8FSVdTfDUJUuf9P+5AJeEG9EMzTRxRFx
   Au38dYyBNGQbtFB5rHpgC+RIL4nw0Eya/RiXCCcUc5ZQ8D3Hsi4miatH5
   xjAfZcqQCITWd5piVK+M8rZHEDp5tWSxoKRMsI/VbTREwivNSClh6scHB
   DS+nHe202W/Y2duKuiAxZs6OJPCZfRosVFW3ON3dkdhe15IcsQMWMi8JW
   i48/7AEMVZ0N2OCqkGrIrys1uDbs1ZysoeifVayusWNtehKUZ+xLlV/hH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="433930501"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433930501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 04:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="877807389"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="877807389"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2024 04:28:26 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU4Gu-0003OJ-2V;
	Sun, 28 Jan 2024 12:28:24 +0000
Date: Sun, 28 Jan 2024 20:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC v2 4/4] fs: Optimize credentials reference count for
 backing file ops
Message-ID: <202401282026.OY6K7pyk-lkp@intel.com>
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
In-Reply-To: <20240125235723.39507-5-vinicius.gomes@intel.com>
References: <20240125235723.39507-5-vinicius.gomes@intel.com>
TO: Vinicius Costa Gomes <vinicius.gomes@intel.com>

Hi Vinicius,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinicius-Costa-Gomes/cleanup-Fix-discarded-const-warning-when-defining-guards/20240126-080128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240125235723.39507-5-vinicius.gomes%40intel.com
patch subject: [RFC v2 4/4] fs: Optimize credentials reference count for backing file ops
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240128/202401282026.OY6K7pyk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401282026.OY6K7pyk-lkp@intel.com/

smatch warnings:
fs/backing-file.c:181 backing_file_read_iter() error: uninitialized symbol 'ret'.
fs/backing-file.c:265 backing_file_splice_read() error: uninitialized symbol 'ret'.
fs/backing-file.c:318 backing_file_mmap() error: uninitialized symbol 'ret'.

vim +/ret +181 fs/backing-file.c

a6293b3e285cd0 Amir Goldstein       2023-11-22  136  
a6293b3e285cd0 Amir Goldstein       2023-11-22  137  
a6293b3e285cd0 Amir Goldstein       2023-11-22  138  ssize_t backing_file_read_iter(struct file *file, struct iov_iter *iter,
a6293b3e285cd0 Amir Goldstein       2023-11-22  139  			       struct kiocb *iocb, int flags,
a6293b3e285cd0 Amir Goldstein       2023-11-22  140  			       struct backing_file_ctx *ctx)
a6293b3e285cd0 Amir Goldstein       2023-11-22  141  {
a6293b3e285cd0 Amir Goldstein       2023-11-22  142  	struct backing_aio *aio = NULL;
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  143  	const struct cred *old_cred = ctx->cred;
a6293b3e285cd0 Amir Goldstein       2023-11-22  144  	ssize_t ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  145  
a6293b3e285cd0 Amir Goldstein       2023-11-22  146  	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
a6293b3e285cd0 Amir Goldstein       2023-11-22  147  		return -EIO;
a6293b3e285cd0 Amir Goldstein       2023-11-22  148  
a6293b3e285cd0 Amir Goldstein       2023-11-22  149  	if (!iov_iter_count(iter))
a6293b3e285cd0 Amir Goldstein       2023-11-22  150  		return 0;
a6293b3e285cd0 Amir Goldstein       2023-11-22  151  
a6293b3e285cd0 Amir Goldstein       2023-11-22  152  	if (iocb->ki_flags & IOCB_DIRECT &&
a6293b3e285cd0 Amir Goldstein       2023-11-22  153  	    !(file->f_mode & FMODE_CAN_ODIRECT))
a6293b3e285cd0 Amir Goldstein       2023-11-22  154  		return -EINVAL;
a6293b3e285cd0 Amir Goldstein       2023-11-22  155  
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  156  	scoped_guard(cred, old_cred) {
a6293b3e285cd0 Amir Goldstein       2023-11-22  157  		if (is_sync_kiocb(iocb)) {
a6293b3e285cd0 Amir Goldstein       2023-11-22  158  			rwf_t rwf = iocb_to_rw_flags(flags);
a6293b3e285cd0 Amir Goldstein       2023-11-22  159  
a6293b3e285cd0 Amir Goldstein       2023-11-22  160  			ret = vfs_iter_read(file, iter, &iocb->ki_pos, rwf);
a6293b3e285cd0 Amir Goldstein       2023-11-22  161  		} else {
a6293b3e285cd0 Amir Goldstein       2023-11-22  162  			ret = -ENOMEM;
a6293b3e285cd0 Amir Goldstein       2023-11-22  163  			aio = kmem_cache_zalloc(backing_aio_cachep, GFP_KERNEL);
a6293b3e285cd0 Amir Goldstein       2023-11-22  164  			if (!aio)
a6293b3e285cd0 Amir Goldstein       2023-11-22  165  				goto out;
a6293b3e285cd0 Amir Goldstein       2023-11-22  166  
a6293b3e285cd0 Amir Goldstein       2023-11-22  167  			aio->orig_iocb = iocb;
a6293b3e285cd0 Amir Goldstein       2023-11-22  168  			kiocb_clone(&aio->iocb, iocb, get_file(file));
a6293b3e285cd0 Amir Goldstein       2023-11-22  169  			aio->iocb.ki_complete = backing_aio_rw_complete;
a6293b3e285cd0 Amir Goldstein       2023-11-22  170  			refcount_set(&aio->ref, 2);
a6293b3e285cd0 Amir Goldstein       2023-11-22  171  			ret = vfs_iocb_iter_read(file, &aio->iocb, iter);
a6293b3e285cd0 Amir Goldstein       2023-11-22  172  			backing_aio_put(aio);
a6293b3e285cd0 Amir Goldstein       2023-11-22  173  			if (ret != -EIOCBQUEUED)
a6293b3e285cd0 Amir Goldstein       2023-11-22  174  				backing_aio_cleanup(aio, ret);
a6293b3e285cd0 Amir Goldstein       2023-11-22  175  		}
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  176  	}
a6293b3e285cd0 Amir Goldstein       2023-11-22  177  out:
a6293b3e285cd0 Amir Goldstein       2023-11-22  178  	if (ctx->accessed)
a6293b3e285cd0 Amir Goldstein       2023-11-22  179  		ctx->accessed(ctx->user_file);
a6293b3e285cd0 Amir Goldstein       2023-11-22  180  
a6293b3e285cd0 Amir Goldstein       2023-11-22 @181  	return ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  182  }
a6293b3e285cd0 Amir Goldstein       2023-11-22  183  EXPORT_SYMBOL_GPL(backing_file_read_iter);
a6293b3e285cd0 Amir Goldstein       2023-11-22  184  
a6293b3e285cd0 Amir Goldstein       2023-11-22  185  ssize_t backing_file_write_iter(struct file *file, struct iov_iter *iter,
a6293b3e285cd0 Amir Goldstein       2023-11-22  186  				struct kiocb *iocb, int flags,
a6293b3e285cd0 Amir Goldstein       2023-11-22  187  				struct backing_file_ctx *ctx)
a6293b3e285cd0 Amir Goldstein       2023-11-22  188  {
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  189  	const struct cred *old_cred = ctx->cred;
a6293b3e285cd0 Amir Goldstein       2023-11-22  190  	ssize_t ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  191  
a6293b3e285cd0 Amir Goldstein       2023-11-22  192  	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
a6293b3e285cd0 Amir Goldstein       2023-11-22  193  		return -EIO;
a6293b3e285cd0 Amir Goldstein       2023-11-22  194  
a6293b3e285cd0 Amir Goldstein       2023-11-22  195  	if (!iov_iter_count(iter))
a6293b3e285cd0 Amir Goldstein       2023-11-22  196  		return 0;
a6293b3e285cd0 Amir Goldstein       2023-11-22  197  
a6293b3e285cd0 Amir Goldstein       2023-11-22  198  	ret = file_remove_privs(ctx->user_file);
a6293b3e285cd0 Amir Goldstein       2023-11-22  199  	if (ret)
a6293b3e285cd0 Amir Goldstein       2023-11-22  200  		return ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  201  
a6293b3e285cd0 Amir Goldstein       2023-11-22  202  	if (iocb->ki_flags & IOCB_DIRECT &&
a6293b3e285cd0 Amir Goldstein       2023-11-22  203  	    !(file->f_mode & FMODE_CAN_ODIRECT))
a6293b3e285cd0 Amir Goldstein       2023-11-22  204  		return -EINVAL;
a6293b3e285cd0 Amir Goldstein       2023-11-22  205  
a6293b3e285cd0 Amir Goldstein       2023-11-22  206  	/*
a6293b3e285cd0 Amir Goldstein       2023-11-22  207  	 * Stacked filesystems don't support deferred completions, don't copy
a6293b3e285cd0 Amir Goldstein       2023-11-22  208  	 * this property in case it is set by the issuer.
a6293b3e285cd0 Amir Goldstein       2023-11-22  209  	 */
a6293b3e285cd0 Amir Goldstein       2023-11-22  210  	flags &= ~IOCB_DIO_CALLER_COMP;
a6293b3e285cd0 Amir Goldstein       2023-11-22  211  
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  212  	scoped_guard(cred, old_cred) {
a6293b3e285cd0 Amir Goldstein       2023-11-22  213  		if (is_sync_kiocb(iocb)) {
a6293b3e285cd0 Amir Goldstein       2023-11-22  214  			rwf_t rwf = iocb_to_rw_flags(flags);
a6293b3e285cd0 Amir Goldstein       2023-11-22  215  
a6293b3e285cd0 Amir Goldstein       2023-11-22  216  			ret = vfs_iter_write(file, iter, &iocb->ki_pos, rwf);
a6293b3e285cd0 Amir Goldstein       2023-11-22  217  			if (ctx->end_write)
a6293b3e285cd0 Amir Goldstein       2023-11-22  218  				ctx->end_write(ctx->user_file);
a6293b3e285cd0 Amir Goldstein       2023-11-22  219  		} else {
a6293b3e285cd0 Amir Goldstein       2023-11-22  220  			struct backing_aio *aio;
a6293b3e285cd0 Amir Goldstein       2023-11-22  221  
a6293b3e285cd0 Amir Goldstein       2023-11-22  222  			ret = backing_aio_init_wq(iocb);
a6293b3e285cd0 Amir Goldstein       2023-11-22  223  			if (ret)
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  224  				return ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  225  
a6293b3e285cd0 Amir Goldstein       2023-11-22  226  			ret = -ENOMEM;
a6293b3e285cd0 Amir Goldstein       2023-11-22  227  			aio = kmem_cache_zalloc(backing_aio_cachep, GFP_KERNEL);
a6293b3e285cd0 Amir Goldstein       2023-11-22  228  			if (!aio)
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  229  				return ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  230  
a6293b3e285cd0 Amir Goldstein       2023-11-22  231  			aio->orig_iocb = iocb;
a6293b3e285cd0 Amir Goldstein       2023-11-22  232  			aio->end_write = ctx->end_write;
a6293b3e285cd0 Amir Goldstein       2023-11-22  233  			kiocb_clone(&aio->iocb, iocb, get_file(file));
a6293b3e285cd0 Amir Goldstein       2023-11-22  234  			aio->iocb.ki_flags = flags;
a6293b3e285cd0 Amir Goldstein       2023-11-22  235  			aio->iocb.ki_complete = backing_aio_queue_completion;
a6293b3e285cd0 Amir Goldstein       2023-11-22  236  			refcount_set(&aio->ref, 2);
a6293b3e285cd0 Amir Goldstein       2023-11-22  237  			ret = vfs_iocb_iter_write(file, &aio->iocb, iter);
a6293b3e285cd0 Amir Goldstein       2023-11-22  238  			backing_aio_put(aio);
a6293b3e285cd0 Amir Goldstein       2023-11-22  239  			if (ret != -EIOCBQUEUED)
a6293b3e285cd0 Amir Goldstein       2023-11-22  240  				backing_aio_cleanup(aio, ret);
a6293b3e285cd0 Amir Goldstein       2023-11-22  241  		}
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  242  	}
a6293b3e285cd0 Amir Goldstein       2023-11-22  243  	return ret;
a6293b3e285cd0 Amir Goldstein       2023-11-22  244  }
a6293b3e285cd0 Amir Goldstein       2023-11-22  245  EXPORT_SYMBOL_GPL(backing_file_write_iter);
a6293b3e285cd0 Amir Goldstein       2023-11-22  246  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  247  ssize_t backing_file_splice_read(struct file *in, loff_t *ppos,
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  248  				 struct pipe_inode_info *pipe, size_t len,
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  249  				 unsigned int flags,
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  250  				 struct backing_file_ctx *ctx)
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  251  {
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  252  	const struct cred *old_cred = ctx->cred;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  253  	ssize_t ret;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  254  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  255  	if (WARN_ON_ONCE(!(in->f_mode & FMODE_BACKING)))
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  256  		return -EIO;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  257  
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  258  	scoped_guard(cred, old_cred) {
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  259  		ret = vfs_splice_read(in, ppos, pipe, len, flags);
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  260  	}
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  261  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  262  	if (ctx->accessed)
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  263  		ctx->accessed(ctx->user_file);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  264  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13 @265  	return ret;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  266  }
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  267  EXPORT_SYMBOL_GPL(backing_file_splice_read);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  268  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  269  ssize_t backing_file_splice_write(struct pipe_inode_info *pipe,
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  270  				  struct file *out, loff_t *ppos, size_t len,
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  271  				  unsigned int flags,
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  272  				  struct backing_file_ctx *ctx)
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  273  {
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  274  	const struct cred *old_cred = ctx->cred;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  275  	ssize_t ret;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  276  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  277  	if (WARN_ON_ONCE(!(out->f_mode & FMODE_BACKING)))
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  278  		return -EIO;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  279  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  280  	ret = file_remove_privs(ctx->user_file);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  281  	if (ret)
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  282  		return ret;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  283  
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  284  	scoped_guard(cred, old_cred) {
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  285  		file_start_write(out);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  286  		ret = iter_file_splice_write(pipe, out, ppos, len, flags);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  287  		file_end_write(out);
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  288  	}
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  289  	if (ctx->end_write)
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  290  		ctx->end_write(ctx->user_file);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  291  
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  292  	return ret;
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  293  }
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  294  EXPORT_SYMBOL_GPL(backing_file_splice_write);
9b7e9e2f5d5c3d Amir Goldstein       2023-10-13  295  
f567377e406c03 Amir Goldstein       2023-10-13  296  int backing_file_mmap(struct file *file, struct vm_area_struct *vma,
f567377e406c03 Amir Goldstein       2023-10-13  297  		      struct backing_file_ctx *ctx)
f567377e406c03 Amir Goldstein       2023-10-13  298  {
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  299  	const struct cred *old_cred = ctx->cred;
f567377e406c03 Amir Goldstein       2023-10-13  300  	int ret;
f567377e406c03 Amir Goldstein       2023-10-13  301  
f567377e406c03 Amir Goldstein       2023-10-13  302  	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)) ||
f567377e406c03 Amir Goldstein       2023-10-13  303  	    WARN_ON_ONCE(ctx->user_file != vma->vm_file))
f567377e406c03 Amir Goldstein       2023-10-13  304  		return -EIO;
f567377e406c03 Amir Goldstein       2023-10-13  305  
f567377e406c03 Amir Goldstein       2023-10-13  306  	if (!file->f_op->mmap)
f567377e406c03 Amir Goldstein       2023-10-13  307  		return -ENODEV;
f567377e406c03 Amir Goldstein       2023-10-13  308  
f567377e406c03 Amir Goldstein       2023-10-13  309  	vma_set_file(vma, file);
f567377e406c03 Amir Goldstein       2023-10-13  310  
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  311  	scoped_guard(cred, old_cred) {
f567377e406c03 Amir Goldstein       2023-10-13  312  		ret = call_mmap(vma->vm_file, vma);
3da9951cd3bbfa Vinicius Costa Gomes 2024-01-25  313  	}
f567377e406c03 Amir Goldstein       2023-10-13  314  
f567377e406c03 Amir Goldstein       2023-10-13  315  	if (ctx->accessed)
f567377e406c03 Amir Goldstein       2023-10-13  316  		ctx->accessed(ctx->user_file);
f567377e406c03 Amir Goldstein       2023-10-13  317  
f567377e406c03 Amir Goldstein       2023-10-13 @318  	return ret;
f567377e406c03 Amir Goldstein       2023-10-13  319  }
f567377e406c03 Amir Goldstein       2023-10-13  320  EXPORT_SYMBOL_GPL(backing_file_mmap);
f567377e406c03 Amir Goldstein       2023-10-13  321  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
