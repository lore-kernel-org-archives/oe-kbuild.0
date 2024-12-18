Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AEA1FA8CE
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734556772; cv=none; b=bPAm3eJwqQfKVL5na3wfYFI7kjq4ajHU0tJe0eNIlN02Ye0RsiFoQTkc9ODzR9BPfa4Hx60jsjXxA2trVHG0/4MfbkuO8PjH6ZA6z7V90AWpnvVHlcWlGX4kGcjWArE+ILMbMTHN8BN0fyt2LHlD+Wmi4XNkfTkpBH86LI2bfyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734556772; c=relaxed/simple;
	bh=w5ywM52pTXCejvPJMYBAX3c3WDU/NPH16nVnsI18b6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvUisJdtkJXjYtcda9BQOGQXBkVQfqTmnuqzuQuGDXJQaaisla5GbaN7d4nXZUSuq5oy+eJHjnMaKzVGbEfcXxsD5iCYNWLsebUuVQT8mh1Vq0oZyqHWdGYkuQfNJtDUh62484HmKrkP8+g8mycC7xKnSpaLOiMfpuK0qBO0Gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjbw3+Vl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjbw3+Vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734556770; x=1766092770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5ywM52pTXCejvPJMYBAX3c3WDU/NPH16nVnsI18b6E=;
  b=kjbw3+Vlgw1RjZR5SGy+Xbzm2TS6mvZRNPi0DxivDrrekdnQP/W6BsSy
   uHOVS/MF7yKSmMvYtbtlloUUya8zkhtbDukPp0PLIvOzU8MG4OyDBNRDy
   tfnYyzAF9VlnxlI61PNNrmkIxXD5LJaCZS5kVJBe3h0ZDa1OVkmNb4tqj
   YnZ2vS11DjfhzjMRGzS6Ct6BqxFUqlJoXOIHN/LHQ94EPg6xUSrxv13tZ
   7PyGWFJO+RvVYY1wmmv8xQi+nWUsnLwlzBTpCIiji8B2PHfkmy93iZ0gD
   kzjx1i+onDNFbXIcXGOG5ZesQRdskbAwCz5l+nzXFkRjkK5YfKk505KS4
   w==;
X-CSE-ConnectionGUID: 6CKqFVaSQTupyVnXTwsLhw==
X-CSE-MsgGUID: uvbEulgvQWyuJro2eC3vlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35208103"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="35208103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 13:19:29 -0800
X-CSE-ConnectionGUID: FoW4C5yCQQSzhMaSQt6o6Q==
X-CSE-MsgGUID: AImQGw53RrGUo82QgDdLWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102590721"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2024 13:19:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO1S1-000Gdm-2G;
	Wed, 18 Dec 2024 21:19:25 +0000
Date: Thu, 19 Dec 2024 05:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 66/187]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000:
 power-controller@4000: 'apple,force-disable' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202412190552.PBe55OqX-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   5553f8f1fe2a6f02eded3969869311b465aeb258
commit: 970d0a3b59bf083e2917989cb6d03f5cf0a674d8 [66/187] arm64: dts: apple: Add MTP nodes to t6020x
:::::: branch date: 9 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241219/202412190552.PBe55OqX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190552.PBe55OqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412190552.PBe55OqX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@418:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@420:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@428:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@c00:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4008:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4010:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4018:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4020:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@290280000: power-controller@4028:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@420: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@428: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@428: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@c00: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@c00: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@4000: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@4000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@4008: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@4008: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@4010: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@290280000/power-controller@4010: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@4018: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@418:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@420:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@428:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@c00:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4008:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4010:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4018:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4020:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@290280000: power-controller@4028:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@420: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@428: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@428: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@c00: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@c00: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@4000: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@4000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@4008: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@4008: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@4010: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@290280000/power-controller@4010: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@4018: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@418:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@420:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@428:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@c00:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4008:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4010:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4018:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4020:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@290280000: power-controller@4028:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@420: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@428: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@428: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@c00: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@c00: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@4000: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@4000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@4008: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@4008: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@4010: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@290280000/power-controller@4010: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@4018: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@418:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@420:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@428:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@c00:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4008:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4010:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4018:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4020:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@290280000: power-controller@4028:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@420: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@428: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@428: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@c00: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@c00: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@4000: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@4000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@4008: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@4008: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@4010: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@290280000/power-controller@4010: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@4018: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
