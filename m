Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872986329
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376265; cv=none; b=C4QiUOWwMQX8kIkvV9itbxTt+2uu5/b3f2jMCoZNOwb558ZVeLAH5eeocodUwE5iBkpSDVb8PWp02y9cwtvp6MpsSmOPXqEKQwIBQZzZNYs1B//84vEM8GEKPpukzLqN4Hk3xARbAjLl+TQ03XdJefdO5GFWUd7akar7fFOrX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376265; c=relaxed/simple;
	bh=TrkmyswClTqYQFGZHrOForgxmtZ53xlTwM5Cb3hXcsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sRO3GKv2BfxtvdvEe0MqeOdUzSVknXwoVDT4KWYeYHrnwx2XZx3kStDfHYBJ3Sul489Z089lbXYqoGNVD7V0zBU+Fc9ltcyJ9L4c9cuCI/RD0Ceg820Azup2m5SdmaUaQaGUqSR1/2MtjlAeNx39ptBpLiVLzKLzRX4Ciy5lmQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irbeOF97; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irbeOF97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779376262; x=1810912262;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TrkmyswClTqYQFGZHrOForgxmtZ53xlTwM5Cb3hXcsk=;
  b=irbeOF97mrKX2FBoDmZ9W+O0QXe3bMTsdJqtZ97PjbQEFhdp8BrDYxuv
   i9GJmOQJeDEKTyx7wwl6f6m08JMEu2x+MmaIuTrNdujFnVygHK6kxBt3P
   q7KFr4BPSNoDp7QNjnyA3s1B5FcICGkCBEu2oc/zrwzfKxRLuS2hta4px
   K+cwSnGcbmJZT6K0iCBMZqbbPRiZFtGTbQy8sk/I3oXI2+ixc5uGGcj0x
   R6KsuTR79Y8/F5AIHxoejdQP5DwOc/oazikXDhZ/8ghrXxcSawFbRps0v
   5QWQ2uWOEDTIDFlLEkP5Htsmq33whTLsvar46z43RTNw997yX1llSc9g9
   A==;
X-CSE-ConnectionGUID: wFupryMOSrym4HB1H0YYdQ==
X-CSE-MsgGUID: dum/zlbMRKemDo4QxW62Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="84180868"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="84180868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:11:02 -0700
X-CSE-ConnectionGUID: UPWB5wTYT/ip1ElpxGLbxQ==
X-CSE-MsgGUID: 1jh7qyuaTY29UKE2bvLdAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="245539549"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2026 08:11:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ534-00000000Auz-1bpw;
	Thu, 21 May 2026 15:10:58 +0000
Date: Thu, 21 May 2026 17:10:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 16/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605211720.gYz15li3-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povi=C5=A1er" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>
CC: James Calligeros <jcalligeros99@gmail.com>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 65be0b47cf3b0675cc18937ff54215c666545df7 [16/114] arm64: dts: apple=
: t600x-jxxx: Put in audio nodes
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/arc=
hive/20260521/202605211720.gYz15li3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260521/202605211720.gYz15li3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605211720.gYz15li3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:496.14-510.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:512.14-521.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@290 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@298 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@2a0 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:496.14-510.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:512.14-521.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@290 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@298 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@2a0 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:496.14-510.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:512.14-521.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@290 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@298 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@2a0 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:496.14-510.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:512.14-521.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@290 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@298 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@2a0 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:388.14-397.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or range=
s property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:399.14-408.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or range=
s property
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@290 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@298 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@2a0 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j375-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j375-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:388.14-397.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or range=
s property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:399.14-408.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or range=
s property
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@288 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@290 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@298 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@2a0 (apple,t=
6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j375-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /sound: failed to match any s=
chema with compatible: ['apple,j375-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:388.14-397.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or range=
s property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:399.14-408.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or range=
s property
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:388.14-397.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or range=
s property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:399.14-408.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or range=
s property
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:388.14-397.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or range=
s property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:399.14-408.5: Warning (unit_ad=
dress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or range=
s property
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
