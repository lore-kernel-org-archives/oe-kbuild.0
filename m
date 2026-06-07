Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D01F2DF68
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 22:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869968; cv=none; b=i3x/MZOwZwHjDJ3t2xW6f2HCi2Hb8awBomPQB55VkV1vs+8GXTCIkdy6VEJ6FWVNzsJXK/dZVozTtQRDYMovbFFIk0Vet+yJuneNKskjpzJi/QBoQtEhDpm9wPXr6v9ElqDoVa26Wb5uEVnyO0/xA/2l07EcuepMAt07N7SL9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869968; c=relaxed/simple;
	bh=w7Fifl+6u7t552O3nP2Th6mFdWnWaYowPL3Wyiai6Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sd1YgrMeaql55htddu/saKrF8OIwkPQie0xzLLCsapNwqWrc9FUpOTDXga6P8MfSb9Nytz9daNIpnyyI1hI6GoxfLWmR+k6klDSbybqG5PZMQIzIerVoQVA30sKCd0zGnQRwgN29IH9VU+ccvWKzOQQ4R0mazAIgbjGZipYa6G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj4Xo0cp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj4Xo0cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869965; x=1812405965;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w7Fifl+6u7t552O3nP2Th6mFdWnWaYowPL3Wyiai6Jo=;
  b=Bj4Xo0cpVLajsw+8H3wmxW20A26gPS57TPnTlXOEhzIfstHJGnvYnJLx
   vt0skQxncETqR2HecBRalrl2YaO27ynWe/zHS3K9Ord5zHWAaX/el2AY8
   KqUkIKE66r844MBgCTyBQrTN6QHsrWkWWkPRGb+Tx5it7QIisZoZOsVyL
   +UfrYzZnLMK3G2YYiVi/wVtCbzm5JuAQz8L6VmoiZ/8jveQ0gD4N+PB62
   thjxeVa1Hibk63N5+jkkeOy3AKtz2t2m9CpPgT16NEaRvMhLaH7u81157
   DKLHJKXNtwea9PN3R4VY7P7ds/v5xQkDHGKOtWKK1kAV5XyzW+NSaEvBO
   A==;
X-CSE-ConnectionGUID: oSBLyv4iQCaGD/xI7GNGzw==
X-CSE-MsgGUID: sP8cW4OEQFKuqCaQjDMq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81351678"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="81351678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 15:06:04 -0700
X-CSE-ConnectionGUID: O+IZuKf4RoOeRmyshFgT/A==
X-CSE-MsgGUID: i9YkQNXVQKiuA5qGDlA9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="244260612"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jun 2026 15:06:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWLd3-00000000IAM-1nfj;
	Sun, 07 Jun 2026 22:06:01 +0000
Date: Mon, 08 Jun 2026 06:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-xe:drm-xe-next 1/4]
 drivers/gpu/drm/xe/xe_reg_whitelist.c:107:1: sparse: sparse: directive in
 macro's argument list
Message-ID: <202606080512.44tuwZiU-lkp@intel.com>
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
CC: intel-xe@lists.freedesktop.org
TO: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Violet Monti <violet.monti@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   b226489de47c0eba740ef8c4857aecb06e482952
commit: 5ff004fdc7377905f2fe5264b8829d35e14608b8 [1/4] drm/xe/rtp: Add stru=
ct types for RTP tables
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: um-randconfig-r134-20260607 (https://download.01.org/0day-ci/archiv=
e/20260608/202606080512.44tuwZiU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260608/202606080512.44tuwZiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606080512.44tuwZiU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_reg_whitelist.c:107:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:112:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:115:1: sparse: sparse: directive i=
n macro's argument list
   drivers/gpu/drm/xe/xe_reg_whitelist.c:126:1: sparse: sparse: directive i=
n macro's argument list

vim +107 drivers/gpu/drm/xe/xe_reg_whitelist.c

b619bbcda1389c Umesh Nerlige Ramappa     2026-05-07   43 =20
5ff004fdc73779 Gustavo Sousa             2026-06-01   44  static const stru=
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
ed455775c5a68b Ashutosh Dixit            2025-12-01 @107  #define WHITELIST=
_OA_MMIO_TRG(trg, status, head) \
ed455775c5a68b Ashutosh Dixit            2025-12-01  108  	WHITELIST(trg, R=
ING_FORCE_TO_NONPRIV_ACCESS_RW), \
ed455775c5a68b Ashutosh Dixit            2025-12-01  109  	WHITELIST(status=
, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
ed455775c5a68b Ashutosh Dixit            2025-12-01  110  	WHITELIST(head, =
RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
ed455775c5a68b Ashutosh Dixit            2025-12-01  111 =20

:::::: The code at line 107 was first introduced by commit
:::::: ed455775c5a68b75e5f6ad6c8e0e3e9c98fd3f64 drm/xe/rtp: Refactor OAG MM=
IO trigger register whitelisting

:::::: TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
:::::: CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
