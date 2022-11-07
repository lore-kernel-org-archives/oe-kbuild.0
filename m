Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497223AA
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 05:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667799209; x=1699335209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PaaP+9vOPqcfDN13BJDLbqzCuchx7b9tEJjS8xPW1mk=;
  b=nm8kqWdJEOY/tKOXrC25nH2/MfUV5ut1zZ+iSXhgfWwgv2JK3sb8OPCT
   QAr0UTcGoMT6HqgzPTAia/3dkTi+xBtS/rFdHkIcM0B8aBSXB0aYkiIxp
   seMIWD8n+4wpmZ8VDhLOTGkGNA/F7Z9LnzR0n0PHxwYjOsx/tya7XXQsc
   Pi78xVpH/I29feZA0EkbfNf18gZqesCWIkF5/fmzlmSnv71p8dZEVpme7
   wDTVtYQALUG9pdBXKA06+vBtP5Q1YP6iNIK/v5kbDfhTydOsACIOGEX2t
   9nXsYfkTlM7RtnaHedTONlJBMvEIKPs0MUjGxzh1A2Q7rLWFJN99964MV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="293674940"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="293674940"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 21:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586851063"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="586851063"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2022 21:33:28 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orulD-0000N0-1i;
	Mon, 07 Nov 2022 05:33:27 +0000
Date: Mon, 7 Nov 2022 13:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block'
 shadows outer argument [shadowArgument]
Message-ID: <202211071354.QoWhF7P7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block' shadows outer argument [shadowArgument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc drm/edid: add typedef for block read function
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_modes.c:1852:16: warning: Local variable 'len' shadows outer variable [shadowVariable]
     unsigned int len = strlen(mode_option);
                  ^
   drivers/gpu/drm/drm_modes.c:1788:9: note: Shadowed declaration
    int i, len, ret;
           ^
   drivers/gpu/drm/drm_modes.c:1852:16: note: Shadow variable
     unsigned int len = strlen(mode_option);
                  ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/solomon/ssd130x.c:383:68: warning: Parameter 'buf' can be declared as pointer to const [constParameter]
   static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
                                                                      ^
--
>> drivers/gpu/drm/drm_mipi_dsi.c:307:73: warning: Parameter 'node' can be declared as pointer to const [constParameter]
   struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node)
                                                                           ^
--
>> drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block' shadows outer argument [shadowArgument]
     void *block = edid + j;
           ^
   drivers/gpu/drm/drm_edid.c:2101:0: note: Shadowed declaration
           read_block_fn read_block,
   ^
   drivers/gpu/drm/drm_edid.c:2124:9: note: Shadow variable
     void *block = edid + j;
           ^

vim +/block +2124 drivers/gpu/drm/drm_edid.c

bac9c29482248b Douglas Anderson   2021-09-14  2079  
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2080  /**
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2081   * drm_do_get_edid - get EDID data using a custom EDID block read function
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2082   * @connector: connector we're probing
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2083   * @get_edid_block: EDID block read function
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2084   * @data: private data passed to the block read function
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2085   *
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2086   * When the I2C adapter connected to the DDC bus is hidden behind a device that
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2087   * exposes a different interface to read EDID blocks this function can be used
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2088   * to get EDID data using a custom block read function.
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2089   *
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2090   * As in the general case the DDC bus is accessible by the kernel at the I2C
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2091   * level, drivers must make all reasonable efforts to expose it as an I2C
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2092   * adapter and use drm_get_edid() instead of abusing this function.
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2093   *
0ae865ef92f192 Cai Huoqing        2021-07-30  2094   * The EDID may be overridden using debugfs override_edid or firmware EDID
53fd40a90f3c0b Jani Nikula        2017-09-12  2095   * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
53fd40a90f3c0b Jani Nikula        2017-09-12  2096   * order. Having either of them bypasses actual EDID reads.
53fd40a90f3c0b Jani Nikula        2017-09-12  2097   *
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2098   * Return: Pointer to valid EDID or NULL if we couldn't find any.
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2099   */
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2100  struct edid *drm_do_get_edid(struct drm_connector *connector,
89fb7536ad2fdc Jani Nikula        2022-04-11  2101  			     read_block_fn read_block,
89fb7536ad2fdc Jani Nikula        2022-04-11  2102  			     void *context)
61e57a8d72f233 Adam Jackson       2010-03-29  2103  {
ccc97def44ecc0 Jani Nikula        2022-03-31  2104  	int j, invalid_blocks = 0;
e9a9e0768ba49d Jani Nikula        2022-03-31  2105  	struct edid *edid, *new, *override;
53fd40a90f3c0b Jani Nikula        2017-09-12  2106  
56a2b7f2a39a8d Jani Nikula        2019-06-07  2107  	override = drm_get_override_edid(connector);
56a2b7f2a39a8d Jani Nikula        2019-06-07  2108  	if (override)
53fd40a90f3c0b Jani Nikula        2017-09-12  2109  		return override;
61e57a8d72f233 Adam Jackson       2010-03-29  2110  
89fb7536ad2fdc Jani Nikula        2022-04-11  2111  	edid = drm_do_get_edid_base_block(connector, read_block, context);
e7bd95a7ed4e4c Douglas Anderson   2021-10-04  2112  	if (!edid)
61e57a8d72f233 Adam Jackson       2010-03-29  2113  		return NULL;
61e57a8d72f233 Adam Jackson       2010-03-29  2114  
ccc97def44ecc0 Jani Nikula        2022-03-31  2115  	if (edid->extensions == 0)
e9a9e0768ba49d Jani Nikula        2022-03-31  2116  		return edid;
61e57a8d72f233 Adam Jackson       2010-03-29  2117  
ccc97def44ecc0 Jani Nikula        2022-03-31  2118  	new = krealloc(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
61e57a8d72f233 Adam Jackson       2010-03-29  2119  	if (!new)
61e57a8d72f233 Adam Jackson       2010-03-29  2120  		goto out;
f14f368670541b Chris Wilson       2016-10-17  2121  	edid = new;
61e57a8d72f233 Adam Jackson       2010-03-29  2122  
e9a9e0768ba49d Jani Nikula        2022-03-31  2123  	for (j = 1; j <= edid->extensions; j++) {
e9a9e0768ba49d Jani Nikula        2022-03-31 @2124  		void *block = edid + j;
18d83450468ca5 Jani Nikula        2022-03-31  2125  		int try;
a28187ccab9410 Chris Wilson       2016-10-17  2126  
18d83450468ca5 Jani Nikula        2022-03-31  2127  		for (try = 0; try < 4; try++) {
89fb7536ad2fdc Jani Nikula        2022-04-11  2128  			if (read_block(context, block, j, EDID_LENGTH))
61e57a8d72f233 Adam Jackson       2010-03-29  2129  				goto out;
14544d0937bf01 Chris Wilson       2016-10-24  2130  			if (drm_edid_block_valid(block, j, false, NULL))
61e57a8d72f233 Adam Jackson       2010-03-29  2131  				break;
61e57a8d72f233 Adam Jackson       2010-03-29  2132  		}
f934ec8c34b9dc Maarten Lankhorst  2013-01-29  2133  
18d83450468ca5 Jani Nikula        2022-03-31  2134  		if (try == 4)
ccc97def44ecc0 Jani Nikula        2022-03-31  2135  			invalid_blocks++;
0ea75e23356f73 Sam Tygier         2010-09-23  2136  	}
0ea75e23356f73 Sam Tygier         2010-09-23  2137  
ccc97def44ecc0 Jani Nikula        2022-03-31  2138  	if (invalid_blocks) {
63cae081538de1 Jani Nikula        2022-04-11  2139  		connector_bad_edid(connector, edid, edid->extensions + 1);
14544d0937bf01 Chris Wilson       2016-10-24  2140  
ccc97def44ecc0 Jani Nikula        2022-03-31  2141  		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
61e57a8d72f233 Adam Jackson       2010-03-29  2142  	}
61e57a8d72f233 Adam Jackson       2010-03-29  2143  
e9a9e0768ba49d Jani Nikula        2022-03-31  2144  	return edid;
61e57a8d72f233 Adam Jackson       2010-03-29  2145  
61e57a8d72f233 Adam Jackson       2010-03-29  2146  out:
f14f368670541b Chris Wilson       2016-10-17  2147  	kfree(edid);
61e57a8d72f233 Adam Jackson       2010-03-29  2148  	return NULL;
61e57a8d72f233 Adam Jackson       2010-03-29  2149  }
18df89fef2d5c7 Lars-Peter Clausen 2012-04-27  2150  EXPORT_SYMBOL_GPL(drm_do_get_edid);
61e57a8d72f233 Adam Jackson       2010-03-29  2151  

:::::: The code at line 2124 was first introduced by commit
:::::: e9a9e0768ba49d9cad3b698860af1842c53c717f drm/edid: use struct edid * in drm_do_get_edid()

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
