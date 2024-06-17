Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62A42A8D
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638337; cv=none; b=AznvoPnqhqQgeocyVu0qQlLR/kJKqY+g9l4OlRmrBFYkUNWLcBD8zntG/4oEjIPwepTaaullqTwiqf/oE91yGM4oH0qujilbzpOdXky9Keir4BgF8BsYmNBLJHs5hC1XcsibkCxfJICpNo0NijrvENapu7q+jNSl0U7wK/uAlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638337; c=relaxed/simple;
	bh=7b8j807ywS0THIT5/AGN4XzMNvYvH1l+XfyHmkAwBTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pz4CRMSaFtWwVRtK27QLjxPWI0CYdpena3wqXSvx+E19M+mW7fVkHOH6XgZJ17J4s3rHRJgoLAOyO07gMcnUx9RvoLXpAqSrqFguHwEbu0U9yZUHrLzRJ+ekEUM2DkX51gPsxSYGEGdEYnAsORGSdtuhh31qPHcJGFsCKSU0lBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/WApy/E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/WApy/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718638335; x=1750174335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7b8j807ywS0THIT5/AGN4XzMNvYvH1l+XfyHmkAwBTg=;
  b=G/WApy/EqnnSp4ocxRPLgMi/fV3RrUcV1DN3D5TDKELOdU8bcfRTrttD
   6ToB8C3/h7i/q8nM9DAVcE960FTD9ny1V4FGoshU3v2CPD59eBTQalRSV
   4wYV+921ohRSVjtIpcl9dQpNYxaDDkWBst0RiV35+EKq+Ddp9HxSmeoiz
   cnOYhC9qpPd5GapBwIxeTEMTDJI2qGsSu0Bb5kxKm+TVp7LlfiSUgiPYg
   ikibGpSVtrOBy1LFPYWELLRDotA6KqkmAu6Qy9MPurdQHV5HdIyRaMwg7
   nbqXUDDD4k4FcYsUx5Y9llJwBdtHoQFI21W89smOaoP1qnwjAGuXLFOJD
   A==;
X-CSE-ConnectionGUID: 0kW+EIB6Qn6M78v7Jnpy0Q==
X-CSE-MsgGUID: qoKf4T63QnGgWs3OBDLNJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15437765"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15437765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:32:11 -0700
X-CSE-ConnectionGUID: 545GVsanTZO7cNKbylEA4w==
X-CSE-MsgGUID: dc6sdr/ZRpetxUYTabouhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41318230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2024 08:32:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJEL2-0004cv-0D;
	Mon, 17 Jun 2024 15:32:08 +0000
Date: Mon, 17 Jun 2024 23:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [lee-backlight:for-backlight-next 2/4]
 drivers/video/backlight/lm3509_bl.c:162:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before return around line
 170.
Message-ID: <202406172314.2vVgelaS-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
TO: Patrick Gansterer <paroga@paroga.com>
CC: Lee Jones <lee@kernel.org>
CC: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   7857f5c38d04a38e7a20060a6d370caf0424aa4e
commit: b72755f5b577357cac661cbf9048cad704eb4ad8 [2/4] backlight: Add new lm3509 backlight driver
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-103-20240617 (https://download.01.org/0day-ci/archive/20240617/202406172314.2vVgelaS-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406172314.2vVgelaS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/video/backlight/lm3509_bl.c:162:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 170.
   drivers/video/backlight/lm3509_bl.c:162:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 172.
   drivers/video/backlight/lm3509_bl.c:162:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 177.
   drivers/video/backlight/lm3509_bl.c:162:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 186.
   drivers/video/backlight/lm3509_bl.c:162:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 189.

vim +/for_each_child_of_node +162 drivers/video/backlight/lm3509_bl.c

b72755f5b57735 Patrick Gansterer 2024-05-26  155  
b72755f5b57735 Patrick Gansterer 2024-05-26  156  static int lm3509_parse_dt_node(struct device *dev,
b72755f5b57735 Patrick Gansterer 2024-05-26  157  				struct lm3509_bl_led_data *led_data)
b72755f5b57735 Patrick Gansterer 2024-05-26  158  {
b72755f5b57735 Patrick Gansterer 2024-05-26  159  	struct device_node *child;
b72755f5b57735 Patrick Gansterer 2024-05-26  160  	int seen_led_sources = 0;
b72755f5b57735 Patrick Gansterer 2024-05-26  161  
b72755f5b57735 Patrick Gansterer 2024-05-26 @162  	for_each_child_of_node(dev->of_node, child) {
b72755f5b57735 Patrick Gansterer 2024-05-26  163  		struct lm3509_bl_led_data *ld;
b72755f5b57735 Patrick Gansterer 2024-05-26  164  		int ret;
b72755f5b57735 Patrick Gansterer 2024-05-26  165  		u32 reg;
b72755f5b57735 Patrick Gansterer 2024-05-26  166  		int valid_led_sources;
b72755f5b57735 Patrick Gansterer 2024-05-26  167  
b72755f5b57735 Patrick Gansterer 2024-05-26  168  		ret = of_property_read_u32(child, "reg", &reg);
b72755f5b57735 Patrick Gansterer 2024-05-26  169  		if (ret < 0)
b72755f5b57735 Patrick Gansterer 2024-05-26 @170  			return ret;
b72755f5b57735 Patrick Gansterer 2024-05-26  171  		if (reg >= LM3509_NUM_SINKS)
b72755f5b57735 Patrick Gansterer 2024-05-26  172  			return -EINVAL;
b72755f5b57735 Patrick Gansterer 2024-05-26  173  		ld = &led_data[reg];
b72755f5b57735 Patrick Gansterer 2024-05-26  174  
b72755f5b57735 Patrick Gansterer 2024-05-26  175  		ld->led_sources = lm3509_parse_led_sources(child, BIT(reg));
b72755f5b57735 Patrick Gansterer 2024-05-26  176  		if (ld->led_sources < 0)
b72755f5b57735 Patrick Gansterer 2024-05-26  177  			return ld->led_sources;
b72755f5b57735 Patrick Gansterer 2024-05-26  178  
b72755f5b57735 Patrick Gansterer 2024-05-26  179  		if (reg == 0)
b72755f5b57735 Patrick Gansterer 2024-05-26  180  			valid_led_sources = BIT(LM3509_SINK_MAIN) |
b72755f5b57735 Patrick Gansterer 2024-05-26  181  					    BIT(LM3509_SINK_SUB);
b72755f5b57735 Patrick Gansterer 2024-05-26  182  		else
b72755f5b57735 Patrick Gansterer 2024-05-26  183  			valid_led_sources = BIT(LM3509_SINK_SUB);
b72755f5b57735 Patrick Gansterer 2024-05-26  184  
b72755f5b57735 Patrick Gansterer 2024-05-26  185  		if (ld->led_sources != (ld->led_sources & valid_led_sources))
b72755f5b57735 Patrick Gansterer 2024-05-26  186  			return -EINVAL;
b72755f5b57735 Patrick Gansterer 2024-05-26  187  
b72755f5b57735 Patrick Gansterer 2024-05-26  188  		if (seen_led_sources & ld->led_sources)
b72755f5b57735 Patrick Gansterer 2024-05-26  189  			return -EINVAL;
b72755f5b57735 Patrick Gansterer 2024-05-26  190  
b72755f5b57735 Patrick Gansterer 2024-05-26  191  		seen_led_sources |= ld->led_sources;
b72755f5b57735 Patrick Gansterer 2024-05-26  192  
b72755f5b57735 Patrick Gansterer 2024-05-26  193  		ld->label = NULL;
b72755f5b57735 Patrick Gansterer 2024-05-26  194  		of_property_read_string(child, "label", &ld->label);
b72755f5b57735 Patrick Gansterer 2024-05-26  195  
b72755f5b57735 Patrick Gansterer 2024-05-26  196  		ld->max_brightness = LM3509_MAX_BRIGHTNESS;
b72755f5b57735 Patrick Gansterer 2024-05-26  197  		of_property_read_u32(child, "max-brightness",
b72755f5b57735 Patrick Gansterer 2024-05-26  198  				     &ld->max_brightness);
b72755f5b57735 Patrick Gansterer 2024-05-26  199  		ld->max_brightness =
b72755f5b57735 Patrick Gansterer 2024-05-26  200  			min_t(u32, ld->max_brightness, LM3509_MAX_BRIGHTNESS);
b72755f5b57735 Patrick Gansterer 2024-05-26  201  
b72755f5b57735 Patrick Gansterer 2024-05-26  202  		ld->brightness = LM3509_DEF_BRIGHTNESS;
b72755f5b57735 Patrick Gansterer 2024-05-26  203  		of_property_read_u32(child, "default-brightness",
b72755f5b57735 Patrick Gansterer 2024-05-26  204  				     &ld->brightness);
b72755f5b57735 Patrick Gansterer 2024-05-26  205  		ld->brightness = min_t(u32, ld->brightness, ld->max_brightness);
b72755f5b57735 Patrick Gansterer 2024-05-26  206  	}
b72755f5b57735 Patrick Gansterer 2024-05-26  207  
b72755f5b57735 Patrick Gansterer 2024-05-26  208  	return 0;
b72755f5b57735 Patrick Gansterer 2024-05-26  209  }
b72755f5b57735 Patrick Gansterer 2024-05-26  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
