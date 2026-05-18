Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F82F39656E
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138010; cv=none; b=t70G0Bam6yWiemk5qUVKjByPQtA4A4eJTApny5mXNuCjEW9OtZw6hdSJZLofzYrVgnyCY+/KFPjaN7xipYAza5qqlAQR61R8pp4nXl03OIognSXOUWDJlw6INCCHemvDECEmbPST6HTuKRq2ICExQxFm3O00dtEP/pl685glM/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138010; c=relaxed/simple;
	bh=29/e7VJyCXBYZbDLc0v34Y0EOBmEYDMCPw9/BS8KDLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ESp2klv7pKOAU/giHnMaaUK/K3WDpycGjY9SjWr5qLLY5P7t6LtJS0iXbO31wBBFwj28eLK2vkNGde6EXVbu4pRLX1gMlx+X16S1OIkykz+2xZvpkn5UvquPrG6HEKyMumXBgIItLEG86mJnPY6+rsaKzzXieU4jbidswuxpnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gce8A5wx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gce8A5wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779138007; x=1810674007;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=29/e7VJyCXBYZbDLc0v34Y0EOBmEYDMCPw9/BS8KDLk=;
  b=gce8A5wxARo+BhakDA2pcPTUOdxUNokKXI748hRIQ61SE1dqTObOlfvY
   2ygbuJmJ29kGNeUVoJqsU2REeXR9XiwqxYB5HzO92sOn/m1RJPOGbnk12
   rO31+ld2PdoQiUWciFcPZpehUdk1958t4dpb7uf+bQisRrgwetIb4E0Ml
   j4t+BFlGGGBbhdcXSZOxl9PHsbSyUS5FuimPKmpCUB4h1PkvcbW/flyFk
   RMb1HzJjFTXk9icJF+FvwhrWNjDNOZ4M3maue64oPl8IfilIS6yBuwT2i
   bhnYUWsExSoj1WDThLuMRUe2GdrGhqXTYw+coZTbFJoclwAJIdIs3KLG5
   w==;
X-CSE-ConnectionGUID: QJD3GE4IRQaRQHj7BXK4eQ==
X-CSE-MsgGUID: /ZYMqXrLQT23mYweJ4vhPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91396970"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="91396970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:00:05 -0700
X-CSE-ConnectionGUID: gpzoscfHR620IRYMzlAxAQ==
X-CSE-MsgGUID: yC3R5PpaTIuqNak4OgLxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="233168800"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2026 14:00:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP54D-000000009vv-0mDR;
	Mon, 18 May 2026 21:00:01 +0000
Date: Mon, 18 May 2026 22:59:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 15/114]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible:
 ['ti,tas5770l', 'ti,tas2770'] is too long
Message-ID: <202605182213.warqnjsr-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 46d97c1a7e2446c329abd95a032a8ae1366f82da [15/114] arm64: dts: apple=
: t8103*: Put in audio nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/arc=
hive/20260518/202605182213.warqnjsr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260518/202605182213.warqnjsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605182213.warqnjsr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dts:106.14-115.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103-j274.dts:117.14-126.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Uneval=
uated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VA=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2c0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2c8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2d0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2d8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2e0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j293.dts:238.14-248.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103-j293.dts:250.14-259.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout=
-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VA=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@34 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@34 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@35 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@35 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout=
-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transpo=
rt@0: failed to match any schema with compatible: ['apple,spi-hid-transport=
']
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2e0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j313.dts:134.14-143.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103-j313.dts:145.14-154.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VA=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transpo=
rt@0: failed to match any schema with compatible: ['apple,spi-hid-transport=
']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2e0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j456.dts:110.14-119.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VA=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2e0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j457.dts:91.14-100.5: Warning (unit_addr=
ess_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges =
property
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VA=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (ap=
ple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d8 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2e0 (apple,t8=
103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstat=
e.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j457-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j457-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
