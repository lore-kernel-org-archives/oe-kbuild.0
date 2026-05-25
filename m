Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC993955F4
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740845; cv=none; b=ECfMdkqRbNXN+4bMHKNORUUQ98iLgDawrKb8zd7ukqnMzxQJb0lMqakNx75f+E4QT+bj+HUlJozqx4cU15c+3rtJqiA7HOtG9Vdsm5oboGZf3VcN34p0p8tzEkGV9AIHvb9Lb/sbRcRW6V2xtplE9AOsE6t7olcvNFwyz/CmJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740845; c=relaxed/simple;
	bh=z+EfKV2Y5R2rh847fqEuWISjo3vhcUxJmhb5EAIkeyA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qmDaLnNFwVet9gaaAbEoeB7LFBsugPtuSjeaynHHfA/+fTwKqExPIHCeV36IEHQX8ZLw/Vb3FMhw2N13wJg8QPRYX7sDKZPY7kzshZDRtQiW/EFOplJtQ89qczXzpnbTXm2atsSr/Hb+n/PSaImIg270AGrfMG1aZVQliL6m/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQ0qGNz5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQ0qGNz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779740843; x=1811276843;
  h=date:from:to:cc:subject:message-id;
  bh=z+EfKV2Y5R2rh847fqEuWISjo3vhcUxJmhb5EAIkeyA=;
  b=XQ0qGNz5oRRTls0UiQu3m7vo/9ecAHQnLxl2q9FQlJ53OoNYQUQ69+HM
   4LcxsuuDghsg2GRNZlU6dDHA2nDzrsNJN1byMRjN5CXGBteNaMPO0sqck
   DrkZfbidZADfQzvpCNw6cdDRUW4hEUPF841pruH19HMPl5RKx5lN3LUDC
   CwHJNof0XaKYMoXlcHFaoDv6YFXVj1zyQGCgLbpZo8yxg1FxfBS4viUkA
   31tMxFjPBAqpIMBl7xDZUcdSpmaE8gbaEt2Xly5/3GJwdWiq2qqz0ssAJ
   OOd3W7TAaOImJKHhNim0J5KRoPZVZhxJ5rFrjBCTOuf1pLl7YGgv1r5Hd
   w==;
X-CSE-ConnectionGUID: 460JJveXRYCVkTFZj7B3dQ==
X-CSE-MsgGUID: DbDhR/pBSbSkl8MduZSNaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80286055"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80286055"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 13:27:23 -0700
X-CSE-ConnectionGUID: 4h6Bp9RpRtCrMV4MyA41XA==
X-CSE-MsgGUID: qgaabAB5QiSwfdp/PjC8Hg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 25 May 2026 13:27:21 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRbtP-00000000CFB-2RA2;
	Mon, 25 May 2026 20:27:19 +0000
Date: Mon, 25 May 2026 22:26:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 1/114]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605252218.Wf8QQ9eY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 6a9d24ffd63e1cc4a564c95b44ae532cef1c87c7 [1/114] arm64: dts: apple: t6022-j180d: Add audio nodes
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260525/202605252218.Wf8QQ9eY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605252218.Wf8QQ9eY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605252218.Wf8QQ9eY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6022-j180d.dts:569.14-585.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6022-j180d.dts:587.14-596.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /sound: failed to match any schema with compatible: ['apple,j180-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /sound: failed to match any schema with compatible: ['apple,j180-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
