Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A8152795
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715320688; cv=fail; b=Osu5oc/6i+WMkhbh6MjStEiK0XRFUR1XQ7V2oI0NChPT5z/8Yfa5J3GJAY4gMkuRHerGK68rtTyzRuOSbqzxgPWI4ZTo3cAEOwI+OQWyICP09GV5h6RuM3bPltsHLR+xQh1UA8n35ukpJflDSaA3cK+8xX0UEXQhYVRPRHaseu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715320688; c=relaxed/simple;
	bh=2VeZgx4yLMycGBfYWaxQ8oq4/ZBd7ACi/qOnwVhD984=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fu4TWS69oUOtEruFs2yYHtfdJ+ReopW7w/5jviOUlGV29KIYoHjrKok8HseDKjpkOF4TjCcA38m3Tmy2DfaoNqmiCCzGbm9IWmvmGaUCZbr7jxsQO4J/K30GhEmUGNjpEL35wcAf2FzDetOc3fdub7hJR3pIWfG/LiIJ7m2Svrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EISI3wuQ; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EISI3wuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715320684; x=1746856684;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2VeZgx4yLMycGBfYWaxQ8oq4/ZBd7ACi/qOnwVhD984=;
  b=EISI3wuQ7HbkU3rYzzFBo+joXpeySk0bVdVYrvSBmUuEq6KYYOTHmznF
   uPHwE0tXpoqZ6McA2uguUr8TtCY8a6nPz9bKJtZbjMgrmZr/ywmrcWnZU
   Ti/+/OmJIaRzRcH5WXixW26aLf6SMWmCYVKp2yP3aPnbZqF6gT05/gE0K
   em4yko39Bwmm9oIZ/LNf+Ukee7IraYkeJndCcg6m3X/epbRbpJIibN/Qu
   DmvIFxv7+eMtMNNvR+w9TNaKnv+ywAqeelF8EvGkQBzOHwJVTwjyacNoW
   e3mvh2dDxq4D2985roAtDHx26F+yE9Avw5NMB1FZmbPAI/gmAiKac3VEC
   w==;
X-CSE-ConnectionGUID: cGvLkYyRRj6cnjNr5t1fcQ==
X-CSE-MsgGUID: 1TVDeEZVStWbD3fxqczUqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11161112"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11161112"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 22:58:03 -0700
X-CSE-ConnectionGUID: QeO/6xcWQL2EFBAL7sc5Ag==
X-CSE-MsgGUID: YI2SFj/RSz+/wxFTun5jBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="52699517"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 May 2024 22:58:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 22:58:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 22:58:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 22:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKSHRxELs0DqWWjgBnzw26qHURhHTef8rBKuOLiT06ej8WDv6vljqsZN3S/+AX7YjkjJegsS/AxG4zMugnkTaf6W5KfPjCZt9osQXfSKZ3DmZfzqi3htE8aryyAkNEovy6h2jGJJXOt1p0vyKpnstGxjPC5ni3aX/VuWn/K+10AcQe6KkEBy2tb77eytqv/+cA8/LfoUGUdt8e0rhFnhbLn+b1S5pKzfa/YGNlw0Z3TNDCbr4D37236YjAwSJgNVMipHodS4+qj7K7TVB0bxcyvOWZ/V3527gbJ+rRzg+lSXxISO9S9D4+BOKq90LdcZAxCGyU/ofwk5vfecEZKb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7ZN0ai49fKA2/VNHAxbqwwhLbddGQkStL7k4L4gd5Q=;
 b=Ol7Jd+0guJ2GH0WKN8ez53MYm0F4viUD+Hqu104ObVmWEt+NmIemOHh9v8IH5Kxq0CTb/XU0wMtmu+XWAQN2I/QQK9UMWS0FTX6LGH3Q3cI/sxX7c5Rl+AL9SBf2DqPfOkQvynh1d1dkMkAXAJmn2LidkjJJWnEfPmCMaJJSZnzDEWbS2zVIK9w17p7BD1MzWPDMdELNr6CusxlYGqNUR7cgP3otC/vp76ZfVVJr20lqISG7BBodaLlpOMX/fnOr2ImwftIwaKWQ4J3jZYESRfRw5GTaLVOQgHX9OcsN6RxhFHQAD5xMXLSZkWi/JyBzr0pyR4RAfW0nCSDw7qWcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Fri, 10 May
 2024 05:57:59 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 05:57:59 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v14 02/28] dept: Implement Dept(Dependency Tracker)
Thread-Topic: [PATCH v14 02/28] dept: Implement Dept(Dependency Tracker)
Thread-Index: AQHaop4DC11OKsXs5UmMx7NIlYOwD7GP+GWg
Date: Fri, 10 May 2024 05:57:59 +0000
Message-ID: <SA1PR11MB839328C7E36947D43D62CEAAFBE72@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405101349.IqkN1Lle-lkp@intel.com>
In-Reply-To: <202405101349.IqkN1Lle-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|MW6PR11MB8412:EE_
x-ms-office365-filtering-correlation-id: 957adc89-9027-436c-b389-08dc70b6254a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?wK54Hty3VVUNDf7P9tGZgL36GZIEWUalU3Rlbb9iaO/y0mrBLk1yOybj5P8J?=
 =?us-ascii?Q?lAz3qWVwW4BhaXQxdn3ucdOn8rZBg86n37HbVKKIPnN4OGoK0yvp4M/VdyQB?=
 =?us-ascii?Q?AtdgVqvrz6QBpg4WzXex5U7z9Wfkm513FtE0g8fojBfu7TXDKa8HIpmN6xkt?=
 =?us-ascii?Q?xgnmeIIRkqLsjMmtxCKmLnBWHD8NWCzX73ooiskKbwMe+HEymjhJ72RWbRTs?=
 =?us-ascii?Q?D21Uvm2hL6QzqRHU0mp80/VCxBwjAcoQwuJgeourhxOpr8LIPgwjbtD8w24q?=
 =?us-ascii?Q?LANUp94+SLmeapbvGcKPqjrDunkoD7C0V1+sIk1lNQiTonC7TPOcNW5RZImI?=
 =?us-ascii?Q?N7GN5AwYcESgX1gqZ9Dmgnun5jkEAzoP5hcJEPdgk/37vKQNZYUA2umQnB/+?=
 =?us-ascii?Q?clGLLOyFzj15ROns7rBwO8Qlo4VyLQVyL5GHIwAxYmS8R7CjjL1zBZqTCQg9?=
 =?us-ascii?Q?1z/QIlbTAxcPJ/r8vCWYrUhQ0xLk/k47RdPXJJ+sDXqWNxIH0cXB9prWIOZq?=
 =?us-ascii?Q?s1dQ0KOlY1VmTGaHDgR5nWNgKRr/8JWdxIIQtPx+Oa+lyPl2/ZyaQP5a7d2B?=
 =?us-ascii?Q?o9Lgjjk6QXk8RwihE30r0Lb4ngm1HqQ5JL4n0gNvpeT+0q00x7nXVl151qI/?=
 =?us-ascii?Q?Gg5wbXtWzfItT3Feh9Hplv7GYb5+hVjNH630FNheg4N04H3wzHHIhX6Kz6Wp?=
 =?us-ascii?Q?oRFoyz/+/wj0Vo0IBsLFUDwnzfVaTAemKhyyfayFOCSdLCeg0WxqOV6eWlhi?=
 =?us-ascii?Q?s48HEYzLsnXfPiAjiL5LR4dXOZQnijSF2QsZit04zGGwO3RUk2un+yM8QJrN?=
 =?us-ascii?Q?mhPGGHCLtGp46gL784s556JonFiyXl4wggb3SQ+3UM24rKmaXHu8Yu3nKXqZ?=
 =?us-ascii?Q?ff6ikYKBXTDFbonEJbvEwVO0DPt/i4tZa/mOaAZT2ZFUXKKm1s1+ebMwbnqV?=
 =?us-ascii?Q?QOHc1O0qCIEI14h67JwLAEOwhSjKR4pofvd20DLVqRxgeJ2PAPPHecW9DzNl?=
 =?us-ascii?Q?DacPfC+GYvvCvjU3ZG7q0zFHj02mN/+y/0ni2bK0IvXjPodbPhVGxQ8vGlLz?=
 =?us-ascii?Q?6Q59MgghIrxXuXx1oaoqoO/OuZ1BAGzIoX2ydGhmLtYLwbbA+tYAmv3Y2AK9?=
 =?us-ascii?Q?1QtMyP+r+u5Vp4bF7/qb/ZK4KzNgFJG+kfaZBNZqdEXnu/zCA8Bo12aAMv9Q?=
 =?us-ascii?Q?YaECsE0gtd3guUY/9aTB0n4TUnYuCob2fI/PDDKLRbbgR2RVceQkhnKIbA3o?=
 =?us-ascii?Q?jl+DVITRg06XucAp9V4uXuvl8AqkkFubTUkQ93TkBqxxZSpv8SSkNWE4of2A?=
 =?us-ascii?Q?3zM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LwBrb0jgGrvq4jdN/IFUM2qyqMSOjVrv9CVkR+coKuLYaauJfVjHkimbRcyG?=
 =?us-ascii?Q?lMoqEp4WJv8Ejt+Bl27OXQI5GOTwQx1GF1tZjnMD0H69B+gg+SeZE8Nxa9lz?=
 =?us-ascii?Q?1nKuadTtwuNwNioMbKhFUjE0fNzf3oc5n5ymjPETNxT6x89WHOW7YYREkJNt?=
 =?us-ascii?Q?FtlvE0Umnq307RpVf8k7HPgKTYmchzl8vC3m13pDJZF50NzIdBTZFkQ7kU13?=
 =?us-ascii?Q?vqR+yEE5MfRGP2/9ZR7RhMjh93Tgz2eJfFshKIulJ7bgjo+DbEOtFSg9O2pA?=
 =?us-ascii?Q?fGzKSUNvdD8eR3uaJ9lOaOmjLMr6EYTQkzD6rbAdH0qB0fl+fnREYrZBfLKq?=
 =?us-ascii?Q?Zm7sgxWTvBK3mk57SU7fA+b0+mGXC7HPMwzBLIXPWqGSlaQXErr7T/C1L/ic?=
 =?us-ascii?Q?lAxyJX20oiRGz/O/BkQo5J+ceQFA+KzytvbvKHcmKC46nf1Kyah91gpqEMQY?=
 =?us-ascii?Q?a+mcH5PRvMvg9Frnocj0R6/g/eRTEtj20pm6GUOSNSfTk+6kpQ34xoMw7xSV?=
 =?us-ascii?Q?XnDNZzaYmZNm0Y5yzRmYw1oZYo85zdwsZcI0m2yXwYU3GyPcW/6rk8muwGAb?=
 =?us-ascii?Q?m+Ex0YUVfp2pC7poxt2Wpk8/pQOwfbiUg2U11XjMCVCC431i8zkYH9AsUHP4?=
 =?us-ascii?Q?w1Yk4+dwsZp2REAHKaoABdIURI+eXzSQm96wz5gwaUrY2I7raLVSVKMFBGcR?=
 =?us-ascii?Q?GzoATcsdSwmDDCYetVFla19i1lA2SXS+B2Z8EF89kyvG6Ut5EKeu/zOw9SsH?=
 =?us-ascii?Q?znV+txBJI95RNwUqfDkQ1/ATui4dlo/MnG8+G1duyT1rFLm8ADdyFQfnvg6b?=
 =?us-ascii?Q?gzctVzovWQVuTOi2fLkNN14c/Y1y7xonhRin48Uj1FYKcQ2d/eN4Wb4vLfUX?=
 =?us-ascii?Q?myM7tzXmMm5e4fPpTfosaWQ8Y41QcCtdEVad7DOsZnSg9vhcm05Rf8Hv9qMA?=
 =?us-ascii?Q?9sj6ERwu3oTRvvPdO+QuAf0DgHXcTJvmmEOwRfjCLNNuzbMDnj09/apwJZRH?=
 =?us-ascii?Q?QT7sYjfufXACZNAxSwie2K369L3I3XPqhZlVlKowV2V8UzbzhYgXy9hDFwn8?=
 =?us-ascii?Q?Tle3k0VPf8X/hIbVqKTM5XJhQYkr6Aii573UFjQIFqMPIBlVuoNAyEfgdoVc?=
 =?us-ascii?Q?D5AKQbOpjAYP+1+OatWnc5OqTePNdMXeNBWKnWrWBhiPZ46kBkCHN0xAJlJl?=
 =?us-ascii?Q?wlGq0FQiBoukQVHM0TPYUrCLf2dauHdQ3huiCi9+3AYEOF8g1UCnk08u4xqR?=
 =?us-ascii?Q?8McIKtBBMpqUnjRdi89XzzszuWLMPbqKhe8abeqQngYyCmVepVz3IrkqOPXB?=
 =?us-ascii?Q?Qqh1MpjAUdgik2i68yrEnHgxTT4N8oefmaFmsJZHA/+26qyPQwgq2eRK+Bo9?=
 =?us-ascii?Q?TPRibYNnUs4lQ8DSqjvgslyK71i/sH9/b/xAbXenPmi/RmBcmkJ8d+J493Xg?=
 =?us-ascii?Q?9fwDHiS489yEj0xDkcmMpMawVD5yiaMibRoiPXk3ERmAufmowQ3NlpcPuZc2?=
 =?us-ascii?Q?9u/Bk5UydBPreDEtBQVcyNIz4lFi3ugmqC2htgLBh/6/Fdbjcr9F3nPJVLTq?=
 =?us-ascii?Q?zTJchYL7T2G3r0kvCU8v34OOc9PhN/3/jKpsWj7M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957adc89-9027-436c-b389-08dc70b6254a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 05:57:59.1689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xpI+bmhJAbos6m4XjUUKF9cexGBVV8RC4cD6pq+qH5JcYej9ntBQpueMAEPy6KfCCQbx/ZssuoqxOZgFv7XVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
X-OriginatorOrg: intel.com

not_report 'guarded by macro'

  2959	#define HASH(id, bits)							\
  2960		pr_info("... hash list head used by %s: %zu KB\n",		\
  2961		       #id, B2KB(sizeof(struct hlist_head) * (1 << (bits))));
> 2962		#include "dept_hash.h"

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, May 10, 2024 13:46
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v14 02/28] dept: Implement Dept(Dependency Tracker)

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240508094726.35754-3-byungchul@sk.com>
References: <20240508094726.35754-3-byungchul@sk.com>
TO: Byungchul Park <byungchul@sk.com>
TO: linux-kernel@vger.kernel.org
CC: kernel_team@skhynix.com
CC: torvalds@linux-foundation.org
CC: damien.lemoal@opensource.wdc.com
CC: linux-ide@vger.kernel.org
CC: adilger.kernel@dilger.ca
CC: linux-ext4@vger.kernel.org
CC: mingo@redhat.com
CC: peterz@infradead.org
CC: will@kernel.org
CC: tglx@linutronix.de
CC: rostedt@goodmis.org
CC: joel@joelfernandes.org
CC: sashal@kernel.org
CC: daniel.vetter@ffwll.ch
CC: duyuyang@gmail.com
CC: johannes.berg@intel.com
CC: tj@kernel.org
CC: tytso@mit.edu
CC: willy@infradead.org
CC: david@fromorbit.com
CC: amir73il@gmail.com
CC: gregkh@linuxfoundation.org
CC: kernel-team@lge.com
CC: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: mhocko@kernel.org
CC: minchan@kernel.org
CC: hannes@cmpxchg.org
CC: vdavydov.dev@gmail.com

Hi Byungchul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/llist=
-Move-llist_-head-node-definition-to-types-h/20240508-180822
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240508094726.35754-3-byungchul%4=
0sk.com
patch subject: [PATCH v14 02/28] dept: Implement Dept(Dependency Tracker)
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c328=
9804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405101349.IqkN1Lle-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/dependency/dept.c: dept_hash.h is included more than once.
>> kernel/dependency/dept.c: dept_object.h is included more than once.

vim +599 kernel/dependency/dept.c

   569=09
   570	#define HASH(id, bits)							\
   571	static struct hlist_head table_##id[1 << (bits)];			\
   572										\
   573	static struct hlist_head *head_##id(struct dept_##id *a)		\
   574	{									\
   575		return table_##id + hash_long(key_##id(a), bits);		\
   576	}									\
   577										\
   578	static struct dept_##id *hash_lookup_##id(struct dept_##id *a)		\
   579	{									\
   580		struct dept_##id *b;						\
   581										\
   582		hlist_for_each_entry_rcu(b, head_##id(a), hash_node)		\
   583			if (cmp_##id(a, b))					\
   584				return b;					\
   585		return NULL;							\
   586	}									\
   587										\
   588	static void hash_add_##id(struct dept_##id *a)				\
   589	{									\
   590		get_##id(a);							\
   591		hlist_add_head_rcu(&a->hash_node, head_##id(a));		\
   592	}									\
   593										\
   594	static void hash_del_##id(struct dept_##id *a)				\
   595	{									\
   596		hlist_del_rcu(&a->hash_node);					\
   597		put_##id(a);							\
   598	}
 > 599	#include "dept_hash.h"
   600	#undef  HASH
   601=09
   602	static struct dept_dep *lookup_dep(struct dept_class *fc,
   603					   struct dept_class *tc)
   604	{
   605		struct dept_ecxt onetime_e =3D { .class =3D fc };
   606		struct dept_wait onetime_w =3D { .class =3D tc };
   607		struct dept_dep  onetime_d =3D { .ecxt =3D &onetime_e,
   608					       .wait =3D &onetime_w };
   609		return hash_lookup_dep(&onetime_d);
   610	}
   611=09
   612	static struct dept_class *lookup_class(unsigned long key)
   613	{
   614		struct dept_class onetime_c =3D { .key =3D key };
   615=09
   616		return hash_lookup_class(&onetime_c);
   617	}
   618=09
   619	/*
   620	 * Report
   621	 * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   622	 * DEPT prints useful information to help debuging on detection of
   623	 * problematic dependency.
   624	 */
   625=09
   626	static void print_ip_stack(unsigned long ip, struct dept_stack *s)
   627	{
   628		if (ip)
   629			print_ip_sym(KERN_WARNING, ip);
   630=09
   631		if (valid_stack(s)) {
   632			pr_warn("stacktrace:\n");
   633			stack_trace_print(s->raw, s->nr, 5);
   634		}
   635=09
   636		if (!ip && !valid_stack(s))
   637			pr_warn("(N/A)\n");
   638	}
   639=09
   640	#define print_spc(spc, fmt, ...) \
   641		pr_warn("%*c" fmt, (spc) * 4, ' ', ##__VA_ARGS__)
   642=09
   643	static void print_diagram(struct dept_dep *d)
   644	{
   645		struct dept_ecxt *e =3D dep_e(d);
   646		struct dept_wait *w =3D dep_w(d);
   647		struct dept_class *fc =3D dep_fc(d);
   648		struct dept_class *tc =3D dep_tc(d);
   649		unsigned long irqf;
   650		int irq;
   651		bool firstline =3D true;
   652		int spc =3D 1;
   653		const char *w_fn =3D w->wait_fn ?: "(unknown)";
   654		const char *e_fn =3D e->event_fn ?: "(unknown)";
   655		const char *c_fn =3D e->ecxt_fn ?: "(unknown)";
   656		const char *fc_n =3D fc->sched_map ? "<sched>" : (fc->name ?: "(unk=
nown)");
   657		const char *tc_n =3D tc->sched_map ? "<sched>" : (tc->name ?: "(unk=
nown)");
   658=09
   659		irqf =3D e->enirqf & w->irqf;
   660		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
   661			if (!firstline)
   662				pr_warn("\nor\n\n");
   663			firstline =3D false;
   664=09
   665			print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
   666			print_spc(spc, "    <%s interrupt>\n", irq_str(irq));
   667			print_spc(spc + 1, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
   668			print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
   669		}
   670=09
   671		if (!irqf) {
   672			print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
   673			print_spc(spc, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
   674			print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
   675		}
   676	}
   677=09
   678	static void print_dep(struct dept_dep *d)
   679	{
   680		struct dept_ecxt *e =3D dep_e(d);
   681		struct dept_wait *w =3D dep_w(d);
   682		struct dept_class *fc =3D dep_fc(d);
   683		struct dept_class *tc =3D dep_tc(d);
   684		unsigned long irqf;
   685		int irq;
   686		const char *w_fn =3D w->wait_fn ?: "(unknown)";
   687		const char *e_fn =3D e->event_fn ?: "(unknown)";
   688		const char *c_fn =3D e->ecxt_fn ?: "(unknown)";
   689		const char *fc_n =3D fc->sched_map ? "<sched>" : (fc->name ?: "(unk=
nown)");
   690		const char *tc_n =3D tc->sched_map ? "<sched>" : (tc->name ?: "(unk=
nown)");
   691=09
   692		irqf =3D e->enirqf & w->irqf;
   693		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
   694			pr_warn("%s has been enabled:\n", irq_str(irq));
   695			print_ip_stack(e->enirq_ip[irq], e->enirq_stack[irq]);
   696			pr_warn("\n");
   697=09
   698			pr_warn("[S] %s(%s:%d):\n", c_fn, fc_n, fc->sub_id);
   699			print_ip_stack(e->ecxt_ip, e->ecxt_stack);
   700			pr_warn("\n");
   701=09
   702			pr_warn("[W] %s(%s:%d) in %s context:\n",
   703			       w_fn, tc_n, tc->sub_id, irq_str(irq));
   704			print_ip_stack(w->irq_ip[irq], w->irq_stack[irq]);
   705			pr_warn("\n");
   706=09
   707			pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
   708			print_ip_stack(e->event_ip, e->event_stack);
   709		}
   710=09
   711		if (!irqf) {
   712			pr_warn("[S] %s(%s:%d):\n", c_fn, fc_n, fc->sub_id);
   713			print_ip_stack(e->ecxt_ip, e->ecxt_stack);
   714			pr_warn("\n");
   715=09
   716			pr_warn("[W] %s(%s:%d):\n", w_fn, tc_n, tc->sub_id);
   717			print_ip_stack(w->wait_ip, w->wait_stack);
   718			pr_warn("\n");
   719=09
   720			pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
   721			print_ip_stack(e->event_ip, e->event_stack);
   722		}
   723	}
   724=09
   725	static void save_current_stack(int skip);
   726=09
   727	/*
   728	 * Print all classes in a circle.
   729	 */
   730	static void print_circle(struct dept_class *c)
   731	{
   732		struct dept_class *fc =3D c->bfs_parent;
   733		struct dept_class *tc =3D c;
   734		int i;
   735=09
   736		dept_outworld_enter();
   737		save_current_stack(6);
   738=09
   739		pr_warn("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D\n");
   740		pr_warn("DEPT: Circular dependency has been detected.\n");
   741		pr_warn("%s %.*s %s\n", init_utsname()->release,
   742			(int)strcspn(init_utsname()->version, " "),
   743			init_utsname()->version,
   744			print_tainted());
   745		pr_warn("---------------------------------------------------\n");
   746		pr_warn("summary\n");
   747		pr_warn("---------------------------------------------------\n");
   748=09
   749		if (fc =3D=3D tc)
   750			pr_warn("*** AA DEADLOCK ***\n\n");
   751		else
   752			pr_warn("*** DEADLOCK ***\n\n");
   753=09
   754		i =3D 0;
   755		do {
   756			struct dept_dep *d =3D lookup_dep(fc, tc);
   757=09
   758			pr_warn("context %c\n", 'A' + (i++));
   759			print_diagram(d);
   760			if (fc !=3D c)
   761				pr_warn("\n");
   762=09
   763			tc =3D fc;
   764			fc =3D fc->bfs_parent;
   765		} while (tc !=3D c);
   766=09
   767		pr_warn("\n");
   768		pr_warn("[S]: start of the event context\n");
   769		pr_warn("[W]: the wait blocked\n");
   770		pr_warn("[E]: the event not reachable\n");
   771=09
   772		i =3D 0;
   773		do {
   774			struct dept_dep *d =3D lookup_dep(fc, tc);
   775=09
   776			pr_warn("---------------------------------------------------\n");
   777			pr_warn("context %c's detail\n", 'A' + i);
   778			pr_warn("---------------------------------------------------\n");
   779			pr_warn("context %c\n", 'A' + (i++));
   780			print_diagram(d);
   781			pr_warn("\n");
   782			print_dep(d);
   783=09
   784			tc =3D fc;
   785			fc =3D fc->bfs_parent;
   786		} while (tc !=3D c);
   787=09
   788		pr_warn("---------------------------------------------------\n");
   789		pr_warn("information that might be helpful\n");
   790		pr_warn("---------------------------------------------------\n");
   791		dump_stack();
   792=09
   793		dept_outworld_exit();
   794	}
   795=09
   796	/*
   797	 * BFS(Breadth First Search)
   798	 * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   799	 * Whenever a new dependency is added into the graph, search the gra=
ph
   800	 * for a new circular dependency.
   801	 */
   802=09
   803	static void enqueue(struct list_head *h, struct dept_dep *d)
   804	{
   805		list_add_tail(&d->bfs_node, h);
   806	}
   807=09
   808	static struct dept_dep *dequeue(struct list_head *h)
   809	{
   810		struct dept_dep *d;
   811=09
   812		d =3D list_first_entry(h, struct dept_dep, bfs_node);
   813		list_del(&d->bfs_node);
   814		return d;
   815	}
   816=09
   817	static bool empty(struct list_head *h)
   818	{
   819		return list_empty(h);
   820	}
   821=09
   822	static void extend_queue(struct list_head *h, struct dept_class *cur=
)
   823	{
   824		struct dept_dep *d;
   825=09
   826		list_for_each_entry(d, &cur->dep_head, dep_node) {
   827			struct dept_class *next =3D dep_tc(d);
   828=09
   829			if (cur->bfs_gen =3D=3D next->bfs_gen)
   830				continue;
   831			next->bfs_gen =3D cur->bfs_gen;
   832			next->bfs_dist =3D cur->bfs_dist + 1;
   833			next->bfs_parent =3D cur;
   834			enqueue(h, d);
   835		}
   836	}
   837=09
   838	static void extend_queue_rev(struct list_head *h, struct dept_class =
*cur)
   839	{
   840		struct dept_dep *d;
   841=09
   842		list_for_each_entry(d, &cur->dep_rev_head, dep_rev_node) {
   843			struct dept_class *next =3D dep_fc(d);
   844=09
   845			if (cur->bfs_gen =3D=3D next->bfs_gen)
   846				continue;
   847			next->bfs_gen =3D cur->bfs_gen;
   848			next->bfs_dist =3D cur->bfs_dist + 1;
   849			next->bfs_parent =3D cur;
   850			enqueue(h, d);
   851		}
   852	}
   853=09
   854	typedef enum bfs_ret bfs_f(struct dept_dep *d, void *in, void **out)=
;
   855	static unsigned int bfs_gen;
   856=09
   857	/*
   858	 * NOTE: Must be called with dept_lock held.
   859	 */
   860	static void bfs(struct dept_class *c, bfs_f *cb, void *in, void **ou=
t)
   861	{
   862		LIST_HEAD(q);
   863		enum bfs_ret ret;
   864=09
   865		if (DEPT_WARN_ON(!cb))
   866			return;
   867=09
   868		/*
   869		 * Avoid zero bfs_gen.
   870		 */
   871		bfs_gen =3D bfs_gen + 1 ?: 1;
   872=09
   873		c->bfs_gen =3D bfs_gen;
   874		c->bfs_dist =3D 0;
   875		c->bfs_parent =3D c;
   876=09
   877		ret =3D cb(NULL, in, out);
   878		if (ret =3D=3D BFS_DONE)
   879			return;
   880		if (ret =3D=3D BFS_SKIP)
   881			return;
   882		if (ret =3D=3D BFS_CONTINUE)
   883			extend_queue(&q, c);
   884		if (ret =3D=3D BFS_CONTINUE_REV)
   885			extend_queue_rev(&q, c);
   886=09
   887		while (!empty(&q)) {
   888			struct dept_dep *d =3D dequeue(&q);
   889=09
   890			ret =3D cb(d, in, out);
   891			if (ret =3D=3D BFS_DONE)
   892				break;
   893			if (ret =3D=3D BFS_SKIP)
   894				continue;
   895			if (ret =3D=3D BFS_CONTINUE)
   896				extend_queue(&q, dep_tc(d));
   897			if (ret =3D=3D BFS_CONTINUE_REV)
   898				extend_queue_rev(&q, dep_fc(d));
   899		}
   900=09
   901		while (!empty(&q))
   902			dequeue(&q);
   903	}
   904=09
   905	/*
   906	 * Main operations
   907	 * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   908	 * Add dependencies - Each new dependency is added into the graph an=
d
   909	 * checked if it forms a circular dependency.
   910	 *
   911	 * Track waits - Waits are queued into the ring buffer for later use=
 to
   912	 * generate appropriate dependencies with cross-event.
   913	 *
   914	 * Track event contexts(ecxt) - Event contexts are pushed into local
   915	 * stack for later use to generate appropriate dependencies with wai=
ts.
   916	 */
   917=09
   918	static unsigned long cur_enirqf(void);
   919	static int cur_irq(void);
   920	static unsigned int cur_ctxt_id(void);
   921=09
   922	static struct dept_iecxt *iecxt(struct dept_class *c, int irq)
   923	{
   924		return &c->iecxt[irq];
   925	}
   926=09
   927	static struct dept_iwait *iwait(struct dept_class *c, int irq)
   928	{
   929		return &c->iwait[irq];
   930	}
   931=09
   932	static void stale_iecxt(struct dept_iecxt *ie)
   933	{
   934		if (ie->ecxt)
   935			put_ecxt(ie->ecxt);
   936=09
   937		WRITE_ONCE(ie->ecxt, NULL);
   938		WRITE_ONCE(ie->staled, true);
   939	}
   940=09
   941	static void set_iecxt(struct dept_iecxt *ie, struct dept_ecxt *e)
   942	{
   943		/*
   944		 * ->ecxt will never be updated once getting set until the class
   945		 * gets removed.
   946		 */
   947		if (ie->ecxt)
   948			DEPT_WARN_ON(1);
   949		else
   950			WRITE_ONCE(ie->ecxt, get_ecxt(e));
   951	}
   952=09
   953	static void stale_iwait(struct dept_iwait *iw)
   954	{
   955		if (iw->wait)
   956			put_wait(iw->wait);
   957=09
   958		WRITE_ONCE(iw->wait, NULL);
   959		WRITE_ONCE(iw->staled, true);
   960	}
   961=09
   962	static void set_iwait(struct dept_iwait *iw, struct dept_wait *w)
   963	{
   964		/*
   965		 * ->wait will never be updated once getting set until the class
   966		 * gets removed.
   967		 */
   968		if (iw->wait)
   969			DEPT_WARN_ON(1);
   970		else
   971			WRITE_ONCE(iw->wait, get_wait(w));
   972=09
   973		iw->touched =3D true;
   974	}
   975=09
   976	static void touch_iwait(struct dept_iwait *iw)
   977	{
   978		iw->touched =3D true;
   979	}
   980=09
   981	static void untouch_iwait(struct dept_iwait *iw)
   982	{
   983		iw->touched =3D false;
   984	}
   985=09
   986	static struct dept_stack *get_current_stack(void)
   987	{
   988		struct dept_stack *s =3D dept_task()->stack;
   989=09
   990		return s ? get_stack(s) : NULL;
   991	}
   992=09
   993	static void prepare_current_stack(void)
   994	{
   995		struct dept_stack *s =3D dept_task()->stack;
   996=09
   997		/*
   998		 * The dept_stack is already ready.
   999		 */
  1000		if (s && !stack_consumed(s)) {
  1001			s->nr =3D 0;
  1002			return;
  1003		}
  1004=09
  1005		if (s)
  1006			put_stack(s);
  1007=09
  1008		s =3D dept_task()->stack =3D new_stack();
  1009		if (!s)
  1010			return;
  1011=09
  1012		get_stack(s);
  1013		del_stack(s);
  1014	}
  1015=09
  1016	static void save_current_stack(int skip)
  1017	{
  1018		struct dept_stack *s =3D dept_task()->stack;
  1019=09
  1020		if (!s)
  1021			return;
  1022		if (valid_stack(s))
  1023			return;
  1024=09
  1025		s->nr =3D stack_trace_save(s->raw, DEPT_MAX_STACK_ENTRY, skip);
  1026	}
  1027=09
  1028	static void finish_current_stack(void)
  1029	{
  1030		struct dept_stack *s =3D dept_task()->stack;
  1031=09
  1032		if (stack_consumed(s))
  1033			save_current_stack(2);
  1034	}
  1035=09
  1036	/*
  1037	 * FIXME: For now, disable LOCKDEP while DEPT is working.
  1038	 *
  1039	 * Both LOCKDEP and DEPT report it on a deadlock detection using
  1040	 * printk taking the risk of another deadlock that might be caused b=
y
  1041	 * locks of console or printk between inside and outside of them.
  1042	 *
  1043	 * For DEPT, it's no problem since multiple reports are allowed. But=
 it
  1044	 * would be a bad idea for LOCKDEP since it will stop even on a sing=
e
  1045	 * report. So we need to prevent LOCKDEP from its reporting the risk
  1046	 * DEPT would take when reporting something.
  1047	 */
  1048	#include <linux/lockdep.h>
  1049=09
  1050	void noinstr dept_off(void)
  1051	{
  1052		dept_task()->recursive++;
  1053		lockdep_off();
  1054	}
  1055=09
  1056	void noinstr dept_on(void)
  1057	{
  1058		dept_task()->recursive--;
  1059		lockdep_on();
  1060	}
  1061=09
  1062	static unsigned long dept_enter(void)
  1063	{
  1064		unsigned long flags;
  1065=09
  1066		flags =3D arch_local_irq_save();
  1067		dept_off();
  1068		prepare_current_stack();
  1069		return flags;
  1070	}
  1071=09
  1072	static void dept_exit(unsigned long flags)
  1073	{
  1074		finish_current_stack();
  1075		dept_on();
  1076		arch_local_irq_restore(flags);
  1077	}
  1078=09
  1079	static unsigned long dept_enter_recursive(void)
  1080	{
  1081		unsigned long flags;
  1082=09
  1083		flags =3D arch_local_irq_save();
  1084		return flags;
  1085	}
  1086=09
  1087	static void dept_exit_recursive(unsigned long flags)
  1088	{
  1089		arch_local_irq_restore(flags);
  1090	}
  1091=09
  1092	/*
  1093	 * NOTE: Must be called with dept_lock held.
  1094	 */
  1095	static struct dept_dep *__add_dep(struct dept_ecxt *e,
  1096					  struct dept_wait *w)
  1097	{
  1098		struct dept_dep *d;
  1099=09
  1100		if (DEPT_WARN_ON(!valid_class(e->class)))
  1101			return NULL;
  1102=09
  1103		if (DEPT_WARN_ON(!valid_class(w->class)))
  1104			return NULL;
  1105=09
  1106		if (lookup_dep(e->class, w->class))
  1107			return NULL;
  1108=09
  1109		d =3D new_dep();
  1110		if (unlikely(!d))
  1111			return NULL;
  1112=09
  1113		d->ecxt =3D get_ecxt(e);
  1114		d->wait =3D get_wait(w);
  1115=09
  1116		/*
  1117		 * Add the dependency into hash and graph.
  1118		 */
  1119		hash_add_dep(d);
  1120		list_add(&d->dep_node, &dep_fc(d)->dep_head);
  1121		list_add(&d->dep_rev_node, &dep_tc(d)->dep_rev_head);
  1122		return d;
  1123	}
  1124=09
  1125	static enum bfs_ret cb_check_dl(struct dept_dep *d,
  1126					void *in, void **out)
  1127	{
  1128		struct dept_dep *new =3D (struct dept_dep *)in;
  1129=09
  1130		/*
  1131		 * initial condition for this BFS search
  1132		 */
  1133		if (!d) {
  1134			dep_tc(new)->bfs_parent =3D dep_fc(new);
  1135=09
  1136			if (dep_tc(new) !=3D dep_fc(new))
  1137				return BFS_CONTINUE;
  1138=09
  1139			/*
  1140			 * AA circle does not make additional deadlock. We don't
  1141			 * have to continue this BFS search.
  1142			 */
  1143			print_circle(dep_tc(new));
  1144			return BFS_DONE;
  1145		}
  1146=09
  1147		/*
  1148		 * Allow multiple reports.
  1149		 */
  1150		if (dep_tc(d) =3D=3D dep_fc(new))
  1151			print_circle(dep_tc(new));
  1152=09
  1153		return BFS_CONTINUE;
  1154	}
  1155=09
  1156	/*
  1157	 * This function is actually in charge of reporting.
  1158	 */
  1159	static void check_dl_bfs(struct dept_dep *d)
  1160	{
  1161		bfs(dep_tc(d), cb_check_dl, (void *)d, NULL);
  1162	}
  1163=09
  1164	static enum bfs_ret cb_find_iw(struct dept_dep *d, void *in, void **=
out)
  1165	{
  1166		int irq =3D *(int *)in;
  1167		struct dept_class *fc;
  1168		struct dept_iwait *iw;
  1169=09
  1170		if (DEPT_WARN_ON(!out))
  1171			return BFS_DONE;
  1172=09
  1173		/*
  1174		 * initial condition for this BFS search
  1175		 */
  1176		if (!d)
  1177			return BFS_CONTINUE_REV;
  1178=09
  1179		fc =3D dep_fc(d);
  1180		iw =3D iwait(fc, irq);
  1181=09
  1182		/*
  1183		 * If any parent's ->wait was set, then the children would've
  1184		 * been touched.
  1185		 */
  1186		if (!iw->touched)
  1187			return BFS_SKIP;
  1188=09
  1189		if (!iw->wait)
  1190			return BFS_CONTINUE_REV;
  1191=09
  1192		*out =3D iw;
  1193		return BFS_DONE;
  1194	}
  1195=09
  1196	static struct dept_iwait *find_iw_bfs(struct dept_class *c, int irq)
  1197	{
  1198		struct dept_iwait *iw =3D iwait(c, irq);
  1199		struct dept_iwait *found =3D NULL;
  1200=09
  1201		if (iw->wait)
  1202			return iw;
  1203=09
  1204		/*
  1205		 * '->touched =3D=3D false' guarantees there's no parent that has
  1206		 * been set ->wait.
  1207		 */
  1208		if (!iw->touched)
  1209			return NULL;
  1210=09
  1211		bfs(c, cb_find_iw, (void *)&irq, (void **)&found);
  1212=09
  1213		if (found)
  1214			return found;
  1215=09
  1216		untouch_iwait(iw);
  1217		return NULL;
  1218	}
  1219=09
  1220	static enum bfs_ret cb_touch_iw_find_ie(struct dept_dep *d, void *in=
,
  1221						void **out)
  1222	{
  1223		int irq =3D *(int *)in;
  1224		struct dept_class *tc;
  1225		struct dept_iecxt *ie;
  1226		struct dept_iwait *iw;
  1227=09
  1228		if (DEPT_WARN_ON(!out))
  1229			return BFS_DONE;
  1230=09
  1231		/*
  1232		 * initial condition for this BFS search
  1233		 */
  1234		if (!d)
  1235			return BFS_CONTINUE;
  1236=09
  1237		tc =3D dep_tc(d);
  1238		ie =3D iecxt(tc, irq);
  1239		iw =3D iwait(tc, irq);
  1240=09
  1241		touch_iwait(iw);
  1242=09
  1243		if (!ie->ecxt)
  1244			return BFS_CONTINUE;
  1245=09
  1246		if (!*out)
  1247			*out =3D ie;
  1248=09
  1249		return BFS_CONTINUE;
  1250	}
  1251=09
  1252	static struct dept_iecxt *touch_iw_find_ie_bfs(struct dept_class *c,
  1253						       int irq)
  1254	{
  1255		struct dept_iecxt *ie =3D iecxt(c, irq);
  1256		struct dept_iwait *iw =3D iwait(c, irq);
  1257		struct dept_iecxt *found =3D ie->ecxt ? ie : NULL;
  1258=09
  1259		touch_iwait(iw);
  1260		bfs(c, cb_touch_iw_find_ie, (void *)&irq, (void **)&found);
  1261		return found;
  1262	}
  1263=09
  1264	/*
  1265	 * Should be called with dept_lock held.
  1266	 */
  1267	static void __add_idep(struct dept_iecxt *ie, struct dept_iwait *iw)
  1268	{
  1269		struct dept_dep *new;
  1270=09
  1271		/*
  1272		 * There's nothing to do.
  1273		 */
  1274		if (!ie || !iw || !ie->ecxt || !iw->wait)
  1275			return;
  1276=09
  1277		new =3D __add_dep(ie->ecxt, iw->wait);
  1278=09
  1279		/*
  1280		 * Deadlock detected. Let check_dl_bfs() report it.
  1281		 */
  1282		if (new) {
  1283			check_dl_bfs(new);
  1284			stale_iecxt(ie);
  1285			stale_iwait(iw);
  1286		}
  1287=09
  1288		/*
  1289		 * If !new, it would be the case of lack of object resource.
  1290		 * Just let it go and get checked by other chances. Retrying is
  1291		 * meaningless in that case.
  1292		 */
  1293	}
  1294=09
  1295	static void set_check_iecxt(struct dept_class *c, int irq,
  1296				    struct dept_ecxt *e)
  1297	{
  1298		struct dept_iecxt *ie =3D iecxt(c, irq);
  1299=09
  1300		set_iecxt(ie, e);
  1301		__add_idep(ie, find_iw_bfs(c, irq));
  1302	}
  1303=09
  1304	static void set_check_iwait(struct dept_class *c, int irq,
  1305				    struct dept_wait *w)
  1306	{
  1307		struct dept_iwait *iw =3D iwait(c, irq);
  1308=09
  1309		set_iwait(iw, w);
  1310		__add_idep(touch_iw_find_ie_bfs(c, irq), iw);
  1311	}
  1312=09
  1313	static void add_iecxt(struct dept_class *c, int irq, struct dept_ecx=
t *e,
  1314			      bool stack)
  1315	{
  1316		/*
  1317		 * This access is safe since we ensure e->class has set locally.
  1318		 */
  1319		struct dept_task *dt =3D dept_task();
  1320		struct dept_iecxt *ie =3D iecxt(c, irq);
  1321=09
  1322		if (DEPT_WARN_ON(!valid_class(c)))
  1323			return;
  1324=09
  1325		if (unlikely(READ_ONCE(ie->staled)))
  1326			return;
  1327=09
  1328		/*
  1329		 * Skip add_iecxt() if ie->ecxt has ever been set at least once.
  1330		 * Which means it has a valid ->ecxt or been staled.
  1331		 */
  1332		if (READ_ONCE(ie->ecxt))
  1333			return;
  1334=09
  1335		if (unlikely(!dept_lock()))
  1336			return;
  1337=09
  1338		if (unlikely(ie->staled))
  1339			goto unlock;
  1340		if (ie->ecxt)
  1341			goto unlock;
  1342=09
  1343		e->enirqf |=3D (1UL << irq);
  1344=09
  1345		/*
  1346		 * Should be NULL since it's the first time that these
  1347		 * enirq_{ip,stack}[irq] have ever set.
  1348		 */
  1349		DEPT_WARN_ON(e->enirq_ip[irq]);
  1350		DEPT_WARN_ON(e->enirq_stack[irq]);
  1351=09
  1352		e->enirq_ip[irq] =3D dt->enirq_ip[irq];
  1353		e->enirq_stack[irq] =3D stack ? get_current_stack() : NULL;
  1354=09
  1355		set_check_iecxt(c, irq, e);
  1356	unlock:
  1357		dept_unlock();
  1358	}
  1359=09
  1360	static void add_iwait(struct dept_class *c, int irq, struct dept_wai=
t *w)
  1361	{
  1362		struct dept_iwait *iw =3D iwait(c, irq);
  1363=09
  1364		if (DEPT_WARN_ON(!valid_class(c)))
  1365			return;
  1366=09
  1367		if (unlikely(READ_ONCE(iw->staled)))
  1368			return;
  1369=09
  1370		/*
  1371		 * Skip add_iwait() if iw->wait has ever been set at least once.
  1372		 * Which means it has a valid ->wait or been staled.
  1373		 */
  1374		if (READ_ONCE(iw->wait))
  1375			return;
  1376=09
  1377		if (unlikely(!dept_lock()))
  1378			return;
  1379=09
  1380		if (unlikely(iw->staled))
  1381			goto unlock;
  1382		if (iw->wait)
  1383			goto unlock;
  1384=09
  1385		w->irqf |=3D (1UL << irq);
  1386=09
  1387		/*
  1388		 * Should be NULL since it's the first time that these
  1389		 * irq_{ip,stack}[irq] have ever set.
  1390		 */
  1391		DEPT_WARN_ON(w->irq_ip[irq]);
  1392		DEPT_WARN_ON(w->irq_stack[irq]);
  1393=09
  1394		w->irq_ip[irq] =3D w->wait_ip;
  1395		w->irq_stack[irq] =3D get_current_stack();
  1396=09
  1397		set_check_iwait(c, irq, w);
  1398	unlock:
  1399		dept_unlock();
  1400	}
  1401=09
  1402	static struct dept_wait_hist *hist(int pos)
  1403	{
  1404		struct dept_task *dt =3D dept_task();
  1405=09
  1406		return dt->wait_hist + (pos % DEPT_MAX_WAIT_HIST);
  1407	}
  1408=09
  1409	static int hist_pos_next(void)
  1410	{
  1411		struct dept_task *dt =3D dept_task();
  1412=09
  1413		return dt->wait_hist_pos % DEPT_MAX_WAIT_HIST;
  1414	}
  1415=09
  1416	static void hist_advance(void)
  1417	{
  1418		struct dept_task *dt =3D dept_task();
  1419=09
  1420		dt->wait_hist_pos++;
  1421		dt->wait_hist_pos %=3D DEPT_MAX_WAIT_HIST;
  1422	}
  1423=09
  1424	static struct dept_wait_hist *new_hist(void)
  1425	{
  1426		struct dept_wait_hist *wh =3D hist(hist_pos_next());
  1427=09
  1428		hist_advance();
  1429		return wh;
  1430	}
  1431=09
  1432	static void add_hist(struct dept_wait *w, unsigned int wg, unsigned =
int ctxt_id)
  1433	{
  1434		struct dept_wait_hist *wh =3D new_hist();
  1435=09
  1436		if (likely(wh->wait))
  1437			put_wait(wh->wait);
  1438=09
  1439		wh->wait =3D get_wait(w);
  1440		wh->wgen =3D wg;
  1441		wh->ctxt_id =3D ctxt_id;
  1442	}
  1443=09
  1444	/*
  1445	 * Should be called after setting up e's iecxt and w's iwait.
  1446	 */
  1447	static void add_dep(struct dept_ecxt *e, struct dept_wait *w)
  1448	{
  1449		struct dept_class *fc =3D e->class;
  1450		struct dept_class *tc =3D w->class;
  1451		struct dept_dep *d;
  1452		int i;
  1453=09
  1454		if (lookup_dep(fc, tc))
  1455			return;
  1456=09
  1457		if (unlikely(!dept_lock()))
  1458			return;
  1459=09
  1460		/*
  1461		 * __add_dep() will lookup_dep() again with lock held.
  1462		 */
  1463		d =3D __add_dep(e, w);
  1464		if (d) {
  1465			check_dl_bfs(d);
  1466=09
  1467			for (i =3D 0; i < DEPT_IRQS_NR; i++) {
  1468				struct dept_iwait *fiw =3D iwait(fc, i);
  1469				struct dept_iecxt *found_ie;
  1470				struct dept_iwait *found_iw;
  1471=09
  1472				/*
  1473				 * '->touched =3D=3D false' guarantees there's no
  1474				 * parent that has been set ->wait.
  1475				 */
  1476				if (!fiw->touched)
  1477					continue;
  1478=09
  1479				/*
  1480				 * find_iw_bfs() will untouch the iwait if
  1481				 * not found.
  1482				 */
  1483				found_iw =3D find_iw_bfs(fc, i);
  1484=09
  1485				if (!found_iw)
  1486					continue;
  1487=09
  1488				found_ie =3D touch_iw_find_ie_bfs(tc, i);
  1489				__add_idep(found_ie, found_iw);
  1490			}
  1491		}
  1492		dept_unlock();
  1493	}
  1494=09
  1495	static atomic_t wgen =3D ATOMIC_INIT(1);
  1496=09
  1497	static void add_wait(struct dept_class *c, unsigned long ip,
  1498			     const char *w_fn, int sub_l, bool sched_sleep)
  1499	{
  1500		struct dept_task *dt =3D dept_task();
  1501		struct dept_wait *w;
  1502		unsigned int wg =3D 0U;
  1503		int irq;
  1504		int i;
  1505=09
  1506		if (DEPT_WARN_ON(!valid_class(c)))
  1507			return;
  1508=09
  1509		w =3D new_wait();
  1510		if (unlikely(!w))
  1511			return;
  1512=09
  1513		WRITE_ONCE(w->class, get_class(c));
  1514		w->wait_ip =3D ip;
  1515		w->wait_fn =3D w_fn;
  1516		w->wait_stack =3D get_current_stack();
  1517		w->sched_sleep =3D sched_sleep;
  1518=09
  1519		irq =3D cur_irq();
  1520		if (irq < DEPT_IRQS_NR)
  1521			add_iwait(c, irq, w);
  1522=09
  1523		/*
  1524		 * Avoid adding dependency between user aware nested ecxt and
  1525		 * wait.
  1526		 */
  1527		for (i =3D dt->ecxt_held_pos - 1; i >=3D 0; i--) {
  1528			struct dept_ecxt_held *eh;
  1529=09
  1530			eh =3D dt->ecxt_held + i;
  1531=09
  1532			/*
  1533			 * the case of invalid key'ed one
  1534			 */
  1535			if (!eh->ecxt)
  1536				continue;
  1537=09
  1538			if (eh->ecxt->class !=3D c || eh->sub_l =3D=3D sub_l)
  1539				add_dep(eh->ecxt, w);
  1540		}
  1541=09
  1542		if (!wait_consumed(w) && !rich_stack) {
  1543			if (w->wait_stack)
  1544				put_stack(w->wait_stack);
  1545			w->wait_stack =3D NULL;
  1546		}
  1547=09
  1548		/*
  1549		 * Avoid zero wgen.
  1550		 */
  1551		wg =3D atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  1552		add_hist(w, wg, cur_ctxt_id());
  1553=09
  1554		del_wait(w);
  1555	}
  1556=09
  1557	static bool add_ecxt(struct dept_map *m, struct dept_class *c,
  1558			     unsigned long ip, const char *c_fn,
  1559			     const char *e_fn, int sub_l)
  1560	{
  1561		struct dept_task *dt =3D dept_task();
  1562		struct dept_ecxt_held *eh;
  1563		struct dept_ecxt *e;
  1564		unsigned long irqf;
  1565		int irq;
  1566=09
  1567		if (DEPT_WARN_ON(!valid_class(c)))
  1568			return false;
  1569=09
  1570		if (DEPT_WARN_ON_ONCE(dt->ecxt_held_pos >=3D DEPT_MAX_ECXT_HELD))
  1571			return false;
  1572=09
  1573		if (m->nocheck) {
  1574			eh =3D dt->ecxt_held + (dt->ecxt_held_pos++);
  1575			eh->ecxt =3D NULL;
  1576			eh->map =3D m;
  1577			eh->class =3D get_class(c);
  1578			eh->wgen =3D atomic_read(&wgen);
  1579			eh->sub_l =3D sub_l;
  1580=09
  1581			return true;
  1582		}
  1583=09
  1584		e =3D new_ecxt();
  1585		if (unlikely(!e))
  1586			return false;
  1587=09
  1588		e->class =3D get_class(c);
  1589		e->ecxt_ip =3D ip;
  1590		e->ecxt_stack =3D ip && rich_stack ? get_current_stack() : NULL;
  1591		e->event_fn =3D e_fn;
  1592		e->ecxt_fn =3D c_fn;
  1593=09
  1594		eh =3D dt->ecxt_held + (dt->ecxt_held_pos++);
  1595		eh->ecxt =3D get_ecxt(e);
  1596		eh->map =3D m;
  1597		eh->class =3D get_class(c);
  1598		eh->wgen =3D atomic_read(&wgen);
  1599		eh->sub_l =3D sub_l;
  1600=09
  1601		irqf =3D cur_enirqf();
  1602		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR)
  1603			add_iecxt(c, irq, e, false);
  1604=09
  1605		del_ecxt(e);
  1606		return true;
  1607	}
  1608=09
  1609	static int find_ecxt_pos(struct dept_map *m, struct dept_class *c,
  1610				 bool newfirst)
  1611	{
  1612		struct dept_task *dt =3D dept_task();
  1613		int i;
  1614=09
  1615		if (newfirst) {
  1616			for (i =3D dt->ecxt_held_pos - 1; i >=3D 0; i--) {
  1617				struct dept_ecxt_held *eh;
  1618=09
  1619				eh =3D dt->ecxt_held + i;
  1620				if (eh->map =3D=3D m && eh->class =3D=3D c)
  1621					return i;
  1622			}
  1623		} else {
  1624			for (i =3D 0; i < dt->ecxt_held_pos; i++) {
  1625				struct dept_ecxt_held *eh;
  1626=09
  1627				eh =3D dt->ecxt_held + i;
  1628				if (eh->map =3D=3D m && eh->class =3D=3D c)
  1629					return i;
  1630			}
  1631		}
  1632		return -1;
  1633	}
  1634=09
  1635	static bool pop_ecxt(struct dept_map *m, struct dept_class *c)
  1636	{
  1637		struct dept_task *dt =3D dept_task();
  1638		int pos;
  1639		int i;
  1640=09
  1641		pos =3D find_ecxt_pos(m, c, true);
  1642		if (pos =3D=3D -1)
  1643			return false;
  1644=09
  1645		if (dt->ecxt_held[pos].class)
  1646			put_class(dt->ecxt_held[pos].class);
  1647=09
  1648		if (dt->ecxt_held[pos].ecxt)
  1649			put_ecxt(dt->ecxt_held[pos].ecxt);
  1650=09
  1651		dt->ecxt_held_pos--;
  1652=09
  1653		for (i =3D pos; i < dt->ecxt_held_pos; i++)
  1654			dt->ecxt_held[i] =3D dt->ecxt_held[i + 1];
  1655		return true;
  1656	}
  1657=09
  1658	static bool good_hist(struct dept_wait_hist *wh, unsigned int wg)
  1659	{
  1660		return wh->wait !=3D NULL && before(wg, wh->wgen);
  1661	}
  1662=09
  1663	/*
  1664	 * Binary-search the ring buffer for the earliest valid wait.
  1665	 */
  1666	static int find_hist_pos(unsigned int wg)
  1667	{
  1668		int oldest;
  1669		int l;
  1670		int r;
  1671		int pos;
  1672=09
  1673		oldest =3D hist_pos_next();
  1674		if (unlikely(good_hist(hist(oldest), wg))) {
  1675			DEPT_INFO_ONCE("Need to expand the ring buffer.\n");
  1676			return oldest;
  1677		}
  1678=09
  1679		l =3D oldest + 1;
  1680		r =3D oldest + DEPT_MAX_WAIT_HIST - 1;
  1681		for (pos =3D (l + r) / 2; l <=3D r; pos =3D (l + r) / 2) {
  1682			struct dept_wait_hist *p =3D hist(pos - 1);
  1683			struct dept_wait_hist *wh =3D hist(pos);
  1684=09
  1685			if (!good_hist(p, wg) && good_hist(wh, wg))
  1686				return pos % DEPT_MAX_WAIT_HIST;
  1687			if (good_hist(wh, wg))
  1688				r =3D pos - 1;
  1689			else
  1690				l =3D pos + 1;
  1691		}
  1692		return -1;
  1693	}
  1694=09
  1695	static void do_event(struct dept_map *m, struct dept_class *c,
  1696			     unsigned int wg, unsigned long ip)
  1697	{
  1698		struct dept_task *dt =3D dept_task();
  1699		struct dept_wait_hist *wh;
  1700		struct dept_ecxt_held *eh;
  1701		unsigned int ctxt_id;
  1702		int end;
  1703		int pos;
  1704		int i;
  1705=09
  1706		if (DEPT_WARN_ON(!valid_class(c)))
  1707			return;
  1708=09
  1709		if (m->nocheck)
  1710			return;
  1711=09
  1712		/*
  1713		 * The event was triggered before wait.
  1714		 */
  1715		if (!wg)
  1716			return;
  1717=09
  1718		pos =3D find_ecxt_pos(m, c, false);
  1719		if (pos =3D=3D -1)
  1720			return;
  1721=09
  1722		eh =3D dt->ecxt_held + pos;
  1723=09
  1724		if (DEPT_WARN_ON(!eh->ecxt))
  1725			return;
  1726=09
  1727		eh->ecxt->event_ip =3D ip;
  1728		eh->ecxt->event_stack =3D get_current_stack();
  1729=09
  1730		/*
  1731		 * The ecxt already has done what it needs.
  1732		 */
  1733		if (!before(wg, eh->wgen))
  1734			return;
  1735=09
  1736		pos =3D find_hist_pos(wg);
  1737		if (pos =3D=3D -1)
  1738			return;
  1739=09
  1740		ctxt_id =3D cur_ctxt_id();
  1741		end =3D hist_pos_next();
  1742		end =3D end > pos ? end : end + DEPT_MAX_WAIT_HIST;
  1743		for (wh =3D hist(pos); pos < end; wh =3D hist(++pos)) {
  1744			if (after(wh->wgen, eh->wgen))
  1745				break;
  1746=09
  1747			if (dt->in_sched && wh->wait->sched_sleep)
  1748				continue;
  1749=09
  1750			if (wh->ctxt_id =3D=3D ctxt_id)
  1751				add_dep(eh->ecxt, wh->wait);
  1752		}
  1753=09
  1754		for (i =3D 0; i < DEPT_IRQS_NR; i++) {
  1755			struct dept_ecxt *e;
  1756=09
  1757			if (before(dt->wgen_enirq[i], wg))
  1758				continue;
  1759=09
  1760			e =3D eh->ecxt;
  1761			add_iecxt(e->class, i, e, false);
  1762		}
  1763	}
  1764=09
  1765	static void del_dep_rcu(struct rcu_head *rh)
  1766	{
  1767		struct dept_dep *d =3D container_of(rh, struct dept_dep, rh);
  1768=09
  1769		preempt_disable();
  1770		del_dep(d);
  1771		preempt_enable();
  1772	}
  1773=09
  1774	/*
  1775	 * NOTE: Must be called with dept_lock held.
  1776	 */
  1777	static void disconnect_class(struct dept_class *c)
  1778	{
  1779		struct dept_dep *d, *n;
  1780		int i;
  1781=09
  1782		list_for_each_entry_safe(d, n, &c->dep_head, dep_node) {
  1783			list_del_rcu(&d->dep_node);
  1784			list_del_rcu(&d->dep_rev_node);
  1785			hash_del_dep(d);
  1786			call_rcu(&d->rh, del_dep_rcu);
  1787		}
  1788=09
  1789		list_for_each_entry_safe(d, n, &c->dep_rev_head, dep_rev_node) {
  1790			list_del_rcu(&d->dep_node);
  1791			list_del_rcu(&d->dep_rev_node);
  1792			hash_del_dep(d);
  1793			call_rcu(&d->rh, del_dep_rcu);
  1794		}
  1795=09
  1796		for (i =3D 0; i < DEPT_IRQS_NR; i++) {
  1797			stale_iecxt(iecxt(c, i));
  1798			stale_iwait(iwait(c, i));
  1799		}
  1800	}
  1801=09
  1802	/*
  1803	 * Context control
  1804	 * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  1805	 * Whether a wait is in {hard,soft}-IRQ context or whether
  1806	 * {hard,soft}-IRQ has been enabled on the way to an event is very
  1807	 * important to check dependency. All those things should be tracked=
.
  1808	 */
  1809=09
  1810	static unsigned long cur_enirqf(void)
  1811	{
  1812		struct dept_task *dt =3D dept_task();
  1813		int he =3D dt->hardirqs_enabled;
  1814		int se =3D dt->softirqs_enabled;
  1815=09
  1816		if (he)
  1817			return DEPT_HIRQF | (se ? DEPT_SIRQF : 0UL);
  1818		return 0UL;
  1819	}
  1820=09
  1821	static int cur_irq(void)
  1822	{
  1823		if (lockdep_softirq_context(current))
  1824			return DEPT_SIRQ;
  1825		if (lockdep_hardirq_context())
  1826			return DEPT_HIRQ;
  1827		return DEPT_IRQS_NR;
  1828	}
  1829=09
  1830	static unsigned int cur_ctxt_id(void)
  1831	{
  1832		struct dept_task *dt =3D dept_task();
  1833		int irq =3D cur_irq();
  1834=09
  1835		/*
  1836		 * Normal process context
  1837		 */
  1838		if (irq =3D=3D DEPT_IRQS_NR)
  1839			return 0U;
  1840=09
  1841		return dt->irq_id[irq] | (1UL << irq);
  1842	}
  1843=09
  1844	static void enirq_transition(int irq)
  1845	{
  1846		struct dept_task *dt =3D dept_task();
  1847		int i;
  1848=09
  1849		/*
  1850		 * IRQ can cut in on the way to the event. Used for cross-event
  1851		 * detection.
  1852		 *
  1853		 *    wait context	event context(ecxt)
  1854		 *    ------------	-------------------
  1855		 *    wait event
  1856		 *       UPDATE wgen
  1857		 *			observe IRQ enabled
  1858		 *			   UPDATE wgen
  1859		 *			   keep the wgen locally
  1860		 *
  1861		 *			on the event
  1862		 *			   check the wgen kept
  1863		 */
  1864=09
  1865		/*
  1866		 * Avoid zero wgen.
  1867		 */
  1868		dt->wgen_enirq[irq] =3D atomic_inc_return(&wgen) ?:
  1869				      atomic_inc_return(&wgen);
  1870=09
  1871		for (i =3D dt->ecxt_held_pos - 1; i >=3D 0; i--) {
  1872			struct dept_ecxt_held *eh;
  1873			struct dept_ecxt *e;
  1874=09
  1875			eh =3D dt->ecxt_held + i;
  1876			e =3D eh->ecxt;
  1877			if (e)
  1878				add_iecxt(e->class, irq, e, true);
  1879		}
  1880	}
  1881=09
  1882	static void dept_enirq(unsigned long ip)
  1883	{
  1884		struct dept_task *dt =3D dept_task();
  1885		unsigned long irqf =3D cur_enirqf();
  1886		int irq;
  1887		unsigned long flags;
  1888=09
  1889		if (unlikely(!dept_working()))
  1890			return;
  1891=09
  1892		/*
  1893		 * IRQ ON/OFF transition might happen while Dept is working.
  1894		 * We cannot handle recursive entrance. Just ingnore it.
  1895		 * Only transitions outside of Dept will be considered.
  1896		 */
  1897		if (dt->recursive)
  1898			return;
  1899=09
  1900		flags =3D dept_enter();
  1901=09
  1902		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
  1903			dt->enirq_ip[irq] =3D ip;
  1904			enirq_transition(irq);
  1905		}
  1906=09
  1907		dept_exit(flags);
  1908	}
  1909=09
  1910	void dept_softirqs_on_ip(unsigned long ip)
  1911	{
  1912		/*
  1913		 * Assumes that it's called with IRQ disabled so that accessing
  1914		 * current's fields is not racy.
  1915		 */
  1916		dept_task()->softirqs_enabled =3D true;
  1917		dept_enirq(ip);
  1918	}
  1919=09
  1920	void dept_hardirqs_on(void)
  1921	{
  1922		/*
  1923		 * Assumes that it's called with IRQ disabled so that accessing
  1924		 * current's fields is not racy.
  1925		 */
  1926		dept_task()->hardirqs_enabled =3D true;
  1927		dept_enirq(_RET_IP_);
  1928	}
  1929=09
  1930	void dept_softirqs_off(void)
  1931	{
  1932		/*
  1933		 * Assumes that it's called with IRQ disabled so that accessing
  1934		 * current's fields is not racy.
  1935		 */
  1936		dept_task()->softirqs_enabled =3D false;
  1937	}
  1938=09
  1939	void dept_hardirqs_off(void)
  1940	{
  1941		/*
  1942		 * Assumes that it's called with IRQ disabled so that accessing
  1943		 * current's fields is not racy.
  1944		 */
  1945		dept_task()->hardirqs_enabled =3D false;
  1946	}
  1947=09
  1948	/*
  1949	 * Ensure it's the outmost softirq context.
  1950	 */
  1951	void dept_softirq_enter(void)
  1952	{
  1953		struct dept_task *dt =3D dept_task();
  1954=09
  1955		dt->irq_id[DEPT_SIRQ] +=3D 1UL << DEPT_IRQS_NR;
  1956	}
  1957=09
  1958	/*
  1959	 * Ensure it's the outmost hardirq context.
  1960	 */
  1961	void dept_hardirq_enter(void)
  1962	{
  1963		struct dept_task *dt =3D dept_task();
  1964=09
  1965		dt->irq_id[DEPT_HIRQ] +=3D 1UL << DEPT_IRQS_NR;
  1966	}
  1967=09
  1968	void dept_sched_enter(void)
  1969	{
  1970		dept_task()->in_sched =3D true;
  1971	}
  1972=09
  1973	void dept_sched_exit(void)
  1974	{
  1975		dept_task()->in_sched =3D false;
  1976	}
  1977=09
  1978	/*
  1979	 * Exposed APIs
  1980	 * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  1981	 */
  1982=09
  1983	static void clean_classes_cache(struct dept_key *k)
  1984	{
  1985		int i;
  1986=09
  1987		for (i =3D 0; i < DEPT_MAX_SUBCLASSES_CACHE; i++) {
  1988			if (!READ_ONCE(k->classes[i]))
  1989				continue;
  1990=09
  1991			WRITE_ONCE(k->classes[i], NULL);
  1992		}
  1993	}
  1994=09
  1995	void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u=
,
  1996			   const char *n)
  1997	{
  1998		unsigned long flags;
  1999=09
  2000		if (unlikely(!dept_working())) {
  2001			m->nocheck =3D true;
  2002			return;
  2003		}
  2004=09
  2005		if (DEPT_WARN_ON(sub_u < 0)) {
  2006			m->nocheck =3D true;
  2007			return;
  2008		}
  2009=09
  2010		if (DEPT_WARN_ON(sub_u >=3D DEPT_MAX_SUBCLASSES_USR)) {
  2011			m->nocheck =3D true;
  2012			return;
  2013		}
  2014=09
  2015		/*
  2016		 * Allow recursive entrance.
  2017		 */
  2018		flags =3D dept_enter_recursive();
  2019=09
  2020		clean_classes_cache(&m->map_key);
  2021=09
  2022		m->keys =3D k;
  2023		m->sub_u =3D sub_u;
  2024		m->name =3D n;
  2025		m->wgen =3D 0U;
  2026		m->nocheck =3D !valid_key(k);
  2027=09
  2028		dept_exit_recursive(flags);
  2029	}
  2030	EXPORT_SYMBOL_GPL(dept_map_init);
  2031=09
  2032	void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub=
_u,
  2033			     const char *n)
  2034	{
  2035		unsigned long flags;
  2036=09
  2037		if (unlikely(!dept_working())) {
  2038			m->nocheck =3D true;
  2039			return;
  2040		}
  2041=09
  2042		/*
  2043		 * Allow recursive entrance.
  2044		 */
  2045		flags =3D dept_enter_recursive();
  2046=09
  2047		if (k) {
  2048			clean_classes_cache(&m->map_key);
  2049			m->keys =3D k;
  2050			m->nocheck =3D !valid_key(k);
  2051		}
  2052=09
  2053		if (sub_u >=3D 0 && sub_u < DEPT_MAX_SUBCLASSES_USR)
  2054			m->sub_u =3D sub_u;
  2055=09
  2056		if (n)
  2057			m->name =3D n;
  2058=09
  2059		m->wgen =3D 0U;
  2060=09
  2061		dept_exit_recursive(flags);
  2062	}
  2063	EXPORT_SYMBOL_GPL(dept_map_reinit);
  2064=09
  2065	void dept_map_copy(struct dept_map *to, struct dept_map *from)
  2066	{
  2067		if (unlikely(!dept_working())) {
  2068			to->nocheck =3D true;
  2069			return;
  2070		}
  2071=09
  2072		*to =3D *from;
  2073=09
  2074		/*
  2075		 * XXX: 'to' might be in a stack or something. Using the address
  2076		 * in a stack segment as a key is meaningless. Just ignore the
  2077		 * case for now.
  2078		 */
  2079		if (!to->keys) {
  2080			to->nocheck =3D true;
  2081			return;
  2082		}
  2083=09
  2084		/*
  2085		 * Since the class cache can be modified concurrently we could
  2086		 * observe half pointers (64bit arch using 32bit copy insns).
  2087		 * Therefore clear the caches and take the performance hit.
  2088		 *
  2089		 * XXX: Doesn't work well with lockdep_set_class_and_subclass()
  2090		 *      since that relies on cache abuse.
  2091		 */
  2092		clean_classes_cache(&to->map_key);
  2093	}
  2094=09
  2095	static LIST_HEAD(classes);
  2096=09
  2097	static bool within(const void *addr, void *start, unsigned long size=
)
  2098	{
  2099		return addr >=3D start && addr < start + size;
  2100	}
  2101=09
  2102	void dept_free_range(void *start, unsigned int sz)
  2103	{
  2104		struct dept_task *dt =3D dept_task();
  2105		struct dept_class *c, *n;
  2106		unsigned long flags;
  2107=09
  2108		if (unlikely(!dept_working()))
  2109			return;
  2110=09
  2111		if (dt->recursive) {
  2112			DEPT_STOP("Failed to successfully free Dept objects.\n");
  2113			return;
  2114		}
  2115=09
  2116		flags =3D dept_enter();
  2117=09
  2118		/*
  2119		 * dept_free_range() should not fail.
  2120		 *
  2121		 * FIXME: Should be fixed if dept_free_range() causes deadlock
  2122		 * with dept_lock().
  2123		 */
  2124		while (unlikely(!dept_lock()))
  2125			cpu_relax();
  2126=09
  2127		list_for_each_entry_safe(c, n, &classes, all_node) {
  2128			if (!within((void *)c->key, start, sz) &&
  2129			    !within(c->name, start, sz))
  2130				continue;
  2131=09
  2132			hash_del_class(c);
  2133			disconnect_class(c);
  2134			list_del(&c->all_node);
  2135			invalidate_class(c);
  2136=09
  2137			/*
  2138			 * Actual deletion will happen on the rcu callback
  2139			 * that has been added in disconnect_class().
  2140			 */
  2141			del_class(c);
  2142		}
  2143		dept_unlock();
  2144		dept_exit(flags);
  2145=09
  2146		/*
  2147		 * Wait until even lockless hash_lookup_class() for the class
  2148		 * returns NULL.
  2149		 */
  2150		might_sleep();
  2151		synchronize_rcu();
  2152	}
  2153=09
  2154	static int sub_id(struct dept_map *m, int e)
  2155	{
  2156		return (m ? m->sub_u : 0) + e * DEPT_MAX_SUBCLASSES_USR;
  2157	}
  2158=09
  2159	static struct dept_class *check_new_class(struct dept_key *local,
  2160						  struct dept_key *k, int sub_id,
  2161						  const char *n, bool sched_map)
  2162	{
  2163		struct dept_class *c =3D NULL;
  2164=09
  2165		if (DEPT_WARN_ON(sub_id >=3D DEPT_MAX_SUBCLASSES))
  2166			return NULL;
  2167=09
  2168		if (DEPT_WARN_ON(!k))
  2169			return NULL;
  2170=09
  2171		/*
  2172		 * XXX: Assume that users prevent the map from using if any of
  2173		 * the cached keys has been invalidated. If not, the cache,
  2174		 * local->classes should not be used because it would be racy
  2175		 * with class deletion.
  2176		 */
  2177		if (local && sub_id < DEPT_MAX_SUBCLASSES_CACHE)
  2178			c =3D READ_ONCE(local->classes[sub_id]);
  2179=09
  2180		if (c)
  2181			return c;
  2182=09
  2183		c =3D lookup_class((unsigned long)k->base + sub_id);
  2184		if (c)
  2185			goto caching;
  2186=09
  2187		if (unlikely(!dept_lock()))
  2188			return NULL;
  2189=09
  2190		c =3D lookup_class((unsigned long)k->base + sub_id);
  2191		if (unlikely(c))
  2192			goto unlock;
  2193=09
  2194		c =3D new_class();
  2195		if (unlikely(!c))
  2196			goto unlock;
  2197=09
  2198		c->name =3D n;
  2199		c->sched_map =3D sched_map;
  2200		c->sub_id =3D sub_id;
  2201		c->key =3D (unsigned long)(k->base + sub_id);
  2202		hash_add_class(c);
  2203		list_add(&c->all_node, &classes);
  2204	unlock:
  2205		dept_unlock();
  2206	caching:
  2207		if (local && sub_id < DEPT_MAX_SUBCLASSES_CACHE)
  2208			WRITE_ONCE(local->classes[sub_id], c);
  2209=09
  2210		return c;
  2211	}
  2212=09
  2213	/*
  2214	 * Called between dept_enter() and dept_exit().
  2215	 */
  2216	static void __dept_wait(struct dept_map *m, unsigned long w_f,
  2217				unsigned long ip, const char *w_fn, int sub_l,
  2218				bool sched_sleep, bool sched_map)
  2219	{
  2220		int e;
  2221=09
  2222		/*
  2223		 * Be as conservative as possible. In case of mulitple waits for
  2224		 * a single dept_map, we are going to keep only the last wait's
  2225		 * wgen for simplicity - keeping all wgens seems overengineering.
  2226		 *
  2227		 * Of course, it might cause missing some dependencies that
  2228		 * would rarely, probabily never, happen but it helps avoid
  2229		 * false positive report.
  2230		 */
  2231		for_each_set_bit(e, &w_f, DEPT_MAX_SUBCLASSES_EVT) {
  2232			struct dept_class *c;
  2233			struct dept_key *k;
  2234=09
  2235			k =3D m->keys ?: &m->map_key;
  2236			c =3D check_new_class(&m->map_key, k,
  2237					    sub_id(m, e), m->name, sched_map);
  2238			if (!c)
  2239				continue;
  2240=09
  2241			add_wait(c, ip, w_fn, sub_l, sched_sleep);
  2242		}
  2243	}
  2244=09
  2245	/*
  2246	 * Called between dept_enter() and dept_exit().
  2247	 */
  2248	static void __dept_event(struct dept_map *m, unsigned long e_f,
  2249				 unsigned long ip, const char *e_fn,
  2250				 bool sched_map)
  2251	{
  2252		struct dept_class *c;
  2253		struct dept_key *k;
  2254		int e;
  2255=09
  2256		e =3D find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
  2257=09
  2258		if (DEPT_WARN_ON(e >=3D DEPT_MAX_SUBCLASSES_EVT))
  2259			return;
  2260=09
  2261		/*
  2262		 * An event is an event. If the caller passed more than single
  2263		 * event, then warn it and handle the event corresponding to
  2264		 * the first bit anyway.
  2265		 */
  2266		DEPT_WARN_ON(1UL << e !=3D e_f);
  2267=09
  2268		k =3D m->keys ?: &m->map_key;
  2269		c =3D check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_=
map);
  2270=09
  2271		if (c && add_ecxt(m, c, 0UL, NULL, e_fn, 0)) {
  2272			do_event(m, c, READ_ONCE(m->wgen), ip);
  2273			pop_ecxt(m, c);
  2274		}
  2275	}
  2276=09
  2277	void dept_wait(struct dept_map *m, unsigned long w_f,
  2278		       unsigned long ip, const char *w_fn, int sub_l)
  2279	{
  2280		struct dept_task *dt =3D dept_task();
  2281		unsigned long flags;
  2282=09
  2283		if (unlikely(!dept_working()))
  2284			return;
  2285=09
  2286		if (dt->recursive)
  2287			return;
  2288=09
  2289		if (m->nocheck)
  2290			return;
  2291=09
  2292		flags =3D dept_enter();
  2293=09
  2294		__dept_wait(m, w_f, ip, w_fn, sub_l, false, false);
  2295=09
  2296		dept_exit(flags);
  2297	}
  2298	EXPORT_SYMBOL_GPL(dept_wait);
  2299=09
  2300	void dept_stage_wait(struct dept_map *m, struct dept_key *k,
  2301			     unsigned long ip, const char *w_fn)
  2302	{
  2303		struct dept_task *dt =3D dept_task();
  2304		unsigned long flags;
  2305=09
  2306		if (unlikely(!dept_working()))
  2307			return;
  2308=09
  2309		if (m && m->nocheck)
  2310			return;
  2311=09
  2312		/*
  2313		 * Either m or k should be passed. Which means Dept relies on
  2314		 * either its own map or the caller's position in the code when
  2315		 * determining its class.
  2316		 */
  2317		if (DEPT_WARN_ON(!m && !k))
  2318			return;
  2319=09
  2320		/*
  2321		 * Allow recursive entrance.
  2322		 */
  2323		flags =3D dept_enter_recursive();
  2324=09
  2325		/*
  2326		 * Ensure the outmost dept_stage_wait() works.
  2327		 */
  2328		if (dt->stage_m.keys)
  2329			goto exit;
  2330=09
  2331		if (m) {
  2332			dt->stage_m =3D *m;
  2333=09
  2334			/*
  2335			 * Ensure dt->stage_m.keys !=3D NULL and it works with the
  2336			 * map's map_key, not stage_m's one when ->keys =3D=3D NULL.
  2337			 */
  2338			if (!m->keys)
  2339				dt->stage_m.keys =3D &m->map_key;
  2340		} else {
  2341			dt->stage_m.name =3D w_fn;
  2342			dt->stage_sched_map =3D true;
  2343		}
  2344=09
  2345		/*
  2346		 * dept_map_reinit() includes WRITE_ONCE(->wgen, 0U) that
  2347		 * effectively disables the map just in case real sleep won't
  2348		 * happen. dept_request_event_wait_commit() will enable it.
  2349		 */
  2350		dept_map_reinit(&dt->stage_m, k, -1, NULL);
  2351=09
  2352		dt->stage_w_fn =3D w_fn;
  2353		dt->stage_ip =3D ip;
  2354	exit:
  2355		dept_exit_recursive(flags);
  2356	}
  2357	EXPORT_SYMBOL_GPL(dept_stage_wait);
  2358=09
  2359	static void __dept_clean_stage(struct dept_task *dt)
  2360	{
  2361		memset(&dt->stage_m, 0x0, sizeof(struct dept_map));
  2362		dt->stage_sched_map =3D false;
  2363		dt->stage_w_fn =3D NULL;
  2364		dt->stage_ip =3D 0UL;
  2365	}
  2366=09
  2367	void dept_clean_stage(void)
  2368	{
  2369		struct dept_task *dt =3D dept_task();
  2370		unsigned long flags;
  2371=09
  2372		if (unlikely(!dept_working()))
  2373			return;
  2374=09
  2375		/*
  2376		 * Allow recursive entrance.
  2377		 */
  2378		flags =3D dept_enter_recursive();
  2379		__dept_clean_stage(dt);
  2380		dept_exit_recursive(flags);
  2381	}
  2382	EXPORT_SYMBOL_GPL(dept_clean_stage);
  2383=09
  2384	/*
  2385	 * Always called from __schedule().
  2386	 */
  2387	void dept_request_event_wait_commit(void)
  2388	{
  2389		struct dept_task *dt =3D dept_task();
  2390		unsigned long flags;
  2391		unsigned int wg;
  2392		unsigned long ip;
  2393		const char *w_fn;
  2394		bool sched_map;
  2395=09
  2396		if (unlikely(!dept_working()))
  2397			return;
  2398=09
  2399		/*
  2400		 * It's impossible that __schedule() is called while Dept is
  2401		 * working that already disabled IRQ at the entrance.
  2402		 */
  2403		if (DEPT_WARN_ON(dt->recursive))
  2404			return;
  2405=09
  2406		flags =3D dept_enter();
  2407=09
  2408		/*
  2409		 * Checks if current has staged a wait.
  2410		 */
  2411		if (!dt->stage_m.keys)
  2412			goto exit;
  2413=09
  2414		w_fn =3D dt->stage_w_fn;
  2415		ip =3D dt->stage_ip;
  2416		sched_map =3D dt->stage_sched_map;
  2417=09
  2418		/*
  2419		 * Avoid zero wgen.
  2420		 */
  2421		wg =3D atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  2422		WRITE_ONCE(dt->stage_m.wgen, wg);
  2423=09
  2424		__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map);
  2425	exit:
  2426		dept_exit(flags);
  2427	}
  2428=09
  2429	/*
  2430	 * Always called from try_to_wake_up().
  2431	 */
  2432	void dept_stage_event(struct task_struct *requestor, unsigned long i=
p)
  2433	{
  2434		struct dept_task *dt =3D dept_task();
  2435		struct dept_task *dt_req =3D &requestor->dept_task;
  2436		unsigned long flags;
  2437		struct dept_map m;
  2438		bool sched_map;
  2439=09
  2440		if (unlikely(!dept_working()))
  2441			return;
  2442=09
  2443		if (dt->recursive)
  2444			return;
  2445=09
  2446		flags =3D dept_enter();
  2447=09
  2448		/*
  2449		 * Serializing is unnecessary as long as it always comes from
  2450		 * try_to_wake_up().
  2451		 */
  2452		m =3D dt_req->stage_m;
  2453		sched_map =3D dt_req->stage_sched_map;
  2454		__dept_clean_stage(dt_req);
  2455=09
  2456		/*
  2457		 * ->stage_m.keys should not be NULL if it's in use. Should
  2458		 * make sure that it's not NULL when staging a valid map.
  2459		 */
  2460		if (!m.keys)
  2461			goto exit;
  2462=09
  2463		__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map);
  2464	exit:
  2465		dept_exit(flags);
  2466	}
  2467=09
  2468	/*
  2469	 * Modifies the latest ecxt corresponding to m and e_f.
  2470	 */
  2471	void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f,
  2472				  struct dept_key *new_k, unsigned long new_e_f,
  2473				  unsigned long new_ip, const char *new_c_fn,
  2474				  const char *new_e_fn, int new_sub_l)
  2475	{
  2476		struct dept_task *dt =3D dept_task();
  2477		struct dept_ecxt_held *eh;
  2478		struct dept_class *c;
  2479		struct dept_key *k;
  2480		unsigned long flags;
  2481		int pos =3D -1;
  2482		int new_e;
  2483		int e;
  2484=09
  2485		if (unlikely(!dept_working()))
  2486			return;
  2487=09
  2488		/*
  2489		 * XXX: Couldn't handle re-enterance cases. Ingore it for now.
  2490		 */
  2491		if (dt->recursive)
  2492			return;
  2493=09
  2494		/*
  2495		 * Should go ahead no matter whether ->nocheck =3D=3D true or not
  2496		 * because ->nocheck value can be changed within the ecxt area
  2497		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2498		 */
  2499=09
  2500		flags =3D dept_enter();
  2501=09
  2502		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2503			k =3D m->keys ?: &m->map_key;
  2504			c =3D check_new_class(&m->map_key, k,
  2505					    sub_id(m, e), m->name, false);
  2506			if (!c)
  2507				continue;
  2508=09
  2509			/*
  2510			 * When it found an ecxt for any event in e_f, done.
  2511			 */
  2512			pos =3D find_ecxt_pos(m, c, true);
  2513			if (pos !=3D -1)
  2514				break;
  2515		}
  2516=09
  2517		if (unlikely(pos =3D=3D -1))
  2518			goto exit;
  2519=09
  2520		eh =3D dt->ecxt_held + pos;
  2521		new_sub_l =3D new_sub_l >=3D 0 ? new_sub_l : eh->sub_l;
  2522=09
  2523		new_e =3D find_first_bit(&new_e_f, DEPT_MAX_SUBCLASSES_EVT);
  2524=09
  2525		if (new_e < DEPT_MAX_SUBCLASSES_EVT)
  2526			/*
  2527			 * Let it work with the first bit anyway.
  2528			 */
  2529			DEPT_WARN_ON(1UL << new_e !=3D new_e_f);
  2530		else
  2531			new_e =3D e;
  2532=09
  2533		pop_ecxt(m, c);
  2534=09
  2535		/*
  2536		 * Apply the key to the map.
  2537		 */
  2538		if (new_k)
  2539			dept_map_reinit(m, new_k, -1, NULL);
  2540=09
  2541		k =3D m->keys ?: &m->map_key;
  2542		c =3D check_new_class(&m->map_key, k, sub_id(m, new_e), m->name, fa=
lse);
  2543=09
  2544		if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l))
  2545			goto exit;
  2546=09
  2547		/*
  2548		 * Successfully pop_ecxt()ed but failed to add_ecxt().
  2549		 */
  2550		dt->missing_ecxt++;
  2551	exit:
  2552		dept_exit(flags);
  2553	}
  2554	EXPORT_SYMBOL_GPL(dept_map_ecxt_modify);
  2555=09
  2556	void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned=
 long ip,
  2557			     const char *c_fn, const char *e_fn, int sub_l)
  2558	{
  2559		struct dept_task *dt =3D dept_task();
  2560		unsigned long flags;
  2561		struct dept_class *c;
  2562		struct dept_key *k;
  2563		int e;
  2564=09
  2565		if (unlikely(!dept_working()))
  2566			return;
  2567=09
  2568		if (dt->recursive) {
  2569			dt->missing_ecxt++;
  2570			return;
  2571		}
  2572=09
  2573		/*
  2574		 * Should go ahead no matter whether ->nocheck =3D=3D true or not
  2575		 * because ->nocheck value can be changed within the ecxt area
  2576		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2577		 */
  2578=09
  2579		flags =3D dept_enter();
  2580=09
  2581		e =3D find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
  2582=09
  2583		if (e >=3D DEPT_MAX_SUBCLASSES_EVT)
  2584			goto missing_ecxt;
  2585=09
  2586		/*
  2587		 * An event is an event. If the caller passed more than single
  2588		 * event, then warn it and handle the event corresponding to
  2589		 * the first bit anyway.
  2590		 */
  2591		DEPT_WARN_ON(1UL << e !=3D e_f);
  2592=09
  2593		k =3D m->keys ?: &m->map_key;
  2594		c =3D check_new_class(&m->map_key, k, sub_id(m, e), m->name, false)=
;
  2595=09
  2596		if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l))
  2597			goto exit;
  2598	missing_ecxt:
  2599		dt->missing_ecxt++;
  2600	exit:
  2601		dept_exit(flags);
  2602	}
  2603	EXPORT_SYMBOL_GPL(dept_ecxt_enter);
  2604=09
  2605	bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f)
  2606	{
  2607		struct dept_task *dt =3D dept_task();
  2608		unsigned long flags;
  2609		bool ret =3D false;
  2610		int e;
  2611=09
  2612		if (unlikely(!dept_working()))
  2613			return false;
  2614=09
  2615		if (dt->recursive)
  2616			return false;
  2617=09
  2618		flags =3D dept_enter();
  2619=09
  2620		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2621			struct dept_class *c;
  2622			struct dept_key *k;
  2623=09
  2624			k =3D m->keys ?: &m->map_key;
  2625			c =3D check_new_class(&m->map_key, k,
  2626					    sub_id(m, e), m->name, false);
  2627			if (!c)
  2628				continue;
  2629=09
  2630			if (find_ecxt_pos(m, c, true) !=3D -1) {
  2631				ret =3D true;
  2632				break;
  2633			}
  2634		}
  2635=09
  2636		dept_exit(flags);
  2637=09
  2638		return ret;
  2639	}
  2640	EXPORT_SYMBOL_GPL(dept_ecxt_holding);
  2641=09
  2642	void dept_request_event(struct dept_map *m)
  2643	{
  2644		unsigned long flags;
  2645		unsigned int wg;
  2646=09
  2647		if (unlikely(!dept_working()))
  2648			return;
  2649=09
  2650		if (m->nocheck)
  2651			return;
  2652=09
  2653		/*
  2654		 * Allow recursive entrance.
  2655		 */
  2656		flags =3D dept_enter_recursive();
  2657=09
  2658		/*
  2659		 * Avoid zero wgen.
  2660		 */
  2661		wg =3D atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  2662		WRITE_ONCE(m->wgen, wg);
  2663=09
  2664		dept_exit_recursive(flags);
  2665	}
  2666	EXPORT_SYMBOL_GPL(dept_request_event);
  2667=09
  2668	void dept_event(struct dept_map *m, unsigned long e_f,
  2669			unsigned long ip, const char *e_fn)
  2670	{
  2671		struct dept_task *dt =3D dept_task();
  2672		unsigned long flags;
  2673=09
  2674		if (unlikely(!dept_working()))
  2675			return;
  2676=09
  2677		if (m->nocheck)
  2678			return;
  2679=09
  2680		if (dt->recursive) {
  2681			/*
  2682			 * Dept won't work with this even though an event
  2683			 * context has been asked. Don't make it confused at
  2684			 * handling the event. Disable it until the next.
  2685			 */
  2686			WRITE_ONCE(m->wgen, 0U);
  2687			return;
  2688		}
  2689=09
  2690		flags =3D dept_enter();
  2691=09
  2692		__dept_event(m, e_f, ip, e_fn, false);
  2693=09
  2694		/*
  2695		 * Keep the map diabled until the next sleep.
  2696		 */
  2697		WRITE_ONCE(m->wgen, 0U);
  2698=09
  2699		dept_exit(flags);
  2700	}
  2701	EXPORT_SYMBOL_GPL(dept_event);
  2702=09
  2703	void dept_ecxt_exit(struct dept_map *m, unsigned long e_f,
  2704			    unsigned long ip)
  2705	{
  2706		struct dept_task *dt =3D dept_task();
  2707		unsigned long flags;
  2708		int e;
  2709=09
  2710		if (unlikely(!dept_working()))
  2711			return;
  2712=09
  2713		if (dt->recursive) {
  2714			dt->missing_ecxt--;
  2715			return;
  2716		}
  2717=09
  2718		/*
  2719		 * Should go ahead no matter whether ->nocheck =3D=3D true or not
  2720		 * because ->nocheck value can be changed within the ecxt area
  2721		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2722		 */
  2723=09
  2724		flags =3D dept_enter();
  2725=09
  2726		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2727			struct dept_class *c;
  2728			struct dept_key *k;
  2729=09
  2730			k =3D m->keys ?: &m->map_key;
  2731			c =3D check_new_class(&m->map_key, k,
  2732					    sub_id(m, e), m->name, false);
  2733			if (!c)
  2734				continue;
  2735=09
  2736			/*
  2737			 * When it found an ecxt for any event in e_f, done.
  2738			 */
  2739			if (pop_ecxt(m, c))
  2740				goto exit;
  2741		}
  2742=09
  2743		dt->missing_ecxt--;
  2744	exit:
  2745		dept_exit(flags);
  2746	}
  2747	EXPORT_SYMBOL_GPL(dept_ecxt_exit);
  2748=09
  2749	void dept_task_exit(struct task_struct *t)
  2750	{
  2751		struct dept_task *dt =3D &t->dept_task;
  2752		int i;
  2753=09
  2754		if (unlikely(!dept_working()))
  2755			return;
  2756=09
  2757		raw_local_irq_disable();
  2758=09
  2759		if (dt->stack)
  2760			put_stack(dt->stack);
  2761=09
  2762		for (i =3D 0; i < dt->ecxt_held_pos; i++) {
  2763			if (dt->ecxt_held[i].class)
  2764				put_class(dt->ecxt_held[i].class);
  2765			if (dt->ecxt_held[i].ecxt)
  2766				put_ecxt(dt->ecxt_held[i].ecxt);
  2767		}
  2768=09
  2769		for (i =3D 0; i < DEPT_MAX_WAIT_HIST; i++)
  2770			if (dt->wait_hist[i].wait)
  2771				put_wait(dt->wait_hist[i].wait);
  2772=09
  2773		dt->task_exit =3D true;
  2774		dept_off();
  2775=09
  2776		raw_local_irq_enable();
  2777	}
  2778=09
  2779	void dept_task_init(struct task_struct *t)
  2780	{
  2781		memset(&t->dept_task, 0x0, sizeof(struct dept_task));
  2782	}
  2783=09
  2784	void dept_key_init(struct dept_key *k)
  2785	{
  2786		struct dept_task *dt =3D dept_task();
  2787		unsigned long flags;
  2788		int sub_id;
  2789=09
  2790		if (unlikely(!dept_working()))
  2791			return;
  2792=09
  2793		if (dt->recursive) {
  2794			DEPT_STOP("Key initialization fails.\n");
  2795			return;
  2796		}
  2797=09
  2798		flags =3D dept_enter();
  2799=09
  2800		clean_classes_cache(k);
  2801=09
  2802		/*
  2803		 * dept_key_init() should not fail.
  2804		 *
  2805		 * FIXME: Should be fixed if dept_key_init() causes deadlock
  2806		 * with dept_lock().
  2807		 */
  2808		while (unlikely(!dept_lock()))
  2809			cpu_relax();
  2810=09
  2811		for (sub_id =3D 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
  2812			struct dept_class *c;
  2813=09
  2814			c =3D lookup_class((unsigned long)k->base + sub_id);
  2815			if (!c)
  2816				continue;
  2817=09
  2818			DEPT_STOP("The class(%s/%d) has not been removed.\n",
  2819				  c->name, sub_id);
  2820			break;
  2821		}
  2822=09
  2823		dept_unlock();
  2824		dept_exit(flags);
  2825	}
  2826	EXPORT_SYMBOL_GPL(dept_key_init);
  2827=09
  2828	void dept_key_destroy(struct dept_key *k)
  2829	{
  2830		struct dept_task *dt =3D dept_task();
  2831		unsigned long flags;
  2832		int sub_id;
  2833=09
  2834		if (unlikely(!dept_working()))
  2835			return;
  2836=09
  2837		if (dt->recursive =3D=3D 1 && dt->task_exit) {
  2838			/*
  2839			 * Need to allow to go ahead in this case where
  2840			 * ->recursive has been set to 1 by dept_off() in
  2841			 * dept_task_exit() and ->task_exit has been set to
  2842			 * true in dept_task_exit().
  2843			 */
  2844		} else if (dt->recursive) {
  2845			DEPT_STOP("Key destroying fails.\n");
  2846			return;
  2847		}
  2848=09
  2849		flags =3D dept_enter();
  2850=09
  2851		/*
  2852		 * dept_key_destroy() should not fail.
  2853		 *
  2854		 * FIXME: Should be fixed if dept_key_destroy() causes deadlock
  2855		 * with dept_lock().
  2856		 */
  2857		while (unlikely(!dept_lock()))
  2858			cpu_relax();
  2859=09
  2860		for (sub_id =3D 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
  2861			struct dept_class *c;
  2862=09
  2863			c =3D lookup_class((unsigned long)k->base + sub_id);
  2864			if (!c)
  2865				continue;
  2866=09
  2867			hash_del_class(c);
  2868			disconnect_class(c);
  2869			list_del(&c->all_node);
  2870			invalidate_class(c);
  2871=09
  2872			/*
  2873			 * Actual deletion will happen on the rcu callback
  2874			 * that has been added in disconnect_class().
  2875			 */
  2876			del_class(c);
  2877		}
  2878=09
  2879		dept_unlock();
  2880		dept_exit(flags);
  2881=09
  2882		/*
  2883		 * Wait until even lockless hash_lookup_class() for the class
  2884		 * returns NULL.
  2885		 */
  2886		might_sleep();
  2887		synchronize_rcu();
  2888	}
  2889	EXPORT_SYMBOL_GPL(dept_key_destroy);
  2890=09
  2891	static void move_llist(struct llist_head *to, struct llist_head *fro=
m)
  2892	{
  2893		struct llist_node *first =3D llist_del_all(from);
  2894		struct llist_node *last;
  2895=09
  2896		if (!first)
  2897			return;
  2898=09
  2899		for (last =3D first; last->next; last =3D last->next);
  2900		llist_add_batch(first, last, to);
  2901	}
  2902=09
  2903	static void migrate_per_cpu_pool(void)
  2904	{
  2905		const int boot_cpu =3D 0;
  2906		int i;
  2907=09
  2908		/*
  2909		 * The boot CPU has been using the temperal local pool so far.
  2910		 * From now on that per_cpu areas have been ready, use the
  2911		 * per_cpu local pool instead.
  2912		 */
  2913		DEPT_WARN_ON(smp_processor_id() !=3D boot_cpu);
  2914		for (i =3D 0; i < OBJECT_NR; i++) {
  2915			struct llist_head *from;
  2916			struct llist_head *to;
  2917=09
  2918			from =3D &pool[i].boot_pool;
  2919			to =3D per_cpu_ptr(pool[i].lpool, boot_cpu);
  2920			move_llist(to, from);
  2921		}
  2922	}
  2923=09
  2924	#define B2KB(B) ((B) / 1024)
  2925=09
  2926	/*
  2927	 * Should be called after setup_per_cpu_areas() and before no non-bo=
ot
  2928	 * CPUs have been on.
  2929	 */
  2930	void __init dept_init(void)
  2931	{
  2932		size_t mem_total =3D 0;
  2933=09
  2934		local_irq_disable();
  2935		dept_per_cpu_ready =3D 1;
  2936		migrate_per_cpu_pool();
  2937		local_irq_enable();
  2938=09
  2939	#define HASH(id, bits) BUILD_BUG_ON(1 << (bits) <=3D 0);
> 2940		#include "dept_hash.h"
  2941	#undef  HASH
  2942	#define OBJECT(id, nr) mem_total +=3D sizeof(struct dept_##id) * nr;
  2943		#include "dept_object.h"
  2944	#undef  OBJECT
  2945	#define HASH(id, bits) mem_total +=3D sizeof(struct hlist_head) * (1=
 << (bits));
> 2946		#include "dept_hash.h"
  2947	#undef  HASH
  2948=09
  2949		pr_info("DEPendency Tracker: Copyright (c) 2020 LG Electronics, Inc=
., Byungchul Park\n");
  2950		pr_info("... DEPT_MAX_STACK_ENTRY: %d\n", DEPT_MAX_STACK_ENTRY);
  2951		pr_info("... DEPT_MAX_WAIT_HIST  : %d\n", DEPT_MAX_WAIT_HIST);
  2952		pr_info("... DEPT_MAX_ECXT_HELD  : %d\n", DEPT_MAX_ECXT_HELD);
  2953		pr_info("... DEPT_MAX_SUBCLASSES : %d\n", DEPT_MAX_SUBCLASSES);
  2954	#define OBJECT(id, nr)							\
  2955		pr_info("... memory used by %s: %zu KB\n",			\
  2956		       #id, B2KB(sizeof(struct dept_##id) * nr));
  2957		#include "dept_object.h"
  2958	#undef  OBJECT
  2959	#define HASH(id, bits)							\
  2960		pr_info("... hash list head used by %s: %zu KB\n",		\
  2961		       #id, B2KB(sizeof(struct hlist_head) * (1 << (bits))));
> 2962		#include "dept_hash.h"

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

