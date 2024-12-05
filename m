Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8613E1B393B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733433722; cv=none; b=Jl1b5dncUyqmNqgbnCW1jQLFWqnhIPZRcHEgRdG9wrzfBpVXSJw+2uwYGag8DgXTf+2S+9gjgW2w1h62DRCYAynnMubRg5oxoCwRz1ZJobJC2NEEKEN2NOl9I63jwJ09FhzZzBH84ihWTK6ZSweWv4lzBtCcMFNdLrMM/b55esY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733433722; c=relaxed/simple;
	bh=nsu3Vi4nCb6vV8fxzHMjn0Zm65SGXs257phObLFlDEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXZcmJFHXUqVAcWs9X4BoeGTsBf59IQRKHPvSlv7YrC7WdhFIqjJY3JpM1RrTKrZLf2PAir6tlNRtG34Qu4pWEttatu5zoUr4SshJRKtz7AL/9naYz3QhJsW2Nc0MxWinKeLSm8NRD7qJ8og/3lcd2tGBaefva6bfDMy65Ln/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWTevi0/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWTevi0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733433720; x=1764969720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nsu3Vi4nCb6vV8fxzHMjn0Zm65SGXs257phObLFlDEk=;
  b=cWTevi0/QN+UKe1IMUqX7QD86o36tjZ0ZuZk3uHCQgm6HuxTEcMt9bBB
   9Tbw8U8I4yEY4fazs8/D6on8WROQFbvAViBt/ViJBBWa+AEjoy48hiUj2
   0FX5ClOHGotcRNvQsoGsWXa3GFHuTZKInCZnxabLYSoe5Dbh9A92FCxkq
   48RHyjY6XAxKXvdPVvTadEUW7Yw1XAVYT3CUN5WQ6wy6p8ZxSh9TZJHnn
   oPXVMkI3tUH422Xwngl8rVMP8lax5nZD33ghvj29h3Xe8Ee9YgzAHpit7
   /PBPxP1X16Ny2KbUYREdufm4Huc8yJptj3nr72UQOOHZxVD5BSPwRSwuk
   w==;
X-CSE-ConnectionGUID: WLuGncD+R7Ci9pj/QX8c3Q==
X-CSE-MsgGUID: 4qmITSPWRVKQYSuB2iMh7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37445959"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="37445959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 13:21:59 -0800
X-CSE-ConnectionGUID: rtxVueKHTbOSOg4VxO+nwQ==
X-CSE-MsgGUID: gu5NTRiuS92ftH2Gy+Xupg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="99177471"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2024 13:21:58 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJJIJ-0000Ov-11;
	Thu, 05 Dec 2024 21:21:55 +0000
Date: Fri, 6 Dec 2024 05:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v4 10/10] iio: accel: adxl345: add kfifo with watermark
Message-ID: <202412060455.YbuXxQ8B-lkp@intel.com>
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
In-Reply-To: <20241204182451.144381-11-l.rubusch@gmail.com>
References: <20241204182451.144381-11-l.rubusch@gmail.com>
TO: Lothar Rubusch <l.rubusch@gmail.com>
TO: lars@metafoo.de
TO: Michael.Hennerich@analog.com
TO: jic23@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: eraretuya@gmail.com
CC: l.rubusch@gmail.com

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/iio-accel-adxl345-fix-comment-on-probe/20241205-024402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241204182451.144381-11-l.rubusch%40gmail.com
patch subject: [PATCH v4 10/10] iio: accel: adxl345: add kfifo with watermark
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: m68k-randconfig-r061-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060455.YbuXxQ8B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412060455.YbuXxQ8B-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/adxl345_core.c:441:5-13: WARNING: Unsigned expression compared with zero: int_stat < 0

vim +441 drivers/iio/accel/adxl345_core.c

faf6855881a930 Lothar Rubusch 2024-12-04  425  
faf6855881a930 Lothar Rubusch 2024-12-04  426  /**
faf6855881a930 Lothar Rubusch 2024-12-04  427   * adxl345_event_handler() - Handle events of the ADXL345.
faf6855881a930 Lothar Rubusch 2024-12-04  428   * @irq: The irq being handled.
faf6855881a930 Lothar Rubusch 2024-12-04  429   * @p: The struct iio_device pointer for the device.
faf6855881a930 Lothar Rubusch 2024-12-04  430   *
faf6855881a930 Lothar Rubusch 2024-12-04  431   * Return: The interrupt was handled.
faf6855881a930 Lothar Rubusch 2024-12-04  432   */
faf6855881a930 Lothar Rubusch 2024-12-04  433  static irqreturn_t adxl345_event_handler(int irq, void *p)
faf6855881a930 Lothar Rubusch 2024-12-04  434  {
faf6855881a930 Lothar Rubusch 2024-12-04  435  	struct iio_dev *indio_dev = p;
faf6855881a930 Lothar Rubusch 2024-12-04  436  	struct adxl345_state *st = iio_priv(indio_dev);
faf6855881a930 Lothar Rubusch 2024-12-04  437  	u8 int_stat;
faf6855881a930 Lothar Rubusch 2024-12-04  438  	int samples;
faf6855881a930 Lothar Rubusch 2024-12-04  439  
faf6855881a930 Lothar Rubusch 2024-12-04  440  	int_stat = adxl345_get_status(st);
faf6855881a930 Lothar Rubusch 2024-12-04 @441  	if (int_stat < 0)
faf6855881a930 Lothar Rubusch 2024-12-04  442  		return IRQ_NONE;
faf6855881a930 Lothar Rubusch 2024-12-04  443  
faf6855881a930 Lothar Rubusch 2024-12-04  444  	if (int_stat == 0x0)
faf6855881a930 Lothar Rubusch 2024-12-04  445  		goto err;
faf6855881a930 Lothar Rubusch 2024-12-04  446  
faf6855881a930 Lothar Rubusch 2024-12-04  447  	if (int_stat & ADXL345_INT_OVERRUN)
faf6855881a930 Lothar Rubusch 2024-12-04  448  		goto err;
faf6855881a930 Lothar Rubusch 2024-12-04  449  
faf6855881a930 Lothar Rubusch 2024-12-04  450  	if (int_stat & (ADXL345_INT_DATA_READY | ADXL345_INT_WATERMARK)) {
faf6855881a930 Lothar Rubusch 2024-12-04  451  		samples = adxl345_get_samples(st);
faf6855881a930 Lothar Rubusch 2024-12-04  452  		if (samples < 0)
faf6855881a930 Lothar Rubusch 2024-12-04  453  			goto err;
faf6855881a930 Lothar Rubusch 2024-12-04  454  
faf6855881a930 Lothar Rubusch 2024-12-04  455  		if (adxl345_fifo_push(indio_dev, samples) < 0)
faf6855881a930 Lothar Rubusch 2024-12-04  456  			goto err;
faf6855881a930 Lothar Rubusch 2024-12-04  457  
faf6855881a930 Lothar Rubusch 2024-12-04  458  	}
faf6855881a930 Lothar Rubusch 2024-12-04  459  	return IRQ_HANDLED;
faf6855881a930 Lothar Rubusch 2024-12-04  460  
faf6855881a930 Lothar Rubusch 2024-12-04  461  err:
faf6855881a930 Lothar Rubusch 2024-12-04  462  	adxl345_fifo_reset(st);
faf6855881a930 Lothar Rubusch 2024-12-04  463  
faf6855881a930 Lothar Rubusch 2024-12-04  464  	return IRQ_HANDLED;
faf6855881a930 Lothar Rubusch 2024-12-04  465  }
faf6855881a930 Lothar Rubusch 2024-12-04  466  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
