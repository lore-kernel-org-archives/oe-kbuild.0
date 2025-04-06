Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78971186E2D
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Apr 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969713; cv=none; b=CA6wVYFkxSEqoQXstiVTWvYeCtHKh66zjh2ZmzSDoSfQdJMpXc9PHAv0pXKsYxkeqOpBFNkNnDUkgBe84ctveSCowBoF0tfayTSILPnflBmznaVqKZEsvO69TbhbL47NVzNO6nwi/CwR9o70206jvEl6sGG55AgI581OvWy1GAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969713; c=relaxed/simple;
	bh=z0EzjAGVGXaARQp9A6otf9Riwz1VrFPvfMdvb7Sm2y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fR14R5B71rtDdPR6G2WH/00DFrd37sWd+aZsrlaVrUNaZo5WoxfyOFWJbu8nWGWid7fs2+I6TaXNeDnvLNQC3/t0zRjPjW41MPT0j91OVLM0WYVtPnopkG+u6SPEWz8wbdQWyXS0IkNGsAvByqH99Hq5XTe0U5u/nmFLKfCHUMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMk99MYZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMk99MYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743969711; x=1775505711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0EzjAGVGXaARQp9A6otf9Riwz1VrFPvfMdvb7Sm2y0=;
  b=UMk99MYZ2vbL1we4j5yZMvghEzMbOg6RIFFvLBGQEOJKFWsQ+YJnBnVv
   DEjMxqPiqr428p3sC925JtS3fMH+8ioH0WpsclQzLIPmRqbnQcgd/epxu
   /LvaB8UNctfJf6UpELj+EZBceGpve8djeIbzntARcHXQTguSa9Dm5wQf6
   4BoIYMTafNyEeb3DxSt8tg0iUVbffgAL3mhVKzIrmDNzAV4bOhs075gjJ
   hgkdkC0EGEdgbA9LkEaP9J0OOBBNuI597gHB6eD0mlXGkast4QFcO0bgQ
   kOrPpshbrOpBUe63VvVKBMf8KTn7BZh2cgAxhAIqS7shwUFh0T4gOBvMO
   g==;
X-CSE-ConnectionGUID: 63cIXwBYQFqZdb9hzK+olw==
X-CSE-MsgGUID: xc9iuRmuRpWuydwfg7Etdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="55980370"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="55980370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 13:01:51 -0700
X-CSE-ConnectionGUID: bqB08HfjSpO7RGsPbG5xkg==
X-CSE-MsgGUID: 7O92Dz5uS1y5NSiQ8IeFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="164956927"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Apr 2025 13:01:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1WBf-0002kx-0r;
	Sun, 06 Apr 2025 20:01:47 +0000
Date: Mon, 7 Apr 2025 04:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg
 override handler
Message-ID: <202504070335.fFATCENZ-lkp@intel.com>
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
In-Reply-To: <20250405174319.405975-1-mitltlatltl@gmail.com>
References: <20250405174319.405975-1-mitltlatltl@gmail.com>
TO: Pengyu Luo <mitltlatltl@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
CC: Pengyu Luo <mitltlatltl@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org

Hi Pengyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/phy-qualcomm-phy-qcom-eusb2-repeater-rework-reg-override-handler/20250406-014621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250405174319.405975-1-mitltlatltl%40gmail.com
patch subject: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg override handler
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-052-20250406 (https://download.01.org/0day-ci/archive/20250407/202504070335.fFATCENZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070335.fFATCENZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504070335.fFATCENZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3193.27-3267.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3288.27-3343.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: display-subsystem@ae00000: interconnects: [[180, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pmic@7: phy@fd00: 'qcom,host-param-override-seq', 'qcom,param-override-seq' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@fd00: 'qcom,host-param-override-seq', 'qcom,param-override-seq' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-repeater.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
