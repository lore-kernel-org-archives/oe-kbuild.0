Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B41E2823
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105920; cv=none; b=izTTVz4nNIxo5oKhB/n2+mS0HipiL33dyVIRGoGhKL7kOTdoWCGIDOTBjmuIg/iOPxexKd/qYLzEZf32BNOKLT8054QTouAO5gFTXpwCdLPACNePsa8xD3ZeZF+AeMlvdX4rst+Zaewe+ubCKrU7KHywR6z4CO3+oLkKPFozqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105920; c=relaxed/simple;
	bh=eY8wVHU7cKqLNBq5xGA83Y3vKCRHKcQTUgjemPA1V2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fynFpt9SIGDxrU2cSPBETZj2SN1Xctu94+joQcTILhWc1T888kW43oyHHkPm2dKQJLukcgSkaET2gUiB36Ns6q+MBC+0013gr3+bYCefBH/tAxfyjwiZ0WFST621RgsB2KaJLfm6Q2C2CEaTLKKup0QSQR3l37iPPqOWIPcFxQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHyU1AQk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHyU1AQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750105919; x=1781641919;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eY8wVHU7cKqLNBq5xGA83Y3vKCRHKcQTUgjemPA1V2k=;
  b=VHyU1AQkcsgO1BE7TWUPSn6ZwlAcBrPcfZgj0v0L+zxkjQG9msdPRP0T
   Uffq0Hmuq8IV2dQOGQF8uafW4eC6phN42uGL589Ux0+LAHEJV9ae/Rq1R
   5+yT21eVEG/7/H+3CD+UJ4r82Qv5J+xkvWNSD91SUlCz974PwVqGvE3CT
   VeA9MX/xrvR2TJAq0d1jSNqKhXYaSOSM1hUKrCjHh5wOpyX0yAz6dZVBd
   cvMPbIB/NVJSQ6K2sBcMxd+GsLDy/DaWFdpBVBP866C+xdJJWJmOXZeDe
   yRuG2XL0y6N7GEZ5V/rK55dckhH312G37BMyoaYoFcdt9mZNtsL10UcGr
   g==;
X-CSE-ConnectionGUID: nt6lytWdTIOWnpvsH9aAEw==
X-CSE-MsgGUID: WwZnf1enTBmPcW4G9E029w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51968726"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="51968726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 13:31:57 -0700
X-CSE-ConnectionGUID: szrSr2bMT4CsSmKK5MM70w==
X-CSE-MsgGUID: zZ2e+BSMREi9K1N32larDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179558284"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2025 13:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRGUi-000FKg-2c;
	Mon, 16 Jun 2025 20:31:52 +0000
Date: Tue, 17 Jun 2025 04:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: add initial tree for Samsung Galaxy
 S22
Message-ID: <202506170438.WyDgdF6n-lkp@intel.com>
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
In-Reply-To: <20250615205608.1133129-2-ghatto404@gmail.com>
References: <20250615205608.1133129-2-ghatto404@gmail.com>
TO: "Eric Gonçalves" <ghatto404@gmail.com>
TO: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: konradybcio@kernel.org
CC: robh@kernel.org
CC: "Eric Gonçalves" <ghatto404@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Gon-alves/arm64-dts-qcom-add-initial-tree-for-Samsung-Galaxy-S22/20250616-045847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250615205608.1133129-2-ghatto404%40gmail.com
patch subject: [PATCH v2] arm64: dts: qcom: add initial tree for Samsung Galaxy S22
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250616 (https://download.01.org/0day-ci/archive/20250617/202506170438.WyDgdF6n-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170438.WyDgdF6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506170438.WyDgdF6n-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: /: failed to match any schema with compatible: ['samsung,r0q', 'qcom,sm8450']
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: / (samsung,r0q): memory: 'ddr_device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: / (samsung,r0q): memory: False schema does not allow {'ddr_device_type': [8], 'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 1778384896], [0, 4055891968, 0, 239075328], [8, 0, 0, 984612864], [8, 1073741824, 1, 1073741824], [8, 990904320, 0, 31457280]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: memory@fe200000 (qcom,rmtfs-mem): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,rmtfs-mem.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
