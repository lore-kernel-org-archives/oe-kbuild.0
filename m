Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6E81ACA
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020054; cv=none; b=gSNu0nq9XTe9qObKq9fLJ7JnE1q9CmkUR5h8jaIkvy3LK9mXk1XTTvgHYuQQUQWWhwN2RLu8oqaQGNhkidNZ0DqyNgSLhm+kYAGFCQFs06o8Xk+kqfGSPW+A1Y23hg3ywHhlU1+Qner2+G1CyAoSKG/C7LjFNblq+nwIdDBDRCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020054; c=relaxed/simple;
	bh=1biikZg6zy6VWOXo8tYaxPTghxwmPyBsbDk3HT/wa38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKRORL0Oa7sN93DDjg0f8PY7TmhXFCkL1SMm1XqusGI57zpaisul8PjaQQUnmatqomL/VODfNnq5XjLfQ7z1DLzKjfyiglAhQ5URjNwArErwxhm1njhnnX87CFUvnSgrU7dc8ZY5WrHR6jKSDhM4uGZoNYxwaD66PlWwm81I0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmmkk/nC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmmkk/nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766020053; x=1797556053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1biikZg6zy6VWOXo8tYaxPTghxwmPyBsbDk3HT/wa38=;
  b=Zmmkk/nC56BsmEfY76o+ZyFkLunhEgISOmBucLaNmEZCBltpTmUf0fT5
   fMPC+kHgqxciuroS2FMJmH0sQIG08jI/d/dPy3vtzmNutZv0LXj+Veyri
   ggZDuh0BZ8NpehXAYsRBiP15HIsgoLPYSoqwgJeXBeqdEnm/bm3LC7fFN
   iyj02wsuW6Hlch6Pt2vZb2SKmEjU4u+JH4GMc1MhcCPjwJeo4mNpz9cEb
   pcbvH/PYsB8Uv8QvHA2QTz1aGw7pld+LR7pigLXo2MKFeR5eeoNZuj5DO
   UkpN7Cy668Z2ss6Ahy4HYvD7C/3UJVJrXvaNeHPxvvKXm+bePiSrweTmn
   Q==;
X-CSE-ConnectionGUID: p3AjOkMMTFSwvywzMv85bA==
X-CSE-MsgGUID: yO9NzbzSQYeDZRgiLjIymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="55544087"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="55544087"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 17:07:23 -0800
X-CSE-ConnectionGUID: UY/WDlW/QxKDLUXYexgDeg==
X-CSE-MsgGUID: 6BkCbdAOTqmO6dJgLkpDig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="235866858"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2025 17:07:22 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW2UB-000000001Of-3smP;
	Thu, 18 Dec 2025 01:07:19 +0000
Date: Thu, 18 Dec 2025 09:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981
 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-45)'
Message-ID: <202512180851.WNLFBz7t-lkp@intel.com>
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
TO: Saeed Mahameed <saeedm@nvidia.com>
CC: Adithya Jayachandran <ajayachandra@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
CC: Feng Liu <feliu@nvidia.com>
CC: William Tu <witu@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 1baf30426553efb3ac518b0e9d5c1c3f8ed7762a net/mlx5: E-Switch, Set/Query hca cap via vhca id
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r073-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180851.WNLFBz7t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512180851.WNLFBz7t-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-45)'

vim +981 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

1baf30426553efb Saeed Mahameed 2025-06-16  977  
1baf30426553efb Saeed Mahameed 2025-06-16  978  static inline bool
1baf30426553efb Saeed Mahameed 2025-06-16  979  mlx5_esw_vport_vhca_id(struct mlx5_eswitch *esw, u16 vportn, u16 *vhca_id)
1baf30426553efb Saeed Mahameed 2025-06-16  980  {
1baf30426553efb Saeed Mahameed 2025-06-16 @981  	return -EOPNOTSUPP;
1baf30426553efb Saeed Mahameed 2025-06-16  982  }
1baf30426553efb Saeed Mahameed 2025-06-16  983  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
