Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E423D8E
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 06:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717224099; cv=none; b=ift71JSHS430qbk1lqKyruFrVEO3Qf+UZHn9BLggMMP0qXLMCmtOJaqLnlE0H9h3W2qNPf5fGyYF8BI2bPvxFkyFIXGmDt6tFnEXfBPc4DP5f5WQ1CcNaPMf6mNJTX6ASW2sBlwhGCbmi1x2loSFrwuCFnFtgu1jzULiQjKgbxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717224099; c=relaxed/simple;
	bh=8zLpGSoqoEbgNktSOgUVokXtAkE66jqZPyN63bGXoYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HvtcO/We16TP/py9eh/ZACt4epfcye9ajrVMEb2EyJMcBqqLVJ0gOslufZzZgh1nUZ/f/vRelF4LC10Pgnfk7vAIKp6+zCHe2HEN6GpkeAERY4xYkrmOgW0BM2GhyE5VoF57DmpUlQ5msWx7tKylk+1oRtiEu7LM7OUjOzlx5bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/1KNYLu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/1KNYLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717224097; x=1748760097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zLpGSoqoEbgNktSOgUVokXtAkE66jqZPyN63bGXoYc=;
  b=F/1KNYLuO8T4yYaU2kzsfAHPVr4iAv5Ydu4uBlkx/b5acBrNH+fq4t4v
   +TdZ4+AU7wv/iUVXo/tnNa9YAganoSa+iDgUvVMnWAVx6f0R109OmxfWS
   O5BObjNsa+8Kvkg/WOsNmqOk6kcr14XO/jCezeGgUvBVDzHnZ3zN1tPLP
   p9ui3cnn4WNfX/YPwwW8tKc7UetKcpJ9Dvrpnyf0tkfjFB1m2ajsao0Q/
   5buvBgwPziIzfqbH8+a8qJPXHMf+dqAs/1gV6fdH2q0zWo3pPbCo3k5ev
   LVPKF98iBMCa3/u9BjLiaEIl9uny0du5J4QosiE6saav3TaX2Rb0MG5Yo
   A==;
X-CSE-ConnectionGUID: BEhIPKgaQGu1RovqTv8uJg==
X-CSE-MsgGUID: xOeEhIFiSaGVCNs5arybig==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13900573"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="13900573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 23:41:37 -0700
X-CSE-ConnectionGUID: tptiVvAjRd2Un1J0lYnqmg==
X-CSE-MsgGUID: skc0s1rlToKEmqosZl7nMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="41296553"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2024 23:41:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDIQn-000IUT-1i;
	Sat, 01 Jun 2024 06:41:33 +0000
Date: Sat, 1 Jun 2024 14:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/42] dtbs_check:
 Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error
 parsing file
Message-ID: <202406011430.N0BkuKDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   b34596fe79684f3e27fd8479ff54d83adfd18d56
commit: dd51370bbcb3d3bb85164c12dc4956804696a444 [8/42] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240601/202406011430.N0BkuKDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406011430.N0BkuKDj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-frequency: missing type definition
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-direction-out: missing type definition
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-fixed: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
