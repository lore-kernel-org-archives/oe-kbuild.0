Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E7189913
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 15:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130493; cv=none; b=pUl62mcCRgOmMFUapsCLVVObbnBvpaT2igAzSY0m/3HhnBeRsCSkypuqB/kmHMMZtnnvVerS30XwMTT4oFzez+cfnnwPSbgbUnSKBDVIFIYB2Ysmoh0h2qbbmSu0+t7B25Yea8XK3myZbo+pS3d8/rQzYnBeQCX9uDohMnCKxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130493; c=relaxed/simple;
	bh=XDBElnCZgorf0WBZZbTbUllSuvghy8eRK977RcsdhrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGEkV3m+hGpGhnY1ag1urjmkp+6twwTIdesZwgUa9oscuZboQ4FJ02dflY+Tp9FcUprk50u5p0Yjhec3i1CFJle2T41vgG4tlvXXx3P0dlw9YNxX+WySnMSbfczEH8CTYbF0L/ar5Ldv9/IUOTbZuAuMry8khjlXhmubAn1cJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8GDwLD7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8GDwLD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730130492; x=1761666492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDBElnCZgorf0WBZZbTbUllSuvghy8eRK977RcsdhrQ=;
  b=m8GDwLD7SYDzTwshFDpGL4i07B+657ltaPp1e/VTOtgg+GZbVobuPIih
   3yTIlnE66Cva29UiYU8pxAfsAXQgpcmJa9YTubuBrf4J7uxW8tc6B3kHz
   3orowEA+Sgl2YAhKgH/2VtvYNrknqBZ0b/UBCLngGF30xOju83y1P9+wO
   hj0wAShGqUeBBntqzBoqFh02NsE8Yp019Ag72vofZZc5toj1MgH9/e1dB
   5T3gzGv73542BcRLQ2HehZPOUMVarCmxq2ACQZzxnH8wo/a5CtQUFodec
   odQDQ49La1yGVL6hAL7fB3Ur8/fAHdS9KET2HUdJQd3DcwcmXTAS4o8Zl
   w==;
X-CSE-ConnectionGUID: hPxH725xT9C+K8zqIFQ3Jw==
X-CSE-MsgGUID: BXpGKuayRmSQPafgqVNmcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33527418"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="33527418"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:48:11 -0700
X-CSE-ConnectionGUID: W872OR/5QtSBhOTC7Za5tQ==
X-CSE-MsgGUID: 1WFhPKBlSMmvdoKSNRXmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="82468205"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 08:48:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5RyR-000caW-0K;
	Mon, 28 Oct 2024 15:48:07 +0000
Date: Mon, 28 Oct 2024 23:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c:1202
 qlcnic_get_strings() error: __builtin_memcpy() '*qlcnic_gstrings_test' too
 small (32 vs 192)
Message-ID: <202410282316.pR9zqsLc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81983758430957d9a5cb3333fe324fd70cf63e7e
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20241028 (https://download.01.org/0day-ci/archive/20241028/202410282316.pR9zqsLc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410282316.pR9zqsLc-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c:1202 qlcnic_get_strings() error: __builtin_memcpy() '*qlcnic_gstrings_test' too small (32 vs 192)

vim +1202 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c

af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1193  
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1194  static void
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1195  qlcnic_get_strings(struct net_device *dev, u32 stringset, u8 *data)
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1196  {
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1197  	struct qlcnic_adapter *adapter = netdev_priv(dev);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1198  	int index, i, num_stats;
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1199  
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1200  	switch (stringset) {
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1201  	case ETH_SS_TEST:
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13 @1202  		memcpy(data, *qlcnic_gstrings_test,
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1203  		       QLCNIC_TEST_LEN * ETH_GSTRING_LEN);
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1204  		break;
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1205  	case ETH_SS_STATS:
f27c75b3903ab0 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-11-04  1206  		num_stats = ARRAY_SIZE(qlcnic_tx_queue_stats_strings);
34e8c406fda5b5 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-11-04  1207  		for (i = 0; i < adapter->drv_tx_rings; i++) {
aa4a1f7df7cbb9 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-08-21  1208  			for (index = 0; index < num_stats; index++) {
f27c75b3903ab0 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-11-04  1209  				sprintf(data, "tx_queue_%d %s", i,
f27c75b3903ab0 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-11-04  1210  					qlcnic_tx_queue_stats_strings[index]);
aa4a1f7df7cbb9 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-08-21  1211  				data += ETH_GSTRING_LEN;
aa4a1f7df7cbb9 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-08-21  1212  			}
aa4a1f7df7cbb9 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-08-21  1213  		}
aa4a1f7df7cbb9 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-08-21  1214  
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1215  		for (index = 0; index < QLCNIC_STATS_LEN; index++) {
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1216  			memcpy(data + index * ETH_GSTRING_LEN,
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1217  			       qlcnic_gstrings_stats[index].stat_string,
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1218  			       ETH_GSTRING_LEN);
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1219  		}
aa4a1f7df7cbb9 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Himanshu Madhani   2013-08-21  1220  
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1221  		if (qlcnic_83xx_check(adapter)) {
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1222  			num_stats = ARRAY_SIZE(qlcnic_83xx_tx_stats_strings);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1223  			for (i = 0; i < num_stats; i++, index++)
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1224  				memcpy(data + index * ETH_GSTRING_LEN,
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1225  				       qlcnic_83xx_tx_stats_strings[i],
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1226  				       ETH_GSTRING_LEN);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1227  			num_stats = ARRAY_SIZE(qlcnic_83xx_mac_stats_strings);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1228  			for (i = 0; i < num_stats; i++, index++)
54a8997c6a0266 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Jitendra Kalsaria  2012-04-26  1229  				memcpy(data + index * ETH_GSTRING_LEN,
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1230  				       qlcnic_83xx_mac_stats_strings[i],
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1231  				       ETH_GSTRING_LEN);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1232  			num_stats = ARRAY_SIZE(qlcnic_83xx_rx_stats_strings);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1233  			for (i = 0; i < num_stats; i++, index++)
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1234  				memcpy(data + index * ETH_GSTRING_LEN,
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1235  				       qlcnic_83xx_rx_stats_strings[i],
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1236  				       ETH_GSTRING_LEN);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1237  			return;
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1238  		} else {
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1239  			num_stats = ARRAY_SIZE(qlcnic_83xx_mac_stats_strings);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1240  			for (i = 0; i < num_stats; i++, index++)
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1241  				memcpy(data + index * ETH_GSTRING_LEN,
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1242  				       qlcnic_83xx_mac_stats_strings[i],
54a8997c6a0266 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Jitendra Kalsaria  2012-04-26  1243  				       ETH_GSTRING_LEN);
54a8997c6a0266 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Jitendra Kalsaria  2012-04-26  1244  		}
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1245  		if (!(adapter->flags & QLCNIC_ESWITCH_ENABLED))
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1246  			return;
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1247  		num_stats = ARRAY_SIZE(qlcnic_device_gstrings_stats);
7e38d04bcb405e drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c Sony Chacko        2013-01-01  1248  		for (i = 0; i < num_stats; index++, i++) {
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1249  			memcpy(data + index * ETH_GSTRING_LEN,
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1250  			       qlcnic_device_gstrings_stats[i],
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1251  			       ETH_GSTRING_LEN);
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1252  		}
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1253  	}
af19b49152bdb6 drivers/net/qlcnic/qlcnic_ethtool.c                 Amit Kumar Salecha 2010-01-13  1254  }
3666e0b04f092f drivers/net/qlcnic/qlcnic_ethtool.c                 amit salecha       2010-10-18  1255  

:::::: The code at line 1202 was first introduced by commit
:::::: af19b49152bdb68fda894183e88096d6d1aa5c3d qlcnic: Qlogic ethernet driver for CNA devices

:::::: TO: Amit Kumar Salecha <amit.salecha@qlogic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
