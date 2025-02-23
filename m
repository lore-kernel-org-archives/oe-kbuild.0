Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E78C1E
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 19:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740338640; cv=none; b=tMtbGBp+GstwUXjDuZ5jExOO3OyVtB0zakROIPKjHysFIHQWZp70KGYmnyAEaICgs2ebPmBXUbMJ2HD1SMM2VOlANbJDsOhbq4AAtmH1KrK4wWq1PBq+uH17Nj84xkM0AUV7JJFvK261+EmTPvOmy/xZ+cJ5AEzeCODlpbCFeIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740338640; c=relaxed/simple;
	bh=aivYT+LxWh/4Jv4Gg5keHnzBb+DMDBRDFBSSrMlyI6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZhzxhWEVj+PA5Dh3CIQGWnhchZER30J/NWlczw2EuGU5qDQ7Y20/6rE+IQJoEP2Hr8/ocxuQ7HcFMHE/f5R8+SRMyH2kkila2gvW+mjK46xk7NGnotFERm9Lwnt5foySUP0UI4qQkETXSQ5pF201di10KXs/zDAtwR7muuP2GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFkn0fCo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFkn0fCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740338638; x=1771874638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aivYT+LxWh/4Jv4Gg5keHnzBb+DMDBRDFBSSrMlyI6w=;
  b=EFkn0fCozeIjFTLEhx9gajgQA+Ss1kKKaxHS5ni6dZbzHmF0lLN99SfS
   0RPmq4xQHcrZ9RQUU6tL6qc0E/HJatjVo5k/DhCiu307e7L/de+u/0KNb
   c+Y207ErI48S21b8cgkgKOGOwe9pKFzUI9BPVfKlS+43Cf/cNsOPhDRO0
   n55Hmgx1G6TdrZIVu65xKfPJsLafX8MUWfitsuBvx0Mt8y8uLmMxFIxDj
   OoneSFfLELjr7HSqfYKF3eIwqbVJRwPb/E7fId2ZZctQPQcf1PnWWonTI
   r9FU2D0SAslH/vwxsqLEP27L35XbdONOqWvuzdNM+IMLEj6bkJ4VT5PJN
   w==;
X-CSE-ConnectionGUID: JY6+Un3WRp2m8LlecODDmg==
X-CSE-MsgGUID: titHEJEKTBiT4hFBrdSGDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41355468"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41355468"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 11:23:57 -0800
X-CSE-ConnectionGUID: 6t0qnNVAQNKWqpRq5NL72Q==
X-CSE-MsgGUID: m+kBQnwvT06jEGXIAK5B2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119978719"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2025 11:23:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmHZy-0007Y7-35;
	Sun, 23 Feb 2025 19:23:54 +0000
Date: Mon, 24 Feb 2025 03:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 23/23]
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16e04000:
 failed to match any schema with compatible:
 ['samsung,exynosautov920-ufs-phy']
Message-ID: <202502240349.OnSPW8Zf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sowon Na <sowon.na@samsung.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   5893f538e331609fbea244ed14732291edd6ab22
commit: 5893f538e331609fbea244ed14732291edd6ab22 [23/23] arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-051-20250223 (https://download.01.org/0day-ci/archive/20250224/202502240349.OnSPW8Zf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502240349.OnSPW8Zf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502240349.OnSPW8Zf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16e04000: failed to match any schema with compatible: ['samsung,exynosautov920-ufs-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
