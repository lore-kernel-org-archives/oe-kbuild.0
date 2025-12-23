Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33E349B0B
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766516431; cv=none; b=YlLO1Q4Vom9oLjpGXBJiaLEZUweqB7jkypZIAyuto6zdfm6bq5gxg2fprl28perAalVRZkzUAn99jPeKU8waI2WVe/g/5QFN6uzfEo+HfPXw3Z7n6psq2fgAlFjPP+AlBfj/m27ZFWH+MbhxQcJgVBs0PazkYzI6YD1U0g7z16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766516431; c=relaxed/simple;
	bh=8Q5fBZ6OCbz6x5g5Ek+0ffqaRYRJaUrMo8bw436uJjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hSFysNFxTI98B0ObtkqPWYE0TE2vT3Qphlaf5GDBNncPge6pcggeFDyGsuPhHYxY0gcJsAdvBeVDxQoCtu8hAvMpVGIFNpmXSExlyi/LeoS9WobPxmgtr4CCGA193g1gHtJVEIkunDUNbps3aVM1T12W7w4IUGIpnMJbnDaQ1Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtxX/VOL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtxX/VOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766516421; x=1798052421;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8Q5fBZ6OCbz6x5g5Ek+0ffqaRYRJaUrMo8bw436uJjk=;
  b=MtxX/VOLftH3Fs2V4f8RIJSGbq6OSKfYuDBTzlU54Vndu48UNtRRObs+
   7D1JFuiZ+xIodUP0ME1S9Id28Lr7+6qGiRi3YfhwO/RS9XHG+rhzFojuv
   YZXpozGBjKGr23lzbLGdxGYGQVy0KLacD6z9vlakt1G+FdJd0HDU3mVRu
   e0amx6r9sh2ozGKz936PKFe2VM0fwGK4Y8vt+Q2lvAv23crgIqi64YAgb
   i9skZnI+rBEAWwk6ghL5P0+oeJI97OK3cMYeW/t+WOM/RXhslOLpJwMdR
   bFM0iaQO/wb4GEIzMVYieoWljugAeilhCmXaUZ+v7tETkqUIK7Hq21GRk
   w==;
X-CSE-ConnectionGUID: jtXxd2dXQY2DihpuYqHqrw==
X-CSE-MsgGUID: TUcPIgB6Q6ShYMM8bm77DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68410921"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68410921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 11:00:20 -0800
X-CSE-ConnectionGUID: h6rFWeHFRGSQL8zWonQ9Cw==
X-CSE-MsgGUID: 3q2KmPWfQW+BRVloA57yXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="237250330"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Dec 2025 11:00:19 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY7cG-000000002HZ-2PcC;
	Tue, 23 Dec 2025 19:00:16 +0000
Date: Wed, 24 Dec 2025 02:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 =?us-ascii?Q?[broonie-ci:20251217=5Fyung=5Fchuan=5Fliao=5Fasoc=5Fint?=
 =?us-ascii?Q?el=5Fadd=5Fsupport=5Ffor=5Ftas2563=5Famplifier?= 19/19]
 sound/soc/intel/boards/sof_ti_common.c:75:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512240217.VxwEokjh-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem:=
 sound/soc/intel/boards/sof_ti_common.c:75:1: sparse: sparse: bad integer c=
onstant expression"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Lin <david.lin@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "P=C3=A9ter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

Hi David,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 2025=
1217_yung_chuan_liao_asoc_intel_add_support_for_tas2563_amplifier
head:   02e7af5b6423d2dbf82f852572f2fa8c00aafb19
commit: 02e7af5b6423d2dbf82f852572f2fa8c00aafb19 [19/19] ASoC: Intel: sof_r=
t5682: add tas2563 speaker amp support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-063-20251223 (https://download.01.org/0day-ci/archi=
ve/20251224/202512240217.VxwEokjh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251224/202512240217.VxwEokjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240217.VxwEokjh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/intel/boards/sof_ti_common.c:75:1: sparse: sparse: bad integer=
 constant expression
   sound/soc/intel/boards/sof_ti_common.c:75:1: sparse: sparse: static asse=
rtion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   sound/soc/intel/boards/sof_ti_common.c:76:1: sparse: sparse: bad integer=
 constant expression
   sound/soc/intel/boards/sof_ti_common.c:76:1: sparse: sparse: static asse=
rtion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   sound/soc/intel/boards/sof_ti_common.c:76:1: sparse: sparse: bad integer=
 constant expression
   sound/soc/intel/boards/sof_ti_common.c:76:1: sparse: sparse: static asse=
rtion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +75 sound/soc/intel/boards/sof_ti_common.c

331786db1b464f David Lin 2025-12-17  74 =20
331786db1b464f David Lin 2025-12-17 @75  MODULE_DESCRIPTION("ASoC Intel SOF=
 Texas Instruments helpers");

:::::: The code at line 75 was first introduced by commit
:::::: 331786db1b464fae42c36f53d6901d1d54975e04 ASoC: Intel: ti-common: sup=
port tas2563 amplifier

:::::: TO: David Lin <david.lin@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
