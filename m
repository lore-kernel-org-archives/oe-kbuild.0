Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1730F539
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010007; cv=none; b=MRixR9AXccDfsSZ93PRGTKYumqHmIStwC3u1fTt7bhPOdI25q9BeeJoFsxRkOHFPVNIJZv/jRI0gsUapwXi6LocVLiK2kB651iDJ+yaSy2W1Q+BRnLqq6r3L9YEJnFzRwQv+/8xVLvBWPTPr0Q+J2CKn6IHNvqH+paLVyE3lSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010007; c=relaxed/simple;
	bh=mCEbxeSBfxMBukMd1CidXCC8UsKeMv9xSMWzv9JlHU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hx1PGothFIzXN0+kY2oakWbisencie9EQFpqqvvm1hoKDUuM+2rRkqcxXC5Yz9zM3MNyVZfVYZANsJ3OygyUZj/MFOZYM0H3xwmWhsomrugFUO4fBJO930etHvNTxlC8HJIHMkGfxNRPwcsyy4N2Yun4mMcLWbMaNMnQpRULoMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1WvJgvu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1WvJgvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767010006; x=1798546006;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mCEbxeSBfxMBukMd1CidXCC8UsKeMv9xSMWzv9JlHU4=;
  b=D1WvJgvuNXWGL3lypjyvr/EE1AAhIBkOTNnhx+S7LaVNMWrh/+ywbhju
   IyNqt4u9fv5kOGYOpfuRFDp2NoSVQLb4xgnV2LobbcLHxR4wvxQ9eySU0
   8LOqUrLkWuzt8JYowGdMdoCOowxyX3fzphiFNEkGK2tWUb3Q/9p5GdvnF
   PMFehmJsAkYNsZaPtJuIlmoo1NIzt61pNjeOREcgmJtBulxLLP4kng7On
   SJFGy2w8ArY1pfOEYCzW89LgEiu3k/kxTQZTeMT0zkcKt0lvvfMC+r+ib
   3yW0TkUtz0wtMRSyRQ85Y4nkwEFL9LbNyZjoIbdjWdMIeXZGkUe3CXVU4
   Q==;
X-CSE-ConnectionGUID: m5EqROqSTdSCkYGIU6quVQ==
X-CSE-MsgGUID: fX7VdQTQTjeTNfi2A/N6kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72242107"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="72242107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:06:45 -0800
X-CSE-ConnectionGUID: 62ox7IIZSwKEn1Txxl/Zqw==
X-CSE-MsgGUID: +cBjctnoTe+ppRVSoPL0KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="238322531"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2025 04:06:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaC1J-000000007Cn-0kSR;
	Mon, 29 Dec 2025 12:06:41 +0000
Date: Mon, 29 Dec 2025 20:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v10 2/2] phy: Add Google Tensor SoC USB PHY driver
Message-ID: <202512291900.LsAM5AIl-lkp@intel.com>
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
In-Reply-To: <20251227-phyb4-v10-2-e8caf6b93fe7@google.com>
References: <20251227-phyb4-v10-2-e8caf6b93fe7@google.com>
TO: Roy Luo <royluo@google.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Peter Griffin <peter.griffin@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Tudor Ambarus <tudor.ambarus@linaro.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Badhri Jagan Sridharan <badhri@google.com>
CC: Doug Anderson <dianders@google.com>
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: Joy Chakraborty <joychakr@google.com>
CC: Naveen Kumar <mnkumar@google.com>
CC: Roy Luo <royluo@google.com>

Hi Roy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f0e9c8cefa913dd9bd1d79b9a68896ea130f106]

url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Luo/dt-bindings-phy-google-Add-Google-Tensor-G5-USB-PHY/20251227-085610
base:   3f0e9c8cefa913dd9bd1d79b9a68896ea130f106
patch link:    https://lore.kernel.org/r/20251227-phyb4-v10-2-e8caf6b93fe7%40google.com
patch subject: [PATCH v10 2/2] phy: Add Google Tensor SoC USB PHY driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251229/202512291900.LsAM5AIl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512291900.LsAM5AIl-lkp@intel.com/

smatch warnings:
drivers/phy/phy-google-usb.c:86 google_usb_set_orientation() error: 'gphy' dereferencing possible ERR_PTR()

vim +/gphy +86 drivers/phy/phy-google-usb.c

b9930f0c8b336e Roy Luo 2025-12-27  78  
b9930f0c8b336e Roy Luo 2025-12-27  79  static int google_usb_set_orientation(struct typec_switch_dev *sw,
b9930f0c8b336e Roy Luo 2025-12-27  80  				      enum typec_orientation orientation)
b9930f0c8b336e Roy Luo 2025-12-27  81  {
b9930f0c8b336e Roy Luo 2025-12-27  82  	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
b9930f0c8b336e Roy Luo 2025-12-27  83  
b9930f0c8b336e Roy Luo 2025-12-27  84  	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
b9930f0c8b336e Roy Luo 2025-12-27  85  
b9930f0c8b336e Roy Luo 2025-12-27 @86  	gphy->orientation = orientation;
b9930f0c8b336e Roy Luo 2025-12-27  87  
b9930f0c8b336e Roy Luo 2025-12-27  88  	if (pm_runtime_suspended(gphy->dev))
b9930f0c8b336e Roy Luo 2025-12-27  89  		return 0;
b9930f0c8b336e Roy Luo 2025-12-27  90  
b9930f0c8b336e Roy Luo 2025-12-27  91  	guard(mutex)(&gphy->phy_mutex);
b9930f0c8b336e Roy Luo 2025-12-27  92  
b9930f0c8b336e Roy Luo 2025-12-27  93  	set_vbus_valid(gphy);
b9930f0c8b336e Roy Luo 2025-12-27  94  
b9930f0c8b336e Roy Luo 2025-12-27  95  	return 0;
b9930f0c8b336e Roy Luo 2025-12-27  96  }
b9930f0c8b336e Roy Luo 2025-12-27  97  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
