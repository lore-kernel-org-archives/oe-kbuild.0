Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247C2236E0
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992352; cv=none; b=bgkf3gLNxOiV1i9HzQyU+M++4sX1BMvh5bAawZcwfIgCm0NL1ZoAzXMj/v98ChxIegVrOL8Dnx6rtk69Qv2FFfy3La/3iZsYzMgyh0HtIIGOLUT/RzN9zLUb2Muw75at6BIXLJel1xw+ilN77GseSM1JObo7cktM1UtgvIB6CEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992352; c=relaxed/simple;
	bh=FBH32jarlZyQXRHCA7aFUjyCvNteUPR5FFZbI+U5NYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzw4D7T+uSbsTZARr0ZfbKft1g7C6gTqu2DXnHY0vLMVtA2fVcLGRo0IvB9kL3w1mzQ4eTjcMSaKulUhDHYMLqy5fqqFx7iEUv8yeVBsnfxK8QRIkHh93G8kGdBAOlTuAJqfkqtXtm1irJ0G1bAkXNJi8rGWwWF4DG35q4yAYHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOfTZCem; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOfTZCem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760992351; x=1792528351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FBH32jarlZyQXRHCA7aFUjyCvNteUPR5FFZbI+U5NYM=;
  b=TOfTZCemSvzn7FdBGgwgsmemIu8AOEoQscKWBSh55bM9lIfZKNTIcQl+
   Qa0t5GtWwZwlyHd/EcYK8T2CJRFkGaP9NIIGSRQd0jpZf+5tBKJN/T94p
   OAp42MP+5PWiUbfqmpEy1kaGQzFpYjyPkCRdXG5XsSmVTmLH2pqxoY51P
   w9X7Dgy6xDyPJ5p75QWLXe3WmP18pI/mdIOGFKeM3+XWX1PA2shzyMCas
   F3Jjuj+cM0ssl0H6mC7v4aui6JrCwoHLdzXH0fWSXG53Sicq+PZvEdUsZ
   JIGTph8R6xYkfwSuM/gC8Ib92vPbXtBr3EJEs1C7oqstScTF9KKypMrqN
   g==;
X-CSE-ConnectionGUID: sJCodymFQj2/ZR8GLrz/gw==
X-CSE-MsgGUID: ojyvgpJcRruK6doFKEfs0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80555029"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="80555029"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:32:31 -0700
X-CSE-ConnectionGUID: oUOZ58LQSgKGlX8BjoqSMA==
X-CSE-MsgGUID: KxYCzjBqR5Ge17dowtZusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="182607201"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Oct 2025 13:32:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAwYN-000A9F-08;
	Mon, 20 Oct 2025 20:32:27 +0000
Date: Tue, 21 Oct 2025 04:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] iio: adc: adding support for PAC1711
Message-ID: <202510210413.JRfDM9jF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/pac1711.c:1079:27: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251015-pac1711-v1-2-976949e36367@microchip.com>
References: <20251015-pac1711-v1-2-976949e36367@microchip.com>
TO: Ariana Lazar <ariana.lazar@microchip.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ariana Lazar <ariana.lazar@microchip.com>

Hi Ariana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariana-Lazar/dt-bindings-iio-adc-adding-support-for-PAC1711/20251016-002337
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20251015-pac1711-v1-2-976949e36367%40microchip.com
patch subject: [PATCH 2/2] iio: adc: adding support for PAC1711
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-r112-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210413.JRfDM9jF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210413.JRfDM9jF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210413.JRfDM9jF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/pac1711.c:1079:27: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/iio/adc/pac1711.c:1078:42: sparse: signed value source
   drivers/iio/adc/pac1711.c:1102:27: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/iio/adc/pac1711.c:1101:42: sparse: signed value source

vim +1079 drivers/iio/adc/pac1711.c

de2a3cdfd6e76b Ariana Lazar 2025-10-15  1065  
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1066  static int pac1711_setup_vbus_range(struct pac1711_chip_info *info)
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1067  {
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1068  	const char *prop_name = "microchip,vbus-input-range-microvolt";
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1069  	struct i2c_client *client = info->client;
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1070  	struct device *dev = &client->dev;
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1071  	unsigned int tbl_len, ret;
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1072  	s32 vals[2];
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1073  
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1074  	/* default value is unipolar and Full Scale Range */
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1075  	ret = device_property_read_u32_array(dev, prop_name, vals, 2);
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1076  	if (!ret) {
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1077  		tbl_len = ARRAY_SIZE(pac1711_vbus_range_tbl);
de2a3cdfd6e76b Ariana Lazar 2025-10-15 @1078  		ret = pac1711_check_range(vals, pac1711_vbus_range_tbl, tbl_len);
de2a3cdfd6e76b Ariana Lazar 2025-10-15 @1079  		if (ret < 0)
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1080  			return dev_err_probe(dev, -EINVAL, "Invalid value %d, %d for prop %s\n",
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1081  					     vals[0], vals[1], prop_name);
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1082  
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1083  		info->vbus_mode = ret;
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1084  	}
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1085  
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1086  	return 0;
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1087  }
de2a3cdfd6e76b Ariana Lazar 2025-10-15  1088  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
