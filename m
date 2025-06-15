Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCABA262FD4
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Jun 2025 20:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019804; cv=none; b=u9QlfDuFyhI/W87kQJmGcI3YrcdwvisS8Gz219PY8cjqZ9jP876q49SzUVAna6dhyzabvG2AvvRHBaRq6ZbMxxz/1FKE/c/ned1tQzBds5HNHVUy5EXvPfsscZ0t8BQKmnT7GXDq+/hFHiY+1uzDINk2aJaUi/mwfXbynjwMMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019804; c=relaxed/simple;
	bh=33Jd1hqe1kbZ6z7uk0ei0QVNhrK8ccYepgKZDuYQvxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upAPJyQ/YuQfHZ3jYrl7Leo7Gblxk1+1bcBn+nN7a9ImCvrYRb/l/Uh77DJKT8uNS2vX+ZwaxRuTpoiCH2KSv730uNHZW/PmT0EY/5QLWlJYCJQbNQ3zH4JG5jo9k13Zhhw05bEIPKKA3A/xMZ3aai6L6D9MgvCsUymZShRU4v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7CxKNL4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7CxKNL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750019802; x=1781555802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33Jd1hqe1kbZ6z7uk0ei0QVNhrK8ccYepgKZDuYQvxw=;
  b=D7CxKNL4uv5b4zGcDEHGDu9I1f1INfJYY6KJakk9ar8yVLIGX5sbWVnb
   Nzl7oWNPmQ1wdK+ZUbCkQqMcciDmr4m2nGsagzuAyQi5QnPVSow4boNdz
   kmaSlHdzk4fgbT4gi4biGg/j67kbz4l/n6UIq3YEiknZNEg8eIqgecfT6
   ynlxVkQ2blhFUgxpMtd0oVT7knRnllbZD14sVIUE/Gc7c2mkLxY/SY/0G
   P3/npDF/cvPjeViM9kihNwEoHSTNQnwdrqjmMCnyTtDLU+EQPs/xANYqk
   oE4TUGpxPQhhftedkhqV7NBqqN7r35NUS2KFKoUFlfpmB+tQdGPtz6Tsw
   A==;
X-CSE-ConnectionGUID: K692WxKaTKa2V1goPqGdMw==
X-CSE-MsgGUID: BQ7WFOfBT1qZvhLOHrgyog==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69737720"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="69737720"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 13:36:41 -0700
X-CSE-ConnectionGUID: +6F4sJ5eRZm3giwsrSKjbw==
X-CSE-MsgGUID: pndU0VRHQZyKHgXV1dJz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="148192837"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2025 13:36:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQu5l-000EXM-2z;
	Sun, 15 Jun 2025 20:36:37 +0000
Date: Mon, 16 Jun 2025 04:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [btrfs:pr/1157 1/1] fs/btrfs/qgroup.c:359 qgroup_mark_inconsistent()
 warn: maybe use && instead of &
Message-ID: <202506160432.y5tEff7D-lkp@intel.com>
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
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://github.com/btrfs/linux.git pr/1157
head:   b9b695688148bd512273989145bc6ca0e272a53c
commit: b9b695688148bd512273989145bc6ca0e272a53c [1/1] btrfs: add extra warning when qgroup is marked inconsistent
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20250616 (https://download.01.org/0day-ci/archive/20250616/202506160432.y5tEff7D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506160432.y5tEff7D-lkp@intel.com/

smatch warnings:
fs/btrfs/qgroup.c:359 qgroup_mark_inconsistent() warn: maybe use && instead of &

vim +359 fs/btrfs/qgroup.c

faa2dbf004e89e Josef Bacik  2014-05-07  348  
b9b695688148bd Qu Wenruo    2025-06-11  349  __printf(2, 3)
b9b695688148bd Qu Wenruo    2025-06-11  350  static void qgroup_mark_inconsistent(struct btrfs_fs_info *fs_info, const char *fmt, ...)
e562a8bdf652b0 Qu Wenruo    2022-08-24  351  {
b9b695688148bd Qu Wenruo    2025-06-11  352  	bool old_flags = fs_info->qgroup_flags;
b9b695688148bd Qu Wenruo    2025-06-11  353  
182940f4f4dbd9 Boris Burkov 2023-05-16  354  	if (btrfs_qgroup_mode(fs_info) == BTRFS_QGROUP_MODE_SIMPLE)
182940f4f4dbd9 Boris Burkov 2023-05-16  355  		return;
e562a8bdf652b0 Qu Wenruo    2022-08-24  356  	fs_info->qgroup_flags |= (BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT |
e15e9f43c7ca25 Qu Wenruo    2022-08-24  357  				  BTRFS_QGROUP_RUNTIME_FLAG_CANCEL_RESCAN |
e15e9f43c7ca25 Qu Wenruo    2022-08-24  358  				  BTRFS_QGROUP_RUNTIME_FLAG_NO_ACCOUNTING);
b9b695688148bd Qu Wenruo    2025-06-11 @359  	if (!(old_flags & BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT)) {
b9b695688148bd Qu Wenruo    2025-06-11  360  		struct va_format vaf;
b9b695688148bd Qu Wenruo    2025-06-11  361  		va_list args;
b9b695688148bd Qu Wenruo    2025-06-11  362  
b9b695688148bd Qu Wenruo    2025-06-11  363  		va_start(args, fmt);
b9b695688148bd Qu Wenruo    2025-06-11  364  		vaf.fmt = fmt;
b9b695688148bd Qu Wenruo    2025-06-11  365  		vaf.va = &args;
b9b695688148bd Qu Wenruo    2025-06-11  366  
b9b695688148bd Qu Wenruo    2025-06-11  367  		btrfs_warn_rl(fs_info, "qgroup marked inconsistent, %pV", &vaf);
b9b695688148bd Qu Wenruo    2025-06-11  368  		va_end(args);
b9b695688148bd Qu Wenruo    2025-06-11  369  	}
e562a8bdf652b0 Qu Wenruo    2022-08-24  370  }
e562a8bdf652b0 Qu Wenruo    2022-08-24  371  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
