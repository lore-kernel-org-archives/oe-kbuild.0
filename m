Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C918C024
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728476335; cv=none; b=u+A/axajzif0AKPPtP+dbcxquMaTrM2xkSJaR3ej7fU+i/ZdfErZZpFB84EZGyiWaV7syZmJAatMm2Hrj4PlHC6km4k0uqe14KigAPNeF2nIwRRaz/De0YM2Asx07j/zeLVHIZeEB6bw0YGC0IXJvJrSFPw752j2jha5x1TgKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728476335; c=relaxed/simple;
	bh=yRRud4XFR8SUtyKqHD4aOd6ojBWkRMVGG5arWI8PZU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbMjSrkkS9RPnbaq48xTEkQGv5wfqVgDYq5pwE8FYRMGgBC/+1oSfvWKfh0l8MuxnQzjm/rdlhwSUfo78Av72TtCg2V0SerR/uwmo/ForhFdEtSaCnfYECz76GovGGWxmP/c5Zw4iH8IajcH4V8vCZm+sepxMcBhX4/lrGXGsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXqQ71vm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXqQ71vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728476333; x=1760012333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRRud4XFR8SUtyKqHD4aOd6ojBWkRMVGG5arWI8PZU4=;
  b=TXqQ71vmN3Vl/dcmPrfRRY6zJMdEsa4g+xIbD71Z5rMG3DMXXpX3GT0G
   sw9Y73ELMpZfSsiQxeHMA78/34qltp61i1Ppkz7LBHwieQLY4DhS75NFY
   2M7kYaIFndCwjLzUp/jd5v+15SMDqBt2TYqzAh9tjjA7suEN3fk1LZq8+
   2Hxe+Uef/raZWs/06SeC3GgfHOlcAKlPxZHI8HZvOnpK66Gu9GN/0zHNL
   E7yuaI0lCnp4/aHrNQD6lKfgah4Y/XI4nBJKG/bbHZ/lKLTooAiLjMWM5
   U6dfTy29YJeQS1rcburlkfPbmnOMAUuXgMLjiRT8h0CUYPyiUl1Bk4xqO
   w==;
X-CSE-ConnectionGUID: Ml8PgQ9BR9a4BCmFflcayw==
X-CSE-MsgGUID: EUYRdUCaQ5aaPwZ0uMIG/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27219041"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27219041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 05:18:53 -0700
X-CSE-ConnectionGUID: 3rqXpMOEShagSktXJ649pg==
X-CSE-MsgGUID: 2URiw703Rhy0QR+iXkRIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76681265"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2024 05:18:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syVeS-0009Bw-2q;
	Wed, 09 Oct 2024 12:18:48 +0000
Date: Wed, 9 Oct 2024 20:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled()
 helper
Message-ID: <202410092019.vGogfPIO-lkp@intel.com>
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
In-Reply-To: <20241007035616.2701-3-linux.amoon@gmail.com>
References: <20241007035616.2701-3-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: linux-phy@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f602276d3902642fdc3429b548d73c745446601]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/phy-rockchip-pcie-Simplify-error-handling-with-dev_err_probe/20241007-115910
base:   8f602276d3902642fdc3429b548d73c745446601
patch link:    https://lore.kernel.org/r/20241007035616.2701-3-linux.amoon%40gmail.com
patch subject: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092019.vGogfPIO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410092019.vGogfPIO-lkp@intel.com/

smatch warnings:
drivers/phy/rockchip/phy-rockchip-pcie.c:278 rockchip_pcie_phy_init() warn: missing error code 'err'

vim +/err +278 drivers/phy/rockchip/phy-rockchip-pcie.c

fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  268  
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  269  static int rockchip_pcie_phy_init(struct phy *phy)
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  270  {
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  271  	struct phy_pcie_instance *inst = phy_get_drvdata(phy);
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  272  	struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  273  	int err = 0;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  274  
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  275  	mutex_lock(&rk_phy->pcie_mutex);
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  276  
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  277  	if (rk_phy->init_cnt++)
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19 @278  		goto err_out;
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  279  
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  280  	err = reset_control_assert(rk_phy->phy_rst);
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  281  	if (err) {
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  282  		dev_err(&phy->dev, "assert phy_rst err %d\n", err);
3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  283  		goto err_out;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  284  	}
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  285  
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  286  	mutex_unlock(&rk_phy->pcie_mutex);
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  287  	return 0;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  288  
3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  289  err_out:
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  290  	rk_phy->init_cnt--;
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  291  	mutex_unlock(&rk_phy->pcie_mutex);
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  292  	return err;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  293  }
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
