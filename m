Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D130BB80
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 19:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652754; cv=none; b=rYLI9GRUbEhvClM2xFZqgERM4i/AlRY+dmpWg7VK/sHdzRbPF6iUVtOa6AirpRsWyNneHogKeR/iPtG5p9+Ug7f+m1EaoFNpgLYE6L4QMH1va2WnxJVTXotovFwylpcutnc86/Jj2evBhU3b6K2u2SW7n2qFMIma79c5XhCRgtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652754; c=relaxed/simple;
	bh=Fin9DXVBVtpgCdv8KGv8CCH1RP3+6GgxmkTX9/TQEY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VAZBt/rvxugLKiK1P/dUZT6P3RjnxA3u8T7hoht42bkWikZAh71j+wg4N2dRkdWVFYKEK5AAw3dxPnErGuDcJY6ltCeA8QzPcmzUqz8j1lsr8+FL3ozVnKG/NPuM1G73kLZEskqxm8N6RIYZaUikIZdJXPDLDjASNWpnrW8wfLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USwqpnt5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USwqpnt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779652752; x=1811188752;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fin9DXVBVtpgCdv8KGv8CCH1RP3+6GgxmkTX9/TQEY8=;
  b=USwqpnt5+8bogMhOY/5zFg+m4ECJTCql9JEQIe26JLY/atLl6vJ5Mt0D
   BGZI8/EIW6Y1CLWbMT/m3YK6TwDUpovqysuGmMswPm97januLkOs6Bu9d
   Mit3mDQCR7oFHDhavwR1/KORDbvJu2JbByOf7pmKPBnOnyVZoMCf5WcQO
   CorhbKXD8tjtt67OXFMtE3STUw7LJ15ZVTEwh6C+u7y+ZtPLVa+2f+gLM
   2NnLXVebcw/7g6KvRzo/F6h4owI4G4fS3K9QM3VUtIew5tbEg7/w02YVX
   jUbtyjYILqLpGKru6dVI84/8NNLvVni1kNLEmtcRUJqS2OvpLJRGdqXXj
   g==;
X-CSE-ConnectionGUID: iqy6Du2bR9OIfJpqETpoJg==
X-CSE-MsgGUID: ClhtLQauRbmcd+VoT24zzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="103165395"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="103165395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 12:59:11 -0700
X-CSE-ConnectionGUID: sJocfNenQcO/qQkA/9ODYQ==
X-CSE-MsgGUID: s/JrP9rKRqeAxilRaJjDyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="236992741"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2026 12:59:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wREyZ-00000000C2j-1nzC;
	Sun, 24 May 2026 19:59:07 +0000
Date: Sun, 24 May 2026 21:58:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 15/114]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible:
 ['ti,tas5770l', 'ti,tas2770'] is too long
Message-ID: <202605242139.UdYRYjcT-lkp@intel.com>
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
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/arc=
hive/20260524/202605242139.UdYRYjcT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260524/202605242139.UdYRYjcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605242139.UdYRYjcT-lkp@intel.com/

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
