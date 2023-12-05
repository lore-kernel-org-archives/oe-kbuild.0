Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467D6FCF0
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 22:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAj/FaWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701814077; x=1733350077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQLqx+8N25swVl6gR1qBv9jLWaMxwc4M7YCZEPG24T4=;
  b=LAj/FaWXBr3JDXT8yhxJYZ+yiFvxHsTV4TWBcKN6rJYe9exsT/1V47AS
   4E5dc+ppDYn63hUzS31ErIRrs7EdYH2K02K/loQiP2Bv/fcbEt92Eg6MG
   WbDZhQGPziYICeJ1gOGKWiM34OxYMQdu8j6AR51MkvXhZHv44DExf1SZx
   4lO8n2Ojsl7LGx4K76Eswz7B1sGTKtfC2LOoX6OgcSLX7mVj7NbXJctHP
   s5tVY9MIbfLSkKYJGCN0bV2VR7WBew00MVooNlOFtc8AE+5Fe0tm8Pejt
   PnNaqxqhrF88e4Mv/cMrSVG0jcwh8tTvg5ozKOgH8Lkk1KEfKJsfWNBY4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1056080"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1056080"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 14:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861900292"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="861900292"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 14:07:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAda4-0009nK-1z;
	Tue, 05 Dec 2023 22:07:52 +0000
Date: Wed, 6 Dec 2023 06:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH] net: ethtool: do runtime PM outside RTNL
Message-ID: <202312060500.W3JRx7H4-lkp@intel.com>
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
In-Reply-To: <20231204200710.40c291e60cea.I2deb5804ef1739a2af307283d320ef7d82456494@changeid>
References: <20231204200710.40c291e60cea.I2deb5804ef1739a2af307283d320ef7d82456494@changeid>
TO: Johannes Berg <johannes@sipsolutions.net>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/net-ethtool-do-runtime-PM-outside-RTNL/20231205-030828
base:   net/main
patch link:    https://lore.kernel.org/r/20231204200710.40c291e60cea.I2deb5804ef1739a2af307283d320ef7d82456494%40changeid
patch subject: [RFC PATCH] net: ethtool: do runtime PM outside RTNL
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-103-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060500.W3JRx7H4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060500.W3JRx7H4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060500.W3JRx7H4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/ethtool/ioctl.c:3129:2-9: WARNING: NULL check before dev_{put, hold} functions is not needed.

vim +3129 net/ethtool/ioctl.c

eca4205f9ec3be net/core/ethtool.c  Pablo Neira Ayuso 2019-02-02  3061  
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3062  int dev_ethtool(struct net *net, struct ifreq *ifr, void __user *useraddr)
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3063  {
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3064  	struct ethtool_devlink_compat *state;
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3065  	struct net_device *dev = NULL;
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3066  	u32 ethcmd, subcmd;
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3067  	int rc;
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3068  
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3069  	if (copy_from_user(&ethcmd, useraddr, sizeof(ethcmd)))
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3070  		return -EFAULT;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3071  
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3072  	state = kzalloc(sizeof(*state), GFP_KERNEL);
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3073  	if (!state)
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3074  		return -ENOMEM;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3075  
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3076  	switch (ethcmd) {
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3077  	case ETHTOOL_FLASHDEV:
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3078  		if (copy_from_user(&state->efl, useraddr, sizeof(state->efl))) {
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3079  			rc = -EFAULT;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3080  			goto exit_free;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3081  		}
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3082  		state->efl.data[ETHTOOL_FLASH_MAX_FILENAME - 1] = 0;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3083  		break;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3084  	}
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3085  
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3086  	dev = dev_get_by_name(net, ifr->ifr_name);
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3087  	if (!dev) {
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3088  		rc = -ENODEV;
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3089  		goto exit_free;
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3090  	}
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3091  
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3092  	rc = __dev_ethtool_check(dev, useraddr, ethcmd, &subcmd);
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3093  	if (rc)
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3094  		goto exit_free;
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3095  
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3096  	if (dev->dev.parent)
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3097  		pm_runtime_get_sync(dev->dev.parent);
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3098  
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3099  	rtnl_lock();
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3100  	rc = __dev_ethtool_do(dev, ifr, useraddr, ethcmd, subcmd, state);
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3101  	rtnl_unlock();
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3102  
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3103  	if (dev->dev.parent)
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3104  		pm_runtime_put(dev->dev.parent);
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3105  
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3106  	if (rc)
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3107  		goto exit_free;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3108  
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3109  	switch (ethcmd) {
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3110  	case ETHTOOL_FLASHDEV:
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3111  		if (state->devlink)
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3112  			rc = devlink_compat_flash_update(state->devlink,
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3113  							 state->efl.data);
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3114  		break;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3115  	case ETHTOOL_GDRVINFO:
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3116  		if (state->devlink)
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3117  			devlink_compat_running_version(state->devlink,
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3118  						       state->info.fw_version,
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3119  						       sizeof(state->info.fw_version));
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3120  		if (copy_to_user(useraddr, &state->info, sizeof(state->info))) {
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3121  			rc = -EFAULT;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3122  			goto exit_free;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3123  		}
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3124  		break;
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3125  	}
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3126  
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3127  exit_free:
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04  3128  	if (dev)
a8bb1f8a3ed317 net/ethtool/ioctl.c Johannes Berg     2023-12-04 @3129  		dev_put(dev);
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3130  	if (state->devlink)
1af0a0948e28d8 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3131  		devlink_put(state->devlink);
095cfcfe13e5a6 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3132  	kfree(state);
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3133  	return rc;
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3134  }
f49deaa64af102 net/ethtool/ioctl.c Jakub Kicinski    2021-10-30  3135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
