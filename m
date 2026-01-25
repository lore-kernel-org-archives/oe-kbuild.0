Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050A205E3B
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 06:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769323508; cv=none; b=lczDpvi5tK323Viox0Ebg70kxB5po3tKYbh2FdigmnQqgiCkPZvkFCHcAW8d0L/edK47A/pBCk/y2sOTBtfWIAfJbSKffmG24DB6Cm6gol3pymBzdrZ76wIwy2fD06sUpzDNy1KstWLW3HcowZzDS/X2J/QkW/B4QQgr9+Csyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769323508; c=relaxed/simple;
	bh=gRK6TB4itdzFe6ZESQS8rbQ8ysf6OSJ6Vx+Ik4CzCgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EkXKO8xxdeX+Gj15DPY7LIgspbJ6ARUlL8k2TYZONEBQ2aruHPG4D8BJ15U4AY+Pq0BPFWQYXXWXYDGrCyWgzGo0V6j5oxeSe5x+tfickCEvufFewgOA0uq5Vd6h4SR4aCa5qC24ASVP3Ove5FK/GJqh8rQX+q1SQBzp8l15sV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNRGX56i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNRGX56i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769323506; x=1800859506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gRK6TB4itdzFe6ZESQS8rbQ8ysf6OSJ6Vx+Ik4CzCgU=;
  b=FNRGX56icIU/q2kA7GIiOUMyu69+e0Wz32s2YbDYC1RqQ6sbCdWAtNdR
   5/0NIMrGlZyJvGSqHPFjrZ3dMib6JDR8bHO/AU0bbqO0NaXmjlPI3nWb7
   P1Ke/xTUNPrSnoJYKmRdpjdm3JOwZUNNawpLs6hXDIanJ4lll+Do8tpzH
   oP0amNMp9A523/vl9OrITSJ3PraSG63uTt8lrFV0USBHD1WZ0NYQtYDyK
   3xdi79i34/i8cCaB2L9ewaXHXUFX+wf0e8TkxoCtwtBj/HEIwlZueq2QF
   DmO2KYSA9/YVt0IaGRtiqHdZKHsyc1BWGLDfrnRwPIIU+eu2K1ChGuUdA
   w==;
X-CSE-ConnectionGUID: XDDrsosCSzmiObo5SStsKQ==
X-CSE-MsgGUID: ME8AO4FwQf2/6u01fJv2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69545583"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69545583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 22:45:05 -0800
X-CSE-ConnectionGUID: 80Sj8ZnhQgmu9CVI69GwUw==
X-CSE-MsgGUID: Jr4e4AHvR4mxQptGBjsYhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211900273"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Jan 2026 22:45:04 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjtrp-0000000019h-49zA;
	Sun, 25 Jan 2026 06:45:01 +0000
Date: Sun, 25 Jan 2026 07:44:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pxa1908-mainline:pxa1908/master 15/15]
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: wifi@1
 (marvell,sd8777): marvell,caldata-txpwrlimit-2g: [1, 0, 13, 0, 92, 20, 0, 64,
 190, 13, 0, 0, 0, 64, 51, 0, 32, 0, 108, 6, 1, 0, 0, 17, 0, 16, 1, 1, 1, 69,
 1, 1, 129, 2, 0, 1, 129, ...
Message-ID: <202601250727.suKGUBVb-lkp@intel.com>
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
TO: "Duje Mihanovi=C4=87" <duje@dujemihanovic.xyz>

tree:   https://gitlab.com/pxa1908-mainline/linux pxa1908/master
head:   74b88f5cc1e571d61ad7e914990a995def7b4d66
commit: 74b88f5cc1e571d61ad7e914990a995def7b4d66 [15/15] DONOTMERGE: Add wi=
fi caldata
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-2051-20260124 (https://download.01.org/0day-ci/arc=
hive/20260125/202601250727.suKGUBVb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601250727.suKGUBVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250727.suKGUBVb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts:24.29=
-32.5: Warning (unit_address_vs_reg): /chosen/framebuffer@17177000: node ha=
s a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: wifi=
@1 (marvell,sd8777): marvell,caldata-txpwrlimit-2g: [1, 0, 13, 0, 92, 20, 0=
, 64, 190, 13, 0, 0, 0, 64, 51, 0, 32, 0, 108, 6, 1, 0, 0, 17, 0, 16, 1, 1,=
 1, 69, 1, 1, 129, 2, 0, 1, 129, 129, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1=
4, 1, 11, 125, 1, 0, 7, 43, 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 14=
3, 31, 0, 0, 0, 84, 3, 0, 0, 0, 253, 253, 253, 253, 253, 253, 253, 253, 0, =
28, 1, 55, 255, 255, 255, 255, 2, 4, 127, 1, 206, 186, 0, 0, 0, 45, 198, 19=
2, 0, 0, 0, 0, 0, 240, 0, 0] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml
   arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: /soc=
/axi@d4200000/mmc@80800/bluetooth@2: failed to match any schema with compat=
ible: ['marvell,sd8777-bt']
   arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: cloc=
k-controller@82800 (marvell,pxa1908-apmu): 'reg-names' does not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/marvell,pxa1908.ya=
ml
   arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: cloc=
k-controller@82800 (marvell,pxa1908-apmu): reg: [[534528, 1024], [535552, 1=
024]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/marvell,pxa1908.ya=
ml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
