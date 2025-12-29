Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF3313E1E
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013749; cv=none; b=H31YlNwz8w4vQ/r06oJ6VZ9XhHFLHLsgC7TfzobXEHCVTJLGRGeiLGIvIpQ8lSG79o0LP/5dGRkvc+r6XOhoaOGMoBhHsCMJ8PDorq7UypssWpAJS9iY6PFyauPk/y+SQctHhthW0gydS5Yo395/oL9AMICH1bQuUkpGitQK0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013749; c=relaxed/simple;
	bh=XfoyfXN/5iWLKhYkqQRK23V2WT2xrvCvq/WrIKte590=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekQFhyOYbxpYW2mbACX0HSyA3Zf4WhzqeQQUBaPe0a/JXpfRK6orLZfJUNXMmgOL5FRjKbQeM1ed8PCeld1s0rGghx3eRaNOAv0IW3dY+HO21b3n40Wlk/vWcuLE8e+RsYWgwHOiGOFrFHuys7y8PKKXa6C9kKQcVyen4tqvKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hppc7yFu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hppc7yFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767013746; x=1798549746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XfoyfXN/5iWLKhYkqQRK23V2WT2xrvCvq/WrIKte590=;
  b=hppc7yFuxbXjTA2Kh7D6gLN+2GUBZVZjCNarq06ZllH4X7d8ZONP5jz9
   Px7kPGvsxYJVyg670AbOAmD3MNjjzkn76GLy7ErFGvdIMiQskLVdTX178
   ILTGi7VAiKZ6qrnetESgOEIctrVDFWwTzc+5XEY8Oz01oBd2ahCd4cCaV
   p8h/1SmmUX6BWxFJkiwppimi8n7pcy9AsLWIss6oBMimmvZFhpzkZB/r8
   x+bFsNSmMJvR4U+V1W5326qugGp38yi6V+TMf6RnOZiDv8IaM8NGMTLqL
   96GK0bDCuVgBvuvsmkLYSfBV79Qb2ixWe876gG6EpyTEPaX1cy7XsRvo5
   Q==;
X-CSE-ConnectionGUID: HbB5huNTQnqzwG/tYrB2Hg==
X-CSE-MsgGUID: VyyjxpZPRSKx1CRCZ4vUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="78927965"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="78927965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:09:06 -0800
X-CSE-ConnectionGUID: dfY8vTvETca9XEE1JnzPSA==
X-CSE-MsgGUID: Ig2QeVDjQ0i41wikuAwsbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="238329666"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2025 05:09:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaCze-000000007ku-2dDW;
	Mon, 29 Dec 2025 13:09:02 +0000
Date: Mon, 29 Dec 2025 14:08:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 50/128]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: smc@2a2400000 (apple,t6020-smc):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202512291444.ZcVNQXKp-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>
CC: Asahi Lina <lina@asahilina.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 05a3c35e6b4d6906acc34c2393ad18c8f049aab1 [50/128] arm64: dts: apple=
: t602x: Add missing devices
:::::: branch date: 7 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/arc=
hive/20251229/202512291444.ZcVNQXKp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251229/202512291444.ZcVNQXKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512291444.ZcVNQXKp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: opp-table-gpu-cs (operating-p=
oints-v2): $nodename:0: 'opp-table-gpu-cs' does not match '^opp-table(-[a-z=
0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: opp-table-gpu-cs (operating-p=
oints-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp02=
', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: opp-table-gpu-afr (operating-=
points-v2): $nodename:0: 'opp-table-gpu-afr' does not match '^opp-table(-[a=
-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: opp-table-gpu-afr (operating-=
points-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp0=
2', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: smc@2a2400000 (apple,t6020-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: smc@2a2400000 (apple,t6020-sm=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', =
'apple,t8112-smc']
   	'apple,t8103-smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_co=
unt', 'panic_count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cells: [[45], [46], [47], [48], [49]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000/=
rtc: failed to match any schema with compatible: ['apple,smc-rtc']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: reboot (apple,smc-reboot): nv=
mem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_count', 'panic_=
count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: reboot (apple,smc-reboot): nv=
mem-cells: [[45], [46], [47], [48], [49]] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/display-subsys=
tem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: display-subsystem (apple,disp=
lay-subsystem): iommus: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/iommu/iommu.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb-pd@39 (apple,cd321x): 'la=
bel' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb-pd@3a (apple,cd321x): 'la=
bel' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: gpu@406400000 (apple,agx-t602=
2): 'apple,afr-leak-coef', 'apple,afr-opp', 'apple,avg-power-filter-tc-ms',=
 'apple,avg-power-ki-only', 'apple,avg-power-kp', 'apple,avg-power-min-duty=
-cycle', 'apple,avg-power-target-filter-tc', 'apple,core-leak-coef', 'apple=
,cs-leak-coef', 'apple,cs-opp', 'apple,csafr-min-sram-microvolt', 'apple,fa=
st-die0-integral-gain', 'apple,fast-die0-proportional-gain', 'apple,firmwar=
e-compat', 'apple,firmware-version', 'apple,idleoff-standby-timer', 'apple,=
min-sram-microvolt', 'apple,perf-base-pstate', 'apple,perf-boost-ce-step', =
'apple,perf-boost-min-util', 'apple,perf-filter-drop-threshold', 'apple,per=
f-filter-time-constant', 'apple,perf-filter-time-constant2', 'apple,perf-in=
tegral-gain', 'apple,perf-integral-gain2', 'apple,perf-integral-min-clamp',=
 'apple,perf-proportional-gain', 'apple,perf-proportional-gain2', 'apple,pe=
rf-tgt-utilization', 'apple,power-sample-period', 'apple,ppm-filter-time-co=
nstant-ms', 'apple,ppm-ki', 'apple,ppm-kp', 'apple,pwr-filter-time-constant=
', 'apple,pwr-integral-gain', 'apple,pwr-integral-min-clamp', 'apple,pwr-mi=
n-duty-cycle', 'apple,pwr-proportional-gain', 'apple,pwr-sample-period-aic-=
clks', 'apple,se-engagement-criteria', 'apple,se-filter-time-constant', 'ap=
ple,se-filter-time-constant-1', 'apple,se-inactive-threshold', 'apple,se-ki=
', 'apple,se-ki-1', 'apple,se-kp', 'apple,se-kp-1', 'apple,se-reset-criteri=
a', 'apple,sram-leak-coef', 'interrupt-parent', 'interrupts', 'operating-po=
ints-v2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: gpu@406400000 (apple,agx-t602=
2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,agx-t6022', 'apple,agx-g14x', 'apple,agx-g14d', 'apple,agx-g14s=
'] is too long
   	'apple,agx-t6022' is not one of ['apple,agx-g13g', 'apple,agx-g13s', 'a=
pple,agx-g14g', 'apple,agx-g14s']
   	'apple,agx-t6022' is not one of ['apple,agx-g13c', 'apple,agx-g13d']
   	'apple,agx-t6022' is not one of ['apple,agx-g14c', 'apple,agx-g14d']
   	'apple,agx-g13s' was expected
   	'apple,agx-g14s' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/gpu@406400000:=
 failed to match any schema with compatible: ['apple,agx-t6022', 'apple,agx=
-g14x', 'apple,agx-g14d', 'apple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/gpu@406400000:=
 failed to match any schema with compatible: ['apple,agx-t6022', 'apple,agx=
-g14x', 'apple,agx-g14d', 'apple,agx-g14s']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@290280000 (a=
pple,t6020-pmgr): power-controller@4000: 'apple,force-disable' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@4000 (apple,=
t6020-pmgr-pwrstate): 'apple,force-disable' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: efuse@29e2cc000 (apple,t6020-=
efuses): compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efu=
ses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/efuse@29e2cc00=
0: failed to match any schema with compatible: ['apple,t6020-efuses', 'appl=
e,efuses']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@702280000:=
 failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,t8=
103-dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@702280000:=
 failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,t8=
103-dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@703000000:=
 failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,=
t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: opp-table-gpu-cs (operating-p=
oints-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp02=
', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: opp-table-gpu-afr (operating-=
points-v2): $nodename:0: 'opp-table-gpu-afr' does not match '^opp-table(-[a=
-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: opp-table-gpu-afr (operating-=
points-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp0=
2', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: soc (simple-bus): display-sub=
system: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: smc@2a2400000 (apple,t6020-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: smc@2a2400000 (apple,t6020-sm=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', =
'apple,t8112-smc']
   	'apple,t8103-smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_co=
unt', 'panic_count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cells: [[27], [28], [29], [30], [31]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000/rtc: faile=
d to match any schema with compatible: ['apple,smc-rtc']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: reboot (apple,smc-reboot): nv=
mem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_count', 'panic_=
count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: reboot (apple,smc-reboot): nv=
mem-cells: [[27], [28], [29], [30], [31]] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000 (apple,t6020-=
dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@38930c000 (apple,t6020-=
dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@389c00000: failed to=
 match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@389c00000: failed to=
 match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/display-subsystem: faile=
d to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: gpu@406400000 (apple,agx-t602=
0): 'apple,afr-leak-coef', 'apple,afr-opp', 'apple,avg-power-filter-tc-ms',=
 'apple,avg-power-ki-only', 'apple,avg-power-kp', 'apple,avg-power-min-duty=
-cycle', 'apple,avg-power-target-filter-tc', 'apple,core-leak-coef', 'apple=
,cs-leak-coef', 'apple,cs-opp', 'apple,csafr-min-sram-microvolt', 'apple,fa=
st-die0-integral-gain', 'apple,fast-die0-proportional-gain', 'apple,firmwar=
e-compat', 'apple,firmware-version', 'apple,min-sram-microvolt', 'apple,per=
f-base-pstate', 'apple,perf-boost-ce-step', 'apple,perf-boost-min-util', 'a=
pple,perf-filter-drop-threshold', 'apple,perf-filter-time-constant', 'apple=
,perf-filter-time-constant2', 'apple,perf-integral-gain', 'apple,perf-integ=
ral-gain2', 'apple,perf-integral-min-clamp', 'apple,perf-proportional-gain'=
, 'apple,perf-proportional-gain2', 'apple,perf-tgt-utilization', 'apple,pow=
er-sample-period', 'apple,ppm-filter-time-constant-ms', 'apple,ppm-ki', 'ap=
ple,ppm-kp', 'apple,pwr-filter-time-constant', 'apple,pwr-integral-gain', '=
apple,pwr-integral-min-clamp', 'apple,pwr-min-duty-cycle', 'apple,pwr-propo=
rtional-gain', 'apple,pwr-sample-period-aic-clks', 'apple,se-engagement-cri=
teria', 'apple,se-filter-time-constant', 'apple,se-filter-time-constant-1',=
 'apple,se-inactive-threshold', 'apple,se-ki', 'apple,se-ki-1', 'apple,se-k=
p', 'apple,se-kp-1', 'apple,se-reset-criteria', 'apple,sram-leak-coef', 'in=
terrupt-parent', 'interrupts', 'operating-points-v2' do not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: gpu@406400000 (apple,agx-t602=
0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,agx-t6020', 'apple,agx-g14x', 'apple,agx-g14s'] is too long
   	'apple,agx-t6020' is not one of ['apple,agx-g13g', 'apple,agx-g13s', 'a=
pple,agx-g14g', 'apple,agx-g14s']
   	'apple,agx-t6020' is not one of ['apple,agx-g13c', 'apple,agx-g13d']
   	'apple,agx-t6020' is not one of ['apple,agx-g14c', 'apple,agx-g14d']
   	'apple,agx-g13s' was expected
   	'apple,agx-g14s' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6020', 'apple,agx-g14x', 'a=
pple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6020', 'apple,agx-g14x', 'a=
pple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-p=
cie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (a=
pple,t6020-pmgr): power-controller@4000: 'apple,force-disable' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4000 (apple,=
t6020-pmgr-pwrstate): 'apple,force-disable' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: efuse@29e2cc000 (apple,t6020-=
efuses): compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efu=
ses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/efuse@29e2cc000: failed =
to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@702280000: failed to=
 match any schema with compatible: ['apple,t6020-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@702280000: failed to=
 match any schema with compatible: ['apple,t6020-dwc3', 'apple,t8103-dwc3']
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: opp-table-gpu-cs (operating-p=
oints-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp02=
', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: opp-table-gpu-afr (operating-=
points-v2): $nodename:0: 'opp-table-gpu-afr' does not match '^opp-table(-[a=
-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: opp-table-gpu-afr (operating-=
points-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp0=
2', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: soc (simple-bus): display-sub=
system: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: smc@2a2400000 (apple,t6020-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: smc@2a2400000 (apple,t6020-sm=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', =
'apple,t8112-smc']
   	'apple,t8103-smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_co=
unt', 'panic_count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cells: [[27], [28], [29], [30], [31]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000/rtc: faile=
d to match any schema with compatible: ['apple,smc-rtc']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: reboot (apple,smc-reboot): nv=
mem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_count', 'panic_=
count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: reboot (apple,smc-reboot): nv=
mem-cells: [[27], [28], [29], [30], [31]] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@389304000 (apple,t6020-=
dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@38930c000 (apple,t6020-=
dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dcp@389c00000: failed to=
 match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dcp@389c00000: failed to=
 match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/display-subsystem: faile=
d to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: gpu@406400000 (apple,agx-t602=
1): 'apple,afr-leak-coef', 'apple,afr-opp', 'apple,avg-power-filter-tc-ms',=
 'apple,avg-power-ki-only', 'apple,avg-power-kp', 'apple,avg-power-min-duty=
-cycle', 'apple,avg-power-target-filter-tc', 'apple,core-leak-coef', 'apple=
,cs-leak-coef', 'apple,cs-opp', 'apple,csafr-min-sram-microvolt', 'apple,fa=
st-die0-integral-gain', 'apple,fast-die0-proportional-gain', 'apple,firmwar=
e-compat', 'apple,firmware-version', 'apple,idleoff-standby-timer', 'apple,=
min-sram-microvolt', 'apple,perf-base-pstate', 'apple,perf-boost-ce-step', =
'apple,perf-boost-min-util', 'apple,perf-filter-drop-threshold', 'apple,per=
f-filter-time-constant', 'apple,perf-filter-time-constant2', 'apple,perf-in=
tegral-gain', 'apple,perf-integral-gain2', 'apple,perf-integral-min-clamp',=
 'apple,perf-proportional-gain', 'apple,perf-proportional-gain2', 'apple,pe=
rf-tgt-utilization', 'apple,power-sample-period', 'apple,ppm-filter-time-co=
nstant-ms', 'apple,ppm-ki', 'apple,ppm-kp', 'apple,pwr-filter-time-constant=
', 'apple,pwr-integral-gain', 'apple,pwr-integral-min-clamp', 'apple,pwr-mi=
n-duty-cycle', 'apple,pwr-proportional-gain', 'apple,pwr-sample-period-aic-=
clks', 'apple,se-engagement-criteria', 'apple,se-filter-time-constant', 'ap=
ple,se-filter-time-constant-1', 'apple,se-inactive-threshold', 'apple,se-ki=
', 'apple,se-ki-1', 'apple,se-kp', 'apple,se-kp-1', 'apple,se-reset-criteri=
a', 'apple,sram-leak-coef', 'interrupt-parent', 'interrupts', 'operating-po=
ints-v2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: gpu@406400000 (apple,agx-t602=
1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,agx-t6021', 'apple,agx-g14x', 'apple,agx-g14c', 'apple,agx-g14s=
'] is too long
   	'apple,agx-t6021' is not one of ['apple,agx-g13g', 'apple,agx-g13s', 'a=
pple,agx-g14g', 'apple,agx-g14s']
   	'apple,agx-t6021' is not one of ['apple,agx-g13c', 'apple,agx-g13d']
   	'apple,agx-t6021' is not one of ['apple,agx-g14c', 'apple,agx-g14d']
   	'apple,agx-g13s' was expected
   	'apple,agx-g14s' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6021', 'apple,agx-g14x', 'a=
pple,agx-g14c', 'apple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6021', 'apple,agx-g14x', 'a=
pple,agx-g14c', 'apple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pcie@580000000 (apple,t6020-p=
cie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@290280000 (a=
pple,t6020-pmgr): power-controller@4000: 'apple,force-disable' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@4000 (apple,=
t6020-pmgr-pwrstate): 'apple,force-disable' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: efuse@29e2cc000 (apple,t6020-=
efuses): compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efu=
ses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/efuse@29e2cc000: failed =
to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@39b028000 (apple,t602=
0-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the reg=
exes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: opp-table-gpu-cs (operating-p=
oints-v2): $nodename:0: 'opp-table-gpu-cs' does not match '^opp-table(-[a-z=
0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: opp-table-gpu-cs (operating-p=
oints-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp02=
', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: opp-table-gpu-afr (operating-=
points-v2): $nodename:0: 'opp-table-gpu-afr' does not match '^opp-table(-[a=
-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: opp-table-gpu-afr (operating-=
points-v2): Unevaluated properties are not allowed ('opp00', 'opp01', 'opp0=
2', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: smc@2a2400000 (apple,t6020-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: smc@2a2400000 (apple,t6020-sm=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', =
'apple,t8112-smc']
   	'apple,t8103-smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_co=
unt', 'panic_count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: smc@2a2400000 (apple,t6020-sm=
c): reboot:nvmem-cells: [[45], [46], [47], [48], [49]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000/=
rtc: failed to match any schema with compatible: ['apple,smc-rtc']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: reboot (apple,smc-reboot): nv=
mem-cell-names: ['shutdown_flag', 'boot_stage', 'boot_error_count', 'panic_=
count', 'pm_setting'] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: reboot (apple,smc-reboot): nv=
mem-cells: [[45], [46], [47], [48], [49]] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/apple,smc-re=
boot.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/display-subsys=
tem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: display-subsystem (apple,disp=
lay-subsystem): iommus: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/iommu/iommu.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: gpu@406400000 (apple,agx-t602=
2): 'apple,afr-leak-coef', 'apple,afr-opp', 'apple,avg-power-filter-tc-ms',=
 'apple,avg-power-ki-only', 'apple,avg-power-kp', 'apple,avg-power-min-duty=
-cycle', 'apple,avg-power-target-filter-tc', 'apple,core-leak-coef', 'apple=
,cs-leak-coef', 'apple,cs-opp', 'apple,csafr-min-sram-microvolt', 'apple,fa=
st-die0-integral-gain', 'apple,fast-die0-proportional-gain', 'apple,firmwar=
e-compat', 'apple,firmware-version', 'apple,idleoff-standby-timer', 'apple,=
min-sram-microvolt', 'apple,perf-base-pstate', 'apple,perf-boost-ce-step', =
'apple,perf-boost-min-util', 'apple,perf-filter-drop-threshold', 'apple,per=
f-filter-time-constant', 'apple,perf-filter-time-constant2', 'apple,perf-in=
tegral-gain', 'apple,perf-integral-gain2', 'apple,perf-integral-min-clamp',=
 'apple,perf-proportional-gain', 'apple,perf-proportional-gain2', 'apple,pe=
rf-tgt-utilization', 'apple,power-sample-period', 'apple,ppm-filter-time-co=
nstant-ms', 'apple,ppm-ki', 'apple,ppm-kp', 'apple,pwr-filter-time-constant=
', 'apple,pwr-integral-gain', 'apple,pwr-integral-min-clamp', 'apple,pwr-mi=
n-duty-cycle', 'apple,pwr-proportional-gain', 'apple,pwr-sample-period-aic-=
clks', 'apple,se-engagement-criteria', 'apple,se-filter-time-constant', 'ap=
ple,se-filter-time-constant-1', 'apple,se-inactive-threshold', 'apple,se-ki=
', 'apple,se-ki-1', 'apple,se-kp', 'apple,se-kp-1', 'apple,se-reset-criteri=
a', 'apple,sram-leak-coef', 'interrupt-parent', 'interrupts', 'operating-po=
ints-v2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: gpu@406400000 (apple,agx-t602=
2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,agx-t6022', 'apple,agx-g14x', 'apple,agx-g14d', 'apple,agx-g14s=
'] is too long
   	'apple,agx-t6022' is not one of ['apple,agx-g13g', 'apple,agx-g13s', 'a=
pple,agx-g14g', 'apple,agx-g14s']
   	'apple,agx-t6022' is not one of ['apple,agx-g13c', 'apple,agx-g13d']
   	'apple,agx-t6022' is not one of ['apple,agx-g14c', 'apple,agx-g14d']
   	'apple,agx-g13s' was expected
   	'apple,agx-g14s' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/gpu@406400000:=
 failed to match any schema with compatible: ['apple,agx-t6022', 'apple,agx=
-g14x', 'apple,agx-g14d', 'apple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/gpu@406400000:=
 failed to match any schema with compatible: ['apple,agx-t6022', 'apple,agx=
-g14x', 'apple,agx-g14d', 'apple,agx-g14s']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pcie@580000000 (apple,t6020-p=
cie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@290280000 (a=
pple,t6020-pmgr): power-controller@4000: 'apple,force-disable' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@4000 (apple,=
t6020-pmgr-pwrstate): 'apple,force-disable' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: efuse@29e2cc000 (apple,t6020-=
efuses): compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efu=
ses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/efuse@29e2cc00=
0: failed to match any schema with compatible: ['apple,t6020-efuses', 'appl=
e,efuses']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@702280000:=
 failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,t8=
103-dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@702280000:=
 failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,t8=
103-dwc3']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
