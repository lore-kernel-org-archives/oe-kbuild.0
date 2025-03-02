Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495D158DD8
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740957940; cv=none; b=VBw/zMDnE8dZIUSQUQY2kqXkw5eirm9TfnBjevmnQ4i75a/TlubtO0ChG4r9ko9/IPWhLzJxyTcS92d/xs7RuKPz11bQjatbPI1HgUuvf+EKTZD+Rc0M8nHLU1zE0ZJLtk3+3hM4Fn4D+PNmL0nmreo4cEvrwfPK6eYY4sEXwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740957940; c=relaxed/simple;
	bh=VflQ3R02WhiQYoiZuQGX0NtJB3LKv0dY1eKP10DqHWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqE0/6d211kf7NwnR3T0FwzL55cBNTPbJhywJk68nXgIY5kai+neUFkImMxWYoMx+652LbcfCzgDZgnMFbOfdgPiTy5x7BT5M0gij1XBmNv/qV30Fdqv6aR9fD+lR1WsefboyJsTvusCtc8Mktel8QyKuHhxdCBo8HDDZWp0GBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMOB7cmp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMOB7cmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740957937; x=1772493937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VflQ3R02WhiQYoiZuQGX0NtJB3LKv0dY1eKP10DqHWY=;
  b=fMOB7cmpy82GZpRccmbMZhb6pyMLsgVtSjkRGJrCNv5uZ6l4g1t5vwXc
   Xa+9hgH8LlZ1ZCeUdxzwrGOhH5RSD4DUk5iyzGfl3sbNj0ZBLRmWnW29Y
   S1PR733sBK/ywqASN2ZE7iArHlc8WAla0ki4lpk+gu02FsT3N7GrOilcg
   84CBPzWHdEeNygjKcZrniqlx5gFGvgrqOoiMukBLe1nczAFsYGDfd7ODU
   jjS6utMywN0fqOC15zUQ9UG9I3Fz9ST0lJFn4uOARdcAT5XsRHgyX4bhh
   Trb3MLIs+7c8UAYH9SFsjbhOMq6lWTz+0krHBF3EJZwtZzVEo6hiLO4/u
   g==;
X-CSE-ConnectionGUID: gtY1ZPzLTJqaod+uNIuXCw==
X-CSE-MsgGUID: x9wdLuzEQHKPDyLrlARe5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41946239"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41946239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 15:25:36 -0800
X-CSE-ConnectionGUID: kcgacG2kSnGdO9KmqOxf+A==
X-CSE-MsgGUID: Wtf8S0+5SV63Kf6k1HKbwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123080989"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 15:25:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tosge-000Hig-1q;
	Sun, 02 Mar 2025 23:25:32 +0000
Date: Mon, 3 Mar 2025 07:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Message-ID: <202503030615.gAGW30Tw-lkp@intel.com>
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
In-Reply-To: <20250221075058.14180-2-friday.yang@mediatek.com>
References: <20250221075058.14180-2-friday.yang@mediatek.com>
TO: Friday Yang <friday.yang@mediatek.com>

Hi Friday,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc4]
[cannot apply to next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Friday-Yang/dt-bindings-clock-mediatek-Add-SMI-LARBs-reset-for-MT8188/20250221-155430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250221075058.14180-2-friday.yang%40mediatek.com
patch subject: [PATCH v4 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250303/202503030615.gAGW30Tw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030615.gAGW30Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503030615.gAGW30Tw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000: iommus: [[102, 685], [102, 686], [102, 690], [102, 691], [102, 692], [102, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1a040000: iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1a040000: iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15110000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15130000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15220000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15330000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15520000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15620000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1604f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1606f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1608f000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@160af000: '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[125, 685], [125, 686], [125, 690], [125, 691], [125, 692], [125, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
