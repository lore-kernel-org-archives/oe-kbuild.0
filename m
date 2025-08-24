Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024092D7BF
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756059337; cv=none; b=i4GGGLH7j2PGwmPJUsz4GJK6+rLMikkO04oVKqrOwJB8TDNxttDNQVVkoBnbO/rO+sjZDNDM6aYR4nmQG/r8ZHY0huEJ8GTJxTZVP8Kww/d9j1hSWb/L11rIvp81pk5LOiEB2VLayUWnrmQB6OeYLc7xnreY5CVOeFOQ9DjVH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756059337; c=relaxed/simple;
	bh=ffAtGXz9SWZNt32hITq+f6yRwc0lQBfV4fFjz44voV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLrlpSGTwjnW1VGkPC8PHVPSURgET0VYOE7y/TKkge/vLYBXfo4bCj46KdnooHz5HyOC1fepSY6obSnPb8i5dRCxyMNhmLbNjMd6ygYEJkjGgnlYS6fKMhoo++rgnDKPiP3+mdwOzhhMvyVFgJP0WVuQGgjvrXibJSqAqX7IBRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2IwNaPQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2IwNaPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756059337; x=1787595337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ffAtGXz9SWZNt32hITq+f6yRwc0lQBfV4fFjz44voV4=;
  b=D2IwNaPQW2NnZ8KAjAufi65qQBDZszHZyZqGYSb2jH4lPWjCznUvEm9K
   eIOq0GqKX3aj2aVhw2WDtTzZZjFviAOGdFC4TkNyCHB37+azqwRdIAJMY
   YkgMsp5S+tzjltEy6iHPlYpZ1PCXphm3carqrhL/KRucMRCjKBNPmNwmH
   NgMIbsfrU+Kywvdq1TV2ITyCcWgEgWLp0RzrRuVNsZghXxdUJdfRoyBPQ
   Tj9b2JlUIB8hZsq7Iw68TBocalGuzf5Z5o/WV+kNkKxnUteyvWqaJAUHi
   JLvlMITIhY4+LKyS4MW6tP7SRFuecYMdx83ZvOFvgayHjIkR+xa51q5Wm
   A==;
X-CSE-ConnectionGUID: 9VXIyPDqSnO68hjZLjRLsQ==
X-CSE-MsgGUID: v4UhZjfaRmWvKdLC+chk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="68551582"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68551582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 11:15:36 -0700
X-CSE-ConnectionGUID: 2SJ/57YGQxWzVd2vjDVnCQ==
X-CSE-MsgGUID: 77sjc8uWQ8ChERpD8FHjfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200057412"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Aug 2025 11:15:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqFFc-000N8d-0X;
	Sun, 24 Aug 2025 18:15:32 +0000
Date: Mon, 25 Aug 2025 02:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2381/4234]
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981
 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-95)'
Message-ID: <202508250221.IoqBZOXQ-lkp@intel.com>
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
TO: Saeed Mahameed <saeedm@nvidia.com>
CC: Adithya Jayachandran <ajayachandra@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
CC: Feng Liu <feliu@nvidia.com>
CC: William Tu <witu@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: 1baf30426553efb3ac518b0e9d5c1c3f8ed7762a [2381/4234] net/mlx5: E-Switch, Set/Query hca cap via vhca id
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-r071-20250821 (https://download.01.org/0day-ci/archive/20250825/202508250221.IoqBZOXQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508250221.IoqBZOXQ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-95)'

vim +981 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

1baf30426553ef Saeed Mahameed 2025-06-16  977  
1baf30426553ef Saeed Mahameed 2025-06-16  978  static inline bool
1baf30426553ef Saeed Mahameed 2025-06-16  979  mlx5_esw_vport_vhca_id(struct mlx5_eswitch *esw, u16 vportn, u16 *vhca_id)
1baf30426553ef Saeed Mahameed 2025-06-16  980  {
1baf30426553ef Saeed Mahameed 2025-06-16 @981  	return -EOPNOTSUPP;
1baf30426553ef Saeed Mahameed 2025-06-16  982  }
1baf30426553ef Saeed Mahameed 2025-06-16  983  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
