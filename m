Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9B30FC3D
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723521; cv=none; b=Jn1m5jt3NxHBIdA0j5kP0/mtFrLQRfpbR7D6iH3CSJDLp2rkKir39oGHRf29ijB+0hZ/WdcHlfiVA2jZxgHF0U9+kKBz5QVenTQb01wLAHh5Jl94O6D/v6dZw1iw6P7a3z6QmIReADnNwiAXhSFwxT6S1Gt00wRSGMkOPC/EhpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723521; c=relaxed/simple;
	bh=V5zDopKMT6KQ2vyXe8EYhc7tIROgbWsBd34bkCXZ0zE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KU6//zYsLdXyQvMtwW+2Nmn6TgI7cgS6mTZ2ug/BexqQZu8Z5cqZeCp5OUjv/fL4Aoi7uzBNRWHg/KML/hW6h71Xn4IPh4XxWuAOEGuiYv1Sq6lh3i6QQd9Pnik6XMnxYkzH2hq0li6U8f53AYG3BDbxEMpJDo2yWO9tVgsCy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJqa4Ruf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJqa4Ruf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761723518; x=1793259518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5zDopKMT6KQ2vyXe8EYhc7tIROgbWsBd34bkCXZ0zE=;
  b=fJqa4Ruf0j6QlqO992w4abu0RFV11GY9R2QAy8Ga6HzMl3vBrJbHBQs6
   DTuhGxPuOqm+DTsFf7jJP2BK9KVLMibmasSsQCdeMeAwMjjxcV1ua/h8o
   TPe0fIqDt6Ot0/DVZ9XMLvqba5hhtcG1zvVCZBR7kKix+dUc+WRzbr9PE
   W80tWfuN1nTKMKkJPiSKUnXtiKNWJMrVMUA78Fw2s7d96JxD8kFvnV1ni
   Pd056XzsjKp32U6zm8+UDx0hoeX1kx+rSLwi6UZ3Uh9bmWUYN1IYgOAFn
   Ovs+i5cMoH0mDwliGZVd3FylQM0EhwYu/+LacE0IykjZyHBIEVMGE19mm
   w==;
X-CSE-ConnectionGUID: 9JHQ86jhTPSapnD560Clww==
X-CSE-MsgGUID: JXtJ4J45Rl+xTp8wLGHsrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63984020"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63984020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 00:38:36 -0700
X-CSE-ConnectionGUID: 3BgK2NBQRO2emFfn+YwOdQ==
X-CSE-MsgGUID: N52zekFhQMCvosA6yycuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="186040729"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2025 00:38:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE0lM-000KML-2G;
	Wed, 29 Oct 2025 07:38:32 +0000
Date: Wed, 29 Oct 2025 15:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v8 2/4] ethtool: netlink: add
 ETHTOOL_MSG_MSE_GET and wire up PHY MSE access
Message-ID: <202510291518.WK6kF50P-lkp@intel.com>
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
In-Reply-To: <20251027122801.982364-3-o.rempel@pengutronix.de>
References: <20251027122801.982364-3-o.rempel@pengutronix.de>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Jakub Kicinski <kuba@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Simon Horman <horms@kernel.org>
TO: Donald Hunter <donald.hunter@gmail.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
TO: Kory Maincent <kory.maincent@bootlin.com>
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
TO: Nishanth Menon <nm@ti.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: kernel@pengutronix.de
CC: linux-kernel@vger.kernel.org
CC: UNGLinuxDriver@microchip.com
CC: linux-doc@vger.kernel.org
CC: Michal Kubecek <mkubecek@suse.cz>
CC: Roan van Dijk <roan@protonic.nl>

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-phy-introduce-internal-API-for-PHY-MSE-diagnostics/20251027-203543
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251027122801.982364-3-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v8 2/4] ethtool: netlink: add ETHTOOL_MSG_MSE_GET and wire up PHY MSE access
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291518.WK6kF50P-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510291518.WK6kF50P-lkp@intel.com/

smatch warnings:
net/ethtool/mse.c:285 mse_fill_reply() warn: missing unwind goto?

vim +285 net/ethtool/mse.c

4b985539a8b706 Oleksij Rempel 2025-10-27  233  
4b985539a8b706 Oleksij Rempel 2025-10-27  234  static int mse_fill_reply(struct sk_buff *skb,
4b985539a8b706 Oleksij Rempel 2025-10-27  235  			  const struct ethnl_req_info *req_base,
4b985539a8b706 Oleksij Rempel 2025-10-27  236  			  const struct ethnl_reply_data *reply_base)
4b985539a8b706 Oleksij Rempel 2025-10-27  237  {
4b985539a8b706 Oleksij Rempel 2025-10-27  238  	const struct mse_reply_data *data = mse_repdata(reply_base);
4b985539a8b706 Oleksij Rempel 2025-10-27  239  	struct nlattr *nest;
4b985539a8b706 Oleksij Rempel 2025-10-27  240  	unsigned int i;
4b985539a8b706 Oleksij Rempel 2025-10-27  241  	int ret;
4b985539a8b706 Oleksij Rempel 2025-10-27  242  
4b985539a8b706 Oleksij Rempel 2025-10-27  243  	nest = nla_nest_start(skb, ETHTOOL_A_MSE_CAPABILITIES);
4b985539a8b706 Oleksij Rempel 2025-10-27  244  	if (!nest)
4b985539a8b706 Oleksij Rempel 2025-10-27  245  		return -EMSGSIZE;
4b985539a8b706 Oleksij Rempel 2025-10-27  246  
4b985539a8b706 Oleksij Rempel 2025-10-27  247  	if (data->capability.supported_caps & PHY_MSE_CAP_AVG) {
4b985539a8b706 Oleksij Rempel 2025-10-27  248  		ret = nla_put_uint(skb,
4b985539a8b706 Oleksij Rempel 2025-10-27  249  				   ETHTOOL_A_MSE_CAPABILITIES_MAX_AVERAGE_MSE,
4b985539a8b706 Oleksij Rempel 2025-10-27  250  				   data->capability.max_average_mse);
4b985539a8b706 Oleksij Rempel 2025-10-27  251  		if (ret < 0)
4b985539a8b706 Oleksij Rempel 2025-10-27  252  			goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  253  	}
4b985539a8b706 Oleksij Rempel 2025-10-27  254  
4b985539a8b706 Oleksij Rempel 2025-10-27  255  	if (data->capability.supported_caps & (PHY_MSE_CAP_PEAK |
4b985539a8b706 Oleksij Rempel 2025-10-27  256  					       PHY_MSE_CAP_WORST_PEAK)) {
4b985539a8b706 Oleksij Rempel 2025-10-27  257  		ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_MAX_PEAK_MSE,
4b985539a8b706 Oleksij Rempel 2025-10-27  258  				   data->capability.max_peak_mse);
4b985539a8b706 Oleksij Rempel 2025-10-27  259  		if (ret < 0)
4b985539a8b706 Oleksij Rempel 2025-10-27  260  			goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  261  	}
4b985539a8b706 Oleksij Rempel 2025-10-27  262  
4b985539a8b706 Oleksij Rempel 2025-10-27  263  	ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_REFRESH_RATE_PS,
4b985539a8b706 Oleksij Rempel 2025-10-27  264  			   data->capability.refresh_rate_ps);
4b985539a8b706 Oleksij Rempel 2025-10-27  265  	if (ret < 0)
4b985539a8b706 Oleksij Rempel 2025-10-27  266  		goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  267  
4b985539a8b706 Oleksij Rempel 2025-10-27  268  	ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_NUM_SYMBOLS,
4b985539a8b706 Oleksij Rempel 2025-10-27  269  			   data->capability.num_symbols);
4b985539a8b706 Oleksij Rempel 2025-10-27  270  	if (ret < 0)
4b985539a8b706 Oleksij Rempel 2025-10-27  271  		goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  272  
4b985539a8b706 Oleksij Rempel 2025-10-27  273  	nla_nest_end(skb, nest);
4b985539a8b706 Oleksij Rempel 2025-10-27  274  
4b985539a8b706 Oleksij Rempel 2025-10-27  275  	for (i = 0; i < data->num_snapshots; i++) {
4b985539a8b706 Oleksij Rempel 2025-10-27  276  		const struct mse_snapshot_entry *s = &data->snapshots[i];
4b985539a8b706 Oleksij Rempel 2025-10-27  277  		int chan_attr;
4b985539a8b706 Oleksij Rempel 2025-10-27  278  
4b985539a8b706 Oleksij Rempel 2025-10-27  279  		chan_attr = mse_channel_to_attr(s->channel);
4b985539a8b706 Oleksij Rempel 2025-10-27  280  		if (chan_attr < 0)
4b985539a8b706 Oleksij Rempel 2025-10-27  281  			return chan_attr;
4b985539a8b706 Oleksij Rempel 2025-10-27  282  
4b985539a8b706 Oleksij Rempel 2025-10-27  283  		nest = nla_nest_start(skb, chan_attr);
4b985539a8b706 Oleksij Rempel 2025-10-27  284  		if (!nest)
4b985539a8b706 Oleksij Rempel 2025-10-27 @285  			return -EMSGSIZE;
4b985539a8b706 Oleksij Rempel 2025-10-27  286  
4b985539a8b706 Oleksij Rempel 2025-10-27  287  		if (data->capability.supported_caps & PHY_MSE_CAP_AVG) {
4b985539a8b706 Oleksij Rempel 2025-10-27  288  			ret = nla_put_uint(skb,
4b985539a8b706 Oleksij Rempel 2025-10-27  289  					   ETHTOOL_A_MSE_SNAPSHOT_AVERAGE_MSE,
4b985539a8b706 Oleksij Rempel 2025-10-27  290  					   s->snapshot.average_mse);
4b985539a8b706 Oleksij Rempel 2025-10-27  291  			if (ret)
4b985539a8b706 Oleksij Rempel 2025-10-27  292  				goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  293  		}
4b985539a8b706 Oleksij Rempel 2025-10-27  294  		if (data->capability.supported_caps & PHY_MSE_CAP_PEAK) {
4b985539a8b706 Oleksij Rempel 2025-10-27  295  			ret = nla_put_uint(skb, ETHTOOL_A_MSE_SNAPSHOT_PEAK_MSE,
4b985539a8b706 Oleksij Rempel 2025-10-27  296  					   s->snapshot.peak_mse);
4b985539a8b706 Oleksij Rempel 2025-10-27  297  			if (ret)
4b985539a8b706 Oleksij Rempel 2025-10-27  298  				goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  299  		}
4b985539a8b706 Oleksij Rempel 2025-10-27  300  		if (data->capability.supported_caps & PHY_MSE_CAP_WORST_PEAK) {
4b985539a8b706 Oleksij Rempel 2025-10-27  301  			ret = nla_put_uint(skb,
4b985539a8b706 Oleksij Rempel 2025-10-27  302  					   ETHTOOL_A_MSE_SNAPSHOT_WORST_PEAK_MSE,
4b985539a8b706 Oleksij Rempel 2025-10-27  303  					   s->snapshot.worst_peak_mse);
4b985539a8b706 Oleksij Rempel 2025-10-27  304  			if (ret)
4b985539a8b706 Oleksij Rempel 2025-10-27  305  				goto nla_put_nest_failure;
4b985539a8b706 Oleksij Rempel 2025-10-27  306  		}
4b985539a8b706 Oleksij Rempel 2025-10-27  307  
4b985539a8b706 Oleksij Rempel 2025-10-27  308  		nla_nest_end(skb, nest);
4b985539a8b706 Oleksij Rempel 2025-10-27  309  	}
4b985539a8b706 Oleksij Rempel 2025-10-27  310  
4b985539a8b706 Oleksij Rempel 2025-10-27  311  	return 0;
4b985539a8b706 Oleksij Rempel 2025-10-27  312  
4b985539a8b706 Oleksij Rempel 2025-10-27  313  nla_put_nest_failure:
4b985539a8b706 Oleksij Rempel 2025-10-27  314  	nla_nest_cancel(skb, nest);
4b985539a8b706 Oleksij Rempel 2025-10-27  315  	return ret;
4b985539a8b706 Oleksij Rempel 2025-10-27  316  }
4b985539a8b706 Oleksij Rempel 2025-10-27  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
