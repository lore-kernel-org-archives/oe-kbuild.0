Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD13B674
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734155457; cv=none; b=oroIa0hiZEeTss+tcb0FGZkmzq6djLunepUfab3hJBGhFwtAVpnuJLMOf2R2Ck16JxQgHPKg5ut5JQa2Xw+8SmdKcptfuG+i3YPGrR/qjTTpQJmOG0swbQvq4XHGNbgSyUhDYdrYCJ0dUpEElMdpOV3SVBqac1AuFyUt1RWZJzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734155457; c=relaxed/simple;
	bh=Xav6PgOu7EBWS/fr1Vb4d0Kr4OI6ptTz4O9+T8ewXpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNguJp+pDcu7XkLlSK/4LCoTtTQNRcoXAtDzNx+YTB3sWrFq7gjxCcpP1MCfWqmJe0T6AFdMIeNpX3I7D/vRuMS7yqGn9fxHajYavG/tZRkzl4tSfdL57ElUBJ8lSeqVkNqqNdoPjgNkt1dU5Gwv7OECYmSCCFoe0oTTUagSXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT/ZnrMF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT/ZnrMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734155453; x=1765691453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xav6PgOu7EBWS/fr1Vb4d0Kr4OI6ptTz4O9+T8ewXpM=;
  b=jT/ZnrMFcYfUT+eFz0WYtlrB4ajXV78rtGbcXmCL3ek7oJSbo1WOFIls
   QTNQOiMxgVfGSX1j0PsGHWCenCZWEdOT8flDqiYSSJMnx2Z2HtzBJ7NO7
   SQlzjtUV1pFVxkRlpDcqYWdP4LSWCzipj9MFMasCxuVojFXTfDfeDsZOg
   TZRoF7oXdcjnt0diyQJqkHMCzRCMzQSIJhE6UDYecQYan4OiiyAWSVZRi
   2hJrCO2FR3J3fYO7taPYNEoetKILVj/2twRpEDdPtLnfgOmrsFKgGq5PK
   W5Tq3H9NuY+VUT3JG9xsMc/fZ1VQUg55xqDQF5fhxe8R9hGfCyUZ2xuAC
   Q==;
X-CSE-ConnectionGUID: 7UsgbTXqSgCDhfViy0Ol3w==
X-CSE-MsgGUID: A7pat6wnQ0CPtH2IYbEFVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="37462966"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="37462966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 21:50:52 -0800
X-CSE-ConnectionGUID: U7nDbkGaQDmYwSI5f+g9SA==
X-CSE-MsgGUID: 94CdZE8ZTGSRm5722TGKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134068726"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2024 21:50:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tML3A-000Cjz-2c;
	Sat, 14 Dec 2024 05:50:48 +0000
Date: Sat, 14 Dec 2024 13:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/bridge/ite-it6505.c:2316:8-25: opportunity for
 str_high_low(it6505 -> hpd_state)
Message-ID: <202412141359.JWYYtGAL-lkp@intel.com>
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
TO: Allen Chen <allen.chen@ite.com.tw>
CC: Robert Foss <robert.foss@linaro.org>
CC: Hermes Wu <hermes.wu@ite.com.tw>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 drm/bridge: add it6505 driver
date:   2 years, 10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 years, 10 months ago
config: x86_64-randconfig-101-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141359.JWYYtGAL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412141359.JWYYtGAL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/ite-it6505.c:2316:8-25: opportunity for str_high_low(it6505 -> hpd_state)

vim +2316 drivers/gpu/drm/bridge/ite-it6505.c

b5c84a9edcd418 Allen Chen 2022-01-14  2309  
b5c84a9edcd418 Allen Chen 2022-01-14  2310  static void it6505_irq_hpd(struct it6505 *it6505)
b5c84a9edcd418 Allen Chen 2022-01-14  2311  {
b5c84a9edcd418 Allen Chen 2022-01-14  2312  	struct device *dev = &it6505->client->dev;
b5c84a9edcd418 Allen Chen 2022-01-14  2313  
b5c84a9edcd418 Allen Chen 2022-01-14  2314  	it6505->hpd_state = it6505_get_sink_hpd_status(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2315  	DRM_DEV_DEBUG_DRIVER(dev, "hpd change interrupt, change to %s",
b5c84a9edcd418 Allen Chen 2022-01-14 @2316  			     it6505->hpd_state ? "high" : "low");
b5c84a9edcd418 Allen Chen 2022-01-14  2317  
b5c84a9edcd418 Allen Chen 2022-01-14  2318  	if (it6505->bridge.dev)
b5c84a9edcd418 Allen Chen 2022-01-14  2319  		drm_helper_hpd_irq_event(it6505->bridge.dev);
b5c84a9edcd418 Allen Chen 2022-01-14  2320  	DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
b5c84a9edcd418 Allen Chen 2022-01-14  2321  			     it6505->sink_count);
b5c84a9edcd418 Allen Chen 2022-01-14  2322  
b5c84a9edcd418 Allen Chen 2022-01-14  2323  	if (it6505->hpd_state) {
b5c84a9edcd418 Allen Chen 2022-01-14  2324  		wait_for_completion_timeout(&it6505->wait_edid_complete,
b5c84a9edcd418 Allen Chen 2022-01-14  2325  					    msecs_to_jiffies(6000));
b5c84a9edcd418 Allen Chen 2022-01-14  2326  		it6505_lane_termination_on(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2327  		it6505_lane_power_on(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2328  
b5c84a9edcd418 Allen Chen 2022-01-14  2329  		/*
b5c84a9edcd418 Allen Chen 2022-01-14  2330  		 * for some dongle which issue HPD_irq
b5c84a9edcd418 Allen Chen 2022-01-14  2331  		 * when sink count change from  0->1
b5c84a9edcd418 Allen Chen 2022-01-14  2332  		 * it6505 not able to receive HPD_IRQ
b5c84a9edcd418 Allen Chen 2022-01-14  2333  		 * if HW never go into trainig done
b5c84a9edcd418 Allen Chen 2022-01-14  2334  		 */
b5c84a9edcd418 Allen Chen 2022-01-14  2335  
b5c84a9edcd418 Allen Chen 2022-01-14  2336  		if (it6505->branch_device && it6505->sink_count == 0)
b5c84a9edcd418 Allen Chen 2022-01-14  2337  			schedule_work(&it6505->link_works);
b5c84a9edcd418 Allen Chen 2022-01-14  2338  
b5c84a9edcd418 Allen Chen 2022-01-14  2339  		if (!it6505_get_video_status(it6505))
b5c84a9edcd418 Allen Chen 2022-01-14  2340  			it6505_video_reset(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2341  
b5c84a9edcd418 Allen Chen 2022-01-14  2342  		it6505_calc_video_info(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2343  	} else {
b5c84a9edcd418 Allen Chen 2022-01-14  2344  		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
b5c84a9edcd418 Allen Chen 2022-01-14  2345  
b5c84a9edcd418 Allen Chen 2022-01-14  2346  		if (it6505->hdcp_desired)
b5c84a9edcd418 Allen Chen 2022-01-14  2347  			it6505_stop_hdcp(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2348  
b5c84a9edcd418 Allen Chen 2022-01-14  2349  		it6505_video_disable(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2350  		it6505_disable_audio(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2351  		it6505_stop_link_train(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2352  		it6505_lane_off(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2353  		it6505_link_reset_step_train(it6505);
b5c84a9edcd418 Allen Chen 2022-01-14  2354  	}
b5c84a9edcd418 Allen Chen 2022-01-14  2355  }
b5c84a9edcd418 Allen Chen 2022-01-14  2356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
