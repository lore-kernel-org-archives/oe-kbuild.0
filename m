Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0279857C9F
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 05:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735622335; cv=none; b=tHGDuBrV401ye52XWYMrr+92HhZYsz8eMIJq0ggisKtwbPsKHN4PH5ieO6RzkfNqtust1zl1HwjWwsFX89MFZVOb+yV/rXu5zpKTDWXSlYYpTdioi0Lhfadq3FMoFQYybXGYLhxY2TWjq9XAJcxRku/YJtTXjY/gcQFj8ci2/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735622335; c=relaxed/simple;
	bh=Fo/RudQ53GH90OU4FPy2PXiOKKL7zznVHRTlXCO2vZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOFhEMm81aZEdu1NT0TwNFjqztdzp4sIwAMxHWWooVjWr9nqCiCss7onc1RR/pZnAfw2Wc1Ws3i7KXVTRpgI9ICD2fHoFg4cD5VxCg0q1gXG5IMQ8xqnxibuPxh4DdP3IMH7cHt+WSeOwcCDRQqbBbITxvPym093R2OlNmPqUao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViH94k06; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViH94k06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735622334; x=1767158334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fo/RudQ53GH90OU4FPy2PXiOKKL7zznVHRTlXCO2vZY=;
  b=ViH94k06iDsVVBPr0O5FugUkIapgbdKlSmo1u9en6L8KREjZm7WLeCay
   Dq64YxNOOEcDncF+1+UTMjBICpbIJMrnL21b/wrqevxfa9WES42w96Tz2
   YFLEGV8357VCqdofUXtv02OhX9BMZXGN2K7kpDE3L/Qszd6ZSP1LLCxao
   9yTrp/4AYXyUmOgXK7rlTetgu/A5DbzuVE/3RdQBbVTMwmh0kWujBmplH
   vmKq0pDBrEsaZa+ybi1ittoPm24IQnYqqbKPd3mASgHged03sFCYnxoRJ
   IAIaYBvPnTSHtSOlFl5Sn7lf5Aa9D9AXUEAryIrPDTKlq+zMFtk4XAFmA
   Q==;
X-CSE-ConnectionGUID: bL9PcXokQSqfzco8hQ/h3Q==
X-CSE-MsgGUID: VizQIkzQTMC4TlmT/iyMeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35784136"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35784136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 21:18:53 -0800
X-CSE-ConnectionGUID: 6gwdcmFlQ0muxtYTcQwivQ==
X-CSE-MsgGUID: o9rD5ZHUSL6N/198HfbmMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100791307"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2024 21:18:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSUeW-0006mF-32;
	Tue, 31 Dec 2024 05:18:48 +0000
Date: Tue, 31 Dec 2024 13:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC 5/7] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
Message-ID: <202412311332.gByr30Rz-lkp@intel.com>
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
In-Reply-To: <20241229184256.1870-10-honyuenkwun@gmail.com>
References: <20241229184256.1870-10-honyuenkwun@gmail.com>
TO: Jimmy Hon <honyuenkwun@gmail.com>

Hi Jimmy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Hon/arm64-dts-rockchip-refactor-common-rk3588-orangepi-5-dtsi/20241230-064740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241229184256.1870-10-honyuenkwun%40gmail.com
patch subject: [RFC 5/7] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20241230 (https://download.01.org/0day-ci/archive/20241231/202412311332.gByr30Rz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311332.gByr30Rz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412311332.gByr30Rz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
