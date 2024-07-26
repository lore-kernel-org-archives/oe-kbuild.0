Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8764B3C30
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jul 2024 07:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721979825; cv=none; b=R9z7Kd2yjAQ6DV2I14BbHqUH5dV/7zNcCGYuBsyQmdVucqlpLzuqcjere+bSJXB/20guOhMESeBp25XfHVC8xeTaD9xjeBjAmfhn9w73WRRhGHFu1c4hzPde6jDUAAMKnKzNf1BY1LZFztkDtF0FeealouUCszp5E00l9bUQqoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721979825; c=relaxed/simple;
	bh=C7E/qLSfCUoegwPZF37vz0pICxgI5QlQDuuXgA4xO6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYOJhPx3d6KKowcPx/z4KKFSN3pTrxe8I8KTuCmtLLKRzVaPCFjdqzNHGZzFw7W9EDg9qDMz0Q+2F+ULoWbo7dWhxnHwahXrEkJhcLGuAnVS1ZGdlSw/DyWbbUuJ98+i3enj8IUJWdW5GHFd7xYsEDBpDgDfpTZI0icELoxXdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxlbA8P+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxlbA8P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721979823; x=1753515823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7E/qLSfCUoegwPZF37vz0pICxgI5QlQDuuXgA4xO6U=;
  b=MxlbA8P+T73fYT2u2XPfD9BA2T8ptVJPPV+PEDR5+9m69oaHeE5RkGN/
   RByi8fG3kEhrphZ5Nns5ie70u63iNVbAWmzh/jTFN3Gk4f5ajInkcWoEr
   EFoZrH7HwAu1RN2F1nLze4U9076c1d+G93QoUAaLE3IpzHxsFhs0fDCH0
   xjQIiha+7xKK2/iRaHfQK2Y3rCogPEDUEmqU8lJjMqB3/BOE9PQrhp8J+
   gpcs6PffaV3HZAlELAyzEz9ltyRU/l3l47oDYa3i7wZpKnDf9FevIlaYD
   jhU4X7XB+WxbmwDj6yeWfdx36ks6sJyQi+xsfBomg/HvUwdJ1MnKggfF4
   w==;
X-CSE-ConnectionGUID: WLBJLRFWRAuNhfTB+V/3HQ==
X-CSE-MsgGUID: l8yWhDvsRz2cj9HJ3viC8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42290230"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="42290230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 00:43:43 -0700
X-CSE-ConnectionGUID: TAHoECplRcuBb/Voey/ZAg==
X-CSE-MsgGUID: 9ENn+qzWTpGy5IRUjymglQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="53121175"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2024 00:43:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXFc3-000ot4-1Y;
	Fri, 26 Jul 2024 07:43:39 +0000
Date: Fri, 26 Jul 2024 15:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-bsp/v6.6.42-2024-07-26 163/180]
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: usb@11c60000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407261509.v8pYj2gc-lkp@intel.com>
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
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.42-2024-07-26
head:   4e5f524d436f247ffec753e3df6eada28be82d91
commit: 66c2c048ea5fff0a06092f46fb84108ca2e1f03c [163/180] arm64: dts: renesas: r9a07g0{43,44,54}: Update RZ/G2L family compatible
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-051-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261509.v8pYj2gc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261509.v8pYj2gc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407261509.v8pYj2gc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: usb@11c60000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a07g043' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a07g043' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: /soc/usb@11c60000: failed to match any schema with compatible: ['renesas,usbhs-r9a07g043', 'renesas,rzg2l-usbhs']
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: interrupt-controller@110a0000: interrupts: [[0, 0, 4], [0, 1, 4], [0, 2, 4], [0, 3, 4], [0, 4, 4], [0, 5, 4], [0, 6, 4], [0, 7, 4], [0, 8, 4], [0, 444, 4], [0, 445, 4], [0, 446, 4], [0, 447, 4], [0, 448, 4], [0, 449, 4], [0, 450, 4], [0, 451, 4], [0, 452, 4], [0, 453, 4], [0, 454, 4], [0, 455, 4], [0, 456, 4], [0, 457, 4], [0, 458, 4], [0, 459, 4], [0, 460, 4], [0, 461, 4], [0, 462, 4], [0, 463, 4], [0, 464, 4], [0, 465, 4], [0, 466, 4], [0, 467, 4], [0, 468, 4], [0, 469, 4], [0, 470, 4], [0, 471, 4], [0, 472, 4], [0, 473, 4], [0, 474, 4], [0, 475, 4], [0, 25, 1], [0, 34, 1], [0, 35, 1], [0, 36, 1], [0, 37, 1], [0, 38, 1], [0, 39, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: interrupt-controller@110a0000: interrupt-names: ['nmi', 'irq0', 'irq1', 'irq2', 'irq3', 'irq4', 'irq5', 'irq6', 'irq7', 'tint0', 'tint1', 'tint2', 'tint3', 'tint4', 'tint5', 'tint6', 'tint7', 'tint8', 'tint9', 'tint10', 'tint11', 'tint12', 'tint13', 'tint14', 'tint15', 'tint16', 'tint17', 'tint18', 'tint19', 'tint20', 'tint21', 'tint22', 'tint23', 'tint24', 'tint25', 'tint26', 'tint27', 'tint28', 'tint29', 'tint30', 'tint31', 'bus-err', 'ec7tie1-0', 'ec7tie2-0', 'ec7tiovf-0', 'ec7tie1-1', 'ec7tie2-1', 'ec7tiovf-1'] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: interrupt-controller@110a0000: interrupts: [[0, 0, 4], [0, 1, 4], [0, 2, 4], [0, 3, 4], [0, 4, 4], [0, 5, 4], [0, 6, 4], [0, 7, 4], [0, 8, 4], [0, 444, 4], [0, 445, 4], [0, 446, 4], [0, 447, 4], [0, 448, 4], [0, 449, 4], [0, 450, 4], [0, 451, 4], [0, 452, 4], [0, 453, 4], [0, 454, 4], [0, 455, 4], [0, 456, 4], [0, 457, 4], [0, 458, 4], [0, 459, 4], [0, 460, 4], [0, 461, 4], [0, 462, 4], [0, 463, 4], [0, 464, 4], [0, 465, 4], [0, 466, 4], [0, 467, 4], [0, 468, 4], [0, 469, 4], [0, 470, 4], [0, 471, 4], [0, 472, 4], [0, 473, 4], [0, 474, 4], [0, 475, 4], [0, 25, 1], [0, 34, 1], [0, 35, 1], [0, 36, 1], [0, 37, 1], [0, 38, 1], [0, 39, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: interrupt-controller@110a0000: interrupt-names: ['nmi', 'irq0', 'irq1', 'irq2', 'irq3', 'irq4', 'irq5', 'irq6', 'irq7', 'tint0', 'tint1', 'tint2', 'tint3', 'tint4', 'tint5', 'tint6', 'tint7', 'tint8', 'tint9', 'tint10', 'tint11', 'tint12', 'tint13', 'tint14', 'tint15', 'tint16', 'tint17', 'tint18', 'tint19', 'tint20', 'tint21', 'tint22', 'tint23', 'tint24', 'tint25', 'tint26', 'tint27', 'tint28', 'tint29', 'tint30', 'tint31', 'bus-err', 'ec7tie1-0', 'ec7tie2-0', 'ec7tiovf-0', 'ec7tie1-1', 'ec7tie2-1', 'ec7tiovf-1'] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: interrupt-controller@110a0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: usb@11c60000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a07g044' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a07g044' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/usb@11c60000: failed to match any schema with compatible: ['renesas,usbhs-r9a07g044', 'renesas,rzg2l-usbhs']
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: interrupt-controller@110a0000: interrupts: [[0, 0, 4], [0, 1, 4], [0, 2, 4], [0, 3, 4], [0, 4, 4], [0, 5, 4], [0, 6, 4], [0, 7, 4], [0, 8, 4], [0, 444, 4], [0, 445, 4], [0, 446, 4], [0, 447, 4], [0, 448, 4], [0, 449, 4], [0, 450, 4], [0, 451, 4], [0, 452, 4], [0, 453, 4], [0, 454, 4], [0, 455, 4], [0, 456, 4], [0, 457, 4], [0, 458, 4], [0, 459, 4], [0, 460, 4], [0, 461, 4], [0, 462, 4], [0, 463, 4], [0, 464, 4], [0, 465, 4], [0, 466, 4], [0, 467, 4], [0, 468, 4], [0, 469, 4], [0, 470, 4], [0, 471, 4], [0, 472, 4], [0, 473, 4], [0, 474, 4], [0, 475, 4], [0, 25, 1], [0, 34, 1], [0, 35, 1], [0, 36, 1], [0, 37, 1], [0, 38, 1], [0, 39, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: interrupt-controller@110a0000: interrupt-names: ['nmi', 'irq0', 'irq1', 'irq2', 'irq3', 'irq4', 'irq5', 'irq6', 'irq7', 'tint0', 'tint1', 'tint2', 'tint3', 'tint4', 'tint5', 'tint6', 'tint7', 'tint8', 'tint9', 'tint10', 'tint11', 'tint12', 'tint13', 'tint14', 'tint15', 'tint16', 'tint17', 'tint18', 'tint19', 'tint20', 'tint21', 'tint22', 'tint23', 'tint24', 'tint25', 'tint26', 'tint27', 'tint28', 'tint29', 'tint30', 'tint31', 'bus-err', 'ec7tie1-0', 'ec7tie2-0', 'ec7tiovf-0', 'ec7tie1-1', 'ec7tie2-1', 'ec7tiovf-1'] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: interrupt-controller@110a0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: usb@11c60000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a07g044' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a07g044' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/usb@11c60000: failed to match any schema with compatible: ['renesas,usbhs-r9a07g044', 'renesas,rzg2l-usbhs']
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: interrupt-controller@110a0000: interrupts: [[0, 0, 4], [0, 1, 4], [0, 2, 4], [0, 3, 4], [0, 4, 4], [0, 5, 4], [0, 6, 4], [0, 7, 4], [0, 8, 4], [0, 444, 4], [0, 445, 4], [0, 446, 4], [0, 447, 4], [0, 448, 4], [0, 449, 4], [0, 450, 4], [0, 451, 4], [0, 452, 4], [0, 453, 4], [0, 454, 4], [0, 455, 4], [0, 456, 4], [0, 457, 4], [0, 458, 4], [0, 459, 4], [0, 460, 4], [0, 461, 4], [0, 462, 4], [0, 463, 4], [0, 464, 4], [0, 465, 4], [0, 466, 4], [0, 467, 4], [0, 468, 4], [0, 469, 4], [0, 470, 4], [0, 471, 4], [0, 472, 4], [0, 473, 4], [0, 474, 4], [0, 475, 4], [0, 25, 1], [0, 34, 1], [0, 35, 1], [0, 36, 1], [0, 37, 1], [0, 38, 1], [0, 39, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: interrupt-controller@110a0000: interrupt-names: ['nmi', 'irq0', 'irq1', 'irq2', 'irq3', 'irq4', 'irq5', 'irq6', 'irq7', 'tint0', 'tint1', 'tint2', 'tint3', 'tint4', 'tint5', 'tint6', 'tint7', 'tint8', 'tint9', 'tint10', 'tint11', 'tint12', 'tint13', 'tint14', 'tint15', 'tint16', 'tint17', 'tint18', 'tint19', 'tint20', 'tint21', 'tint22', 'tint23', 'tint24', 'tint25', 'tint26', 'tint27', 'tint28', 'tint29', 'tint30', 'tint31', 'bus-err', 'ec7tie1-0', 'ec7tie2-0', 'ec7tiovf-0', 'ec7tie1-1', 'ec7tie2-1', 'ec7tiovf-1'] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: interrupt-controller@110a0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: usb@11c60000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a07g054' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a07g054' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: /soc/usb@11c60000: failed to match any schema with compatible: ['renesas,usbhs-r9a07g054', 'renesas,rzg2l-usbhs']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
