Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278DE8F4A
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 00:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761352359; cv=none; b=ppCluLEq2vrLRDruzOaivGEjTvbHyG9xojjR4WVu5WxEMOP3HFmW03FoCVIpyGQvUzrgG0gmkyD620pC+gbZNAN5ygp08zhbbf/+rn7N+iRcsQ57LhCQqHV71/cAdpOD5T64vsxa9DTkMAnOPdk4TPZYyOqXTdWuS882GYaA5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761352359; c=relaxed/simple;
	bh=pMqV5WBCQ/IZlNwbsJUTybNihOynGFJHZdS5UGo+JdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/fbM9JzUjK6A+bZpJxqqcug2t6Vm2eBSOWQD4vGAphUaCAH2rDKnhA1VF2RlfqV3vAXGjt6PjAQv/94hpuHnsgKMHWCv6Od98nZW6oIIgaOtf0pYfezU/GA7OW01SaeahM8C6MiBcDW/9vqjsWTkiCxJh2d+mNV+nxYFM5OKDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hl4K6R8r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hl4K6R8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761352357; x=1792888357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMqV5WBCQ/IZlNwbsJUTybNihOynGFJHZdS5UGo+JdU=;
  b=hl4K6R8r84l3DmacyPVAGTcD5lKv434SFzEZCBNCtX1c4Fy30jeqdq2v
   oc+ofWsj+Wf4qXbgzunRgs7rxSWNUXD94m5xBBzV+F8kzA3hhwuAtRm0o
   ewx6t/WUk1Ec9FdliHgkWIvSp0qgRBP9BxSTG4p+4ZLB8ONpcxiRFfv02
   j8JQk8p9SkevT8sl7Sk5B/kQMcBQYY+KBKZA2YnZYfurvu7Krc3e+uZVE
   bWR/YgPuMaA0BpCHfJCCv5WZfggh+AXBbfdU6imMD48rtyTt0QkUMbFzU
   B6i7TZUJd322xNAeMzy8FCmuCXStcMFIz5F/qBGRxEvsPQdYr4BvHUXHH
   w==;
X-CSE-ConnectionGUID: xVP/UOGWSwyTJFjn8+/tEg==
X-CSE-MsgGUID: T2BA2AhQRBuxjLQNqkB4Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66148766"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="66148766"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 17:32:36 -0700
X-CSE-ConnectionGUID: zT3CfpkeSA+agIhMB2XFTA==
X-CSE-MsgGUID: VIG9c8foTDm0ch6k5X9Vsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="185316806"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 17:32:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCSCv-000F0B-0S;
	Sat, 25 Oct 2025 00:32:33 +0000
Date: Sat, 25 Oct 2025 08:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/relocation.c:1934:54-61: WARNING: Consider using %pe to
 print PTR_ERR()
Message-ID: <202510250853.JMZnaMYZ-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2818517e3486d11c9bd55aca3e14059e4c69886
commit: 9e0a739a9e83eb28ceb0b1e97861c88f177a7f18 btrfs: convert ASSERT(0) with handled errors to DEBUG_WARN()
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r052-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250853.JMZnaMYZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510250853.JMZnaMYZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/relocation.c:1934:54-61: WARNING: Consider using %pe to print PTR_ERR()

vim +1934 fs/btrfs/relocation.c

5d4f98a28c7d334 Yan Zheng     2009-06-10  1912  
5d4f98a28c7d334 Yan Zheng     2009-06-10  1913  static int record_reloc_root_in_trans(struct btrfs_trans_handle *trans,
5d4f98a28c7d334 Yan Zheng     2009-06-10  1914  				      struct btrfs_root *reloc_root)
5d4f98a28c7d334 Yan Zheng     2009-06-10  1915  {
0b246afa62b0cf5 Jeff Mahoney  2016-06-22  1916  	struct btrfs_fs_info *fs_info = reloc_root->fs_info;
5d4f98a28c7d334 Yan Zheng     2009-06-10  1917  	struct btrfs_root *root;
442b1ac5244ea2d Josef Bacik   2020-01-24  1918  	int ret;
5d4f98a28c7d334 Yan Zheng     2009-06-10  1919  
ca84529a842f3a1 Filipe Manana 2024-07-01  1920  	if (btrfs_get_root_last_trans(reloc_root) == trans->transid)
5d4f98a28c7d334 Yan Zheng     2009-06-10  1921  		return 0;
5d4f98a28c7d334 Yan Zheng     2009-06-10  1922  
a820feb546842a4 David Sterba  2020-05-15  1923  	root = btrfs_get_fs_root(fs_info, reloc_root->root_key.offset, false);
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1924  
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1925  	/*
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1926  	 * This should succeed, since we can't have a reloc root without having
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1927  	 * already looked up the actual root and created the reloc root for this
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1928  	 * root.
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1929  	 *
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1930  	 * However if there's some sort of corruption where we have a ref to a
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1931  	 * reloc root without a corresponding root this could return ENOENT.
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1932  	 */
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1933  	if (IS_ERR(root)) {
9e0a739a9e83eb2 David Sterba  2025-04-17 @1934  		DEBUG_WARN("error %ld reading root for reloc root", PTR_ERR(root));
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1935  		return PTR_ERR(root);
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1936  	}
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1937  	if (root->reloc_root != reloc_root) {
9e0a739a9e83eb2 David Sterba  2025-04-17  1938  		DEBUG_WARN("unexpected reloc root found");
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1939  		btrfs_err(fs_info,
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1940  			  "root %llu has two reloc roots associated with it",
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1941  			  reloc_root->root_key.offset);
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1942  		btrfs_put_root(root);
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1943  		return -EUCLEAN;
404bccbcaa7ecb0 Josef Bacik   2021-03-12  1944  	}
442b1ac5244ea2d Josef Bacik   2020-01-24  1945  	ret = btrfs_record_root_in_trans(trans, root);
0024652895e3479 Josef Bacik   2020-01-24  1946  	btrfs_put_root(root);
5d4f98a28c7d334 Yan Zheng     2009-06-10  1947  
442b1ac5244ea2d Josef Bacik   2020-01-24  1948  	return ret;
5d4f98a28c7d334 Yan Zheng     2009-06-10  1949  }
5d4f98a28c7d334 Yan Zheng     2009-06-10  1950  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
