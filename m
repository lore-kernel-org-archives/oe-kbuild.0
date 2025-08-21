Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0D296BA6
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763181; cv=none; b=dp8Jw26DUB3kJPsukno2B6igX7NvDFKJ2h8UTW9MraQnmLIh84D2YW42Jngs14MoKLLT2g03cXqyWoJi7cjA/Ymg9q/HbPTUO7Ltrt77YsgdTqqm+VARack3FtNeepxc8FDO/rBAwDGz0VqCwtwaFj2M+JxX/exbZog8DdSwDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763181; c=relaxed/simple;
	bh=qKdOEmS28tdDhqlXtuaBqaPluUCoqiC0kPrNcvbd5BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ho+XYA5aGvLNPfVZKC8ZUaV3dOAE8MxhlG7o9rWRKm35djT84NjLiVHuKZo7afTUDT/NvFtaYsPrit+8poTQHxeyCWxDY2l96ZFGvI+V1kq0BV8ikqRgKqE+l5u+hdgwwu1ARUaOaKTheBUJpJHbo/g0udXV0CZp1103h95Ving=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhRJMurq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhRJMurq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755763179; x=1787299179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qKdOEmS28tdDhqlXtuaBqaPluUCoqiC0kPrNcvbd5BM=;
  b=YhRJMurqOAjJwjzgbFXcVy7OkwbzdOrwXZ6etgkZh8UxdfyGZLo2w8HT
   2nZ58ghfVQA4uqwakC/Ii+yYq+fkKM0R9M+mj0X53piZTxQVebP9IpwHe
   6sagzzfKa9AGORB2aBHtaAm1RJCJ+nUM50WB/At207ZHuQcPX9xcWPgSO
   ix8OaIYDcfd/BEGJQN/NIs5oMhMrU48BlXMi49ey6KJQR4SZsmgrDh6ft
   zqcVCsVQJPS2BNUxAv6BYtInRJxtubFrJSpvhv2FvH/3Z0xDW1TszpsJa
   vDDLrVkPC2a9E670T6hP34MBfCjsgxITkd3yKuuon5Xlc7iKr9xA2W4TL
   A==;
X-CSE-ConnectionGUID: lGKPH+KvQQiI9ljSIj8uKw==
X-CSE-MsgGUID: FDtc7QwtQDa3dYgvILhFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60673341"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="60673341"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 00:59:32 -0700
X-CSE-ConnectionGUID: YR+o06Y9RuaOYtpZ/z+SSw==
X-CSE-MsgGUID: Vg7pWIoMScaJxVXhHIgoGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168267346"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2025 00:59:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up0Cl-000K4F-08;
	Thu, 21 Aug 2025 07:59:27 +0000
Date: Thu, 21 Aug 2025 15:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
Message-ID: <202508211534.QmDKCbTm-lkp@intel.com>
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
In-Reply-To: <20250819033819.19826-1-sunk67188@gmail.com>
References: <20250819033819.19826-1-sunk67188@gmail.com>
TO: Sun YangKai <sunk67188@gmail.com>
TO: linux-btrfs@vger.kernel.org
CC: Sun YangKai <sunk67188@gmail.com>

Hi Sun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17-rc2]
[also build test WARNING on linus/master next-20250820]
[cannot apply to kdave/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-YangKai/btrfs-more-trivial-BTRFS_PATH_AUTO_FREE-conversions/20250819-114252
base:   v6.17-rc2
patch link:    https://lore.kernel.org/r/20250819033819.19826-1-sunk67188%40gmail.com
patch subject: [PATCH] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r071-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211534.QmDKCbTm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508211534.QmDKCbTm-lkp@intel.com/

smatch warnings:
fs/btrfs/send.c:931 get_inode_info() warn: missing error code? 'ret'

vim +/ret +931 fs/btrfs/send.c

7e93f6dc11d9128 BingJing Chang  2022-08-12  904  
31db9f7c23fbf7e Alexander Block 2012-07-25  905  /*
31db9f7c23fbf7e Alexander Block 2012-07-25  906   * Helper function to retrieve some fields from an inode item.
31db9f7c23fbf7e Alexander Block 2012-07-25  907   */
7e93f6dc11d9128 BingJing Chang  2022-08-12  908  static int get_inode_info(struct btrfs_root *root, u64 ino,
7e93f6dc11d9128 BingJing Chang  2022-08-12  909  			  struct btrfs_inode_info *info)
31db9f7c23fbf7e Alexander Block 2012-07-25  910  {
31db9f7c23fbf7e Alexander Block 2012-07-25  911  	int ret;
c8ce1e5fe626333 Sun YangKai     2025-08-19  912  	BTRFS_PATH_AUTO_FREE(path);
31db9f7c23fbf7e Alexander Block 2012-07-25  913  	struct btrfs_inode_item *ii;
31db9f7c23fbf7e Alexander Block 2012-07-25  914  	struct btrfs_key key;
31db9f7c23fbf7e Alexander Block 2012-07-25  915  
7e93f6dc11d9128 BingJing Chang  2022-08-12  916  	path = alloc_path_for_send();
7e93f6dc11d9128 BingJing Chang  2022-08-12  917  	if (!path)
7e93f6dc11d9128 BingJing Chang  2022-08-12  918  		return -ENOMEM;
7e93f6dc11d9128 BingJing Chang  2022-08-12  919  
31db9f7c23fbf7e Alexander Block 2012-07-25  920  	key.objectid = ino;
31db9f7c23fbf7e Alexander Block 2012-07-25  921  	key.type = BTRFS_INODE_ITEM_KEY;
31db9f7c23fbf7e Alexander Block 2012-07-25  922  	key.offset = 0;
31db9f7c23fbf7e Alexander Block 2012-07-25  923  	ret = btrfs_search_slot(NULL, root, &key, path, 0, 0);
31db9f7c23fbf7e Alexander Block 2012-07-25  924  	if (ret) {
3f8a18cc53bd1be Josef Bacik     2014-03-28  925  		if (ret > 0)
31db9f7c23fbf7e Alexander Block 2012-07-25  926  			ret = -ENOENT;
c8ce1e5fe626333 Sun YangKai     2025-08-19  927  		return ret;
31db9f7c23fbf7e Alexander Block 2012-07-25  928  	}
31db9f7c23fbf7e Alexander Block 2012-07-25  929  
7e93f6dc11d9128 BingJing Chang  2022-08-12  930  	if (!info)
c8ce1e5fe626333 Sun YangKai     2025-08-19 @931  		return ret;
7e93f6dc11d9128 BingJing Chang  2022-08-12  932  
31db9f7c23fbf7e Alexander Block 2012-07-25  933  	ii = btrfs_item_ptr(path->nodes[0], path->slots[0],
31db9f7c23fbf7e Alexander Block 2012-07-25  934  			struct btrfs_inode_item);
7e93f6dc11d9128 BingJing Chang  2022-08-12  935  	info->size = btrfs_inode_size(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  936  	info->gen = btrfs_inode_generation(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  937  	info->mode = btrfs_inode_mode(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  938  	info->uid = btrfs_inode_uid(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  939  	info->gid = btrfs_inode_gid(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  940  	info->rdev = btrfs_inode_rdev(path->nodes[0], ii);
9ed0a72e5b355d4 BingJing Chang  2022-08-12  941  	info->nlink = btrfs_inode_nlink(path->nodes[0], ii);
4824735918a1b7f David Sterba    2022-05-18  942  	/*
4824735918a1b7f David Sterba    2022-05-18  943  	 * Transfer the unchanged u64 value of btrfs_inode_item::flags, that's
4824735918a1b7f David Sterba    2022-05-18  944  	 * otherwise logically split to 32/32 parts.
4824735918a1b7f David Sterba    2022-05-18  945  	 */
7e93f6dc11d9128 BingJing Chang  2022-08-12  946  	info->fileattr = btrfs_inode_flags(path->nodes[0], ii);
31db9f7c23fbf7e Alexander Block 2012-07-25  947  
3f8a18cc53bd1be Josef Bacik     2014-03-28  948  	return ret;
3f8a18cc53bd1be Josef Bacik     2014-03-28  949  }
3f8a18cc53bd1be Josef Bacik     2014-03-28  950  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
