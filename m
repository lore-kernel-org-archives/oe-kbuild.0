Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D0722AE75
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016949; cv=none; b=ExFo/6QFMXVBzVHg//+VyoJEBHH6uBe4LF9/HhU00x04riwiub6iRUg6/v7QXir3HFnqg2l6UXCgYycaDysImylsBDLbVGIM8ygU5V/eocsrPgIvnV8k5h0r75KsunB5kAuuwyMoN8WyJ0HqGIJjMh320OKzzk4eBDhvbkSiwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016949; c=relaxed/simple;
	bh=3JHEL37tvSBgxN7dNt7266yn+yTGkCpnBv9wAr0QD4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0vwzqpF4F6dskQoUPfsRNiEv7lVfuuV8+LJep+B4r18d9zrI7N+wY8lmlAFCIrlVK+xpOMvkebj4OCJWOzdOnv7/HKsbCtvuK2kAhW4+qG98CkJ2vebXE+heRQt40M09MwDFwiLgrK0HSvnyQ32pJjjhMeI1ihquOXfcy+1lXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO48eU37; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO48eU37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744016949; x=1775552949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3JHEL37tvSBgxN7dNt7266yn+yTGkCpnBv9wAr0QD4w=;
  b=gO48eU37qhdeA1wiSoQMPbNgpSxnw6nOOlYBh3XoT71iwv8kZEAfMCnO
   UVwuhkYl5dChvMiRG4W1Co7VkuJIpCadhLwhV6LsyuoEzLrD4n8cG7+FI
   ghYW23PVb/pMNeb4E42MvAUYQHHj8ql6O2O8L/dCu/vabT28JUhH3SYpR
   8pPLlA/6/Qn7ny41Qk3QfP5U+duoEtyZqIfuNcYivyPYZEU7k8klttIh8
   daGsy2gpKmpX3rmbNNHeyiUQApYBvxEmFsQ4Uf6SEOF1s7tdIsf2fOS4I
   pKZbEQQSmMfzRWMHusCNG+YtW2Lbo1gihhHmDj3CQeF9jNiPd/ccXYn76
   A==;
X-CSE-ConnectionGUID: DRUvCvpUShSGn7iDBiKa1g==
X-CSE-MsgGUID: kL2kN24BQ66EH7Pjr6ua1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49044840"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49044840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:09:08 -0700
X-CSE-ConnectionGUID: IlbjdYZ3SOuhnWTPLqzx8g==
X-CSE-MsgGUID: Q8gSLatuSSeavsHSeKp+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128221980"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 02:09:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1iTY-0003Bn-2Z;
	Mon, 07 Apr 2025 09:09:04 +0000
Date: Mon, 7 Apr 2025 17:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 64/102]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb:
 /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with
 compatible: ['ovti,ov02c10']
Message-ID: <202504071733.Z96ysefH-lkp@intel.com>
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
commit: 17a5b6a1a79b2796247f1f3281302a50fbe95313 [64/102] arm64: dts: qcom: x1e80100-t14s: Add vreg_l7b the 2p8 RGB sensor supply
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071733.Z96ysefH-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071733.Z96ysefH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504071733.Z96ysefH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5211.22-5394.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4838.11-4848.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with compatible: ['ovti,ov02c10']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5211.22-5394.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4838.11-4848.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/cci@ac16000/i2c-bus@1/camera@36: failed to match any schema with compatible: ['ovti,ov02c10']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
