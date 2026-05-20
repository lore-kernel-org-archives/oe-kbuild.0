Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65DD3BE164
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315357; cv=none; b=gjaymZThnwIatr8OXl/FwjBcWuKDvvfEHtA6n2dupA0rI0hLRblDd2Z8JEE2FwJjcwcAdHLze8JWD8+2pYWmMOCW6IuhH3HO1eZTG6jwAhEHetWe0H5PghbjhYm0abDgFDlrZdg0Ptj032bZLRFR89uu3NDSXs444rbUr5qWDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315357; c=relaxed/simple;
	bh=LMqasyePvatGuKu4UiLorTpSUDwac9JWCxChXeDn2cs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LfsSLWh1VDXeNx+SzBZBlO9YHmZsBFzW4lnjbDKD/WpaJHXUqabFuIO8talzkzPK/sDZfGL40T2WJSTz18zyKWpAgl9Gr/AOdNW78eQ7FixrAWJHBwqZUHlAmkKbr7ftSTaHz35k9lz+sNhLjZt0Pdb5UjAa61hGlOMkQgxYWSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7JJPAzj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7JJPAzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779315355; x=1810851355;
  h=date:from:to:cc:subject:message-id;
  bh=LMqasyePvatGuKu4UiLorTpSUDwac9JWCxChXeDn2cs=;
  b=X7JJPAzjZAX/PADijjbUfS7qyUSHs8MSyONbvNuLC7g9jnB7L6USXK/s
   wi/M7PPRYW/ycuLKEnh/E1uSarkUWRht5X8oNft2SLTqRBoRDknoosWxP
   Ll0Ii+0syPcFFb8OBCw9Gi+m4MDX7qHq2svQwelM72iZYMZ1T+BSz4vaK
   7hb9IHpXyE45QOtRuCUTYvWxngT8IkPw9ERQJtl1RSOJBuVPfgJN1AhRS
   rJfBrNpGZ4KabZyMkdDSdJsb+Uaf1Lw2T6fY9TbY9vJSlWcmpsxCNATKR
   j2mNVIQmBlWyUi+NZHE0/oPC9tpmpPbJlJat8F/ODGD9vCVJIV2asfBIY
   g==;
X-CSE-ConnectionGUID: 0QNgR0xAT1WY7Wch0VYi+A==
X-CSE-MsgGUID: BduHdx/tR+a08c5HnZotbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91337164"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91337164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 15:15:55 -0700
X-CSE-ConnectionGUID: bnoSCO8JTNaoXSeObJAOjQ==
X-CSE-MsgGUID: TtqtF8ijT0G0JVKDNhyDXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="236077549"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 15:15:54 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPpCN-000000003ue-1CbG;
	Wed, 20 May 2026 22:15:38 +0000
Date: Thu, 21 May 2026 06:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lee-leds:for-leds-next 12/17]
 drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202605210624.3gcr3prk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-leds@vger.kernel.org
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   25025253476a64c186592d952c27f24bc3490e42
commit: 3daf2c4ef82b30d4cb017508f6857438ca44da41 [12/17] leds: Add support for TI LP5860 LED driver chip
:::::: branch date: 6 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210624.3gcr3prk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +119 drivers/leds/rgb/leds-lp5860-core.c

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   96  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   97  static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *init_data)
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   98  {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   99  	struct fwnode_handle *led_node = NULL;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  100  	struct fwnode_handle *multi_led = init_data->fwnode;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  101  	int subled = 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  102  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  103  	fwnode_for_each_child_node(multi_led, led_node) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  104  		u32 channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  105  		u32 color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  106  		int ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  107  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  108  		ret = fwnode_property_read_u32(led_node, "color", &color_index);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  109  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  110  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  111  				      "%pfwP: Cannot read 'color' property. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  112  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  113  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  114  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  115  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  116  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  117  		if (ret < 0 || channel > LP5860_MAX_LED) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  118  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05 @119  				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  120  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  121  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  122  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  123  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  124  		led->mc_cdev.subled_info[subled].color_index = color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  125  		led->mc_cdev.subled_info[subled].channel = channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  126  		ret = lp5860_led_init(led, init_data->fwnode, channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  127  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  128  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  129  				      "%pfwP: Failed to init LED\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  130  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  131  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  132  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  133  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  134  		subled++;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  135  	}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  136  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  137  	return 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  138  }
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  139  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
