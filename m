Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAFC70830
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847606; cv=none; b=ojBIcyn0zBjUTctMAxkRqdVgxPX0UrGrcXD4Uo4dKvKfRNytFhugDKvQLdVCjVpF6sP/nTFLYGq8ZzdUsIIt9TXM/NkZqYO9wvjVGw461B6F6+CdZOWJzXrno9UkUOu6s79DLoeG0+bQGL2YrsqtxIIS20hJtyupUOK8g4lBkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847606; c=relaxed/simple;
	bh=WfOLuedcl6licLx+IZw09EDUZGhOgIGeHT/rZ+XK0JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFc5MNeEPZ9Y0TaalOxCEdmBu8rCqcsEMmqIWOqMEJ7Lwkdcq49T8I2o93tpWZEeG2QY3i0NBFTPEFGTDPug2vQdYYVtbusVjILlaQxSe17ha3ODkvpE0QHWxmabPioKOD9VOMWgT9e0Ieasdu2R0n3qv3WBqfDYGPTvs/Hx3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GepD85X9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GepD85X9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754847603; x=1786383603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfOLuedcl6licLx+IZw09EDUZGhOgIGeHT/rZ+XK0JQ=;
  b=GepD85X9LaaH1OBzJuWCmu1rLPs4C708MFoBJSwEQFgR0LnGTvzaz7Ow
   JEhzJKRUiJCSTZsk9giQJUBEzd+UA0SBA9Q224Pq2DQVn0gEiPsYopaNI
   Q0zaBrzovefqa1LTrwj1Mu5iJneBAdaN2QI713tKGufBT/VmCyZeBmWdj
   4Dbm7pdJbPxvj1Cali0elQl8zZaGKiUsM9yjCk+XVTlsro3wFEisbx6id
   UoE9QB7w/9oONMPr27/nEqQeJpnx9XcX9tyWTIu4cky+38Z4Ic0uTfYmu
   kOxJGw9DZKUH69rgb1U5cKJH9nZK0+dq+D7GaEvoHJZMw2p+PmTBZnICt
   g==;
X-CSE-ConnectionGUID: V7MpV0MBTTCSvO1bHdF7fQ==
X-CSE-MsgGUID: EWFssQHBSQuug9JUaAPNHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67380232"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67380232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 10:40:03 -0700
X-CSE-ConnectionGUID: UwqKl7PNSnu/A7PQF1kWsA==
X-CSE-MsgGUID: U8zUcpb7SkGm49565u45zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164968777"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2025 10:40:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulA1W-0005No-2z;
	Sun, 10 Aug 2025 17:39:58 +0000
Date: Mon, 11 Aug 2025 01:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] net: dsa: yt921x: Add support for Motorcomm YT921x
Message-ID: <202508110116.NWcO7Fju-lkp@intel.com>
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
In-Reply-To: <20250808173808.273774-3-mmyangfl@gmail.com>
References: <20250808173808.273774-3-mmyangfl@gmail.com>
TO: David Yang <mmyangfl@gmail.com>
TO: netdev@vger.kernel.org
CC: David Yang <mmyangfl@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master next-20250808]
[cannot apply to horms-ipvs/master v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Yang/net-dsa-tag_yt921x-add-support-for-Motorcomm-YT921x-tags/20250809-014351
base:   net/main
patch link:    https://lore.kernel.org/r/20250808173808.273774-3-mmyangfl%40gmail.com
patch subject: [PATCH 2/2] net: dsa: yt921x: Add support for Motorcomm YT921x
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r072-20250810 (https://download.01.org/0day-ci/archive/20250811/202508110116.NWcO7Fju-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508110116.NWcO7Fju-lkp@intel.com/

smatch warnings:
drivers/net/dsa/yt921x.c:1090 yt921x_dsa_setup() error: uninitialized symbol 'val'.

vim +/val +1090 drivers/net/dsa/yt921x.c

77de450829a940 David Yang 2025-08-09  1060  
77de450829a940 David Yang 2025-08-09  1061  static int yt921x_dsa_setup(struct dsa_switch *ds)
77de450829a940 David Yang 2025-08-09  1062  {
77de450829a940 David Yang 2025-08-09  1063  	struct yt921x_priv *priv = ds->priv;
77de450829a940 David Yang 2025-08-09  1064  	struct device *dev = priv->dev;
77de450829a940 David Yang 2025-08-09  1065  	struct device_node *np = dev->of_node;
77de450829a940 David Yang 2025-08-09  1066  
77de450829a940 David Yang 2025-08-09  1067  	struct device_node *child;
77de450829a940 David Yang 2025-08-09  1068  	int cpu_port;
77de450829a940 David Yang 2025-08-09  1069  	u32 val;
77de450829a940 David Yang 2025-08-09  1070  	int res;
77de450829a940 David Yang 2025-08-09  1071  
77de450829a940 David Yang 2025-08-09  1072  	res = yt921x_dsa_cpu_port(ds, &cpu_port);
77de450829a940 David Yang 2025-08-09  1073  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1074  		return res;
77de450829a940 David Yang 2025-08-09  1075  
77de450829a940 David Yang 2025-08-09  1076  	res = yt921x_detect(priv);
77de450829a940 David Yang 2025-08-09  1077  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1078  		return res;
77de450829a940 David Yang 2025-08-09  1079  
77de450829a940 David Yang 2025-08-09  1080  	/* Reset */
77de450829a940 David Yang 2025-08-09  1081  	res = yt921x_smi_write(priv, YT921X_RESETm, YT921X_RESET_HWf);
77de450829a940 David Yang 2025-08-09  1082  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1083  		return res;
77de450829a940 David Yang 2025-08-09  1084  
77de450829a940 David Yang 2025-08-09  1085  	/* YT921X_RESET_HWf is almost same as GPIO hard reset. So we need
77de450829a940 David Yang 2025-08-09  1086  	 * this delay.
77de450829a940 David Yang 2025-08-09  1087  	 */
77de450829a940 David Yang 2025-08-09  1088  	usleep_range(10000, 15000);
77de450829a940 David Yang 2025-08-09  1089  
77de450829a940 David Yang 2025-08-09 @1090  	res = read_poll_timeout(yt921x_smi_read, res, val == 0,
77de450829a940 David Yang 2025-08-09  1091  				YT921X_MDIO_SLEEP_US, YT921X_RESET_TIMEOUT_US,
77de450829a940 David Yang 2025-08-09  1092  				false, priv, YT921X_RESETm, &val);
77de450829a940 David Yang 2025-08-09  1093  	if (unlikely(res != 0)) {
77de450829a940 David Yang 2025-08-09  1094  		dev_err(dev, "Reset timeout\n");
77de450829a940 David Yang 2025-08-09  1095  		return res;
77de450829a940 David Yang 2025-08-09  1096  	}
77de450829a940 David Yang 2025-08-09  1097  
77de450829a940 David Yang 2025-08-09  1098  	/* Always register one mdio bus for the internal/default mdio bus. This
77de450829a940 David Yang 2025-08-09  1099  	 * maybe represented in the device tree, but is optional.
77de450829a940 David Yang 2025-08-09  1100  	 */
77de450829a940 David Yang 2025-08-09  1101  	child = of_get_child_by_name(np, "mdio");
77de450829a940 David Yang 2025-08-09  1102  	res = yt921x_mbus_int_init(priv, child);
77de450829a940 David Yang 2025-08-09  1103  	of_node_put(child);
77de450829a940 David Yang 2025-08-09  1104  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1105  		return res;
77de450829a940 David Yang 2025-08-09  1106  	ds->user_mii_bus = priv->mbus_int;
77de450829a940 David Yang 2025-08-09  1107  
77de450829a940 David Yang 2025-08-09  1108  	/* Walk the device tree, and see if there are any other nodes which say
77de450829a940 David Yang 2025-08-09  1109  	 * they are compatible with the external mdio bus.
77de450829a940 David Yang 2025-08-09  1110  	 */
77de450829a940 David Yang 2025-08-09  1111  	priv->mbus_ext = NULL;
77de450829a940 David Yang 2025-08-09  1112  	for_each_available_child_of_node(np, child) {
77de450829a940 David Yang 2025-08-09  1113  		if (!of_device_is_compatible(child,
77de450829a940 David Yang 2025-08-09  1114  					     "motorcomm,yt921x-mdio-external"))
77de450829a940 David Yang 2025-08-09  1115  			continue;
77de450829a940 David Yang 2025-08-09  1116  
77de450829a940 David Yang 2025-08-09  1117  		res = yt921x_mbus_ext_init(priv, child);
77de450829a940 David Yang 2025-08-09  1118  		if (unlikely(res != 0)) {
77de450829a940 David Yang 2025-08-09  1119  			of_node_put(child);
77de450829a940 David Yang 2025-08-09  1120  			return res;
77de450829a940 David Yang 2025-08-09  1121  		}
77de450829a940 David Yang 2025-08-09  1122  		break;
77de450829a940 David Yang 2025-08-09  1123  	}
77de450829a940 David Yang 2025-08-09  1124  
77de450829a940 David Yang 2025-08-09  1125  	res = yt921x_smi_acquire(priv);
77de450829a940 David Yang 2025-08-09  1126  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1127  		return res;
77de450829a940 David Yang 2025-08-09  1128  	do {
77de450829a940 David Yang 2025-08-09  1129  		/* Enable DSA */
77de450829a940 David Yang 2025-08-09  1130  		val = YT921X_EXT_CPU_PORT_TAG_ENf |
77de450829a940 David Yang 2025-08-09  1131  		      YT921X_EXT_CPU_PORT_PORT_ENf |
77de450829a940 David Yang 2025-08-09  1132  		      YT921X_EXT_CPU_PORT_PORTv(cpu_port);
77de450829a940 David Yang 2025-08-09  1133  		res = __yt921x_smi_write(priv, YT921X_EXT_CPU_PORTm, val);
77de450829a940 David Yang 2025-08-09  1134  		if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1135  			break;
77de450829a940 David Yang 2025-08-09  1136  
77de450829a940 David Yang 2025-08-09  1137  		res = __yt921x_smi_read(priv, YT921X_CPU_TAG_TPIDm, &val);
77de450829a940 David Yang 2025-08-09  1138  		if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1139  			break;
77de450829a940 David Yang 2025-08-09  1140  		priv->tag_eth_p = FIELD_GET(YT921X_CPU_TAG_TPID_TPIDf, val);
77de450829a940 David Yang 2025-08-09  1141  		if (priv->tag_eth_p != YT921X_CPU_TAG_TPID_TPIDv) {
77de450829a940 David Yang 2025-08-09  1142  			dev_warn(dev, "Tag type 0x%x != 0x%x\n",
77de450829a940 David Yang 2025-08-09  1143  				 priv->tag_eth_p, YT921X_CPU_TAG_TPID_TPIDv);
77de450829a940 David Yang 2025-08-09  1144  			/* Should we pass tag_eth_p to yt921x_xmit()?
77de450829a940 David Yang 2025-08-09  1145  			 * Nah, just enforce a fixed value for now.
77de450829a940 David Yang 2025-08-09  1146  			 */
77de450829a940 David Yang 2025-08-09  1147  			res = -EINVAL;
77de450829a940 David Yang 2025-08-09  1148  			break;
77de450829a940 David Yang 2025-08-09  1149  		}
77de450829a940 David Yang 2025-08-09  1150  
77de450829a940 David Yang 2025-08-09  1151  		/* Enable MIB */
77de450829a940 David Yang 2025-08-09  1152  		res = __yt921x_smi_set_bits(priv, YT921X_FUNCm,
77de450829a940 David Yang 2025-08-09  1153  					    YT921X_FUNC_MIBf);
77de450829a940 David Yang 2025-08-09  1154  		if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1155  			break;
77de450829a940 David Yang 2025-08-09  1156  
77de450829a940 David Yang 2025-08-09  1157  		val = YT921X_MIB_CTRL_CLEANf | YT921X_MIB_CTRL_ALL_PORTf;
77de450829a940 David Yang 2025-08-09  1158  		res = __yt921x_smi_write(priv, YT921X_MIB_CTRLm, val);
77de450829a940 David Yang 2025-08-09  1159  	} while (0);
77de450829a940 David Yang 2025-08-09  1160  	yt921x_smi_release(priv);
77de450829a940 David Yang 2025-08-09  1161  	if (unlikely(res != 0))
77de450829a940 David Yang 2025-08-09  1162  		return res;
77de450829a940 David Yang 2025-08-09  1163  
77de450829a940 David Yang 2025-08-09  1164  	return 0;
77de450829a940 David Yang 2025-08-09  1165  }
77de450829a940 David Yang 2025-08-09  1166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
