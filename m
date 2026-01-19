Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076E2DD60E
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854739; cv=none; b=Yg4pwDXD/da4ycCKd28coDLWoDARQth1PgZWtsA4HH96wTwxf0U8PI7nXmuEtXr9s5gvLh9NEiKLtmBXbSlAxRjzslD6P/Bn+xKU/0/pc7l36W60f1g58sXRwGkIu0Kdxo2jq7LOdzxVWa718SnPtYQ+PS0Udue9gKMuNMLWIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854739; c=relaxed/simple;
	bh=ufViNkYSE11SU3IS8US9vmL/0OIs52e+X2XSeEtX2/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAzhHYtUgmRCK9MmVEusI/23ioc/4lfCy8xlMa1Hn5dyRNaYivetNC4uFw2L9AEXQLy7ZvO0ZtsBPcBz5a7maa1D0xEkw4ucFbW+QMcmOVFs+YQFP6LZflB5Kp7mmSxRIfKktL6uKebA4hf/DGgxIshl5f4xbNydcsgXD2BTsWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH4nJk79; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH4nJk79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768854738; x=1800390738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ufViNkYSE11SU3IS8US9vmL/0OIs52e+X2XSeEtX2/U=;
  b=IH4nJk79OpF51kq232BeA0XQiImYSjGJZybiEu9t4AR8kI2koSUoDEXM
   74EIOwCCQ3ZjtZwcJ+es+RdHrgFbnZPBIT/0t46m8EExPoZ5iELeNaory
   gKMSjtMJVbUy48xQhPKvLuX2dezQuIFPWgV9yRJsJl8HIOjOKY1nC97CO
   dENLH0QZuLFlvyGuGKHltSRnxjhXpwaAeqqzbcF/As2ouuNIkysQwdMz/
   nhBSYQH/p8recCKa6qyxAGK/uDTxP6tdA58cW4+PvLcRZMvqKqyDJYjA1
   oWUt4kQnWWZsTX94lpuq+vxJLpAF0Ewa76UK7W5PVVGfAHNe1x5YTGKEr
   g==;
X-CSE-ConnectionGUID: 2M9RqQTOTnO/BPJwf4WLFQ==
X-CSE-MsgGUID: FfrZNU3gR6ih4Sef0tDDdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95539198"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95539198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 12:32:17 -0800
X-CSE-ConnectionGUID: nldgYQX1QvCfuC3GUKpmsw==
X-CSE-MsgGUID: eU8VtNYBS/S69JKUAsaWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="228877532"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 12:32:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvv3-00000000OHh-0FXW;
	Mon, 19 Jan 2026 20:32:13 +0000
Date: Tue, 20 Jan 2026 04:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/3] iio: imu: st_lsm6dsx: add support for rotation
 sensor
Message-ID: <202601200451.4BeA8JAe-lkp@intel.com>
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
In-Reply-To: <20260119100449.1559624-4-flavra@baylibre.com>
References: <20260119100449.1559624-4-flavra@baylibre.com>
TO: Francesco Lavra <flavra@baylibre.com>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[cannot apply to linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Lavra/iio-imu-st_lsm6dsx-set-FIFO-ODR-for-accelerometer-and-gyroscope-only/20260119-181615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260119100449.1559624-4-flavra%40baylibre.com
patch subject: [PATCH v3 3/3] iio: imu: st_lsm6dsx: add support for rotation sensor
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: sparc-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200451.4BeA8JAe-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200451.4BeA8JAe-lkp@intel.com/

smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_fusion.c:90 st_lsm6dsx_sf_set_odr() error: uninitialized symbol 'odr_val'.

vim +/odr_val +90 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_fusion.c

aa03865dcb5ed7 Francesco Lavra 2026-01-19   69  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   70  int st_lsm6dsx_sf_set_odr(struct st_lsm6dsx_sensor *sensor, bool enable)
aa03865dcb5ed7 Francesco Lavra 2026-01-19   71  {
aa03865dcb5ed7 Francesco Lavra 2026-01-19   72  	struct st_lsm6dsx_hw *hw = sensor->hw;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   73  	const struct st_lsm6dsx_sf_settings *settings;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   74  	u8 data;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   75  	int err;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   76  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   77  	guard(mutex)(&hw->page_lock);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   78  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   79  	err = st_lsm6dsx_sf_set_page(hw, true);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   80  	if (err < 0)
aa03865dcb5ed7 Francesco Lavra 2026-01-19   81  		return err;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   82  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   83  	settings = &hw->settings->sf_settings;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   84  	if (enable) {
aa03865dcb5ed7 Francesco Lavra 2026-01-19   85  		u8 odr_val;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   86  		const struct st_lsm6dsx_reg *reg = &settings->odr_table.reg;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   87  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   88  		st_lsm6dsx_sf_get_odr_val(settings, sensor->hwfifo_odr_mHz,
aa03865dcb5ed7 Francesco Lavra 2026-01-19   89  					  &odr_val);
aa03865dcb5ed7 Francesco Lavra 2026-01-19  @90  		data = ST_LSM6DSX_SHIFT_VAL(odr_val, reg->mask);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   91  		err = regmap_update_bits(hw->regmap, reg->addr, reg->mask,
aa03865dcb5ed7 Francesco Lavra 2026-01-19   92  					 data);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   93  		if (err < 0)
aa03865dcb5ed7 Francesco Lavra 2026-01-19   94  			goto out;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   95  	}
aa03865dcb5ed7 Francesco Lavra 2026-01-19   96  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   97  	err = regmap_assign_bits(hw->regmap, settings->fifo_enable.addr,
aa03865dcb5ed7 Francesco Lavra 2026-01-19   98  				 settings->fifo_enable.mask, enable);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   99  	if (err < 0)
aa03865dcb5ed7 Francesco Lavra 2026-01-19  100  		goto out;
aa03865dcb5ed7 Francesco Lavra 2026-01-19  101  
aa03865dcb5ed7 Francesco Lavra 2026-01-19  102  	return st_lsm6dsx_sf_set_page(hw, false);
aa03865dcb5ed7 Francesco Lavra 2026-01-19  103  
aa03865dcb5ed7 Francesco Lavra 2026-01-19  104  out:
aa03865dcb5ed7 Francesco Lavra 2026-01-19  105  	st_lsm6dsx_sf_set_page(hw, false);
aa03865dcb5ed7 Francesco Lavra 2026-01-19  106  
aa03865dcb5ed7 Francesco Lavra 2026-01-19  107  	return err;
aa03865dcb5ed7 Francesco Lavra 2026-01-19  108  }
aa03865dcb5ed7 Francesco Lavra 2026-01-19  109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
