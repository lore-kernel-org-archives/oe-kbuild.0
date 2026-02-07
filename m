Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB802882B4
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501120; cv=none; b=ZXZExb+jPi3S3N6JOVUNKzSw4IoFEWmjd8rvF+AlGcPvs8WxQ2ZqM0Cl+WlseXk+K0dixjDTnN8VYf5LoPo4G3sR3zAT11LtbBFDCSfsJexfJo0wgZxAfb/JfWd65ICWeJm9k/RxD7LiWkhccEa12EHxbv4bLPEMjrJ6Y3kE2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501120; c=relaxed/simple;
	bh=yTGlY/ZdmF2Ly0lC8yssgkbakaIltFQzwfiNqCozTzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BO0otlsp76dZGrOspmgfAiJknKFKssuzz+CXUONixYCeiFHa5K04V+fHD/qlybDuqMyrFWfzsizh+VEk/GnwhlN+8QChF22XqVLz9B3xrx0/wpL6CykcySQly81g+SIGGEVAi8AG36IWFkQU/GdURiDVqzekLdJGeaITCbHGjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl0YvC0D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl0YvC0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770501119; x=1802037119;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yTGlY/ZdmF2Ly0lC8yssgkbakaIltFQzwfiNqCozTzk=;
  b=Zl0YvC0D1aIl/FU8xEGyn/hmHbgTPjPTMs1YCHyDl6rA5258uXbrZqoa
   pTsqrftn5OnrlalGpLa+LaqNVWv9kYmhyrwCUVI/0SzZ28HApxrnjgiMq
   tdC2yG1H0Sl+DJHHtg7CY2w2T/MweffxcbAFWhqh9WEKFBDCk/W5si9s1
   Q8LVDOKnvA2TNRF9+XLYmdxZYWtDzGqQZ/Pkqu0ZGonvGn4VA9rYJdsQI
   RsHnzt2C0N/tmx3D/nwPvzRXjLf8Jat8GKr8vuOiorbeIor4EcFJ6ji91
   7l93hQI3fK/vCqWhw8cCg2gSgCs8lCYq2ZK2BRERJD8EqHZsGSo1BWouz
   Q==;
X-CSE-ConnectionGUID: goihEC0gR1i0RzMGHd/tXQ==
X-CSE-MsgGUID: zoJPGhz1R76LR0TYshlrGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="82305605"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="82305605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 13:51:59 -0800
X-CSE-ConnectionGUID: 7etZtbzuQrShq9dLdT6MIA==
X-CSE-MsgGUID: DdGtqPPcS/KOX3ZiERTzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="216173321"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Feb 2026 13:51:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voqDb-00000000lu8-0QOA;
	Sat, 07 Feb 2026 21:51:55 +0000
Date: Sun, 8 Feb 2026 05:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
Message-ID: <202602080543.P8e8Azxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
TO: 434779359@qq.com
TO: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>
CC: "Nuno Sá" <nuno.sa@analog.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>
CC: liufulin <frank.liu@faiot.com>
CC: Waqar Hameed <waqar.hameed@axis.com>
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: linux-gpio@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/434779359-qq-com/tof-Add-VL53L4CX-TOF-drivers/20260207-174646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/tencent_326708D02875274DF25B10B91402B3828606%40qq.com
patch subject: [PATCH] tof: Add VL53L4CX TOF drivers
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-r073-20260208 (https://download.01.org/0day-ci/archive/20260208/202602080543.P8e8Azxx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602080543.P8e8Azxx-lkp@intel.com/

smatch warnings:
drivers/iio/proximity/vl53l4cx-i2c.c:6262 VL53LX_i2c_decode_int16_t() warn: '65535' 65535 can't fit into 32767 'value'
drivers/iio/proximity/vl53l4cx-i2c.c:15617 VL53LX_get_device_results() warn: if statement not indented
drivers/iio/proximity/vl53l4cx-i2c.c:16134 ctrl_mz_data_blocking_common() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/iio/proximity/vl53l4cx-i2c.c:16230 ctrl_calibration_data() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/iio/proximity/vl53l4cx-i2c.c:16907 VL53LX_run_hist_xtalk_extraction() warn: for statement not indented

vim +6262 drivers/iio/proximity/vl53l4cx-i2c.c

3d80252b8a6bb2 liufulin 2026-02-07  6256  
3d80252b8a6bb2 liufulin 2026-02-07  6257  int16_t VL53LX_i2c_decode_int16_t(uint16_t count, uint8_t *pbuffer)
3d80252b8a6bb2 liufulin 2026-02-07  6258  {
3d80252b8a6bb2 liufulin 2026-02-07  6259  	int16_t    value = 0x00;
3d80252b8a6bb2 liufulin 2026-02-07  6260  
3d80252b8a6bb2 liufulin 2026-02-07  6261  	if (*pbuffer >= 0x80)
3d80252b8a6bb2 liufulin 2026-02-07 @6262  		value = 0xFFFF;
3d80252b8a6bb2 liufulin 2026-02-07  6263  
3d80252b8a6bb2 liufulin 2026-02-07  6264  	while (count-- > 0)
3d80252b8a6bb2 liufulin 2026-02-07  6265  		value = (value << 8) | (int16_t)*pbuffer++;
3d80252b8a6bb2 liufulin 2026-02-07  6266  
3d80252b8a6bb2 liufulin 2026-02-07  6267  	return value;
3d80252b8a6bb2 liufulin 2026-02-07  6268  }
3d80252b8a6bb2 liufulin 2026-02-07  6269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
