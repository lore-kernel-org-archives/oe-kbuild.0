Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100A7C
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685257803; x=1716793803;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0GvVadV3Ixj3ltCyPMqoBbu6B5M8Cd+h+pNqxM9vle8=;
  b=CnissqyFsW9vjxmwKyRdydmcv2Oh7DIo8JbL5PNSEo6PfTy1qPml1lPj
   9KguYc+mIaGNlGGh51sj/jPdgr3JQwA0+Ijqlh1d8mhSJMxmby4pccFSv
   cqsKW5utlPwRTwhcssCvPO9RgexsadZSLWQHF9k6F7IGJy4XK/bQuENaR
   d+W+7o9o/mdzdHhS6UTy0vG42jLdi0CO1q0E/9YMYRBr4UTnj50S4WMYl
   F7oUz1d+AuDU+yzaR8KhPIA0WSVebaybOppCY2T3+a2M7S0OPrIjq5HLg
   R+PyXJ6wCFi+0CIkExSiFHkjzU6+auYNPriuPp/A4VdNI2L2v/bn8V/1b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420251237"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="420251237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 00:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="1035818755"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="1035818755"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 May 2023 00:09:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3AXO-000KTq-1Z;
	Sun, 28 May 2023 07:09:58 +0000
Date: Sun, 28 May 2023 15:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 07/30] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <202305281423.4OxeLtrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230522121532.86610-8-arinc.unal@arinc9.com>
References: <20230522121532.86610-8-arinc.unal@arinc9.com>
TO: arinc9.unal@gmail.com
TO: Sean Wang <sean.wang@mediatek.com>
TO: Landen Chao <Landen.Chao@mediatek.com>
TO: DENG Qingfang <dqfext@gmail.com>
TO: Daniel Golle <daniel@makrotopia.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Florian Fainelli <f.fainelli@gmail.com>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Russell King <linux@armlinux.org.uk>
CC: "Arınç ÜNAL" <arinc.unal@arinc9.com>
CC: Richard van Schagen <richard@routerhints.com>
CC: Frank Wunderlich <frank-w@public-files.de>
CC: Bartel Eerdekens <bartel.eerdekens@constell8.be>
CC: erkin.bozoglu@xeront.com
CC: mithat.guner@xeront.com
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/arinc9-unal-gmail-com/net-dsa-mt7530-add-missing-p5_interface-to-mt7530_priv-description/20230522-222600
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230522121532.86610-8-arinc.unal%40arinc9.com
patch subject: [PATCH net-next 07/30] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281423.4OxeLtrp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305281423.4OxeLtrp-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/mt7530.c:2312 mt7530_setup() error: uninitialized symbol 'interface'.

Old smatch warnings:
drivers/net/dsa/mt7530.c:455 mt7530_pad_clk_setup() error: uninitialized symbol 'ncpo1'.
drivers/net/dsa/mt7530.c:882 mt7530_set_ageing_time() error: uninitialized symbol 'age_count'.
drivers/net/dsa/mt7530.c:882 mt7530_set_ageing_time() error: uninitialized symbol 'age_unit'.

vim +/interface +2312 drivers/net/dsa/mt7530.c

ba751e28d44255 DENG Qingfang       2021-05-19  2134  
b8f126a8d54318 Sean Wang           2017-04-07  2135  static int
b8f126a8d54318 Sean Wang           2017-04-07  2136  mt7530_setup(struct dsa_switch *ds)
b8f126a8d54318 Sean Wang           2017-04-07  2137  {
b8f126a8d54318 Sean Wang           2017-04-07  2138  	struct mt7530_priv *priv = ds->priv;
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2139  	struct device_node *dn = NULL;
38f790a805609b René van Dorst      2019-09-02  2140  	struct device_node *phy_node;
38f790a805609b René van Dorst      2019-09-02  2141  	struct device_node *mac_np;
b8f126a8d54318 Sean Wang           2017-04-07  2142  	struct mt7530_dummy_poll p;
38f790a805609b René van Dorst      2019-09-02  2143  	phy_interface_t interface;
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2144  	struct dsa_port *cpu_dp;
ca366d6c889b5d René van Dorst      2019-09-02  2145  	u32 id, val;
ca366d6c889b5d René van Dorst      2019-09-02  2146  	int ret, i;
b8f126a8d54318 Sean Wang           2017-04-07  2147  
0abfd494deefdb Vivien Didelot      2017-09-20  2148  	/* The parent node of master netdev which holds the common system
b8f126a8d54318 Sean Wang           2017-04-07  2149  	 * controller also is the container for two GMACs nodes representing
b8f126a8d54318 Sean Wang           2017-04-07  2150  	 * as two netdev instances.
b8f126a8d54318 Sean Wang           2017-04-07  2151  	 */
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2152  	dsa_switch_for_each_cpu_port(cpu_dp, ds) {
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2153  		dn = cpu_dp->master->dev.of_node->parent;
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2154  		/* It doesn't matter which CPU port is found first,
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2155  		 * their masters should share the same parent OF node
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2156  		 */
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2157  		break;
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2158  	}
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2159  
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2160  	if (!dn) {
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2161  		dev_err(ds->dev, "parent OF node of DSA master not found");
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2162  		return -EINVAL;
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2163  	}
6e19bc26cccdd3 Frank Wunderlich    2022-06-10  2164  
0b69c54c74bcb6 DENG Qingfang       2021-08-04  2165  	ds->assisted_learning_on_cpu_port = true;
771c8901568dd8 DENG Qingfang       2020-12-11  2166  	ds->mtu_enforcement_ingress = true;
ddda1ac116c852 Greg Ungerer        2019-01-30  2167  
ddda1ac116c852 Greg Ungerer        2019-01-30  2168  	if (priv->id == ID_MT7530) {
b8f126a8d54318 Sean Wang           2017-04-07  2169  		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
b8f126a8d54318 Sean Wang           2017-04-07  2170  		ret = regulator_enable(priv->core_pwr);
b8f126a8d54318 Sean Wang           2017-04-07  2171  		if (ret < 0) {
b8f126a8d54318 Sean Wang           2017-04-07  2172  			dev_err(priv->dev,
b8f126a8d54318 Sean Wang           2017-04-07  2173  				"Failed to enable core power: %d\n", ret);
b8f126a8d54318 Sean Wang           2017-04-07  2174  			return ret;
b8f126a8d54318 Sean Wang           2017-04-07  2175  		}
b8f126a8d54318 Sean Wang           2017-04-07  2176  
b8f126a8d54318 Sean Wang           2017-04-07  2177  		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
b8f126a8d54318 Sean Wang           2017-04-07  2178  		ret = regulator_enable(priv->io_pwr);
b8f126a8d54318 Sean Wang           2017-04-07  2179  		if (ret < 0) {
b8f126a8d54318 Sean Wang           2017-04-07  2180  			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
b8f126a8d54318 Sean Wang           2017-04-07  2181  				ret);
b8f126a8d54318 Sean Wang           2017-04-07  2182  			return ret;
b8f126a8d54318 Sean Wang           2017-04-07  2183  		}
ddda1ac116c852 Greg Ungerer        2019-01-30  2184  	}
b8f126a8d54318 Sean Wang           2017-04-07  2185  
b8f126a8d54318 Sean Wang           2017-04-07  2186  	/* Reset whole chip through gpio pin or memory-mapped registers for
b8f126a8d54318 Sean Wang           2017-04-07  2187  	 * different type of hardware
b8f126a8d54318 Sean Wang           2017-04-07  2188  	 */
b8f126a8d54318 Sean Wang           2017-04-07  2189  	if (priv->mcm) {
b8f126a8d54318 Sean Wang           2017-04-07  2190  		reset_control_assert(priv->rstc);
b8f126a8d54318 Sean Wang           2017-04-07  2191  		usleep_range(1000, 1100);
b8f126a8d54318 Sean Wang           2017-04-07  2192  		reset_control_deassert(priv->rstc);
b8f126a8d54318 Sean Wang           2017-04-07  2193  	} else {
b8f126a8d54318 Sean Wang           2017-04-07  2194  		gpiod_set_value_cansleep(priv->reset, 0);
b8f126a8d54318 Sean Wang           2017-04-07  2195  		usleep_range(1000, 1100);
b8f126a8d54318 Sean Wang           2017-04-07  2196  		gpiod_set_value_cansleep(priv->reset, 1);
b8f126a8d54318 Sean Wang           2017-04-07  2197  	}
b8f126a8d54318 Sean Wang           2017-04-07  2198  
b8f126a8d54318 Sean Wang           2017-04-07  2199  	/* Waiting for MT7530 got to stable */
b8f126a8d54318 Sean Wang           2017-04-07  2200  	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_HWTRAP);
b8f126a8d54318 Sean Wang           2017-04-07  2201  	ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
b8f126a8d54318 Sean Wang           2017-04-07  2202  				 20, 1000000);
b8f126a8d54318 Sean Wang           2017-04-07  2203  	if (ret < 0) {
b8f126a8d54318 Sean Wang           2017-04-07  2204  		dev_err(priv->dev, "reset timeout\n");
b8f126a8d54318 Sean Wang           2017-04-07  2205  		return ret;
b8f126a8d54318 Sean Wang           2017-04-07  2206  	}
b8f126a8d54318 Sean Wang           2017-04-07  2207  
b8f126a8d54318 Sean Wang           2017-04-07  2208  	id = mt7530_read(priv, MT7530_CREV);
b8f126a8d54318 Sean Wang           2017-04-07  2209  	id >>= CHIP_NAME_SHIFT;
b8f126a8d54318 Sean Wang           2017-04-07  2210  	if (id != MT7530_ID) {
b8f126a8d54318 Sean Wang           2017-04-07  2211  		dev_err(priv->dev, "chip %x can't be supported\n", id);
b8f126a8d54318 Sean Wang           2017-04-07  2212  		return -ENODEV;
b8f126a8d54318 Sean Wang           2017-04-07  2213  	}
b8f126a8d54318 Sean Wang           2017-04-07  2214  
b8f126a8d54318 Sean Wang           2017-04-07  2215  	/* Reset the switch through internal reset */
b8f126a8d54318 Sean Wang           2017-04-07  2216  	mt7530_write(priv, MT7530_SYS_CTRL,
b8f126a8d54318 Sean Wang           2017-04-07  2217  		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
b8f126a8d54318 Sean Wang           2017-04-07  2218  		     SYS_CTRL_REG_RST);
b8f126a8d54318 Sean Wang           2017-04-07  2219  
c8b8a3c601f2cf Vladimir Oltean     2023-03-07  2220  	mt7530_pll_setup(priv);
c8b8a3c601f2cf Vladimir Oltean     2023-03-07  2221  
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2222  	/* Lower Tx driving for TRGMII path */
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2223  	for (i = 0; i < NUM_TRGMII_CTRL; i++)
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2224  		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2225  			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2226  
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2227  	for (i = 0; i < NUM_TRGMII_CTRL; i++)
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2228  		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2229  			   RD_TAP_MASK, RD_TAP(16));
fdcc8ccd823740 Arınç ÜNAL          2023-03-20  2230  
feb03fd11c5616 Arınç ÜNAL          2023-03-10  2231  	/* Enable port 6 */
b8f126a8d54318 Sean Wang           2017-04-07  2232  	val = mt7530_read(priv, MT7530_MHWTRAP);
b8f126a8d54318 Sean Wang           2017-04-07  2233  	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
b8f126a8d54318 Sean Wang           2017-04-07  2234  	val |= MHWTRAP_MANUAL;
b8f126a8d54318 Sean Wang           2017-04-07  2235  	mt7530_write(priv, MT7530_MHWTRAP, val);
b8f126a8d54318 Sean Wang           2017-04-07  2236  
ca366d6c889b5d René van Dorst      2019-09-02  2237  	priv->p6_interface = PHY_INTERFACE_MODE_NA;
ca366d6c889b5d René van Dorst      2019-09-02  2238  
b8f126a8d54318 Sean Wang           2017-04-07  2239  	/* Enable and reset MIB counters */
b8f126a8d54318 Sean Wang           2017-04-07  2240  	mt7530_mib_reset(ds);
b8f126a8d54318 Sean Wang           2017-04-07  2241  
b8f126a8d54318 Sean Wang           2017-04-07  2242  	for (i = 0; i < MT7530_NUM_PORTS; i++) {
b8f126a8d54318 Sean Wang           2017-04-07  2243  		/* Disable forwarding by default on all ports */
b8f126a8d54318 Sean Wang           2017-04-07  2244  		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
b8f126a8d54318 Sean Wang           2017-04-07  2245  			   PCR_MATRIX_CLR);
b8f126a8d54318 Sean Wang           2017-04-07  2246  
0b69c54c74bcb6 DENG Qingfang       2021-08-04  2247  		/* Disable learning by default on all ports */
0b69c54c74bcb6 DENG Qingfang       2021-08-04  2248  		mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
0b69c54c74bcb6 DENG Qingfang       2021-08-04  2249  
0ce0c3cd223950 Alex Dewar          2020-09-19  2250  		if (dsa_is_cpu_port(ds, i)) {
0ce0c3cd223950 Alex Dewar          2020-09-19  2251  			ret = mt753x_cpu_port_enable(ds, i);
0ce0c3cd223950 Alex Dewar          2020-09-19  2252  			if (ret)
0ce0c3cd223950 Alex Dewar          2020-09-19  2253  				return ret;
5a30833b9a16f8 DENG Qingfang       2021-03-16  2254  		} else {
75104db0cb353e Andrew Lunn         2019-02-24  2255  			mt7530_port_disable(ds, i);
6087175b7991a9 DENG Qingfang       2021-08-04  2256  
6087175b7991a9 DENG Qingfang       2021-08-04  2257  			/* Set default PVID to 0 on all user ports */
6087175b7991a9 DENG Qingfang       2021-08-04  2258  			mt7530_rmw(priv, MT7530_PPBV1_P(i), G0_PORT_VID_MASK,
6087175b7991a9 DENG Qingfang       2021-08-04  2259  				   G0_PORT_VID_DEF);
5a30833b9a16f8 DENG Qingfang       2021-03-16  2260  		}
e045124e93995f DENG Qingfang       2020-04-14  2261  		/* Enable consistent egress tag */
e045124e93995f DENG Qingfang       2020-04-14  2262  		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
e045124e93995f DENG Qingfang       2020-04-14  2263  			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
b8f126a8d54318 Sean Wang           2017-04-07  2264  	}
b8f126a8d54318 Sean Wang           2017-04-07  2265  
1ca8a193cade7f DENG Qingfang       2021-08-25  2266  	/* Setup VLAN ID 0 for VLAN-unaware bridges */
1ca8a193cade7f DENG Qingfang       2021-08-25  2267  	ret = mt7530_setup_vlan0(priv);
1ca8a193cade7f DENG Qingfang       2021-08-25  2268  	if (ret)
1ca8a193cade7f DENG Qingfang       2021-08-25  2269  		return ret;
1ca8a193cade7f DENG Qingfang       2021-08-25  2270  
38f790a805609b René van Dorst      2019-09-02  2271  	/* Setup port 5 */
38f790a805609b René van Dorst      2019-09-02  2272  	if (!dsa_is_unused_port(ds, 5)) {
38f790a805609b René van Dorst      2019-09-02  2273  		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
38f790a805609b René van Dorst      2019-09-02  2274  	} else {
c3e7e1e262d68b Arınç ÜNAL          2023-05-22  2275  		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
c3e7e1e262d68b Arınç ÜNAL          2023-05-22  2276  		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
c3e7e1e262d68b Arınç ÜNAL          2023-05-22  2277  		 * is detected.
c3e7e1e262d68b Arınç ÜNAL          2023-05-22  2278  		 */
38f790a805609b René van Dorst      2019-09-02  2279  		for_each_child_of_node(dn, mac_np) {
38f790a805609b René van Dorst      2019-09-02  2280  			if (!of_device_is_compatible(mac_np,
38f790a805609b René van Dorst      2019-09-02  2281  						     "mediatek,eth-mac"))
38f790a805609b René van Dorst      2019-09-02  2282  				continue;
38f790a805609b René van Dorst      2019-09-02  2283  
38f790a805609b René van Dorst      2019-09-02  2284  			ret = of_property_read_u32(mac_np, "reg", &id);
38f790a805609b René van Dorst      2019-09-02  2285  			if (ret < 0 || id != 1)
38f790a805609b René van Dorst      2019-09-02  2286  				continue;
38f790a805609b René van Dorst      2019-09-02  2287  
38f790a805609b René van Dorst      2019-09-02  2288  			phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
0452800f6db4ed Chuanhong Guo       2020-04-03  2289  			if (!phy_node)
0452800f6db4ed Chuanhong Guo       2020-04-03  2290  				continue;
0452800f6db4ed Chuanhong Guo       2020-04-03  2291  
38f790a805609b René van Dorst      2019-09-02  2292  			if (phy_node->parent == priv->dev->of_node->parent) {
0c65b2b90d13c1 Andrew Lunn         2019-11-04  2293  				ret = of_get_phy_mode(mac_np, &interface);
8e4efd4706f77d Sumera Priyadarsini 2020-08-25  2294  				if (ret && ret != -ENODEV) {
8e4efd4706f77d Sumera Priyadarsini 2020-08-25  2295  					of_node_put(mac_np);
a9e9b091a1c14e Yang Yingliang      2022-04-28  2296  					of_node_put(phy_node);
0c65b2b90d13c1 Andrew Lunn         2019-11-04  2297  					return ret;
8e4efd4706f77d Sumera Priyadarsini 2020-08-25  2298  				}
38f790a805609b René van Dorst      2019-09-02  2299  				id = of_mdio_parse_addr(ds->dev, phy_node);
38f790a805609b René van Dorst      2019-09-02  2300  				if (id == 0)
38f790a805609b René van Dorst      2019-09-02  2301  					priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
38f790a805609b René van Dorst      2019-09-02  2302  				if (id == 4)
38f790a805609b René van Dorst      2019-09-02  2303  					priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
38f790a805609b René van Dorst      2019-09-02  2304  			}
8e4efd4706f77d Sumera Priyadarsini 2020-08-25  2305  			of_node_put(mac_np);
38f790a805609b René van Dorst      2019-09-02  2306  			of_node_put(phy_node);
38f790a805609b René van Dorst      2019-09-02  2307  			break;
38f790a805609b René van Dorst      2019-09-02  2308  		}
c3e7e1e262d68b Arınç ÜNAL          2023-05-22  2309  
126b40a8f2df19 Arınç ÜNAL          2023-05-22  2310  		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
126b40a8f2df19 Arınç ÜNAL          2023-05-22  2311  		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
c3e7e1e262d68b Arınç ÜNAL          2023-05-22 @2312  			mt7530_setup_port5(ds, interface);
38f790a805609b René van Dorst      2019-09-02  2313  	}
38f790a805609b René van Dorst      2019-09-02  2314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
