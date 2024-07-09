Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE040855
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492141; cv=none; b=fmkbcbagRzEIDOm7+ZKzQSko0mzltnC+7YyTpgj7t++AxMpU7uF2RVogVKiio+J2BkY5/ChrM7FYub6y2/FvEONXxRybt1qTXQ5dUrV/v+AmpT8RGS8WI0JdqToIn0/YsR6Z5mY7+2vyNBgb1luss64LFzhhCty2XoDTozDk+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492141; c=relaxed/simple;
	bh=1sxaWi3pnZP9bbqa0ER7Hj7/I4DKgwVEWnOjOP5aHNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSNZGXh40XzSyuXd+r3XiaOskQ8pB1HNUqTcrvvk1DipGbRqvNx0ZSFuf05wNv3b57LNXAj+gO7z0nuR9AVZh55p+kze8x3s5y+izeoNk0BQ+1BvBK60lz7ay2KnZhcp0s4lvZGsKgj+a8qefrHe/lMlDwUQ5G0EKYD3zmxNHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LssjeNpI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LssjeNpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720492138; x=1752028138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1sxaWi3pnZP9bbqa0ER7Hj7/I4DKgwVEWnOjOP5aHNQ=;
  b=LssjeNpIDijThPaMQfY69uy27tfpfh3qYuTVrdR1puGHm5PvWn1BU5z0
   /ijVV4ki4m87dwln8UCy58L5R0E12QbpufbD/Qf31MjoPoUZYrPMtr1S1
   JaVrc4NtXWBkn85fz74P8ohOz13RsmYQUaUn9HuRCgEm7u/VpVvcMCt7G
   Bl3Y6XEKrDb54Tc+8Of+60nnLGhulyjXUphXER04FHJPKUpVF+muYQa/B
   c9a1SujQ/wquP0/k6wvMHsQv5aF7h5hRx2p/+bf0nrEaL5rnDzvV/MyBf
   OWaVhqb+eC6QTqZ2/ctZ0hgZG4F+53HftI8E1f/VI92L4DQoC4M7noCG4
   g==;
X-CSE-ConnectionGUID: pUiC37pUSSaXXBqIKCNong==
X-CSE-MsgGUID: E5pRVgiASu63To/IYwbsmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28390431"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="28390431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 19:28:57 -0700
X-CSE-ConnectionGUID: FhG46MezTxy3ru2my07LJg==
X-CSE-MsgGUID: dKg88kLAQpCvdxs+T6/PRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="52883719"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2024 19:28:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR0b8-000WFS-0L;
	Tue, 09 Jul 2024 02:28:54 +0000
Date: Tue, 9 Jul 2024 10:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-6.1.y-cip 38/44]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated
 properties are not allowed ('gpios' was unexpected)
Message-ID: <202407091011.Dw1ju2PB-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: 9d64838c5957d823f961e9a4427b304559e862ad [38/44] arm64: dts: renesas: Add initial device tree for RZ/G3S SMARC EVK board
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407091011.Dw1ju2PB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091011.Dw1ju2PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091011.Dw1ju2PB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /: memory@48000000: 'device-type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /: memory@48000000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
