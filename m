Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC661847
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707442391; cv=none; b=RvsJwOyLCDLlnxLbwxG3R61fM+tcvZQsS6AncBgBZAbOVC12KkZwJAxT9w7hWycDZ0dTA/iFz1pWqsbp2EATXS72YlQSgV0CZGfO2Hbw0UyF6TBDTfSN2D+okybl3c9jntawvgfZWI7fl+aalGpTMVpVFwrPvdw4zlflI2QQY/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707442391; c=relaxed/simple;
	bh=0BhYNaB+eyqpPqtqxji4+Uai4Yj3/YK/UafAXgAXwhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L611h8DMawVuARgz764XpTJwfgxV9mnZWbbg1wWx8y4KLs/WshD4GHcSJIxZ9IU+NzDXJkhXRW9EEsBw2N7J6lL7vsMCjT/Z0KskOUaqTGICgXfGK0Sm9S4Ea8NByJIULD6cYskJHX9HC7RHe7Gg8RqdJL81wPX+g3/nFwAet0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgXYkPdU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgXYkPdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707442389; x=1738978389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0BhYNaB+eyqpPqtqxji4+Uai4Yj3/YK/UafAXgAXwhE=;
  b=YgXYkPdUCv01LlNo+GHE3McI8LHLg/yqAOmrwJ3Ux0ndqHxmZGcPkXsh
   bXdGl8jrviZW0HmqoDDM/KuJY+jTPh+K4xr4uOOgFLXGWBvU43Yc4vEWQ
   7ZWM1kGoM/j85TgJXVv3xIVY43UJohP6eQ5MU7Jp6eByVKD+M4OLfnPE0
   t39tY+cjf/HxhSMs3wpbKyDYSOHAZO8JVnriTnJ7mUATADp6ymnbKVxeI
   McbvTewgLmGWWBbcRLk9FO1f5YQkADaYu0+qOFWyViKcvjgbhBkphGDhC
   mWsGCRNjbfX24Ju+iQt9UC1OM9UcptJ0f8FAS7mi1MNaQoCA4n0DUYrMp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="26805541"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="26805541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 17:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6455848"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2024 17:33:08 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYFlJ-0004HG-2F;
	Fri, 09 Feb 2024 01:33:05 +0000
Date: Fri, 9 Feb 2024 09:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 19/19] dtbs_check:
 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:
Message-ID: <202402090901.PJ4OjZCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Lee Jones <lee@kernel.org>
TO: Dharma Balasubiramani <dharma.b@microchip.com>
CC: Lee Jones <lee@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   d5132d176d6f21742ac67fd311ccc61fe830e999
commit: 54a372cc10ac77a6fd8e2e57a72d3d43be9e292c [19/19] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402090901.PJ4OjZCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402090901.PJ4OjZCB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/display/atmel/atmel,hlcdc-display-controller.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
