Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5686376BD6
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534335; cv=none; b=KrgHYd0u2m9KBevwKpaOsnmtlirKVcwnsTteNCNsBgxSexuSZDGfk3fyPRQxjjMo7TE7SL0S7GArzZPfqsBvmRGxzF4LTz0d7eiaJ10Dh7Pr8W5MzoeVJjnZvzXAuq+II3zqprvzS3VddXbstyleJYNNSypIpqfI7kwhXCDdKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534335; c=relaxed/simple;
	bh=zr+VFMSwvSSQCLwHBMhJ97hslGQiyhRte7/9b/f3P1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oCAIWJAGQiW/0D+d4K6ULSnDXgdldx+9yymjW9eXjkwABU3Vgqv3YhB2UnW+wPgKCF72nKuFA4mpym7pB/vetyxYPELg3+VDXZBBasPRmrmaNfzQHZYwNZRfo5ZWAC1UEWwjjRePuDipKJzpSpVKC+3w58IpTll6j7T0x/GN9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5ALbQdT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5ALbQdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534334; x=1807070334;
  h=date:from:to:cc:subject:message-id;
  bh=zr+VFMSwvSSQCLwHBMhJ97hslGQiyhRte7/9b/f3P1E=;
  b=G5ALbQdT1BDa+gDZC0AUiQEfb/kiv16pgDfP3E2Ud3/vrdeXzDPWl1e3
   JHo8ezWRmjtxJ+MKZ9WirE4tPN3EB++kob+QIzZJGciAiCx7zC+z9sssm
   c3PQhQGAXihRE4IOhD3wXkXWVRiwV2hL/lnLKRXuHHCbMb+Th8weqtBn/
   agzQuIC3ggEsX5GvWo+fzXw+W4ggOk/eYaMCf2AnMoFoMgWPyJ8cCbTwX
   Qy0/quWcHahZNUDLhNk3G36NfqIfuvismZ7ALIXgvByLmW05CLmmUyQJH
   N4PE24PkJSGS5x9NVZmd7E32hc6Fqfi6hl4kyZ2SeRjEgBob9vxq47/ND
   w==;
X-CSE-ConnectionGUID: SS36uL6TRoCPEdNgni5nnA==
X-CSE-MsgGUID: mHyJeduhQ5quXCWna296wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76369558"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76369558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:58:37 -0700
X-CSE-ConnectionGUID: Q+fNI0V/SLeStscOcsqSYA==
X-CSE-MsgGUID: SHfZjoNyQU+ODLztliriUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232091296"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:58:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xaD-00000000067-0Vgv;
	Tue, 07 Apr 2026 03:58:33 +0000
Date: Tue, 07 Apr 2026 11:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bcachefs:bcachefs-testing 11/42]
 fs/bcachefs/vfs/ioctl.c:914:66-67: WARNING opportunity for min()
Message-ID: <202604050900.7W0I00dm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   a33008fc8f2cf78de0ed73dc9b1dc6a46d278287
commit: 39fe245ff806f1dcf1d02b034d35df86b8944ec2 [11/42] bcachefs: wire up error reporting in pread_raw ioctl
:::::: branch date: 2 hours ago
:::::: commit date: 11 days ago
config: um-randconfig-r051-20260405 (https://download.01.org/0day-ci/archive/20260405/202604050900.7W0I00dm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604050900.7W0I00dm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/vfs/ioctl.c:914:66-67: WARNING opportunity for min()

vim +914 fs/bcachefs/vfs/ioctl.c

d4bd02beae9ffc Kent Overstreet 2026-02-10  868  
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  869  static long bch2_ioc_pread_raw(struct file *file,
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  870  			       struct bch_inode_info *inode,
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  871  			       struct bch_ioctl_pread_raw __user *uarg)
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  872  {
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  873  	struct bch_ioctl_pread_raw arg;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  874  
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  875  	if (copy_from_user(&arg, uarg, sizeof(arg)))
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  876  		return -EFAULT;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  877  	if (arg.flags & ~BCH_PREAD_RAW_no_poison_check)
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  878  		return -EINVAL;
39fe245ff806f1 Kent Overstreet 2026-03-24  879  	if (arg.err.pad)
39fe245ff806f1 Kent Overstreet 2026-03-24  880  		return -EINVAL;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  881  	if (!arg.len)
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  882  		return 0;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  883  	if (!(file->f_flags & O_DIRECT))
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  884  		return -EINVAL;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  885  	if (!inode_owner_or_capable(file_mnt_idmap(file), &inode->v))
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  886  		return -EPERM;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  887  
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  888  	loff_t pos = arg.offset;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  889  	int ret = rw_verify_area(READ, file, &pos, arg.len);
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  890  	if (ret)
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  891  		return ret;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  892  
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  893  	struct iov_iter iter;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  894  	import_ubuf(ITER_DEST, (void __user *)(unsigned long)arg.buf, arg.len, &iter);
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  895  
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  896  	struct kiocb kiocb;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  897  	init_sync_kiocb(&kiocb, file);
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  898  	kiocb.ki_pos = arg.offset;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  899  
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  900  	enum bch_read_flags read_flags = 0;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  901  	if (arg.flags & BCH_PREAD_RAW_no_poison_check)
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  902  		read_flags |= BCH_READ_no_poison_check;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  903  
39fe245ff806f1 Kent Overstreet 2026-03-24  904  	struct bch_read_err_report err_report;
39fe245ff806f1 Kent Overstreet 2026-03-24  905  	mutex_init(&err_report.lock);
39fe245ff806f1 Kent Overstreet 2026-03-24  906  	err_report.errors = 0;
39fe245ff806f1 Kent Overstreet 2026-03-24  907  	err_report.msg = (struct printbuf) PRINTBUF;
39fe245ff806f1 Kent Overstreet 2026-03-24  908  
39fe245ff806f1 Kent Overstreet 2026-03-24  909  	ret = bch2_direct_IO_read(&kiocb, &iter, read_flags, &err_report);
39fe245ff806f1 Kent Overstreet 2026-03-24  910  
39fe245ff806f1 Kent Overstreet 2026-03-24  911  	if (copy_to_user(&uarg->errors, &err_report.errors, sizeof(err_report.errors)))
39fe245ff806f1 Kent Overstreet 2026-03-24  912  		ret = -EFAULT;
39fe245ff806f1 Kent Overstreet 2026-03-24  913  
39fe245ff806f1 Kent Overstreet 2026-03-24 @914  	int err = bch2_copy_ioctl_err_msg(&arg.err, &err_report.msg, ret < 0 ? ret : 0);
39fe245ff806f1 Kent Overstreet 2026-03-24  915  	if (err && !ret)
39fe245ff806f1 Kent Overstreet 2026-03-24  916  		ret = err;
39fe245ff806f1 Kent Overstreet 2026-03-24  917  
39fe245ff806f1 Kent Overstreet 2026-03-24  918  	printbuf_exit(&err_report.msg);
39fe245ff806f1 Kent Overstreet 2026-03-24  919  	return ret;
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  920  }
c8c6d24bbb1c2f Kent Overstreet 2026-03-24  921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
