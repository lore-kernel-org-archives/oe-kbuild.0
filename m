Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047910EA
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 02:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edPhHkHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700878645; x=1732414645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wF+Pzki1dTl626IpB4+p1s3vklhpAGNVwIyUDQCQOiU=;
  b=edPhHkHeoX+A0FeUfmsrfD0Vw4CWti+Jcl+WoCRjLvn559RmFBZ1wnfi
   g7JuB7w45Zzr3qoKxXzus/QoOuP/EIfmd7ub+KQX7JwjFpu/hACh1NCaW
   OoL0IjP8oGFiV4eq56VISLqvuyqYPaHR7jM0NPIq76nAyETCMSzwAOHn8
   D+gKKvQdG54JY2ouva3+CNW7BgmV/9aWwbPSlmyh4sGze1bND1hY3ChEB
   ZIDoREfFWanlqZK08X44QpSnirlB78LAgvSrydK8VCsIIyUa4dC1l9+d0
   9ahCwUarxoJmnjY+L6OcpohYDLdC1lMj+F9mfULaA6K8Up5XYg/3PgmIN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5714128"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="5714128"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 18:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833811657"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="833811657"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 18:17:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6iEQ-0003Xa-23;
	Sat, 25 Nov 2023 02:17:18 +0000
Date: Sat, 25 Nov 2023 10:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/i2c/max9286.c:771 max9286_s_stream() error: buffer
 overflow 'priv->fmt' 4 <= 32
Message-ID: <202311250748.LFfx9w5u-lkp@intel.com>
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
TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
commit: f1403802d5117651f0b8fd1ec3ba2e0515ab17ad media: i2c: max9286: Support 12-bit raw bayer formats
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: powerpc-randconfig-r071-20231124 (https://download.01.org/0day-ci/archive/20231125/202311250748.LFfx9w5u-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250748.LFfx9w5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311250748.LFfx9w5u-lkp@intel.com/

smatch warnings:
drivers/media/i2c/max9286.c:771 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32

vim +771 drivers/media/i2c/max9286.c

66d8c9d2422da21 Kieran Bingham   2020-06-12  755  
66d8c9d2422da21 Kieran Bingham   2020-06-12  756  static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
66d8c9d2422da21 Kieran Bingham   2020-06-12  757  {
66d8c9d2422da21 Kieran Bingham   2020-06-12  758  	struct max9286_priv *priv = sd_to_max9286(sd);
66d8c9d2422da21 Kieran Bingham   2020-06-12  759  	struct max9286_source *source;
66d8c9d2422da21 Kieran Bingham   2020-06-12  760  	unsigned int i;
66d8c9d2422da21 Kieran Bingham   2020-06-12  761  	bool sync = false;
66d8c9d2422da21 Kieran Bingham   2020-06-12  762  	int ret;
66d8c9d2422da21 Kieran Bingham   2020-06-12  763  
66d8c9d2422da21 Kieran Bingham   2020-06-12  764  	if (enable) {
f1403802d511765 Laurent Pinchart 2022-01-01  765  		const struct v4l2_mbus_framefmt *format;
f1403802d511765 Laurent Pinchart 2022-01-01  766  
f1403802d511765 Laurent Pinchart 2022-01-01  767  		/*
f1403802d511765 Laurent Pinchart 2022-01-01  768  		 * Get the format from the first used sink pad, as all sink
f1403802d511765 Laurent Pinchart 2022-01-01  769  		 * formats must be identical.
f1403802d511765 Laurent Pinchart 2022-01-01  770  		 */
f1403802d511765 Laurent Pinchart 2022-01-01 @771  		format = &priv->fmt[__ffs(priv->bound_sources)];
f1403802d511765 Laurent Pinchart 2022-01-01  772  
f1403802d511765 Laurent Pinchart 2022-01-01  773  		max9286_set_video_format(priv, format);
cffc9fb1ed6c5cd Laurent Pinchart 2022-01-01  774  		max9286_set_fsync_period(priv);
cffc9fb1ed6c5cd Laurent Pinchart 2022-01-01  775  
66d8c9d2422da21 Kieran Bingham   2020-06-12  776  		/*
66d8c9d2422da21 Kieran Bingham   2020-06-12  777  		 * The frame sync between cameras is transmitted across the
66d8c9d2422da21 Kieran Bingham   2020-06-12  778  		 * reverse channel as GPIO. We must open all channels while
66d8c9d2422da21 Kieran Bingham   2020-06-12  779  		 * streaming to allow this synchronisation signal to be shared.
66d8c9d2422da21 Kieran Bingham   2020-06-12  780  		 */
66d8c9d2422da21 Kieran Bingham   2020-06-12  781  		max9286_i2c_mux_open(priv);
66d8c9d2422da21 Kieran Bingham   2020-06-12  782  
66d8c9d2422da21 Kieran Bingham   2020-06-12  783  		/* Start all cameras. */
66d8c9d2422da21 Kieran Bingham   2020-06-12  784  		for_each_source(priv, source) {
66d8c9d2422da21 Kieran Bingham   2020-06-12  785  			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
66d8c9d2422da21 Kieran Bingham   2020-06-12  786  			if (ret)
66d8c9d2422da21 Kieran Bingham   2020-06-12  787  				return ret;
66d8c9d2422da21 Kieran Bingham   2020-06-12  788  		}
66d8c9d2422da21 Kieran Bingham   2020-06-12  789  
66d8c9d2422da21 Kieran Bingham   2020-06-12  790  		ret = max9286_check_video_links(priv);
66d8c9d2422da21 Kieran Bingham   2020-06-12  791  		if (ret)
66d8c9d2422da21 Kieran Bingham   2020-06-12  792  			return ret;
66d8c9d2422da21 Kieran Bingham   2020-06-12  793  
66d8c9d2422da21 Kieran Bingham   2020-06-12  794  		/*
66d8c9d2422da21 Kieran Bingham   2020-06-12  795  		 * Wait until frame synchronization is locked.
66d8c9d2422da21 Kieran Bingham   2020-06-12  796  		 *
66d8c9d2422da21 Kieran Bingham   2020-06-12  797  		 * Manual says frame sync locking should take ~6 VTS.
66d8c9d2422da21 Kieran Bingham   2020-06-12  798  		 * From practical experience at least 8 are required. Give
66d8c9d2422da21 Kieran Bingham   2020-06-12  799  		 * 12 complete frames time (~400ms at 30 fps) to achieve frame
66d8c9d2422da21 Kieran Bingham   2020-06-12  800  		 * locking before returning error.
66d8c9d2422da21 Kieran Bingham   2020-06-12  801  		 */
66d8c9d2422da21 Kieran Bingham   2020-06-12  802  		for (i = 0; i < 40; i++) {
66d8c9d2422da21 Kieran Bingham   2020-06-12  803  			if (max9286_read(priv, 0x31) & MAX9286_FSYNC_LOCKED) {
66d8c9d2422da21 Kieran Bingham   2020-06-12  804  				sync = true;
66d8c9d2422da21 Kieran Bingham   2020-06-12  805  				break;
66d8c9d2422da21 Kieran Bingham   2020-06-12  806  			}
66d8c9d2422da21 Kieran Bingham   2020-06-12  807  			usleep_range(9000, 11000);
66d8c9d2422da21 Kieran Bingham   2020-06-12  808  		}
66d8c9d2422da21 Kieran Bingham   2020-06-12  809  
66d8c9d2422da21 Kieran Bingham   2020-06-12  810  		if (!sync) {
66d8c9d2422da21 Kieran Bingham   2020-06-12  811  			dev_err(&priv->client->dev,
66d8c9d2422da21 Kieran Bingham   2020-06-12  812  				"Failed to get frame synchronization\n");
66d8c9d2422da21 Kieran Bingham   2020-06-12  813  			return -EXDEV; /* Invalid cross-device link */
66d8c9d2422da21 Kieran Bingham   2020-06-12  814  		}
66d8c9d2422da21 Kieran Bingham   2020-06-12  815  
66d8c9d2422da21 Kieran Bingham   2020-06-12  816  		/*
66d8c9d2422da21 Kieran Bingham   2020-06-12  817  		 * Enable CSI output, VC set according to link number.
66d8c9d2422da21 Kieran Bingham   2020-06-12  818  		 * Bit 7 must be set (chip manual says it's 0 and reserved).
66d8c9d2422da21 Kieran Bingham   2020-06-12  819  		 */
66d8c9d2422da21 Kieran Bingham   2020-06-12  820  		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
66d8c9d2422da21 Kieran Bingham   2020-06-12  821  			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
66d8c9d2422da21 Kieran Bingham   2020-06-12  822  	} else {
66d8c9d2422da21 Kieran Bingham   2020-06-12  823  		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
66d8c9d2422da21 Kieran Bingham   2020-06-12  824  
66d8c9d2422da21 Kieran Bingham   2020-06-12  825  		/* Stop all cameras. */
66d8c9d2422da21 Kieran Bingham   2020-06-12  826  		for_each_source(priv, source)
66d8c9d2422da21 Kieran Bingham   2020-06-12  827  			v4l2_subdev_call(source->sd, video, s_stream, 0);
66d8c9d2422da21 Kieran Bingham   2020-06-12  828  
66d8c9d2422da21 Kieran Bingham   2020-06-12  829  		max9286_i2c_mux_close(priv);
66d8c9d2422da21 Kieran Bingham   2020-06-12  830  	}
66d8c9d2422da21 Kieran Bingham   2020-06-12  831  
66d8c9d2422da21 Kieran Bingham   2020-06-12  832  	return 0;
66d8c9d2422da21 Kieran Bingham   2020-06-12  833  }
66d8c9d2422da21 Kieran Bingham   2020-06-12  834  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
