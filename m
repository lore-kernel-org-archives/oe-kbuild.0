Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D81E7C11
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Mar 2025 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740860435; cv=none; b=uYdZ/qhWikaeR91E7CyYtbAamUiGzqy9kFokwxEMFSyHpGnAHI03jfXhVpAGtI3CDBzZCNVnHI2kqQA7Ze5yYdOr3GvI5UQJThPt/LOuWEIea08CYDigqJByXZtcJsd6oxm3b22/dL79BC8OlHKnpjuRTiKRfp0fGho49j8qCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740860435; c=relaxed/simple;
	bh=C5FlNah2V/UY8kgKhOisZY1j5Q2MAS4cU/16Esv03Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHpZHc2kWIqD+5uvP0ahTG+Wcw+kRAMYdmXSNz0QTOkeJKelphmGNlICh9D6VR/vufRUFmfcCbUYxgy5RllNHnm7GjjsApsFOwcGRWCloT4L1Hg3saHDb1sBjXf5Ow059o68fzVYt1kp31+ozathV3UJ2WhgmczwpqWtZK2OfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fslkl+si; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fslkl+si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740860434; x=1772396434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5FlNah2V/UY8kgKhOisZY1j5Q2MAS4cU/16Esv03Mg=;
  b=fslkl+siE9UGdmgKqK3bxoKpTN9JHkCbIlktQ+PdNQ5amoX5bNurmUnn
   rX6bBFlXKeUGQo7k3Va6c/XxMVvvdRscJV64TuUAQ/cDCohKXg8xSH4xV
   GWF0N/HIBqEI5/iXjv3MLeWzBSAEOKCtk99httWGTEH4v6hTE6Ts+aJGP
   bPGLH+BrA8w4eW9pplmIn8dwXJsu+4jQtdbsx4GqPKUJKS98XVtvc8J4Z
   Ph6lKdOQaaA/LX/FC1MavH//7qPDPrjNakb4/KpcLfvz3mU3so40gS9JV
   Cqc94A5QOZ96Ahb19Tfz0OV8CuUsxchEfeGv0TwzyNKXduVysW1CA4b9r
   w==;
X-CSE-ConnectionGUID: 4Aayzau/R0CT4hzwkeLKLg==
X-CSE-MsgGUID: ba3lITm+RBixClPcr5VqCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52411954"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52411954"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:20:33 -0800
X-CSE-ConnectionGUID: UsT7AdQATT27bFG0sjmcvw==
X-CSE-MsgGUID: CXw+xPdrT8esXFWNY5YXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117389327"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2025 12:20:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTJw-000GfH-0E;
	Sat, 01 Mar 2025 20:20:25 +0000
Date: Sun, 2 Mar 2025 04:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/4] arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
Message-ID: <202503020300.YSDof6Fr-lkp@intel.com>
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
In-Reply-To: <20250226-irqchip-gpio-a4-a5-v2-3-c55b1050cb55@amlogic.com>
References: <20250226-irqchip-gpio-a4-a5-v2-3-c55b1050cb55@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
TO: Heiner Kallweit <hkallweit1@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-amlogic@lists.infradead.org
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 953913df9c3ab6f496c6facd5aa7fc9f2f847ac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-interrupt-controller-Add-support-for-Amlogic-A4-and-A5-SoCs/20250226-135013
base:   953913df9c3ab6f496c6facd5aa7fc9f2f847ac2
patch link:    https://lore.kernel.org/r/20250226-irqchip-gpio-a4-a5-v2-3-c55b1050cb55%40amlogic.com
patch subject: [PATCH v2 3/4] arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250302/202503020300.YSDof6Fr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020300.YSDof6Fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503020300.YSDof6Fr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: interrupt-controller@8e72c: amlogic,channel-interrupts: [140, 141] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
