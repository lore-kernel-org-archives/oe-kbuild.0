Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9CD19539F
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Jan 2025 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737024647; cv=none; b=pbKjClVuvRCU3KL/+R2JKoXJxDLORvroM9wtPdPs+rGvvHyqS1hfDz0F5TG7RBB56jJqOZJ7NEbXYj959sXfisEM47AV7uIy6UzcAIt2oSqhaoOHMwxgId3R09A4FNXCyeHYp7FBaBiqp0NEkqoelvGXJAviSod7FliSrjtHR8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737024647; c=relaxed/simple;
	bh=+rVIY+Q1MxRTvztgI7IKhumlkfuegeU0qWQh+/xpa+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=odmhGq9P+Vcliozgk6QAF3XviP6pryrl2o2RXXsmkHVID5NXptQeO1bhs91xq7iLFsmgKZbcRgdEKhHnBA3ytDBQA0Xj/Qt8hVX3PjUqyja0gktan0HA6hVPOFgQH6jM8IpgY4w32t+/lDCdskQyJ54ZaQ4rx1iUy0FHfhyPTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbAPHByj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbAPHByj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737024645; x=1768560645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rVIY+Q1MxRTvztgI7IKhumlkfuegeU0qWQh+/xpa+Q=;
  b=JbAPHByj6y7BP7LiTVvzqHcin/3iMBEeE/Jil95lGuRSB6aM3mAcqfph
   1gYeakM5oqa8OkkNelGgbEdUYpffni8qH57KzezUifgmxxfeECp0s1Eo3
   jDRAx+qk2/JzLDYcOynP/knmZQWE3BxGdyqYNJ25zaA6UoXyARpajfmia
   6qtkWGd5qr79bODSmwsfAxIYrRshxf1t9tZmKgy/GQR1Iv+PH26Q9wC4X
   NURjxIus4if20RndHtKeGn6QmYGWl3cMHUDQyFZslUR0azLLrUY0IjK3O
   9TlM9BYNHmZgd54UApE6t+2MibiMFHUwI1VZMWYH5+9ELFihY5bgueAtp
   g==;
X-CSE-ConnectionGUID: HofE3XwGSYe7g23Uxu3jTw==
X-CSE-MsgGUID: IZ5QqU6CT/a4YNo9EgY1Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36613959"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36613959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 02:50:44 -0800
X-CSE-ConnectionGUID: 5tgbSRKQRTaC3tI4K3PAew==
X-CSE-MsgGUID: Q+ZCm6yFSeORfyjsVPTT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="110427812"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 02:50:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYNST-000RiR-1M;
	Thu, 16 Jan 2025 10:50:41 +0000
Date: Thu, 16 Jan 2025 18:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [riteshharjani:v6-dax-0day 11/32] fs/xfs/xfs_inode.c:3019
 xfs_break_layouts() error: uninitialized symbol 'error'.
Message-ID: <202501161825.NYsv6mAB-lkp@intel.com>
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
TO: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

tree:   https://github.com/riteshharjani/linux v6-dax-0day
head:   2326f4b83c5d3873590e31d0e09edde5b7b6b22d
commit: 12aa0c0827056fb2417d8748f10c1b79efe24683 [11/32] fs/dax: Create a common implementation to break DAX layouts
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250116 (https://download.01.org/0day-ci/archive/20250116/202501161825.NYsv6mAB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501161825.NYsv6mAB-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_inode.c:3019 xfs_break_layouts() error: uninitialized symbol 'error'.

vim +/error +3019 fs/xfs/xfs_inode.c

a4db266a705c55 Darrick J. Wong 2024-04-15  2993  
a4db266a705c55 Darrick J. Wong 2024-04-15  2994  int
a4db266a705c55 Darrick J. Wong 2024-04-15  2995  xfs_break_layouts(
a4db266a705c55 Darrick J. Wong 2024-04-15  2996  	struct inode		*inode,
a4db266a705c55 Darrick J. Wong 2024-04-15  2997  	uint			*iolock,
a4db266a705c55 Darrick J. Wong 2024-04-15  2998  	enum layout_break_reason reason)
a4db266a705c55 Darrick J. Wong 2024-04-15  2999  {
a4db266a705c55 Darrick J. Wong 2024-04-15  3000  	bool			retry;
a4db266a705c55 Darrick J. Wong 2024-04-15  3001  	int			error;
a4db266a705c55 Darrick J. Wong 2024-04-15  3002  
a4db266a705c55 Darrick J. Wong 2024-04-15  3003  	xfs_assert_ilocked(XFS_I(inode), XFS_IOLOCK_SHARED | XFS_IOLOCK_EXCL);
a4db266a705c55 Darrick J. Wong 2024-04-15  3004  
a4db266a705c55 Darrick J. Wong 2024-04-15  3005  	do {
a4db266a705c55 Darrick J. Wong 2024-04-15  3006  		retry = false;
a4db266a705c55 Darrick J. Wong 2024-04-15  3007  		switch (reason) {
a4db266a705c55 Darrick J. Wong 2024-04-15  3008  		case BREAK_UNMAP:
12aa0c0827056f Alistair Popple 2025-01-10  3009  			if (xfs_break_dax_layouts(inode))
a4db266a705c55 Darrick J. Wong 2024-04-15  3010  				break;
a4db266a705c55 Darrick J. Wong 2024-04-15  3011  			fallthrough;
a4db266a705c55 Darrick J. Wong 2024-04-15  3012  		case BREAK_WRITE:
a4db266a705c55 Darrick J. Wong 2024-04-15  3013  			error = xfs_break_leased_layouts(inode, iolock, &retry);
a4db266a705c55 Darrick J. Wong 2024-04-15  3014  			break;
a4db266a705c55 Darrick J. Wong 2024-04-15  3015  		default:
a4db266a705c55 Darrick J. Wong 2024-04-15  3016  			WARN_ON_ONCE(1);
a4db266a705c55 Darrick J. Wong 2024-04-15  3017  			error = -EINVAL;
a4db266a705c55 Darrick J. Wong 2024-04-15  3018  		}
a4db266a705c55 Darrick J. Wong 2024-04-15 @3019  	} while (error == 0 && retry);
a4db266a705c55 Darrick J. Wong 2024-04-15  3020  
a4db266a705c55 Darrick J. Wong 2024-04-15  3021  	return error;
a4db266a705c55 Darrick J. Wong 2024-04-15  3022  }
ee20808d848c87 Darrick J. Wong 2024-04-15  3023  

:::::: The code at line 3019 was first introduced by commit
:::::: a4db266a705c5518f3049074fd233b6c57daab00 xfs: move inode lease breaking functions to xfs_inode.c

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
