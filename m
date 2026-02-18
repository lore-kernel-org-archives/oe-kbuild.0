Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB51F1513
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 05:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771392325; cv=none; b=ikHvSQkdLxZgF2JbGfHJwkPr11akCu+L4rU8HsDfaKITAFo6PVPg3oGPoN9Ya8yW1/mph3jFkle8beAkPk/aKpm4pWXDfWO+0jdhqww3pRxVnUJnBqEanx0FQ6qPMb8QEkUTXjCktNayPXr1bcDLLmXjG6sSM1+7N45IfiLy1Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771392325; c=relaxed/simple;
	bh=0L/VHeLb2xwxoTir9PsTwhAq4FRoa04Iks8pjCJHfwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G/kiNNUxwuPRusxuh0kjYZ7WDbGv0pz62n4CeFtCzIdvco15Ff5iUoZb1yvUJO16PBaLu/empZwVp6rzNqpa16lCWPeVVMjSZO24pedD/oDGQQRwaKk3u/7u2cvda8B4v2w7Aip2uOfHrI2MgrJI5EfwXm4HHZg+U2m74iEk2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC6476LZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC6476LZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771392319; x=1802928319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0L/VHeLb2xwxoTir9PsTwhAq4FRoa04Iks8pjCJHfwQ=;
  b=jC6476LZ29P6XHCzX/kJJSj21XS8umnhKoWVXuRHkqhtkr9MpVFzmOiI
   JcAT7GYvmDnNCS9nI3inQqx7Kd415HTya0UTWT6Beqelwzav0t4x9D/bh
   wCPXwYOuzOuU4R5fDyDyYpy/gr99HzVsmhq08Q61B17JGZ+QRmAUzbSE7
   BPKI+ayJAHvhYXmXDcUgTLu0qFNHcq2baSVjOb5h68FznDRekbMIVxWVv
   39B6d5V7SbI44KeGjUUHVXAM6pMcvX4cMbJHOvFAR+mQWpTD+NsJC1+4a
   wNM2Wt5asRqp+7T4uikoFmEgL6FgVCmuMrWEmGXZIAq2ZFv8WVaCLr5jW
   w==;
X-CSE-ConnectionGUID: 3n/q3IojR1uuAX1F5sLHIg==
X-CSE-MsgGUID: qN4FKrxJTUOF0cPBDdYUFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83831245"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83831245"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 21:25:19 -0800
X-CSE-ConnectionGUID: ax1phd06RwapKuhgltFJ4g==
X-CSE-MsgGUID: fcod7bmiSsq+XnhibBaSYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="237103329"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2026 21:25:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsa3m-000000003WL-1qFH;
	Wed, 18 Feb 2026 05:25:14 +0000
Date: Wed, 18 Feb 2026 06:24:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/turris1x.dtb: ethernet@24000
 (gianfar): Unevaluated properties are not allowed ('fsl,pmc-handle' was
 unexpected)
Message-ID: <202602180646.nMG1v71h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: a70fdd936818c2c12b8c2dd04ce8586c31837d9a dt-bindings: net: Convert =
fsl,gianfar to YAML
date:   12 months ago
:::::: branch date: 8 months ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-2051-20260206 (https://download.01.org/0day-ci/a=
rchive/20260218/202602180646.nMG1v71h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260218/202602180646.nMG1v71h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602180646.nMG1v71h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/i2c@3000/clock-generat=
or@69: failed to match any schema with compatible: ['idt,6v49205b']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/spi@7000: failed to ma=
tch any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/turris1x.dtb: usb@22000 (fsl-usb2-dr-v1.6): compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/turris1x.dtb: usb@22000 (fsl-usb2-dr-v1.6): Uneval=
uated properties are not allowed ('#address-cells', '#size-cells' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/usb@22000: failed to m=
atch any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/turris1x.dtb: ethernet@24000 (gianfar): Unevaluate=
d properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/turris1x.dtb: switch@10 (qca,qca8337): Unevaluated=
 properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca8k.yaml
   arch/powerpc/boot/dts/turris1x.dtb: ptp_clock@24e00 (fsl,etsec-ptp): int=
errupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/turris1x.dtb: ethernet@25000 (gianfar): Unevaluate=
d properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/turris1x.dtb: ethernet@26000 (gianfar): Unevaluate=
d properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/turris1x.dtb: sdhc@2e000 (fsl,p2020-esdhc): $noden=
ame:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
--
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: usb@22000 (fsl-usb2-dr): Uneva=
luated properties are not allowed ('#address-cells', '#size-cells' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: sdhc@2e000 (fsl,esdhc): $noden=
ame:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: sdhc@2e000 (fsl,esdhc): compat=
ible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc'=
, 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc=
', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls10=
43a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: sdhc@2e000 (fsl,esdhc): compat=
ible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ptp_clock@b0e00 (fsl,etsec-ptp=
): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b0000 (fsl,etsec2): q=
ueue-group@b0000: '#address-cells', '#size-cells' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b0000 (fsl,etsec2): U=
nevaluated properties are not allowed ('queue-group@b0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b1000 (fsl,etsec2): q=
ueue-group@b1000: '#address-cells', '#size-cells' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b1000 (fsl,etsec2): U=
nevaluated properties are not allowed ('queue-group@b1000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm-law@0: faile=
d to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed=
 to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed=
 to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/memory-controlle=
r@2000: failed to match any schema with compatible: ['fsl,bsc9131-memory-co=
ntroller']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: i2c@3000 (fsl-i2c): compatible=
: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: usb@22000 (fsl-usb2-dr): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr', 'fsl-usb2-dr-v2.2'] is too long
   	'fsl-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: usb@22000 (fsl-usb2-dr): Uneva=
luated properties are not allowed ('#address-cells', '#size-cells' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ptp_clock@b0e00 (fsl,etsec-ptp=
): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b0000 (fsl,etsec2): q=
ueue-group@b0000: '#address-cells', '#size-cells' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b0000 (fsl,etsec2): U=
nevaluated properties are not allowed ('queue-group@b0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b1000 (fsl,etsec2): q=
ueue-group@b1000: '#address-cells', '#size-cells' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b1000 (fsl,etsec2): U=
nevaluated properties are not allowed ('queue-group@b1000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm-law@0: faile=
d to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed=
 to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed=
 to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100 (fsl-i2c): compatible=
: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100 (fsl-i2c): Unevaluate=
d properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /memory-controller@fffe1e000/cpl=
d@2,0: failed to match any schema with compatible: ['fsl,c293pcie-cpld']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/spi@7000: failed =
to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b0000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b0000 (fsl,etsec2): Une=
valuated properties are not allowed ('queue-group@b0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b1000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b1000 (fsl,etsec2): Une=
valuated properties are not allowed ('queue-group@b1000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/ecm-law@0: failed=
 to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/ecm@1000: failed =
to match any schema with compatible: ['fsl,c293-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/ecm@1000: failed =
to match any schema with compatible: ['fsl,c293-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/memory-controller=
@2000: failed to match any schema with compatible: ['fsl,c293-memory-contro=
ller']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3100 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: usb@22000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ethernet-phy@0: interrupts: [[12=
], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ethernet-phy@1: interrupts: [[11=
], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ethernet@24000 (gianfar): Uneval=
uated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ethernet@25000 (gianfar): Uneval=
uated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/ecm-law@0: failed =
to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3100 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@18000: faile=
d to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@18000: faile=
d to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: faile=
d to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: faile=
d to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/l2-cache-controll=
er@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cach=
e-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300: failed=
 to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-cha=
nnel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-chann=
el']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-cha=
nnel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-chan=
nel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-cha=
nnel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-cha=
nnel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-cha=
nnel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-cha=
nnel']
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: ethernet@24000 (gianfar): Uneva=
luated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp)=
: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] =
is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@22000 (fsl-usb2-mph-v1.2): =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph'] is too lo=
ng
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.=
5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@22000 (fsl-usb2-mph-v1.2): =
Unevaluated properties are not allowed ('#address-cells', '#size-cells' wer=
e unexpected)
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@18000: =
failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sa=
ta']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@18000: =
failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sa=
ta']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: =
failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sa=
ta']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: =
failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sa=
ta']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/l2-cache-con=
troller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2=
-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300: f=
ailed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dm=
a-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-=
channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dm=
a-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma=
-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dm=
a-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dm=
a-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dm=
a-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dm=
a-channel']
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: ethernet@24000 (gianfar): U=
nevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: ptp_clock@24e00 (fsl,etsec-=
ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, =
0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@22000 (fsl-usb2-mph-v1.=
2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph'] is too lo=
ng
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.=
5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@22000 (fsl-usb2-mph-v1.=
2): Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
 were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: i2c@3000 (fsl-i2c): Unevaluate=
d properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: i2c@3100 (fsl-i2c): compatible=
: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: i2c@3100 (fsl-i2c): Unevaluate=
d properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: ethernet@24000 (gianfar): Unev=
aluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: ethernet@25000 (gianfar): Unev=
aluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/ecm-law@0: f=
ailed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/ecm@1000: fa=
iled to match any schema with compatible: ['fsl,mpc8568-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/ecm@1000: fa=
iled to match any schema with compatible: ['fsl,mpc8568-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: duart-sleep-nexus (simple-bus)=
: $nodename:0: 'duart-sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|=
bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: serial@4500 (fsl,ns16550): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/spi@7000: failed t=
o match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: usb@22000 (fsl-usb2-dr-v1.6): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: usb@22000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: ethernet@24000 (gianfar): Uneval=
uated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/mdio@24520/etherne=
t-phy@1: failed to match any schema with compatible: ['brcm,bcm54616S']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: ethernet-phy@1 (brcm,bcm54616S):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm54616S'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,bcm54616S' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]=
{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/mdio@24520/etherne=
t-phy@2: failed to match any schema with compatible: ['brcm,bcm54616S']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: ethernet-phy@2 (brcm,bcm54616S):=
 compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000 (fsl-usb2-dr-v1.6):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000 (fsl-usb2-dr-v1.6):=
 Unevaluated properties are not allowed ('#address-cells', '#size-cells' we=
re unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/usb@22000: fail=
ed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b0000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b2000 (fsl,etsec2): =
queue-group@b2000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b2000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b200=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm-law@0: fail=
ed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/memory-controll=
er@2000: failed to match any schema with compatible: ['fsl,p1010-memory-con=
troller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: serial@4500 (fsl,ns16550): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ptp_clock@b0e00 (fsl,etse=
c-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/memory-con=
troller@2000: failed to match any schema with compatible: ['fsl,p1010-memor=
y-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: serial@4500 (fsl,ns16550)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000 (fsl-usb2-dr-v1.6):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000 (fsl-usb2-dr-v1.6):=
 Unevaluated properties are not allowed ('#address-cells', '#size-cells' we=
re unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/usb@22000: fail=
ed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b0000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b2000 (fsl,etsec2): =
queue-group@b2000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b2000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b200=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm-law@0: fail=
ed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/memory-controll=
er@2000: failed to match any schema with compatible: ['fsl,p1010-memory-con=
troller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: serial@4500 (fsl,ns16550): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ptp_clock@b0e00 (fsl,etse=
c-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/memory-con=
troller@2000: failed to match any schema with compatible: ['fsl,p1010-memor=
y-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: serial@4500 (fsl,ns16550)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /localbus@ffe05000/L2swit=
ch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000: failed to =
match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/usb@22000: =
failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-=
dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@23000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /localbus@fffe05000/L2swi=
tch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000: failed to=
 match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@23000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0 (spansion,s25sl12=
801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kern=
el', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-s=
upply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z=
0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[=
0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: =
failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-=
dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: =
failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: f=
ailed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: f=
ailed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0 (spansion,s25sl12=
801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kern=
el', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-s=
upply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z=
0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[=
0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0 (spansion,=
s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partiti=
on@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$'=
, '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9]=
[a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA=
-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000 (fsl-usb=
2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000 (fsl-usb=
2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#siz=
e-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/usb@=
22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fs=
l-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b0000 (fs=
l,etsec2): queue-group@b0000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b0000 (fs=
l,etsec2): queue-group@b4000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b1000 (fs=
l,etsec2): queue-group@b1000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b1000 (fs=
l,etsec2): queue-group@b5000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b1000 (fs=
l,etsec2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue=
-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b2000 (fs=
l,etsec2): queue-group@b2000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b2000 (fs=
l,etsec2): queue-group@b6000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b2000 (fs=
l,etsec2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue=
-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm-=
law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3100 (fsl-i2c)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3100 (fsl-i2c)=
: Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpe=
cted)
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/spi@=
7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: flash@0 (spansion,=
s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partiti=
on@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$'=
, '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9]=
[a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA=
-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@22000 (fsl-usb=
2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/usb@=
22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fs=
l-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b0000 (fs=
l,etsec2): queue-group@b0000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b0000 (fs=
l,etsec2): queue-group@b4000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b0000 (fs=
l,etsec2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue=
-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b1000 (fs=
l,etsec2): queue-group@b1000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b1000 (fs=
l,etsec2): queue-group@b5000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b2000 (fs=
l,etsec2): queue-group@b2000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b2000 (fs=
l,etsec2): queue-group@b6000: '#address-cells', '#size-cells' do not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm-=
law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: i2c@3100 (fsl-i2c)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: serial@4500 (fsl,n=
s16550): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3000 (fsl-i2c): Unevaluat=
ed properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000: faile=
d to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@0=
: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@1=
: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b0000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b4000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b5000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b2000 (fsl,etsec2): =
queue-group@b2000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b2000 (fsl,etsec2): =
queue-group@b6000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b2000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b200=
0', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@22000 (fsl-usb2-dr-v1.6):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@22000 (fsl-usb2-dr-v1.6):=
 Unevaluated properties are not allowed ('#address-cells', '#size-cells' we=
re unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@22000: fail=
ed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm-law@0: fail=
ed to match any schema with compatible: ['fsl,ecm-law']
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@23000 (fsl-usb2-dr-v1.6): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@23000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/usb@23000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b0000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b4000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b0000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000',=
 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b1000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b5000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b1000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000',=
 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b2000 (fsl,etsec2): que=
ue-group@b2000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b2000 (fsl,etsec2): que=
ue-group@b6000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b2000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000',=
 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/ecm-law@0: failed =
to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3100 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/usb@22000: fa=
iled to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr=
']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@23000 (fsl-usb2-dr-v1.6)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@23000 (fsl-usb2-dr-v1.6)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/usb@23000: fa=
iled to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr=
']
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b0000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b4000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b00=
00', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b1000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b5000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b10=
00', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b2000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b6000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b20=
00', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/ecm-law@0: fa=
iled to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/ecm@1000: fai=
led to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/ecm@1000: fai=
led to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3100 (fsl-i2c): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: nor@0,0 (cfi-flash): $nod=
ename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000: failed to =
match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/usb@22000: =
failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-=
dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@23000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: nor@0,0 (cfi-flash): $nod=
ename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000: failed to=
 match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@23000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0 (spansion,s25sl12801): '=
partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do n=
ot match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[=
a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-z=
A-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$',=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000 (fsl-usb2-dr-v1.6): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b0000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b4000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b0000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000',=
 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b1000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b5000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b1000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000',=
 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b2000 (fsl,etsec2): que=
ue-group@b2000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b2000 (fsl,etsec2): que=
ue-group@b6000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b2000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000',=
 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm-law@0: failed =
to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3100 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: =
failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-=
dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ptp_clock@b0e00 (fsl,etse=
c-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: =
failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: f=
ailed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: f=
ailed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ptp_clock@b0e00 (fsl,etse=
c-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b0000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b1000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): queue-group@b5000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b1000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b2000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): queue-group@b6000: '#address-cells', '#size-cells' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: f=
ailed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fs=
l,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: f=
ailed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fs=
l,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: f=
ailed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fs=
l,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: f=
ailed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fs=
l,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: f=
ailed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fs=
l,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/pic@40000: fail=
ed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/message@41400: =
failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/msi@41600: fail=
ed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b0000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b4000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b5000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/global-utilitie=
s@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: fa=
iled to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pm=
c', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: fa=
iled to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pm=
c', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: fa=
iled to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pm=
c', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /pcie@ffe09000: failed to mat=
ch any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: =
failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'f=
sl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: =
failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'f=
sl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: =
failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'f=
sl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: =
failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'f=
sl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: =
failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'f=
sl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/pic@40000: fai=
led to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/message@41400:=
 failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/msi@41600: fai=
led to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b0000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): =
queue-group@b4000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b5000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/global-utiliti=
es@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: f=
ailed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-p=
mc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: f=
ailed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-p=
mc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: f=
ailed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-p=
mc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /pcie@fffe09000: failed to ma=
tch any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: usb@23000 (fsl-usb2-dr-v1.6): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: usb@23000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/usb@23000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b0000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b4000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b0000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000',=
 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b1000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b5000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b1000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000',=
 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/ecm-law@0: failed =
to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/memory-controller@=
2000: failed to match any schema with compatible: ['fsl,p1022-memory-contro=
ller']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/usb@22000: fai=
led to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@23000 (fsl-usb2-dr-v1.6)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/usb@23000: fai=
led to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b0000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b4000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b0000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b00=
00', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b1000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b5000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b1000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b10=
00', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b2000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b6000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b2000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b20=
00', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/ecm-law@0: fai=
led to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/ecm@1000: fail=
ed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/ecm@1000: fail=
ed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3100 (fsl-i2c): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/usb@22000: fa=
iled to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr=
']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@23000 (fsl-usb2-dr-v1.6)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/usb@23000: fa=
iled to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr=
']
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b0000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b4000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b00=
00', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b1000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b5000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b10=
00', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b2000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b6000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b20=
00', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/ecm-law@0: fa=
iled to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/ecm@1000: fai=
led to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/ecm@1000: fai=
led to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3100 (fsl-i2c): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0 (spansion,s25sl12801=
): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel'=
, 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supp=
ly$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9=
#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9=
a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/usb@22000: fai=
led to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b0000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b4000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b0000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b00=
00', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b1000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b5000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b1000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b10=
00', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b2000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b6000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b2000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b20=
00', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm-law@0: fai=
led to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm@1000: fail=
ed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm@1000: fail=
ed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3100 (fsl-i2c): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0 (spansion,s25sl12801=
): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel'=
, 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supp=
ly$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9=
#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9=
a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/usb@22000: fa=
iled to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr=
']
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b0000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 queue-group@b4000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b0000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b00=
00', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b1000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 queue-group@b5000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b1000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b10=
00', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b2000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 queue-group@b6000: '#address-cells', '#size-cells' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b2000 (fsl,etsec2):=
 Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b20=
00', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm-law@0: fa=
iled to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm@1000: fai=
led to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm@1000: fai=
led to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3100 (fsl-i2c): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000 (fsl-usb2-dr-v1.6): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: ptp_clock@b0e00 (fsl,etsec-ptp):=
 interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b0000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b0000 (fsl,etsec2): que=
ue-group@b4000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b0000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000',=
 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b1000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b1000 (fsl,etsec2): que=
ue-group@b5000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b2000 (fsl,etsec2): que=
ue-group@b2000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b2000 (fsl,etsec2): que=
ue-group@b6000: '#address-cells', '#size-cells' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b2000 (fsl,etsec2): Une=
valuated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000',=
 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm-law@0: failed =
to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: i2c@3000 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-chann=
el@100: failed to match any schema with compatible: ['fsl,eloplus-dma-chann=
el']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-chann=
el@180: failed to match any schema with compatible: ['fsl,eloplus-dma-chann=
el']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: usb@22000 (fsl-usb2-dr-v1.6): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: usb@22000 (fsl-usb2-dr-v1.6): Une=
valuated properties are not allowed ('#address-cells', '#size-cells' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/usb@22000: failed t=
o match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@24000 (gianfar): Unevalu=
ated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp): =
interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@25000 (gianfar): Unevalu=
ated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@26000 (gianfar): Unevalu=
ated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: sdhc@2e000 (fsl,p2020-esdhc): $no=
dename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: faile=
d to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,se=
c2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: =
failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-=
dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: ptp_clock@24e00 (fsl,etse=
c-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too lo=
ng
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: ethernet@24000 (gianfar):=
 Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: ethernet@25000 (gianfar):=
 Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: ethernet@26000 (gianfar):=
 Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: =
failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: f=
ailed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: f=
ailed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1=
.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000:=
 failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2=
-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: ptp_clock@24e00 (fsl,etse=
c-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too lo=
ng
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: ethernet@24000 (gianfar):=
 Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: ethernet@25000 (gianfar):=
 Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: ethernet@26000 (gianfar):=
 Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: usb@22000 (fsl-usb2-dr-v1.6): co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5=
']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: usb@22000 (fsl-usb2-dr-v1.6): Un=
evaluated properties are not allowed ('#address-cells', '#size-cells' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/usb@22000: failed =
to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: ptp_clock@24e00 (fsl,etsec-ptp):=
 interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: ethernet@24000 (gianfar): Uneval=
uated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: ethernet@25000 (gianfar): Uneval=
uated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: ethernet@26000 (gianfar): Uneval=
uated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm-law@0: failed =
to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm@1000: failed t=
o match any schema with compatible: ['fsl,p2020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: i2c@3100 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
