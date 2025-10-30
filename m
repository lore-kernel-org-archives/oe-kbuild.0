Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A31F3B85
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816733; cv=none; b=GuIBfIarjYs7cyBm/Vwky1I/wWVVLsuTGiWw8adL3jEadWvUae3Bvck0IZKKDDccjs/+7Jv5ld8We0ZcZap3gVBH1KbPuxlrOVIu1UHrs8QLE145Q1cBn0jrM7HG/0+m9bIJdmVgElRhVLVyxpfyfhsEPXkZjn98Lva8EECjF8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816733; c=relaxed/simple;
	bh=SdOxUla2s0KN6qqL6PhfYxwr4Cvmw8BaC4+4oUTZi1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YTn05fsqJsMqFRucWtLpg9+hFt9DbE5sjMlcqFBPTNXYGIQ9vbv6d/v9W29+rIHYuOPzYhPTkEQSy/tsyG7rK5wVRiwEdwrI9vSGUufCnubNifq2hHvmjRPBKsZoOkGkOn9CkRdYFQxw3eMfVl12hKfQTZmLK48wZEpzugyaxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFBDsgI3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFBDsgI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761816732; x=1793352732;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SdOxUla2s0KN6qqL6PhfYxwr4Cvmw8BaC4+4oUTZi1w=;
  b=WFBDsgI3wRTd7Jl/0Ezq5iXXDepnKYP9BDRxR+riY0Ac2o5wwvyWBTlB
   p1AV6FDPh0/8ggo+1ut44SlxVc1X47wXki1vhJLuOPu1kLFXYq9kkmpNi
   2At3Q/8ogbLpK9cvSy1nsQ6xfgeXP5To+IUzBz3nUBwr81g79X8Qo/WD0
   SnZdhuuB+tRSL5F6co+OAGW4qwmZ1QWw5ptzUM+dLz2I0wYPlTp2/cH3I
   VKiI0dgVBBd5xEIRc2aelKaDnh2d/3FBQltW2C7ft6oeau1VEyLjBHj38
   /NXx0fP5PmSlKpafFm54Dc4e5rm9l70bjgVd93ZKOMHtElfq1V279fwl+
   A==;
X-CSE-ConnectionGUID: kZS+bvJQRkKYT2UYM1awSQ==
X-CSE-MsgGUID: 5kAzwrJVQ/qgDPSNeDwEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67787709"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67787709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 02:32:11 -0700
X-CSE-ConnectionGUID: 5z/Quou/Qwy9WsmsftJtLw==
X-CSE-MsgGUID: Sw8rn2IUSwijOpjrS3XRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="186351858"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2025 02:32:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEP0q-000Lm6-15;
	Thu, 30 Oct 2025 09:32:08 +0000
Date: Thu, 30 Oct 2025 17:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/platform/x86/dell/dell-lis3lv02d.c:102:60-67: WARNING:
 Consider using %pe to print PTR_ERR()
Message-ID: <202510301705.M3VPAUwc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: "Pali Rohár" <pali@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: cc0809b752c74b768845f6e049b419c32d954a1a platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
date:   11 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-102-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301705.M3VPAUwc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301705.M3VPAUwc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)


vim +102 drivers/platform/x86/dell/dell-lis3lv02d.c

cc0809b752c74b Hans de Goede 2024-12-09   80  
cc0809b752c74b Hans de Goede 2024-12-09   81  static void instantiate_i2c_client(struct work_struct *work)
cc0809b752c74b Hans de Goede 2024-12-09   82  {
cc0809b752c74b Hans de Goede 2024-12-09   83  	struct i2c_board_info info = { };
cc0809b752c74b Hans de Goede 2024-12-09   84  	struct i2c_adapter *adap = NULL;
cc0809b752c74b Hans de Goede 2024-12-09   85  
cc0809b752c74b Hans de Goede 2024-12-09   86  	if (i2c_dev)
cc0809b752c74b Hans de Goede 2024-12-09   87  		return;
cc0809b752c74b Hans de Goede 2024-12-09   88  
cc0809b752c74b Hans de Goede 2024-12-09   89  	/*
cc0809b752c74b Hans de Goede 2024-12-09   90  	 * bus_for_each_dev() and not i2c_for_each_dev() to avoid
cc0809b752c74b Hans de Goede 2024-12-09   91  	 * a deadlock when find_i801() calls i2c_get_adapter().
cc0809b752c74b Hans de Goede 2024-12-09   92  	 */
cc0809b752c74b Hans de Goede 2024-12-09   93  	bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
cc0809b752c74b Hans de Goede 2024-12-09   94  	if (!adap)
cc0809b752c74b Hans de Goede 2024-12-09   95  		return;
cc0809b752c74b Hans de Goede 2024-12-09   96  
cc0809b752c74b Hans de Goede 2024-12-09   97  	info.addr = i2c_addr;
cc0809b752c74b Hans de Goede 2024-12-09   98  	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
cc0809b752c74b Hans de Goede 2024-12-09   99  
cc0809b752c74b Hans de Goede 2024-12-09  100  	i2c_dev = i2c_new_client_device(adap, &info);
cc0809b752c74b Hans de Goede 2024-12-09  101  	if (IS_ERR(i2c_dev)) {
cc0809b752c74b Hans de Goede 2024-12-09 @102  		dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
cc0809b752c74b Hans de Goede 2024-12-09  103  		i2c_dev = NULL;
cc0809b752c74b Hans de Goede 2024-12-09  104  	} else {
cc0809b752c74b Hans de Goede 2024-12-09  105  		dev_dbg(&adap->dev, "registered lis3lv02d on address 0x%02x\n", info.addr);
cc0809b752c74b Hans de Goede 2024-12-09  106  	}
cc0809b752c74b Hans de Goede 2024-12-09  107  
cc0809b752c74b Hans de Goede 2024-12-09  108  	i2c_put_adapter(adap);
cc0809b752c74b Hans de Goede 2024-12-09  109  }
cc0809b752c74b Hans de Goede 2024-12-09  110  static DECLARE_WORK(i2c_work, instantiate_i2c_client);
cc0809b752c74b Hans de Goede 2024-12-09  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
