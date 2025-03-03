Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF93C3C
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740971310; cv=none; b=IxIbvlygjA9+ciLckKiYuhRVHPyE0KY4Wmu3FyWNWbhmUgp8QOvZUv7wKJZXAL5qEiuy5n0lplNkVqFFTVssbhAB6GiqhhDLmLxw1EclZbLRnygjbnvKqusXWJ7vw4R65TyLKrtAX7El/454QfW6wisVhZ0zq3NfVxejaAq/tYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740971310; c=relaxed/simple;
	bh=Q29AS9Yvwvdg3fNUxs1sIPMvteBZPy81erjOsqakeXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3WgeNA/yGbnnttJuYBMz+ntoVlmtecdHqEOvo68pqIP50WerUf6SyoXz2zOOOa71GqWmFQozADm/fZGAdQ68H+2UvK4Ik5TwiQbbpOXsQ/uXxv7ChHCGWoaoC4KcKIMjIo6enjc9MUUdrF4Kzg799eppljeFr/NrDlRYs27Za4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrhEPDlE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrhEPDlE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740971309; x=1772507309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q29AS9Yvwvdg3fNUxs1sIPMvteBZPy81erjOsqakeXY=;
  b=jrhEPDlEhq5KfKPCMCM8Vm1vZDPx+xTqimoDnCWdGHWwOfaiEVo4UZfF
   ea3q7qWp1Ah5VFci0cCqvzDCsF8pMbyL1Ubkl3u3GlRyPo9nMINcH4URm
   tyFmSuHtrASnR2ria+mXG1yJRZWBNRSj26kcZAlPn9wx0eJE9ZIY7gj8q
   l7sPQhVZgzPNaJZY+qLBnX1n2AcuNaovqHriRCljeS3lgvi0misEExsRi
   3/jKFgcFa7XVr1Nyu1yX+5b2hD3nhBPR0FmY71VWa7jBEulocDP1MQk5P
   kniRONSJPqb8bZeKkXqEmoIIbOW/0/tAWMQ9llSGL1RHlUarK6Vs5fEvf
   A==;
X-CSE-ConnectionGUID: pgvk+GGUR6iv657nTJQgzg==
X-CSE-MsgGUID: UTZIUVOTQhmkJ+/fw+iAIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29418338"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="29418338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:08:28 -0800
X-CSE-ConnectionGUID: YBEurAhnQrepLxIFBOdcyw==
X-CSE-MsgGUID: kxMFa/XETsSU9mAIrM8kxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="122475704"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Mar 2025 19:08:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1towA3-000Hrv-2N;
	Mon, 03 Mar 2025 03:08:07 +0000
Date: Mon, 3 Mar 2025 11:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5:
 Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202503031013.1TZ1rN4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eb172143d5508b4da468ed59ee857c6e5e01da6
commit: cc49fcd0bc2db23489a87f6fa17119a76b70ec6b arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20250303/202503031013.1TZ1rN4M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031013.1TZ1rN4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503031013.1TZ1rN4M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property

vim +29 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi

cc49fcd0bc2db2 Biju Das 2024-08-26  21  
cc49fcd0bc2db2 Biju Das 2024-08-26  22  &du {
cc49fcd0bc2db2 Biju Das 2024-08-26  23  	pinctrl-0 = <&du_pins>;
cc49fcd0bc2db2 Biju Das 2024-08-26  24  	pinctrl-names = "default";
cc49fcd0bc2db2 Biju Das 2024-08-26  25  
cc49fcd0bc2db2 Biju Das 2024-08-26  26  	status = "okay";
cc49fcd0bc2db2 Biju Das 2024-08-26  27  
cc49fcd0bc2db2 Biju Das 2024-08-26  28  	ports {
cc49fcd0bc2db2 Biju Das 2024-08-26 @29  		port@0 {
cc49fcd0bc2db2 Biju Das 2024-08-26  30  			du_out_rgb: endpoint {
cc49fcd0bc2db2 Biju Das 2024-08-26  31  				remote-endpoint = <&adv7513_in>;
cc49fcd0bc2db2 Biju Das 2024-08-26  32  			};
cc49fcd0bc2db2 Biju Das 2024-08-26  33  		};
cc49fcd0bc2db2 Biju Das 2024-08-26  34  	};
cc49fcd0bc2db2 Biju Das 2024-08-26  35  };
cc49fcd0bc2db2 Biju Das 2024-08-26  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
