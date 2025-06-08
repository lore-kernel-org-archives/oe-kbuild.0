Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87410FD
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749369884; cv=none; b=iPqOhKm2IxnfpfgrQmQguyneg/0Npwb8CB20vNFMfDWrWNB9FMzQWtVnmxSi+0PwWMewqbD5E675MmEsz+moQwmWdzW9uLlSCpy6n2pYXsHOyWYc0pd/74Oq+/5zp9JycL5qHUDjaPa7qnsALqXuF6hJRD0rCkW4mKftVHP6eYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749369884; c=relaxed/simple;
	bh=M3efhq2MgnY6VrDs9psXBQmWjoQl/BZ5OLQR90iDyao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GANN0V4kMI3DzZY3aCB8XgjOuDu4lK+yzFkvEXXbEMSjRkoglS/4JowdCYMq6sZo32rJ3iapKPk+xvxZNgTRiIby5L/CzY+oE9ilX9w1UzArcoSakqPlQ50Mzc2spsXJ5knQpfILeRettCin5DlY6kYULy2SwjKu4w91qyxNy9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZun2SZY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZun2SZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749369882; x=1780905882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3efhq2MgnY6VrDs9psXBQmWjoQl/BZ5OLQR90iDyao=;
  b=eZun2SZYlHCbnszf2vNVsO7bCSo7/s3uC/r0ahBsb14Mz6UtJ+8sxd+v
   5+fSBbzz+RzW8L+h6eKsWhWOICATUf690kHRpFN/41/LA14dJ3oDCBPbV
   QXk3Kvw0bw0ajE7lc5R+G+PsusWr7lsRFHrpqx6wZN7Y48N0fSDN99yHi
   3WkHlG/Zg5NBecpVzIsXdUXKzcaB86OgMXV3nZmBlrHi++os4gfKo/05r
   e6Lefo6uw/nvbP9sXxxER5DzqLh2a6jfmQrmeAyJyYljOoTLVWVHCtDee
   QA/H9y4vVUB0hq7/Inpo2f22tLj4AxlzqQMdqSO0AaNkgtUMw6otzjrwI
   w==;
X-CSE-ConnectionGUID: eNUBGj4FS7+PGQDCKZwWvA==
X-CSE-MsgGUID: 2ExYx6uMRU+W6g4g3xSZYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51608841"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="51608841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 01:04:41 -0700
X-CSE-ConnectionGUID: n5zCPWLPSreaaV1BQBSK8w==
X-CSE-MsgGUID: 0cmQJAEeTkSOQ/+o8NZ7zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="151375817"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2025 01:04:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOB1C-0006Hp-04;
	Sun, 08 Jun 2025 08:04:38 +0000
Date: Sun, 8 Jun 2025 16:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <202506081552.XVO4DMxk-lkp@intel.com>
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
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Rob Clark <robin.clark@oss.qualcomm.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Abhinav Kumar <abhinav.kumar@linux.dev>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b3bded85d838336326ce78e394e7818445e11f20]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/arm64-defconfig-Enable-X1P42100_GPUCC-driver/20250607-221719
base:   b3bded85d838336326ce78e394e7818445e11f20
patch link:    https://lore.kernel.org/r/20250607-x1p-adreno-v1-3-a8ea80f3b18b%40oss.qualcomm.com
patch subject: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081552.XVO4DMxk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081552.XVO4DMxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506081552.XVO4DMxk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: opp-table (operating-points-v2-adreno): 'opp-666000000-0', 'opp-666000000-1' do not match any of the regexes: '^opp-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: opp-table (operating-points-v2-adreno): 'opp-666000000-0', 'opp-666000000-1' do not match any of the regexes: '^opp-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
