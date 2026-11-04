Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791842;
	b=kohyn1Ll0k5QeFLD3hurQyi+VZz1MFXSSKxMT20lJLaoWWBT/9QZpcKmaX8eB/jzTnM5
	 SePqP18JRDIhbIM+SVK40TyAQ1UY7PdWzkmc04EAhocfbOLNvCcnlj+ET3fW6HLbrPnfm
	 esaDbPPTp+NGCQA9Qajx7nVLrWyCm7Q1UEOQG8apfY82g/uvmE9ALv1ggd4vpsiaEZQSg
	 f9sIlDT2ut1X4ANxa3LHpltN+BlNMWkvDBOkbxN/jwj3Jy4HPcVTfn+CjWG04NY6K+/D6
	 RhguOP15nARG8Q/Z5gHhDiJlP9iBFGGm2z4AWseTMPrIaGkUQln8Vd5nttj5r49QQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791842;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YPH+tU8OwURsSlQaQgflhF++tkyICAgCh7CX+AuSP/U=;
	b=SLYKX4Fk/3N2USD2CxuVVmdquWNYQCH4eCeyjCIGvPX28Od6PDHF+/QvhE2NDVyWrc5d
	 46Q9twt67UMDApTohlf1HQWtKjASVMveOHJ2opNHcIyt+8EeMHJiRWzovxzSNXUbwwleD
	 jdOXcutG3e1sOLz2vufWj9qt4LkauriI63BJ4kBkkHJ0djF7ouXT0MKQv5QYH+LoMx4Ha
	 3x8pTCyNw4JVCbzINapP6X+d09Xhv1mueuXtxjbrPurMJi5hPYbERdwu4PBG+FeF2KvqJ
	 t6U0n4U+uHxai+q/cGA0LvEsuXLgSm9cVlcVPhnGD8jOdB9EAxJATUHGRfalbGnN1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMC4Zfyz;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B082606A326
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B082606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMC4Zfyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793791840; x=1825327840;
  h=date:from:to:cc:subject:message-id;
  bh=ddkhjYcD2UQdeOB92Cxz0bQDJxD1/jwzkyhXkdRjGXE=;
  b=XMC4ZfyzAEYpA911RzBJxLjnVSuuksWBmExntdfTeYw/E0g+ho7B2aYU
   ZFQBQF8oV3HiEX8d53o1hXSNaqrRezY5pj5ERf7aY3q00SRbfIjvIsTOc
   LJ89GxE50ZoRAcitzzP+p4ONu+/w8dNzqvRDwj2i8rNIWo1Fh/vqFH+o6
   NjnYyO5tyejAB2iOl8cWgtpUHv+eufRcOGaAZlDPjYTnl4xOFKZ9pDHHz
   k4dpAE9n8UtVDKcW6yq7UGwS9fA03jiNpLl102yipnjKVlMaAqUBdvVas
   Deey0LKn5/6txl6H2ibr2fkZ6AxLAicI+KfJHwZb/+tdNCodIYhGN+m/x
   g==;
X-CSE-ConnectionGUID: OLrMzTDrQReffkczdYoVTw==
X-CSE-MsgGUID: nbHAn/PQR/2EaVIBTvwmlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2570137"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2570137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 03:30:39 -0800
X-CSE-ConnectionGUID: kZ6ODtYFTNaW8EqPiHApcg==
X-CSE-MsgGUID: icBwOSFgQV6uCLcPkrzLfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6516857"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 03:30:39 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOZCO-0000000099D-0MXM;
	Wed, 04 Nov 2026 11:30:36 +0000
Date: Wed, 04 Nov 2026 12:29:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 24/36]
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed
 ('audio-routing', 'widgets' were unexpected)
Message-ID: <202611041238.5krzI9nF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: c790c92683a4515ea55fcbdab4ba6e59551b6f21 [24/36] arm64: dts: allwinner: t527: orangepi-4a: Enable audio codec
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261104/202611041238.5krzI9nF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041238.5krzI9nF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611041238.5krzI9nF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed ('audio-routing', 'widgets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
