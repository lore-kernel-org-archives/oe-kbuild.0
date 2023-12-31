Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF30B645
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Dec 2023 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aleZHN8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704051102; x=1735587102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hk16m7H/nEI6lnqWVgFpQ1yiKjWXx9EaKzn9/FUyR4c=;
  b=aleZHN8mmpMR9Q8kR+EIVtBSy+gC7cWo9g2wwoV2OqxUZPsWTVNKi1o5
   nysCu9sWfz1ctxAWufuUecRT1HK+iLaEo+L6p+HpOoafiAqchvB1WHQrd
   ahC2VR/6kR46jXhhUBc8i+3W1pn5CM4tK6Q1IML3IkT9kZ2ys5XMmLxyN
   XYEAn/ua75CIoqtWbXlHcyzcAMXOF6Cs4fdLtiW7YMJ6xe07hUFXWR3F3
   kHnYCOhk0a0ljoVF1XbKdQpv+DwYuMYyacGYQ1DWGq8qaw5zug6pXEBww
   0IPZsqrotu1XLkNnUArGE/hv5BaoL+hICr7B9660YjECefeZnJBIQvd5O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="381723506"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="381723506"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 11:31:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="902716260"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="902716260"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Dec 2023 11:31:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rK1X5-000Jha-2g;
	Sun, 31 Dec 2023 19:31:36 +0000
Date: Mon, 1 Jan 2024 03:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3789/10295]
 drivers/media/i2c/st-mipid02.c:396:1-7: WARNING: do_div() does a 64-by-32
 division, please consider using div64_s64 instead.
Message-ID: <202401010329.u5sLmCCj-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alain Volmat <alain.volmat@foss.st.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 046ee0e2a4d602268a49be0d77df8c85559015e3 [3789/10295] media: i2c: st-mipid02: add usage of v4l2_get_link_freq
:::::: branch date: 10 days ago
:::::: commit date: 4 weeks ago
config: hexagon-randconfig-r052-20231228 (https://download.01.org/0day-ci/archive/20240101/202401010329.u5sLmCCj-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401010329.u5sLmCCj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/i2c/st-mipid02.c:396:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

vim +396 drivers/media/i2c/st-mipid02.c

642bb5e88fed89 Mickael Guene  2019-04-09  369  
642bb5e88fed89 Mickael Guene  2019-04-09  370  /*
642bb5e88fed89 Mickael Guene  2019-04-09  371   * We need to know link frequency to setup clk_lane_reg1 timings. Link frequency
046ee0e2a4d602 Alain Volmat   2023-11-25  372   * will be retrieve from connected device via v4l2_get_link_freq, bit per pixel
642bb5e88fed89 Mickael Guene  2019-04-09  373   * and number of lanes.
642bb5e88fed89 Mickael Guene  2019-04-09  374   */
642bb5e88fed89 Mickael Guene  2019-04-09  375  static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge)
642bb5e88fed89 Mickael Guene  2019-04-09  376  {
642bb5e88fed89 Mickael Guene  2019-04-09  377  	struct i2c_client *client = bridge->i2c_client;
642bb5e88fed89 Mickael Guene  2019-04-09  378  	struct v4l2_subdev *subdev = bridge->s_subdev;
046ee0e2a4d602 Alain Volmat   2023-11-25  379  	struct v4l2_fwnode_endpoint *ep = &bridge->rx;
046ee0e2a4d602 Alain Volmat   2023-11-25  380  	u32 bpp = bpp_from_code(bridge->fmt.code);
046ee0e2a4d602 Alain Volmat   2023-11-25  381  	/*
046ee0e2a4d602 Alain Volmat   2023-11-25  382  	 * clk_lane_reg1 requires 4 times the unit interval time, and bitrate
046ee0e2a4d602 Alain Volmat   2023-11-25  383  	 * is twice the link frequency, hence ui_4 = 1000000000 * 4 / 2
046ee0e2a4d602 Alain Volmat   2023-11-25  384  	 */
046ee0e2a4d602 Alain Volmat   2023-11-25  385  	u64 ui_4 = 2000000000;
046ee0e2a4d602 Alain Volmat   2023-11-25  386  	s64 link_freq;
642bb5e88fed89 Mickael Guene  2019-04-09  387  
046ee0e2a4d602 Alain Volmat   2023-11-25  388  	link_freq = v4l2_get_link_freq(subdev->ctrl_handler, bpp,
046ee0e2a4d602 Alain Volmat   2023-11-25  389  				       2 * ep->bus.mipi_csi2.num_data_lanes);
046ee0e2a4d602 Alain Volmat   2023-11-25  390  	if (link_freq < 0) {
6a381d1072f174 Hugues Fruchet 2019-06-17  391  		dev_err(&client->dev, "Failed to get link frequency");
642bb5e88fed89 Mickael Guene  2019-04-09  392  		return -EINVAL;
642bb5e88fed89 Mickael Guene  2019-04-09  393  	}
642bb5e88fed89 Mickael Guene  2019-04-09  394  
046ee0e2a4d602 Alain Volmat   2023-11-25  395  	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
046ee0e2a4d602 Alain Volmat   2023-11-25 @396  	do_div(ui_4, link_freq);
046ee0e2a4d602 Alain Volmat   2023-11-25  397  	bridge->r.clk_lane_reg1 |= ui_4 << 2;
642bb5e88fed89 Mickael Guene  2019-04-09  398  
642bb5e88fed89 Mickael Guene  2019-04-09  399  	return 0;
642bb5e88fed89 Mickael Guene  2019-04-09  400  }
642bb5e88fed89 Mickael Guene  2019-04-09  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
