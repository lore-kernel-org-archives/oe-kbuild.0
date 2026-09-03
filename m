Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A131E855
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Sep 2026 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788478279; cv=none; b=CbKpJtSkDixvou0Fga4fFu+eU8VT+OrkIq+kVJh388mfavAJAzX8SAOGVt4DDzWTUuVHfK0LM7WNhV5zwKUYm5UFVCrt5ztllJMqrHNfXZg1gUuPJgjgO1Wvdj5X8Vkkjb67aMC0jm8eCqrdm+2jtAEpn1zozNxpWOQ6N2nWNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788478279; c=relaxed/simple;
	bh=luUTDPOGoPcbge52T18PEPjGzAWagA5uhmqeiji20p8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gQ5OAE97YF1tw1Xq+xvHpRRZq/mh2EuZ+1AQfXkYltj9Y9M894EUYEiXVShdavGIUcn6nYjiGQbYsbEQJaklb/8evBXIXbAxeSSwCiLW0I0hC7NCi0Q3oYAapxdoXinEcEL109MTV3yk8vJnclYIiq0OAgVKmNWq/sy1ETGUYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRGFlVxq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRGFlVxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788478277; x=1820014277;
  h=date:from:to:cc:subject:message-id;
  bh=luUTDPOGoPcbge52T18PEPjGzAWagA5uhmqeiji20p8=;
  b=LRGFlVxq3lR6nNHHWyYNJbSblthYe7DYFYNJsrI2N+/kGca+NPPcAc32
   iCM2ZxnsKG2+9V0TBEoqJW0JDgYFJt2IGKCHIh6VPLJs+M2e5D8WuSXKd
   NRzxfWeV7EFNGeR2gHx7WYkNRMyLMk8WIF63A1R7OM/9UlicRnvq434Xl
   GBauLztjPkh3fdCdOtYcwkNuluIPnxN4SPCTUaMn36Hhl+TkbObcBBhko
   8j4Xkd151mg5lB8COcUKj/Llwfr1HjJmjgqSs92L705Ri/+RQpWBnZ0cc
   9UBfuXTtUAEHIN7I/VPyJQttkTakLTmc3OJlINdxzcyZd73Tnzs8WAttQ
   Q==;
X-CSE-ConnectionGUID: vN3LQqJGSlCS1sHmnb8XpQ==
X-CSE-MsgGUID: DLqekxGsQ3m2OGcSn5XwBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88903719"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88903719"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 16:31:16 -0700
X-CSE-ConnectionGUID: tDBNv4oKRCSuIFWdSk+YRA==
X-CSE-MsgGUID: BULQkub2R1eubm+37FJhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273400789"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Sep 2026 16:31:17 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Gtm-000000005Sm-40oC;
	Thu, 03 Sep 2026 23:31:14 +0000
Date: Fri, 04 Sep 2026 07:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/bridge/lontium-lt9611c.c:1226:12: warning:
 'lt9611c_bridge_resume' defined but not used
Message-ID: <202609040715.erXoWPUK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/mohit-dsor-oss-qualcomm-com/dt-bindings-bridge-Add-Lontium-LT9611C-EX-UXD-MIPI-DSI-to-HDMI-driver/20260903-005033, commit: 70199b1388b4c8e89d0c575b66fa30966d9c8e98"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sunyun Yang <syyang@lontium.com>
CC: 0day robot <lkp@intel.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/mohit-dsor-oss-qualcomm-com/dt-bindings-bridge-Add-Lontium-LT9611C-EX-UXD-MIPI-DSI-to-HDMI-driver/20260903-005033
head:   70199b1388b4c8e89d0c575b66fa30966d9c8e98
commit: 70199b1388b4c8e89d0c575b66fa30966d9c8e98 drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: sparc-randconfig-r061-20260904 (https://download.01.org/0day-ci/archive/20260904/202609040715.erXoWPUK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260904/202609040715.erXoWPUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609040715.erXoWPUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/lontium-lt9611c.c:1226:12: warning: 'lt9611c_bridge_resume' defined but not used [-Wunused-function]
    1226 | static int lt9611c_bridge_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/lontium-lt9611c.c:1205:12: warning: 'lt9611c_bridge_suspend' defined but not used [-Wunused-function]
    1205 | static int lt9611c_bridge_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/lt9611c_bridge_resume +1226 drivers/gpu/drm/bridge/lontium-lt9611c.c

70199b1388b4c8e Sunyun Yang 2026-09-03  1204  
70199b1388b4c8e Sunyun Yang 2026-09-03 @1205  static int lt9611c_bridge_suspend(struct device *dev)
70199b1388b4c8e Sunyun Yang 2026-09-03  1206  {
70199b1388b4c8e Sunyun Yang 2026-09-03  1207  	struct lt9611c *lt9611c = dev_get_drvdata(dev);
70199b1388b4c8e Sunyun Yang 2026-09-03  1208  	int ret;
70199b1388b4c8e Sunyun Yang 2026-09-03  1209  
70199b1388b4c8e Sunyun Yang 2026-09-03  1210  	disable_irq(lt9611c->client->irq);
70199b1388b4c8e Sunyun Yang 2026-09-03  1211  	cancel_work_sync(&lt9611c->work);
70199b1388b4c8e Sunyun Yang 2026-09-03  1212  
70199b1388b4c8e Sunyun Yang 2026-09-03  1213  	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
70199b1388b4c8e Sunyun Yang 2026-09-03  1214  
70199b1388b4c8e Sunyun Yang 2026-09-03  1215  	ret = regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
70199b1388b4c8e Sunyun Yang 2026-09-03  1216  	if (ret) {
70199b1388b4c8e Sunyun Yang 2026-09-03  1217  		dev_err(lt9611c->dev, "regulator bulk disable failed.\n");
70199b1388b4c8e Sunyun Yang 2026-09-03  1218  		gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
70199b1388b4c8e Sunyun Yang 2026-09-03  1219  		enable_irq(lt9611c->client->irq);
70199b1388b4c8e Sunyun Yang 2026-09-03  1220  		return ret;
70199b1388b4c8e Sunyun Yang 2026-09-03  1221  	}
70199b1388b4c8e Sunyun Yang 2026-09-03  1222  
70199b1388b4c8e Sunyun Yang 2026-09-03  1223  	return 0;
70199b1388b4c8e Sunyun Yang 2026-09-03  1224  }
70199b1388b4c8e Sunyun Yang 2026-09-03  1225  
70199b1388b4c8e Sunyun Yang 2026-09-03 @1226  static int lt9611c_bridge_resume(struct device *dev)
70199b1388b4c8e Sunyun Yang 2026-09-03  1227  {
70199b1388b4c8e Sunyun Yang 2026-09-03  1228  	struct lt9611c *lt9611c = dev_get_drvdata(dev);
70199b1388b4c8e Sunyun Yang 2026-09-03  1229  	int ret;
70199b1388b4c8e Sunyun Yang 2026-09-03  1230  
70199b1388b4c8e Sunyun Yang 2026-09-03  1231  	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
70199b1388b4c8e Sunyun Yang 2026-09-03  1232  	if (ret) {
70199b1388b4c8e Sunyun Yang 2026-09-03  1233  		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
70199b1388b4c8e Sunyun Yang 2026-09-03  1234  		return ret;
70199b1388b4c8e Sunyun Yang 2026-09-03  1235  	}
70199b1388b4c8e Sunyun Yang 2026-09-03  1236  	lt9611c_reset(lt9611c);
70199b1388b4c8e Sunyun Yang 2026-09-03  1237  	enable_irq(lt9611c->client->irq);
70199b1388b4c8e Sunyun Yang 2026-09-03  1238  
70199b1388b4c8e Sunyun Yang 2026-09-03  1239  	return ret;
70199b1388b4c8e Sunyun Yang 2026-09-03  1240  }
70199b1388b4c8e Sunyun Yang 2026-09-03  1241  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
