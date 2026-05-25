Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78102221FC6
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 03:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779680120; cv=none; b=Rwvtm5bXcTwQWtIr9jlMkmKyp1xeNQA9WIaxO9TAdN7Z5rkGan5pNhrelCtsZpnzc2rCRbnTO+RTbm/j1SoPXZGQnMqnHIGPwSpnDZuM18mRePxAulkeAdMwFYF4Q9abOV5tH1VDBr3dJnR24fG8gWoS64C2a/KovbpyYgPGm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779680120; c=relaxed/simple;
	bh=8KmOaJydrxxODFCeBg8iU1uY8xYcjZwIBJmM5H8lqOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RMN0Ne2y6WWLS5YTwdkUWimBvYiw+FCqHtl7xmeQM668X64ij2U97bs3cDFbGEehR6k9x6hsuUXWYDEN4tL6P1AHIyG2QBFNxJxI1llsAz6yOgcmRM03slOyOaP98vsE4bcJNoypsphOxMmc2uw384o+TcAuyU+feJEJcV79be0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c243rBin; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c243rBin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779680115; x=1811216115;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8KmOaJydrxxODFCeBg8iU1uY8xYcjZwIBJmM5H8lqOE=;
  b=c243rBinbpiq1LRBHBLHpG4JDlSTPebW+H4s3x2REmBvGWNh6x6jkmi3
   QMVfw4QFQKwfGjUmeRIgjAazTxewjzOf1ZTmLTOy/PzJ/V7sCHFXUvCaS
   crwROZZrUOUu4jdbbS2asnbGDUEDizv5sodPdDF0uN5FuBsbhodcJOpYO
   wSBYu3Bv49CueixVAxN+xtZv4wtq/LMI8V+7fLj+Xh7cOpR/aAqtiTgf+
   rKprDzOPFfHTjc8GUwES3NdT/YYmhGsqf0GBKoCHZiPlv2yRshOe+xVG5
   Fww6D8zCjih46RzlHSJgKnXGhFL7c376aCrAWfwzPVXZwzHOkoXrmYM2u
   g==;
X-CSE-ConnectionGUID: 5HTfCJgqRhOYJDki/wtFRg==
X-CSE-MsgGUID: /Kd5sdVwRgyDWcc3RuLixA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80534530"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80534530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 20:35:15 -0700
X-CSE-ConnectionGUID: hnyebb6nQJyLP0Tx8wT74Q==
X-CSE-MsgGUID: jPrimq5BSNWYCzSHd0V9aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="265323465"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2026 20:35:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRM5v-00000000C77-2uCm;
	Mon, 25 May 2026 03:35:11 +0000
Date: Mon, 25 May 2026 05:34:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 16/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605250514.mqYScubb-lkp@intel.com>
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
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/arc=
hive/20260525/202605250514.mqYScubb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260525/202605250514.mqYScubb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605250514.mqYScubb-lkp@intel.com/

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
