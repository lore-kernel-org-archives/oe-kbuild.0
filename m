Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C5F640
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jan 2023 06:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673589970; x=1705125970;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZzKLR29WQb2begikZ3BH+E2+99rzvpCv2smvedAAIoU=;
  b=bhdjv4C3ALLfI8AXQHsYOr12qL5bvB7GzamyQOxPC3zL2D+iYWh/vFp8
   X7XO6rLa4YBSQPUb9fI7KyU+YRq+NVxR8hQcjhBD8TV8Co0HlJHl+PEYM
   UQZkOntM1OZsWXZ51vfXZkGtdH6tuczxGYgviBFU+VIPw7LhCi4jI+dQZ
   3oq+i8XOnq1PrTawJ3Qm1XyjlQgmXW5oLQJ1lQrvyX5fCHWDn0HQoQuO6
   6MsKWhBRlxi2D1/zchII496rhPiXIHI02kQbpfVUjoR2x5By0X7sINPCe
   eWbeQfg9x+Xv8Woyb6BiOGOU32n8C0Kk868//wQzMPVz35//5O5LCfDEP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="321620649"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="321620649"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 22:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="831975222"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; 
   d="scan'208";a="831975222"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2023 22:06:08 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGDCZ-000Ao4-27;
	Fri, 13 Jan 2023 06:06:07 +0000
Date: Fri, 13 Jan 2023 14:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block'
 shadows outer argument [shadowArgument]
Message-ID: <202301131332.OEs9bR0g-lkp@intel.com>
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
head:   d9fc1511728c15df49ff18e49a494d00f78b7cd4
commit: 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc drm/edid: add typedef for block read function
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


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

bac9c29482248b0 Douglas Anderson   2021-09-14  2079  
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2080  /**
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2081   * drm_do_get_edid - get EDID data using a custom EDID block read function
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2082   * @connector: connector we're probing
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2083   * @get_edid_block: EDID block read function
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2084   * @data: private data passed to the block read function
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2085   *
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2086   * When the I2C adapter connected to the DDC bus is hidden behind a device that
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2087   * exposes a different interface to read EDID blocks this function can be used
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2088   * to get EDID data using a custom block read function.
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2089   *
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2090   * As in the general case the DDC bus is accessible by the kernel at the I2C
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2091   * level, drivers must make all reasonable efforts to expose it as an I2C
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2092   * adapter and use drm_get_edid() instead of abusing this function.
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2093   *
0ae865ef92f1920 Cai Huoqing        2021-07-30  2094   * The EDID may be overridden using debugfs override_edid or firmware EDID
53fd40a90f3c0bd Jani Nikula        2017-09-12  2095   * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
53fd40a90f3c0bd Jani Nikula        2017-09-12  2096   * order. Having either of them bypasses actual EDID reads.
53fd40a90f3c0bd Jani Nikula        2017-09-12  2097   *
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2098   * Return: Pointer to valid EDID or NULL if we couldn't find any.
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2099   */
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2100  struct edid *drm_do_get_edid(struct drm_connector *connector,
89fb7536ad2fdcd Jani Nikula        2022-04-11  2101  			     read_block_fn read_block,
89fb7536ad2fdcd Jani Nikula        2022-04-11  2102  			     void *context)
61e57a8d72f2336 Adam Jackson       2010-03-29  2103  {
ccc97def44ecc08 Jani Nikula        2022-03-31  2104  	int j, invalid_blocks = 0;
e9a9e0768ba49d9 Jani Nikula        2022-03-31  2105  	struct edid *edid, *new, *override;
53fd40a90f3c0bd Jani Nikula        2017-09-12  2106  
56a2b7f2a39a8d4 Jani Nikula        2019-06-07  2107  	override = drm_get_override_edid(connector);
56a2b7f2a39a8d4 Jani Nikula        2019-06-07  2108  	if (override)
53fd40a90f3c0bd Jani Nikula        2017-09-12  2109  		return override;
61e57a8d72f2336 Adam Jackson       2010-03-29  2110  
89fb7536ad2fdcd Jani Nikula        2022-04-11  2111  	edid = drm_do_get_edid_base_block(connector, read_block, context);
e7bd95a7ed4e4c8 Douglas Anderson   2021-10-04  2112  	if (!edid)
61e57a8d72f2336 Adam Jackson       2010-03-29  2113  		return NULL;
61e57a8d72f2336 Adam Jackson       2010-03-29  2114  
ccc97def44ecc08 Jani Nikula        2022-03-31  2115  	if (edid->extensions == 0)
e9a9e0768ba49d9 Jani Nikula        2022-03-31  2116  		return edid;
61e57a8d72f2336 Adam Jackson       2010-03-29  2117  
ccc97def44ecc08 Jani Nikula        2022-03-31  2118  	new = krealloc(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
61e57a8d72f2336 Adam Jackson       2010-03-29  2119  	if (!new)
61e57a8d72f2336 Adam Jackson       2010-03-29  2120  		goto out;
f14f368670541bf Chris Wilson       2016-10-17  2121  	edid = new;
61e57a8d72f2336 Adam Jackson       2010-03-29  2122  
e9a9e0768ba49d9 Jani Nikula        2022-03-31  2123  	for (j = 1; j <= edid->extensions; j++) {
e9a9e0768ba49d9 Jani Nikula        2022-03-31 @2124  		void *block = edid + j;
18d83450468ca57 Jani Nikula        2022-03-31  2125  		int try;
a28187ccab9410c Chris Wilson       2016-10-17  2126  
18d83450468ca57 Jani Nikula        2022-03-31  2127  		for (try = 0; try < 4; try++) {
89fb7536ad2fdcd Jani Nikula        2022-04-11  2128  			if (read_block(context, block, j, EDID_LENGTH))
61e57a8d72f2336 Adam Jackson       2010-03-29  2129  				goto out;
14544d0937bf016 Chris Wilson       2016-10-24  2130  			if (drm_edid_block_valid(block, j, false, NULL))
61e57a8d72f2336 Adam Jackson       2010-03-29  2131  				break;
61e57a8d72f2336 Adam Jackson       2010-03-29  2132  		}
f934ec8c34b9dce Maarten Lankhorst  2013-01-29  2133  
18d83450468ca57 Jani Nikula        2022-03-31  2134  		if (try == 4)
ccc97def44ecc08 Jani Nikula        2022-03-31  2135  			invalid_blocks++;
0ea75e23356f73b Sam Tygier         2010-09-23  2136  	}
0ea75e23356f73b Sam Tygier         2010-09-23  2137  
ccc97def44ecc08 Jani Nikula        2022-03-31  2138  	if (invalid_blocks) {
63cae081538de1b Jani Nikula        2022-04-11  2139  		connector_bad_edid(connector, edid, edid->extensions + 1);
14544d0937bf016 Chris Wilson       2016-10-24  2140  
ccc97def44ecc08 Jani Nikula        2022-03-31  2141  		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
61e57a8d72f2336 Adam Jackson       2010-03-29  2142  	}
61e57a8d72f2336 Adam Jackson       2010-03-29  2143  
e9a9e0768ba49d9 Jani Nikula        2022-03-31  2144  	return edid;
61e57a8d72f2336 Adam Jackson       2010-03-29  2145  
61e57a8d72f2336 Adam Jackson       2010-03-29  2146  out:
f14f368670541bf Chris Wilson       2016-10-17  2147  	kfree(edid);
61e57a8d72f2336 Adam Jackson       2010-03-29  2148  	return NULL;
61e57a8d72f2336 Adam Jackson       2010-03-29  2149  }
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2150  EXPORT_SYMBOL_GPL(drm_do_get_edid);
61e57a8d72f2336 Adam Jackson       2010-03-29  2151  

:::::: The code at line 2124 was first introduced by commit
:::::: e9a9e0768ba49d9cad3b698860af1842c53c717f drm/edid: use struct edid * in drm_do_get_edid()

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
