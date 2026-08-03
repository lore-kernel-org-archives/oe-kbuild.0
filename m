Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368B433E73
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Aug 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789970; cv=none; b=hH8+SY6L0iN3kHNCjHS6xzQMDLBU/cuH9CvhAzMJN3Wd50oSw7tnAnyMZMmEgSOI5OF55Ux1Qp23vou12d4X64gz2wRwqdwjMgKMHG37MspdZY4g9DDNq2V8oya7o3rC1Q3bROD9pcJoPEvDfbp2SlDobuMU+IQCHS1mGnG4bws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789970; c=relaxed/simple;
	bh=rSkVcPJNlVbFf1TGVb05GD4bmz6C9V9HifXTQvAHRHM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=maFvo/tqNq8IEx+rVLMX1SIVL0OLh061y4ZeUsHrRn9XU8dP/D/ia0moK0iDvV5V0J3hBkOF8edftJYo/fLl8v/Oj9uShvxUGoboaiPrF5juNn1sK92aMwEwcW17o3w9ZlfV8aZg8/c2HQPdLK64DO3pjiB09Y9xhwKIY8Oyu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+3NuGHw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+3NuGHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785789969; x=1817325969;
  h=date:from:to:cc:subject:message-id;
  bh=rSkVcPJNlVbFf1TGVb05GD4bmz6C9V9HifXTQvAHRHM=;
  b=Z+3NuGHwMLXdshlqvtS78scZTtw1/hIurCkeJaNXuZwdwzhTwWGQmE7h
   /ESWimkr2/Y1IFRrGNhUZd0TqdNqSh6Ce5JastiB4qsBCVl6yAv4kZ4oL
   QoqSq8Yyaq5dQE/pKK6WhVenbhH/RxcFENoNTL2r2P4LtcMivR+mG2WcV
   fZLbDTkgSFztnaxENuzdLdiS5p6c0yVsj4ccy7LGeGQm/3ytrvmAjo4th
   vae0C/R18+K4CYKVG+hgqmOAX2VM/mQaI2kf+P3cBIqLQin3qdzg+3TUX
   e9PZpv3hJ1mYRsVkzImPMdmxwpTpyAJUBOM9GL2eEOEm6hikKEEYPqdPZ
   Q==;
X-CSE-ConnectionGUID: 0WR9khb+Sv+QBjam0nrgaQ==
X-CSE-MsgGUID: gESEmfepTZmha01td9uWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85314117"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="85314117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:46:08 -0700
X-CSE-ConnectionGUID: ykXI/TegQ4Ou0AHaZJdLfw==
X-CSE-MsgGUID: LpSke48sQr2NiEVxtB/4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="265150324"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2026 13:46:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqzXx-000000007xB-0hN2;
	Mon, 03 Aug 2026 20:46:05 +0000
Date: Tue, 04 Aug 2026 04:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c:45:22:
 error: implicit declaration of function 'FIELD_GET'
Message-ID: <202608040410.Ph7dONVc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Chris-Morgan/dt-bindings-iio-imu-icm42600-Add-mount-matrix/20260728-053131, commit: 140aab1534e8bbe68a79b7dde3062baf3e6d8e37"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chris Morgan <macromorgan@hotmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-iio-imu-icm42600-Add-mount-matrix/20260728-053131
head:   3b6203ea85a8fd56d5a9496998585e247cd94164
commit: 140aab1534e8bbe68a79b7dde3062baf3e6d8e37 iio: imu: inv_icm42607: Add Temp Support in icm42607
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040410.Ph7dONVc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040410.Ph7dONVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040410.Ph7dONVc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c: In function 'inv_icm42607_temp_read':
>> drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c:45:22: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      45 |         accel_mode = FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
         |                      ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +45 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c

140aab1534e8bb Chris Morgan 2026-07-27  18  
140aab1534e8bb Chris Morgan 2026-07-27  19  static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *temp)
140aab1534e8bb Chris Morgan 2026-07-27  20  {
140aab1534e8bb Chris Morgan 2026-07-27  21  	struct inv_icm42607_sensor_conf conf = INV_ICM42607_SENSOR_CONF_INIT;
140aab1534e8bb Chris Morgan 2026-07-27  22  	struct device *dev = regmap_get_device(st->map);
140aab1534e8bb Chris Morgan 2026-07-27  23  	int ret, gyro_mode, accel_mode;
140aab1534e8bb Chris Morgan 2026-07-27  24  	unsigned int val;
140aab1534e8bb Chris Morgan 2026-07-27  25  	u8 raw[2];
140aab1534e8bb Chris Morgan 2026-07-27  26  
140aab1534e8bb Chris Morgan 2026-07-27  27  	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
140aab1534e8bb Chris Morgan 2026-07-27  28  	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
140aab1534e8bb Chris Morgan 2026-07-27  29  	if (ret)
140aab1534e8bb Chris Morgan 2026-07-27  30  		return ret;
140aab1534e8bb Chris Morgan 2026-07-27  31  
140aab1534e8bb Chris Morgan 2026-07-27  32  	guard(mutex)(&st->lock);
140aab1534e8bb Chris Morgan 2026-07-27  33  
140aab1534e8bb Chris Morgan 2026-07-27  34  	/*
140aab1534e8bb Chris Morgan 2026-07-27  35  	 * Check if both the gyro and accel are off and if so, enable one
140aab1534e8bb Chris Morgan 2026-07-27  36  	 * of them. The temp sensor cannot be read if both the gyro and
140aab1534e8bb Chris Morgan 2026-07-27  37  	 * accel sensor are off. Prefer to enable the accel over the gyro
140aab1534e8bb Chris Morgan 2026-07-27  38  	 * as the datasheet says the gyro uses 5x more power and it has
140aab1534e8bb Chris Morgan 2026-07-27  39  	 * a minimum run time of 45ms.
140aab1534e8bb Chris Morgan 2026-07-27  40  	 */
140aab1534e8bb Chris Morgan 2026-07-27  41  	ret = regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
140aab1534e8bb Chris Morgan 2026-07-27  42  	if (ret)
140aab1534e8bb Chris Morgan 2026-07-27  43  		return ret;
140aab1534e8bb Chris Morgan 2026-07-27  44  
140aab1534e8bb Chris Morgan 2026-07-27 @45  	accel_mode = FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
140aab1534e8bb Chris Morgan 2026-07-27  46  	gyro_mode = FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
140aab1534e8bb Chris Morgan 2026-07-27  47  	if (!gyro_mode && !accel_mode) {
140aab1534e8bb Chris Morgan 2026-07-27  48  		/* enable accel sensor */
140aab1534e8bb Chris Morgan 2026-07-27  49  		conf.mode = INV_ICM42607_SENSOR_MODE_LOW_NOISE;
140aab1534e8bb Chris Morgan 2026-07-27  50  		ret = inv_icm42607_set_sensor_conf(st, &conf, IIO_ACCEL);
140aab1534e8bb Chris Morgan 2026-07-27  51  		if (ret)
140aab1534e8bb Chris Morgan 2026-07-27  52  			return ret;
140aab1534e8bb Chris Morgan 2026-07-27  53  	}
140aab1534e8bb Chris Morgan 2026-07-27  54  
140aab1534e8bb Chris Morgan 2026-07-27  55  	ret = regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1,
140aab1534e8bb Chris Morgan 2026-07-27  56  			       raw, sizeof(raw));
140aab1534e8bb Chris Morgan 2026-07-27  57  	if (ret)
140aab1534e8bb Chris Morgan 2026-07-27  58  		return ret;
140aab1534e8bb Chris Morgan 2026-07-27  59  
140aab1534e8bb Chris Morgan 2026-07-27  60  	*temp = get_unaligned_be16(raw);
140aab1534e8bb Chris Morgan 2026-07-27  61  	if (*temp == INV_ICM42607_DATA_INVALID)
140aab1534e8bb Chris Morgan 2026-07-27  62  		return -EINVAL;
140aab1534e8bb Chris Morgan 2026-07-27  63  
140aab1534e8bb Chris Morgan 2026-07-27  64  	return 0;
140aab1534e8bb Chris Morgan 2026-07-27  65  }
140aab1534e8bb Chris Morgan 2026-07-27  66  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
