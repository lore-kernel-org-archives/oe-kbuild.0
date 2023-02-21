Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975EDA933
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 22:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677019847; x=1708555847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vw5gLOsdnL2Jlb5hClszJyqjSL6ZOY86ANQTpIJbY28=;
  b=MmNbufg1iVNWhr26t2D8aBJ3IX0AiUKn/nTttQzJpjoXsb/T01XMAwCH
   or8IpPxQJu6laCAROgLHunso0rk6zEhLpHXGJimx9gUGIsu5ScR1mf2mg
   5Mb7ZH3QXETi6tSBSyacexzyqUk8jpsvwmb60p3okZg9K9xnpAP3Hv6yI
   L01+jIm0uKl/kdHVS7A7yle8UiMSm5Lxdi+y6qrPZ5o59RYvBWqjgR8qH
   bO60zu/4nA+GPR9ZRjJJzK3NuZ/pCPMxhshSsysAoGQusIFI6Iqc/5DxI
   UYCUdakITyoB4/rN0QqCkQYEdp5rT1S40O/RtETWa5+F5WCPWZgGMKkAq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397464490"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="397464490"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 14:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="845887900"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="845887900"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 14:50:45 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUbTA-0000JP-2w;
	Tue, 21 Feb 2023 22:50:44 +0000
Date: Wed, 22 Feb 2023 06:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block'
 shadows outer argument [shadowArgument]
Message-ID: <202302220606.WI44Ex4g-lkp@intel.com>
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
head:   1b72607d7321e66829e11148712b3a2ba1dc83e7
commit: 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc drm/edid: add typedef for block read function
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302220606.WI44Ex4g-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
https://github.com/intel/lkp-tests
