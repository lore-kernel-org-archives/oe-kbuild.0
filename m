Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455044;
	b=RCWtVuvKUEBZ9CLEKsTbrUQzD6Qzo5jaaa5NZuAa/1zZGEcq4Idfqdarma7cfQ6wVW2g
	 RFSwEXlP9mQTBSuNaRKS9JahlsuHRCLCZ5EAuJ9hZyft5ppoxxMU2+igSWdKat005rRYs
	 W7v+Kx2ZfgOOuglR+3Lr+PSlnbOfu7oQrKc9i01kyNF2USvv7GNpguWTaXFMZURY3rgLk
	 rE/AbNV+nXWyDEQiwY0Lu8PyBhbbzb08t2NzoRZmoMYVm7aLuCsYbQyKziqX85qVMgmMY
	 DPCdq8vAwcsygio0ilgbJangrfSkdHeYiLfJjJzwXb+0Ze3P9FCkU1BCTV6SYExGidw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455044;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=a0mV4QQEG/iBfBCQtTS7DzHXr5gdSdEueYIwyoQVL7c=;
	b=Z8pY/iVcSdOgF/wI32eSgBv1NdvFK4H/vUn2dEmN3YwqkgcRBVV9vZf+EQ6gY/Uhh1fW
	 DPYUmnrCvpPnL1yZzKT4yZZSmdUTLayiWTdAeDpMZTL/yzTrZYvLw7EYatwMKV5TpDGUW
	 /y+t4qneeRNsXonS/vvWgKRngnoq1kPfhMulT7WS6c6psHLJ7UacKpZztbdgkueXu9NMU
	 f+s6Iu3ucfluMNHUp7c6NjDzIp6FuMk45kXt6nTso4VtqW3IXL/Mny7YHgoTe0+rZrZdm
	 u0nfWVnYlfhlvfSp5b6c8XrCCu65P1bj4EpstYEMh2P3eb8BzmD1PKzHomsazcBCCeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtKwQPeK;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E68606A338
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 17:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E68606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtKwQPeK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795455044; x=1826991044;
  h=date:from:to:cc:subject:message-id;
  bh=MWwJDidh8ueulFwmwUk2bWYIbRQNfnpwkJXiQ2iEIfY=;
  b=mtKwQPeKlxbK3DJlgux6x1HVGIas/csCnpRPzPRu++39lj1hG99o35Df
   aByvhxnf80tPm0LbzToVHljKNg8j+3HYbrswnhlJMLDkiBMUZMGiakCdx
   wBUrPFkWWNVDBJCuF5SlxGd1k4n7PIdCdaEYpkkfmDaJ1NGXjXggeptKj
   k4E6A8IyfUCJ1RfZPpR4CQ8aCPa8NOLEt5yrd5TXRdbeKO502KuJ14/dd
   sW+3sjP8h3fLSYEL6/tArjvNkQGSVM5/7m7Eufap/M0b5EH6qpL4Z0Bf2
   AvLnwnNhHwcLIIWCvMs8NzX3T7RCphW6dPtNhSKd2gycZC0TCiq9/9UUv
   A==;
X-CSE-ConnectionGUID: POra3fieR02Z3/cNbwJm0Q==
X-CSE-MsgGUID: AggFXT3cQoujplWzbWIO6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4165563"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4165563"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 09:30:31 -0800
X-CSE-ConnectionGUID: y39Er7NwT9iYdEUpGi4k9g==
X-CSE-MsgGUID: F0L7nd6UQVOxcT6ZDrWQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11340187"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Nov 2026 09:30:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVXs2-000000004sv-1Zmd;
	Mon, 23 Nov 2026 17:30:26 +0000
Date: Mon, 23 Nov 2026 18:29:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 1/1]
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c:1202 qlcnic_get_strings()
 error: __builtin_memcpy() '*qlcnic_gstrings_test' too small (32 vs 192)
Message-ID: <20261123182517.IpqNj1TT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a5c942b8c5be461264ec25e7893e53fda4144a3a
commit: c3e439cb04cf6988551994a2a7cb03cda2355ce5 [1/1] kasan, fortify: properly rename memintrinsics
:::::: branch date: 8 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-2200-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123182517.IpqNj1TT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261123182517.IpqNj1TT-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c:1202 qlcnic_get_strings() error: __builtin_memcpy() '*qlcnic_gstrings_test' too small (32 vs 192)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:2655 bnx2x_get_vf_config() error: __builtin_memcpy() '&bulletin->vlan' too small (2 vs 4)

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
