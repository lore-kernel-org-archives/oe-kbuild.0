Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D14148850
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248795; cv=none; b=M7FBmobyDoP9edeOigjEuxtbQKKjVf4+1Vs6lP/uBIFQDKjleDmic1f81QyxWi1X34YXiH0l4DOA2TbJleV+IkF5OIOpH0mD5GoU9xkSZR45reh8FIM8criOCsUTk7qrI8n7bUjgmmqEbUI6MUmDtUQwQ6eulZXBWthggz2tUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248795; c=relaxed/simple;
	bh=RXxDWOy8t116i9vztAV85njYTX5Cm/ZjiIcPIaYo7qA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1enI4MCFdteWDXA55QTC4Mp/R5wqo0NzeAMfojuXymOj2sYpAEdo3YoIsmTpxOt/bpkrj4tt8M+eJluU6vbbG3C9kOp037nZXBacpN07nXJx3/mbR6q+rwAfMVspsRkZHMw54DHkiogRUYZPPvVaTCWw2Y1D+4y+R4Olv1uy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R55dSWMu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R55dSWMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762248794; x=1793784794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXxDWOy8t116i9vztAV85njYTX5Cm/ZjiIcPIaYo7qA=;
  b=R55dSWMuR0Xm9m/rphCSgvOGLEsvvd2kgxA5avBQMChiRGWnNYgudiwd
   YPNw3jm3cfqWo4DBECHDUwiWkfb3X3UeBrJ6UpB+GXLACnA59L/SOyzf1
   +I4PFobXmliaqVgmWZeOfdCklN/oQ81ti1GHpOSwlO8nXFLkH1Xh3TXbE
   dhCPSEE/A+fM3pUpjubAOEm5NPBaTH6cLQdGS2MbGww2v5CY5s1voYiGz
   3qL88Cdor2halnnxYNxfwEQS2wRELnXFFpzB5m6MrP4FoMIAI45UK3B/q
   Qb/PjCV/TtKp+mUu/MKlTtjzLVM0IVLUM/Ku+bHqNGmhleid1S75Wte0r
   g==;
X-CSE-ConnectionGUID: Xu56qCcaTVCdIjl48r6JWA==
X-CSE-MsgGUID: xc/D3vnWQfuhZZKNNrTMew==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74630468"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="74630468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:33:14 -0800
X-CSE-ConnectionGUID: TvmES2OnT3+GTOAFKs7qvw==
X-CSE-MsgGUID: 1FdPp1UsSRW2J+Rut4+fFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191420971"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 01:33:11 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGDPZ-000RCk-1X;
	Tue, 04 Nov 2025 09:33:09 +0000
Date: Tue, 4 Nov 2025 17:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 16/39] fs/backing-file.c:351
 backing_file_mmap() error: uninitialized symbol 'ret'.
Message-ID: <202511041714.3Oqu6b3i-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   59e578cf86c391d6595e005247ebefd4f371242c
commit: 4e5d527a5e962d0f0e7b5fa317e582354e730477 [16/39] backing-file: use credential guards for mmap
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: sparc-randconfig-r073-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041714.3Oqu6b3i-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041714.3Oqu6b3i-lkp@intel.com/

New smatch warnings:
fs/backing-file.c:351 backing_file_mmap() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/backing-file.c:209 backing_file_read_iter() error: uninitialized symbol 'ret'.
fs/backing-file.c:297 backing_file_splice_read() error: uninitialized symbol 'ret'.

vim +/ret +351 fs/backing-file.c

9b7e9e2f5d5c3d Amir Goldstein    2023-10-13  330  
f567377e406c03 Amir Goldstein    2023-10-13  331  int backing_file_mmap(struct file *file, struct vm_area_struct *vma,
f567377e406c03 Amir Goldstein    2023-10-13  332  		      struct backing_file_ctx *ctx)
f567377e406c03 Amir Goldstein    2023-10-13  333  {
2957fa4931a3b6 Amir Goldstein    2024-11-26  334  	struct file *user_file = vma->vm_file;
f567377e406c03 Amir Goldstein    2023-10-13  335  	int ret;
f567377e406c03 Amir Goldstein    2023-10-13  336  
48b50624aec454 Miklos Szeredi    2024-10-21  337  	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
f567377e406c03 Amir Goldstein    2023-10-13  338  		return -EIO;
f567377e406c03 Amir Goldstein    2023-10-13  339  
b013ed403197f3 Lorenzo Stoakes   2025-06-16  340  	if (!can_mmap_file(file))
f567377e406c03 Amir Goldstein    2023-10-13  341  		return -ENODEV;
f567377e406c03 Amir Goldstein    2023-10-13  342  
f567377e406c03 Amir Goldstein    2023-10-13  343  	vma_set_file(vma, file);
f567377e406c03 Amir Goldstein    2023-10-13  344  
4e5d527a5e962d Christian Brauner 2025-11-03  345  	scoped_with_creds(ctx->cred)
20ca475d9860e1 Lorenzo Stoakes   2025-06-16  346  		ret = vfs_mmap(vma->vm_file, vma);
f567377e406c03 Amir Goldstein    2023-10-13  347  
f567377e406c03 Amir Goldstein    2023-10-13  348  	if (ctx->accessed)
2957fa4931a3b6 Amir Goldstein    2024-11-26  349  		ctx->accessed(user_file);
f567377e406c03 Amir Goldstein    2023-10-13  350  
f567377e406c03 Amir Goldstein    2023-10-13 @351  	return ret;
f567377e406c03 Amir Goldstein    2023-10-13  352  }
f567377e406c03 Amir Goldstein    2023-10-13  353  EXPORT_SYMBOL_GPL(backing_file_mmap);
f567377e406c03 Amir Goldstein    2023-10-13  354  

:::::: The code at line 351 was first introduced by commit
:::::: f567377e406c032fff0799bde4fdf4a977529b84 fs: factor out backing_file_mmap() helper

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
