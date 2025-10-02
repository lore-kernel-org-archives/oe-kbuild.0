Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302BF2D73B8
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396128; cv=none; b=NfwLHO+QNtKbQaZEc46eT5Qeptj1k88mJrcviwIiEPcmMZtBvXFp1PD9qcmUve/C6mSn5MI7PHcG/6jnhKgJD0gcy6zFWkzJRikZMpa5zYTGdrJkyrcxfLYCv4xkTSCMSlrslVCJj0jcimVyQajtQutyy4b29SoGAlW0Z+F6Rz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396128; c=relaxed/simple;
	bh=W+3MbIvlovAsYMxOsQfUQZUiifNUzmD83aIXRVJlKQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZLKl4frZ1uB7phklfmp0+z+cP/HtzbIqQCs3GRlSXMlTX5vW/b5d6XzkxDMfkiOZ8JFSFWekngW3yNEDapvyJwwnbssXFQqLHsAeiptPEX/Bp27EsH88xWtHPwjgNSaO7b4oDqW0NT2xTqnQjVGETKvbr2/47tnaYBYy7BzK1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQ7ILtR/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQ7ILtR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759396126; x=1790932126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W+3MbIvlovAsYMxOsQfUQZUiifNUzmD83aIXRVJlKQM=;
  b=dQ7ILtR/5zrrqXEv2LF2N05oB7VRwwEweyTJP2D3C/UE9lV9g/UWiiJd
   6Ivkj51lcvH/Q343LJhCHaf5oi3t7+6vdBZHE/2TI+EIcXijeeQ+EYfIu
   IsefXK0UtrkXSY8n8MO9wlW5fzcguDexlRaEYguZ08zH28+ALTg0+JtmW
   4Xl2mlJrWcWyqYzcDTMfG9wgDLc0x1R8lrO2DB0C6tvTm/Qw+4xeYuQAp
   ln2+tN4dMHzBGMEaVNbgV+K3DgKgjkZwYQQktvQC0TPIMVqCRzlU8psvJ
   Azju3aq2ePM2tDv34+cW3oWUQ2+pO2Cug/XK0toOWJIFCMjemD1u/VvLP
   Q==;
X-CSE-ConnectionGUID: t19GHhWvT/eghhMMC9FKIQ==
X-CSE-MsgGUID: QMly/M7/TXWR/gHYnfMqIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79102751"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="79102751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 02:08:45 -0700
X-CSE-ConnectionGUID: XZePgfABT2aS3uIuDJMe1w==
X-CSE-MsgGUID: JhifT814SsyNPCP4fWtZwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="178621548"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2025 02:08:44 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4FIo-0003gN-1k;
	Thu, 02 Oct 2025 09:08:42 +0000
Date: Thu, 2 Oct 2025 17:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v16 6/9] arm64: dts: qcom: ipq6018: add pwm node
Message-ID: <202510021634.QRSvXn7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251001-ipq-pwm-v16-6-300f237e0e68@outlook.com>
References: <20251001-ipq-pwm-v16-6-300f237e0e68@outlook.com>
TO: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Baruch Siach <baruch@tkos.co.il>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Devi Priya <quic_devipriy@quicinc.com>
CC: George Moussalem <george.moussalem@outlook.com>

Hi George,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 846bd2225ec3cfa8be046655e02b9457ed41973e]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Moussalem-via-B4-Relay/dt-bindings-pwm-add-IPQ6018-binding/20251001-220840
base:   846bd2225ec3cfa8be046655e02b9457ed41973e
patch link:    https://lore.kernel.org/r/20251001-ipq-pwm-v16-6-300f237e0e68%40outlook.com
patch subject: [PATCH v16 6/9] arm64: dts: qcom: ipq6018: add pwm node
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-001-20251002 (https://download.01.org/0day-ci/archive/20251002/202510021634.QRSvXn7L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021634.QRSvXn7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510021634.QRSvXn7L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq6018.dtsi:418.4-28: Warning (reg_format): /soc@0/pwm@1941010:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
