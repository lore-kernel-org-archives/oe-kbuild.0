Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982F190462
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765681666; cv=none; b=uDnakvKOZNJa/HBoqNd2M+ORkoBxdeda9qMW9mxxW01UZaKKSVOsMVKqib/1yqpGNEopLB8UZcpfFqRnU0FICv42WfbFkeWAqBd5xP4XGnrIPPJyHBLRHGcJVhBLlz1FTt/yHFK6PHmqPfNunKprSpTqKETd8n0kyXZ1ae3gFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765681666; c=relaxed/simple;
	bh=t+dpMYtsKIgKhx6gt8wrx5Pm9eFbmwNAWaLRYcxL/h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kah2WTmA1KthC/mF7Q7Dyz0ay+Asyz6qUD4ygc9h2x9Uk0foCkzvjGGbPxRyvY7qzxFDPPybaLYQ9qk59ZK0XudBWnrOgvYl8fS6bkHT6Kvdl5DaEIzgpS/o2h4D7KN8b7Mnop5EEdWzLuAAEP1E2g2ircS9+vZBHTgU5xLt9qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHHXjcL3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHHXjcL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765681665; x=1797217665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+dpMYtsKIgKhx6gt8wrx5Pm9eFbmwNAWaLRYcxL/h4=;
  b=gHHXjcL3agmh8VdmLhKz4Nk7+LDy22FQNqmZTKrErXBdXH8hhFFWrwkf
   kGJTLY76uqOvwVvqLXWW2eVEefEZnRQ73lfbZ2ebccPivVk66vMBlHrcf
   ZdP0EIt+uNCHoXb45WZXYWoBaV+IMehwmdxOO3CNjJZ2DwwETkf1N1VWX
   uhnpp1QoITea5KFud9WTeLyaoobHf4q0z7WaKxwQ8X/hdNtfvYyz6k9gA
   /eETIygV7BJXfZVYmOmGoKMDx6H+RUjlYtNiHO+Nnx5wumKderhpeFG8Y
   U1ZG7YdRSDS31YHhk3DSbcekA78smwus1YweQhC0nU//Qz+1rZ7CY1sDM
   A==;
X-CSE-ConnectionGUID: LQ4+w3OeThi11yZcn0j6zg==
X-CSE-MsgGUID: RXxbN+T1Q8umqK6yXAVBng==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67668023"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67668023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:07:44 -0800
X-CSE-ConnectionGUID: CBgHzbikSwqxjk0/Ul7cug==
X-CSE-MsgGUID: PF125ZrJSHGxTPO03BS9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220810719"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 19:07:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUcSS-000000008VZ-1Fjk;
	Sun, 14 Dec 2025 03:07:40 +0000
Date: Sun, 14 Dec 2025 11:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 04/16] bitfield: Copy #define parameters to locals
Message-ID: <202512141053.j0Iw4DuX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1146:9: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251212193721.740055-5-david.laight.linux@gmail.com>
References: <20251212193721.740055-5-david.laight.linux@gmail.com>
TO: david.laight.linux@gmail.com
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: linux-kernel@vger.kernel.org
TO: linux-usb@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
TO: Crt Mori <cmo@melexis.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: Andy Shevchenko <andriy.shevchenko@intel.com>
TO: Luo Jie <quic_luoj@quicinc.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Jakub Kicinski <kuba@kernel.org>
TO: netdev@vger.kernel.org
TO: "David S . Miller" <davem@davemloft.net>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: Andreas Noever <andreas.noever@gmail.com>
TO: Yehezkel Bernat <YehezkelShB@gmail.com>
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: David Laight <david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20251212]
[cannot apply to westeri-thunderbolt/next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251213-040625
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212193721.740055-5-david.laight.linux%40gmail.com
patch subject: [PATCH v2 04/16] bitfield: Copy #define parameters to locals
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: s390-randconfig-r112-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141053.j0Iw4DuX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141053.j0Iw4DuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512141053.j0Iw4DuX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1146:9: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1163:9: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1396:9: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1397:9: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1399:9: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1404:9: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1513:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1514:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1515:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1517:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1519:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1521:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1541:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1542:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1543:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1545:33: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1833:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1834:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1958:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1959:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1979:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1980:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1981:17: sparse: sparse: invalid initializer
   drivers/net/ethernet/qualcomm/ppe/ppe_config.c:1982:17: sparse: sparse: invalid initializer

vim +1146 drivers/net/ethernet/qualcomm/ppe/ppe_config.c

7a23a8af179dac Luo Jie 2025-08-18  1111  
73d05bdaf01eb2 Luo Jie 2025-08-18  1112  /**
73d05bdaf01eb2 Luo Jie 2025-08-18  1113   * ppe_sc_config_set - Set PPE service code configuration
73d05bdaf01eb2 Luo Jie 2025-08-18  1114   * @ppe_dev: PPE device
73d05bdaf01eb2 Luo Jie 2025-08-18  1115   * @sc: Service ID, 0-255 supported by PPE
73d05bdaf01eb2 Luo Jie 2025-08-18  1116   * @cfg: Service code configuration
73d05bdaf01eb2 Luo Jie 2025-08-18  1117   *
73d05bdaf01eb2 Luo Jie 2025-08-18  1118   * PPE service code is used by the PPE during its packet processing stages,
73d05bdaf01eb2 Luo Jie 2025-08-18  1119   * to perform or bypass certain selected packet operations on the packet.
73d05bdaf01eb2 Luo Jie 2025-08-18  1120   *
73d05bdaf01eb2 Luo Jie 2025-08-18  1121   * Return: 0 on success, negative error code on failure.
73d05bdaf01eb2 Luo Jie 2025-08-18  1122   */
73d05bdaf01eb2 Luo Jie 2025-08-18  1123  int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
73d05bdaf01eb2 Luo Jie 2025-08-18  1124  {
73d05bdaf01eb2 Luo Jie 2025-08-18  1125  	u32 val, reg, servcode_val[2] = {};
73d05bdaf01eb2 Luo Jie 2025-08-18  1126  	unsigned long bitmap_value;
73d05bdaf01eb2 Luo Jie 2025-08-18  1127  	int ret;
73d05bdaf01eb2 Luo Jie 2025-08-18  1128  
73d05bdaf01eb2 Luo Jie 2025-08-18  1129  	val = FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_PORT_ID_VALID, cfg.dest_port_valid);
73d05bdaf01eb2 Luo Jie 2025-08-18  1130  	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_PORT_ID, cfg.dest_port);
73d05bdaf01eb2 Luo Jie 2025-08-18  1131  	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_DIRECTION, cfg.is_src);
73d05bdaf01eb2 Luo Jie 2025-08-18  1132  
73d05bdaf01eb2 Luo Jie 2025-08-18  1133  	bitmap_value = bitmap_read(cfg.bitmaps.egress, 0, PPE_SC_BYPASS_EGRESS_SIZE);
73d05bdaf01eb2 Luo Jie 2025-08-18  1134  	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_BYPASS_BITMAP, bitmap_value);
73d05bdaf01eb2 Luo Jie 2025-08-18  1135  	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_RX_CNT_EN,
73d05bdaf01eb2 Luo Jie 2025-08-18  1136  			  test_bit(PPE_SC_BYPASS_COUNTER_RX, cfg.bitmaps.counter));
73d05bdaf01eb2 Luo Jie 2025-08-18  1137  	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_TX_CNT_EN,
73d05bdaf01eb2 Luo Jie 2025-08-18  1138  			  test_bit(PPE_SC_BYPASS_COUNTER_TX, cfg.bitmaps.counter));
73d05bdaf01eb2 Luo Jie 2025-08-18  1139  	reg = PPE_IN_L2_SERVICE_TBL_ADDR + PPE_IN_L2_SERVICE_TBL_INC * sc;
73d05bdaf01eb2 Luo Jie 2025-08-18  1140  
73d05bdaf01eb2 Luo Jie 2025-08-18  1141  	ret = regmap_write(ppe_dev->regmap, reg, val);
73d05bdaf01eb2 Luo Jie 2025-08-18  1142  	if (ret)
73d05bdaf01eb2 Luo Jie 2025-08-18  1143  		return ret;
73d05bdaf01eb2 Luo Jie 2025-08-18  1144  
73d05bdaf01eb2 Luo Jie 2025-08-18  1145  	bitmap_value = bitmap_read(cfg.bitmaps.ingress, 0, PPE_SC_BYPASS_INGRESS_SIZE);
73d05bdaf01eb2 Luo Jie 2025-08-18 @1146  	PPE_SERVICE_SET_BYPASS_BITMAP(servcode_val, bitmap_value);
73d05bdaf01eb2 Luo Jie 2025-08-18  1147  	PPE_SERVICE_SET_RX_CNT_EN(servcode_val,
73d05bdaf01eb2 Luo Jie 2025-08-18  1148  				  test_bit(PPE_SC_BYPASS_COUNTER_RX_VLAN, cfg.bitmaps.counter));
73d05bdaf01eb2 Luo Jie 2025-08-18  1149  	reg = PPE_SERVICE_TBL_ADDR + PPE_SERVICE_TBL_INC * sc;
73d05bdaf01eb2 Luo Jie 2025-08-18  1150  
73d05bdaf01eb2 Luo Jie 2025-08-18  1151  	ret = regmap_bulk_write(ppe_dev->regmap, reg,
73d05bdaf01eb2 Luo Jie 2025-08-18  1152  				servcode_val, ARRAY_SIZE(servcode_val));
73d05bdaf01eb2 Luo Jie 2025-08-18  1153  	if (ret)
73d05bdaf01eb2 Luo Jie 2025-08-18  1154  		return ret;
73d05bdaf01eb2 Luo Jie 2025-08-18  1155  
73d05bdaf01eb2 Luo Jie 2025-08-18  1156  	reg = PPE_EG_SERVICE_TBL_ADDR + PPE_EG_SERVICE_TBL_INC * sc;
73d05bdaf01eb2 Luo Jie 2025-08-18  1157  	ret = regmap_bulk_read(ppe_dev->regmap, reg,
73d05bdaf01eb2 Luo Jie 2025-08-18  1158  			       servcode_val, ARRAY_SIZE(servcode_val));
73d05bdaf01eb2 Luo Jie 2025-08-18  1159  	if (ret)
73d05bdaf01eb2 Luo Jie 2025-08-18  1160  		return ret;
73d05bdaf01eb2 Luo Jie 2025-08-18  1161  
73d05bdaf01eb2 Luo Jie 2025-08-18  1162  	PPE_EG_SERVICE_SET_NEXT_SERVCODE(servcode_val, cfg.next_service_code);
73d05bdaf01eb2 Luo Jie 2025-08-18  1163  	PPE_EG_SERVICE_SET_UPDATE_ACTION(servcode_val, cfg.eip_field_update_bitmap);
73d05bdaf01eb2 Luo Jie 2025-08-18  1164  	PPE_EG_SERVICE_SET_HW_SERVICE(servcode_val, cfg.eip_hw_service);
73d05bdaf01eb2 Luo Jie 2025-08-18  1165  	PPE_EG_SERVICE_SET_OFFSET_SEL(servcode_val, cfg.eip_offset_sel);
73d05bdaf01eb2 Luo Jie 2025-08-18  1166  	PPE_EG_SERVICE_SET_TX_CNT_EN(servcode_val,
73d05bdaf01eb2 Luo Jie 2025-08-18  1167  				     test_bit(PPE_SC_BYPASS_COUNTER_TX_VLAN, cfg.bitmaps.counter));
73d05bdaf01eb2 Luo Jie 2025-08-18  1168  
73d05bdaf01eb2 Luo Jie 2025-08-18  1169  	ret = regmap_bulk_write(ppe_dev->regmap, reg,
73d05bdaf01eb2 Luo Jie 2025-08-18  1170  				servcode_val, ARRAY_SIZE(servcode_val));
73d05bdaf01eb2 Luo Jie 2025-08-18  1171  	if (ret)
73d05bdaf01eb2 Luo Jie 2025-08-18  1172  		return ret;
73d05bdaf01eb2 Luo Jie 2025-08-18  1173  
73d05bdaf01eb2 Luo Jie 2025-08-18  1174  	bitmap_value = bitmap_read(cfg.bitmaps.tunnel, 0, PPE_SC_BYPASS_TUNNEL_SIZE);
73d05bdaf01eb2 Luo Jie 2025-08-18  1175  	val = FIELD_PREP(PPE_TL_SERVICE_TBL_BYPASS_BITMAP, bitmap_value);
73d05bdaf01eb2 Luo Jie 2025-08-18  1176  	reg = PPE_TL_SERVICE_TBL_ADDR + PPE_TL_SERVICE_TBL_INC * sc;
73d05bdaf01eb2 Luo Jie 2025-08-18  1177  
73d05bdaf01eb2 Luo Jie 2025-08-18  1178  	return regmap_write(ppe_dev->regmap, reg, val);
73d05bdaf01eb2 Luo Jie 2025-08-18  1179  }
73d05bdaf01eb2 Luo Jie 2025-08-18  1180  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
