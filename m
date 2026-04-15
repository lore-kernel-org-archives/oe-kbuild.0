Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869B3DFC84
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270265; cv=none; b=k/aRZdSmouQuzde3CjpoQsCIPJyMTny+UvBHy7g7SDoMc3lc+4XD3vImH507xn6boYa+tSCXVyLe1U9nRpuxMVkp5086aZPrdvFUwCZef6zL+paa8CXEbNh9QpoNCSJgul8dxFYpDtSdC97Q1w9h85d1ydSI5GaAWSKHkDJXzbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270265; c=relaxed/simple;
	bh=b58YH4GMV43PfBT0cmqbkgjYU0tegdtfD7rXV8gJZWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YUsMwm9BSkDqJo1MrMqcvPVypYDBHbBdVJLFbX46p6YDWe+8p3vHNTFPGOgqXf5eHgCOwa4rN3XJJEaeg9FOealKXuza0hRoxhaSY8dTcetXn3StA9KnI6i4UJTTFow94m1zgZpuq65iutApbmXNuw2g8MSrxytWejoPrDeMR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWy0Mab0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWy0Mab0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776270264; x=1807806264;
  h=date:from:to:cc:subject:message-id;
  bh=b58YH4GMV43PfBT0cmqbkgjYU0tegdtfD7rXV8gJZWw=;
  b=HWy0Mab0BT0M3QoAKo/Z4hqCVIyb8jKl9ZIRsFhvcMZiH4AOWXVs8m1p
   ytPCRRNMSdf1C8xj0Me6a8dkwnfhnxzjW/NLCkX0eWEsyKIeLrDLOtxkC
   aEMeRH+3lhYZq8ERLAqKxxsDWqmRrc6MgXeHRXzVg/LQbq/HEbdUByh2B
   wKOTS7yVsXPoKGDgT4xmhKmw2WsinPCwILfeYEhIqRtsAxDETJvX+KOoB
   tFCpwou4H+AzGrw/qB/zIprv9rJFhLS+FZ6UTv5kChWe1ZrjLFbx3Eutm
   vKbzqeRU381TK1YnX1YhKqunbFR8iF5SrguE5A/oWLJdLFQHo8UrqEUmf
   A==;
X-CSE-ConnectionGUID: iuGo9scuRkqTsLVTe/N8Fw==
X-CSE-MsgGUID: unLGWzmcSfCsWehP4G8Gew==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94825950"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94825950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:24:23 -0700
X-CSE-ConnectionGUID: xMiT8VLOQFi4OKX9HqdP4g==
X-CSE-MsgGUID: l3QxRy/lT0OsjyYo9ROV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253884974"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2026 09:24:22 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD32J-000000000gw-3d1X;
	Wed, 15 Apr 2026 16:24:19 +0000
Date: Thu, 16 Apr 2026 00:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 8/8] fs/fuse/file.c:959
 fuse_readpages_end() warn: variable dereferenced before check 'mapping' (see
 line 944)
Message-ID: <202604152334.fy9GBg2O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b3c77090341c2832f1d703b6592011886cdb7e9c
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [8/8] ANDROID: fuse-bpf: fuse-bpf v1.3
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r073-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152334.fy9GBg2O-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604152334.fy9GBg2O-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:959 fuse_readpages_end() warn: variable dereferenced before check 'mapping' (see line 944)

vim +/mapping +959 fs/fuse/file.c

a4c9ab1d4975746 Joanne Koong     2025-07-15  930  
fcee216beb9c15c Max Reitz        2020-05-06  931  static void fuse_readpages_end(struct fuse_mount *fm, struct fuse_args *args,
134831e36bbdd6c Miklos Szeredi   2019-09-10  932  			       int err)
db50b96c0f28a21 Miklos Szeredi   2005-09-09  933  {
c1aa96a52e9594f Miklos Szeredi   2006-01-16  934  	int i;
134831e36bbdd6c Miklos Szeredi   2019-09-10  935  	struct fuse_io_args *ia = container_of(args, typeof(*ia), ap.args);
134831e36bbdd6c Miklos Szeredi   2019-09-10  936  	struct fuse_args_pages *ap = &ia->ap;
134831e36bbdd6c Miklos Szeredi   2019-09-10  937  	size_t count = ia->read.in.size;
134831e36bbdd6c Miklos Szeredi   2019-09-10  938  	size_t num_read = args->out_args[0].size;
02d47e213dce6e2 Joanne Koong     2025-08-29  939  	struct address_space *mapping;
02d47e213dce6e2 Joanne Koong     2025-08-29  940  	struct inode *inode;
ce534fb052928ce Miklos Szeredi   2010-05-25  941  
02d47e213dce6e2 Joanne Koong     2025-08-29  942  	WARN_ON_ONCE(!ap->num_folios);
02d47e213dce6e2 Joanne Koong     2025-08-29  943  	mapping = ap->folios[0]->mapping;
02d47e213dce6e2 Joanne Koong     2025-08-29 @944  	inode = mapping->host;
c1aa96a52e9594f Miklos Szeredi   2006-01-16  945  
5c5c5e51b26413d Miklos Szeredi   2008-04-30  946  	/*
5c5c5e51b26413d Miklos Szeredi   2008-04-30  947  	 * Short read means EOF. If file size is larger, truncate it
5c5c5e51b26413d Miklos Szeredi   2008-04-30  948  	 */
134831e36bbdd6c Miklos Szeredi   2019-09-10  949  	if (!err && num_read < count)
134831e36bbdd6c Miklos Szeredi   2019-09-10  950  		fuse_short_read(inode, ia->read.attr_ver, num_read, ap);
5c5c5e51b26413d Miklos Szeredi   2008-04-30  951  
451418fc928b5ec Andrew Gallagher 2013-11-05  952  	fuse_invalidate_atime(inode);
c1aa96a52e9594f Miklos Szeredi   2006-01-16  953  
0c67c37e1710b2a Joanne Koong     2025-02-11  954  	for (i = 0; i < ap->num_folios; i++) {
51b025301824f16 Joanne Koong     2024-10-24  955  		folio_end_read(ap->folios[i], !err);
0c67c37e1710b2a Joanne Koong     2025-02-11  956  		folio_put(ap->folios[i]);
0c67c37e1710b2a Joanne Koong     2025-02-11  957  	}
134831e36bbdd6c Miklos Szeredi   2019-09-10  958  	if (ia->ff)
be926e6761d28d1 Paul Lawrence    2021-12-02 @959  		fuse_file_put(mapping ? mapping->host : NULL, ia->ff, false);
134831e36bbdd6c Miklos Szeredi   2019-09-10  960  
134831e36bbdd6c Miklos Szeredi   2019-09-10  961  	fuse_io_free(ia);
c1aa96a52e9594f Miklos Szeredi   2006-01-16  962  }
c1aa96a52e9594f Miklos Szeredi   2006-01-16  963  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
