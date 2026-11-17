Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877534;
	b=1J/m7LtLAqeTyBcWjPmr/U5rnYNiEoW+3eEDruU7E043JwdzVp2o6IHbF9npdpe11V3P
	 TRq6S/coQ9mueAkKpcZsAQySiRJWmiH7ld5fcKryyNYLz7iRFEezFrVxO0zLytOIiBO+F
	 t+yqPgnOWjw/2s9A9U6jGWjHPqmJrVvBzdAxUtkuQev+n9WJYFNs1xfrKw83SqSS0riUF
	 0DtZjblFBNa0MwhirO0MNSsdW6+WRB2vTyp2qXqUJGpRcfh/L0ciI8e3EURNW/g/tDt/E
	 i9riD7yX32zxNXDjxP2i9/mFdEeT1MB4z9z2L8iyWORoFPH8PCEpIXi+jwYUEYlWWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877534;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cgJ/QwBuu+7AQ8VlMSW8nBSVcUPKhdh7no/Sr8bM6R4=;
	b=h3cTh8vqgcS42P4FLvpGd+dXiYrX1GcvWR7cJmMRMVUMkNrjy3EuoPxAw8ZSIDcE633q
	 jr9TtOVtoUIRPZ7wkUdzHrKhV0DtWE2hQnOkN677pyxymFKywJszeoPPFNbyptw4CMCBv
	 JaikTMcGjRY2+gTihiAWnxAcCQC/QwB4YV2BiJWGMdOTNyrV7TZfwJHRERcqe4KNVvQnm
	 5abKvAKpcNWiMokr+ArmlIGAHHgy63HXXOsgcPHHnivmRcy4znup6PZjyT2XmqU5gY5D5
	 ZuHu3fchPuqURMm9L5JS+0ZLHRJZMQuKSrrDrWkNdcuXSJQU7RrmoacdcAQBTPVyayQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jGOyJ4DD;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF760A2628
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 01:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CF760A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jGOyJ4DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794877534; x=1826413534;
  h=date:from:to:cc:subject:message-id;
  bh=wxoL7cQvpGkLIOQyANqsGV94xosDBVTRcdBUTwkMEfA=;
  b=jGOyJ4DDe+NsKEPO2rpLl04t2IUparV7FXP8w1jrwJgJR4t5pEShPPYo
   CLpWG/wgsB8diCOYA7Ozc4gm7AFH0rxU8wrFT5Sfbm+kfz9ufZYbZEGlX
   M0briYigHNTz0SPLZCGEYTnpZEk3E5IukB6OVLPnYZ4lVrA97tz/5VuWC
   2Rva8oYPC7Da+gYbLKqgGez0dfmwDTN+kx7GEl06VLmmfIwYLYq7QpCsT
   TlPZlFONAPsSKw4d53Gz6P0lRyY+qxDt0DqXHLDl2dlbWs02RgRznMPPR
   E6SZoB2AeD0I4yR4URZKgF1DQfCHaHFd8IqxH5gybgspkWX394oQLOb3h
   w==;
X-CSE-ConnectionGUID: p8/2o5D7ScmJ+qU0GZ83HA==
X-CSE-MsgGUID: 9VvbYIPNRt6RmWObzGkSwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3740657"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3740657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:05:32 -0800
X-CSE-ConnectionGUID: 83/qa8skRACqnUtLwpQg5Q==
X-CSE-MsgGUID: GNz47fXzR1m6ZnkKMVsvHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9587829"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 17:05:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT7dZ-000000002uD-20Oe;
	Tue, 17 Nov 2026 01:05:29 +0000
Date: Tue, 17 Nov 2026 02:05:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: soc-acpi-intel-sdca-quirks.c:undefined reference to
 `sdca_device_quirk_match'
Message-ID: <202611170146.EB5xMPGo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   141b164bbe186423e295b139e40e8e2d11cf1341
commit: 677507a5303a6716d9e0bbf3a8ba8c0f27391ab2 ASoC: SDCA: allow building without ACPI
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: parisc-randconfig-r2311-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170146.EB5xMPGo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170146.EB5xMPGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 677507a5303a ("ASoC: SDCA: allow building without ACPI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170146.EB5xMPGo-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: hppa-linux-ld: DWARF error: could not find abbrev number 101
   sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o: in function `snd_soc_acpi_intel_sdca_is_device_rt712_vb':
>> soc-acpi-intel-sdca-quirks.c:(.text+0x58): undefined reference to `sdca_device_quirk_match'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
