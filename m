Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37C1FF612
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041719; cv=none; b=BdJpfSzb6f93n4Ux1pi5wee7B37Od54g6zqfCC8QQ79wUg6Ss8oAExIaO6ydmhOspbHpYzhLUYaVNW+8nWYW/jfkX6mYf+p0PseH4QVB/t20vjG9nk92fJ4jenQX5gWu0kPh7oQFtY/3FVfa1vsRiX6A0JlurikfCzoxgEySlnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041719; c=relaxed/simple;
	bh=v3Gy1kjn+DtOcGjt0gGARhZ/+r2PIFYWQ3ec7PBi0rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKBl1Aw1EFGC+AB/4apQqlWZXobLleNx9pSDhSxrA3gqAARq6SdR09ynSv5ellhX1UIxiQAwq0XbnjZG4D+Hood8EW1jpHIJYY9p6ULqqJEq5mzyJOOYueP1UbP68AJj07UDTMxI15G5SvKa/EtbGvP7JeCyeJHErq3GzAwCvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNfxhL/Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNfxhL/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744041717; x=1775577717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v3Gy1kjn+DtOcGjt0gGARhZ/+r2PIFYWQ3ec7PBi0rM=;
  b=cNfxhL/QZxd/Qws8xpz6bhqXOBB3gLfx740DEVlcEGWduSSEhUbOwz02
   NTT2BkcVPypkzvrydzy1pig3hcT2Z8lCnkFjvkd9Ca+DAEC+KBF1/xGpt
   gfojYrd7YTP7BpZle5J0vCXniqP+6CizDItedZcnen/yVnmnOa8BwyRj9
   hOQijfh7KqZvZQ+vHy5FW2Fso36lCyuiw0uFmS3RARFNwDulYmyQSFFZm
   tstOEJBxUGN9Cw5M5IO/qlEGH4boxTKKc2SC66kn1V5RHEPUN86i8YSNr
   +CaIXuCIUcu0Qlj2FRB86mBdqbHOoBP0QFoBjozvrIncwal+txSvpE1kw
   w==;
X-CSE-ConnectionGUID: 6JpZf2tJTH6B8xEmxNag4w==
X-CSE-MsgGUID: 8gWCpmadSa+9BD3YO6buwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48149464"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="48149464"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:01:56 -0700
X-CSE-ConnectionGUID: Wk3r+zlCTAqFGprxNEVecQ==
X-CSE-MsgGUID: RvDQSqGiR1CbBKU4LpH71g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132970519"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2025 09:01:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1ov3-0003Z1-1u;
	Mon, 07 Apr 2025 16:01:53 +0000
Date: Tue, 8 Apr 2025 00:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 68/102]
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb:
 /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with
 compatible: ['ovti,ov02c10']
Message-ID: <202504072319.7yxjusor-lkp@intel.com>
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
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: 41dec11db306e0e0cfbc150b942552fc309a25ec [68/102] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add in Camera stuff TODO: break this up a bit
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072319.7yxjusor-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072319.7yxjusor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504072319.7yxjusor-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with compatible: ['ovti,ov02c10']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
