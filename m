Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F537175A97
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 02:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771356; cv=none; b=mDw5okFVPWTZHkiMpzDpoSg9ovkWGgyqTGXWiEz2kTWmLC4s2Z2BjrtJMOyms+g/HPSCQAX3EgvBqPjMFpaittMIYkPO0OQTPJFct0z4QsQPvoYnwhpbf96eH0whU6zQeB2Jbj+uWqZ4YqLtFGTZfpDsjrqcHnQmhEnn/q/u5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771356; c=relaxed/simple;
	bh=xm4hlfmgxtNvIO+pH0IZxrBRHd1vB8NMAH5OPIRCKB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h7qWWseSmSU0ERHZ0Kru37y+VN8gqhJ2gbriiOuwk/yEJ2P8CeeSdEyvQVYqajFgllQ+b/27dc96CCZGIC7ysk5VPGuWiMnAEJ4EwwOTVCWX2+d9LcZN/0Aff45P+kGuLCJkLJYYQAYqyl8wEs1CsNJDtnMt26c53LnVDItSB9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKvhpqoN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKvhpqoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791771355; x=1823307355;
  h=date:from:to:cc:subject:message-id;
  bh=xm4hlfmgxtNvIO+pH0IZxrBRHd1vB8NMAH5OPIRCKB0=;
  b=FKvhpqoNVVULOOu3zz8Oson03c7xPGrEE6Q/9faLYMs93Xy+/rKWG7Oe
   YmVoIWHJGTbzU4w3GInBUzPltb4gPrX1qYtUXfTRU7bB60H5k9gpDtO+9
   IGjuMb4PXx2O3RB3UgyMrqlr+CY+ni7b+QM7AybaUVCvyBReOplhIHYO2
   UfEQk+gMpBz2bX9X92Y3EQClRizdW7PmK7bUaFd0CqmdT0RmtkBUQaYhR
   XkL6ezHFDZRkruC3Zw7e+OyuHQ1wli3AS5UciTqSw0m8j3VRSiee8GImT
   ImqBuA1b9YiWFA5t6IgZOOAyjU+mvFT5hr8UjyFouvbEPfmfkq7qJqc9J
   Q==;
X-CSE-ConnectionGUID: Y20riThLSnm348dQ3MuNPQ==
X-CSE-MsgGUID: oUAjzQNRTjyQo8g/GQw4rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="361429"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="361429"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 19:15:54 -0700
X-CSE-ConnectionGUID: eoJ+HCscRlu26y/oOZa9yw==
X-CSE-MsgGUID: ihdZMyY/TI6gtkDvG/n3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="707873"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2026 19:15:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG5Zu-000000009oX-3Cll;
	Mon, 12 Oct 2026 02:15:50 +0000
Date: Mon, 12 Oct 2026 04:15:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 62/323]
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: ctcu@8001000 (qcom,shikra-ctcu):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202610120403.K5Z0udIF-lkp@intel.com>
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
:::::: branch date: 10 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-2403-20261001 (https://download.01.org/0day-ci/archive/20261012/202610120403.K5Z0udIF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120403.K5Z0udIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610120403.K5Z0udIF-lkp@intel.com/

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
