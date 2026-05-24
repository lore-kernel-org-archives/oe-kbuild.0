Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50633D515
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779611226; cv=none; b=P4MsyxzynxYGiaSWlTcJoEQ+ODRaU9fcBEfzuzlXJsy0A+qUyR7EL3JN53YhJBI5ycFEy9UGGomR43KGFPNWb7SicdCX7q1x1DcFj9tIMJU/Kzz8Sfmx8bMVEzCEpzRQfiqLtyN7TjerU+olPxQtphwHjS/iJv9r1/9JSPg+cNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779611226; c=relaxed/simple;
	bh=mwBTEPXeo+JwfrdNbx4rtRZTl7IzL2g93cUyVXqQeIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHE98MhHbTZ2cZKWL/U0aL0g7QJVhliz46icgymzLx/DlPljoTecUR0yiZ9KR3jXTNvV096HG66VNvDGQ1QQ+7E90av/QdjYmtItqVpqhp7qw4WpNARH3MJAuytMG588lnbe2WwH5hKDaf3q6Wbs4lGjJ1pKALl5w/IZLIYlBdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pgl2nJaL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pgl2nJaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779611224; x=1811147224;
  h=date:from:to:cc:subject:message-id;
  bh=mwBTEPXeo+JwfrdNbx4rtRZTl7IzL2g93cUyVXqQeIA=;
  b=Pgl2nJaLEBhdo1yMUEckRalpQxLz0XufcvAwkAK6NPRZDCIte42Gc0ha
   9wX/XR3OPTghn+vaXiwL+BU3jT5xwelz/WIqEnMPkPJglkpzvZq/9ApJZ
   iYBRO+jycaOLqdL5pAmE0vRUdSjIHv1kRfFciBZ6AwSI/tQE2q7Py6Knz
   Vb/276Lb9N/C52FtDjGcOFxRYe6pSoL992DC78PA48l7vlkLE98uGJOR0
   6YHctp8N2MeXj0MUN1UcGzpa7FkF6FUkOxKLIiQiomy4fumXuGxbBq8Wd
   vh38ptkYFpkgHA2IcC7DWUf+XNmkisYaKxXiNvQB9493ye8aMLrfK8j6X
   g==;
X-CSE-ConnectionGUID: y2BKCgygT2a15oXZW1wU+Q==
X-CSE-MsgGUID: +1LqmFDqRA6VnMjoQ9V49g==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91859873"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91859873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 01:27:03 -0700
X-CSE-ConnectionGUID: 8IgxjQavSrWKK5I8yV6mSA==
X-CSE-MsgGUID: WBBQrKoNSta13rV0x3+Cgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238750124"
Received: from lkp-server01.sh.intel.com (HELO faed47fea055) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 01:27:02 -0700
Received: from kbuild by faed47fea055 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR4Al-0000000003L-3agn;
	Sun, 24 May 2026 08:26:59 +0000
Date: Sun, 24 May 2026 16:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ethtool/mse.c:285 mse_fill_reply() warn: missing unwind
 goto?
Message-ID: <202605241642.RFiYcaVG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cbfe4502e3d4bda48eb4b83dfad8d7da3b22e90
commit: e6e93fb01302e9b7a15d17f3b8a00eff8a601654 ethtool: netlink: add ETHTOOL_MSG_MSE_GET and wire up PHY MSE access
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20260523 (https://download.01.org/0day-ci/archive/20260524/202605241642.RFiYcaVG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6e93fb01302 ("ethtool: netlink: add ETHTOOL_MSG_MSE_GET and wire up PHY MSE access")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605241642.RFiYcaVG-lkp@intel.com/

smatch warnings:
net/ethtool/mse.c:285 mse_fill_reply() warn: missing unwind goto?

vim +285 net/ethtool/mse.c

e6e93fb01302e9 Oleksij Rempel 2025-10-27  233  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  234  static int mse_fill_reply(struct sk_buff *skb,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  235  			  const struct ethnl_req_info *req_base,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  236  			  const struct ethnl_reply_data *reply_base)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  237  {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  238  	const struct mse_reply_data *data = mse_repdata(reply_base);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  239  	struct nlattr *nest;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  240  	unsigned int i;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  241  	int ret;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  242  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  243  	nest = nla_nest_start(skb, ETHTOOL_A_MSE_CAPABILITIES);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  244  	if (!nest)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  245  		return -EMSGSIZE;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  246  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  247  	if (data->capability.supported_caps & PHY_MSE_CAP_AVG) {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  248  		ret = nla_put_uint(skb,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  249  				   ETHTOOL_A_MSE_CAPABILITIES_MAX_AVERAGE_MSE,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  250  				   data->capability.max_average_mse);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  251  		if (ret < 0)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  252  			goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  253  	}
e6e93fb01302e9 Oleksij Rempel 2025-10-27  254  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  255  	if (data->capability.supported_caps & (PHY_MSE_CAP_PEAK |
e6e93fb01302e9 Oleksij Rempel 2025-10-27  256  					       PHY_MSE_CAP_WORST_PEAK)) {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  257  		ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_MAX_PEAK_MSE,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  258  				   data->capability.max_peak_mse);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  259  		if (ret < 0)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  260  			goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  261  	}
e6e93fb01302e9 Oleksij Rempel 2025-10-27  262  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  263  	ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_REFRESH_RATE_PS,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  264  			   data->capability.refresh_rate_ps);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  265  	if (ret < 0)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  266  		goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  267  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  268  	ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_NUM_SYMBOLS,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  269  			   data->capability.num_symbols);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  270  	if (ret < 0)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  271  		goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  272  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  273  	nla_nest_end(skb, nest);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  274  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  275  	for (i = 0; i < data->num_snapshots; i++) {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  276  		const struct mse_snapshot_entry *s = &data->snapshots[i];
e6e93fb01302e9 Oleksij Rempel 2025-10-27  277  		int chan_attr;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  278  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  279  		chan_attr = mse_channel_to_attr(s->channel);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  280  		if (chan_attr < 0)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  281  			return chan_attr;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  282  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  283  		nest = nla_nest_start(skb, chan_attr);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  284  		if (!nest)
e6e93fb01302e9 Oleksij Rempel 2025-10-27 @285  			return -EMSGSIZE;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  286  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  287  		if (data->capability.supported_caps & PHY_MSE_CAP_AVG) {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  288  			ret = nla_put_uint(skb,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  289  					   ETHTOOL_A_MSE_SNAPSHOT_AVERAGE_MSE,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  290  					   s->snapshot.average_mse);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  291  			if (ret)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  292  				goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  293  		}
e6e93fb01302e9 Oleksij Rempel 2025-10-27  294  		if (data->capability.supported_caps & PHY_MSE_CAP_PEAK) {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  295  			ret = nla_put_uint(skb, ETHTOOL_A_MSE_SNAPSHOT_PEAK_MSE,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  296  					   s->snapshot.peak_mse);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  297  			if (ret)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  298  				goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  299  		}
e6e93fb01302e9 Oleksij Rempel 2025-10-27  300  		if (data->capability.supported_caps & PHY_MSE_CAP_WORST_PEAK) {
e6e93fb01302e9 Oleksij Rempel 2025-10-27  301  			ret = nla_put_uint(skb,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  302  					   ETHTOOL_A_MSE_SNAPSHOT_WORST_PEAK_MSE,
e6e93fb01302e9 Oleksij Rempel 2025-10-27  303  					   s->snapshot.worst_peak_mse);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  304  			if (ret)
e6e93fb01302e9 Oleksij Rempel 2025-10-27  305  				goto nla_put_nest_failure;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  306  		}
e6e93fb01302e9 Oleksij Rempel 2025-10-27  307  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  308  		nla_nest_end(skb, nest);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  309  	}
e6e93fb01302e9 Oleksij Rempel 2025-10-27  310  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  311  	return 0;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  312  
e6e93fb01302e9 Oleksij Rempel 2025-10-27  313  nla_put_nest_failure:
e6e93fb01302e9 Oleksij Rempel 2025-10-27  314  	nla_nest_cancel(skb, nest);
e6e93fb01302e9 Oleksij Rempel 2025-10-27  315  	return ret;
e6e93fb01302e9 Oleksij Rempel 2025-10-27  316  }
e6e93fb01302e9 Oleksij Rempel 2025-10-27  317  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
