Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDF1155326
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766378357; cv=none; b=bIcp0h7PO5mLypOMMGN4jiROH+tv+6ydfahbZ03a0hkq/GyRQLFwmSTNwzwaRjjOCpQHaQNq3TqMrPnvsSsknPlv+6MTaRtagHzGqvOi+MbJJn20+n5xCr7fH9AUGgt9cRLBbibUafiinp3Syv/ajJk44hFnLuD0ypuZtey0k58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766378357; c=relaxed/simple;
	bh=xQVMRYK2FdCBegwCrgISWqxAQCAoHWOy2qzL8fIy1Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qcq/JkUdSaryyTy7/uP05pZ+60v55jmhUQLw6SC4mBgLC92raYlNkX1RmCc2l/OTPGRE6a2dAhw3F/CaAF4Ui67S6iBHXKVlsIr7S/VRuS4VSkd+HY0Y7P5QIKJ3+w2IAM3GXTwUOOa8Di1PbU59HsyM4bdb/BUJMH7vmYdVYio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhdyxaSz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhdyxaSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766378356; x=1797914356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQVMRYK2FdCBegwCrgISWqxAQCAoHWOy2qzL8fIy1Qo=;
  b=YhdyxaSz3JElBG7tWPYd74IfMjSzOVXrTIkbDjhzP1dkSFpvyzPf+F2J
   ZibkS3pCMu074mk39DUL2TQRTAzQ1dKjMWVZjNyzT4X6yWe3lt196UXep
   MZ4H0ERa8OQwuKFFX1KRgIF9/aqmM1YwUAJYAo12KyS1W6CkoaT2VOy7P
   6HvMGdFhtVoaN0w2pD56KAK1VItiqdBYi/jc4/t0xxk2fQAVhTtVwS4zK
   u3XovL2i+TYE8G94d4VGCDAlwpTrwlVtCSTju0nsdpFVki2wUvHSrfq46
   lj5L28X4XjGy++MbjJvRKVjeAJR9/1nkzAmsbXX7cF67s+OeBleOwOWnJ
   Q==;
X-CSE-ConnectionGUID: b60wcp4CQe66cIOJ9lfCoQ==
X-CSE-MsgGUID: oHID3KgQRGahLITZzrr+JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67227294"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67227294"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 20:39:14 -0800
X-CSE-ConnectionGUID: abavBoAzQHGmfGiDrGxu/g==
X-CSE-MsgGUID: qGR8ZNj/QVGOvfVECJVHOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200310337"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 20:39:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXXhP-000000005MK-1Rvr;
	Mon, 22 Dec 2025 04:39:11 +0000
Date: Mon, 22 Dec 2025 05:39:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.20 7/7]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /
 (intel,socfpga-agilex5-socdk-modular): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202512220536.CCReXciv-lkp@intel.com>
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
TO: Dinh Nguyen <dinguyen@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.20
head:   43f571b1b74bccfd3fdd106b519ef0614c354518
commit: 43f571b1b74bccfd3fdd106b519ef0614c354518 [7/7] dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251216 (https://download.01.org/0day-ci/archive/20251222/202512220536.CCReXciv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220536.CCReXciv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220536.CCReXciv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: / (intel,socfpga-agilex5-socdk-modular): compatible: 'oneOf' conditional failed, one must be fixed:
   	['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5'] is too short
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-arria5-socdk']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-arria10-socdk']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['enclustra,mercury-aa1-pe1', 'enclustra,mercury-aa1-pe3', 'enclustra,mercury-aa1-st1', 'google,chameleon-v3']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,de10-nano', 'terasic,socfpga-cyclone5-sockit']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['enclustra,mercury-sa1-pe1', 'enclustra,mercury-sa1-pe3', 'enclustra,mercury-sa1-st1']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['enclustra,mercury-sa2-pe1', 'enclustra,mercury-sa2-pe3', 'enclustra,mercury-sa2-st1']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['intel,n5x-socdk', 'intel,socfpga-agilex-n6000', 'intel,socfpga-agilex-socdk']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['intel,socfpga-agilex3-socdk']
--
   	'altr,socfpga-arria10' was expected
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-cyclone5' was expected
   	'enclustra,mercury-sa1' was expected
   	'enclustra,mercury-sa2' was expected
   	'altr,socfpga-stratix10' was expected
   	'intel,socfpga-agilex' was expected
   	'intel,socfpga-agilex3' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /: failed to match any schema with compatible: ['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
