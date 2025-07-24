Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C029A5
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 00:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753316804; cv=none; b=L5q6jMo1kT1XKr99fSh0YObU2MNgEsYlDIEIWCf9Kq2M/r3xMoCfUZLmKOaavNzbj8gdK1y7Dt/Acu6+mWNwkGvwfoaW0SzMsCS9ebpQD4l4mOIdFKk+gbH/D0GfuqLV9u1BhObOFVBgeqxw0pZMxyOUBt3jNo9bsUsc0XOnnQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753316804; c=relaxed/simple;
	bh=tUnUv/MRXjGSAcWlIPQd1ENPWXU3kGwEAP/4I9QIQ9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkmL6PSf5kj9NmYgNl8nsg9y4agBTuoTWYlSo+mtC+atK9kAWthk2Fxf6f0lKoOkEOUZcNjcxxxkZBqyZNf42q043AkOidwslDtB8LRG4oqYpU8dCcRPSIQ2Fqsu+xSs43lo4VvCwWx8a95puntR04XwOLryW5anwgcK9pJ3RqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgOxjPef; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgOxjPef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753316802; x=1784852802;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tUnUv/MRXjGSAcWlIPQd1ENPWXU3kGwEAP/4I9QIQ9Q=;
  b=JgOxjPefRHHVLahsZ+IOSm+2JDlhSqgSODj4CuQj7UGPfivu5mWq/TV8
   9pBzk7kWs3IMfngD6wAsIMG6gZ+e3gLKBwhHzziaEN1QIEvrxayo20MRc
   zqzXBx4XZ30qKRaLLTAA2DqHjIIXdzvGJ+X31GIuCN2Z77M1bbkn0zdIV
   x6vEre5JCiJL8YpFWMecF2Di53hWqViDDSh+87XSvjx3RHaeo5cOjmPIE
   XyiMR6E/I/o1We+u5PKmMKmZk735lcBZPNojuEafPgvaa2qyIgMdcdD8f
   ICWmQ6/RlRoJzdYvGJzGDzfUMUfyLrZIHvBDMEeRCRwTLQUMu8aBN/XRE
   Q==;
X-CSE-ConnectionGUID: +SokZ1+cSeyqUNC8mVDZ2A==
X-CSE-MsgGUID: fEivDqOES2OClUTq7A6YOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66687569"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="66687569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 17:26:41 -0700
X-CSE-ConnectionGUID: AdwvLeLrRh6SeeeToVZBXQ==
X-CSE-MsgGUID: 6mrUpFA+THaenem7+l04qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="164328261"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2025 17:26:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uejnB-000Juh-3B;
	Thu, 24 Jul 2025 00:26:37 +0000
Date: Thu, 24 Jul 2025 08:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:x5h-upstream-2025-07-23 8/9]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,armv9):
 compatible:0: 'arm,armv9' is not one of ['apple,avalanche',
 'apple,blizzard', 'apple,cyclone', 'apple,firestorm',
 'apple,hurricane-zephyr', 'apple,icestorm', 'apple,mistral', 'apple,mon...
Message-ID: <202507240829.A9Wp6n33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>

tree:   https://github.com/morimoto/linux x5h-upstream-2025-07-23
head:   4f1ee479ff21edc58a728be98643a149c526c6ad
commit: bf67a932488471f7bbfbbfa5e6ac3cbe4f1d2ca6 [8/9] arm64: renesas: Add =
R8A78000 Ironhide board code
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250723 (https://download.01.org/0day-ci/arch=
ive/20250724/202507240829.A9Wp6n33-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250724/202507240829.A9Wp6n33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507240829.A9Wp6n33-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,armv9): co=
mpatible:0: 'arm,armv9' is not one of ['apple,avalanche', 'apple,blizzard',=
 'apple,cyclone', 'apple,firestorm', 'apple,hurricane-zephyr', 'apple,icest=
orm', 'apple,mistral', 'apple,monsoon', 'apple,twister', 'apple,typhoon', '=
arm,arm710t', 'arm,arm720t', 'arm,arm740t', 'arm,arm7ej-s', 'arm,arm7tdmi',=
 'arm,arm7tdmi-s', 'arm,arm9es', 'arm,arm9ej-s', 'arm,arm920t', 'arm,arm922=
t', 'arm,arm925', 'arm,arm926e-s', 'arm,arm926ej-s', 'arm,arm940t', 'arm,ar=
m946e-s', 'arm,arm966e-s', 'arm,arm968e-s', 'arm,arm9tdmi', 'arm,arm1020e',=
 'arm,arm1020t', 'arm,arm1022e', 'arm,arm1026ej-s', 'arm,arm1136j-s', 'arm,=
arm1136jf-s', 'arm,arm1156t2-s', 'arm,arm1156t2f-s', 'arm,arm1176jzf', 'arm=
,arm1176jz-s', 'arm,arm1176jzf-s', 'arm,arm11mpcore', 'arm,armv8', 'arm,cor=
tex-a5', 'arm,cortex-a7', 'arm,cortex-a8', 'arm,cortex-a9', 'arm,cortex-a12=
', 'arm,cortex-a15', 'arm,cortex-a17', 'arm,cortex-a32', 'arm,cortex-a34', =
'arm,cortex-a35', 'arm,cortex-a53', 'arm,cortex-a55', 'arm,cortex-a57', 'ar=
m,cortex-a65', 'arm,cortex-a72', 'arm,cortex-a73', 'arm,cortex-a75', 'arm,c=
ortex-a76', 'arm,cortex-a77', 'arm,cortex-a78', 'arm,cortex-a78ae', 'arm,co=
rtex-a78c', 'arm,cortex-a510', 'arm,cortex-a520', 'arm,cortex-a710', 'arm,c=
ortex-a715', 'arm,cortex-a720', 'arm,cortex-a725', 'arm,cortex-m0', 'arm,co=
rtex-m0+', 'arm,cortex-m1', 'arm,cortex-m3', 'arm,cortex-m4', 'arm,cortex-r=
4', 'arm,cortex-r5', 'arm,cortex-r7', 'arm,cortex-r52', 'arm,cortex-x1', 'a=
rm,cortex-x1c', 'arm,cortex-x2', 'arm,cortex-x3', 'arm,cortex-x4', 'arm,cor=
tex-x925', 'arm,neoverse-e1', 'arm,neoverse-n1', 'arm,neoverse-n2', 'arm,ne=
overse-n3', 'arm,neoverse-v1', 'arm,neoverse-v2', 'arm,neoverse-v3', 'arm,n=
eoverse-v3ae', 'arm,rainier', 'brcm,brahma-b15', 'brcm,brahma-b53', 'brcm,v=
ulcan', 'cavium,thunder', 'cavium,thunder2', 'faraday,fa526', 'intel,sa110'=
, 'intel,sa1100', 'marvell,feroceon', 'marvell,mohawk', 'marvell,pj4a', 'ma=
rvell,pj4b', 'marvell,sheeva-v5', 'marvell,sheeva-v7', 'nvidia,tegra132-den=
ver', 'nvidia,tegra186-denver', 'nvidia,tegra194-carmel', 'qcom,krait', 'qc=
om,kryo', 'qcom,kryo240', 'qcom,kryo250', 'qcom,kryo260', 'qcom,kryo280', '=
qcom,kryo360', 'qcom,kryo385', 'qcom,kryo465', 'qcom,kryo468', 'qcom,kryo47=
0', 'qcom,kryo485', 'qcom,kryo560', 'qcom,kryo570', 'qcom,kryo660', 'qcom,k=
ryo670', 'qcom,kryo685', 'qcom,kryo780', 'qcom,oryon', 'qcom,scorpion', 'sa=
msung,mongoose-m2', 'samsung,mongoose-m3', 'samsung,mongoose-m5']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,armv9): co=
mpatible: ['arm,armv9', 'arm,cortex-a720'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,armv9): Un=
evaluated properties are not allowed ('l1-cache-controller-0', 'l2-cache-co=
ntroller-0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@0: failed t=
o match any schema with compatible: ['arm,armv9', 'arm,cortex-a720']
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0=
 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0=
 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0=
 (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0=
 (cache): Unevaluated properties are not allowed ('next-level-cache' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-0=
 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-0=
 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-0=
 (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-0=
 (cache): Unevaluated properties are not allowed ('next-level-cache' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,armv9): =
compatible:0: 'arm,armv9' is not one of ['apple,avalanche', 'apple,blizzard=
', 'apple,cyclone', 'apple,firestorm', 'apple,hurricane-zephyr', 'apple,ice=
storm', 'apple,mistral', 'apple,monsoon', 'apple,twister', 'apple,typhoon',=
 'arm,arm710t', 'arm,arm720t', 'arm,arm740t', 'arm,arm7ej-s', 'arm,arm7tdmi=
', 'arm,arm7tdmi-s', 'arm,arm9es', 'arm,arm9ej-s', 'arm,arm920t', 'arm,arm9=
22t', 'arm,arm925', 'arm,arm926e-s', 'arm,arm926ej-s', 'arm,arm940t', 'arm,=
arm946e-s', 'arm,arm966e-s', 'arm,arm968e-s', 'arm,arm9tdmi', 'arm,arm1020e=
', 'arm,arm1020t', 'arm,arm1022e', 'arm,arm1026ej-s', 'arm,arm1136j-s', 'ar=
m,arm1136jf-s', 'arm,arm1156t2-s', 'arm,arm1156t2f-s', 'arm,arm1176jzf', 'a=
rm,arm1176jz-s', 'arm,arm1176jzf-s', 'arm,arm11mpcore', 'arm,armv8', 'arm,c=
ortex-a5', 'arm,cortex-a7', 'arm,cortex-a8', 'arm,cortex-a9', 'arm,cortex-a=
12', 'arm,cortex-a15', 'arm,cortex-a17', 'arm,cortex-a32', 'arm,cortex-a34'=
, 'arm,cortex-a35', 'arm,cortex-a53', 'arm,cortex-a55', 'arm,cortex-a57', '=
arm,cortex-a65', 'arm,cortex-a72', 'arm,cortex-a73', 'arm,cortex-a75', 'arm=
,cortex-a76', 'arm,cortex-a77', 'arm,cortex-a78', 'arm,cortex-a78ae', 'arm,=
cortex-a78c', 'arm,cortex-a510', 'arm,cortex-a520', 'arm,cortex-a710', 'arm=
,cortex-a715', 'arm,cortex-a720', 'arm,cortex-a725', 'arm,cortex-m0', 'arm,=
cortex-m0+', 'arm,cortex-m1', 'arm,cortex-m3', 'arm,cortex-m4', 'arm,cortex=
-r4', 'arm,cortex-r5', 'arm,cortex-r7', 'arm,cortex-r52', 'arm,cortex-x1', =
'arm,cortex-x1c', 'arm,cortex-x2', 'arm,cortex-x3', 'arm,cortex-x4', 'arm,c=
ortex-x925', 'arm,neoverse-e1', 'arm,neoverse-n1', 'arm,neoverse-n2', 'arm,=
neoverse-n3', 'arm,neoverse-v1', 'arm,neoverse-v2', 'arm,neoverse-v3', 'arm=
,neoverse-v3ae', 'arm,rainier', 'brcm,brahma-b15', 'brcm,brahma-b53', 'brcm=
,vulcan', 'cavium,thunder', 'cavium,thunder2', 'faraday,fa526', 'intel,sa11=
0', 'intel,sa1100', 'marvell,feroceon', 'marvell,mohawk', 'marvell,pj4a', '=
marvell,pj4b', 'marvell,sheeva-v5', 'marvell,sheeva-v7', 'nvidia,tegra132-d=
enver', 'nvidia,tegra186-denver', 'nvidia,tegra194-carmel', 'qcom,krait', '=
qcom,kryo', 'qcom,kryo240', 'qcom,kryo250', 'qcom,kryo260', 'qcom,kryo280',=
 'qcom,kryo360', 'qcom,kryo385', 'qcom,kryo465', 'qcom,kryo468', 'qcom,kryo=
470', 'qcom,kryo485', 'qcom,kryo560', 'qcom,kryo570', 'qcom,kryo660', 'qcom=
,kryo670', 'qcom,kryo685', 'qcom,kryo780', 'qcom,oryon', 'qcom,scorpion', '=
samsung,mongoose-m2', 'samsung,mongoose-m3', 'samsung,mongoose-m5']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,armv9): =
compatible: ['arm,armv9', 'arm,cortex-a720'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,armv9): =
Unevaluated properties are not allowed ('l1-cache-controller-1', 'l2-cache-=
controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@100: failed=
 to match any schema with compatible: ['arm,armv9', 'arm,cortex-a720']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-1=
 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
--
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-3=
1 (cache): Unevaluated properties are not allowed ('next-level-cache' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-3=
1 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-3=
1 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-3=
1 (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-3=
1 (cache): Unevaluated properties are not allowed ('next-level-cache' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (rene=
sas,rcar-gen5-scif): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too long
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too short
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s72100']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s9210']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7778', 'renesa=
s,scif-r8a7779']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7742', 'renesa=
s,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,s=
cif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,sci=
f-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a774a1', 'renes=
as,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renes=
as,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas=
,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas=
,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a779a0', 'renes=
as,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a78000']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g044']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g043', 'rene=
sas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a09g047']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (rene=
sas,rcar-gen5-scif): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too long
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too short
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s72100']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s9210']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7778', 'renesa=
s,scif-r8a7779']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7742', 'renesa=
s,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,s=
cif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,sci=
f-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a774a1', 'renes=
as,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renes=
as,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas=
,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas=
,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a779a0', 'renes=
as,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a78000']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g044']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g043', 'rene=
sas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a09g047']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0708000 (rene=
sas,rcar-gen5-scif): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too long
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too short
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s72100']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s9210']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7778', 'renesa=
s,scif-r8a7779']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7742', 'renesa=
s,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,s=
cif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,sci=
f-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a774a1', 'renes=
as,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renes=
as,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas=
,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas=
,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a779a0', 'renes=
as,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a78000']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g044']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g043', 'rene=
sas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a09g047']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c070c000 (rene=
sas,rcar-gen5-scif): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too long
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too short
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s72100']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s9210']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7778', 'renesa=
s,scif-r8a7779']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7742', 'renesa=
s,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,s=
cif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,sci=
f-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a774a1', 'renes=
as,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renes=
as,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas=
,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas=
,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a779a0', 'renes=
as,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a78000']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g044']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a07g043', 'rene=
sas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r9a09g047']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (rene=
sas,rcar-gen5-hscif): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yam=
l#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (rene=
sas,rcar-gen5-hscif): compatible: 'oneOf' conditional failed, one must be f=
ixed:
   	['renesas,rcar-gen5-hscif', 'renesas,hscif'] is too short
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7778', 'rene=
sas,hscif-r8a7779']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7742', 'rene=
sas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'rene=
sas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'ren=
esas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a774a1', 'ren=
esas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', '=
renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', =
'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980=
', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a779a0', 'ren=
esas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a78000']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yam=
l#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (rene=
sas,rcar-gen5-hscif): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yam=
l#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0714000 (rene=
sas,rcar-gen5-hscif): compatible: 'oneOf' conditional failed, one must be f=
ixed:
   	['renesas,rcar-gen5-hscif', 'renesas,hscif'] is too short
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7778', 'rene=
sas,hscif-r8a7779']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7742', 'rene=
sas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'rene=
sas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'ren=
esas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a774a1', 'ren=
esas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', '=
renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', =
'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980=
', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a779a0', 'ren=
esas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a78000']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yam=
l#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0718000 (rene=
sas,rcar-gen5-hscif): compatible: 'oneOf' conditional failed, one must be f=
ixed:
   	['renesas,rcar-gen5-hscif', 'renesas,hscif'] is too short
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7778', 'rene=
sas,hscif-r8a7779']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7742', 'rene=
sas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'rene=
sas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'ren=
esas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a774a1', 'ren=
esas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', '=
renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', =
'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980=
', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a779a0', 'ren=
esas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a78000']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yam=
l#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c071c000 (rene=
sas,rcar-gen5-hscif): compatible: 'oneOf' conditional failed, one must be f=
ixed:
   	['renesas,rcar-gen5-hscif', 'renesas,hscif'] is too short
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7778', 'rene=
sas,hscif-r8a7779']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a7742', 'rene=
sas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'rene=
sas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'ren=
esas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a774a1', 'ren=
esas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', '=
renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', =
'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980=
', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a779a0', 'ren=
esas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen5-hscif' is not one of ['renesas,hscif-r8a78000']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
