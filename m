Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752B520E6
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755925480; cv=none; b=r85kT/f1eCgAXxTb3RJlEuH/fo0ysLo5IGx1+7Xh0SmJYt5yi5xEk4nsjFm6NWtCq5xWuG6lRrGeuRAvQ3CUvVIhNqljh+lSysQ4YWALMI7yQvkzxTcoVAhd9xNmWucHdYUbCv1hMF/61HYhLzYTeKTT0YBynWLHicubKFrvspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755925480; c=relaxed/simple;
	bh=VUZQCi2fr4vpvftfDvIn2QyzuQmCfzHoYSh9JmHjGU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYZTQxFLQgw55Y77eNZzh1yJVwE67jFsZTJiBOZ7ck65aMX5XQPqyj3AUg36k6ShMkrkkMlx/M9v6xtC24bEKvDoged1Nu9uv7BpeZEB80mI+ynN2DfnX63FLYT77l27mqQun2Jq1elU4OqXnibHXhuy/PceLlXnw0KVIPYFJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ae32Lzbd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ae32Lzbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755925478; x=1787461478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VUZQCi2fr4vpvftfDvIn2QyzuQmCfzHoYSh9JmHjGU4=;
  b=ae32Lzbdrx9XGn/PeDlwDcHZAWKL5iHL7+wXsaDYBxRHktiARhAui5CR
   I+/LCoSXg4K93OvLDeJJGYq5HH3CC/GzH+g08xwSjCyW+8NixLoeeXoQk
   sizaqYZgvTWwE+YF00M7Vz8GBDorrEyz9gHvgWYACYkh/fK1rdCuQNfC8
   ljk+JIXgge5J8MhyazxqVsQ78iDKUCEB7b42/Jy1uTqiXsLjGmiM/7pM/
   0ie8yWp0H0I5/jKO+M2bVK09qbiPOHUVd0vnOzEpXCSZUfGOCh+IMES0b
   ghzKj8cv6OE5Xhs0Yd05Dybhie+TlJbCSOiLyee5SvOt7xYVJNd4zQ8fC
   w==;
X-CSE-ConnectionGUID: 0X4BJzbmRACilArV4XM1gw==
X-CSE-MsgGUID: LubpsMbXTQihHXXmV1zfrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58153882"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58153882"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 22:04:37 -0700
X-CSE-ConnectionGUID: 3+c2Lz1ERDyfUVbcB+gSzg==
X-CSE-MsgGUID: aVmmC+ZhTf2/4oaWazy2ng==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 22:04:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upgQc-000M5z-1b;
	Sat, 23 Aug 2025 05:04:34 +0000
Date: Sat, 23 Aug 2025 13:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
 52/76] arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: speaker@0,1
 (sdw10217020200): #sound-dai-cells: 0 was expected
Message-ID: <202508231258.sYngCt3Y-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
head:   ffb2a13619fdca58779259a6a7f8eb5f710fdaa4
commit: 05dc584372ace9a47427ea18e999c0988ac35387 [52/76] DEBUG: arm64: dts: sm8750-mtp: VI sense
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250822 (https://download.01.org/0day-ci/archive/20250823/202508231258.sYngCt3Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231258.sYngCt3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508231258.sYngCt3Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3122.27-3185.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: speaker@0,1 (sdw10217020200): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: speaker@0,2 (sdw10217020200): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
