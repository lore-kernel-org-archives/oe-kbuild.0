Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629A8837
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734855642; cv=none; b=cGVF9qBl7tfda/vsdqOyF/XYk3WOspq/Fblw6NCJlQvHl91HXrlTORagTSabbTttHgGD566etXGzEaEoqJPC7bjDkwlbWV/KMHSnbOH1ba9voFyIpBCKChrZtd3tlprzVdprXA3ou8qfRAyPpMTBIaOkTT3tWFdPlOeFwUDCmI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734855642; c=relaxed/simple;
	bh=614hilhqPOFO01FoaTRNDfv1n2wWVjRaCS7a9MFe+hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E5ys1Ljqubkic7jFqxy76YOuz5dW82NFmVKcD+pODNToEuAdT8LTkST8Vyx85DQwql0V59+TwIyZSkLEIY0zqCJjGRwxISrfdTorOC+Vvv1tb5jrHg959NduzbqrCueygCgCoclZufOc5Cig/rTNLgobrTyWN2gJJo2HBmoO5pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSFWyzZL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSFWyzZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734855641; x=1766391641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=614hilhqPOFO01FoaTRNDfv1n2wWVjRaCS7a9MFe+hc=;
  b=lSFWyzZLRv3T2NvOaT8EqrvhaW9JL2qFs3GmNQd5jXVNRBYPLViDH/o5
   87a5/zdpYika2qzhoaafpCZVB1vyj8vcnkf64pscip870JKdY1/eBvnEo
   TOXHnjpZG5ATS2ZPfAGb4uuq4s50b/Ny8fQM3As0vDl7i99V86Q0kEHpI
   1IQh06fyldOIUexv7g0SUT7JMtj8SLQbLtIOEcyfYwSMX+KSkUXykyW09
   e1TWb+mesail5UFybDuACR8YdAd0PAQwhRN6/cHIe6pCTnsKZn2YwGrMU
   ULLO056bfBog/70dkQYJPyIX/0hH9M8KjyerFT/fsCWF5wVPxUEP7XcUv
   Q==;
X-CSE-ConnectionGUID: OY0sIBlOTjiizuq2kNN+zA==
X-CSE-MsgGUID: iryJEqw0Qbq9GOpQJOS45g==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39288038"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39288038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 00:20:40 -0800
X-CSE-ConnectionGUID: Hs+LgL+ySzGRM14D/FJnfw==
X-CSE-MsgGUID: BCw4AC1EROOkzhJRBPswjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136251281"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2024 00:20:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPHCX-0002nx-1A;
	Sun, 22 Dec 2024 08:20:37 +0000
Date: Sun, 22 Dec 2024 16:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
Message-ID: <202412221659.p0UdhKxH-lkp@intel.com>
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
In-Reply-To: <20241220-gs101-acpm-dt-v3-2-642d64daa5d1@linaro.org>
References: <20241220-gs101-acpm-dt-v3-2-642d64daa5d1@linaro.org>
TO: Tudor Ambarus <tudor.ambarus@linaro.org>

Hi Tudor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/arm64-dts-exynos-gs101-add-SRAM-node/20241220-224844
base:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
patch link:    https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-2-642d64daa5d1%40linaro.org
patch subject: [PATCH v3 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221659.p0UdhKxH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221659.p0UdhKxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221659.p0UdhKxH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /soc@0/mailbox@17610000: failed to match any schema with compatible: ['google,gs101-mbox']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
