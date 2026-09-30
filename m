Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE944AB7A
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799220; cv=none; b=iX3iT8rtnXjyGbymFu2166BWUxgcbyKCYMvlmBuwf2dxXe3hHvbGyaExyaRhPfl+pQ5TBVASAYlfWOgnn0a0/sv8zLc6vCAkeilFDR4IIRbKCCvFghGjVduumNkynOcNGnWDmZdDVh8TYMmZQymtsJa8ZNyKzd0an+11yTA9j7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799220; c=relaxed/simple;
	bh=fkidsp49oqHgXgJI82FAeyPEb1I61FoQnr9YZ2biAs4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ceCpn4KICyAP8V4uu1WfLhgIzeKDdr/XOLEFaYHP5jZ9HtkyG6YVJVDxV9YPCrPKYtpWlUJAW/Y0zr+D3GTboLOc3zcl9UUy2dlTqR0yJewy21YzdnVl0GePyVoEsnSx2vqh3BHC4h2+UQ8IcqeOfh2CmsrlQPtz1coguurfs+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGnhTaFG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGnhTaFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790799218; x=1822335218;
  h=date:from:to:cc:subject:message-id;
  bh=fkidsp49oqHgXgJI82FAeyPEb1I61FoQnr9YZ2biAs4=;
  b=WGnhTaFGo6wENx11zwqeyQ6+PCiL7JnnZpkdoc39UK0rclcjoD45uBcZ
   GAY1GcA8ZtszY5JRukwDdeORtpgMGwrJkNwkNSAOvyCiHvoSV73gbwO2N
   UrQmcVgzvEIsm6vU4rNv0IzRh9x2IogVNzz5p9yfQy1Fcpq3SEnWEabFd
   6yTeiHBevB4VnyhAETqc9ui1dPM8XeE9LUPNDOzQL+2n3Agfp1OUorgIm
   flIhCjNddHTzir90GykRKrvcBAmmumKI5TSw2cxKkVTbWfePUdmJRWBht
   SlWDnpvDQhq/FTs4cn1wODdkwjfiTEl2VwIDoYqXEuxDj64t60tsAQpKq
   w==;
X-CSE-ConnectionGUID: OmACXxQxSnq4uytPoBi9XQ==
X-CSE-MsgGUID: QJF6yS1YQR+VC6a0pzYcKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90315372"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90315372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 13:13:38 -0700
X-CSE-ConnectionGUID: +tj6UKQBRn+TQN7pJItaUg==
X-CSE-MsgGUID: qsoMeLbCSjSkfnHcf75AEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275328308"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 13:13:37 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC0gH-000000001zB-29O8;
	Wed, 30 Sep 2026 20:13:33 +0000
Date: Wed, 30 Sep 2026 22:12:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7955/12559] drivers/iio/adc/ad7768.c:193
 ad7768_precharge_buf2_mask() warn: subtract is higher precedence than shift
Message-ID: <202609302225.Nn9X0tWf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janani Sunil <janani.sunil@analog.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: 508bdb4938928597f1b9b0fdb0d9a8765e0e4bff [7955/12559] iio: adc: Add AD7768 and AD7768-4 core support
:::::: branch date: 6 hours ago
:::::: commit date: 8 days ago
config: sparc64-randconfig-r2201-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302225.Nn9X0tWf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609302225.Nn9X0tWf-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7768.c:193 ad7768_precharge_buf2_mask() warn: subtract is higher precedence than shift
drivers/iio/adc/ad7768.c:193 ad7768_precharge_buf2_mask() warn: subtract is higher precedence than shift
drivers/iio/adc/ad7768.c:193 ad7768_precharge_buf2_mask() warn: subtract is higher precedence than shift
drivers/iio/adc/ad7768.c:193 ad7768_precharge_buf2_mask() warn: subtract is higher precedence than shift

vim +193 drivers/iio/adc/ad7768.c

508bdb49389285 Janani Sunil 2026-09-16  188  
508bdb49389285 Janani Sunil 2026-09-16  189  static u8 ad7768_precharge_buf2_mask(const struct ad7768_state *st, u16 val)
508bdb49389285 Janani Sunil 2026-09-16  190  {
508bdb49389285 Janani Sunil 2026-09-16  191  	unsigned int split = st->chip_info->prebuf_split;
508bdb49389285 Janani Sunil 2026-09-16  192  
508bdb49389285 Janani Sunil 2026-09-16 @193  	return field_get(GENMASK(2 * split - 1, split), val);
508bdb49389285 Janani Sunil 2026-09-16  194  }
508bdb49389285 Janani Sunil 2026-09-16  195  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
