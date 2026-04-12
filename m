Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8354763
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775981493; cv=none; b=YnsrTcgHAhGtnvHxHS/rnj1QI32aOO15SOTXyA2taWF2kW/R/hBhqC8PCDtbCg8S2aLVs/1+D4Fr6Bu9sbfBzIdGdpgEbKc++Wa4mGt/gUSh0sI9jjqhmWqOht+LcGfW3HvkQx5vt5gFhN0MQswJhBLiC5orwjFS9R4No4ci2QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775981493; c=relaxed/simple;
	bh=Otux6mw43FPEfazVWuEHqAuJ2VJjJxbDyAoS5zupQgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JTLZ32F2PMQBdAbQB3HWnSHa+idKS8j6etkusg/2GmSHc/vXFgT2J9aO4ibSeDmlkd30t6hQCBNxKC+icXSoX3wT45SHMxQxOvWqLVrQwR4lK3a05/SgyqmCzS5UDS25wVyutDMQ+vox1cnvjDTuntvYY24JDXjrW2eTNF+8ibU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8MWWhA5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8MWWhA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775981492; x=1807517492;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Otux6mw43FPEfazVWuEHqAuJ2VJjJxbDyAoS5zupQgg=;
  b=K8MWWhA51FvguKfcLYUiJI5APJNb4p5PDy3lQeNAxG+eRaC95lbsge9d
   uuLE9D+9/kHVKtJfKqKh9nYlDdLZfossf2viydLRYnnuPRrR1AP/Jc9jY
   ImFFiFd3vtYFiab7BgROMOlLE3b4npUbW7SgVYO5gy2Bw0eNGZLY/2nh/
   oSV7Cty7MECPWPLMn9Xa/yeM7astPZciXzL0fS+quSzF411gKBG89yBfJ
   gi/qtiGddbsNbbm+aRYKLTe1uXKYytQuvxvPkKCKuUImk6M17otIqj+QF
   Pj/cMEhknLXPXiWU5FIk7hOcCPu/ZPpdyPtkwkJWiinyyngBVJr5cMOgl
   w==;
X-CSE-ConnectionGUID: zJeqzKHbSReVP/drANNm8w==
X-CSE-MsgGUID: s+jhV98uRZO0aaOO7a6lLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76830903"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="76830903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 01:11:31 -0700
X-CSE-ConnectionGUID: kFizsfhmT0KY8gdrYA6WJQ==
X-CSE-MsgGUID: d5gpOVKzQ3uvYPnfLil82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="234486867"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2026 01:11:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBpuh-00000000BHB-3kYS;
	Sun, 12 Apr 2026 08:11:27 +0000
Date: Sun, 12 Apr 2026 10:10:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /
 (facebook,anacapa-bmc-evt2): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202604121036.oU51tz1K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Colin Huang <u8813345@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Colin-Huang/dt-bindi=
ngs-arm-aspeed-add-Anacapa-EVT1-EVT2-board/20260411-131434
head:   b5db052c85fb9271df99374776b7c9019fac313c
commit: b5db052c85fb9271df99374776b7c9019fac313c ARM: dts: aspeed: anacapa:=
 add EVT2 devicetree and update wrapper
date:   27 hours ago
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-2051-20260411 (https://download.01.org/0day-ci/archi=
ve/20260412/202604121036.oU51tz1K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260412/202604121036.oU51tz1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604121036.oU51tz1K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: / (facebook,an=
acapa-bmc-evt2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['facebook,anacapa-bmc-evt2', 'facebook,anacapa-bmc', 'aspeed,ast2600']=
 is too long
   	'facebook,anacapa-bmc-evt2' is not one of ['delta,ahe50dc-bmc', 'facebo=
ok,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'micros=
oft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc=
']
   	'facebook,anacapa-bmc-evt2' is not one of ['amd,daytonax-bmc', 'amd,eth=
anolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,altrad8-bmc'=
, 'asrock,ast2500-paul-ipmi-card', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4=
i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-b=
mc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'f=
acebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'fa=
cebook,wedge400-bmc', 'facebook,wedge400-data64-bmc', 'hxt,stardragon4800-r=
ep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift=
-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', =
'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'invente=
c,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptun=
e-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bm=
c', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,v=
egman-rx20-bmc', 'yadro,vegman-sx20-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	'aspeed,ast2600' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
