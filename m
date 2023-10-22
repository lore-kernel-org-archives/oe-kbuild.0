Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C6E36A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 01:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+Rbdkmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697939918; x=1729475918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KncAwx0UjTIE7BKVD6ezE0hQ8/yKUOoazUP6PrdW3CA=;
  b=k+RbdkmxWNoGjgzg8vfVar8U1+mcM2HqnzxSRZIO6iuGkBs298bC3aqP
   6aQ3xyKCMY2Hms+YfhiRYZVmNfkEYDf/aX/deHVa5aKpUbYbt5ZHODIRE
   YFV4AdgKg6pfkOpe4r1rhkrkj6CrHMViUiaG2qOavwJgNYNICuUXHInyM
   M6IY0kR7Wj5uyjfNUWZK4+xWgMVfX9PLMxcRxzPu2zTdp+lTLuw9uY4OY
   xLGqAgvH3SXA6IjtSFuicLV8E6YxmSgB0LTYAE6XPIGROGuEJ5xFbiJKs
   JW4aRnyjvfQhjLbySSRZsUs5AHTqHUPQwnHWXo6L5FtNBOL1VaojbI+/a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="371743578"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="371743578"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 18:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874310300"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="874310300"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2023 18:58:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quNjd-0005Tc-37;
	Sun, 22 Oct 2023 01:58:33 +0000
Date: Sun, 22 Oct 2023 09:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:fuse-backing-fd 25/29] fs/fuse/passthrough.c:204
 fuse_passthrough_setup() error: uninitialized symbol 'fb'.
Message-ID: <202310220943.UJd8HSEP-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   c4564efb86b4d078be40ef2bc3c09eacece9d05e
commit: cf5bd4ebed653b0e21f85958466f41fd6c869710 [25/29] fuse: implement ioctls to manage backing files
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220943.UJd8HSEP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220943.UJd8HSEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310220943.UJd8HSEP-lkp@intel.com/

smatch warnings:
fs/fuse/passthrough.c:204 fuse_passthrough_setup() error: uninitialized symbol 'fb'.

vim +/fb +204 fs/fuse/passthrough.c

cf5bd4ebed653b Amir Goldstein 2023-09-11  167  
cf5bd4ebed653b Amir Goldstein 2023-09-11  168  /* Setup passthrough to a backing file */
cf5bd4ebed653b Amir Goldstein 2023-09-11  169  void fuse_passthrough_setup(struct file *file, int backing_id)
cf5bd4ebed653b Amir Goldstein 2023-09-11  170  {
cf5bd4ebed653b Amir Goldstein 2023-09-11  171  	struct fuse_file *ff = file->private_data;
cf5bd4ebed653b Amir Goldstein 2023-09-11  172  	struct fuse_conn *fc = ff->fm->fc;
cf5bd4ebed653b Amir Goldstein 2023-09-11  173  	struct fuse_backing *fb;
cf5bd4ebed653b Amir Goldstein 2023-09-11  174  	struct file *backing_file;
cf5bd4ebed653b Amir Goldstein 2023-09-11  175  	int err;
cf5bd4ebed653b Amir Goldstein 2023-09-11  176  
cf5bd4ebed653b Amir Goldstein 2023-09-11  177  	err = -EINVAL;
cf5bd4ebed653b Amir Goldstein 2023-09-11  178  	if (backing_id <= 0)
cf5bd4ebed653b Amir Goldstein 2023-09-11  179  		goto out;
cf5bd4ebed653b Amir Goldstein 2023-09-11  180  
cf5bd4ebed653b Amir Goldstein 2023-09-11  181  	rcu_read_lock();
cf5bd4ebed653b Amir Goldstein 2023-09-11  182  	fb = idr_find(&fc->backing_files_map, backing_id);
cf5bd4ebed653b Amir Goldstein 2023-09-11  183  	fb = fuse_backing_get(fb);
cf5bd4ebed653b Amir Goldstein 2023-09-11  184  	rcu_read_unlock();
cf5bd4ebed653b Amir Goldstein 2023-09-11  185  
cf5bd4ebed653b Amir Goldstein 2023-09-11  186  	err = -ENOENT;
cf5bd4ebed653b Amir Goldstein 2023-09-11  187  	if (!fb)
cf5bd4ebed653b Amir Goldstein 2023-09-11  188  		goto out;
cf5bd4ebed653b Amir Goldstein 2023-09-11  189  
cf5bd4ebed653b Amir Goldstein 2023-09-11  190  	/* Allocate backing file per fuse file to store fuse path */
cf5bd4ebed653b Amir Goldstein 2023-09-11  191  	backing_file = backing_file_open(&file->f_path, file->f_flags,
cf5bd4ebed653b Amir Goldstein 2023-09-11  192  					 &fb->file->f_path, fb->cred);
cf5bd4ebed653b Amir Goldstein 2023-09-11  193  	err = PTR_ERR(backing_file);
cf5bd4ebed653b Amir Goldstein 2023-09-11  194  	if (IS_ERR(backing_file))
cf5bd4ebed653b Amir Goldstein 2023-09-11  195  		goto out;
cf5bd4ebed653b Amir Goldstein 2023-09-11  196  
cf5bd4ebed653b Amir Goldstein 2023-09-11  197  	err = 0;
cf5bd4ebed653b Amir Goldstein 2023-09-11  198  	ff->passthrough = backing_file;
cf5bd4ebed653b Amir Goldstein 2023-09-11  199  	ff->cred = get_cred(fb->cred);
cf5bd4ebed653b Amir Goldstein 2023-09-11  200  out:
cf5bd4ebed653b Amir Goldstein 2023-09-11  201  	pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p, err=%i\n", __func__,
cf5bd4ebed653b Amir Goldstein 2023-09-11  202  		 backing_id, fb, ff->passthrough, err);
cf5bd4ebed653b Amir Goldstein 2023-09-11  203  
cf5bd4ebed653b Amir Goldstein 2023-09-11 @204  	fuse_backing_put(fb);
cf5bd4ebed653b Amir Goldstein 2023-09-11  205  	if (!ff->passthrough)
cf5bd4ebed653b Amir Goldstein 2023-09-11  206  		ff->open_flags &= ~FOPEN_PASSTHROUGH;
cf5bd4ebed653b Amir Goldstein 2023-09-11  207  }
cf5bd4ebed653b Amir Goldstein 2023-09-11  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
