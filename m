Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D92505A6
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052306; cv=none; b=ANT+MAokKI1H2RSa0gp8HRAWlg5Kj6MIazeH8g4Ct753/a4cEn6XvxiUDubOXkdKyUKCHsjSQgmuSFFcb8DdMIQPE+GSHWPbUaHH1WGp5uCXRkofnCJxr+sY+CnGYiihiUQwaLCue1hbBGWWhViEhtGgdnqIHH2ysQcjD+/ffWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052306; c=relaxed/simple;
	bh=DpSAx9df0QOa+STW7rTzKrsf1akLvksaiOWv4mpP9rA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnrK+/q/lcpiyIbkFZe6br/mUhQgmNrk7TCV7ARHKhAve5Y7dzr7oZhGEYJ4hZ0ieAJIbPYuI8eiuwJjH8g1FfQR4GLi3qrVRHJ5wAKPV/LBMwhwJAmuq4ZLbkZOYCey9igvcP7coC/zNvGNBSIhPMCBKb+BTZFjA4FpfWat/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhkD/PIu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhkD/PIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052305; x=1775588305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DpSAx9df0QOa+STW7rTzKrsf1akLvksaiOWv4mpP9rA=;
  b=PhkD/PIuyBjrVynZ3wCUl5Scc74Ga8/bMSahCC4TRhr5QYsmS4kDE6Dg
   SHMfvrLEdQX5esfJ7saJtBdE4RWR9yoMI+SSzm1FctC66dCE8qG+wQdxy
   u3hln565wIiTuSNCVTHiTUsxl+4f34AM7PHcnR+7g7edfMR/HXVzUfcrA
   I8gBNgs3CvZar1A96VjxJXifEatSjkkND9zPzdO7v3Cz1XpNMR7OGGHkx
   Kgjt7YyfQtmhNzEoS7/64axx90zu2XfZB3v5LPHxh849I7PTdqrnacbQL
   QX+Vydkmsi49VJ/2Xquq15khSfIkTyCNWJVXw4mMLB1bkQQv0H8py95df
   g==;
X-CSE-ConnectionGUID: BFm4KyGeTES+8FADacxFmg==
X-CSE-MsgGUID: 1B2BIuAgShKWT+bZ/pz54g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56092587"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56092587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:58:24 -0700
X-CSE-ConnectionGUID: Y8IeMyddQkqVFwlmPQ05NA==
X-CSE-MsgGUID: 5qaGUJ6dTRe88Z7N9eIyzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="159036450"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 11:58:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1rfo-0003id-33;
	Mon, 07 Apr 2025 18:58:20 +0000
Date: Tue, 8 Apr 2025 02:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 73/102]
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb:
 /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with
 compatible: ['ovti,ov02c10']
Message-ID: <202504080256.BIUwBTWR-lkp@intel.com>
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
TO: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: 2ef4331371fe3a49ebc9473ece18a1177cad61dc [73/102] arm64: dts: qcom: x1e80100-dell-xps13-9345: add camera support
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250408/202504080256.BIUwBTWR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080256.BIUwBTWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504080256.BIUwBTWR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5211.22-5394.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4838.11-4848.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with compatible: ['ovti,ov02c10']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
