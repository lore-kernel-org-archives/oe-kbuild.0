Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C264D261
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gid/sLqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698647610; x=1730183610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1cFiw61/CoEGEGym1gAmXOOGsOChzoqEkDgvrI/1GY=;
  b=Gid/sLqOywb4n+JZq9Sh6McskeU2QPHwiZby9T39I4NjsShytWXsj5SD
   4o4N3yck0cPT9TdK8dXFp+VSf7anqtA2YbUhk7mCRzjFN7wOM6abwH/SZ
   cfmdoOKHe1oxJLt43OsDTLA5jBRumR7LtB4t1JzDdE9o6tmwPH61dtiwT
   Y9APnh3VVrh9hOgmw24mZtI0nAJ0iKNqkbb6Rzwv78JhE6W3XF9MZbNTB
   d72WPADB52XIDdPUp6CeEMA/zYvN3hnGM4SM+YlwgkSczKoWp/Q3RSDyN
   UbvYCn28ETvxg6qXmF0y99g3rfsVTb+aN6403488OOdTEPQojl74kHdKe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="454485142"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="454485142"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 23:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="1091531288"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="1091531288"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2023 23:33:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxLq1-000D5T-1f;
	Mon, 30 Oct 2023 06:33:25 +0000
Date: Mon, 30 Oct 2023 14:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/9] media: atomisp: Use accessors for pad config
 'try_*' fields
Message-ID: <202310301422.ueunKw1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231027091649.10553-7-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-7-laurent.pinchart@ideasonboard.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master next-20231027]
[cannot apply to linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-v4l2-subdev-Fix-indentation-in-v4l2-subdev-h/20231027-171856
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231027091649.10553-7-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v2 6/9] media: atomisp: Use accessors for pad config 'try_*' fields
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231030/202310301422.ueunKw1B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301422.ueunKw1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310301422.ueunKw1B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_tpg.c: In function 'tpg_set_fmt':
>> drivers/staging/media/atomisp/pci/atomisp_tpg.c:50:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
      50 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/pci/atomisp_tpg.c:50:17: error: invalid type argument of unary '*' (have 'int')
      50 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c: In function 'mt9m114_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c:669:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     669 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c:669:17: error: invalid type argument of unary '*' (have 'int')
     669 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/i2c/atomisp-gc2235.c: In function 'gc2235_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:564:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     564 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:564:17: error: invalid type argument of unary '*' (have 'int')
     564 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/i2c/atomisp-ov2722.c: In function 'ov2722_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-ov2722.c:674:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     674 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/i2c/atomisp-ov2722.c:674:17: error: invalid type argument of unary '*' (have 'int')
     674 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +50 drivers/staging/media/atomisp/pci/atomisp_tpg.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  38  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  39  static int tpg_set_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_tpg.c          Tomi Valkeinen        2021-06-10  40  		       struct v4l2_subdev_state *sd_state,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  41  		       struct v4l2_subdev_format *format)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  42  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  43  	struct v4l2_mbus_framefmt *fmt = &format->format;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  44  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  45  	if (format->pad)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  46  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  47  	/* only raw8 grbg is supported by TPG */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  48  	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  49  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
64195792383424 drivers/staging/media/atomisp/pci/atomisp_tpg.c          Laurent Pinchart      2023-10-27 @50  		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  51  		return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  52  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  53  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  54  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
