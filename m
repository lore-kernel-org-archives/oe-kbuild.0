Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D09300A53
	for <oe-kbuild@lists.linux.dev>; Tue,  6 May 2025 02:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498198; cv=none; b=Pa9z4VQMgkfdTAbKXEvuu1uOndUtyIaV0OMKFxXZ8eqTfYttXlhsvzyFZNx32GC+YMB0ZmbsBiA7H/Xdqpr1I6fVZgTQMozpS4Saqf1jel6NOElYsBJbl6YhiKO6H73XIC4DHOlr9FSJd97yk1obSShMr2kr72MDbsH5zQIrYiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498198; c=relaxed/simple;
	bh=D6HEbuVDVkndGurVc8iyaYIMIEM0fhOZ4hYLt7bfp2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MjnYD/m10FuoMV7Fb+G6PEjFX6kV4lGiFdVebHWB1CK3ue/fH7Fynfhe/NHpTvhKyhz7YojXawPoHx2RuGfqgZrkmaWXgfCcW2xyachhVpYEUjc2zfaQ7ZARMReCJW+RbSWKNFBT2IIJSSTJznnxdIM/EZ8dCNbKxOX1Z8EpGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUSzCjrr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUSzCjrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746498196; x=1778034196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6HEbuVDVkndGurVc8iyaYIMIEM0fhOZ4hYLt7bfp2M=;
  b=eUSzCjrrjwpfQwNi26ijS1u5T/b6F9AMYn22HP6GVLyvStAm22TomzLY
   LyWZ0SWMRu6H/0URoeKWAO2H34s04+9sQxjcHdng2uqt5wIe55292XiDU
   sJItsjYWN69Y77XtDutJ3ru/9WmmiCpERCo39FNwos9c4BsQt+aHzjmCo
   Ieq/pK5EOMs+EmJWl7ZL15/VN0vZGCTuXs8gedqg5x4Mqgo0w+X5xfIlh
   XUGCPvINm3U+feIUmouhrTkNRIwOLgDBf4vNFEbCMjb3DArcOLdfZa4Y9
   5m85DT2cizgmb5Tr7uAqXZGPT7xfcuiiHTFeCoq+QX6abMNnzUpIlZ0n5
   g==;
X-CSE-ConnectionGUID: cHgJIJP5QGSGySw5A1vJlw==
X-CSE-MsgGUID: wCCBE4fHRBuEzH5fFhsUtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51946931"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="51946931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 19:23:15 -0700
X-CSE-ConnectionGUID: UJxMoGB0Tzqg0htyDUAp7w==
X-CSE-MsgGUID: fTxJkDsqRUyt44k8GGDgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="172660170"
Received: from igk-lkp-server01.igk.intel.com (HELO fc6c8d864a4c) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2025 19:23:14 -0700
Received: from kbuild by fc6c8d864a4c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC7xe-0000ke-1n;
	Tue, 06 May 2025 02:23:10 +0000
Date: Tue, 6 May 2025 10:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000
 (mediatek,mt8188-gce): 'clock-names' is a required property
Message-ID: <202505061054.AL5OvX40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01f95500a162fca88cefab9ed64ceded5afabc12
commit: 45682a4fffdd9abd6e2df9c5c534d22f2eda94f9 arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250506/202505061054.AL5OvX40-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061054.AL5OvX40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505061054.AL5OvX40-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
