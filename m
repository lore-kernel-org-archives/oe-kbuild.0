Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223314432
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681982680; x=1713518680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRiDaiDJdS8VdWWLWP4tLHpBrHcDj6m8IFR+aXvAfXw=;
  b=TEMavZyULI195E6GHUnRsQDai+ZCpPbeRlFU8X8EljAwoiYFbP4g8l3k
   X0S2ZnAVCKsnIVUG9DhW8pmXDzhizJectpoxAJhm5i1Q6eIic8mGnZi/h
   X4mpKlCrBw8aZDf9wkD0kcEY7KzaJwSPCQ2SYqF1D047WTpd9UyykOR4R
   GsVT4iOYZTHqm4H7dgEmb2FI+EitxZ90L2rYD8qJrRoU0jnsZJWl30hNh
   JSYTWBIcIpFWlIPyvhXgU+J4loqYSQ9KPzhqrW/eEUOgGhc7dbole6pZV
   ZSCKpEWb4xoTVNxxhljG07fAEJo9n7Rx5OBMl0SkhMVxTIuLqjQ+CV3/Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410921554"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="410921554"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 02:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937987812"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="937987812"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2023 02:24:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppQWn-000ffS-3D;
	Thu, 20 Apr 2023 09:24:34 +0000
Date: Thu, 20 Apr 2023 17:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/tegra/cbb/tegra-cbb.c:96 tegra_cbb_err_debugfs_init()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202304201719.AnFYgA2p-lkp@intel.com>
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
TO: Sumit Gupta <sumitg@nvidia.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb0856346a60fe3eb837ba5e73588a41f81ac05f
commit: b7134422146692e096e807751656fc58ee1a717d soc/tegra: cbb: Add CBB 1.0 driver for Tegra194
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304201719.AnFYgA2p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304201719.AnFYgA2p-lkp@intel.com/

smatch warnings:
drivers/soc/tegra/cbb/tegra-cbb.c:96 tegra_cbb_err_debugfs_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +96 drivers/soc/tegra/cbb/tegra-cbb.c

b7134422146692 Sumit Gupta 2022-05-12   87  
b7134422146692 Sumit Gupta 2022-05-12   88  static int tegra_cbb_err_debugfs_init(struct tegra_cbb *cbb)
b7134422146692 Sumit Gupta 2022-05-12   89  {
b7134422146692 Sumit Gupta 2022-05-12   90  	static struct dentry *root;
b7134422146692 Sumit Gupta 2022-05-12   91  
b7134422146692 Sumit Gupta 2022-05-12   92  	if (!root) {
b7134422146692 Sumit Gupta 2022-05-12   93  		root = debugfs_create_file("tegra_cbb_err", 0444, NULL, cbb, &tegra_cbb_err_fops);
b7134422146692 Sumit Gupta 2022-05-12   94  		if (IS_ERR_OR_NULL(root)) {
b7134422146692 Sumit Gupta 2022-05-12   95  			pr_err("%s(): could not create debugfs node\n", __func__);
b7134422146692 Sumit Gupta 2022-05-12  @96  			return PTR_ERR(root);
b7134422146692 Sumit Gupta 2022-05-12   97  		}
b7134422146692 Sumit Gupta 2022-05-12   98  	}
b7134422146692 Sumit Gupta 2022-05-12   99  
b7134422146692 Sumit Gupta 2022-05-12  100  	return 0;
b7134422146692 Sumit Gupta 2022-05-12  101  }
b7134422146692 Sumit Gupta 2022-05-12  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
