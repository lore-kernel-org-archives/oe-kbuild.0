Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224746FCD1
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgC4UJS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701813418; x=1733349418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9oI4pGE95Tl+LioRQE6684vTFN5uK49yEYAdVTGIjA=;
  b=cgC4UJS6YCsFSeQhZgOtLlhY2y08QRQk93B/r1fw+ncNEwEqt0UqaOjP
   /R9ufrAThpf4uU2xc12FgATtHzFyEHrD6c/hojB0A00SCkirDccvkGbao
   UiGZwlxlkIxOqH7CGFCFyvP87gVx3+ukrRMovgEgOeTFkeYAzHSV9mo48
   27QnnnffDSk5XLS3iQrgDaLjgHYRBEwTJJJx/ypy780NuRbmp8ixZXn/G
   xuPlxrwneE6xwNR5GTCWZ7KtE3nCODsyGJ2FY+0Vpzf6DVfHW/EdUF9BH
   YD+fkVb2zNmXMGdju8768u/PFrWhQZkT4qNY8J07Vsszq0yjBOjoKdGRJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393697571"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393697571"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889087083"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="889087083"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:56:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdPQ-0009mV-0N;
	Tue, 05 Dec 2023 21:56:52 +0000
Date: Wed, 6 Dec 2023 05:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v14 05/11] media: uvcvideo: Add support for compound
 controls
Message-ID: <202312060523.tldbovNM-lkp@intel.com>
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
In-Reply-To: <20231201071907.3080126-6-yunkec@google.com>
References: <20231201071907.3080126-6-yunkec@google.com>
TO: Yunke Cao <yunkec@google.com>
TO: Hans Verkuil <hverkuil@xs4all.nl>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Daniel Scally <dan.scally@ideasonboard.com>
CC: Tomasz Figa <tfiga@chromium.org>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Ricardo Ribalda <ribalda@chromium.org>
CC: linux-media@vger.kernel.org
CC: Yunke Cao <yunkec@google.com>

Hi Yunke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linuxtv-media-stage/master linus/master v6.7-rc4 next-20231205]
[cannot apply to media-tree/master sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT/20231201-152501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231201071907.3080126-6-yunkec%40google.com
patch subject: [PATCH v14 05/11] media: uvcvideo: Add support for compound controls
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060523.tldbovNM-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060523.tldbovNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060523.tldbovNM-lkp@intel.com/

smatch warnings:
drivers/media/usb/uvc/uvc_ctrl.c:2065 __uvc_ctrl_set_compound() warn: maybe return -EFAULT instead of the bytes remaining?

vim +2065 drivers/media/usb/uvc/uvc_ctrl.c

17d6f925ab4779 Yunke Cao 2023-12-01  2039  
1a1a2af88920e9 Yunke Cao 2023-12-01  2040  static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
1a1a2af88920e9 Yunke Cao 2023-12-01  2041  				   struct v4l2_ext_control *xctrl,
1a1a2af88920e9 Yunke Cao 2023-12-01  2042  				   struct uvc_control *ctrl)
1a1a2af88920e9 Yunke Cao 2023-12-01  2043  {
1a1a2af88920e9 Yunke Cao 2023-12-01  2044  	u8 *data;
1a1a2af88920e9 Yunke Cao 2023-12-01  2045  	int ret;
1a1a2af88920e9 Yunke Cao 2023-12-01  2046  
1a1a2af88920e9 Yunke Cao 2023-12-01  2047  	if (xctrl->size != mapping->v4l2_size / 8)
1a1a2af88920e9 Yunke Cao 2023-12-01  2048  		return -EINVAL;
1a1a2af88920e9 Yunke Cao 2023-12-01  2049  
1a1a2af88920e9 Yunke Cao 2023-12-01  2050  	data = kmalloc(xctrl->size, GFP_KERNEL);
1a1a2af88920e9 Yunke Cao 2023-12-01  2051  	if (!data)
1a1a2af88920e9 Yunke Cao 2023-12-01  2052  		return -ENOMEM;
1a1a2af88920e9 Yunke Cao 2023-12-01  2053  
1a1a2af88920e9 Yunke Cao 2023-12-01  2054  	ret = copy_from_user(data, xctrl->ptr, xctrl->size);
1a1a2af88920e9 Yunke Cao 2023-12-01  2055  	if (ret < 0)
1a1a2af88920e9 Yunke Cao 2023-12-01  2056  		goto out;
1a1a2af88920e9 Yunke Cao 2023-12-01  2057  
1a1a2af88920e9 Yunke Cao 2023-12-01  2058  	ret = mapping->set_compound(mapping, data,
1a1a2af88920e9 Yunke Cao 2023-12-01  2059  			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
1a1a2af88920e9 Yunke Cao 2023-12-01  2060  
1a1a2af88920e9 Yunke Cao 2023-12-01  2061  	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);
1a1a2af88920e9 Yunke Cao 2023-12-01  2062  
1a1a2af88920e9 Yunke Cao 2023-12-01  2063  out:
1a1a2af88920e9 Yunke Cao 2023-12-01  2064  	kfree(data);
1a1a2af88920e9 Yunke Cao 2023-12-01 @2065  	return ret;
1a1a2af88920e9 Yunke Cao 2023-12-01  2066  }
1a1a2af88920e9 Yunke Cao 2023-12-01  2067  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
