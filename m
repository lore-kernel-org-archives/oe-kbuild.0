Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2407E
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 00:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690936489; x=1722472489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ioIvCKNf990nAUDppEu/adys9dceGF59jaMs3vfuBZM=;
  b=nANdFUqx761coJpD1PwrEQ3KZieih1wZzr2S6NX8NgwhhIlf4kynjSzS
   KpMm6+/wGvDesVVQmP7cXrchhGF61lOiGxoLVVya7Ww1upDrk3zqXyZ2c
   e+jh8sYue0c7pIDCCbGNL0D3WIU5X+L853qm5T88FampxlxvPb/RQQL+p
   NqZVlz7X10auF+IDp28E3y9IdnjkdqQpEEDNPlAPQzk+TbaOnYhwdOzj1
   XMAzTp079faHGZYmvNzCgYL/X9IRnn6aHrmRESGY3VVyDo1+tS9DvRm6G
   NTvHeVmJR7yeRCFNoVbqrYRnJN4Bq3u54zBjOr5Eq832OOzcUHS5QLfRi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368346153"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="368346153"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 17:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="798869473"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="798869473"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 17:34:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQzp8-0000iR-2A;
	Wed, 02 Aug 2023 00:34:46 +0000
Date: Wed, 2 Aug 2023 08:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4511/6031] drivers/rtc/rtc-pcf2127.c:783
 pcf2127_enable_ts() warn: missing error code? 'ret'
Message-ID: <202308020843.mTyVKfOW-lkp@intel.com>
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
TO: Hugo Villeneuve <hvilleneuve@dimonoff.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a734662572708cf062e974f659ae50c24fc1ad17
commit: 420cc9e850dbc8e6ea7dd1e53d62d64cd8766354 [4511/6031] rtc: pcf2127: add support for multiple TS functions
:::::: branch date: 19 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20230730 (https://download.01.org/0day-ci/archive/20230802/202308020843.mTyVKfOW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020843.mTyVKfOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308020843.mTyVKfOW-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-pcf2127.c:783 pcf2127_enable_ts() warn: missing error code? 'ret'

vim +/ret +783 drivers/rtc/rtc-pcf2127.c

fd28ceb4603f95 Hugo Villeneuve 2023-06-22  750  
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  751  /*
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  752   * Enable timestamp function and corresponding interrupt(s).
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  753   */
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  754  static int pcf2127_enable_ts(struct device *dev, int ts_id)
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  755  {
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  756  	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  757  	int ret;
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  758  
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  759  	if (ts_id >= pcf2127->cfg->ts_count) {
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  760  		dev_err(dev, "%s: invalid tamper detection ID (%d)\n",
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  761  			__func__, ts_id);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  762  		return -EINVAL;
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  763  	}
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  764  
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  765  	/* Enable timestamp function. */
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  766  	ret = regmap_update_bits(pcf2127->regmap,
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  767  				 pcf2127->cfg->ts[ts_id].reg_base,
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  768  				 PCF2127_BIT_TS_CTRL_TSOFF |
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  769  				 PCF2127_BIT_TS_CTRL_TSM,
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  770  				 PCF2127_BIT_TS_CTRL_TSM);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  771  	if (ret) {
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  772  		dev_err(dev, "%s: tamper detection config (ts%d_ctrl) failed\n",
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  773  			__func__, ts_id);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  774  		return ret;
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  775  	}
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  776  
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  777  	/* TS input pin driven to GND detection is supported by all variants.
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  778  	 * Make sure that interrupt bit is defined.
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  779  	 */
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  780  	if (pcf2127->cfg->ts[ts_id].gnd_detect_bit == 0) {
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  781  		dev_err(dev, "%s: tamper detection to GND configuration invalid\n",
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  782  			__func__);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22 @783  		return ret;
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  784  	}
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  785  
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  786  	/*
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  787  	 * Enable interrupt generation when TSF timestamp flag is set.
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  788  	 * Interrupt signals are open-drain outputs and can be left floating if
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  789  	 * unused.
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  790  	 */
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  791  	ret = regmap_update_bits(pcf2127->regmap, pcf2127->cfg->ts[ts_id].ie_reg,
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  792  				 pcf2127->cfg->ts[ts_id].ie_bit,
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  793  				 pcf2127->cfg->ts[ts_id].ie_bit);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  794  	if (ret) {
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  795  		dev_err(dev, "%s: tamper detection TSIE%d config failed\n",
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  796  			__func__, ts_id);
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  797  		return ret;
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  798  	}
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  799  
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  800  	return ret;
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  801  }
420cc9e850dbc8 Hugo Villeneuve 2023-06-22  802  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
