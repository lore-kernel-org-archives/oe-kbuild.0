Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78318132A
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747283520; cv=none; b=WNnTz2+FTQLiFcJ6NsgZABxvZRYwV3NJM2H+W/qQm+qFgvDSlQBdlWcLIHE8IgW8MeBqwBrD7O1PmaguXXhho14IK0yMarBHmDg7rvM2KFvSj2Vkv57woXA9J5D41dAZ9JVxJK9B+U8G26vuy/tudvGLHNqceK/QWb8QlENtiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747283520; c=relaxed/simple;
	bh=wT2cdkgU1lDZTURQIv7J+cNqEmvFLuk+ru9mAv8hduI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmlfClAfyMFJ5j5+RQ+Sr/TpUrSFVMTqOSAxVN6fSI9HjTx6tpwPLYPzYO1da/UviU69scpYZyJMqpQJypPLvV0t3okP8WtUJra2MtyO7YriusbEc5rEIq/SJaXSD6UBLPX1fyrL1sgKc5nUvDGeUMvjC9zr+IR0iAyhEFcPt1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXnCpsfD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXnCpsfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747283518; x=1778819518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wT2cdkgU1lDZTURQIv7J+cNqEmvFLuk+ru9mAv8hduI=;
  b=RXnCpsfDDgfWJjmZQaBcynG99klgs4sn6btrgxnIciIoNQMbCk2GuJ9p
   E4k97eKrV1tSuVflhXSk/2edSPDLPYmvVp/7cFoLqnXsQbXiYcoug5GN7
   +TgH3w3a6sLq7AIt6GAm29nN1JE/CNAcnh1/LuHLwPkqUi517Vdw9hh34
   Acrc/MkBn8Km/62RL1gZlDvGpwTeeHvXdfyBNqdRA4besb+aFGhna0dBN
   KlVl928nQtVCb5n6zd1zULbHE1D6FDGqwZf5nvRsbUZLRqIW/cK59ugCM
   rsXdQccfy4jPC992sDvjX0XneMNKEupfO8OVGQDvut9JcxRMjDgQmAGZk
   w==;
X-CSE-ConnectionGUID: 0uJ8Ub8LQk2LP0D2lHTe6A==
X-CSE-MsgGUID: vHxV6EMCQ7WxvU7S7MGpAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59836486"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="59836486"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 21:31:55 -0700
X-CSE-ConnectionGUID: cURGc8NRQdycDhVq/Z+HlQ==
X-CSE-MsgGUID: dIBVcpPfSiy0N0Lcnon0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138114786"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 May 2025 21:31:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFQG8-000Hv9-0p;
	Thu, 15 May 2025 04:31:52 +0000
Date: Thu, 15 May 2025 12:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 8/8] dts: arm64: amlogic: add S6 pinctrl node
Message-ID: <202505151250.oZ8lsuHL-lkp@intel.com>
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
In-Reply-To: <20250514-s6-s7-pinctrl-v1-8-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-8-39d368cad250@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-amlogic@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aa94665adc28f3fdc3de2979ac1e98bae961d6ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctl-amlogic-pinctrl-a4-Add-compatible-string-for-S7/20250514-150438
base:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
patch link:    https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-8-39d368cad250%40amlogic.com
patch subject: [PATCH 8/8] dts: arm64: amlogic: add S6 pinctrl node
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250515/202505151250.oZ8lsuHL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151250.oZ8lsuHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151250.oZ8lsuHL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi:97.29-191.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi:97.29-191.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl: simple-bus unit address format error, expected "4000"

vim +97 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi

d258ce14505981 Xianwei Zhao 2025-05-14 @97  			periphs_pinctrl: pinctrl {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
