Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11073A1AB
	for <oe-kbuild@lists.linux.dev>; Wed,  8 May 2024 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715202439; cv=none; b=QL1H2rIcr0pIbratfOc3uXzQv4KI/5R27LlCRkjlo265pyFf6weDBPMwLWwqTXpCysmxjzcDoOfJ9TwJaOLVuiCijKasdCp7DucRJA01inupe6bwsnHWlKEd74N1XxBjiRDiyL641qXZJEQvH3h6nka9t22SN4XRqiynLggqK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715202439; c=relaxed/simple;
	bh=ZWuISDmVS0y0BAqC+S0r51BSoF1EZfMkUy3P0uSDbkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C635gXL/Q13Al/9TIYquTuf3y2AYlcBSnGI9WIuoPvSF55Z1TessYssG7Y+KRaEFmeVB0hZ3ETF0cr3lb1/9oKQzdQQHwOcn+7+0BBBt7+6LZAVdlrv1FOI779/qokEDB1tEaOFKLnx6yQL1fFfWvjD8ZL1VZfpf0YmWHfRnWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1er+hv3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1er+hv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715202438; x=1746738438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWuISDmVS0y0BAqC+S0r51BSoF1EZfMkUy3P0uSDbkI=;
  b=I1er+hv3p1Dez5qroCjs5Qk2yX+ccy2WGEoX9Jy7nbzXMafk/sL5PpqW
   tb3TiXbEq6iyWttqUGl+apWQycnwEDN8OpjvX5wQb84vikeFn+cylvdt7
   tqzfB3RRlSkqyefm+SAbqSDfvnrod62f84mf+APz+gkHfE90CvDdLUhGF
   +pmW5cW2s6RU48J9f02Q44Rq43UmVAzCiyZC49CMq5qyjr3aE+jbIvEbq
   gjfOd3ZQ1MXjdKH28Tha6rqO35V4ePss4/EjioFchCPPHRmRkUneFkuai
   vkeq4XByIogx9tNFWBeubaCVj5Pdl62a+iPthrvP+x7lCm3wkmnBHdP+I
   g==;
X-CSE-ConnectionGUID: 4PTbPVfYTfaEz+QfU8tT/Q==
X-CSE-MsgGUID: uyBQprcMTQGltsEmKSYZMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33600819"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33600819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 14:07:16 -0700
X-CSE-ConnectionGUID: 0llCoKeCSoiIuqD3Zu3/AA==
X-CSE-MsgGUID: ZPAU8AJVRfqEq3/80wb1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="59878075"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2024 14:07:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4oVM-00046o-01;
	Wed, 08 May 2024 21:07:12 +0000
Date: Thu, 9 May 2024 05:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Provide const-aware subdev
 state accessors
Message-ID: <202405090416.pxbqYXPA-lkp@intel.com>
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
In-Reply-To: <20240507161907.27747-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20240507161907.27747-2-laurent.pinchart+renesas@ideasonboard.com>
TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e695668af8523b059127dfa8b261c76e7c9cde10]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-v4l2-subdev-Provide-const-aware-subdev-state-accessors/20240508-002212
base:   e695668af8523b059127dfa8b261c76e7c9cde10
patch link:    https://lore.kernel.org/r/20240507161907.27747-2-laurent.pinchart%2Brenesas%40ideasonboard.com
patch subject: [PATCH v3 1/2] media: v4l2-subdev: Provide const-aware subdev state accessors
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: nios2-randconfig-r081-20240509 (https://download.01.org/0day-ci/archive/20240509/202405090416.pxbqYXPA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405090416.pxbqYXPA-lkp@intel.com/

smatch warnings:
drivers/media/i2c/hi846.c:1854 hi846_get_selection() warn: statement has no effect 31

vim +1854 drivers/media/i2c/hi846.c

e8c0882685f915 Martin Kepplinger 2021-09-06  1841  
e8c0882685f915 Martin Kepplinger 2021-09-06  1842  static int hi846_get_selection(struct v4l2_subdev *sd,
e8c0882685f915 Martin Kepplinger 2021-09-06  1843  			       struct v4l2_subdev_state *sd_state,
e8c0882685f915 Martin Kepplinger 2021-09-06  1844  			       struct v4l2_subdev_selection *sel)
e8c0882685f915 Martin Kepplinger 2021-09-06  1845  {
e8c0882685f915 Martin Kepplinger 2021-09-06  1846  	struct hi846 *hi846 = to_hi846(sd);
e8c0882685f915 Martin Kepplinger 2021-09-06  1847  
e8c0882685f915 Martin Kepplinger 2021-09-06  1848  	switch (sel->target) {
e8c0882685f915 Martin Kepplinger 2021-09-06  1849  	case V4L2_SEL_TGT_CROP:
e8c0882685f915 Martin Kepplinger 2021-09-06  1850  	case V4L2_SEL_TGT_CROP_DEFAULT:
e8c0882685f915 Martin Kepplinger 2021-09-06  1851  		mutex_lock(&hi846->mutex);
e8c0882685f915 Martin Kepplinger 2021-09-06  1852  		switch (sel->which) {
e8c0882685f915 Martin Kepplinger 2021-09-06  1853  		case V4L2_SUBDEV_FORMAT_TRY:
bc0e8d91feec72 Sakari Ailus      2023-10-13 @1854  			v4l2_subdev_state_get_crop(sd_state, sel->pad);
e8c0882685f915 Martin Kepplinger 2021-09-06  1855  			break;
e8c0882685f915 Martin Kepplinger 2021-09-06  1856  		case V4L2_SUBDEV_FORMAT_ACTIVE:
e8c0882685f915 Martin Kepplinger 2021-09-06  1857  			sel->r = hi846->cur_mode->crop;
e8c0882685f915 Martin Kepplinger 2021-09-06  1858  			break;
e8c0882685f915 Martin Kepplinger 2021-09-06  1859  		}
e8c0882685f915 Martin Kepplinger 2021-09-06  1860  		mutex_unlock(&hi846->mutex);
e8c0882685f915 Martin Kepplinger 2021-09-06  1861  		return 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1862  	case V4L2_SEL_TGT_CROP_BOUNDS:
e8c0882685f915 Martin Kepplinger 2021-09-06  1863  	case V4L2_SEL_TGT_NATIVE_SIZE:
e8c0882685f915 Martin Kepplinger 2021-09-06  1864  		sel->r.top = 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1865  		sel->r.left = 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1866  		sel->r.width = 3264;
e8c0882685f915 Martin Kepplinger 2021-09-06  1867  		sel->r.height = 2448;
e8c0882685f915 Martin Kepplinger 2021-09-06  1868  		return 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1869  	default:
e8c0882685f915 Martin Kepplinger 2021-09-06  1870  		return -EINVAL;
e8c0882685f915 Martin Kepplinger 2021-09-06  1871  	}
e8c0882685f915 Martin Kepplinger 2021-09-06  1872  }
e8c0882685f915 Martin Kepplinger 2021-09-06  1873  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
