Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C7749D
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2VEgfDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699815341; x=1731351341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaB6jRhTty9wZYUPCSQsdckQu3n8hrgxhppTbjtL3JM=;
  b=N2VEgfDRZE+yayqffRm55vJcy6cTVgOUiY0rbtASYGCs6TZgRW4BCWcL
   nfj5DfNSL39YbASuXCuF9jQ9iQ1dAe9eDEQRd9ZZp8fmRWAoxQMbrKCMX
   890E9dumaxLvDqcsseTP5cF3bfybLUHG0oZD2UZ3TATed05QN6xZp9T8n
   ICKX1GbdUQh3oqP3HRGsEiahbNy8hP88XXxegxbfnUGOmrm5EVLwETIbV
   gXAyOrUk6OpwKtUWswccn+Gk3DZgz7hX4P+2w4zpE4uzAoSmn/1BUwuAS
   FULfDvBUizwwPS9D2paogIUeJGQL4ESg++8DADK79RuN7ap/ArSeB2L39
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421445916"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="421445916"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 10:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881470105"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="881470105"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 10:55:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2FcP-000BRK-0W;
	Sun, 12 Nov 2023 18:55:37 +0000
Date: Mon, 13 Nov 2023 02:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <202311130219.YBiF8Xu3-lkp@intel.com>
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
In-Reply-To: <20231110151905.1659873-3-nuno.sa@analog.com>
References: <20231110151905.1659873-3-nuno.sa@analog.com>
TO: Nuno Sa <nuno.sa@analog.com>
TO: linux-hwmon@vger.kernel.org
TO: linux-doc@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Nuno Sa <nuno.sa@analog.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>
CC: Jean Delvare <jdelvare@suse.com>
CC: Conor Dooley <conor+dt@kernel.org>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa/dt-bindings-hwmon-Add-LTC4282-bindings/20231110-232017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231110151905.1659873-3-nuno.sa%40analog.com
patch subject: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231112 (https://download.01.org/0day-ci/archive/20231113/202311130219.YBiF8Xu3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231113/202311130219.YBiF8Xu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311130219.YBiF8Xu3-lkp@intel.com/

smatch warnings:
drivers/hwmon/ltc4282.c:859 ltc4282_is_visible() warn: signedness bug returning '(-524)'
drivers/hwmon/ltc4282.c:1143 ltc4282_gpio_setup() warn: passing zero to 'dev_err_probe'

vim +859 drivers/hwmon/ltc4282.c

31ea069ddf481b Nuno Sa 2023-11-10  843  
31ea069ddf481b Nuno Sa 2023-11-10  844  static umode_t ltc4282_is_visible(const void *data,
31ea069ddf481b Nuno Sa 2023-11-10  845  				  enum hwmon_sensor_types type,
31ea069ddf481b Nuno Sa 2023-11-10  846  				  u32 attr, int channel)
31ea069ddf481b Nuno Sa 2023-11-10  847  {
31ea069ddf481b Nuno Sa 2023-11-10  848  	switch (type) {
31ea069ddf481b Nuno Sa 2023-11-10  849  	case hwmon_in:
31ea069ddf481b Nuno Sa 2023-11-10  850  		return ltc4282_in_is_visible(data, attr);
31ea069ddf481b Nuno Sa 2023-11-10  851  	case hwmon_curr:
31ea069ddf481b Nuno Sa 2023-11-10  852  		return ltc4282_curr_is_visible(attr);
31ea069ddf481b Nuno Sa 2023-11-10  853  	case hwmon_power:
31ea069ddf481b Nuno Sa 2023-11-10  854  		return ltc4282_power_is_visible(attr);
31ea069ddf481b Nuno Sa 2023-11-10  855  	case hwmon_energy:
31ea069ddf481b Nuno Sa 2023-11-10  856  		/* hwmon_energy_enable */
31ea069ddf481b Nuno Sa 2023-11-10  857  		return 0644;
31ea069ddf481b Nuno Sa 2023-11-10  858  	default:
31ea069ddf481b Nuno Sa 2023-11-10 @859  		return -ENOTSUPP;
31ea069ddf481b Nuno Sa 2023-11-10  860  	}
31ea069ddf481b Nuno Sa 2023-11-10  861  }
31ea069ddf481b Nuno Sa 2023-11-10  862  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
