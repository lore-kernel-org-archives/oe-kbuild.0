Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD951BD512
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719957149; cv=none; b=ZBw4alynnIEe7TpXK2D8oSAPx2GvShN+kQVt3vYB4xLXtpfWvhRnCy9EtXmBGVSXivea9D5aI8gKuX8iuytKuaAqecoZB11dVq3MYh9AgAPh0uaDzzK1b3b93hK1TqZsk0jFrTZjKeGIhYww26FZ+uh+EvaunfdfvZAEqoI7k6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719957149; c=relaxed/simple;
	bh=WQHer6GZE87lPoCu5DRDTdhq2/xRK8cmitix5PUSbnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mABmbOjyGLq6iIN77lK/Z+ZVtvjLjah3OurIqNh1ZljuF8mO89p7z9AHC60E1lt0hui0YrMWHZY2UPHtibI24EapzOUdVNNv/nCKkf+zm144Zh8bwxsq7ucmGZRB+UEl46r2GCvyB5m8axK4NQoL8sSlpw3DhyCXsXJ4L3iPJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4AR2yKN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4AR2yKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719957147; x=1751493147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQHer6GZE87lPoCu5DRDTdhq2/xRK8cmitix5PUSbnI=;
  b=f4AR2yKNLoFbnXUcZDaWZZJBiuvA7JVISf4FOOtUjH0xPuL0TRU7oAxM
   mpf6LjTUb+3zbS2VWL/YvLKsecB82C5xk4Ehc5oiUpIoekU82bSXLWOTw
   J2DzL2K2NipHE+1LvdHUiAxVFTMIl1bvs7LAwJlfikqaXixt1E3ZyrkRT
   KKWvhFkS75Aj9IPWEzo0P1/eVwI/PuWhSH/q09cv5f7+hXdulOiLJEnuy
   4y7Wpj5fdmfXuTHF7S918LF7IO9U8TQDUyPkwxcf+SP3yhmANlOYvhxRQ
   OK5CbPmvS9DKa00NoyCRDCjiZN2ftSsgzrspSm8bGWBXUrfqz8iYX/hKb
   w==;
X-CSE-ConnectionGUID: bf/5IKICQYeUpJXyZBk2mw==
X-CSE-MsgGUID: HaIINKBaR5+ZH5WoNe9Q1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17294681"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17294681"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 14:52:27 -0700
X-CSE-ConnectionGUID: kE3BS2LkRfigf4ljZRBMAA==
X-CSE-MsgGUID: m3VR2tOhRyil9pL3keGCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="50988003"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2024 14:52:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOlQE-000Oip-2w;
	Tue, 02 Jul 2024 21:52:22 +0000
Date: Wed, 3 Jul 2024 05:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v14 12/13] net: ethtool: strset: Allow querying
 phy stats by index
Message-ID: <202407030529.aOYGI0u2-lkp@intel.com>
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
In-Reply-To: <20240701131801.1227740-13-maxime.chevallier@bootlin.com>
References: <20240701131801.1227740-13-maxime.chevallier@bootlin.com>
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20240701-223116
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240701131801.1227740-13-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v14 12/13] net: ethtool: strset: Allow querying phy stats by index
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030529.aOYGI0u2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407030529.aOYGI0u2-lkp@intel.com/

smatch warnings:
net/ethtool/strset.c:295 strset_prepare_data() warn: variable dereferenced before check 'info' (see line 283)

vim +/info +295 net/ethtool/strset.c

71921690f9745fe Michal Kubecek    2019-12-27  275  
71921690f9745fe Michal Kubecek    2019-12-27  276  static int strset_prepare_data(const struct ethnl_req_info *req_base,
71921690f9745fe Michal Kubecek    2019-12-27  277  			       struct ethnl_reply_data *reply_base,
f946270d05c2604 Jakub Kicinski    2023-08-14  278  			       const struct genl_info *info)
71921690f9745fe Michal Kubecek    2019-12-27  279  {
71921690f9745fe Michal Kubecek    2019-12-27  280  	const struct strset_req_info *req_info = STRSET_REQINFO(req_base);
71921690f9745fe Michal Kubecek    2019-12-27  281  	struct strset_reply_data *data = STRSET_REPDATA(reply_base);
71921690f9745fe Michal Kubecek    2019-12-27  282  	struct net_device *dev = reply_base->dev;
a0400b1b08fea15 Maxime Chevallier 2024-07-01 @283  	struct nlattr **tb = info->attrs;
a0400b1b08fea15 Maxime Chevallier 2024-07-01  284  	struct phy_device *phydev;
71921690f9745fe Michal Kubecek    2019-12-27  285  	unsigned int i;
71921690f9745fe Michal Kubecek    2019-12-27  286  	int ret;
71921690f9745fe Michal Kubecek    2019-12-27  287  
71921690f9745fe Michal Kubecek    2019-12-27  288  	BUILD_BUG_ON(ARRAY_SIZE(info_template) != ETH_SS_COUNT);
71921690f9745fe Michal Kubecek    2019-12-27  289  	memcpy(&data->sets, &info_template, sizeof(data->sets));
71921690f9745fe Michal Kubecek    2019-12-27  290  
71921690f9745fe Michal Kubecek    2019-12-27  291  	if (!dev) {
71921690f9745fe Michal Kubecek    2019-12-27  292  		for (i = 0; i < ETH_SS_COUNT; i++) {
71921690f9745fe Michal Kubecek    2019-12-27  293  			if ((req_info->req_ids & (1U << i)) &&
71921690f9745fe Michal Kubecek    2019-12-27  294  			    data->sets[i].per_dev) {
71921690f9745fe Michal Kubecek    2019-12-27 @295  				if (info)
71921690f9745fe Michal Kubecek    2019-12-27  296  					GENL_SET_ERR_MSG(info, "requested per device strings without dev");
71921690f9745fe Michal Kubecek    2019-12-27  297  				return -EINVAL;
71921690f9745fe Michal Kubecek    2019-12-27  298  			}
71921690f9745fe Michal Kubecek    2019-12-27  299  		}
ac9c41d5a053e71 Dan Carpenter     2020-01-08  300  		return 0;
71921690f9745fe Michal Kubecek    2019-12-27  301  	}
71921690f9745fe Michal Kubecek    2019-12-27  302  
a0400b1b08fea15 Maxime Chevallier 2024-07-01  303  	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_HEADER_FLAGS],
a0400b1b08fea15 Maxime Chevallier 2024-07-01  304  				      info->extack);
a0400b1b08fea15 Maxime Chevallier 2024-07-01  305  
a0400b1b08fea15 Maxime Chevallier 2024-07-01  306  	/* phydev can be NULL, check for errors only */
a0400b1b08fea15 Maxime Chevallier 2024-07-01  307  	if (IS_ERR(phydev))
a0400b1b08fea15 Maxime Chevallier 2024-07-01  308  		return PTR_ERR(phydev);
a0400b1b08fea15 Maxime Chevallier 2024-07-01  309  
71921690f9745fe Michal Kubecek    2019-12-27  310  	ret = ethnl_ops_begin(dev);
71921690f9745fe Michal Kubecek    2019-12-27  311  	if (ret < 0)
71921690f9745fe Michal Kubecek    2019-12-27  312  		goto err_strset;
71921690f9745fe Michal Kubecek    2019-12-27  313  	for (i = 0; i < ETH_SS_COUNT; i++) {
71921690f9745fe Michal Kubecek    2019-12-27  314  		if (!strset_include(req_info, data, i) ||
71921690f9745fe Michal Kubecek    2019-12-27  315  		    !data->sets[i].per_dev)
71921690f9745fe Michal Kubecek    2019-12-27  316  			continue;
71921690f9745fe Michal Kubecek    2019-12-27  317  
a0400b1b08fea15 Maxime Chevallier 2024-07-01  318  		ret = strset_prepare_set(&data->sets[i], dev, phydev, i,
71921690f9745fe Michal Kubecek    2019-12-27  319  					 req_info->counts_only);
71921690f9745fe Michal Kubecek    2019-12-27  320  		if (ret < 0)
71921690f9745fe Michal Kubecek    2019-12-27  321  			goto err_ops;
71921690f9745fe Michal Kubecek    2019-12-27  322  	}
71921690f9745fe Michal Kubecek    2019-12-27  323  	ethnl_ops_complete(dev);
71921690f9745fe Michal Kubecek    2019-12-27  324  
71921690f9745fe Michal Kubecek    2019-12-27  325  	return 0;
71921690f9745fe Michal Kubecek    2019-12-27  326  err_ops:
71921690f9745fe Michal Kubecek    2019-12-27  327  	ethnl_ops_complete(dev);
71921690f9745fe Michal Kubecek    2019-12-27  328  err_strset:
71921690f9745fe Michal Kubecek    2019-12-27  329  	strset_cleanup_data(reply_base);
71921690f9745fe Michal Kubecek    2019-12-27  330  	return ret;
71921690f9745fe Michal Kubecek    2019-12-27  331  }
71921690f9745fe Michal Kubecek    2019-12-27  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
