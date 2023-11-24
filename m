Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7DA171A4
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+6nUmr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700869161; x=1732405161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OIU4qZFyFXD142IhdAe5tX6CR6zf9hxAOeUoVounOyY=;
  b=W+6nUmr5ZwCsA8cptyOMyUgbc8T5a4oDpepMD2DYeOgHj8UTY6Unkycb
   BgfXhA9/y5VFg4HRbY+YB4MFlqoVHc15X5SS/FhFx2i3by1NzWPgVzwYI
   HnlNqek6XBR/uyIqwJysfwwlOWNHI64E6G+k74MZvrQtdmIj+Y0WuPhF4
   SKqfPwjDq4yellBsZROZuVLBX18l1EHxCv+vRgXGzWI3hptE5xwsWYOP7
   +OAnPXHeXWr/ccyUcJnXIZ7rTtEml3VYZFTDPVagydREphqJLhLl/pF/G
   YaelgiGMzw4MKzJrfFYWKjN3Lceh0mtRa9+cCj4BxUpRZCk+YOCiQoHuZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="396383095"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="396383095"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 15:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858477404"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858477404"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2023 15:39:19 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6flV-0003O9-2O;
	Fri, 24 Nov 2023 23:39:17 +0000
Date: Sat, 25 Nov 2023 07:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/at_xdmac.c:2187 atmel_xdmac_resume() warn:
 'atxdmac->clk' from clk_prepare_enable() not released on lines: 2170.
Message-ID: <202311250452.4tpB3JSy-lkp@intel.com>
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
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5b7ad877e4d81f8904ce83982b1ba5c6e83deccb
commit: 2de5ddb5e68c94b781b3789bca1ce52000d7d0e0 dmaengine: at_xdmac: disable/enable clock directly on suspend/resume
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r081-20231123 (https://download.01.org/0day-ci/archive/20231125/202311250452.4tpB3JSy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250452.4tpB3JSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311250452.4tpB3JSy-lkp@intel.com/

New smatch warnings:
drivers/dma/at_xdmac.c:2187 atmel_xdmac_resume() warn: 'atxdmac->clk' from clk_prepare_enable() not released on lines: 2170.

Old smatch warnings:
drivers/dma/at_xdmac.c:1128 at_xdmac_prep_interleaved() warn: address of NULL pointer 'first'
drivers/dma/at_xdmac.c:1426 at_xdmac_prep_dma_memset_sg() error: we previously assumed 'psg' could be null (see line 1401)
drivers/dma/at_xdmac.c:1499 at_xdmac_prep_dma_memset_sg() error: we previously assumed 'pdesc' could be null (see line 1424)

vim +2187 drivers/dma/at_xdmac.c

e1f7c9eee70730 Ludovic Desroches 2014-10-22  2139  
b183d41a340b22 Claudiu Beznea    2021-10-07  2140  static int __maybe_unused atmel_xdmac_resume(struct device *dev)
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2141  {
ede2b295033f52 Wolfram Sang      2018-04-22  2142  	struct at_xdmac		*atxdmac = dev_get_drvdata(dev);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2143  	struct at_xdmac_chan	*atchan;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2144  	struct dma_chan		*chan, *_chan;
fa5270ec2f2688 Claudiu Beznea    2021-10-07  2145  	struct platform_device	*pdev = container_of(dev, struct platform_device, dev);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2146  	int			i;
87c56dcba45734 Arvind Yadav      2017-08-07  2147  	int ret;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2148  
2de5ddb5e68c94 Claudiu Beznea    2023-02-14  2149  	ret = clk_prepare_enable(atxdmac->clk);
2de5ddb5e68c94 Claudiu Beznea    2023-02-14  2150  	if (ret)
87c56dcba45734 Arvind Yadav      2017-08-07  2151  		return ret;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2152  
2de5ddb5e68c94 Claudiu Beznea    2023-02-14  2153  	pm_runtime_get_noresume(atxdmac->dev);
2de5ddb5e68c94 Claudiu Beznea    2023-02-14  2154  
fa5270ec2f2688 Claudiu Beznea    2021-10-07  2155  	at_xdmac_axi_config(pdev);
fa5270ec2f2688 Claudiu Beznea    2021-10-07  2156  
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2157  	/* Clear pending interrupts. */
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2158  	for (i = 0; i < atxdmac->dma.chancnt; i++) {
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2159  		atchan = &atxdmac->chan[i];
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2160  		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2161  			cpu_relax();
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2162  	}
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2163  
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2164  	at_xdmac_write(atxdmac, AT_XDMAC_GIE, atxdmac->save_gim);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2165  	list_for_each_entry_safe(chan, _chan, &atxdmac->dma.channels, device_node) {
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2166  		atchan = to_at_xdmac_chan(chan);
650b0e990cbd7e Claudiu Beznea    2022-11-17  2167  
650b0e990cbd7e Claudiu Beznea    2022-11-17  2168  		ret = at_xdmac_runtime_resume_descriptors(atchan);
650b0e990cbd7e Claudiu Beznea    2022-11-17  2169  		if (ret < 0)
650b0e990cbd7e Claudiu Beznea    2022-11-17  2170  			return ret;
650b0e990cbd7e Claudiu Beznea    2022-11-17  2171  
734bb9a7b3e198 Ludovic Desroches 2015-01-27  2172  		at_xdmac_chan_write(atchan, AT_XDMAC_CC, atchan->save_cc);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2173  		if (at_xdmac_chan_is_cyclic(atchan)) {
611dcadb01c89d Songjun Wu        2016-01-18  2174  			if (at_xdmac_chan_is_paused(atchan))
611dcadb01c89d Songjun Wu        2016-01-18  2175  				at_xdmac_device_resume(chan);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2176  			at_xdmac_chan_write(atchan, AT_XDMAC_CNDA, atchan->save_cnda);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2177  			at_xdmac_chan_write(atchan, AT_XDMAC_CNDC, atchan->save_cndc);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2178  			at_xdmac_chan_write(atchan, AT_XDMAC_CIE, atchan->save_cim);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2179  			wmb();
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2180  			at_xdmac_write(atxdmac, AT_XDMAC_GE, atchan->mask);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2181  		}
e1f7c9eee70730 Ludovic Desroches 2014-10-22  2182  	}
650b0e990cbd7e Claudiu Beznea    2022-11-17  2183  
650b0e990cbd7e Claudiu Beznea    2022-11-17  2184  	pm_runtime_mark_last_busy(atxdmac->dev);
650b0e990cbd7e Claudiu Beznea    2022-11-17  2185  	pm_runtime_put_autosuspend(atxdmac->dev);
650b0e990cbd7e Claudiu Beznea    2022-11-17  2186  
650b0e990cbd7e Claudiu Beznea    2022-11-17 @2187  	return 0;
650b0e990cbd7e Claudiu Beznea    2022-11-17  2188  }
650b0e990cbd7e Claudiu Beznea    2022-11-17  2189  

:::::: The code at line 2187 was first introduced by commit
:::::: 650b0e990cbd7e214251a173460f79f3681e8233 dmaengine: at_xdmac: add runtime pm support

:::::: TO: Claudiu Beznea <claudiu.beznea@microchip.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
