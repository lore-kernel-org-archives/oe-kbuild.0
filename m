Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294E22EF3
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026983; cv=fail; b=CJFuJQz9p4iCkmubSLtq9NNN/HeOybwIyTqHTCVdgomKDNME+3gXYLkxX1J+Jo12pjXBBRucgDfPtbRSO4xIxd0hW8wqVtagNvHwqM/rcLwPu3ChE4Vr87BQKvIJ5ds8aBwMDHLl+GKaVkS0RELELS4n5WappJZB6lYLSdTSI6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026983; c=relaxed/simple;
	bh=BQkoQmCdQvkGOKQHc4qDY2LtajyoEXvhrxiPeyk2tQc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZRGicfNw6n2JomL6CvEpfsP+sMcOMZt2b79/ofVtQhXqqGk9nx1zmVRhx1E0uBZadWm3BXqYExHQW0qt5RzAKY1p2UFyUiZgr1byR/vuPRBD6C+duotIkwkXVUFpGjg789ZAzKCWlo6dvnVrNxKR+e5nXVjj2GZsrDvmApLdJZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQP1qxu0; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQP1qxu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714026981; x=1745562981;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BQkoQmCdQvkGOKQHc4qDY2LtajyoEXvhrxiPeyk2tQc=;
  b=EQP1qxu0VleIa9jU7eLjK+1xVw22Nz1oxWnaMfjdP27YLYWEdZGVl/gx
   x0+gKGBFP0RLwtaJoEKbKUX5mEd+gtHXqNGzzRg1sJ2rDExLV23/w8WoS
   mG9AitOQYH1MocprBLBA8dleSncgXgt6OtJabOS6LrRhiIJqkEQSSWEQR
   +CIOqLpvHmgSJkw4Jjhpsa3/8QBmwWKY+3Kr/5HzqSSRzqsVqFJFV+kU+
   UZbI6bBApAvsc/LxPprBLxXodJrTX9+HSHJeAcl7VtsR4e97p9hQ//eX7
   nPlRMp2Shj2Yl7Yq7HFgfOklR9BGWFx+6ap/lmloKLVZb7kWqWqnM4rph
   Q==;
X-CSE-ConnectionGUID: DWWe6PaNQgydGgs/tk2l6Q==
X-CSE-MsgGUID: T4jrILj6RfOWF6TctxGYEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9557746"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9557746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 23:36:20 -0700
X-CSE-ConnectionGUID: dBRIHx+dQ6e4rhAtxYuJsg==
X-CSE-MsgGUID: 7FYbMbVvRPOQe7BQ/MontA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="24966265"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Apr 2024 23:36:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:36:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:36:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 23:36:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 23:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVim/jv4roG0rGH6UJ4xFC1KdPKady7NmmzztFoX5lLeLkjCzHHAtjrWxZBWQh/Ebp9pv5VZ3aFZQ00MEGpFEfj653X3ceoF/zZwg+9oS6eCKCGw5wuKWurv24PJMu0vaE+vMupAEiolwNpph+4zD3c8ZKNDPyOOitoWty3ws2B+dxM1XzCgy3QXuR7ja6ionVaJVaxju72kURI6pE43Pvf14Ub5lF4MSpfaSGMjOYEEKrr8rYmRBaxb0sw7ozQ02a7cQbWDGuMw/scXRJZbbhUVKd8HeWF2A3HezY/8errsUQf8DhPb+yhRLgwU/2suSQ+0vFAMgG5lLWfScXlnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8A6tQlcQ+TY4SZnJ6lt/68qvRDQZEJ9dPAOVg9KBvL8=;
 b=ZhWiQuFzL+ExWgBauaFAJMCPR/f+0Jt3NaOKnfW5OetIl+4+AsYbHx9IzHspHMZ1nlfnU5JPOfNiADRuuVIjXRSooPUbVIH9Qs1oZvqCLcZ2EVwY0L3GGMmo1MG9tQuovNoXC5MSwEwTF1y70Z/EOTj5Fr6JFiiOy+LTlxXmZqOmzRtLPgH8hXOxKcVaOFYUhELhoX9KCpa65MaZpat7j6a0E+Ohxdk3O7lXmGvAxUSROxncx7wnR9jPosc5FEpcQR3FM0YLahiLbx8EjptawCnsQD5gYMVU+GxrfFK9u6Q14iD3RwfF4caOxUcsDWH2zd1hNczhA3XQM48M6tjgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 06:36:15 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:36:15 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed
 test APIs
Thread-Topic: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed
 test APIs
Thread-Index: AQHaljOZPRoPlFWJt0yVXO1gq/BbSLF4iUsw
Date: Thu, 25 Apr 2024 06:36:15 +0000
Message-ID: <SA1PR11MB83932D9763617C961FD0F0CFFB172@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202404241805.0QJXFFCB-lkp@intel.com>
In-Reply-To: <202404241805.0QJXFFCB-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|SJ1PR11MB6204:EE_
x-ms-office365-filtering-correlation-id: 952dc461-6e52-4e6d-ac0d-08dc64f2018e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?l/H2WxRcxBRLJimXwCBmhzmXhM/nh+b8xAT977eGEPZcWTXibomG+8/EQ92k?=
 =?us-ascii?Q?6hlB7fboYSGJ9102vmqF1FweONfHh90I3eRVy4VnO1wVL9b9QC9kz6wQ5k94?=
 =?us-ascii?Q?1nUrirGy2hL1XuABdm77A/1NU7t3gyBIuExoWRlD7GXvwtH6ewgFlLzTUCtk?=
 =?us-ascii?Q?u0sJ1X6Rh4wA/rnAPCQ26RUrrhjss6PzOzHRVki/Uz/aP7aOvaQ1y97PEp/S?=
 =?us-ascii?Q?/pO5HOGRICoAOWV/H/A04/LUBzrQ82Jb0RyZwi1q3wWRR5iesgMTt0hYcni5?=
 =?us-ascii?Q?2dnokQAUDIUvLvt10bhvXf5ngokMKwOfioToUuDPcPjicWBIOCUpxupSU4Xo?=
 =?us-ascii?Q?xm49qqTy1Rlb21L6E7oTj0QcrcyA1iE6N52sLGJGjL89x/Swn165n15K2yul?=
 =?us-ascii?Q?gLeLpB5sT4Q+F4pp7TCWhRTygTr/kJHeyWgP5X29lBlRFBoxELKo2Cv75EqV?=
 =?us-ascii?Q?bGK+XM0/69eAdzDNidIOyZRjGx1/KT+Tg23bhxJEgLbqWlLybUkksy2bTdoM?=
 =?us-ascii?Q?V7Hwzak/oxAjajrbnxhGq05nNswLOEJRB4HWJesJMz7VwDlzwCMFAF8lUG3J?=
 =?us-ascii?Q?xAN1qHk8Fd4sscYLwV66JOcla96+CowhUxEX9nbnYWk40td/HisFI6iffmCc?=
 =?us-ascii?Q?iG0LmQqgKwPSto4H2huTBuelvHMe6U1zu8xjt9YcFZf7i5vD7RE/HGE7EQNE?=
 =?us-ascii?Q?QDws44nGTDiiAyPkYXJ5E6eN0npuOv1iXyjN3+WrL6JLD3CZG//teY91/G0E?=
 =?us-ascii?Q?98F6cz/dJRHccZJP8i1TVOC8Sbds6uQV0ZuVe/+CN4bTdKlTwO4KrhDjzRpK?=
 =?us-ascii?Q?N7mR1uhmqTxvsUQ0R0IfnMAv8cTBfsJyFIauZCVRFrZfHua44sFaMZyPrchF?=
 =?us-ascii?Q?9iSaH5kPsCDEdZUcLDPg+j3/S6/6M5rePULfx+dB18X/rdw21Re4BY/i8QDV?=
 =?us-ascii?Q?Wenw6/HXe1Y6NCpcIBObFix+30Sn0s/suH2cBc2R/D67AvjfxOzKI8defZ0m?=
 =?us-ascii?Q?ABcjfKSPktOo6HkMiyG9yqjQEic/uL3xUjYIdxL4iarrxaAszXuA7/Q0SqKI?=
 =?us-ascii?Q?pSd2ZCWDTLv3NDr+5EJeFVRtcfwcjppjm9nLOvvB2TlO3LLpX9jddIaigiZw?=
 =?us-ascii?Q?h3awT38VAPgMGnSkBAG2eFyik3atDm8Dr0OVcGKHz5QpkMKMfNC3ACK9nH0P?=
 =?us-ascii?Q?+B/l2rVOKaSSPQDiLdLMcAyEnJAWHLga6OhAp1U4AuwJ3Ylqv67hgobDhGYd?=
 =?us-ascii?Q?Kt+X8gFj8an8fE/eCbZ7U5lGLuD0kFRNWtFLEZyxjE/E5Vk8xi1nQJ1nSR3C?=
 =?us-ascii?Q?QQo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AA+9mXxL3gxYK8kIKM4oF7HZbaSOfS97w+/CTQ7MsUlZ7CyKX4aTF3Xi6o4l?=
 =?us-ascii?Q?AqPtp002gG9MguNk7pKUex8EcC9xnkJ6kkpmPuCFp2PQgGsQOfkZOGVLvkhW?=
 =?us-ascii?Q?Gg022zvS2YiiSWnOJbZT/E/JBbTb2vpxH2ON7uqvtpp5MaUnA9CkOgmfUHgn?=
 =?us-ascii?Q?RLPTOqrYy9Np1zw8CHSXAwRTR3LHCeSMabjlvtsx4yEsOvC43dKUMfknbLL/?=
 =?us-ascii?Q?HzIquFImOJL2oF/SC2cfFLZZjr7RC6PtWWexvzwzZRz8rsYKveXHpMtkTfFl?=
 =?us-ascii?Q?URfkO20LU8zYeDuUJwWSp8jKDBI176h1HfSK5kSJ3XVuLzhw8x4tPw3HIeoz?=
 =?us-ascii?Q?/LE2W9u3NbmhUplCs/lwng7mXhnuHTgGLUrS8c4wYNpOa+PmXtv0TSlQ6v88?=
 =?us-ascii?Q?tWD8bGDnPMGzT7KD9E/Midd3KS2gEbvwyZgWMGPfb7HP4F+7AcfmWW87816x?=
 =?us-ascii?Q?sG/eO8E/7y4Z6zFLa/SmkYQ6OrzLkRcWD71z7ndQP+8qIujDJfqNfbtQQy6Z?=
 =?us-ascii?Q?jF0y4aRKjZrScdm5WUBGY+9IFct9py3vQ+VJ5xTS0u+g+Nbu0QmJZ9v+C8WF?=
 =?us-ascii?Q?PT/HXVV75AjdhsQ4uyhfpC+kH7CpzCWR0l3hpFJneo5L3aC+f8yLcaknyodA?=
 =?us-ascii?Q?FmzWBcYt2z5hblj6qD1WVlXAWvs8Y68knORaPFY7vckSSfbbtwV87TmA9A98?=
 =?us-ascii?Q?sv3HzvfZYie1RiJk1owrZBpZkI8pqihatKeNkjRGHyphNbuRkE1pvyDL4zNU?=
 =?us-ascii?Q?8NPQBtnJruMmomxldU/F3ky2SkFBPBBCeJFS9fbFZ7c4BLDtgAkRdifjlS1u?=
 =?us-ascii?Q?4u1ozs+vZuZmBgnErasx5u4ardd7GEuUshfqwX3RXEGrVXTFHk1f0anfU8Vw?=
 =?us-ascii?Q?H3QSn0zCWx3LwwdP1aklEf7JG6lv+LfJecpPuDBGyhSYOZhY2lwKdb0ZE5l1?=
 =?us-ascii?Q?sTcp7BM3ZIm8sD4wqg/+cTZRNaeGpRP5uw6gelH6OvEsf4bJdY9ZY8IoEbdg?=
 =?us-ascii?Q?2FmZWxfCpTtM1mZxexZyhnq+QxC4aF8OjIQYCLR5G+rSgF3Gptg+NxECTAf0?=
 =?us-ascii?Q?sB3Hh6moJ/36fvbzZXK9fCUxrS1FiLMuDLJdVxte/lewu7JVgRkRMjf9sOXe?=
 =?us-ascii?Q?0GJ9s03RMv5Nl7yCh56tqmgERrjBMq+GEPByjQ3f2DXXVTDLEgpDvTMt6TzD?=
 =?us-ascii?Q?d6sMy1h5901JPSMGUuzon7jHlLt8JiujSsfIVAWjpZ45tcWjco1eTwLVroVv?=
 =?us-ascii?Q?rSq4csI5+farc3e5f6hsopYBVCZPyD3kGUoj/wGxeM0skh3fW0/BefpHb9rv?=
 =?us-ascii?Q?Rc3qdQtK+w0l9E3+J9MhEBWweVqr8gV7ZgrM0/imx60GLX3QxKAsfEf91RvQ?=
 =?us-ascii?Q?TO3kT5yp1vixVGKCHqH5tOzLmFRUzRCocmXQiOh7QfpZSAs/STOCFAc0jGoA?=
 =?us-ascii?Q?KJGRlea93vjm33dn6bUlkWvNs2XjAQYk3+8jWPONGLXIncXp9gCErgiI9yT4?=
 =?us-ascii?Q?HtDenmkI1eVzVlqhtov2/G1KqUL3KTp0p1ArWJM6jzGvxPvi2YSxcCMHc02C?=
 =?us-ascii?Q?1+Y/OFOzzEuu4xMh2wbsLTN6UwI3nQmVhlRUYLPW?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 952dc461-6e52-4e6d-ac0d-08dc64f2018e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 06:36:15.0316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GovttWFw8meDlCQpS+CnOevUHAMvwshtFbpWlXwi0kYVsCktLyXPaUqZxV5/oUgNYU0z0qOa+YG69Uy9m/zRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6204
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202404240706.4zQmkds8-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, April 24, 2024 18:36
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed=
 test APIs

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240423031719.1941141-4-irogers@google.com>
References: <20240423031719.1941141-4-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Jing Zhang <renyu.zj@linux.alibaba.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master =
v6.9-rc5 next-20240423]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-test=
-pmu-events-Make-it-clearer-that-pmu-events-tests-json-events/20240423-1120=
57
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240423031719.1941141-4-irogers%4=
0google.com
patch subject: [PATCH v2 3/6] perf test pmu: Refactor format test and expos=
ed test APIs
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240424/202404241805.0QJXFFCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404241805.0QJXFFCB-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: -lLLVMMSP430Disassembler: 'linker' input unused [-Wunuse=
d-command-line-argument]
   clang: warning: -lLLVMMSP430AsmParser: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMMSP430CodeGen: 'linker' input unused [-Wunused-com=
mand-line-argument]
   clang: warning: -lLLVMMSP430Desc: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMMSP430Info: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMMipsDisassembler: 'linker' input unused [-Wunused-=
command-line-argument]
   clang: warning: -lLLVMMipsAsmParser: 'linker' input unused [-Wunused-com=
mand-line-argument]
   clang: warning: -lLLVMMipsCodeGen: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMMipsDesc: 'linker' input unused [-Wunused-command-=
line-argument]
   clang: warning: -lLLVMMipsInfo: 'linker' input unused [-Wunused-command-=
line-argument]
   clang: warning: -lLLVMLoongArchDisassembler: 'linker' input unused [-Wun=
used-command-line-argument]
   clang: warning: -lLLVMLoongArchAsmParser: 'linker' input unused [-Wunuse=
d-command-line-argument]
   clang: warning: -lLLVMLoongArchCodeGen: 'linker' input unused [-Wunused-=
command-line-argument]
   clang: warning: -lLLVMLoongArchDesc: 'linker' input unused [-Wunused-com=
mand-line-argument]
   clang: warning: -lLLVMLoongArchInfo: 'linker' input unused [-Wunused-com=
mand-line-argument]
   clang: warning: -lLLVMLanaiDisassembler: 'linker' input unused [-Wunused=
-command-line-argument]
   clang: warning: -lLLVMLanaiCodeGen: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMLanaiAsmParser: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMLanaiDesc: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMLanaiInfo: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMHexagonDisassembler: 'linker' input unused [-Wunus=
ed-command-line-argument]
   clang: warning: -lLLVMHexagonCodeGen: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMHexagonAsmParser: 'linker' input unused [-Wunused-=
command-line-argument]
   clang: warning: -lLLVMHexagonDesc: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMHexagonInfo: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMBPFDisassembler: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMBPFAsmParser: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMBPFCodeGen: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMBPFDesc: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMBPFInfo: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMAVRDisassembler: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMAVRAsmParser: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMAVRCodeGen: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMAVRDesc: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMAVRInfo: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMARMDisassembler: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMARMAsmParser: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMARMCodeGen: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMARMDesc: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMARMUtils: 'linker' input unused [-Wunused-command-=
line-argument]
   clang: warning: -lLLVMARMInfo: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMAMDGPUTargetMCA: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMMCA: 'linker' input unused [-Wunused-command-line-=
argument]
   clang: warning: -lLLVMAMDGPUDisassembler: 'linker' input unused [-Wunuse=
d-command-line-argument]
   clang: warning: -lLLVMAMDGPUAsmParser: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMAMDGPUCodeGen: 'linker' input unused [-Wunused-com=
mand-line-argument]
   clang: warning: -lLLVMPasses: 'linker' input unused [-Wunused-command-li=
ne-argument]
   clang: warning: -lLLVMIRPrinter: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMCoroutines: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMMIRParser: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMipo: 'linker' input unused [-Wunused-command-line-=
argument]
   clang: warning: -lLLVMInstrumentation: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMVectorize: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMLinker: 'linker' input unused [-Wunused-command-li=
ne-argument]
   clang: warning: -lLLVMFrontendOpenMP: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMAMDGPUDesc: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMAMDGPUUtils: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMAMDGPUInfo: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMAArch64Disassembler: 'linker' input unused [-Wunus=
ed-command-line-argument]
   clang: warning: -lLLVMAArch64AsmParser: 'linker' input unused [-Wunused-=
command-line-argument]
   clang: warning: -lLLVMAArch64CodeGen: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMGlobalISel: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMSelectionDAG: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMCFGuard: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMAsmPrinter: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMCodeGen: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMTarget: 'linker' input unused [-Wunused-command-li=
ne-argument]
   clang: warning: -lLLVMScalarOpts: 'linker' input unused [-Wunused-comman=
d-line-argument]
   clang: warning: -lLLVMInstCombine: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMAggressiveInstCombine: 'linker' input unused [-Wun=
used-command-line-argument]
   clang: warning: -lLLVMObjCARCOpts: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMTransformUtils: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMBitWriter: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMAnalysis: 'linker' input unused [-Wunused-command-=
line-argument]
   clang: warning: -lLLVMProfileData: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMSymbolize: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMDebugInfoBTF: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMDebugInfoPDB: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMDebugInfoMSF: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMDebugInfoDWARF: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMObject: 'linker' input unused [-Wunused-command-li=
ne-argument]
   clang: warning: -lLLVMTextAPI: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMMCParser: 'linker' input unused [-Wunused-command-=
line-argument]
   clang: warning: -lLLVMIRReader: 'linker' input unused [-Wunused-command-=
line-argument]
   clang: warning: -lLLVMAsmParser: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMBitReader: 'linker' input unused [-Wunused-command=
-line-argument]
   clang: warning: -lLLVMAArch64Desc: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMCodeGenTypes: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMAArch64Utils: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMCore: 'linker' input unused [-Wunused-command-line=
-argument]
   clang: warning: -lLLVMRemarks: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMBitstreamReader: 'linker' input unused [-Wunused-c=
ommand-line-argument]
   clang: warning: -lLLVMAArch64Info: 'linker' input unused [-Wunused-comma=
nd-line-argument]
   clang: warning: -lLLVMMCDisassembler: 'linker' input unused [-Wunused-co=
mmand-line-argument]
   clang: warning: -lLLVMMC: 'linker' input unused [-Wunused-command-line-a=
rgument]
   clang: warning: -lLLVMDebugInfoCodeView: 'linker' input unused [-Wunused=
-command-line-argument]
   clang: warning: -lLLVMBinaryFormat: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMTargetParser: 'linker' input unused [-Wunused-comm=
and-line-argument]
   clang: warning: -lLLVMSupport: 'linker' input unused [-Wunused-command-l=
ine-argument]
   clang: warning: -lLLVMDemangle: 'linker' input unused [-Wunused-command-=
line-argument]
>> tests/pmu.c:84:2: error: ignoring return value of function declared with=
 'warn_unused_result' attribute [-Werror,-Wunused-result]
      84 |         write(file, "9999\n", 5);
         |         ^~~~~ ~~~~~~~~~~~~~~~~~
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/tests/pmu.o] Er=
ror 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

