Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767072;
	b=SG+s6ZrFPJ4pdvLaXMfvAAMleKJMqWuglyypzPzuI1+yFj4oAWmk8y8NCYpdz2Lqxgyx
	 eXd0lXjRu5APP2JOTKPL+OuaNl+wQa69yhrU2k5NzhPAhswfzVknD/7i503Tf/iD6bjXR
	 oMqNHugTd6+pYw7qWNw6dEXq7QYHMZ5wxNVomtH28rO9rthF/uqi+wPo1eb8znzkh2YPA
	 xsCS4LtM0koVI9aT8hPm0i3OZ8CAo/TPwvMmUb31RzQHBvjJ0HUNwpRY+eRYNj0xS4p3U
	 WKVjbQDj8ULf9++i8M3oIjyA+mQn5CK7OBlc96ot+SD6DUH5tAVKp3w0e9cJtAKLMkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767072;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tvlptPm08oTQelMuZwjOJyYD6Vw2f/o4M3q3qR8h7Iw=;
	b=Rn1u0nIBMoTOVcdLd7Rv4JkXBo3SD60VQ1aXWxTH2Egor3GhfkrIWn6QR4nmUCFKsH3b
	 hpvGkcicjiRu7ldEAvjje/7/KYH+0YHTJC5TWPk29rtQ6qjhYaxp/Qmy94YJtlIoqEpvW
	 WCVWTR2di640BY6kv+md/YDFWr2O5m4Xqc3oHmWe8DkvgzGuOgQZQLqOcmVXxWdbf1Luy
	 B0aqNXBqgIrDlfMsU6GClZ/vMv3yZOiA8Ro7W50LueLHw0wexCh16Qzj5nE0NrI3eDoN9
	 YjxKr1EWNutLnmEBuw7hU+IFW5LNjHUE3RxcK1QGvPyDo4GDxXGO8WoX5GC53ac40GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7A3uGQs;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C0606A31E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7A3uGQs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794767071; x=1826303071;
  h=date:from:to:cc:subject:message-id;
  bh=vZVcaVdA2E4vMCkd0XthwTsu4DfODVvoiYhTBdvtpK0=;
  b=T7A3uGQserP+a9D3VsBkIvQ9jwROw0Ag0dN/H0DQPip6QMCg2QoBvrgt
   e8i3MqcUI7RgbbVqk+2pvsv5IWsTZV5GakrDBc1BGMJxnA7LhzgubOyAH
   21iyeXNFI5//hzSxjH8wCkjhy96P8mZAN2LoaySVni0OFYIYCBis213nl
   CVcfshhCQFY2DWRWkSG9wwtYeYHNdX49LImR9wxdj5CpWZhXnDqqG56vP
   qmx0QEFhHWwPC7CxVFoRHridzLekbImP2x6DG25F0n9fl16NBBgAxVczW
   qAp0Bv7lBnhf1ok8D1/1XiQGNVQRVDJR8+mVjro/b0MAweTt+DMEoKlRU
   Q==;
X-CSE-ConnectionGUID: Mc6swJ9qRBOs2Ymyhk8dzw==
X-CSE-MsgGUID: GeB/mZ3ZSFeQEhEEnT+ddA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3382660"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3382660"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 10:24:30 -0800
X-CSE-ConnectionGUID: xh82eERHQmqjycp/yf6FbA==
X-CSE-MsgGUID: 8yOTncQuQ86l1Q9K306hpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9620172"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 10:24:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSetu-000000002LX-291z;
	Sun, 15 Nov 2026 18:24:26 +0000
Date: Sun, 15 Nov 2026 19:23:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:913:16-27:
 opportunity for str_plural(link -> lanes)
Message-ID: <202611151910.9YFoxSpv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

Hi Chaoyi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 0244539f9a4f3b564604dfe4d639f61cecec381a drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-r2100-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151910.9YFoxSpv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0244539f9a4f ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611151910.9YFoxSpv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/synopsys/dw-dp.c:913:16-27: opportunity for str_plural(link -> lanes)
   drivers/gpu/drm/bridge/synopsys/dw-dp.c:972:16-27: opportunity for str_plural(link -> lanes)

vim +913 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e06 Andy Yan 2025-08-22  903  
86eecc3a9c2e06 Andy Yan 2025-08-22  904  static int dw_dp_link_train_full(struct dw_dp *dp)
86eecc3a9c2e06 Andy Yan 2025-08-22  905  {
86eecc3a9c2e06 Andy Yan 2025-08-22  906  	struct dw_dp_link *link = &dp->link;
86eecc3a9c2e06 Andy Yan 2025-08-22  907  	int ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  908  
86eecc3a9c2e06 Andy Yan 2025-08-22  909  retry:
86eecc3a9c2e06 Andy Yan 2025-08-22  910  	dw_dp_link_train_init(&link->train);
86eecc3a9c2e06 Andy Yan 2025-08-22  911  
86eecc3a9c2e06 Andy Yan 2025-08-22  912  	dev_dbg(dp->dev, "full-training link: %u lane%s at %u MHz\n",
86eecc3a9c2e06 Andy Yan 2025-08-22 @913  		link->lanes, (link->lanes > 1) ? "s" : "", link->rate / 100);
86eecc3a9c2e06 Andy Yan 2025-08-22  914  
86eecc3a9c2e06 Andy Yan 2025-08-22  915  	ret = dw_dp_link_configure(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  916  	if (ret < 0) {
86eecc3a9c2e06 Andy Yan 2025-08-22  917  		dev_err(dp->dev, "failed to configure DP link: %d\n", ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  918  		return ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  919  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  920  
86eecc3a9c2e06 Andy Yan 2025-08-22  921  	ret = dw_dp_link_clock_recovery(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  922  	if (ret < 0) {
86eecc3a9c2e06 Andy Yan 2025-08-22  923  		dev_err(dp->dev, "clock recovery failed: %d\n", ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  924  		goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  925  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  926  
86eecc3a9c2e06 Andy Yan 2025-08-22  927  	if (!link->train.clock_recovered) {
86eecc3a9c2e06 Andy Yan 2025-08-22  928  		dev_err(dp->dev, "clock recovery failed, downgrading link\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  929  
86eecc3a9c2e06 Andy Yan 2025-08-22  930  		ret = dw_dp_link_downgrade(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  931  		if (ret < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22  932  			goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  933  		else
86eecc3a9c2e06 Andy Yan 2025-08-22  934  			goto retry;
86eecc3a9c2e06 Andy Yan 2025-08-22  935  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  936  
86eecc3a9c2e06 Andy Yan 2025-08-22  937  	dev_dbg(dp->dev, "clock recovery succeeded\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  938  
86eecc3a9c2e06 Andy Yan 2025-08-22  939  	ret = dw_dp_link_channel_equalization(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  940  	if (ret < 0) {
86eecc3a9c2e06 Andy Yan 2025-08-22  941  		dev_err(dp->dev, "channel equalization failed: %d\n", ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  942  		goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  943  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  944  
86eecc3a9c2e06 Andy Yan 2025-08-22  945  	if (!link->train.channel_equalized) {
86eecc3a9c2e06 Andy Yan 2025-08-22  946  		dev_err(dp->dev, "channel equalization failed, downgrading link\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  947  
86eecc3a9c2e06 Andy Yan 2025-08-22  948  		ret = dw_dp_link_downgrade(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  949  		if (ret < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22  950  			goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  951  		else
86eecc3a9c2e06 Andy Yan 2025-08-22  952  			goto retry;
86eecc3a9c2e06 Andy Yan 2025-08-22  953  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  954  
86eecc3a9c2e06 Andy Yan 2025-08-22  955  	dev_dbg(dp->dev, "channel equalization succeeded\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  956  
86eecc3a9c2e06 Andy Yan 2025-08-22  957  out:
86eecc3a9c2e06 Andy Yan 2025-08-22  958  	dw_dp_link_train_set_pattern(dp, DP_TRAINING_PATTERN_DISABLE);
86eecc3a9c2e06 Andy Yan 2025-08-22  959  	return ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  960  }
86eecc3a9c2e06 Andy Yan 2025-08-22  961  

:::::: The code at line 913 was first introduced by commit
:::::: 86eecc3a9c2e06462f6a273fcd24150b6da787de drm/bridge: synopsys: Add DW DPTX Controller support library

:::::: TO: Andy Yan <andy.yan@rock-chips.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
