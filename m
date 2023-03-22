Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D782566
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679484516; x=1711020516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7p7PV0YshYbccETWtZFqtpHjGQnjdVs8I1RkCwj0J04=;
  b=nq7pLYnboPMxUNA/umbty0GD3FUJVTdpu5NUs/ZCfa8e/rDw+/wAmB9c
   z0BFfU6oZMBXypDIzP8WvZQ861xZHFnHbp/dXaRtkGHPmT5azhuVj0i63
   Y+oV7nhiAKO04p0rwVN+J6Oc6N6xJ9UN3WubHEsodCZ7CCmzSrTGxG/bu
   QwAYJU0+L/JladwbJjl80dE+n3xcjuKDVW9dRfDmM4XCs0nxNSAy4zus/
   fxg04uK+M1MLdRrll+DoXKtg584DNXjm6h4kBk788UPUlVc0v9dZo2AX1
   bXVdnlJPfmn/VSo8YC8HIm8oDmmB71Tb0m6lJvsyORr8SKea5GaHXd7o5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319580015"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="319580015"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 04:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792515012"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="792515012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2023 04:28:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pewdu-000DEM-1G;
	Wed, 22 Mar 2023 11:28:34 +0000
Date: Wed, 22 Mar 2023 19:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: enhance rproc_put() for clusters
Message-ID: <202303221916.LgKkr8Gk-lkp@intel.com>
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
In-Reply-To: <20230322040933.924813-3-tanmay.shah@amd.com>
References: <20230322040933.924813-3-tanmay.shah@amd.com>
TO: Tanmay Shah <tanmay.shah@amd.com>
TO: andersson@kernel.org
TO: mathieu.poirier@linaro.org
CC: linux-remoteproc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tanmay Shah <tanmay.shah@amd.com>
CC: Tarak Reddy <tarak.reddy@amd.com>

Hi Tanmay,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e19967994d342a5986d950a1bfddf19d7e1191b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Tanmay-Shah/remoteproc-Make-rproc_get_by_phandle-work-for-clusters/20230322-121102
base:   e19967994d342a5986d950a1bfddf19d7e1191b7
patch link:    https://lore.kernel.org/r/20230322040933.924813-3-tanmay.shah%40amd.com
patch subject: [PATCH v2 2/2] remoteproc: enhance rproc_put() for clusters
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc-randconfig-m041-20230322 (https://download.01.org/0day-ci/archive/20230322/202303221916.LgKkr8Gk-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303221916.LgKkr8Gk-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_core.c:2565 rproc_put() warn: variable dereferenced before check 'rproc->dev.parent' (see line 2562)
drivers/remoteproc/remoteproc_core.c:2566 rproc_put() warn: variable dereferenced before check 'rproc->dev.parent->driver' (see line 2562)

vim +2565 drivers/remoteproc/remoteproc_core.c

433c0e04bc06da Bjorn Andersson 2016-10-02  2550  
433c0e04bc06da Bjorn Andersson 2016-10-02  2551  /**
433c0e04bc06da Bjorn Andersson 2016-10-02  2552   * rproc_put() - release rproc reference
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2553   * @rproc: the remote processor handle
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2554   *
c6b5a27628faf6 Ohad Ben-Cohen  2012-07-02  2555   * This function decrements the rproc dev refcount.
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2556   *
c6b5a27628faf6 Ohad Ben-Cohen  2012-07-02  2557   * If no one holds any reference to rproc anymore, then its refcount would
c6b5a27628faf6 Ohad Ben-Cohen  2012-07-02  2558   * now drop to zero, and it would be freed.
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2559   */
160e7c840fe858 Ohad Ben-Cohen  2012-07-04  2560  void rproc_put(struct rproc *rproc)
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2561  {
fbb6aacb078285 Bjorn Andersson 2016-10-02 @2562  	module_put(rproc->dev.parent->driver->owner);
573d22d13a6970 Tanmay Shah     2023-03-21  2563  	struct platform_device *cluster_pdev;
573d22d13a6970 Tanmay Shah     2023-03-21  2564  
573d22d13a6970 Tanmay Shah     2023-03-21 @2565  	if (rproc->dev.parent) {
573d22d13a6970 Tanmay Shah     2023-03-21 @2566  		if (rproc->dev.parent->driver) {
573d22d13a6970 Tanmay Shah     2023-03-21  2567  			module_put(rproc->dev.parent->driver->owner);
573d22d13a6970 Tanmay Shah     2023-03-21  2568  		} else {
573d22d13a6970 Tanmay Shah     2023-03-21  2569  			cluster_pdev = of_find_device_by_node(rproc->dev.parent->of_node->parent);
573d22d13a6970 Tanmay Shah     2023-03-21  2570  			if (cluster_pdev) {
573d22d13a6970 Tanmay Shah     2023-03-21  2571  				module_put(cluster_pdev->dev.driver->owner);
573d22d13a6970 Tanmay Shah     2023-03-21  2572  				put_device(&cluster_pdev->dev);
573d22d13a6970 Tanmay Shah     2023-03-21  2573  			}
573d22d13a6970 Tanmay Shah     2023-03-21  2574  		}
573d22d13a6970 Tanmay Shah     2023-03-21  2575  	}
b5ab5e24e960b9 Ohad Ben-Cohen  2012-05-30  2576  	put_device(&rproc->dev);
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2577  }
160e7c840fe858 Ohad Ben-Cohen  2012-07-04  2578  EXPORT_SYMBOL(rproc_put);
400e64df6b237e Ohad Ben-Cohen  2011-10-20  2579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
