Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6060372
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 00:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGG5Yv97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699660996; x=1731196996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cu2WcdKgCTboclSTd2ZLzM0n6OQLeI8zO6+djsY/1kM=;
  b=KGG5Yv97t/YhfiVVoUoYRDh8wVEZyeiko0D4og2uh6fBqYyNSdxStjuq
   EUZnG2H62LxFAY78C2EsrL4oQd+im1d1wDC+bcwQjW0r+3EqM5qitE5xo
   WIYcxZjiibGZ0/BT5G4SJa5gB/m7vTg5Fht0vRbEl/1VYBCNiakLWJElK
   oNls1H4KjeWJ1o8cK+jsyX+jB3WjLQQa1LWCNMWA9NbNFrEtkPhK70mR8
   cMQ8nUYcKRrIPCsWZgY77qWCWmEZJZc/vD6/fnUWISDg7VKmbBgUVPCXT
   Ht9d1k+6c4UqXzGSf93suhQxKaGYBh2oOSXJqkSvHjLeSmY5D9HFm+8hz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421339236"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="421339236"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937281579"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="937281579"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 16:03:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1bSw-000A42-0g;
	Sat, 11 Nov 2023 00:03:10 +0000
Date: Sat, 11 Nov 2023 08:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <202311110759.PJpNGc2N-lkp@intel.com>
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
In-Reply-To: <93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait@bootlin.com>
References: <93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait@bootlin.com>
TO: Mehdi Djait <mehdi.djait@bootlin.com>
TO: mchehab@kernel.org
TO: heiko@sntech.de
TO: hverkuil-cisco@xs4all.nl
TO: laurent.pinchart@ideasonboard.com
TO: krzysztof.kozlowski+dt@linaro.org
TO: robh+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: thomas.petazzoni@bootlin.com
CC: alexandre.belloni@bootlin.com
CC: maxime.chevallier@bootlin.com
CC: paul.kocialkowski@bootlin.com
CC: Mehdi Djait <mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linuxtv-media-stage/master linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/dt-bindings-vendor-prefixes-Add-techwell-vendor-prefix/20231109-042139
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v8 3/3] media: i2c: Introduce a driver for the Techwell TW9900 decoder
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110759.PJpNGc2N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110759.PJpNGc2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110759.PJpNGc2N-lkp@intel.com/

smatch warnings:
drivers/media/i2c/tw9900.c:398 tw9900_s_std() error: uninitialized symbol 'mode'.

vim +/mode +398 drivers/media/i2c/tw9900.c

4fa88742527a9a Mehdi Djait 2023-11-08  383  
4fa88742527a9a Mehdi Djait 2023-11-08  384  static int tw9900_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
4fa88742527a9a Mehdi Djait 2023-11-08  385  {
4fa88742527a9a Mehdi Djait 2023-11-08  386  	struct tw9900 *tw9900 = to_tw9900(sd);
4fa88742527a9a Mehdi Djait 2023-11-08  387  	const struct tw9900_mode *mode;
4fa88742527a9a Mehdi Djait 2023-11-08  388  	int i, ret = 0;
4fa88742527a9a Mehdi Djait 2023-11-08  389  
4fa88742527a9a Mehdi Djait 2023-11-08  390  	if (!(std & (V4L2_STD_NTSC | V4L2_STD_PAL)))
4fa88742527a9a Mehdi Djait 2023-11-08  391  		return -EINVAL;
4fa88742527a9a Mehdi Djait 2023-11-08  392  
4fa88742527a9a Mehdi Djait 2023-11-08  393  	mutex_lock(&tw9900->mutex);
4fa88742527a9a Mehdi Djait 2023-11-08  394  
4fa88742527a9a Mehdi Djait 2023-11-08  395  	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
4fa88742527a9a Mehdi Djait 2023-11-08  396  		if (supported_modes[i].std & std)
4fa88742527a9a Mehdi Djait 2023-11-08  397  			mode = &supported_modes[i];
4fa88742527a9a Mehdi Djait 2023-11-08 @398  	if (!mode) {
4fa88742527a9a Mehdi Djait 2023-11-08  399  		ret = -EINVAL;
4fa88742527a9a Mehdi Djait 2023-11-08  400  		goto out_unlock;
4fa88742527a9a Mehdi Djait 2023-11-08  401  	}
4fa88742527a9a Mehdi Djait 2023-11-08  402  
4fa88742527a9a Mehdi Djait 2023-11-08  403  	tw9900->cur_mode = mode;
4fa88742527a9a Mehdi Djait 2023-11-08  404  
4fa88742527a9a Mehdi Djait 2023-11-08  405  out_unlock:
4fa88742527a9a Mehdi Djait 2023-11-08  406  	mutex_unlock(&tw9900->mutex);
4fa88742527a9a Mehdi Djait 2023-11-08  407  
4fa88742527a9a Mehdi Djait 2023-11-08  408  	return ret;
4fa88742527a9a Mehdi Djait 2023-11-08  409  }
4fa88742527a9a Mehdi Djait 2023-11-08  410  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
