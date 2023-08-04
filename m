Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC284253A8
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691192581; x=1722728581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rz2iErD1KcQKj5LxDjkX1L6fdc5Sh4xXt7S8T4Kb3GM=;
  b=F0iV7raPQlkSWg4X97KgU4fLfT6itdxcHYdr+HSrLKqFF515ksoTxLAh
   jF3KxhtQlzzPunBs/4DMvJoHZ1FK/aBsYGaQLTx5+BF2bR3xnVOpurIr7
   zUlS09ccY4cAjIRznY/vabOZ+jRowjrUFYyRFmYeIrGpK28o4PnLKdpgr
   r4IJamFYZSJbjwSGmvoCRVX0qUxd2kReUOJDyXFq3tpzRKQCGZaQKe+gA
   e42wPSgT+7QtnDoX7sB4/XtaK3V8waToT5M4jpPKD0tGkY0dCT9cOHAJF
   EGhVLfVTKk6vToVA3plVCASm9ReolHW9q0ZUVOIwSvq8nB7v9fevU3Prl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373925220"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="373925220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853989510"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="853989510"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 16:42:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS4Rc-0003CQ-23;
	Fri, 04 Aug 2023 23:42:56 +0000
Date: Sat, 5 Aug 2023 07:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050753.i1OaY1Fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/wireless/reg.c:1911:17: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-i061-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050753.i1OaY1Fl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050753.i1OaY1Fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050753.i1OaY1Fl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/wireless/reg.c:1911:17: sparse: sparse: too long token expansion
>> net/wireless/reg.c:1911:17: sparse: sparse: too long token expansion
--
   drivers/firmware/edd.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/firmware/edd.c:717:16: sparse: sparse: too long token expansion
--
>> drivers/hid/hid-u2fzero.c:230:25: sparse: sparse: too long token expansion
>> drivers/hid/hid-u2fzero.c:230:25: sparse: sparse: too long token expansion
--
>> drivers/hwmon/nzxt-smart2.c:218:16: sparse: sparse: too long token expansion
>> drivers/hwmon/nzxt-smart2.c:218:16: sparse: sparse: too long token expansion

vim +1911 net/wireless/reg.c

8318d78a44d49a Johannes Berg 2008-01-24  1832  
12adee3c467dd3 Markus Theil  2020-08-03  1833  static void handle_channel_adjacent_rules(struct wiphy *wiphy,
12adee3c467dd3 Markus Theil  2020-08-03  1834  					  enum nl80211_reg_initiator initiator,
12adee3c467dd3 Markus Theil  2020-08-03  1835  					  struct ieee80211_channel *chan,
12adee3c467dd3 Markus Theil  2020-08-03  1836  					  u32 flags,
12adee3c467dd3 Markus Theil  2020-08-03  1837  					  struct regulatory_request *lr,
12adee3c467dd3 Markus Theil  2020-08-03  1838  					  struct wiphy *request_wiphy,
12adee3c467dd3 Markus Theil  2020-08-03  1839  					  const struct ieee80211_reg_rule *rrule1,
12adee3c467dd3 Markus Theil  2020-08-03  1840  					  const struct ieee80211_reg_rule *rrule2,
12adee3c467dd3 Markus Theil  2020-08-03  1841  					  struct ieee80211_freq_range *comb_range)
12adee3c467dd3 Markus Theil  2020-08-03  1842  {
12adee3c467dd3 Markus Theil  2020-08-03  1843  	u32 bw_flags1 = 0;
12adee3c467dd3 Markus Theil  2020-08-03  1844  	u32 bw_flags2 = 0;
12adee3c467dd3 Markus Theil  2020-08-03  1845  	const struct ieee80211_power_rule *power_rule1 = NULL;
12adee3c467dd3 Markus Theil  2020-08-03  1846  	const struct ieee80211_power_rule *power_rule2 = NULL;
12adee3c467dd3 Markus Theil  2020-08-03  1847  	const struct ieee80211_regdomain *regd;
12adee3c467dd3 Markus Theil  2020-08-03  1848  
12adee3c467dd3 Markus Theil  2020-08-03  1849  	regd = reg_get_regdomain(wiphy);
12adee3c467dd3 Markus Theil  2020-08-03  1850  
12adee3c467dd3 Markus Theil  2020-08-03  1851  	power_rule1 = &rrule1->power_rule;
12adee3c467dd3 Markus Theil  2020-08-03  1852  	power_rule2 = &rrule2->power_rule;
12adee3c467dd3 Markus Theil  2020-08-03  1853  	bw_flags1 = reg_rule_to_chan_bw_flags(regd, rrule1, chan);
12adee3c467dd3 Markus Theil  2020-08-03  1854  	bw_flags2 = reg_rule_to_chan_bw_flags(regd, rrule2, chan);
12adee3c467dd3 Markus Theil  2020-08-03  1855  
12adee3c467dd3 Markus Theil  2020-08-03  1856  	if (lr->initiator == NL80211_REGDOM_SET_BY_DRIVER &&
12adee3c467dd3 Markus Theil  2020-08-03  1857  	    request_wiphy && request_wiphy == wiphy &&
12adee3c467dd3 Markus Theil  2020-08-03  1858  	    request_wiphy->regulatory_flags & REGULATORY_STRICT_REG) {
12adee3c467dd3 Markus Theil  2020-08-03  1859  		/* This guarantees the driver's requested regulatory domain
12adee3c467dd3 Markus Theil  2020-08-03  1860  		 * will always be used as a base for further regulatory
12adee3c467dd3 Markus Theil  2020-08-03  1861  		 * settings
12adee3c467dd3 Markus Theil  2020-08-03  1862  		 */
12adee3c467dd3 Markus Theil  2020-08-03  1863  		chan->flags =
12adee3c467dd3 Markus Theil  2020-08-03  1864  			map_regdom_flags(rrule1->flags) |
12adee3c467dd3 Markus Theil  2020-08-03  1865  			map_regdom_flags(rrule2->flags) |
12adee3c467dd3 Markus Theil  2020-08-03  1866  			bw_flags1 |
12adee3c467dd3 Markus Theil  2020-08-03  1867  			bw_flags2;
12adee3c467dd3 Markus Theil  2020-08-03  1868  		chan->orig_flags = chan->flags;
12adee3c467dd3 Markus Theil  2020-08-03  1869  		chan->max_antenna_gain =
12adee3c467dd3 Markus Theil  2020-08-03  1870  			min_t(int, MBI_TO_DBI(power_rule1->max_antenna_gain),
12adee3c467dd3 Markus Theil  2020-08-03  1871  			      MBI_TO_DBI(power_rule2->max_antenna_gain));
12adee3c467dd3 Markus Theil  2020-08-03  1872  		chan->orig_mag = chan->max_antenna_gain;
12adee3c467dd3 Markus Theil  2020-08-03  1873  		chan->max_reg_power =
12adee3c467dd3 Markus Theil  2020-08-03  1874  			min_t(int, MBM_TO_DBM(power_rule1->max_eirp),
12adee3c467dd3 Markus Theil  2020-08-03  1875  			      MBM_TO_DBM(power_rule2->max_eirp));
12adee3c467dd3 Markus Theil  2020-08-03  1876  		chan->max_power = chan->max_reg_power;
12adee3c467dd3 Markus Theil  2020-08-03  1877  		chan->orig_mpwr = chan->max_reg_power;
12adee3c467dd3 Markus Theil  2020-08-03  1878  
12adee3c467dd3 Markus Theil  2020-08-03  1879  		if (chan->flags & IEEE80211_CHAN_RADAR) {
12adee3c467dd3 Markus Theil  2020-08-03  1880  			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
12adee3c467dd3 Markus Theil  2020-08-03  1881  			if (rrule1->dfs_cac_ms || rrule2->dfs_cac_ms)
12adee3c467dd3 Markus Theil  2020-08-03  1882  				chan->dfs_cac_ms = max_t(unsigned int,
12adee3c467dd3 Markus Theil  2020-08-03  1883  							 rrule1->dfs_cac_ms,
12adee3c467dd3 Markus Theil  2020-08-03  1884  							 rrule2->dfs_cac_ms);
12adee3c467dd3 Markus Theil  2020-08-03  1885  		}
12adee3c467dd3 Markus Theil  2020-08-03  1886  
12adee3c467dd3 Markus Theil  2020-08-03  1887  		return;
12adee3c467dd3 Markus Theil  2020-08-03  1888  	}
12adee3c467dd3 Markus Theil  2020-08-03  1889  
12adee3c467dd3 Markus Theil  2020-08-03  1890  	chan->dfs_state = NL80211_DFS_USABLE;
12adee3c467dd3 Markus Theil  2020-08-03  1891  	chan->dfs_state_entered = jiffies;
12adee3c467dd3 Markus Theil  2020-08-03  1892  
12adee3c467dd3 Markus Theil  2020-08-03  1893  	chan->beacon_found = false;
12adee3c467dd3 Markus Theil  2020-08-03  1894  	chan->flags = flags | bw_flags1 | bw_flags2 |
12adee3c467dd3 Markus Theil  2020-08-03  1895  		      map_regdom_flags(rrule1->flags) |
12adee3c467dd3 Markus Theil  2020-08-03  1896  		      map_regdom_flags(rrule2->flags);
12adee3c467dd3 Markus Theil  2020-08-03  1897  
12adee3c467dd3 Markus Theil  2020-08-03  1898  	/* reg_rule_to_chan_bw_flags may forbids 10 and forbids 20 MHz
12adee3c467dd3 Markus Theil  2020-08-03  1899  	 * (otherwise no adj. rule case), recheck therefore
12adee3c467dd3 Markus Theil  2020-08-03  1900  	 */
12adee3c467dd3 Markus Theil  2020-08-03  1901  	if (cfg80211_does_bw_fit_range(comb_range,
12adee3c467dd3 Markus Theil  2020-08-03  1902  				       ieee80211_channel_to_khz(chan),
12adee3c467dd3 Markus Theil  2020-08-03  1903  				       MHZ_TO_KHZ(10)))
12adee3c467dd3 Markus Theil  2020-08-03  1904  		chan->flags &= ~IEEE80211_CHAN_NO_10MHZ;
12adee3c467dd3 Markus Theil  2020-08-03  1905  	if (cfg80211_does_bw_fit_range(comb_range,
12adee3c467dd3 Markus Theil  2020-08-03  1906  				       ieee80211_channel_to_khz(chan),
12adee3c467dd3 Markus Theil  2020-08-03  1907  				       MHZ_TO_KHZ(20)))
12adee3c467dd3 Markus Theil  2020-08-03  1908  		chan->flags &= ~IEEE80211_CHAN_NO_20MHZ;
12adee3c467dd3 Markus Theil  2020-08-03  1909  
12adee3c467dd3 Markus Theil  2020-08-03  1910  	chan->max_antenna_gain =
12adee3c467dd3 Markus Theil  2020-08-03 @1911  		min_t(int, chan->orig_mag,
12adee3c467dd3 Markus Theil  2020-08-03  1912  		      min_t(int,
12adee3c467dd3 Markus Theil  2020-08-03  1913  			    MBI_TO_DBI(power_rule1->max_antenna_gain),
12adee3c467dd3 Markus Theil  2020-08-03  1914  			    MBI_TO_DBI(power_rule2->max_antenna_gain)));
12adee3c467dd3 Markus Theil  2020-08-03  1915  	chan->max_reg_power = min_t(int,
12adee3c467dd3 Markus Theil  2020-08-03  1916  				    MBM_TO_DBM(power_rule1->max_eirp),
12adee3c467dd3 Markus Theil  2020-08-03  1917  				    MBM_TO_DBM(power_rule2->max_eirp));
12adee3c467dd3 Markus Theil  2020-08-03  1918  
12adee3c467dd3 Markus Theil  2020-08-03  1919  	if (chan->flags & IEEE80211_CHAN_RADAR) {
12adee3c467dd3 Markus Theil  2020-08-03  1920  		if (rrule1->dfs_cac_ms || rrule2->dfs_cac_ms)
12adee3c467dd3 Markus Theil  2020-08-03  1921  			chan->dfs_cac_ms = max_t(unsigned int,
12adee3c467dd3 Markus Theil  2020-08-03  1922  						 rrule1->dfs_cac_ms,
12adee3c467dd3 Markus Theil  2020-08-03  1923  						 rrule2->dfs_cac_ms);
12adee3c467dd3 Markus Theil  2020-08-03  1924  		else
12adee3c467dd3 Markus Theil  2020-08-03  1925  			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
12adee3c467dd3 Markus Theil  2020-08-03  1926  	}
12adee3c467dd3 Markus Theil  2020-08-03  1927  
12adee3c467dd3 Markus Theil  2020-08-03  1928  	if (chan->orig_mpwr) {
12adee3c467dd3 Markus Theil  2020-08-03  1929  		/* Devices that use REGULATORY_COUNTRY_IE_FOLLOW_POWER
12adee3c467dd3 Markus Theil  2020-08-03  1930  		 * will always follow the passed country IE power settings.
12adee3c467dd3 Markus Theil  2020-08-03  1931  		 */
12adee3c467dd3 Markus Theil  2020-08-03  1932  		if (initiator == NL80211_REGDOM_SET_BY_COUNTRY_IE &&
12adee3c467dd3 Markus Theil  2020-08-03  1933  		    wiphy->regulatory_flags & REGULATORY_COUNTRY_IE_FOLLOW_POWER)
12adee3c467dd3 Markus Theil  2020-08-03  1934  			chan->max_power = chan->max_reg_power;
12adee3c467dd3 Markus Theil  2020-08-03  1935  		else
12adee3c467dd3 Markus Theil  2020-08-03  1936  			chan->max_power = min(chan->orig_mpwr,
12adee3c467dd3 Markus Theil  2020-08-03  1937  					      chan->max_reg_power);
12adee3c467dd3 Markus Theil  2020-08-03  1938  	} else {
12adee3c467dd3 Markus Theil  2020-08-03  1939  		chan->max_power = chan->max_reg_power;
12adee3c467dd3 Markus Theil  2020-08-03  1940  	}
12adee3c467dd3 Markus Theil  2020-08-03  1941  }
12adee3c467dd3 Markus Theil  2020-08-03  1942  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
