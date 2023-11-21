Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E898182AE
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 05:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsQPRKyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700543759; x=1732079759;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0F4pq82h61CBXYzgKgwBDRE1Itzh+GfaBlVHCnKMc6w=;
  b=BsQPRKyNb9LZXN8NAeEA97o0VlRV5CnHJMZfRlB1fkpqR4LA2l2jNwmR
   bMnpr01g/razG29nS5SdLjM80Gs0dERSE1sFN00mQEW6MEj4szrjiza45
   hlTmnzagYIbeT3VzM3JspfvFVWCVyuYk5Ds1z+2x6sNVWnLLTYVS2EsZC
   1JHfO2jKaaAyyLYxC9y5jY/8eshiv5ge/Jz+x1bm7ar9PxplCQX9+z7sD
   D8pEU7KluzAeJavbwUIyOnNPELDms7fD1eq9yxOeq2z/43dB+v6OhtPbd
   aLahqUXqtzfPlqbtZNROsOQiDsulOblvxf7HG2omtEVx9AvAcJn9bQiZN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382159596"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="382159596"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 21:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1097947736"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="1097947736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Nov 2023 21:15:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 21:15:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 21:15:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 21:15:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 21:15:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqMC997WgoUC8iIfYJK67w/3zVN2KU6JFRo6wNM2hMIEMvGg4PSObZNksoCb7LKrUNrc2dOJinmgVxJeN0VBularjDiy/XtHt/KxkfvxMqFmu6+8lwaOgN9z1vqedrB0pIKiBi7vFOH6alaznfoHnnf2vTh8n0dTX6YC3apN38c8o/XsOZvLxWnwLcB51g3Fz5VpO27RTfZCNbMcKx23dZkIEx0usRaX8/fgTAHK9gr3goA3vvY4HJ6cS8MEPRfL7rRVM3IfMNQMWSepm79LGQgpyQ20XL9jeIDMwnIimo+jjA8j1hbWHo53b1IRGvNbJl1uL+cfv6TD4Ip5fxXngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPVu8XVdkgH8f9kHVo+aHHHufLS5mvHkpkg7LlZvQso=;
 b=Z2/spVa4dS1ReHxwJzMMqU+Qh6uh1GcNUMyd99MvpK6NFHcHWSYKkup39Et88hpL2EHpVgSf8AaTB5oOnYBgqYg/oLPW9LR9zYA5Mi+9N0zIn71eg/tzUUK1eaEzRSTiyrIctmhcutzKNLiXCfs9SvtQte9bLIlbYtTlv9TQPrHgBPYg7IJ7BHYbTGhen1Zrqlo0g7fF/mI7MksSeUDsvNUpZbCdDqFbmHDXUf2pany9qNtcuI4F0qPDK4ldoRCghEpbHkfL97g9eW1kWlWleZGebT3eNgjWwhI0HWDQ4UwsPobYUf1oRToOo2mxlwLBHrey9IA7CR35dAIeUkjnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 05:15:50 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 05:15:50 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: make[4]: *** No rule to make target
 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko', needed by
 '__modfinal'.
Thread-Topic: make[4]: *** No rule to make target
 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko', needed by
 '__modfinal'.
Thread-Index: AQHaG5igE6J3GkfUREaHSDdq2t8gRrCEO9vA
Date: Tue, 21 Nov 2023 05:15:50 +0000
Message-ID: <CY5PR11MB6392D80A1434901094C5E4A6FBBBA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311201735.YCLHjtsb-lkp@intel.com>
In-Reply-To: <202311201735.YCLHjtsb-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|IA1PR11MB7754:EE_
x-ms-office365-filtering-correlation-id: 60b4bd22-b6c9-427a-4b57-08dbea50ed2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hz/ykAgJ9x6SgB00LwTU1XmE9lWPjfBEa820ceR8jVph/YZ7nePQQ7JBTWDAtnMdGY9o0z0cmj/AkydmrcGQGm2I9pTkcIeafB2msBbnotO3/igRu3G57+Wd1PX3VaFoO/Xo9ce12JjoqBEMeZFhLnZqlDfY9bLThLRb/h/nTykiRkMs0NoWBLB+JEWrDVO9H35CqjjdqxODz28A3IOs2M5VS4TSBcD4L5KI2lDyChZ88TW/vPRbQ+ycO9L2owVfoOv6ZX7geZXlTM0JnHy3vtjG2/L4Px+KsS4/jpnRzMaTu4022fMrGMuq1qMk5DVBlL5krI9BvigxphiijJfUj+43eAS968UeyUS4RY0C4aVdwgZhoae+IYM9KAI+wT17+hBNmZvGn24XWYJwQn39Hp7MITN49r5LqnE4vnKdD3vxV+G2oicYL/3VADsITMOLLAhBWmUrP0xWGxLveRYIFyEVMMd/ubUN9vZe7UW3scOb4gi3/KGas3oc8PwBPY615UQmTez0Q+pOpbxqTHTAZ4MRS+kHE2xJ2U9M+4kispgMgyqlPEY7RWF8/AoPwJWsCS+XFqD/LlDe1bJ489UiguILNjWdQ4yPDbylCd4yT7jil/Nm2uEhf3pbe0H4TYuiQFgZ0m5bvoy1mYleC2OPmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66446008)(66476007)(66556008)(66946007)(110136005)(76116006)(64756008)(316002)(53546011)(7696005)(9686003)(71200400001)(478600001)(6506007)(26005)(38070700009)(966005)(122000001)(82960400001)(38100700002)(83380400001)(33656002)(86362001)(55016003)(2906002)(5660300002)(8676002)(8936002)(52536014)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xgC+aijYpSm6UkMNDr6GumuJLp3bTfCjGOKe3teUtxNZkWHTLj8l6usfTthV?=
 =?us-ascii?Q?nYvJa19Xtb8uXjK9zN/28VSCpt0j0EHnxsD6X6278PZCWMnYWQ1JnRU+LDur?=
 =?us-ascii?Q?xBn2BCJsiLLnE1Tpo0Tg6EzIgi+oUggfhWeVAukjuXR84GREH9k42r/3m40b?=
 =?us-ascii?Q?Vs/7xfEX2dVwXRXrXipJSQQCD8Tg52xu3+kdu/Mgde3mf2VqAoTQEHvAS+DM?=
 =?us-ascii?Q?K6Kg7yVLn7CYWWA2C6zHktcktS0OM/LcwKcZ3SLRIf7YoBxt2G0933Vh/e70?=
 =?us-ascii?Q?DlZFclcea6hbBhxf33TtoeazFkFBGhDmRWd6M7FFl2ZKGVZK2sXnipK2Kswt?=
 =?us-ascii?Q?JLXwOmGEMpplINEGtDnyEKvpQ+x4HOzs12uZxE6thGu1pZE3AS2Y5UaP/CTk?=
 =?us-ascii?Q?Iodsqpj33rX2eOfb+IiDWxXXvGiAkzvUEDgDEU1LAZT585iPC+4tYLYdOHvz?=
 =?us-ascii?Q?WVpNfVEnE3XqJjpSoaDaaWHhLmHjSF7KHlRN06RUUZIt9dRF2So1WmALTpxb?=
 =?us-ascii?Q?XoYFsu5Jydg2BHyfqC6lemlJQWawCubmib3VHP3F7nxAvZureVnCcWL2/DBL?=
 =?us-ascii?Q?4t7q+I/+aZ2rgj/Fy9LrnnzblXXvr/PJrzYPLm9a+xOHPDh5AGvrQW/IRoaB?=
 =?us-ascii?Q?kGwAdVyOQIK3YYzq5aZw9yAxrk1RdTofMoyTndUz2dmNq7Qofr1QsIsOdd3r?=
 =?us-ascii?Q?YpvlbBUvEwrBAax+frRaWgW4QUckz++N7pmdakN4TKX8CHhp57j06cWTPfyX?=
 =?us-ascii?Q?+vPducTY/ck5h7ADzjrJS7Z4QOTPg6++aUKubpKDz8f+IhQmDEOZWNwGuPNS?=
 =?us-ascii?Q?W4/LZwaRSUOuoWLnHafrHWgvkIWA4yxizrUuiqborQLBeyQcH82T/ZWspfNJ?=
 =?us-ascii?Q?egV9cZs+hUV9kX+feL3glzH937MOu31hKHclx3IuQMR+qcv7nMQEPDONKwHt?=
 =?us-ascii?Q?9PH8EgHsjjs1qazBSXZPJXATldqLIlWLND8KMr1tP9+ffIfoqIkpURVzx10V?=
 =?us-ascii?Q?L+B9of/dlPr9DiSpWHWKU+ZTBZ8Yv4WmAy7mKQdTHfCebBTgWB7Dtt5acjtd?=
 =?us-ascii?Q?iUVokzydDyy2vooVjc9eIwVuG9Pi6dVn1ZLhCA/cieQH0cZe+WameOIvBcXk?=
 =?us-ascii?Q?jZdn8bSh4ifQvuUHq8u0V9vKuU73sYA76IP0jc8Kc/jvUZSvo5NY1PhqccVY?=
 =?us-ascii?Q?hDyPd2217ttN8q9SzLiKBlsNul8WTaxseEzWKuzwoQQHl2263cqpQK3WK27H?=
 =?us-ascii?Q?6AtAL0FiyqZmRscxJbqGs93+2fvUerbMmMS6Akqo3KvB8sLAmGpDGb2N/WWb?=
 =?us-ascii?Q?ZtCNLI1KdDP9tZbIrULQSUegR3ouJmJwVfNC762zhAGoOgXR8ROPGPHX22ln?=
 =?us-ascii?Q?FW0W/AvpdQYnMUfKlwTuTSn09tlkSNdhHZeNszmHKoRHfo+b3DdGBCelMH7F?=
 =?us-ascii?Q?BriFX1dR2l8GWkFUlvYu6yfPlyo8cuPnfSe+AmLgldaOp8xlBCfYdWWEzgM4?=
 =?us-ascii?Q?AFic4ElV8zSQFfDxyKIPA2enthqCeM/fogCtQmDewIh6ZLXCa7rmWk5K3nII?=
 =?us-ascii?Q?PPiCdTCGShlaCqKQdEel/34ww4VUwm9+TZC2RirA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b4bd22-b6c9-427a-4b57-08dbea50ed2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 05:15:50.0563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j6HX0jLqJdLInzIyNjRNuwEQlFhx/PrzQqlp0YpaC9RhPzCnZf5MWkbr1YYC5loCycuK9MkzaEvsuTZ7lTGnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
X-OriginatorOrg: intel.com

not_report

parent log is:

make[4]: *** No rule to make target 'scripts/module.lds', needed by '/kbuil=
d/src/consumer/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko'.

FBC log is:

make[4]: *** No rule to make target '/kbuild/src/consumer/tools/testing/sel=
ftests/bpf/bpf_testmod/bpf_testmod.ko', needed by '__modfinal'.

Looks like they are the same issue but in different style.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, November 20, 2023 18:00
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: make[4]: *** No rule to make target 'tools/testing/selftests/bpf/b=
pf_testmod/bpf_testmod.ko', needed by '__modfinal'.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "has Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: f65a486821cfd363833079b2a7b0769250ee21c9 kbuild: change module.orde=
r to list *.o instead of *.ko
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231120/202311201735.YCLHjtsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311201735.YCLHjtsb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'tools/testing/selftests/bpf/bpf_tes=
tmod/bpf_testmod.ko', needed by '__modfinal'.
   make[4]: Target '__modfinal' not remade because of errors.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

