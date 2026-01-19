Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2442BE05A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842781; cv=none; b=lNadHKPtNHHb2B94kT2tO9gX2uyZVLbH3Z8jmP1lpt5KP4pissUEIL0yXIeeh2PvQn3XhbH6uwQoOaBBsln/fPMLthQknXyqD2DWhVej4uNWk2OxGiCSwLhJeY9qMBjsGYEQDj+nVFsxAvZFyzHm/QsGcVQVhs0MrI/+k/0ZRZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842781; c=relaxed/simple;
	bh=vL2jSMsmBOx9qHlbWHbnqgOdbKjsr+l9VNsnD0aj1/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hHDrVHwecLbrZDxQhJ8wJZ5QA+XX4+hAdti6LmnCcPttFTbTPjA/KjRwoCPIFzhy/hKTepDopTnwGsSOGtbsFTMazm3eqvTdFJ6P5r7UYTr92KiQ0sjIaVuZkR+JmBBwUXpwga5lzZcmFsJLFjRzPRxqkTRNGidYLasEzoVk7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pu2+XZIb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pu2+XZIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768842781; x=1800378781;
  h=date:from:to:cc:subject:message-id;
  bh=vL2jSMsmBOx9qHlbWHbnqgOdbKjsr+l9VNsnD0aj1/g=;
  b=Pu2+XZIbTCickgGsIHZIoc4vbaQ+JlY7GhUJHIsqadEU1YReMBeSL8ht
   OmskbS5VMANKzLh0dIXjX89ioazoUYJQF6fxeYCLahi5ICtEfCVhfV78A
   hA8vntIBZeb/kk+NOXEXn7qKw/fwmAphxSgbL68pfQFniyCX4Y3hycd+z
   cKrDUxTsRvUim9oponsngz2ybJBsgUJhTwRP9AFvPdpapubT1URtpW/8P
   2PmYWrISY9sJxkjN5UQR3S+w3lpNZ4zWbIaIm0r4PIp6otpy7AJ/1yt+9
   OSCOA8W3dKp+WVRSnrrOMoqITcrxAxq2V56Wbp0uMmRUI49hvvGx0oUcK
   A==;
X-CSE-ConnectionGUID: MYuaIJrxT0+FjsmDm/J2Gg==
X-CSE-MsgGUID: d92emT24Qrio23gqZ84c6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70106928"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70106928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:13:00 -0800
X-CSE-ConnectionGUID: mznCcxfpScKOSaMH7Izcqw==
X-CSE-MsgGUID: CI9zf69zS/GTjdOcHkX39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="243497544"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2026 09:12:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhsoC-00000000O6P-2P98;
	Mon, 19 Jan 2026 17:12:56 +0000
Date: Tue, 20 Jan 2026 01:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sailus-media-tree:metadata 90/113]
 drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc() warn:
 was && intended here instead of ||?
Message-ID: <202601200147.SRFr3GE9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 50fcff1c16cac7152a1b5b56a71656e97d276857 [90/113] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200147.SRFr3GE9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200147.SRFr3GE9-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc() warn: was && intended here instead of ||?

vim +2675 drivers/media/v4l2-core/v4l2-subdev.c

50fcff1c16cac7 Sakari Ailus 2025-12-04  2659  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2660  int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
50fcff1c16cac7 Sakari Ailus 2025-12-04  2661  			       struct v4l2_mbus_frame_desc *desc)
50fcff1c16cac7 Sakari Ailus 2025-12-04  2662  {
50fcff1c16cac7 Sakari Ailus 2025-12-04  2663  	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
50fcff1c16cac7 Sakari Ailus 2025-12-04  2664  		unsigned int type = desc->type;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2665  		int ret;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2666  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2667  		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
50fcff1c16cac7 Sakari Ailus 2025-12-04  2668  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2669  		if (desc->type != type)
50fcff1c16cac7 Sakari Ailus 2025-12-04  2670  			return -EINVAL;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2671  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2672  		return ret;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2673  	}
50fcff1c16cac7 Sakari Ailus 2025-12-04  2674  
50fcff1c16cac7 Sakari Ailus 2025-12-04 @2675  	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
