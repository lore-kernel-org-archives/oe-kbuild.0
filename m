Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2C0314B7C
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766843710; cv=none; b=eOHqRbnOgcRl9MpLsEKoWjDIYAQF6OVDngO7otDbK1Fz4HX92qW00miB9hJoLZf0xzZ4T9Khuufi0TvU9Y5tRCvvFwYcIwQ0zGUokQDl5poqCMVv1RpH5zfZvika1xyOByPeGIaJA4oKl6iHyVEJ0emuWBZ9krVcvYUA17jcW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766843710; c=relaxed/simple;
	bh=86VhVJC4s5d566ef09uQk8XTDIEMQvskFoz154ORleY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ui9fJQPA8Xf632OJYQFLWoSjakDv9LPLV7w7I63GxQYZHsX+wJIT/r+6VtJZHDg7egvqv0LXVIyYqiQ0WwNdWW4H4NVbtqQRFhUb7K5B6lLSYgkG7nkAVrtsvweX03IIJkl7e5mB3BPB10+K5di0pp549eU43VXfUVJb8FILdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwK+3fsk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwK+3fsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766843708; x=1798379708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=86VhVJC4s5d566ef09uQk8XTDIEMQvskFoz154ORleY=;
  b=BwK+3fsk/DHjHP0Q0b9eF4iTD7TO0uYawqFNo/s/iPOhrdpqv3ML9RyL
   B9Vze2GVkbpAHN7ySq80KjNQscoKTlYtte9WrECLYxmocO+OSgIMUC1Ru
   NEeYkVC9bC8XIs+PfwBOkj5Uglf+73+pS7nIsV3zrkcNuMONuWvvwtWQy
   R1V3kDhKhhmqKtGLQcwjXgx1oO74OXrCwGHRpO8B7Ha5iJ3iXGA0mznmz
   HPBONzVZD8HnS7JIoEO/9l6NMcO2CzH1QyfKvW9SamM0feYyNGxrNYQkF
   uu1inW3hgepwkX4vk2fKbQTT7cjFjqx5zJMALsAftTLcoHJgIRRQQgAzY
   A==;
X-CSE-ConnectionGUID: TF7UKx46TUyH9atng3UQHQ==
X-CSE-MsgGUID: EvMpXGkkQb2Eaod+qIcyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68585567"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68585567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 05:55:07 -0800
X-CSE-ConnectionGUID: raTkWGURTImyKvd2Af1qrg==
X-CSE-MsgGUID: SINjdmAjS6Wxyl3XpC2xQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="237959613"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2025 05:55:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZUl6-000000005rh-29x9;
	Sat, 27 Dec 2025 13:55:04 +0000
Date: Sat, 27 Dec 2025 21:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Message-ID: <202512272134.4jQzFEif-lkp@intel.com>
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
In-Reply-To: <20251223094529.7202-2-clamor95@gmail.com>
References: <20251223094529.7202-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Dmitry Osipenko <digetx@gmail.com>
CC: linux-usb@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/usb-phy-tegra-use-phy-type-directly/20251223-175449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20251223094529.7202-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251227/202512272134.4jQzFEif-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512272134.4jQzFEif-lkp@intel.com/

smatch warnings:
drivers/usb/phy/phy-tegra-usb.c:857 tegra_usb_phy_power_off() error: uninitialized symbol 'err'.

vim +/err +857 drivers/usb/phy/phy-tegra-usb.c

1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  836  
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  837  static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  838  {
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  839  	int err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  840  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  841  	if (!phy->powered_on)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  842  		return 0;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  843  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  844  	switch (phy->phy_type) {
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  845  	case USBPHY_INTERFACE_MODE_UTMI:
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  846  		err = utmi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  847  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  848  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  849  	case USBPHY_INTERFACE_MODE_ULPI:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  850  		err = ulpi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  851  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  852  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  853  	default:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  854  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  855  	}
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  856  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06 @857  	if (err)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  858  		return err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  859  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  860  	phy->powered_on = false;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  861  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  862  	return 0;
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  863  }
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  864  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
