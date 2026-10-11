Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D941E0DE8
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 00:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679720; cv=none; b=gHHdWPc2r55ZCV6dtE1MWh8EGvgC8544lZFTTyGg5KFyuowjTVR6LPNfXHvKccHi56RDhx2UdOpHjd4vVLcmgx10JuQxRqqBnQB9b4uVZP778HZNM4DpF5aG2lU28YcmipWGg1JtnwyYHGm7sjxSKnL5ZPC0JkTUu6DtwABGlz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679720; c=relaxed/simple;
	bh=jkI2igLf4cmaeDplaJ0XQYzKI/IVgSew9m/8jQV8rw8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eiNmDOZQ211mbgJSlfC2eiIp34iX7xHKMGoqSUXVhn7JiECgdduPrnNkcWM/ybk+sZCwRVno18By1JU2qqPnFRvKLNNECe7Z4FP9YK2i5eXXjUVbx2m9LWsMzX+928XIVuUUPgI0SoUt7x9nQ046UA9FQpw9KySSiYwEdUSPryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xn3pjAwh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xn3pjAwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791679719; x=1823215719;
  h=date:from:to:cc:subject:message-id;
  bh=jkI2igLf4cmaeDplaJ0XQYzKI/IVgSew9m/8jQV8rw8=;
  b=Xn3pjAwhipwpQsikLENKbjBv7VhZP009gTNuxSF4atqPAd105BqL0YEa
   y3d6ZEcmo9N2QfnehdOgUmd7mBGVpK1pWXFZ7Stn+Ixci913BNnBiE/nT
   0j04UbbxzDJUyhUAO8LVc95JT7P0doeSfcBAKAp8xnFUNdLCMCjzTX/Qn
   X0+At9VDI775+hOk4DWkIT3O9OMCGHeFAi6dnESRmPdoyDSkSHBhAUMVT
   ULY5CHdOFKF0UP/740bJ4jEvIxXgpnkm7Cv1I6Rg6KWUYeB4+JRJb1NxL
   FdbI9Q7wVJY8LigaC3FQk8mAg+g0ViFbZxKq5T1BWz6990XTN+MFCi+YL
   Q==;
X-CSE-ConnectionGUID: gy8wga0USKmh5b5POlYSvw==
X-CSE-MsgGUID: S+ob3msOTcaf1QRz0s0g0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="542513"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="542513"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 17:48:38 -0700
X-CSE-ConnectionGUID: UGRSxFL+QoiDU8QM4DxKSQ==
X-CSE-MsgGUID: x2h7+MLAQaa3HdoNZhYVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="2427047"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 10 Oct 2026 17:48:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFhju-000000009Kp-45Is;
	Sun, 11 Oct 2026 00:48:35 +0000
Date: Sun, 11 Oct 2026 02:47:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 62/323]
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: ctcu@8001000 (qcom,shikra-ctcu):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202610110256.4nSzCEFq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jie Gan <jie.gan@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   d053e38e614fb2e383b298ce8fc308a780d7f209
commit: eed738c6dd0ca67e8e0ed0e18c97e4665078867b [62/323] arm64: dts: qcom: shikra: Add coresight nodes
:::::: branch date: 9 days ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-2403-20261001 (https://download.01.org/0day-ci/archive/20261011/202610110256.4nSzCEFq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110256.4nSzCEFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610110256.4nSzCEFq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: ctcu@8001000 (qcom,shikra-ctcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu'] is too long
   	'qcom,shikra-ctcu' is not one of ['qcom,glymur-ctcu', 'qcom,kaanapali-ctcu', 'qcom,qcs8300-ctcu', 'qcom,sm8750-ctcu', 'qcom,x1e80100-ctcu']
   	'qcom,shikra-ctcu' is not one of ['qcom,sa8775p-ctcu']
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/ctcu@8001000: failed to match any schema with compatible: ['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu']
--
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: ctcu@8001000 (qcom,shikra-ctcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu'] is too long
   	'qcom,shikra-ctcu' is not one of ['qcom,glymur-ctcu', 'qcom,kaanapali-ctcu', 'qcom,qcs8300-ctcu', 'qcom,sm8750-ctcu', 'qcom,x1e80100-ctcu']
   	'qcom,shikra-ctcu' is not one of ['qcom,sa8775p-ctcu']
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: /soc@0/ctcu@8001000: failed to match any schema with compatible: ['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: ctcu@8001000 (qcom,shikra-ctcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu'] is too long
   	'qcom,shikra-ctcu' is not one of ['qcom,glymur-ctcu', 'qcom,kaanapali-ctcu', 'qcom,qcs8300-ctcu', 'qcom,sm8750-ctcu', 'qcom,x1e80100-ctcu']
   	'qcom,shikra-ctcu' is not one of ['qcom,sa8775p-ctcu']
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/ctcu@8001000: failed to match any schema with compatible: ['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
