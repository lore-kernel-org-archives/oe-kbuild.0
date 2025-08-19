Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6FC28727C
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755617344; cv=none; b=uU8QQV1lRygTH1jdC8IhzPqaaVylO8QgR0dG6FAMF3kHg51FaDiV+qLAEmi686UHsaxeUWYdfhtD7mX87TnbOdpRgiOiJ967Frzvfpb4PBJfESH16LjAAMyLiGoWZW5zRqRIpi2fshNsnUeshwS1/jpGfY3aHscCv7DsnL1E1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755617344; c=relaxed/simple;
	bh=wFV04tHmdAnVa0OMKV1BNqdbZhAkQP275DXU9IRE3yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/ME21I4UQuONth6D4HBnuzvaQnaKen+uVftzHHiTReV41mw/FoLgeXfBhTvFiIcKSe5wugMz1BIv6x3hTk+F1LX0P6lo6aRiCiWgxW4K6yJyoOtq+C9BpKmyMfBre4PzrfxV9/GwCN4F8AfT1GvTYTj+ErQ71+IRAxv0WBdvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bESXo4eX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bESXo4eX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755617342; x=1787153342;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wFV04tHmdAnVa0OMKV1BNqdbZhAkQP275DXU9IRE3yo=;
  b=bESXo4eX54AS2ln4BmKB5NZjoU+FMJNsLruUHUFcpO/WIdkJRvX0wGNH
   PsnNadn1oODcf7h4ityCrrsWADsfRVkHDdQgeyLWQ82BcndDbilVJBKp1
   83+zJBpeLcRbZexLt690byBpkLEj1Sa1+Is5d4OHek6wHCkScczdj8KNv
   UEFWDdgXf+uNMQEtEjxg1q0MCI2wbgBwrFT8GX0KogfSebHfcxkjWNzFy
   pd+M404ouKpqolKEZl5BFLjXTowuXWEGNfwyX5h2k/+B+hEIFk1YYpeFw
   dL0tZRuQpklkrsp2QplAdRI96LCK+xftEguGsga1Nhds8o7kEdcxT28FH
   g==;
X-CSE-ConnectionGUID: MdL34YCMQba1Ah2CSxNIQA==
X-CSE-MsgGUID: ffvOpqoeS4il6hpV5BvAlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80459515"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="80459515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 08:29:00 -0700
X-CSE-ConnectionGUID: QuqKpbt6SJ6nw2zQvwXdkA==
X-CSE-MsgGUID: pl8VPoamQ96M5qELTT5vJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172110465"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2025 08:28:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoOGe-000H41-2c;
	Tue, 19 Aug 2025 15:28:56 +0000
Date: Tue, 19 Aug 2025 23:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [patch v4 1/4] usb: typec: Stub out typec_switch APIs when
 CONFIG_TYPEC=n
Message-ID: <202508192317.EnW0aIK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250815094733.2353916-1-xu.yang_2@nxp.com>
References: <20250815094733.2353916-1-xu.yang_2@nxp.com>
TO: Xu Yang <xu.yang_2@nxp.com>
TO: krzk@kernel.org
TO: myungjoo.ham@samsung.com
TO: cw00.choi@samsung.com
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: gregkh@linuxfoundation.org
CC: swboyd@chromium.org
CC: heikki.krogerus@linux.intel.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: jun.li@nxp.com

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chanwoo-extcon/extcon-next]
[also build test WARNING on krzk-dt/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.17-rc2 next-20250819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/dt-bindings-extcon-ptn5150-Allow-connector-node-to-present/20250815-175311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
patch link:    https://lore.kernel.org/r/20250815094733.2353916-1-xu.yang_2%40nxp.com
patch subject: [patch v4 1/4] usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192317.EnW0aIK5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508192317.EnW0aIK5-lkp@intel.com/

smatch warnings:
drivers/phy/samsung/phy-exynos5-usbdrd.c:1794 exynos5_usbdrd_orien_sw_set() error: 'phy_drd' dereferencing possible ERR_PTR()

vim +/phy_drd +1794 drivers/phy/samsung/phy-exynos5-usbdrd.c

cc52a697f87e8b Ivaylo Ivanov 2025-05-04  1787  
09dc674295a388 André Draszik 2024-12-06  1788  static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
09dc674295a388 André Draszik 2024-12-06  1789  				       enum typec_orientation orientation)
09dc674295a388 André Draszik 2024-12-06  1790  {
09dc674295a388 André Draszik 2024-12-06  1791  	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
f4fb9c4d7f94da André Draszik 2024-12-06  1792  	int ret;
f4fb9c4d7f94da André Draszik 2024-12-06  1793  
f4fb9c4d7f94da André Draszik 2024-12-06 @1794  	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
f4fb9c4d7f94da André Draszik 2024-12-06  1795  	if (ret) {
f4fb9c4d7f94da André Draszik 2024-12-06  1796  		dev_err(phy_drd->dev, "Failed to enable PHY clocks(s)\n");
f4fb9c4d7f94da André Draszik 2024-12-06  1797  		return ret;
f4fb9c4d7f94da André Draszik 2024-12-06  1798  	}
f4fb9c4d7f94da André Draszik 2024-12-06  1799  
f4fb9c4d7f94da André Draszik 2024-12-06  1800  	scoped_guard(mutex, &phy_drd->phy_mutex) {
f4fb9c4d7f94da André Draszik 2024-12-06  1801  		void __iomem * const regs_base = phy_drd->reg_phy;
f4fb9c4d7f94da André Draszik 2024-12-06  1802  		unsigned int reg;
f4fb9c4d7f94da André Draszik 2024-12-06  1803  
f4fb9c4d7f94da André Draszik 2024-12-06  1804  		if (orientation == TYPEC_ORIENTATION_NONE) {
f4fb9c4d7f94da André Draszik 2024-12-06  1805  			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da André Draszik 2024-12-06  1806  			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
f4fb9c4d7f94da André Draszik 2024-12-06  1807  			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da André Draszik 2024-12-06  1808  
f4fb9c4d7f94da André Draszik 2024-12-06  1809  			reg = readl(regs_base + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da André Draszik 2024-12-06  1810  			reg |= HSP_VBUSVLDEXTSEL;
f4fb9c4d7f94da André Draszik 2024-12-06  1811  			reg &= ~HSP_VBUSVLDEXT;
f4fb9c4d7f94da André Draszik 2024-12-06  1812  			writel(reg, regs_base + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da André Draszik 2024-12-06  1813  		} else {
f4fb9c4d7f94da André Draszik 2024-12-06  1814  			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da André Draszik 2024-12-06  1815  			reg |= UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID;
f4fb9c4d7f94da André Draszik 2024-12-06  1816  			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da André Draszik 2024-12-06  1817  
f4fb9c4d7f94da André Draszik 2024-12-06  1818  			reg = readl(regs_base + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da André Draszik 2024-12-06  1819  			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
f4fb9c4d7f94da André Draszik 2024-12-06  1820  			writel(reg, regs_base + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da André Draszik 2024-12-06  1821  		}
09dc674295a388 André Draszik 2024-12-06  1822  
09dc674295a388 André Draszik 2024-12-06  1823  		phy_drd->orientation = orientation;
f4fb9c4d7f94da André Draszik 2024-12-06  1824  	}
f4fb9c4d7f94da André Draszik 2024-12-06  1825  
f4fb9c4d7f94da André Draszik 2024-12-06  1826  	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
09dc674295a388 André Draszik 2024-12-06  1827  
09dc674295a388 André Draszik 2024-12-06  1828  	return 0;
09dc674295a388 André Draszik 2024-12-06  1829  }
09dc674295a388 André Draszik 2024-12-06  1830  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
