Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C245028EC
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735230892; cv=none; b=Jl0aZXQn0d+d0QC3d+3nI8NOFUqvQRLOMyrspbYNvDb30Ywe666e6wBaV9lJgyjxPCtLlK0GaXqlHc/+t3Y87uxuHUxytSC9zUFrQMD/QviK1/QGROQa7XXuaGQYDJ40VXTi5yUAvV7GTahqUgLGYqdu9IIWSujSf7hkeIEmoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735230892; c=relaxed/simple;
	bh=BzIk/1VbjF5SlrP8FbC9fGcyhGYcPyn1D6bb71aWJMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btBlZzdEgIINNuIIkv/9RtE1dsdwnlz+6YnWVEMjchBlSCMxffc8gvbuhztdwz6yatcBjxUnfpOAzRLALFOtd1hTyXu/elMRuzYJfawCY/kV4N/AJIy+g4CRr+ty0B7F9esRcU0fQSyc2QRK1vrvpq7pOEAO164Zh/BAbceZjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWQW9ODD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWQW9ODD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735230890; x=1766766890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzIk/1VbjF5SlrP8FbC9fGcyhGYcPyn1D6bb71aWJMc=;
  b=MWQW9ODDYA7yMZ5U/0+4Pu37RsfAk66F8i90iWPbCbnbAb8pFB2fWY/r
   Q3tarYYghegO3DMM9GrfmTfegiUXnnW7jMAj2qmtcVeIUWNJbRjSfVT11
   vsnU8y9Ez/TqarOxaAcxJrjPYmlVyQBDUHfM/HTKVrU+/imvF0B15DtDK
   i+XP2hvZ65g6UoxKTvoVqBeJTZb2GFwcJrS/m8zZSn+soHoq/iRpr0eUr
   NdEhZ2d3PFVmE/g8oacy3Xf1WVaHnT8s3ubTD1z35C8E3MRjW8Sk8Fsk+
   w8fXDfVn2P4SRz/UelpnXD4fnqgvqsMvDUFIEToY8oO2DXQPcBiVQ7H6Q
   Q==;
X-CSE-ConnectionGUID: czi18XZSTHaaGGm0WBO1SQ==
X-CSE-MsgGUID: BGLLlv/wT+SurFgxFtotBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="61030988"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="61030988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 08:34:50 -0800
X-CSE-ConnectionGUID: ZfHXWwlYTRSMCqtWgX+veA==
X-CSE-MsgGUID: wpnerNc1RayQTHEh1zwxMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104031621"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Dec 2024 08:34:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQqow-0002hN-2f;
	Thu, 26 Dec 2024 16:34:46 +0000
Date: Fri, 27 Dec 2024 00:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:misc-next 92/92] fs/btrfs/disk-io.c:2368
 validate_sys_chunk_array() warn: missing unwind goto?
Message-ID: <202412270051.v9aH5FZA-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   73423ceb4600c86078b588dc6c38361f88062ae4
commit: 73423ceb4600c86078b588dc6c38361f88062ae4 [92/92] btrfs: validate system chunk array at btrfs_validate_super()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r072-20241225 (https://download.01.org/0day-ci/archive/20241227/202412270051.v9aH5FZA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412270051.v9aH5FZA-lkp@intel.com/

smatch warnings:
fs/btrfs/disk-io.c:2368 validate_sys_chunk_array() warn: missing unwind goto?

vim +2368 fs/btrfs/disk-io.c

4bbcaa648d2347 Eric Sandeen 2014-08-01  2329  
73423ceb4600c8 Qu Wenruo    2024-12-21  2330  static int validate_sys_chunk_array(const struct btrfs_fs_info *fs_info,
73423ceb4600c8 Qu Wenruo    2024-12-21  2331  				    const struct btrfs_super_block *sb)
73423ceb4600c8 Qu Wenruo    2024-12-21  2332  {
73423ceb4600c8 Qu Wenruo    2024-12-21  2333  	unsigned int cur = 0; /* Offset inside the sys chunk array */
73423ceb4600c8 Qu Wenruo    2024-12-21  2334  	/*
73423ceb4600c8 Qu Wenruo    2024-12-21  2335  	 * At sb read time, fs_info is not fully utilized. Thus we have
73423ceb4600c8 Qu Wenruo    2024-12-21  2336  	 * to use super block sectorsize, which should have been validated.
73423ceb4600c8 Qu Wenruo    2024-12-21  2337  	 */
73423ceb4600c8 Qu Wenruo    2024-12-21  2338  	const u32 sectorsize = btrfs_super_sectorsize(sb);
73423ceb4600c8 Qu Wenruo    2024-12-21  2339  	u32 sys_array_size = btrfs_super_sys_array_size(sb);
73423ceb4600c8 Qu Wenruo    2024-12-21  2340  
73423ceb4600c8 Qu Wenruo    2024-12-21  2341  	if (sys_array_size > BTRFS_SYSTEM_CHUNK_ARRAY_SIZE) {
73423ceb4600c8 Qu Wenruo    2024-12-21  2342  		btrfs_err(fs_info, "system chunk array too big %u > %u",
73423ceb4600c8 Qu Wenruo    2024-12-21  2343  			  sys_array_size, BTRFS_SYSTEM_CHUNK_ARRAY_SIZE);
73423ceb4600c8 Qu Wenruo    2024-12-21  2344  		return -EUCLEAN;
73423ceb4600c8 Qu Wenruo    2024-12-21  2345  	}
73423ceb4600c8 Qu Wenruo    2024-12-21  2346  
73423ceb4600c8 Qu Wenruo    2024-12-21  2347  	while (cur < sys_array_size) {
73423ceb4600c8 Qu Wenruo    2024-12-21  2348  		struct btrfs_disk_key *disk_key;
73423ceb4600c8 Qu Wenruo    2024-12-21  2349  		struct btrfs_chunk *chunk;
73423ceb4600c8 Qu Wenruo    2024-12-21  2350  		struct btrfs_key key;
73423ceb4600c8 Qu Wenruo    2024-12-21  2351  		u64 type;
73423ceb4600c8 Qu Wenruo    2024-12-21  2352  		u16 num_stripes;
73423ceb4600c8 Qu Wenruo    2024-12-21  2353  		u32 len;
73423ceb4600c8 Qu Wenruo    2024-12-21  2354  		int ret;
73423ceb4600c8 Qu Wenruo    2024-12-21  2355  
73423ceb4600c8 Qu Wenruo    2024-12-21  2356  		disk_key = (struct btrfs_disk_key *)(sb->sys_chunk_array + cur);
73423ceb4600c8 Qu Wenruo    2024-12-21  2357  		len = sizeof(*disk_key);
73423ceb4600c8 Qu Wenruo    2024-12-21  2358  
73423ceb4600c8 Qu Wenruo    2024-12-21  2359  		if (cur + len > sys_array_size)
73423ceb4600c8 Qu Wenruo    2024-12-21  2360  			goto short_read;
73423ceb4600c8 Qu Wenruo    2024-12-21  2361  		cur += len;
73423ceb4600c8 Qu Wenruo    2024-12-21  2362  
73423ceb4600c8 Qu Wenruo    2024-12-21  2363  		btrfs_disk_key_to_cpu(&key, disk_key);
73423ceb4600c8 Qu Wenruo    2024-12-21  2364  		if (key.type != BTRFS_CHUNK_ITEM_KEY) {
73423ceb4600c8 Qu Wenruo    2024-12-21  2365  			btrfs_err(fs_info,
73423ceb4600c8 Qu Wenruo    2024-12-21  2366  			    "unexpected item type %u in sys_array at offset %u",
73423ceb4600c8 Qu Wenruo    2024-12-21  2367  				  key.type, cur);
73423ceb4600c8 Qu Wenruo    2024-12-21 @2368  			return -EUCLEAN;
73423ceb4600c8 Qu Wenruo    2024-12-21  2369  		}
73423ceb4600c8 Qu Wenruo    2024-12-21  2370  		chunk = (struct btrfs_chunk *)(sb->sys_chunk_array + cur);
73423ceb4600c8 Qu Wenruo    2024-12-21  2371  		num_stripes = btrfs_stack_chunk_num_stripes(chunk);
73423ceb4600c8 Qu Wenruo    2024-12-21  2372  		if (cur + btrfs_chunk_item_size(num_stripes) > sys_array_size)
73423ceb4600c8 Qu Wenruo    2024-12-21  2373  			goto short_read;
73423ceb4600c8 Qu Wenruo    2024-12-21  2374  		type = btrfs_stack_chunk_type(chunk);
73423ceb4600c8 Qu Wenruo    2024-12-21  2375  		if (!(type & BTRFS_BLOCK_GROUP_SYSTEM)) {
73423ceb4600c8 Qu Wenruo    2024-12-21  2376  			btrfs_err(fs_info,
73423ceb4600c8 Qu Wenruo    2024-12-21  2377  			"invalid chunk type %llu in sys_array at offset %u",
73423ceb4600c8 Qu Wenruo    2024-12-21  2378  				  type, cur);
73423ceb4600c8 Qu Wenruo    2024-12-21  2379  			return -EUCLEAN;
73423ceb4600c8 Qu Wenruo    2024-12-21  2380  		}
73423ceb4600c8 Qu Wenruo    2024-12-21  2381  		ret = btrfs_check_chunk_valid(fs_info, NULL, chunk, key.offset,
73423ceb4600c8 Qu Wenruo    2024-12-21  2382  					      sectorsize);
73423ceb4600c8 Qu Wenruo    2024-12-21  2383  		if (ret < 0)
73423ceb4600c8 Qu Wenruo    2024-12-21  2384  			return ret;
73423ceb4600c8 Qu Wenruo    2024-12-21  2385  		cur += btrfs_chunk_item_size(num_stripes);
73423ceb4600c8 Qu Wenruo    2024-12-21  2386  	}
73423ceb4600c8 Qu Wenruo    2024-12-21  2387  	return 0;
73423ceb4600c8 Qu Wenruo    2024-12-21  2388  short_read:
73423ceb4600c8 Qu Wenruo    2024-12-21  2389  	btrfs_err(fs_info,
73423ceb4600c8 Qu Wenruo    2024-12-21  2390  	"super block sys chunk array short read, cur=%u sys_array_size=%u",
73423ceb4600c8 Qu Wenruo    2024-12-21  2391  		  cur, sys_array_size);
73423ceb4600c8 Qu Wenruo    2024-12-21  2392  	return -EUCLEAN;
73423ceb4600c8 Qu Wenruo    2024-12-21  2393  }
73423ceb4600c8 Qu Wenruo    2024-12-21  2394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
