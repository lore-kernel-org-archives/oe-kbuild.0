Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CA42D757
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418977; cv=none; b=DC+AExJn9rOdfi6USujw8l2wGE8oRNiPPKnq3KSAlIepoYkOK7zKcVsC/7lKfq3yw9NwolNz/Ipav6BwP6kHotVr5TJom0r+y241BQhMkpbKuEwZC7TsGhI9Wcocyq5JxaNUcRSPwQ6vs7PJDu09UkO/bscLd8wuEVMucEA80BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418977; c=relaxed/simple;
	bh=+ZEvjvgjxtNr5dTwiK+NOK+I1L2bMT7t8IwaQ4KvSEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XP2eYG4TD1tXNYd8lUuiye+MUGJvtBypn0BVy6wFAgvNdXwcQ1A7fjNcdMkacNxCirPzaS5muHFuI11CtPnRJez+Z2sbXeUECW0PIG83PHMSeZAg7UKr/P83KQyiMKb0qJCCbJeHokx9xmRnexaoIdwcwq7Y8rocQ9ioO3ZJzW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6VkZesH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6VkZesH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785418975; x=1816954975;
  h=date:from:to:cc:subject:message-id;
  bh=+ZEvjvgjxtNr5dTwiK+NOK+I1L2bMT7t8IwaQ4KvSEo=;
  b=H6VkZesHnaa5LzWWrL6MC38VPqrQE7XyTUQx5QwiNRFWPDDwag2CSPtO
   Dwz3+iiAeXjXjiOkc+P4L4PEcjNIBJ3rEIH5iuHnns8m/3UPwvVQTTSGT
   lJqzleKeXRK+8tN6IxKgQpGLdoEPMcTknJ9XU/ytjA/J9+8x2k+WBQCn/
   jvQ4mbEYsdQIKgxTOkornMEOtz4TAE7PcfLlKfqUl2GoS3M+NSE7QGXbX
   H1zOyyPqhm0dfgXxEMr7lQgRgaoOZOReC+Ja0upfVHUrtUgJKXkeI6WdD
   Fg1tgHZgj3bbE6m4lxYRkL78Bd1WAyO/zkQsh7e8OMAwcY325JCtOa/ds
   A==;
X-CSE-ConnectionGUID: 7X7esRkqTueaG9p6qpqcAQ==
X-CSE-MsgGUID: 37CRatsTTBSXzY67qPMXLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103574837"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103574837"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 06:42:54 -0700
X-CSE-ConnectionGUID: owK+6xlzR3eG3A8/OSGXZQ==
X-CSE-MsgGUID: w2s/d8+zTHeR0IXVb8YgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="263784421"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jul 2026 06:42:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpR2B-00000000geU-0IgB;
	Thu, 30 Jul 2026 13:42:51 +0000
Date: Thu, 30 Jul 2026 21:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: "__divdi3" [drivers/media/i2c/og0ve1b.ko]
 undefined!
Message-ID: <202607302129.4V2DiGMy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Wenmeng-Liu/dt-bindings-media-i2c-og0ve1b-Add-OmniVision-OG0VA1B-camera-sensor/20260730-165146, commit: 168839e90295cc189be153bc4a0a6d7f7362ff49"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wenmeng-Liu/dt-bindings-media-i2c-og0ve1b-Add-OmniVision-OG0VA1B-camera-sensor/20260730-165146
head:   1a0c84403aa373a1df3a42ef86d07a881f24e9ca
commit: 168839e90295cc189be153bc4a0a6d7f7362ff49 media: i2c: og0ve1b: Introduce per-sensor data structure
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260730/202607302129.4V2DiGMy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607302129.4V2DiGMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607302129.4V2DiGMy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/media/i2c/og0ve1b.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
