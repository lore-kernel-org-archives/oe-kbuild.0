Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E133D8
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674487651; x=1706023651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xol2/QaOFlqAwfG8g+Oih7iR5YsK53bCI+kn300YaEk=;
  b=i2RMaA8yeHN+dkeAZa+g9EM8loFpo4enSjNW/RZUDlkRxoqrnIha8dbZ
   KGYGbQgXC6daogX1KI9/uzum9cfK95mnwaZ4vHU1/IbDoV3vqYQ8PN/yT
   KxFeqjLU35IDF7Fce9ChxyT/lhY1WIaGGcuD7CEVUOQihMkDM7iGXtySh
   U5fZuFTKJGK8N69PD5fzqFsx+xjHv8wYhVIhluCgukpVE1qAIE5nLCjzZ
   MNNLdDx8DQQYl2UIF27uNLWqytFjrtvWEhZNWf5Cm30BNJ9tsXRTTtGkE
   TPND2kFUNeAAKYJa/nk+WNsiNzc59e/tAK7kynV8pyAfg/cjQ7tzrxtEq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="313960016"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="313960016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 07:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785676422"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="785676422"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 07:27:12 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJyj1-0005is-2Q;
	Mon, 23 Jan 2023 15:27:11 +0000
Date: Mon, 23 Jan 2023 23:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6880/7257] drivers/media/i2c/max9286.c:771
 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32
Message-ID: <202301232350.U1DFzt57-lkp@intel.com>
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
TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   691781f561e9868a94c3ed7daf4adad7f8af5d16
commit: f1403802d5117651f0b8fd1ec3ba2e0515ab17ad [6880/7257] media: i2c: max9286: Support 12-bit raw bayer formats
:::::: branch date: 11 hours ago
:::::: commit date: 31 hours ago
config: arc-randconfig-m031-20230123 (https://download.01.org/0day-ci/archive/20230123/202301232350.U1DFzt57-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/media/i2c/max9286.c:771 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32

vim +771 drivers/media/i2c/max9286.c

66d8c9d2422da2 Kieran Bingham   2020-06-12  755  
66d8c9d2422da2 Kieran Bingham   2020-06-12  756  static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
66d8c9d2422da2 Kieran Bingham   2020-06-12  757  {
66d8c9d2422da2 Kieran Bingham   2020-06-12  758  	struct max9286_priv *priv = sd_to_max9286(sd);
66d8c9d2422da2 Kieran Bingham   2020-06-12  759  	struct max9286_source *source;
66d8c9d2422da2 Kieran Bingham   2020-06-12  760  	unsigned int i;
66d8c9d2422da2 Kieran Bingham   2020-06-12  761  	bool sync = false;
66d8c9d2422da2 Kieran Bingham   2020-06-12  762  	int ret;
66d8c9d2422da2 Kieran Bingham   2020-06-12  763  
66d8c9d2422da2 Kieran Bingham   2020-06-12  764  	if (enable) {
f1403802d51176 Laurent Pinchart 2022-01-01  765  		const struct v4l2_mbus_framefmt *format;
f1403802d51176 Laurent Pinchart 2022-01-01  766  
f1403802d51176 Laurent Pinchart 2022-01-01  767  		/*
f1403802d51176 Laurent Pinchart 2022-01-01  768  		 * Get the format from the first used sink pad, as all sink
f1403802d51176 Laurent Pinchart 2022-01-01  769  		 * formats must be identical.
f1403802d51176 Laurent Pinchart 2022-01-01  770  		 */
f1403802d51176 Laurent Pinchart 2022-01-01 @771  		format = &priv->fmt[__ffs(priv->bound_sources)];
f1403802d51176 Laurent Pinchart 2022-01-01  772  
f1403802d51176 Laurent Pinchart 2022-01-01  773  		max9286_set_video_format(priv, format);
cffc9fb1ed6c5c Laurent Pinchart 2022-01-01  774  		max9286_set_fsync_period(priv);
cffc9fb1ed6c5c Laurent Pinchart 2022-01-01  775  
66d8c9d2422da2 Kieran Bingham   2020-06-12  776  		/*
66d8c9d2422da2 Kieran Bingham   2020-06-12  777  		 * The frame sync between cameras is transmitted across the
66d8c9d2422da2 Kieran Bingham   2020-06-12  778  		 * reverse channel as GPIO. We must open all channels while
66d8c9d2422da2 Kieran Bingham   2020-06-12  779  		 * streaming to allow this synchronisation signal to be shared.
66d8c9d2422da2 Kieran Bingham   2020-06-12  780  		 */
66d8c9d2422da2 Kieran Bingham   2020-06-12  781  		max9286_i2c_mux_open(priv);
66d8c9d2422da2 Kieran Bingham   2020-06-12  782  
66d8c9d2422da2 Kieran Bingham   2020-06-12  783  		/* Start all cameras. */
66d8c9d2422da2 Kieran Bingham   2020-06-12  784  		for_each_source(priv, source) {
66d8c9d2422da2 Kieran Bingham   2020-06-12  785  			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
66d8c9d2422da2 Kieran Bingham   2020-06-12  786  			if (ret)
66d8c9d2422da2 Kieran Bingham   2020-06-12  787  				return ret;
66d8c9d2422da2 Kieran Bingham   2020-06-12  788  		}
66d8c9d2422da2 Kieran Bingham   2020-06-12  789  
66d8c9d2422da2 Kieran Bingham   2020-06-12  790  		ret = max9286_check_video_links(priv);
66d8c9d2422da2 Kieran Bingham   2020-06-12  791  		if (ret)
66d8c9d2422da2 Kieran Bingham   2020-06-12  792  			return ret;
66d8c9d2422da2 Kieran Bingham   2020-06-12  793  
66d8c9d2422da2 Kieran Bingham   2020-06-12  794  		/*
66d8c9d2422da2 Kieran Bingham   2020-06-12  795  		 * Wait until frame synchronization is locked.
66d8c9d2422da2 Kieran Bingham   2020-06-12  796  		 *
66d8c9d2422da2 Kieran Bingham   2020-06-12  797  		 * Manual says frame sync locking should take ~6 VTS.
66d8c9d2422da2 Kieran Bingham   2020-06-12  798  		 * From practical experience at least 8 are required. Give
66d8c9d2422da2 Kieran Bingham   2020-06-12  799  		 * 12 complete frames time (~400ms at 30 fps) to achieve frame
66d8c9d2422da2 Kieran Bingham   2020-06-12  800  		 * locking before returning error.
66d8c9d2422da2 Kieran Bingham   2020-06-12  801  		 */
66d8c9d2422da2 Kieran Bingham   2020-06-12  802  		for (i = 0; i < 40; i++) {
66d8c9d2422da2 Kieran Bingham   2020-06-12  803  			if (max9286_read(priv, 0x31) & MAX9286_FSYNC_LOCKED) {
66d8c9d2422da2 Kieran Bingham   2020-06-12  804  				sync = true;
66d8c9d2422da2 Kieran Bingham   2020-06-12  805  				break;
66d8c9d2422da2 Kieran Bingham   2020-06-12  806  			}
66d8c9d2422da2 Kieran Bingham   2020-06-12  807  			usleep_range(9000, 11000);
66d8c9d2422da2 Kieran Bingham   2020-06-12  808  		}
66d8c9d2422da2 Kieran Bingham   2020-06-12  809  
66d8c9d2422da2 Kieran Bingham   2020-06-12  810  		if (!sync) {
66d8c9d2422da2 Kieran Bingham   2020-06-12  811  			dev_err(&priv->client->dev,
66d8c9d2422da2 Kieran Bingham   2020-06-12  812  				"Failed to get frame synchronization\n");
66d8c9d2422da2 Kieran Bingham   2020-06-12  813  			return -EXDEV; /* Invalid cross-device link */
66d8c9d2422da2 Kieran Bingham   2020-06-12  814  		}
66d8c9d2422da2 Kieran Bingham   2020-06-12  815  
66d8c9d2422da2 Kieran Bingham   2020-06-12  816  		/*
66d8c9d2422da2 Kieran Bingham   2020-06-12  817  		 * Enable CSI output, VC set according to link number.
66d8c9d2422da2 Kieran Bingham   2020-06-12  818  		 * Bit 7 must be set (chip manual says it's 0 and reserved).
66d8c9d2422da2 Kieran Bingham   2020-06-12  819  		 */
66d8c9d2422da2 Kieran Bingham   2020-06-12  820  		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
66d8c9d2422da2 Kieran Bingham   2020-06-12  821  			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
66d8c9d2422da2 Kieran Bingham   2020-06-12  822  	} else {
66d8c9d2422da2 Kieran Bingham   2020-06-12  823  		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
66d8c9d2422da2 Kieran Bingham   2020-06-12  824  
66d8c9d2422da2 Kieran Bingham   2020-06-12  825  		/* Stop all cameras. */
66d8c9d2422da2 Kieran Bingham   2020-06-12  826  		for_each_source(priv, source)
66d8c9d2422da2 Kieran Bingham   2020-06-12  827  			v4l2_subdev_call(source->sd, video, s_stream, 0);
66d8c9d2422da2 Kieran Bingham   2020-06-12  828  
66d8c9d2422da2 Kieran Bingham   2020-06-12  829  		max9286_i2c_mux_close(priv);
66d8c9d2422da2 Kieran Bingham   2020-06-12  830  	}
66d8c9d2422da2 Kieran Bingham   2020-06-12  831  
66d8c9d2422da2 Kieran Bingham   2020-06-12  832  	return 0;
66d8c9d2422da2 Kieran Bingham   2020-06-12  833  }
66d8c9d2422da2 Kieran Bingham   2020-06-12  834  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
