Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E80E555
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713233667; cv=none; b=EGS0ovttinfR0DCZpRrg1HcGkV0pMrst7R9Uzafp6zLxcglB91lKgfnNl/BsAZUlO/pvZJqnS9BEIKaS9R/GKOjWjS4zIo8+K1H+ULpYjv3+SlD2kDpK2RRjfFvtIsvfo71p8TUuETEe/2dYkreH4NKB3uhdsnnTY/J7pMZj9II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713233667; c=relaxed/simple;
	bh=DVaChdvMwUKA/NU22UkZwLyQDpFPj56ieHDq/dcZRHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPcjHmfJfgrLZrrjmaYOTkjiheJh0F4Yzhk+NGx4mzsqVDsBx6UANFT/9GrU7AKlBCCr01413Fp6bs7FrIbTdLFDDlzFHXfcQ2OyoNB2WJO2U91H6xvWJszbvuGnS5FyaDkBAgZQMgN4EyLPJkuxNea4KiXEQE0p1a6w8QR1hos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkiETZ27; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkiETZ27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713233666; x=1744769666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVaChdvMwUKA/NU22UkZwLyQDpFPj56ieHDq/dcZRHw=;
  b=NkiETZ27mh2AAe6yGEhXfb/LMn9EkE1bRP9MdUP8r3O6waf1F7SwaT1Z
   csO3DnpnJ7/nSGoXLFugAZ4/3+wOVyEQgHGA4cLSWBmrI/hiDSwmXD9XM
   b16dGNbGGk+mO0wLBIo01UAVp+3Sel5ZaQUU0h0IYPRleGvPvPnTNEhPF
   lC1EMRlGjl+CZzwtVLnD7t0oGpfW6CiQHlmNgq6bVbe9Ix9GNWb2KnAnv
   7p8TsAsfVgha4wPYF8GZgu4G/7aGpNXs8htb8QDPvHgzqEt50Rnn/tmgd
   J0Y0kYrwdJgwANpPZGf4lCvte1jkzXQfkPgSOLGp3FFQYY8Kj5kRaL+iN
   g==;
X-CSE-ConnectionGUID: MjnazGKYTg62xvxGS9Ct2g==
X-CSE-MsgGUID: 35R1NguLTrGIZ4MaPpjRPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8814293"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8814293"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 19:14:25 -0700
X-CSE-ConnectionGUID: wuYOQTykS3udmuQnmMSEcA==
X-CSE-MsgGUID: lJF/UfGwTkyL5cN6HkYMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26762113"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 19:14:20 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwYKv-0004qa-2f;
	Tue, 16 Apr 2024 02:14:17 +0000
Date: Tue, 16 Apr 2024 10:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tobetter:odroid-5.15.y 32/204]
 drivers/thermal/thermal_helpers.c:123 thermal_zone_get_temp() error: testing
 array offset 'tz->id' after use.
Message-ID: <202404161011.gCoUG4KZ-lkp@intel.com>
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
TO: "charles.park" <charles.park@hardkernel.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   28a16e1ab36472a36cac8b10003b29f322f458ff
commit: 80ab63aad57c0100e5277218c03ce79f4256d8c4 [32/204] ODROID-XU4: Update hack avoiding the invalid temperature by TMU broken
:::::: branch date: 19 hours ago
:::::: commit date: 2 years, 5 months ago
config: i386-randconfig-141-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161011.gCoUG4KZ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404161011.gCoUG4KZ-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_helpers.c:123 thermal_zone_get_temp() error: testing array offset 'tz->id' after use.

vim +123 drivers/thermal/thermal_helpers.c

80ab63aad57c01 charles.park     2018-06-01   81  
cd221c7b638f83 Eduardo Valentin 2016-11-07   82  int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07   83  {
cd221c7b638f83 Eduardo Valentin 2016-11-07   84  	int ret = -EINVAL;
cd221c7b638f83 Eduardo Valentin 2016-11-07   85  	int count;
cd221c7b638f83 Eduardo Valentin 2016-11-07   86  	int crit_temp = INT_MAX;
cd221c7b638f83 Eduardo Valentin 2016-11-07   87  	enum thermal_trip_type type;
cd221c7b638f83 Eduardo Valentin 2016-11-07   88  
cd221c7b638f83 Eduardo Valentin 2016-11-07   89  	if (!tz || IS_ERR(tz) || !tz->ops->get_temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07   90  		goto exit;
cd221c7b638f83 Eduardo Valentin 2016-11-07   91  
cd221c7b638f83 Eduardo Valentin 2016-11-07   92  	mutex_lock(&tz->lock);
cd221c7b638f83 Eduardo Valentin 2016-11-07   93  
cd221c7b638f83 Eduardo Valentin 2016-11-07   94  	ret = tz->ops->get_temp(tz, temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07   95  
cd221c7b638f83 Eduardo Valentin 2016-11-07   96  	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) && tz->emul_temperature) {
cd221c7b638f83 Eduardo Valentin 2016-11-07   97  		for (count = 0; count < tz->trips; count++) {
cd221c7b638f83 Eduardo Valentin 2016-11-07   98  			ret = tz->ops->get_trip_type(tz, count, &type);
cd221c7b638f83 Eduardo Valentin 2016-11-07   99  			if (!ret && type == THERMAL_TRIP_CRITICAL) {
cd221c7b638f83 Eduardo Valentin 2016-11-07  100  				ret = tz->ops->get_trip_temp(tz, count,
cd221c7b638f83 Eduardo Valentin 2016-11-07  101  						&crit_temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07  102  				break;
cd221c7b638f83 Eduardo Valentin 2016-11-07  103  			}
cd221c7b638f83 Eduardo Valentin 2016-11-07  104  		}
cd221c7b638f83 Eduardo Valentin 2016-11-07  105  
cd221c7b638f83 Eduardo Valentin 2016-11-07  106  		/*
cd221c7b638f83 Eduardo Valentin 2016-11-07  107  		 * Only allow emulating a temperature when the real temperature
cd221c7b638f83 Eduardo Valentin 2016-11-07  108  		 * is below the critical temperature so that the emulation code
cd221c7b638f83 Eduardo Valentin 2016-11-07  109  		 * cannot hide critical conditions.
cd221c7b638f83 Eduardo Valentin 2016-11-07  110  		 */
cd221c7b638f83 Eduardo Valentin 2016-11-07  111  		if (!ret && *temp < crit_temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07  112  			*temp = tz->emul_temperature;
cd221c7b638f83 Eduardo Valentin 2016-11-07  113  	}
cd221c7b638f83 Eduardo Valentin 2016-11-07  114  
80ab63aad57c01 charles.park     2018-06-01  115  	/* save thermal_zone data */
80ab63aad57c01 charles.park     2018-06-01  116  	if (!ret)
80ab63aad57c01 charles.park     2018-06-01  117  		thermal_zone_data[tz->id] = *temp;
80ab63aad57c01 charles.park     2018-06-01  118  	/*
80ab63aad57c01 charles.park     2018-06-01  119  	 * This case is that the thermal sensor is broken.
80ab63aad57c01 charles.park     2018-06-01  120  	 * That's not real temperature. Set the fake temperature value in order to
80ab63aad57c01 charles.park     2018-06-01  121  	 * avoid reaching the ciritical temperature.
80ab63aad57c01 charles.park     2018-06-01  122  	 */
80ab63aad57c01 charles.park     2018-06-01 @123  	if ((thermal_zone_data[tz->id] > CRITICAL_TEMP) && (tz->id != 4)) {
80ab63aad57c01 charles.park     2018-06-01  124  		int i, broken_sensor = 0, correct_temp = 0;
80ab63aad57c01 charles.park     2018-06-01  125  		for (i = 0; i < 4; i++) {
80ab63aad57c01 charles.park     2018-06-01  126  			if ((thermal_zone_data[i] <= CRITICAL_TEMP) &&
80ab63aad57c01 charles.park     2018-06-01  127  			    (correct_temp <= thermal_zone_data[i]))
80ab63aad57c01 charles.park     2018-06-01  128  				correct_temp = thermal_zone_data[i];
80ab63aad57c01 charles.park     2018-06-01  129  			if (thermal_zone_data[i] > CRITICAL_TEMP)
80ab63aad57c01 charles.park     2018-06-01  130  				broken_sensor++;
80ab63aad57c01 charles.park     2018-06-01  131  		}
80ab63aad57c01 charles.park     2018-06-01  132  		/*
80ab63aad57c01 charles.park     2018-06-01  133  		 * if all thermal sensor broken then critical temperature data send
80ab63aad57c01 charles.park     2018-06-01  134  		 * for system poweroff.
80ab63aad57c01 charles.park     2018-06-01  135  		 */
80ab63aad57c01 charles.park     2018-06-01  136  		*temp = (broken_sensor == 4) ? CRITICAL_TEMP : correct_temp;
80ab63aad57c01 charles.park     2018-06-01  137  	}
80ab63aad57c01 charles.park     2018-06-01  138  
cd221c7b638f83 Eduardo Valentin 2016-11-07  139  	mutex_unlock(&tz->lock);
cd221c7b638f83 Eduardo Valentin 2016-11-07  140  exit:
cd221c7b638f83 Eduardo Valentin 2016-11-07  141  	return ret;
cd221c7b638f83 Eduardo Valentin 2016-11-07  142  }
cd221c7b638f83 Eduardo Valentin 2016-11-07  143  EXPORT_SYMBOL_GPL(thermal_zone_get_temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07  144  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
