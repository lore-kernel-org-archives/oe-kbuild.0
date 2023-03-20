Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA11383
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Mar 2023 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679301457; x=1710837457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TgetXrrf5vnpCc+scgo09FHQxUUmsJv5hFa65mmddFQ=;
  b=KRg383l4ighSO/IF01sF2BmFxswVemwf4HJ9K9yDCUc1zVHoshhrWUXG
   JUpM6COclBatnH6/IvLsF84PKjM1Amzb58rHYIDa3s+sZYmSSKGMAPIy4
   RuflHBKJ8ujEef7iDjr9h0PEkHcfZ29IkU5yOx1MnpQt0mG6ou5cpCDbn
   I/gCcB+7gV+6bX4yjTezCcA07RHvhtjuFEJ2QGv6kcNpkYE4PZtnemme1
   eJ8qyPl3p0L9xIp37IjBI8IVInWxhymWsvRu/JkNWbKb+WSvjKDLeYUx+
   2/D7gNSGqKHrmsjFor9wezreCAR0hB3uJImLfTDf8eYe3FIXMZ14RxVzN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326976284"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="326976284"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 01:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="791529383"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="791529383"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2023 01:37:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peB1K-000Av8-2D;
	Mon, 20 Mar 2023 08:37:34 +0000
Date: Mon, 20 Mar 2023 16:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/rtl8192e/rtllib_rx.c:2195 rtllib_parse_info_param()
 warn: Function too hairy.  No more merges.
Message-ID: <202303201603.x91ppUmM-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303201603.x91ppUmM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303201603.x91ppUmM-lkp@intel.com/

New smatch warnings:
drivers/staging/rtl8192e/rtllib_rx.c:2195 rtllib_parse_info_param() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/staging/rtl8192e/rtllib_rx.c:512 rtllib_indicate_packets() warn: variable dereferenced before check 'sub_skb' (see line 488)
drivers/staging/rtl8192e/rtllib_rx.c:1054 rtllib_rx_get_crypt() warn: potential spectre issue 'ieee->crypt_info.crypt' [r]
drivers/staging/rtl8192e/rtllib_rx.c:1058 rtllib_rx_get_crypt() warn: possible spectre second half.  '*crypt'
drivers/staging/rtl8192e/rtllib_rx.c:1494 rtllib_rx_Monitor() error: dereferencing freed memory 'skb'

vim +2195 drivers/staging/rtl8192e/rtllib_rx.c

310852327ab3b5 Mateusz Kulikowski 2015-05-31  2020  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2021  int rtllib_parse_info_param(struct rtllib_device *ieee,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2022  		struct rtllib_info_element *info_element,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2023  		u16 length,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2024  		struct rtllib_network *network,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2025  		struct rtllib_rx_stats *stats)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2026  {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2027  	u8 i;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2028  	short offset;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2029  	u16	tmp_htcap_len = 0;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2030  	u16	tmp_htinfo_len = 0;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2031  	char rates_str[64];
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2032  	char *p;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2033  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2034  	while (length >= sizeof(*info_element)) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2035  		if (sizeof(*info_element) + info_element->len > length) {
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2036  			netdev_dbg(ieee->dev,
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2037  				   "Info elem: parse failed: info_element->len + 2 > left : info_element->len+2=%zd left=%d, id=%d.\n",
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2038  				   info_element->len + sizeof(*info_element),
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2039  				   length, info_element->id);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2040  			/* We stop processing but don't return an error here
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2041  			 * because some misbehaviour APs break this rule. ie.
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2042  			 * Orinoco AP1000.
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2043  			 */
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2044  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2045  		}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2046  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2047  		switch (info_element->id) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2048  		case MFIE_TYPE_SSID:
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2049  			if (rtllib_is_empty_essid(info_element->data,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2050  						     info_element->len)) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2051  				network->flags |= NETWORK_EMPTY_ESSID;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2052  				break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2053  			}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2054  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2055  			network->ssid_len = min(info_element->len,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2056  						(u8)IW_ESSID_MAX_SIZE);
35e33b0468ab3b Mateusz Kulikowski 2015-05-31  2057  			memcpy(network->ssid, info_element->data,
35e33b0468ab3b Mateusz Kulikowski 2015-05-31  2058  			       network->ssid_len);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2059  			if (network->ssid_len < IW_ESSID_MAX_SIZE)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2060  				memset(network->ssid + network->ssid_len, 0,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2061  				       IW_ESSID_MAX_SIZE - network->ssid_len);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2062  
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2063  			netdev_dbg(ieee->dev, "MFIE_TYPE_SSID: '%s' len=%d.\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2064  				   network->ssid, network->ssid_len);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2065  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2066  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2067  		case MFIE_TYPE_RATES:
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2068  			p = rates_str;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2069  			network->rates_len = min(info_element->len,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2070  						 MAX_RATES_LENGTH);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2071  			for (i = 0; i < network->rates_len; i++) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2072  				network->rates[i] = info_element->data[i];
39ddadf14da77c Takashi Iwai       2020-03-11  2073  				p += scnprintf(p, sizeof(rates_str) -
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2074  					      (p - rates_str), "%02X ",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2075  					      network->rates[i]);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2076  				if (rtllib_is_ofdm_rate
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2077  				    (info_element->data[i])) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2078  					network->flags |= NETWORK_HAS_OFDM;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2079  					if (info_element->data[i] &
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2080  					    RTLLIB_BASIC_RATE_MASK)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2081  						network->flags &=
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2082  						    ~NETWORK_HAS_CCK;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2083  				}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2084  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2085  				if (rtllib_is_cck_rate
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2086  				    (info_element->data[i])) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2087  					network->flags |= NETWORK_HAS_CCK;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2088  				}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2089  			}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2090  
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2091  			netdev_dbg(ieee->dev, "MFIE_TYPE_RATES: '%s' (%d)\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2092  				   rates_str, network->rates_len);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2093  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2094  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2095  		case MFIE_TYPE_RATES_EX:
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2096  			p = rates_str;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2097  			network->rates_ex_len = min(info_element->len,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2098  						    MAX_RATES_EX_LENGTH);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2099  			for (i = 0; i < network->rates_ex_len; i++) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2100  				network->rates_ex[i] = info_element->data[i];
39ddadf14da77c Takashi Iwai       2020-03-11  2101  				p += scnprintf(p, sizeof(rates_str) -
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2102  					      (p - rates_str), "%02X ",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2103  					      network->rates_ex[i]);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2104  				if (rtllib_is_ofdm_rate
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2105  				    (info_element->data[i])) {
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2106  					network->flags |= NETWORK_HAS_OFDM;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2107  					if (info_element->data[i] &
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2108  					    RTLLIB_BASIC_RATE_MASK)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2109  						network->flags &=
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2110  						    ~NETWORK_HAS_CCK;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2111  				}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2112  			}
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2113  
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2114  			netdev_dbg(ieee->dev, "MFIE_TYPE_RATES_EX: '%s' (%d)\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2115  				   rates_str, network->rates_ex_len);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2116  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2117  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2118  		case MFIE_TYPE_DS_SET:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2119  			netdev_dbg(ieee->dev, "MFIE_TYPE_DS_SET: %d\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2120  				   info_element->data[0]);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2121  			network->channel = info_element->data[0];
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2122  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2123  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2124  		case MFIE_TYPE_FH_SET:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2125  			netdev_dbg(ieee->dev, "MFIE_TYPE_FH_SET: ignored\n");
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2126  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2127  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2128  		case MFIE_TYPE_CF_SET:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2129  			netdev_dbg(ieee->dev, "MFIE_TYPE_CF_SET: ignored\n");
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2130  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2131  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2132  		case MFIE_TYPE_TIM:
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2133  			if (info_element->len < 4)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2134  				break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2135  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2136  			network->tim.tim_count = info_element->data[0];
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2137  			network->tim.tim_period = info_element->data[1];
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2138  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2139  			network->dtim_period = info_element->data[1];
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2140  			if (ieee->state != RTLLIB_LINKED)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2141  				break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2142  			network->last_dtim_sta_time = jiffies;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2143  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2144  			network->dtim_data = RTLLIB_DTIM_VALID;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2145  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2146  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2147  			if (info_element->data[2] & 1)
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2148  				network->dtim_data |= RTLLIB_DTIM_MBCAST;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2149  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2150  			offset = (info_element->data[2] >> 1)*2;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2151  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2152  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2153  			if (ieee->assoc_id < 8*offset ||
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2154  			    ieee->assoc_id > 8*(offset + info_element->len - 3))
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2155  				break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2156  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2157  			offset = (ieee->assoc_id / 8) - offset;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2158  			if (info_element->data[3 + offset] &
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2159  			   (1 << (ieee->assoc_id % 8)))
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2160  				network->dtim_data |= RTLLIB_DTIM_UCAST;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2161  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2162  			network->listen_interval = network->dtim_period;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2163  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2164  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2165  		case MFIE_TYPE_ERP:
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2166  			network->erp_value = info_element->data[0];
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2167  			network->flags |= NETWORK_HAS_ERP_VALUE;
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2168  			netdev_dbg(ieee->dev, "MFIE_TYPE_ERP_SET: %d\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2169  				   network->erp_value);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2170  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2171  		case MFIE_TYPE_IBSS_SET:
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2172  			network->atim_window = info_element->data[0];
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2173  			netdev_dbg(ieee->dev, "MFIE_TYPE_IBSS_SET: %d\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2174  				   network->atim_window);
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2175  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2176  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2177  		case MFIE_TYPE_CHALLENGE:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2178  			netdev_dbg(ieee->dev, "MFIE_TYPE_CHALLENGE: ignored\n");
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2179  			break;
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2180  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2181  		case MFIE_TYPE_GENERIC:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2182  			netdev_dbg(ieee->dev, "MFIE_TYPE_GENERIC: %d bytes\n",
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2183  				   info_element->len);
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2184  
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2185  			rtllib_parse_mife_generic(ieee, info_element, network,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2186  						  &tmp_htcap_len,
80d2579d8608f5 Mateusz Kulikowski 2015-05-31  2187  						  &tmp_htinfo_len);
94a799425eee82 Larry Finger       2011-08-23  2188  			break;
94a799425eee82 Larry Finger       2011-08-23  2189  
94a799425eee82 Larry Finger       2011-08-23  2190  		case MFIE_TYPE_RSN:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2191  			netdev_dbg(ieee->dev, "MFIE_TYPE_RSN: %d bytes\n",
94a799425eee82 Larry Finger       2011-08-23  2192  				   info_element->len);
94a799425eee82 Larry Finger       2011-08-23  2193  			network->rsn_ie_len = min(info_element->len + 2,
94a799425eee82 Larry Finger       2011-08-23  2194  						  MAX_WPA_IE_LEN);
94a799425eee82 Larry Finger       2011-08-23 @2195  			memcpy(network->rsn_ie, info_element,
94a799425eee82 Larry Finger       2011-08-23  2196  			       network->rsn_ie_len);
94a799425eee82 Larry Finger       2011-08-23  2197  			break;
94a799425eee82 Larry Finger       2011-08-23  2198  
94a799425eee82 Larry Finger       2011-08-23  2199  		case MFIE_TYPE_HT_CAP:
521a9cbdb27142 Mateusz Kulikowski 2015-05-31  2200  			netdev_dbg(ieee->dev, "MFIE_TYPE_HT_CAP: %d bytes\n",
94a799425eee82 Larry Finger       2011-08-23  2201  				   info_element->len);
94a799425eee82 Larry Finger       2011-08-23  2202  
310852327ab3b5 Mateusz Kulikowski 2015-05-31  2203  			rtllib_parse_mfie_ht_cap(info_element, network,
310852327ab3b5 Mateusz Kulikowski 2015-05-31  2204  						 &tmp_htcap_len);
94a799425eee82 Larry Finger       2011-08-23  2205  			break;
94a799425eee82 Larry Finger       2011-08-23  2206  
94a799425eee82 Larry Finger       2011-08-23  2207  
94a799425eee82 Larry Finger       2011-08-23  2208  		case MFIE_TYPE_HT_INFO:
521a9cbdb27142 Mateusz Kulikowski 2015-05-31  2209  			netdev_dbg(ieee->dev, "MFIE_TYPE_HT_INFO: %d bytes\n",
94a799425eee82 Larry Finger       2011-08-23  2210  				   info_element->len);
35e33b0468ab3b Mateusz Kulikowski 2015-05-31  2211  			tmp_htinfo_len = min_t(u8, info_element->len,
35e33b0468ab3b Mateusz Kulikowski 2015-05-31  2212  					       MAX_IE_LEN);
94a799425eee82 Larry Finger       2011-08-23  2213  			if (tmp_htinfo_len) {
2fbcd6ded92bee William Durand     2021-02-20  2214  				network->bssht.bd_ht_spec_ver = HT_SPEC_VER_IEEE;
060d3f6cb8ba57 William Durand     2021-02-20  2215  				network->bssht.bd_ht_info_len = tmp_htinfo_len >
2408ee9e3ce07d William Durand     2021-02-20  2216  					sizeof(network->bssht.bd_ht_info_buf) ?
2408ee9e3ce07d William Durand     2021-02-20  2217  					sizeof(network->bssht.bd_ht_info_buf) :
db8971b618ed96 Larry Finger       2011-08-25  2218  					tmp_htinfo_len;
2408ee9e3ce07d William Durand     2021-02-20  2219  				memcpy(network->bssht.bd_ht_info_buf,
db8971b618ed96 Larry Finger       2011-08-25  2220  				       info_element->data,
060d3f6cb8ba57 William Durand     2021-02-20  2221  				       network->bssht.bd_ht_info_len);
94a799425eee82 Larry Finger       2011-08-23  2222  			}
94a799425eee82 Larry Finger       2011-08-23  2223  			break;
94a799425eee82 Larry Finger       2011-08-23  2224  
94a799425eee82 Larry Finger       2011-08-23  2225  		case MFIE_TYPE_AIRONET:
521a9cbdb27142 Mateusz Kulikowski 2015-05-31  2226  			netdev_dbg(ieee->dev, "MFIE_TYPE_AIRONET: %d bytes\n",
94a799425eee82 Larry Finger       2011-08-23  2227  				   info_element->len);
db8971b618ed96 Larry Finger       2011-08-25  2228  			if (info_element->len > IE_CISCO_FLAG_POSITION) {
94a799425eee82 Larry Finger       2011-08-23  2229  				network->bWithAironetIE = true;
94a799425eee82 Larry Finger       2011-08-23  2230  
db8971b618ed96 Larry Finger       2011-08-25  2231  				if ((info_element->data[IE_CISCO_FLAG_POSITION]
db8971b618ed96 Larry Finger       2011-08-25  2232  				     & SUPPORT_CKIP_MIC) ||
db8971b618ed96 Larry Finger       2011-08-25  2233  				     (info_element->data[IE_CISCO_FLAG_POSITION]
db8971b618ed96 Larry Finger       2011-08-25  2234  				     & SUPPORT_CKIP_PK))
94a799425eee82 Larry Finger       2011-08-23  2235  					network->bCkipSupported = true;
94a799425eee82 Larry Finger       2011-08-23  2236  				else
94a799425eee82 Larry Finger       2011-08-23  2237  					network->bCkipSupported = false;
db8971b618ed96 Larry Finger       2011-08-25  2238  			} else {
94a799425eee82 Larry Finger       2011-08-23  2239  				network->bWithAironetIE = false;
94a799425eee82 Larry Finger       2011-08-23  2240  				network->bCkipSupported = false;
94a799425eee82 Larry Finger       2011-08-23  2241  			}
94a799425eee82 Larry Finger       2011-08-23  2242  			break;
94a799425eee82 Larry Finger       2011-08-23  2243  		case MFIE_TYPE_QOS_PARAMETER:
d69d20549be9e4 Mateusz Kulikowski 2015-03-17  2244  			netdev_err(ieee->dev,
94a799425eee82 Larry Finger       2011-08-23  2245  				   "QoS Error need to parse QOS_PARAMETER IE\n");
94a799425eee82 Larry Finger       2011-08-23  2246  			break;
94a799425eee82 Larry Finger       2011-08-23  2247  
94a799425eee82 Larry Finger       2011-08-23  2248  		case MFIE_TYPE_COUNTRY:
521a9cbdb27142 Mateusz Kulikowski 2015-05-31  2249  			netdev_dbg(ieee->dev, "MFIE_TYPE_COUNTRY: %d bytes\n",
94a799425eee82 Larry Finger       2011-08-23  2250  				   info_element->len);
db8971b618ed96 Larry Finger       2011-08-25  2251  			rtllib_extract_country_ie(ieee, info_element, network,
db8971b618ed96 Larry Finger       2011-08-25  2252  						  network->bssid);
94a799425eee82 Larry Finger       2011-08-23  2253  			break;
94a799425eee82 Larry Finger       2011-08-23  2254  /* TODO */
94a799425eee82 Larry Finger       2011-08-23  2255  		default:
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2256  			netdev_dbg(ieee->dev,
e9fea2ecb018e5 Mateusz Kulikowski 2015-05-31  2257  				   "Unsupported info element: %s (%d)\n",
94a799425eee82 Larry Finger       2011-08-23  2258  				   get_info_element_string(info_element->id),
94a799425eee82 Larry Finger       2011-08-23  2259  				   info_element->id);
94a799425eee82 Larry Finger       2011-08-23  2260  			break;
94a799425eee82 Larry Finger       2011-08-23  2261  		}
94a799425eee82 Larry Finger       2011-08-23  2262  
94a799425eee82 Larry Finger       2011-08-23  2263  		length -= sizeof(*info_element) + info_element->len;
94a799425eee82 Larry Finger       2011-08-23  2264  		info_element =
1ba6d8dc50df0b Ojaswin Mujoo      2021-05-10  2265  		    (struct rtllib_info_element *)&info_element->data[info_element->len];
94a799425eee82 Larry Finger       2011-08-23  2266  	}
94a799425eee82 Larry Finger       2011-08-23  2267  
94a799425eee82 Larry Finger       2011-08-23  2268  	if (!network->atheros_cap_exist && !network->broadcom_cap_exist &&
db8971b618ed96 Larry Finger       2011-08-25  2269  	    !network->cisco_cap_exist && !network->ralink_cap_exist &&
3f1f39fb6c4a42 William Durand     2021-02-20  2270  	    !network->bssht.bd_rt2rt_aggregation)
94a799425eee82 Larry Finger       2011-08-23  2271  		network->unknown_cap_exist = true;
94a799425eee82 Larry Finger       2011-08-23  2272  	else
94a799425eee82 Larry Finger       2011-08-23  2273  		network->unknown_cap_exist = false;
94a799425eee82 Larry Finger       2011-08-23  2274  	return 0;
94a799425eee82 Larry Finger       2011-08-23  2275  }
94a799425eee82 Larry Finger       2011-08-23  2276  

:::::: The code at line 2195 was first introduced by commit
:::::: 94a799425eee8225a1e3fbe5f473d2ef04002577 From: wlanfae <wlanfae@realtek.com> [PATCH 1/8] rtl8192e: Import new version of driver from realtek

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: Larry Finger <Larry.Finger@lwfinger.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
