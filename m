Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250F1FC0EA
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602794; cv=none; b=EEHPE4W5OwdX0NH/gW2o4Sn7pVb7JcZxDTfCHXwWs+qpRrqjS5QFpJj9l/5SPJ7kZN4OpIQpCgizjBlh+bIorWSstmKyAakcLEMCcjpGNUdvunquuERlGusEOv/Y+zoDfoY0UINUSmMKIHF6rZdFqZJAm4GG/HfVLgyYoq+K+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602794; c=relaxed/simple;
	bh=DQlERbJScl3ryPSCsCpL5QInlwr7sO3rnJ3mco2L/Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BtVCaoZ+EM6tYfO445M7+fRdXwefGlbhzUB4HobrEY8DC2bpmMEWnuQ2Lk/fzRisUNpQgBmXJ2+EQBfN7BwEIuEFOxvVBstuVgVMiEb/YXbPUYDRRHDLLj3ch+sCe/WCt/BzJjkYbqJAijBFMGHHdXr3IWoe4teerKMMwLmkwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBU4/hiP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBU4/hiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783602793; x=1815138793;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DQlERbJScl3ryPSCsCpL5QInlwr7sO3rnJ3mco2L/Bk=;
  b=LBU4/hiPUd4mpOa6eTZmXDDLVRqX8jf3RFJJjc5oScK8I3Bys4xL41W5
   oA6BIc3ZRSyWDOUDjA53Dru+pvPyOZZSdG/GsOTzbLQ3eMgcEXQo9PVWd
   77CrvcS3Y2YqZdPWkNOYz3vid1yVcy7r27dfLS393IrvKaYK2y4QoSSAJ
   svsN/w+6+92to7X91v0VQj+qKB4+s1F3rL1DDwKsqMTpJk9atyehDUHG5
   OAeI1KicQVidfLNW9L5nAWcCuCIQ6tLqUDRg3UBcmtI+UbbyKyMtbhq4s
   BTRG1kgroLl7NGLSC8k6YKgNsYHuoZvsVzaou88yUF9IVkuw+s2GMxNRi
   w==;
X-CSE-ConnectionGUID: nila3HNdQamlE/SJpBDD1Q==
X-CSE-MsgGUID: Ad7qx95XRUGZwaYr42ZSxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101829704"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101829704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:13:12 -0700
X-CSE-ConnectionGUID: mWMnt6EtSqi1COEzntVUYw==
X-CSE-MsgGUID: VkPY4MYfQ16kc6BgxO/LIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251218063"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2026 06:13:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whoYu-00000000Hi7-3wiq;
	Thu, 09 Jul 2026 13:13:08 +0000
Date: Thu, 09 Jul 2026 21:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_reg_whitelist.c:107:1: sparse: sparse:
 directive in macro's argument list
Message-ID: <202607092102.YWo34Jv0-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/xe/xe_reg_whitelist.c:107:1: sparse: sparse: directive in macro's ar=
gument list"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Violet Monti <violet.monti@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: e23fafb8594ea886ee03e005cc32dfda24f417cf drm/xe/rtp: Add struct typ=
es for RTP tables
date:   8 days ago
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: um-randconfig-r132-20260709 (https://download.01.org/0day-ci/archiv=
e/20260709/202607092102.YWo34Jv0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260709/202607092102.YWo34Jv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e23fafb8594e ("drm/xe/rtp: Add struct types for RTP tables")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607092102.YWo34Jv0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_reg_whitelist.c:107:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:109:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:114:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:117:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:128:1: sparse: sparse: directive i=
n macro's argument list

vim +107 drivers/gpu/drm/xe/xe_reg_whitelist.c

b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   43 =20
e23fafb8594ea8 Gustavo Sousa             2026-06-01   44  static const stru=
ct xe_rtp_table_sr register_whitelist =3D XE_RTP_TABLE_SR(
dd08ebf6c3525a Matthew Brost             2023-03-30   45  	{ XE_RTP_NAME("W=
aAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
dd08ebf6c3525a Matthew Brost             2023-03-30   46  	  XE_RTP_RULES(G=
RAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
844c0700a675a5 Lucas De Marchi           2023-01-25   47  	  XE_RTP_ACTIONS=
(WHITELIST(PS_INVOCATION_COUNT,
dd08ebf6c3525a Matthew Brost             2023-03-30   48  				   RING_FORCE=
_TO_NONPRIV_ACCESS_RD |
844c0700a675a5 Lucas De Marchi           2023-01-25   49  				   RING_FORCE=
_TO_NONPRIV_RANGE_4))
dd08ebf6c3525a Matthew Brost             2023-03-30   50  	},
dd08ebf6c3525a Matthew Brost             2023-03-30   51  	{ XE_RTP_NAME("1=
508744258, 14012131227, 1808121037"),
dd08ebf6c3525a Matthew Brost             2023-03-30   52  	  XE_RTP_RULES(G=
RAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
d9b79ad275e7a9 Lucas De Marchi           2023-04-27   53  	  XE_RTP_ACTIONS=
(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
dd08ebf6c3525a Matthew Brost             2023-03-30   54  	},
dd08ebf6c3525a Matthew Brost             2023-03-30   55  	{ XE_RTP_NAME("1=
806527549"),
dd08ebf6c3525a Matthew Brost             2023-03-30   56  	  XE_RTP_RULES(G=
RAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
844c0700a675a5 Lucas De Marchi           2023-01-25   57  	  XE_RTP_ACTIONS=
(WHITELIST(HIZ_CHICKEN, 0))
dd08ebf6c3525a Matthew Brost             2023-03-30   58  	},
dd08ebf6c3525a Matthew Brost             2023-03-30   59  	{ XE_RTP_NAME("a=
llow_read_ctx_timestamp"),
dd08ebf6c3525a Matthew Brost             2023-03-30   60  	  XE_RTP_RULES(G=
RAPHICS_VERSION_RANGE(1200, 1260), FUNC(match_not_render)),
844c0700a675a5 Lucas De Marchi           2023-01-25   61  	  XE_RTP_ACTIONS=
(WHITELIST(RING_CTX_TIMESTAMP(0),
dd08ebf6c3525a Matthew Brost             2023-03-30   62  				RING_FORCE_TO=
_NONPRIV_ACCESS_RD,
844c0700a675a5 Lucas De Marchi           2023-01-25   63  				XE_RTP_ACTION=
_FLAG(ENGINE_BASE)))
dd08ebf6c3525a Matthew Brost             2023-03-30   64  	},
b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   65  	{ XE_RTP_NAME("a=
llow_read_queue_timestamp"),
b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   66  	  XE_RTP_RULES(G=
RAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multi_queue_class)),
b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   67  	  XE_RTP_ACTIONS=
(WHITELIST(RING_QUEUE_TIMESTAMP(0),
b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   68  				   RING_FORCE=
_TO_NONPRIV_ACCESS_RD,
b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   69  				   XE_RTP_ACT=
ION_FLAG(ENGINE_BASE)))
b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   70  	},
844c0700a675a5 Lucas De Marchi           2023-01-25   71  	{ XE_RTP_NAME("1=
6014440446"),
dd08ebf6c3525a Matthew Brost             2023-03-30   72  	  XE_RTP_RULES(P=
LATFORM(PVC)),
3512a78a3cefcd Lucas De Marchi           2023-04-27   73  	  XE_RTP_ACTIONS=
(WHITELIST(XE_REG(0x4400),
dd08ebf6c3525a Matthew Brost             2023-03-30   74  				   RING_FORCE=
_TO_NONPRIV_DENY |
844c0700a675a5 Lucas De Marchi           2023-01-25   75  				   RING_FORCE=
_TO_NONPRIV_RANGE_64),
3512a78a3cefcd Lucas De Marchi           2023-04-27   76  			 WHITELIST(XE_=
REG(0x4500),
dd08ebf6c3525a Matthew Brost             2023-03-30   77  				   RING_FORCE=
_TO_NONPRIV_DENY |
844c0700a675a5 Lucas De Marchi           2023-01-25   78  				   RING_FORCE=
_TO_NONPRIV_RANGE_64))
dd08ebf6c3525a Matthew Brost             2023-03-30   79  	},
25063811d9c1f3 Niranjana Vishwanathapura 2023-08-17   80  	{ XE_RTP_NAME("1=
6017236439"),
25063811d9c1f3 Niranjana Vishwanathapura 2023-08-17   81  	  XE_RTP_RULES(P=
LATFORM(PVC), ENGINE_CLASS(COPY)),
25063811d9c1f3 Niranjana Vishwanathapura 2023-08-17   82  	  XE_RTP_ACTIONS=
(WHITELIST(BCS_SWCTRL(0),
25063811d9c1f3 Niranjana Vishwanathapura 2023-08-17   83  				   RING_FORCE=
_TO_NONPRIV_DENY,
25063811d9c1f3 Niranjana Vishwanathapura 2023-08-17   84  				   XE_RTP_ACT=
ION_FLAG(ENGINE_BASE)))
25063811d9c1f3 Niranjana Vishwanathapura 2023-08-17   85  	},
570a8fc233b2ad Lucas De Marchi           2023-12-07   86  	{ XE_RTP_NAME("1=
6020183090"),
570a8fc233b2ad Lucas De Marchi           2023-12-07   87  	  XE_RTP_RULES(G=
RAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
570a8fc233b2ad Lucas De Marchi           2023-12-07   88  		       ENGINE_C=
LASS(RENDER)),
570a8fc233b2ad Lucas De Marchi           2023-12-07   89  	  XE_RTP_ACTIONS=
(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
570a8fc233b2ad Lucas De Marchi           2023-12-07   90  	},
d24f7d1f62e2ed Tapani P=C3=A4lli              2025-10-29   91  	{ XE_RTP_NA=
ME("14024997852"),
2882094e0db192 Arvind Yadav              2026-02-12   92  	  XE_RTP_RULES(G=
RAPHICS_VERSION_RANGE(2001, 3005), ENGINE_CLASS(RENDER)),
d24f7d1f62e2ed Tapani P=C3=A4lli              2025-10-29   93  	  XE_RTP_AC=
TIONS(WHITELIST(FF_MODE,
d24f7d1f62e2ed Tapani P=C3=A4lli              2025-10-29   94  				   RING_=
FORCE_TO_NONPRIV_ACCESS_RW),
d24f7d1f62e2ed Tapani P=C3=A4lli              2025-10-29   95  			 WHITELIS=
T(VFLSKPD,
d24f7d1f62e2ed Tapani P=C3=A4lli              2025-10-29   96  				   RING_=
FORCE_TO_NONPRIV_ACCESS_RW))
d24f7d1f62e2ed Tapani P=C3=A4lli              2025-10-29   97  	},
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06   98  	{ XE_RTP_NAME("1=
4024997852"),
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06   99  	  XE_RTP_RULES(G=
RAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06  100  		       ENGINE_C=
LASS(RENDER)),
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06  101  	  XE_RTP_ACTIONS=
(WHITELIST(FF_MODE,
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06  102  				   RING_FORCE=
_TO_NONPRIV_ACCESS_RW),
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06  103  			 WHITELIST(VFL=
SKPD,
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06  104  				   RING_FORCE=
_TO_NONPRIV_ACCESS_RW))
835cd6cbb0d0e4 Shekhar Chauhan           2026-02-06  105  	},
ed455775c5a68b Ashutosh Dixit            2025-12-01  106 =20
e70086a3a06d27 Ashutosh Dixit            2026-06-15 @107  #define WHITELIST=
_DENY(r, f) WHITELIST(r, (f) | RING_FORCE_TO_NONPRIV_DENY)
e70086a3a06d27 Ashutosh Dixit            2026-06-15  108 =20

:::::: The code at line 107 was first introduced by commit
:::::: e70086a3a06d276b4a5d9a2c51c9330c6cf72780 drm/xe/rtp: Add RING_FORCE_=
TO_NONPRIV_DENY to OA whitelists

:::::: TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
:::::: CC: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
