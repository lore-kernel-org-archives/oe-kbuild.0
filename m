Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E33D72
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqz3ZOew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699836895; x=1731372895;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=b9QQMPQc8f4rr2Cki6V9zz5Sqq6bUnErx6bCu22ebTY=;
  b=fqz3ZOewqRlBMMx5IXoqynUtO0HfelioK492uBJRMzcWKDJnBz3U5A3k
   qBqPMjSVTNjCjqLxh+znvAraMpnGmjRdpQlCjymK7xOYHyv98MeiQAuuS
   rpYAY00bj3n6awIHH1kQybwp0lrmGibBbzcpzGGd16+cxMSGMeKKhlvns
   uLRy2huNW3ODkB/cxfYn6ObMl9xeHIHTrMBCzOliJ6dweaZKECADGyrJz
   qcqN0sGm2h/+m9EHbsvXJrqd0cFDRnCOIGxyyp8ee2dLlei/IPxNr1DFG
   baEaVK46mnvjBiBahaK49EGk7kca5Ukc7W4de/hTKtw+jWDKASNtjX72Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369690979"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="369690979"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 16:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="834595958"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="834595958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 16:54:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 16:54:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 16:54:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 16:54:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 16:54:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM9fSNuvLE0nJa/FenwhTHMcdHBncEbbwkLrJXTpFVlTziPqYXeH3IUagX9H229IhMH0JAFmX0KOOeOF46p5KqiMxNnrJrJNG3uT0okie7EwnhmEdgf4/S0BgY4fcdzVPWwQ04BIhLgJ1leMGQo2jDDPYb3hZq6Vp1H1aor09B9ziREo4D3HC6zxqFpmF8AuFcGWYKK1uMFv3v2NnfBJdf00qn/UuSWAMfzLedam2wRK110E7b8d5crQb8k3oL9tY6ahDUHZqhigSJdpp39oDYpsaYQ+grL2M3VhL6obii3uV3RMXPA55GTREJA+xUP3G81uuhkceppHY5RGl9l7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYm/0LvvoQvtxK/RcvQ8xGyYkInvbFXZeBCJrCP5sWo=;
 b=jHPh9fdgeF4UTXC8aDyNZ0p/NHNOEFCzUZRsAeRovdb2CJvFuCXKqJjkWoenmi5pLBhoQI/ozVDvCOJFBk5nqFOMYLkZ9RQQBBKhxXrWeMwL6vNDMjSsljIXxlEqDBOQSlzzKV5BXhRxq3wqWlLxuFpecZeEjdA/ben0qHiKYfEHq//9OjPDY3A/SpqenDY5bZLkysBGxN6Oab/pioXbfPdPXhA/KSPOONYxhGpQXnuBRNGf5+uZ6WUVw1GSC3Sn2DZ9y3799OSgNXuh/VtBg0Afm2R9b8Vtuw4jmYcc6R1UARGQb2eFF1QIos7bJgaoQI3xiY5njbtSDdKdSNKRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26; Mon, 13 Nov
 2023 00:54:44 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 00:54:44 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
Thread-Topic: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
Thread-Index: AQHaFb5AJPqyuX//HkStJ0OnvTfdPLB3bCgA
Date: Mon, 13 Nov 2023 00:54:43 +0000
Message-ID: <CY5PR11MB639205B8E88576C7C205B04EFBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311130605.zjOBT0zH-lkp@intel.com>
In-Reply-To: <202311130605.zjOBT0zH-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA3PR11MB7415:EE_
x-ms-office365-filtering-correlation-id: f59010c6-13f3-479d-5659-08dbe3e31fff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UvKtPc7W9FIGnBy0U39XfvdFDITiC0tFyv2TqhyhDDE75Ve+WwFSR4FLUiSmLEpN7kyRfhTQgJMwdoAaMcNS4ziTEP78KsZTWyrtSd+R8mD6N6MM+snXq07GlocPg9npxBI3AmI5YfAYqvzkN2WKv++ibgbpf0h3jExgewb3lg6fB64GMmxjT6F2WGX8kKlFWmxCNQo1j3GhYzXTvePIQVX/Ywz+1BfHWyBQtfAitT7252Ui8GE7guYPTFS30miiyCELWabukH3WLYFSi4PJtTWhAoeVoeJ0rLvUGIsYMaSpKBbPMoDRUQSOe2Lre+hPZzT1PgJVa0/saXmIf556cbSHzbC2owPjay6WzkS75zvRC1SomA+1HHYEmG21zX6YittfPJegLcxbcjSSocljAY7tq6rTWkq0n7oKEEQBG9InRnQPpFxE80US+d22SJ0l7gAlwz2eB2/DtgHjQ7s6BXDx4D4gwuwW8aNlc4Uzo0zTHG15NYjkJ67q8wZ82yTfSgh8il7m1mQaDCHdvJt76aNAQA4+vVq6wcB2/bYMIQxbIleWdnemluNfWe1UmjsI2egSD/WfbhT0FdEDByhjkDoE+pLLS4Or007274Jsgl9HnFvbgAkZkpguRtcpw6KF///k6RSyiee0RtBBpQw4o2pEerWMzLr5aVuZde5u6+KI3OtRQAuBe6WSlwpWbOVQAOW/emEFA2M2fPeJeG9mYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799009)(8676002)(8936002)(52536014)(71200400001)(38070700009)(26005)(2906002)(5660300002)(86362001)(82960400001)(7696005)(6506007)(53546011)(55016003)(33656002)(966005)(122000001)(478600001)(41300700001)(38100700002)(83380400001)(316002)(9686003)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(110136005)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LA/GBBC1/FpLISHI2whOZN0/kpOv85SDBktLDxjrvMW3xKi/sBG6z0zoZ0t6?=
 =?us-ascii?Q?YRgsQkXUgCfRfYIAxCGpTapgQ1MP6xCdYtUUxfb0nve7X1p7ZBmJP2qTeIcT?=
 =?us-ascii?Q?6rbtjaceLYo3QH5Q4RaC3FLBpdAWeXAfQJWHQAZdinvmJseyFWbXopuXMv+0?=
 =?us-ascii?Q?vGoyYQ72YxsK+LetkfNGYluciRFuGGWHWJBCfP+n4LCWhEy0lZmO7LjzMzOq?=
 =?us-ascii?Q?KbYnC/z8v1t0rQnR8qS2haIaCtU0UcMbAUjJqHb7tC4mFCAlelQdbk4qjqhq?=
 =?us-ascii?Q?5LBVu8W077jfN/pv4R/vnV2TG78tdCNfbToi3q+WCCaSr+dPHypTyahZ5Qrr?=
 =?us-ascii?Q?QH5lo30jJ2SUdO9UfbAgmf7Txn6has3VEF8U4FA7JdkpmN6Jf4KtpI0uFG+L?=
 =?us-ascii?Q?lejKDXbBAkJbJRJgezcMZARd809JkmmChlUax/3iFztGayZ95eVo5YbLGp/f?=
 =?us-ascii?Q?z6rCngtMt/+rsyrVaTMiqzIN1lPkSodLCFNHXIUqPEhAEhBLnuJD0RAO7zBp?=
 =?us-ascii?Q?yt57mRWJqGc0qgzpBKOEhj/MtteI1OxvoyXY+zgjgqY1nYe6odKVPMlx9dWw?=
 =?us-ascii?Q?sq9999fOR1i4cZHf4Wu2aDE7D5wc2/gCpf4lNic1L34Jorf9bIsq03fYF8jf?=
 =?us-ascii?Q?juL0jufh7ZZK50OVfjIPuHWNhlrUP8esfaR5VnHZonRvgOlc1rEe6rDRXUvI?=
 =?us-ascii?Q?s1HdLfePguNXtMFyl+5iX7eYUVhN/pqFYE42NggjS8NV8pVtzgAuQdF829jG?=
 =?us-ascii?Q?xHgl2mqhi7JniLNtkmOVPefungqHO+0tfEpjSYgDEt25XouJZL6aFFpne530?=
 =?us-ascii?Q?itIbsu2SrRGBz7T0XsTNc32rjDVyt0SKtPuprJ2njrqnwX5J+LY+lV9ufVIH?=
 =?us-ascii?Q?QNGH6tpWWIgoKZE3DA5/8lXZWAIFRpnIzGC7ipN4TtjtUlV6dgt7wIIliOEf?=
 =?us-ascii?Q?vm7ZMldUPRWo+zBNcR9JmJW4hElzWGDFOgu8zid0DeAf8sgvFD+HYl7VzsDR?=
 =?us-ascii?Q?6zdzgIETmOzVOHr5aeyVHn1nq8hXXwHZng5+3HG7fd8dagycNdxxwi/e1nbq?=
 =?us-ascii?Q?1JOWRNMwW5GJGbPxGmfxzQqwOGPD4GoM8oNpzad4VY1OftpxHz9t8f2+k0gA?=
 =?us-ascii?Q?jaD4SXhDzJCHPj6XUmlqqKe3MCprVSvpz7FsgbbOCGrN/Y7WwV//QqG74xxJ?=
 =?us-ascii?Q?XrPccnVdxqmmvXVFzV8UBUW8Z0maDFCtQqeWPiUW1w0G6N4TR/xzcRYf+Dak?=
 =?us-ascii?Q?s7onB1p47n4Uia/emygG1S5fJcL/patSusSdk1oNGaLXAR8yDXUKLUbEkSwQ?=
 =?us-ascii?Q?ayuOiLh6u/Dqmxr/a3IhRvVtU0CRbEVRPDdbPODooTfmWbbPHtoBZJCVAqbN?=
 =?us-ascii?Q?5iyD6qUb2MOTIjutwI3TJ/i3lyffhds4QcCI1b7Wn8Sst//gS46nfIqyjrdW?=
 =?us-ascii?Q?MAj9jW7I7HhO0etbiCN3y+Lpp93q8tn8Qs64Snz7bg1sH00oZABAXicu/os9?=
 =?us-ascii?Q?wOVuuCAlQg431g4cH1YZ6ESSIcY/MWrdhl6tYFwUAUz35QrOGP0wbNLNDVij?=
 =?us-ascii?Q?zwLmQZw4WDjdozv3npwGhaN+1DN61lEhoZFvP57M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59010c6-13f3-479d-5659-08dbe3e31fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 00:54:43.6955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYioaSRlFAryZyol8ndqmGavKYek6ohw2BxyuDcfd+7a1YPcgLZnBn2tOwrX40PUSsLsw5nrUrDi3dbqHvDQWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
X-OriginatorOrg: intel.com

not_report "guarded by various #ifdef macros"

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, November 13, 2023 07:15
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH] riscv: Avoid code duplication with generic bitops impl=
ementation

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231112094421.4014931-1-xiao.w.wang@intel.com>
References: <20231112094421.4014931-1-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: arnd@arndb.de
CC: geert@linux-m68k.org
CC: haicheng.li@intel.com
CC: linux-arch@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20231110]
[cannot apply to arnd-asm-generic/master v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Avoi=
d-code-duplication-with-generic-bitops-implementation/20231112-173655
base:   linus/master
patch link:    https://lore.kernel.org/r/20231112094421.4014931-1-xiao.w.wa=
ng%40intel.com
patch subject: [PATCH] riscv: Avoid code duplication with generic bitops im=
plementation
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231113/202311130605.z=
jOBT0zH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311130605.zjOBT0zH-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/fls.h is included mo=
re than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__fls.h is included =
more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__ffs.h is included =
more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/ffs.h is included mo=
re than once.

vim +22 arch/riscv/include/asm/bitops.h

    17=09
    18	#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
    19	#include <asm-generic/bitops/__ffs.h>
    20	#include <asm-generic/bitops/__fls.h>
    21	#include <asm-generic/bitops/ffs.h>
  > 22	#include <asm-generic/bitops/fls.h>
    23=09
    24	#else
    25	#define __HAVE_ARCH___FFS
    26	#define __HAVE_ARCH___FLS
    27	#define __HAVE_ARCH_FFS
    28	#define __HAVE_ARCH_FLS
    29=09
    30	#include <asm-generic/bitops/__ffs.h>
    31	#include <asm-generic/bitops/__fls.h>
    32	#include <asm-generic/bitops/ffs.h>
  > 33	#include <asm-generic/bitops/fls.h>
    34=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

