Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E6810F2
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769311026; cv=none; b=IfbOfCDE7RdD94QEUQ3up90ONkj0SgnLZX2ASFE4zJwWY18UzGK/q3XYXMshNs4WQtm0vCiByc8yl62h+2z42hfckb1X4NwcZAPErJpSykAihZuS6gL+anV67GTEALpGL2omofcCkEdwXAMpe0SKvUm4KYMrNFUhJluwBY5rBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769311026; c=relaxed/simple;
	bh=6dMr7kfqrvSfzGQ1c7l84mNRPl5ULDifN4PlfWTXdPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bheGFcPLQBY3pc45gccP4bIPr1fPJCOK5SnleeqiGkylYSh1mJk2cu9Fc+7ukhMiqoLTEwd330WovMM16mtYKaE8ZN8Zo/S9xC+1K5XhWdN1qg5SYbkkkGE9hCbn/S7kQHkrxwsD3z1e+xgF4BTHzmvgorI2uP+Ooc0ZuFs3egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksDk3JID; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksDk3JID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769311024; x=1800847024;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6dMr7kfqrvSfzGQ1c7l84mNRPl5ULDifN4PlfWTXdPQ=;
  b=ksDk3JIDjptusA7qQaY3VrKzyEbKA+E8j3hYIRDkPpvplCbAa4tKP8Xu
   Vs6YPnxdZsvNZHpfbDweG8JYmtKJS3/8dYLexdpbJmPjq2IhVBjI2zjQe
   3apX180LFNQRvnC40G3gnx3sxNaPb0rd/QyrA3l3ex29/AXhi0dpfF0oO
   Bn4QnPgwoIyDTVn6Z1vAorS7lMSygBUC2xRCX7A1wJqF58gDPS+vEc1Ix
   CEga4bsO3kFtOdvHqssnFqydLq0PXhaYk00G77EXocju7kn0m4So6DYC4
   HccKzNNxCo8L/YZXZd/n2V7Y327DLY34xoSpRHul7P8+i0lb0It3dfuR5
   w==;
X-CSE-ConnectionGUID: snUbGlyaRBSuDfNHLyhXLQ==
X-CSE-MsgGUID: asINcFTsRwSmTGPPDPrT9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="95981845"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="95981845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 19:17:03 -0800
X-CSE-ConnectionGUID: wukzWQSjRD65OtKMQDk72Q==
X-CSE-MsgGUID: vWahPDXgT6mSdb2G8jG4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207428556"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Jan 2026 19:17:02 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjqcV-0000000017Z-3e9G;
	Sun, 25 Jan 2026 03:16:59 +0000
Date: Sun, 25 Jan 2026 04:16:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pxa1908-mainline:pxa1908/master 14/15]
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb:
 /soc/axi@d4200000/mmc@80800/bluetooth@2: failed to match any schema with
 compatible: ['marvell,sd8777-bt']
Message-ID: <202601250451.l8zivbVP-lkp@intel.com>
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
commit: 0ff9b53eb7f714dcd850d558b4b007352df08d7a [14/15] DONOTMERGE: Bring =
back bt caldata
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-2051-20260124 (https://download.01.org/0day-ci/arc=
hive/20260125/202601250451.l8zivbVP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601250451.l8zivbVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250451.l8zivbVP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts:24.29=
-32.5: Warning (unit_address_vs_reg): /chosen/framebuffer@17177000: node ha=
s a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: /soc=
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
