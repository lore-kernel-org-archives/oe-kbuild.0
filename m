Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB238F639
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072361; cv=none; b=GHS/22IA0E3A2YRcIjobETl5SGWVK3uqwtEOMTwlYqNhjUEWKBGA+Lw7TlWs1o2jZKFeWDtqMdpzkD+YeekAlBEw6/KpYu0kx888xMEQsB8Zr5DWwVSzW8yQBBhIGDjwL/JWIIsi04b9CLjwYpMRffIrMou1OuyNdqM177o6H1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072361; c=relaxed/simple;
	bh=Tats049RNkGA6hI4EgdhhS+dLP1U37RfUPZCNF4D1RQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gdgshBqn8BaeKdMQ/r/+ozb3cmZULnzDgE4g7FU1lgNux5ADm5XB3eTGCLWKTpJg3lXAnHjVkBoarfAAeKH86P2eH04W6jA46BctfHtxhPK42yeTh95PmM9D7mahEWRQJLP2XAd6SpfM9M4yZKNvc7aCzOP8ZwJIQ7ZZedwsp6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0hyKGT3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0hyKGT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787072358; x=1818608358;
  h=date:from:to:cc:subject:message-id;
  bh=Tats049RNkGA6hI4EgdhhS+dLP1U37RfUPZCNF4D1RQ=;
  b=U0hyKGT3Fs3wdrB0MkoDlIcAPejm36cgg3j+el/HoMtfM6KraYeu8UAu
   j6fbytYLQawuD97ZPI6751cBXeIcOpz/+FYBTo97ehJX+2Kr9rdSmsQzm
   lXZskwd6a1I64j6TY7o+HDPdqv2hBgyX7AihwJ7A3pwHzhUb4+djYQRXb
   c5N/mBSoxbDfDKyb2AkcGsUW5ADaM+vFkq9JZMM98Xtk989FkUvFaUtX8
   KaDQt3oTfMqyvi5Ubgj3pYQYadwgeM/zXXYrM0lDwhxXv9gC8dI3yDNmn
   1rqDsLmt7pUQbjl2pz1JXDkV8DZ2VJkC1Z/OJ46aUFSslyGQov+e42E2b
   w==;
X-CSE-ConnectionGUID: 56WmOGpCQVy5l3tBqD/3XA==
X-CSE-MsgGUID: TtTUvM/zR3G6dnGCXHIoQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90086864"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90086864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:59:14 -0700
X-CSE-ConnectionGUID: BIZq+xXnQV+qrLdngZZmXg==
X-CSE-MsgGUID: KL10ZXM7T2iy1LKJx9FsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259092151"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 09:59:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwN9a-00000000eSA-1V9C;
	Tue, 18 Aug 2026 16:59:10 +0000
Date: Wed, 19 Aug 2026 00:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 32/32] fs/fuse/file.c:959
 fuse_readpages_end() warn: variable dereferenced before check 'mapping' (see
 line 944)
Message-ID: <202608190010.lNezCZVt-lkp@intel.com>
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
head:   5c36f73a41f1533cae407eba882ca2940e1775f1
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [32/32] ANDROID: fuse-bpf: fuse-bpf v1.3
:::::: branch date: 29 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260819/202608190010.lNezCZVt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608190010.lNezCZVt-lkp@intel.com/

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
