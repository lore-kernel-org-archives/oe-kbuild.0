Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FF6D18
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688487244; x=1720023244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZjAw7BVsmP1FqR0IyD+j9qSVCuJju2LeW0jVgrKfh0=;
  b=SzIw+HZTGDlfesObId5I1ztZIeWiSlVuFd6RU7TF/ffqiLmfJEsYwI1V
   GnJelDnRM9BnYqOSvdFmSqJAPXOwFry3AqIoW8qPkWrZOPl0UfMVki60z
   9ODX/BtzOXaH1EpahEONdnxBZY3YUaAoqhJjanBq99dxuauUwPP5Z/j1b
   sIwYLSeAZ2MUsMpCATx1qycwqQjKp4E6pEiKU3WIpXVTmkFkWbVS+N2OC
   dJM9jKcDwdUZze7y2R0wP5SHjurncowjrxmO/I2tD6UH/S2jwShILdPly
   2iqXmWzVee3j3hqJNSlifAizTpcSGf/b9mvfkytJ40BPgUHcaeWE/C3lB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360631610"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360631610"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="832212769"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="832212769"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2023 09:13:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGif9-000IMR-04;
	Tue, 04 Jul 2023 16:13:59 +0000
Date: Wed, 5 Jul 2023 00:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1753 a5xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 1746)
Message-ID: <202307050058.eO1U4Rux-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5641a5d8b8b14643bfe3d017d64da90a5c55479
commit: 736a9327365644b460e4498b1ce172ca411efcbc drm/msm/a5xx: really check for A510 in a5xx_gpu_init
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-m041-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050058.eO1U4Rux-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050058.eO1U4Rux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307050058.eO1U4Rux-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1753 a5xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 1746)

vim +/pdev +1753 drivers/gpu/drm/msm/adreno/a5xx_gpu.c

f56d9df656c41b Jordan Crouse    2017-11-21  1741  
b5f103ab98c77c Jordan Crouse    2016-11-28  1742  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
b5f103ab98c77c Jordan Crouse    2016-11-28  1743  {
b5f103ab98c77c Jordan Crouse    2016-11-28  1744  	struct msm_drm_private *priv = dev->dev_private;
b5f103ab98c77c Jordan Crouse    2016-11-28  1745  	struct platform_device *pdev = priv->gpu_pdev;
736a9327365644 Dmitry Baryshkov 2023-04-09 @1746  	struct adreno_platform_config *config = pdev->dev.platform_data;
b5f103ab98c77c Jordan Crouse    2016-11-28  1747  	struct a5xx_gpu *a5xx_gpu = NULL;
b5f103ab98c77c Jordan Crouse    2016-11-28  1748  	struct adreno_gpu *adreno_gpu;
b5f103ab98c77c Jordan Crouse    2016-11-28  1749  	struct msm_gpu *gpu;
010c8bbad2cb8c Adam Skladowski  2023-03-14  1750  	unsigned int nr_rings;
b5f103ab98c77c Jordan Crouse    2016-11-28  1751  	int ret;
b5f103ab98c77c Jordan Crouse    2016-11-28  1752  
b5f103ab98c77c Jordan Crouse    2016-11-28 @1753  	if (!pdev) {

:::::: The code at line 1753 was first introduced by commit
:::::: b5f103ab98c77ca5998b39533c2b46959fbd37d9 drm/msm: gpu: Add A5XX target support

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
