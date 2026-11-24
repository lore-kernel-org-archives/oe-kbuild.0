Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491055;
	b=Df4nRESavVPxIqVNp49CMbUzf/lEekjBu9S7brPJBybvy1hEpVcW/teJ6o8lbJChd1pI
	 j2SoMKpK6rQLumCAv23vSDrlYGzUuUuHjJV5UWCfzm1ch9FXiySCLYOS8PeOrOvfbnVxy
	 AwH0NcZHaXLrWXzi8oEXWOdKdu3e06NUYDudwqjA+yrq+I2Jrdg20Bnx+EXDaizTD0hO+
	 qfR6XOCJ2XuBEv+phM53WeKqOeJmeA01RY+wbIgPZJJavG/jd3aJ/OTLoKg9X4+QyKaQQ
	 nfZk00crXiBUNpJPLME4Byt1RX1JGoXPCqm6R6CR670b2xHDmN+MpV1kk14OjqGjfmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491055;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7MYyp/7miEWBLCp/Xl8yQ9z4YJr6ipLWypdWPWa1WHM=;
	b=HY2/uW66lU1DwsRfvZYMn8GtM/sMFX+BndCtnHjfLCkwOazbqUH0sdc3fySr180UgoMo
	 +ibVJM3ZEnoJrZrr6XgrNuLRXcZpDhpMpAxQjgyRRC6W1/P4/7to6IA4odMLZmc6zzZ2E
	 +fBhNNqWZp+E+8g0gW7aHEIOtcCzEXiBQdPYdWChY+dJ0FYvX3KmDetvLLYfYWUpCytr4
	 dFN4sbqSGjbl51nwH+410TA65gHPOWIFh2uGmQefv1g91bbchs1OjYgQr7ZnrX6Y9458n
	 mGkeECHNppWuQScd/fXQLPwAqx7Kz1kNDZZiGnINLFMVRNmRI+2lkmFlzEI2bfqsRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cPof4QOI;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D99606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 03:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cPof4QOI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795491054; x=1827027054;
  h=date:from:to:cc:subject:message-id;
  bh=9UOHnXPju/3M4MxtznIvyGh/mxNxCTGUiuGpaYIvYsQ=;
  b=cPof4QOIuhF1MpnkDwhB7AlpQFBmsqD4MQIg5jxVk/0mAJE0Vk8RHaHu
   3TXOy1S5tcfpBqG/VHOgLz2es19c8PUD/e7RB9adzHD2A7g9GUOW37gwd
   coNZQUfkuFiuAQwqBg19pARkRw17onVQxHcWmKwRqTB6QRucW13yZD2mm
   BWCvbAJw0deIhkGLO/jC5ds4x733G+UI4/fct/h7UpsW5+GDSfKeTeily
   FwS1nR/xWeySIWg9g0XIkpTg02w9bOIWuii/ENjb45ZYKj/dEaP5h1UWl
   5k38a7GwroqNpCAtgTJPluDjHDdLSd9j/zFbjwEZsnFjAInH08v6ne00Y
   A==;
X-CSE-ConnectionGUID: DuSYEec5RrC4z+rPAq8ymw==
X-CSE-MsgGUID: 7rK+Hp06Q+GkUJjpMm2EtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4159094"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4159094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 19:30:53 -0800
X-CSE-ConnectionGUID: nb10pHG/RqG9Lj8ObwLeFA==
X-CSE-MsgGUID: Lcw67UPyRS2SVHpexLgvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11873792"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Nov 2026 19:30:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVhF4-0000000057J-0Gwi;
	Tue, 24 Nov 2026 03:30:50 +0000
Date: Tue, 24 Nov 2026 04:30:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bluetooth-next:master 95/97]
 drivers/bluetooth/btintel_pcie.c:1038:3-13: second lock on line 1038
Message-ID: <20261124042330.XroCvlEs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-bluetooth@vger.kernel.org
TO: Kiran K <kiran.k@intel.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   ffb95458a0f70dcab620eee0ecf5ef7750971b2f
commit: 5bf3a9b6b720ff860e09b4097f97118da4f2f8f7 [95/97] Bluetooth: btintel_pcie: Serialize MAC access requests
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: alpha-randconfig-r2103-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124042330.XroCvlEs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261124042330.XroCvlEs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel_pcie.c:1038:3-13: second lock on line 1038

vim +1038 drivers/bluetooth/btintel_pcie.c

50932a1567d614 Ajaykv  2026-11-11  1000  
68e0925f16c028 Ajaykv  2026-11-11  1001  static void
68e0925f16c028 Ajaykv  2026-11-11  1002  btintel_pcie_apply_yoyo_config_sets(struct btintel_pcie_data *data,
68e0925f16c028 Ajaykv  2026-11-11  1003  				    u32 time_point)
68e0925f16c028 Ajaykv  2026-11-11  1004  {
68e0925f16c028 Ajaykv  2026-11-11  1005  	struct btintel_pcie_yoyo_config_set *config_set;
68e0925f16c028 Ajaykv  2026-11-11  1006  	resource_size_t bar0_len;
68e0925f16c028 Ajaykv  2026-11-11  1007  	int ret;
68e0925f16c028 Ajaykv  2026-11-11  1008  	u32 i;
68e0925f16c028 Ajaykv  2026-11-11  1009  
68e0925f16c028 Ajaykv  2026-11-11  1010  	if (!data)
68e0925f16c028 Ajaykv  2026-11-11  1011  		return;
68e0925f16c028 Ajaykv  2026-11-11  1012  
68e0925f16c028 Ajaykv  2026-11-11  1013  	/* Get the length of PCI BAR0 */
68e0925f16c028 Ajaykv  2026-11-11  1014  	bar0_len = pci_resource_len(data->pdev, 0);
68e0925f16c028 Ajaykv  2026-11-11  1015  
68e0925f16c028 Ajaykv  2026-11-11  1016  	if (!data->yoyo.enabled)
68e0925f16c028 Ajaykv  2026-11-11  1017  		return;
68e0925f16c028 Ajaykv  2026-11-11  1018  
68e0925f16c028 Ajaykv  2026-11-11  1019  	list_for_each_entry(config_set, &data->yoyo.config_set_list, list) {
68e0925f16c028 Ajaykv  2026-11-11  1020  		u32 pair_addr, addr, value;
68e0925f16c028 Ajaykv  2026-11-11  1021  
68e0925f16c028 Ajaykv  2026-11-11  1022  		if (config_set->time_point != time_point)
68e0925f16c028 Ajaykv  2026-11-11  1023  			continue;
68e0925f16c028 Ajaykv  2026-11-11  1024  
68e0925f16c028 Ajaykv  2026-11-11  1025  		switch (config_set->config_set_type) {
68e0925f16c028 Ajaykv  2026-11-11  1026  		case BTINTEL_PCIE_CFGSET_CSR:
68e0925f16c028 Ajaykv  2026-11-11  1027  		case BTINTEL_PCIE_CFGSET_PERIPH_MAC:
68e0925f16c028 Ajaykv  2026-11-11  1028  		case BTINTEL_PCIE_CFGSET_DEVICE_MEM:
68e0925f16c028 Ajaykv  2026-11-11  1029  			break;
68e0925f16c028 Ajaykv  2026-11-11  1030  		default:
68e0925f16c028 Ajaykv  2026-11-11  1031  			BT_WARN("YoYo: unknown/unsupported config_set type %u, skipping",
68e0925f16c028 Ajaykv  2026-11-11  1032  				config_set->config_set_type);
68e0925f16c028 Ajaykv  2026-11-11  1033  			continue;
68e0925f16c028 Ajaykv  2026-11-11  1034  		}
68e0925f16c028 Ajaykv  2026-11-11  1035  
68e0925f16c028 Ajaykv  2026-11-11  1036  		if (config_set->config_set_type == BTINTEL_PCIE_CFGSET_PERIPH_MAC ||
68e0925f16c028 Ajaykv  2026-11-11  1037  		    config_set->config_set_type == BTINTEL_PCIE_CFGSET_DEVICE_MEM) {
5bf3a9b6b720ff Kiran K 2026-11-23 @1038  			mutex_lock(&data->mac_access_lock);
68e0925f16c028 Ajaykv  2026-11-11  1039  			ret = btintel_pcie_get_mac_access(data);
68e0925f16c028 Ajaykv  2026-11-11  1040  			if (ret) {
68e0925f16c028 Ajaykv  2026-11-11  1041  				BT_WARN("YoYo: MAC access failed for config set (%d), skipping",
68e0925f16c028 Ajaykv  2026-11-11  1042  					ret);
68e0925f16c028 Ajaykv  2026-11-11  1043  				/* get_mac_access() asserts MAC_ACCESS_REQ before it
68e0925f16c028 Ajaykv  2026-11-11  1044  				 * polls, and leaves it set on timeout; drop it so the
68e0925f16c028 Ajaykv  2026-11-11  1045  				 * request bit is not leaked.
68e0925f16c028 Ajaykv  2026-11-11  1046  				 */
68e0925f16c028 Ajaykv  2026-11-11  1047  				btintel_pcie_release_mac_access(data);
5bf3a9b6b720ff Kiran K 2026-11-23  1048  				mutex_unlock(&data->mac_access_lock);
68e0925f16c028 Ajaykv  2026-11-11  1049  				continue;
68e0925f16c028 Ajaykv  2026-11-11  1050  			}
68e0925f16c028 Ajaykv  2026-11-11  1051  		}
68e0925f16c028 Ajaykv  2026-11-11  1052  
68e0925f16c028 Ajaykv  2026-11-11  1053  		for (i = 0; i < config_set->num_pairs; i++) {
68e0925f16c028 Ajaykv  2026-11-11  1054  			pair_addr = get_unaligned_le32(&config_set->pairs[i].address);
68e0925f16c028 Ajaykv  2026-11-11  1055  
68e0925f16c028 Ajaykv  2026-11-11  1056  			/* Calculate the effective address by adding the address offset */
68e0925f16c028 Ajaykv  2026-11-11  1057  			if (check_add_overflow(pair_addr, config_set->addr_offset, &addr)) {
68e0925f16c028 Ajaykv  2026-11-11  1058  				BT_WARN("YoYo: config set address overflow (0x%08x + 0x%08x)",
68e0925f16c028 Ajaykv  2026-11-11  1059  					pair_addr, config_set->addr_offset);
68e0925f16c028 Ajaykv  2026-11-11  1060  				continue;
68e0925f16c028 Ajaykv  2026-11-11  1061  			}
68e0925f16c028 Ajaykv  2026-11-11  1062  
68e0925f16c028 Ajaykv  2026-11-11  1063  			value = get_unaligned_le32(&config_set->pairs[i].value);
68e0925f16c028 Ajaykv  2026-11-11  1064  
68e0925f16c028 Ajaykv  2026-11-11  1065  			switch (config_set->config_set_type) {
68e0925f16c028 Ajaykv  2026-11-11  1066  			/* Direct Address Access (CSR) */
68e0925f16c028 Ajaykv  2026-11-11  1067  			case BTINTEL_PCIE_CFGSET_CSR:
68e0925f16c028 Ajaykv  2026-11-11  1068  				/* Validate the effective address for CSR access (Direct Address)
68e0925f16c028 Ajaykv  2026-11-11  1069  				 * addr not aligned to 4 bytes or exceeds the BAR0 length
68e0925f16c028 Ajaykv  2026-11-11  1070  				 */
68e0925f16c028 Ajaykv  2026-11-11  1071  				if ((addr & (sizeof(u32) - 1)) ||
68e0925f16c028 Ajaykv  2026-11-11  1072  				    bar0_len < sizeof(u32) ||
68e0925f16c028 Ajaykv  2026-11-11  1073  				    addr > bar0_len - sizeof(u32)) {
68e0925f16c028 Ajaykv  2026-11-11  1074  					BT_WARN("YoYo: bad CSR address 0x%08x for BAR0 length %llu",
68e0925f16c028 Ajaykv  2026-11-11  1075  						addr, (unsigned long long)bar0_len);
68e0925f16c028 Ajaykv  2026-11-11  1076  					continue;
68e0925f16c028 Ajaykv  2026-11-11  1077  				}
68e0925f16c028 Ajaykv  2026-11-11  1078  
68e0925f16c028 Ajaykv  2026-11-11  1079  				BT_DBG("YoYo: CSR write [0x%08x] = 0x%08x", addr, value);
4c7812123eaca6 Kiran K 2026-11-23  1080  				/* addr may be PRPH_DEV_* or HBUS_TARG_WRPTR */
4c7812123eaca6 Kiran K 2026-11-23  1081  				spin_lock(&data->dev_mem_lock);
68e0925f16c028 Ajaykv  2026-11-11  1082  				btintel_pcie_wr_reg32(data, addr, value);
4c7812123eaca6 Kiran K 2026-11-23  1083  				spin_unlock(&data->dev_mem_lock);
68e0925f16c028 Ajaykv  2026-11-11  1084  				break;
68e0925f16c028 Ajaykv  2026-11-11  1085  			/* Indirect Address Access (Peripheral MAC and Device Memory) */
68e0925f16c028 Ajaykv  2026-11-11  1086  			case BTINTEL_PCIE_CFGSET_PERIPH_MAC:
68e0925f16c028 Ajaykv  2026-11-11  1087  			case BTINTEL_PCIE_CFGSET_DEVICE_MEM:
68e0925f16c028 Ajaykv  2026-11-11  1088  				/* The config-set TLV comes from an untrusted external file;
68e0925f16c028 Ajaykv  2026-11-11  1089  				 * reject null or unaligned targets.
68e0925f16c028 Ajaykv  2026-11-11  1090  				 */
68e0925f16c028 Ajaykv  2026-11-11  1091  				if (!addr || (addr & (sizeof(u32) - 1))) {
68e0925f16c028 Ajaykv  2026-11-11  1092  					BT_WARN("YoYo: bad indirect address 0x%08x for type %u",
68e0925f16c028 Ajaykv  2026-11-11  1093  						addr, config_set->config_set_type);
68e0925f16c028 Ajaykv  2026-11-11  1094  					continue;
68e0925f16c028 Ajaykv  2026-11-11  1095  				}
68e0925f16c028 Ajaykv  2026-11-11  1096  
4c7812123eaca6 Kiran K 2026-11-23  1097  				btintel_pcie_wr_dev_mem(data, addr, value);
68e0925f16c028 Ajaykv  2026-11-11  1098  				BT_DBG("YoYo: indirect write type %u addr 0x%08x value 0x%08x",
68e0925f16c028 Ajaykv  2026-11-11  1099  				       config_set->config_set_type, addr, value);
68e0925f16c028 Ajaykv  2026-11-11  1100  				break;
68e0925f16c028 Ajaykv  2026-11-11  1101  			default:
68e0925f16c028 Ajaykv  2026-11-11  1102  				BT_WARN("YoYo: unknown config_set type %u",
68e0925f16c028 Ajaykv  2026-11-11  1103  					config_set->config_set_type);
68e0925f16c028 Ajaykv  2026-11-11  1104  				break;
68e0925f16c028 Ajaykv  2026-11-11  1105  			}
68e0925f16c028 Ajaykv  2026-11-11  1106  		}
68e0925f16c028 Ajaykv  2026-11-11  1107  
68e0925f16c028 Ajaykv  2026-11-11  1108  		if (config_set->config_set_type == BTINTEL_PCIE_CFGSET_PERIPH_MAC ||
5bf3a9b6b720ff Kiran K 2026-11-23  1109  		    config_set->config_set_type == BTINTEL_PCIE_CFGSET_DEVICE_MEM) {
68e0925f16c028 Ajaykv  2026-11-11  1110  			btintel_pcie_release_mac_access(data);
5bf3a9b6b720ff Kiran K 2026-11-23  1111  			mutex_unlock(&data->mac_access_lock);
5bf3a9b6b720ff Kiran K 2026-11-23  1112  		}
68e0925f16c028 Ajaykv  2026-11-11  1113  	}
68e0925f16c028 Ajaykv  2026-11-11  1114  }
68e0925f16c028 Ajaykv  2026-11-11  1115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
