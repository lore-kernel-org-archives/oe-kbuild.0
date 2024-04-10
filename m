Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DF180A96
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 19:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712779113; cv=none; b=ZxIMDlLyEzObSAEOrpS/LeimMompPggcASzlwkWIdXgjuOEK5lh/gnC+EzGTVHxm0ZbRxa8rW5ToLeuCwTQ9uwamZGT+QPpQUeEYBA1UIkVK65VU38coAUPHBS4YxMswdfZf1s7Ldr+s5/NVlEHE6/P0RnLLSXK4OvkVjeNEDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712779113; c=relaxed/simple;
	bh=bOvgqJ5HdrYNH36AbBpRK9AGrzwILvpkiSgs/5C2GqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkhMvOe2shaPQiPR3pUFwma8NmJeiBghWRzLMRl+K5nqycQaIodnA1wY7KtwnfKXgE/No7odnRH071s6if69pAPaKdbsWP23XovXI4zni1NQ1OvicGWfBkwK2WTRAt99AKA9FAy4uCSf0tYh7YVwnKfnLh4lmD84nUhiNBdPdGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxk5QziR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxk5QziR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712779112; x=1744315112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bOvgqJ5HdrYNH36AbBpRK9AGrzwILvpkiSgs/5C2GqM=;
  b=kxk5QziR5tpoJUM3HuHb2QGzSGLGigxYcj4qwvlwOS/1UvHksoS2foiX
   VR1IVU0IcRWxUoQmiEackqpMAkl3WcX11qyQlgH9KiJGGZ8VOaU7LDQl9
   AK78MumZPlSB+intAkW5mWWwC/qoa986lB7llu9KoicfhKdiXnJxkF90h
   uhRQqNIVHFPQtRKNezM0F/AvWOmT8KHOnGa1AyPFMZIvulPDd4z+jaJjT
   i8k3bCyUUAJro+9BdfyQA6YTuo8BDcQadbKtHJf+gIgRQozj5SZG71kS0
   Z8LexbkyrasiaBOZr2uCUUzcaCkDegq1MCizZd7YEHdOp3r0Po8ic2mty
   g==;
X-CSE-ConnectionGUID: 5bxqaSm5T9aimv2KjI/2SQ==
X-CSE-MsgGUID: CvXni6t2SbCOy/M+Tf8RiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8026699"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8026699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 12:58:30 -0700
X-CSE-ConnectionGUID: oSg/diwCRTav+07x88LDKg==
X-CSE-MsgGUID: 4Vn7LYRcQLmzWc4FPA0FLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="20753183"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2024 12:58:29 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rue5S-0007kR-2A;
	Wed, 10 Apr 2024 19:58:26 +0000
Date: Thu, 11 Apr 2024 03:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/magnetometer/af8133j.c:240 af8133j_read_measurement()
 warn: inconsistent returns '&data->mutex'.
Message-ID: <202404110355.YGMSPT2j-lkp@intel.com>
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
TO: Icenowy Zheng <icenowy@aosc.io>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Dalton Durst <dalton@ubports.com>
CC: Shoji Keita <awaittrot@shjk.jp>
CC: Ondrej Jirman <megi@xff.cz>
CC: Andrey Skvortsov <andrej.skvortzov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
commit: 1d8f4b04621f0f33a3d51699ffa32ddf54fe74ed iio: magnetometer: add a driver for Voltafield AF8133J magnetometer
date:   6 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110355.YGMSPT2j-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404110355.YGMSPT2j-lkp@intel.com/

smatch warnings:
drivers/iio/magnetometer/af8133j.c:240 af8133j_read_measurement() warn: inconsistent returns '&data->mutex'.

vim +240 drivers/iio/magnetometer/af8133j.c

1d8f4b04621f0f Icenowy Zheng 2024-02-22  209  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  210  static int af8133j_read_measurement(struct af8133j_data *data, __le16 buf[3])
1d8f4b04621f0f Icenowy Zheng 2024-02-22  211  {
1d8f4b04621f0f Icenowy Zheng 2024-02-22  212  	struct device *dev = &data->client->dev;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  213  	int ret;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  214  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  215  	ret = pm_runtime_resume_and_get(dev);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  216  	if (ret) {
1d8f4b04621f0f Icenowy Zheng 2024-02-22  217  		/*
1d8f4b04621f0f Icenowy Zheng 2024-02-22  218  		 * Ignore EACCES because that happens when RPM is disabled
1d8f4b04621f0f Icenowy Zheng 2024-02-22  219  		 * during system sleep, while userspace leave eg. hrtimer
1d8f4b04621f0f Icenowy Zheng 2024-02-22  220  		 * trigger attached and IIO core keeps trying to do measurements.
1d8f4b04621f0f Icenowy Zheng 2024-02-22  221  		 */
1d8f4b04621f0f Icenowy Zheng 2024-02-22  222  		if (ret != -EACCES)
1d8f4b04621f0f Icenowy Zheng 2024-02-22  223  			dev_err(dev, "Failed to power on (%d)\n", ret);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  224  		return ret;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  225  	}
1d8f4b04621f0f Icenowy Zheng 2024-02-22  226  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  227  	scoped_guard(mutex, &data->mutex) {
1d8f4b04621f0f Icenowy Zheng 2024-02-22  228  		ret = af8133j_take_measurement(data);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  229  		if (ret)
1d8f4b04621f0f Icenowy Zheng 2024-02-22  230  			goto out_rpm_put;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  231  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  232  		ret = regmap_bulk_read(data->regmap, AF8133J_REG_OUT,
1d8f4b04621f0f Icenowy Zheng 2024-02-22  233  				       buf, sizeof(__le16) * 3);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  234  	}
1d8f4b04621f0f Icenowy Zheng 2024-02-22  235  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  236  out_rpm_put:
1d8f4b04621f0f Icenowy Zheng 2024-02-22  237  	pm_runtime_mark_last_busy(dev);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  238  	pm_runtime_put_autosuspend(dev);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  239  
1d8f4b04621f0f Icenowy Zheng 2024-02-22 @240  	return ret;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  241  }
1d8f4b04621f0f Icenowy Zheng 2024-02-22  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
