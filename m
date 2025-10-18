Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E685D23BD06
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806049; cv=none; b=aXqvUcbvmD70jCh0t+CHj1jMhSYiK3AAnjfue0Fx6GrcJnKvXVcJ0Jy7+zpS6XZEzBBpNrbLnbtns1GwP/LSpJ3SneZV/jlXpUK+1DEtCYo3juKYeP+jC5eMRu/ON4CVv/I2j1ClC5jod5N4AX226GUPxr+91Ohr2lhV9X97HC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806049; c=relaxed/simple;
	bh=ErtWPQX/oMsWHB7X94++uTeTkBN0xv0s9AmfrAPQSrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHe9p5mhUuums8gIVQ/hAXgUzOEp/Z4VhICtixaEVzLhm11FBwamJz8sknnB4rHkAOltQWIRlLKBiEIzCUmVcHtS2rYthf8svwRQyFgULJtxzmLiOM1ybH5c27WSHw0R3Ocs3RjbMegtil3os308tUwmTlkJzD8BXouaeAkeVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpM7AJGN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpM7AJGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760806048; x=1792342048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ErtWPQX/oMsWHB7X94++uTeTkBN0xv0s9AmfrAPQSrs=;
  b=JpM7AJGNFyi7gLz7xsIS8nok13HfXpX3b2J3m/AC7DvZ1WGbE8J7/vcx
   kPVO0xhmXVvok7MzbqP+3cXQurx+hGLDmLFmB9bE8yIiyLJxyMxksxC7Z
   u/eb8vmWpVkJANmDXhnrzz/epuerxfstbdjrEGr4CQlUlnpkcwR1r5dvr
   GarWZmz83cKA/JDqG18XI73+/2Ck9IeQvwNOqkdXZU7Cg88QJthcckSal
   P+X5X+kEo0c7+LlfCQlPg9JssKqAAPBc+c4yMBJvdGoNFE+dhoS/t6mHK
   VzrdVdvZRW6RYi0jX19TveTg+BvldEjj5USwstg1QflWk1QKigYpbbvxR
   w==;
X-CSE-ConnectionGUID: Q8H2QxwVRXWQVWaFbG9/Dg==
X-CSE-MsgGUID: 85ZgVmVlRMu61HB6zfB2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62890663"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62890663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 09:47:27 -0700
X-CSE-ConnectionGUID: k7hN+aAUT/Gl6H8HPfkajA==
X-CSE-MsgGUID: VTXoFi7STV+MLl1M3vsXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="187408561"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Oct 2025 09:47:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAA5U-0008QL-04;
	Sat, 18 Oct 2025 16:47:24 +0000
Date: Sun, 19 Oct 2025 00:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <202510190043.wFDJOYlA-lkp@intel.com>
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
In-Reply-To: <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
TO: Rob Clark <robin.clark@oss.qualcomm.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Abhinav Kumar <abhinav.kumar@linux.dev>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb6649f6217c0331b885cf787f1d175963e2a1d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-a6xx-Add-support-for-Adreno-612/20251018-011020
base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
patch link:    https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-2-0baa44f80905%40oss.qualcomm.com
patch subject: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
:::::: branch date: 23 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20251018 (https://download.01.org/0day-ci/archive/20251019/202510190043.wFDJOYlA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190043.wFDJOYlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510190043.wFDJOYlA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): clock-names: False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): clocks: False schema does not allow [[89, 13], [89, 4], [2, 150], [2, 76], [89, 7], [89, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
