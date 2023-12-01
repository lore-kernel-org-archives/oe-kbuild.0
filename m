Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41359555
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DygKsMyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701400298; x=1732936298;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=btZ/g+tjscuuv4MWbxcz/44gOnkgG6yYvaoXISVKAtc=;
  b=DygKsMyB0MSubzt+y0T3K7LA01Ct2fAHZMnxPe3YPoXAz36QxXFhLHct
   mlw2efTiRQ7gBylQBfZCOf/n2k6bOeWhQbahO3zZiFhqG60+1heZ2m3iy
   aK8Hg1EeDAIyAnqwx7SZaXl2k0xF4IpjMPsafJmOHFQNiDwhSUjjZGI+c
   aC1ccLVW/3WFXZWMHIV4YSz6jn9iFWLbth9p1L9ntAYu5qRRODr7xebSL
   rDddUwLrePMmngAej/rN9B6UQKx7W5z9Jq6lN8DqbxHh3h9wYl1yBr1yN
   qB0G+pTPQNZsLd+65AhViwyrrdh74sU+/WzRR9keDXgPNdk2A56QYFvRX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="426134"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="426134"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 19:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1101152527"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="1101152527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Nov 2023 19:11:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 19:11:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 19:11:36 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 19:11:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNAoKMR65OjW5b0PBDtEXZmBX2HyM9dtIuBDkXnmLernO9i8Lm8cC4Oto/qzhNfOrWhKIscf0XXT+03/YiN4Ws2KBlG5Fo7B1BG3uQpTH6xrs+q9rzSVSrXW/RxfmDxjHH++DcCvaPLQot7EVmiebni2G2e3CTAoaTRRW7Dapk31LC02R2o+PvAtmuTOEYPo4v3xh1pFd5K6uys9DvQkS2eisWgauPZeBwLc+/B6Jl9uKwX8keY74oYYddWozYRjQQ/kqK6PC+g3NOr9NobF93ZhmY/HtVeGMQADAOSOPqwZ79dZormNlNfAinPdrNIHrpBuMr6lLlmzsU+Orpe+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iUM/eUclbUIDqEDDH2Ov5+uQ7FsSZ1RR2AI+0xMzHs=;
 b=Kt6VJvmVPb6VkdsSYopRNdX3wJHw8ZQX7DPmO16mmpWVAkWMHAyKAQQUzIw+tPPRcKNjFKwfgO0CptiWuKPFWFsBvsWiSK53Q+e8YFrwWYsUq50h2NmFkCwhdk3RcmU7QyVDfIPO2jJmKXEbtdYP9cCT9wc+F4HCuw/NLT8FTZdAtZN4szV2IdJbWY+/DNruE4CJwGn2Hv7jjYFexcszJ7D7DMCCTguDM1a3uidxVxIrRid2RspinSHJyyHUCSgSJjTA0BQIPRbwIcXx2LxAvhnonB31KOlQpQhbJ/c9y/dHBD222D3MMUXVdId2VsIaQWjbJmYpR8eFuQSlQbIzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Fri, 1 Dec
 2023 03:11:32 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 03:11:32 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [android-common:android14-6.1 1/2] kernel/sched/pelt.c:
 trace/hooks/sched.h is included more than once.
Thread-Topic: [android-common:android14-6.1 1/2] kernel/sched/pelt.c:
 trace/hooks/sched.h is included more than once.
Thread-Index: AQHaI3blRY0iPM+qmUGakqRE+OcUr7CTwQMQ
Date: Fri, 1 Dec 2023 03:11:32 +0000
Message-ID: <CY5PR11MB63927652644C11025A3BE5D8FB81A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311301857.a3jbEKwI-lkp@intel.com>
In-Reply-To: <202311301857.a3jbEKwI-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ0PR11MB5118:EE_
x-ms-office365-filtering-correlation-id: effa31e5-a9b1-4c1b-74b1-08dbf21b3832
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SjMZ5ZsB5vF9eAYeal93HA8bWCjFNjqdicVtjJV11+Rtj3E7K2mUHNclmIY/ve9ruxK6h3GsK2niC2jcqifs42xewME/hVDJy0wbzyXSr5QOokGv/pm3cih5GBB0vz1MlAGwx8DBNnf39V3qyClxdFaobx/UxoTGUxIAbrOcFO6gsnJAQOJnD7n2CGYPjZ79KXe2B9j+ZoxaZOLblxDJDJy0/O6eimkSWDHEPqaYEO3A/9zn2bI2LO/j++SqqtJprc1ZIsblzjZciCrZCq7Syy6VgmMRUlBzmlu/bZY1nfb06mS+AlNcTMO2fb2J+LaIXxy1Zfh02PUllQ4PwQYWlbT5ikr7gJmuXbRPEn9JpTOv+pavM3zqJt5cnKnbBZy8crSFVBHrgDrGdeUgAxjtnlKMeCD1ftzKQUQcBHFwwtmz+/E7UkIHg1PAa4iixmGip7OaO73Pr/tC2F0za78DTQRFirEty0zNJI6NFNCVoitM20mytXEmgcav7JnKeqRC54+cOxQMSVDtUNFSSffpusGaO/nLcS6ZerP5rfmL07vZSZSSYFMMMnffLJSrGD82ZBB+M2LTaNYujznghBThptniVHcRrZXM/hV4QMfQA7nS548bCMDreX7ufZIOgItBv/H9BHw5zU/HYCuY7toED00uiTka/tbynn0zc6lB/5JubwDTCnY77kEl6bZEEjCY8n4a9EyPqgY04TDHaQtqxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(38100700002)(82960400001)(33656002)(38070700009)(122000001)(966005)(66476007)(76116006)(66446008)(66556008)(86362001)(66946007)(316002)(110136005)(64756008)(55016003)(478600001)(5660300002)(41300700001)(52536014)(30864003)(2906002)(8936002)(26005)(8676002)(7696005)(6506007)(9686003)(71200400001)(53546011)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vtxlmbqiNC/N5mARBo3kfvnwVwyhRB3+ZMpHuJBKglYpcwMHbeGLqHhm4/Fe?=
 =?us-ascii?Q?XKoKk2q3Ci9UKDSSkvYM7cThzG5H1gT5m+TzUXW4ev9EDdTXLI3aLxF76Ssj?=
 =?us-ascii?Q?RCN3gnr7kKrQ+EgnEF/90sIrQZqkSXI42gxZWsk97B8pI0qABJUhnnSeD8nK?=
 =?us-ascii?Q?+V3dMC2OWf2h2Lo857xpxYB2UqcqQQ7ro5kzRsH1+PKQc5I3I97+fKeBnvgU?=
 =?us-ascii?Q?YcgYDOc6Jhw3eWIKS7see4yW058VnJ9Nui7oeqbBFrn+2wbs9gQhw7m/UC7b?=
 =?us-ascii?Q?KrTfLcL225EOY8ClXQCQIG2QYQtOoCiNqK+/l8bEmqBIgDVko8X0wfeIWmDC?=
 =?us-ascii?Q?1p9IWn6cztxVvofekggbnZ7qdchDSJrIVq0Ozs5T44vNfEdaGbKlj8SaG2Qc?=
 =?us-ascii?Q?qLuBfX0Rh+bimsn9ZploODBY2I5nMN1/j9lQxLl6NV5pQMzqUuGtURmYPDdF?=
 =?us-ascii?Q?730bjbz6GjjE3GwDFpaymgA/jBuinDe4eDMyXhPwIVTvWs4emPkZoGUqb8Pw?=
 =?us-ascii?Q?pQuq890vmzctc8OiNjhfbQbV/gi/TGBBjIdFrdTZ7kD2df15kldM/cbUioEq?=
 =?us-ascii?Q?aU7OE6QZKkx+KYfzHI0tJWQbSGlmVEh8eBBC7VOH4m3iFzk0MJgLw78QMNCE?=
 =?us-ascii?Q?pDDAJCoi5b0G2fyzBYO2aeOitAO8GZs8wQnmeeVueY9EbvmHaewZt7lkAUtO?=
 =?us-ascii?Q?6Sik1Bju6mA7PS2aR7MziCBreLSjr8C5VEwHzUL6SJ/wYVu+W2FEoaLnGziu?=
 =?us-ascii?Q?oqA+djdceTJQj6qeM6+G43AUnr/Pc08H8V93G8C5fknEQqsPwdZgJiU0FUiO?=
 =?us-ascii?Q?QfSehHOQVB+jmTP35BOsstMERq5vP1ja2ZQchEEaCLcQyFqReiVDyRUyCHn/?=
 =?us-ascii?Q?b93S+zayoYc2V0QVcaL77F8nwwu7hpLdbceMHXRGJyQfj7/35Cvs9M8nep53?=
 =?us-ascii?Q?fC5+yO6e7NxD89v7yNVSNpqs+vEgCodE4zNH2mhTOtcwzS2wQV3K8vNpMx4B?=
 =?us-ascii?Q?S/QSGem0y7Ubat1QeWVyxBpRnlFckredSx7/XZRJr11OU4TmfecM1DxsDfED?=
 =?us-ascii?Q?XexZXTyfU5MigxbFVuEW8gMBiRS/NMjklm+6yoOzCas4RkrPWIliUsRnnvaL?=
 =?us-ascii?Q?DVeTaJs+zLyxngK0v5nFlsyl4YGr61b+97GnNLySv2JywG2h7pJmob7nxIJY?=
 =?us-ascii?Q?exbMDLNzGSQNzKVaLXRb5yx1PGcwRk+YJ/FKixAiUx28f5s/ziQOUjuIQeqe?=
 =?us-ascii?Q?yvsr41XNr+oOAW+XVHiwya3WTonLO5Z5ObgrehD/eIQwsGFhjbofXAhl/9xl?=
 =?us-ascii?Q?gV1tv1Yaoa9rjv+KFBOWp2/OFqr7IecWjH74EtnevSjUBy2ih6lBx/sMA6aK?=
 =?us-ascii?Q?q1Mi9OJxJ9AjE9qAl2DyhvG4fQLp9/6Hrzh11kjXiOW+QkjYmzZbQlDk7rTH?=
 =?us-ascii?Q?8DzprXoIzWLMs4jIl1lX187JwIxkH6a3zpZAAZ2alMdMcS44qM2n/RLkrNdc?=
 =?us-ascii?Q?+eKGX83nJZ13Rna9hTCGmj2xkCIL9niMiinxou6DRV+Tt7eRiGZr3bnwVnbD?=
 =?us-ascii?Q?Ar0BTFu7Hdx3vT6lQ4pC7BhL4d4TDMDxH666op/Z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: effa31e5-a9b1-4c1b-74b1-08dbf21b3832
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 03:11:32.3269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5Hz7Ysv4Q6wBFvzbA0fRL/mcC+qkAj3XQ065HZ/ujwXO+LkYqEay78qXTnUP6WuS1+W2jGtrMMrlJ+8eu76iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
X-OriginatorOrg: intel.com

not_report

include lines guarded by macros.

  > 27	#include <trace/hooks/sched.h>
   480	#ifdef CONFIG_SYSCTL
 > 481	#include <trace/hooks/sched.h>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 30, 2023 18:18
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [android-common:android14-6.1 1/2] kernel/sched/pelt.c: trace/hook=
s/sched.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   ceb6ff1a6954c58f61354fcef58fd17af3ec5dad
commit: 0d97bca80a8f680f1fbf4b2a441c6ac581b8956a [1/2] ANDROID: sched: Add =
vendor hook for update_load_sum
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311301857.a=
3jbEKwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311301857.a3jbEKwI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/sched/pelt.c: trace/hooks/sched.h is included more than once.

vim +27 kernel/sched/pelt.c

  > 27	#include <trace/hooks/sched.h>
    28=09
    29	/*
    30	 * Approximate:
    31	 *   val * y^n,    where y^32 ~=3D 0.5 (~1 scheduling period)
    32	 */
    33	static u64 decay_load(u64 val, u64 n)
    34	{
    35		unsigned int local_n;
    36=09
    37		if (unlikely(n > LOAD_AVG_PERIOD * 63))
    38			return 0;
    39=09
    40		/* after bounds checking we can collapse to 32-bit */
    41		local_n =3D n;
    42=09
    43		/*
    44		 * As y^PERIOD =3D 1/2, we can combine
    45		 *    y^n =3D 1/2^(n/PERIOD) * y^(n%PERIOD)
    46		 * With a look-up table which covers y^n (n<PERIOD)
    47		 *
    48		 * To achieve constant time decay_load.
    49		 */
    50		if (unlikely(local_n >=3D LOAD_AVG_PERIOD)) {
    51			val >>=3D local_n / LOAD_AVG_PERIOD;
    52			local_n %=3D LOAD_AVG_PERIOD;
    53		}
    54=09
    55		val =3D mul_u64_u32_shr(val, runnable_avg_yN_inv[local_n], 32);
    56		return val;
    57	}
    58=09
    59	static u32 __accumulate_pelt_segments(u64 periods, u32 d1, u32 d3)
    60	{
    61		u32 c1, c2, c3 =3D d3; /* y^0 =3D=3D 1 */
    62=09
    63		/*
    64		 * c1 =3D d1 y^p
    65		 */
    66		c1 =3D decay_load((u64)d1, periods);
    67=09
    68		/*
    69		 *            p-1
    70		 * c2 =3D 1024 \Sum y^n
    71		 *            n=3D1
    72		 *
    73		 *              inf        inf
    74		 *    =3D 1024 ( \Sum y^n - \Sum y^n - y^0 )
    75		 *              n=3D0        n=3Dp
    76		 */
    77		c2 =3D LOAD_AVG_MAX - decay_load(LOAD_AVG_MAX, periods) - 1024;
    78=09
    79		return c1 + c2 + c3;
    80	}
    81=09
    82	/*
    83	 * Accumulate the three separate parts of the sum; d1 the remainder
    84	 * of the last (incomplete) period, d2 the span of full periods and =
d3
    85	 * the remainder of the (incomplete) current period.
    86	 *
    87	 *           d1          d2           d3
    88	 *           ^           ^            ^
    89	 *           |           |            |
    90	 *         |<->|<----------------->|<--->|
    91	 * ... |---x---|------| ... |------|-----x (now)
    92	 *
    93	 *                           p-1
    94	 * u' =3D (u + d1) y^p + 1024 \Sum y^n + d3 y^0
    95	 *                           n=3D1
    96	 *
    97	 *    =3D u y^p +					(Step 1)
    98	 *
    99	 *                     p-1
   100	 *      d1 y^p + 1024 \Sum y^n + d3 y^0		(Step 2)
   101	 *                     n=3D1
   102	 */
   103	static __always_inline u32
   104	accumulate_sum(u64 delta, struct sched_avg *sa,
   105		       unsigned long load, unsigned long runnable, int running)
   106	{
   107		u32 contrib =3D (u32)delta; /* p =3D=3D 0 -> delta < 1024 */
   108		u64 periods;
   109=09
   110		delta +=3D sa->period_contrib;
   111		periods =3D delta / 1024; /* A period is 1024us (~1ms) */
   112=09
   113		/*
   114		 * Step 1: decay old *_sum if we crossed period boundaries.
   115		 */
   116		if (periods) {
   117			sa->load_sum =3D decay_load(sa->load_sum, periods);
   118			sa->runnable_sum =3D
   119				decay_load(sa->runnable_sum, periods);
   120			sa->util_sum =3D decay_load((u64)(sa->util_sum), periods);
   121=09
   122			/*
   123			 * Step 2
   124			 */
   125			delta %=3D 1024;
   126			if (load) {
   127				/*
   128				 * This relies on the:
   129				 *
   130				 * if (!load)
   131				 *	runnable =3D running =3D 0;
   132				 *
   133				 * clause from ___update_load_sum(); this results in
   134				 * the below usage of @contrib to disappear entirely,
   135				 * so no point in calculating it.
   136				 */
   137				contrib =3D __accumulate_pelt_segments(periods,
   138						1024 - sa->period_contrib, delta);
   139			}
   140		}
   141		sa->period_contrib =3D delta;
   142=09
   143		if (load)
   144			sa->load_sum +=3D load * contrib;
   145		if (runnable)
   146			sa->runnable_sum +=3D runnable * contrib << SCHED_CAPACITY_SHIFT;
   147		if (running)
   148			sa->util_sum +=3D contrib << SCHED_CAPACITY_SHIFT;
   149=09
   150		return periods;
   151	}
   152=09
   153	/*
   154	 * We can represent the historical contribution to runnable average =
as the
   155	 * coefficients of a geometric series.  To do this we sub-divide our=
 runnable
   156	 * history into segments of approximately 1ms (1024us); label the se=
gment that
   157	 * occurred N-ms ago p_N, with p_0 corresponding to the current peri=
od, e.g.
   158	 *
   159	 * [<- 1024us ->|<- 1024us ->|<- 1024us ->| ...
   160	 *      p0            p1           p2
   161	 *     (now)       (~1ms ago)  (~2ms ago)
   162	 *
   163	 * Let u_i denote the fraction of p_i that the entity was runnable.
   164	 *
   165	 * We then designate the fractions u_i as our co-efficients, yieldin=
g the
   166	 * following representation of historical load:
   167	 *   u_0 + u_1*y + u_2*y^2 + u_3*y^3 + ...
   168	 *
   169	 * We choose y based on the with of a reasonably scheduling period, =
fixing:
   170	 *   y^32 =3D 0.5
   171	 *
   172	 * This means that the contribution to load ~32ms ago (u_32) will be=
 weighted
   173	 * approximately half as much as the contribution to load within the=
 last ms
   174	 * (u_0).
   175	 *
   176	 * When a period "rolls over" and we have new u_0`, multiplying the =
previous
   177	 * sum again by y is sufficient to update:
   178	 *   load_avg =3D u_0` + y*(u_0 + u_1*y + u_2*y^2 + ... )
   179	 *            =3D u_0 + u_1*y + u_2*y^2 + ... [re-labeling u_i --> u=
_{i+1}]
   180	 */
   181	int
   182	___update_load_sum(u64 now, struct sched_avg *sa,
   183			  unsigned long load, unsigned long runnable, int running)
   184	{
   185		u64 delta;
   186=09
   187		delta =3D now - sa->last_update_time;
   188		/*
   189		 * This should only happen when time goes backwards, which it
   190		 * unfortunately does during sched clock init when we swap over to =
TSC.
   191		 */
   192		if ((s64)delta < 0) {
   193			sa->last_update_time =3D now;
   194			return 0;
   195		}
   196=09
   197		/*
   198		 * Use 1024ns as the unit of measurement since it's a reasonable
   199		 * approximation of 1us and fast to compute.
   200		 */
   201		delta >>=3D 10;
   202		if (!delta)
   203			return 0;
   204=09
   205		sa->last_update_time +=3D delta << 10;
   206=09
   207		trace_android_rvh_update_load_sum(sa, &delta, &sched_pelt_lshift);
   208=09
   209		/*
   210		 * running is a subset of runnable (weight) so running can't be set=
 if
   211		 * runnable is clear. But there are some corner cases where the cur=
rent
   212		 * se has been already dequeued but cfs_rq->curr still points to it=
.
   213		 * This means that weight will be 0 but not running for a sched_ent=
ity
   214		 * but also for a cfs_rq if the latter becomes idle. As an example,
   215		 * this happens during idle_balance() which calls
   216		 * update_blocked_averages().
   217		 *
   218		 * Also see the comment in accumulate_sum().
   219		 */
   220		if (!load)
   221			runnable =3D running =3D 0;
   222=09
   223		/*
   224		 * Now we know we crossed measurement unit boundaries. The *_avg
   225		 * accrues by two steps:
   226		 *
   227		 * Step 1: accumulate *_sum since last_update_time. If we haven't
   228		 * crossed period boundaries, finish.
   229		 */
   230		if (!accumulate_sum(delta, sa, load, runnable, running))
   231			return 0;
   232=09
   233		return 1;
   234	}
   235	EXPORT_SYMBOL_GPL(___update_load_sum);
   236=09
   237	/*
   238	 * When syncing *_avg with *_sum, we must take into account the curr=
ent
   239	 * position in the PELT segment otherwise the remaining part of the =
segment
   240	 * will be considered as idle time whereas it's not yet elapsed and =
this will
   241	 * generate unwanted oscillation in the range [1002..1024[.
   242	 *
   243	 * The max value of *_sum varies with the position in the time segme=
nt and is
   244	 * equals to :
   245	 *
   246	 *   LOAD_AVG_MAX*y + sa->period_contrib
   247	 *
   248	 * which can be simplified into:
   249	 *
   250	 *   LOAD_AVG_MAX - 1024 + sa->period_contrib
   251	 *
   252	 * because LOAD_AVG_MAX*y =3D=3D LOAD_AVG_MAX-1024
   253	 *
   254	 * The same care must be taken when a sched entity is added, updated=
 or
   255	 * removed from a cfs_rq and we need to update sched_avg. Scheduler =
entities
   256	 * and the cfs rq, to which they are attached, have the same positio=
n in the
   257	 * time segment because they use the same clock. This means that we =
can use
   258	 * the period_contrib of cfs_rq when updating the sched_avg of a sch=
ed_entity
   259	 * if it's more convenient.
   260	 */
   261	void
   262	___update_load_avg(struct sched_avg *sa, unsigned long load)
   263	{
   264		u32 divider =3D get_pelt_divider(sa);
   265=09
   266		/*
   267		 * Step 2: update *_avg.
   268		 */
   269		sa->load_avg =3D div_u64(load * sa->load_sum, divider);
   270		sa->runnable_avg =3D div_u64(sa->runnable_sum, divider);
   271		WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
   272	}
   273	EXPORT_SYMBOL_GPL(___update_load_avg);
   274=09
   275	/*
   276	 * sched_entity:
   277	 *
   278	 *   task:
   279	 *     se_weight()   =3D se->load.weight
   280	 *     se_runnable() =3D !!on_rq
   281	 *
   282	 *   group: [ see update_cfs_group() ]
   283	 *     se_weight()   =3D tg->weight * grq->load_avg / tg->load_avg
   284	 *     se_runnable() =3D grq->h_nr_running
   285	 *
   286	 *   runnable_sum =3D se_runnable() * runnable =3D grq->runnable_sum
   287	 *   runnable_avg =3D runnable_sum
   288	 *
   289	 *   load_sum :=3D runnable
   290	 *   load_avg =3D se_weight(se) * load_sum
   291	 *
   292	 * cfq_rq:
   293	 *
   294	 *   runnable_sum =3D \Sum se->avg.runnable_sum
   295	 *   runnable_avg =3D \Sum se->avg.runnable_avg
   296	 *
   297	 *   load_sum =3D \Sum se_weight(se) * se->avg.load_sum
   298	 *   load_avg =3D \Sum se->avg.load_avg
   299	 */
   300=09
   301	int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
   302	{
   303		if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
   304			___update_load_avg(&se->avg, se_weight(se));
   305			trace_pelt_se_tp(se);
   306			return 1;
   307		}
   308=09
   309		return 0;
   310	}
   311	EXPORT_SYMBOL_GPL(__update_load_avg_blocked_se);
   312=09
   313	int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sche=
d_entity *se)
   314	{
   315		if (___update_load_sum(now, &se->avg, !!se->on_rq, se_runnable(se),
   316					cfs_rq->curr =3D=3D se)) {
   317=09
   318			___update_load_avg(&se->avg, se_weight(se));
   319			cfs_se_util_change(&se->avg);
   320			trace_pelt_se_tp(se);
   321			return 1;
   322		}
   323=09
   324		return 0;
   325	}
   326=09
   327	int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
   328	{
   329		if (___update_load_sum(now, &cfs_rq->avg,
   330					scale_load_down(cfs_rq->load.weight),
   331					cfs_rq->h_nr_running,
   332					cfs_rq->curr !=3D NULL)) {
   333=09
   334			___update_load_avg(&cfs_rq->avg, 1);
   335			trace_pelt_cfs_tp(cfs_rq);
   336			return 1;
   337		}
   338=09
   339		return 0;
   340	}
   341=09
   342	/*
   343	 * rt_rq:
   344	 *
   345	 *   util_sum =3D \Sum se->avg.util_sum but se->avg.util_sum is not =
tracked
   346	 *   util_sum =3D cpu_scale * load_sum
   347	 *   runnable_sum =3D util_sum
   348	 *
   349	 *   load_avg and runnable_avg are not supported and meaningless.
   350	 *
   351	 */
   352=09
   353	int update_rt_rq_load_avg(u64 now, struct rq *rq, int running)
   354	{
   355		if (___update_load_sum(now, &rq->avg_rt,
   356					running,
   357					running,
   358					running)) {
   359=09
   360			___update_load_avg(&rq->avg_rt, 1);
   361			trace_pelt_rt_tp(rq);
   362			return 1;
   363		}
   364=09
   365		return 0;
   366	}
   367=09
   368	/*
   369	 * dl_rq:
   370	 *
   371	 *   util_sum =3D \Sum se->avg.util_sum but se->avg.util_sum is not =
tracked
   372	 *   util_sum =3D cpu_scale * load_sum
   373	 *   runnable_sum =3D util_sum
   374	 *
   375	 *   load_avg and runnable_avg are not supported and meaningless.
   376	 *
   377	 */
   378=09
   379	int update_dl_rq_load_avg(u64 now, struct rq *rq, int running)
   380	{
   381		if (___update_load_sum(now, &rq->avg_dl,
   382					running,
   383					running,
   384					running)) {
   385=09
   386			___update_load_avg(&rq->avg_dl, 1);
   387			trace_pelt_dl_tp(rq);
   388			return 1;
   389		}
   390=09
   391		return 0;
   392	}
   393=09
   394	#ifdef CONFIG_SCHED_THERMAL_PRESSURE
   395	/*
   396	 * thermal:
   397	 *
   398	 *   load_sum =3D \Sum se->avg.load_sum but se->avg.load_sum is not =
tracked
   399	 *
   400	 *   util_avg and runnable_load_avg are not supported and meaningles=
s.
   401	 *
   402	 * Unlike rt/dl utilization tracking that track time spent by a cpu
   403	 * running a rt/dl task through util_avg, the average thermal pressu=
re is
   404	 * tracked through load_avg. This is because thermal pressure signal=
 is
   405	 * time weighted "delta" capacity unlike util_avg which is binary.
   406	 * "delta capacity" =3D  actual capacity  -
   407	 *			capped capacity a cpu due to a thermal event.
   408	 */
   409=09
   410	int update_thermal_load_avg(u64 now, struct rq *rq, u64 capacity)
   411	{
   412		if (___update_load_sum(now, &rq->avg_thermal,
   413				       capacity,
   414				       capacity,
   415				       capacity)) {
   416			___update_load_avg(&rq->avg_thermal, 1);
   417			trace_pelt_thermal_tp(rq);
   418			return 1;
   419		}
   420=09
   421		return 0;
   422	}
   423	#endif
   424=09
   425	#ifdef CONFIG_HAVE_SCHED_AVG_IRQ
   426	/*
   427	 * irq:
   428	 *
   429	 *   util_sum =3D \Sum se->avg.util_sum but se->avg.util_sum is not =
tracked
   430	 *   util_sum =3D cpu_scale * load_sum
   431	 *   runnable_sum =3D util_sum
   432	 *
   433	 *   load_avg and runnable_avg are not supported and meaningless.
   434	 *
   435	 */
   436=09
   437	int update_irq_load_avg(struct rq *rq, u64 running)
   438	{
   439		int ret =3D 0;
   440=09
   441		/*
   442		 * We can't use clock_pelt because irq time is not accounted in
   443		 * clock_task. Instead we directly scale the running time to
   444		 * reflect the real amount of computation
   445		 */
   446		running =3D cap_scale(running, arch_scale_freq_capacity(cpu_of(rq))=
);
   447		running =3D cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)))=
;
   448=09
   449		/*
   450		 * We know the time that has been used by interrupt since last upda=
te
   451		 * but we don't when. Let be pessimistic and assume that interrupt =
has
   452		 * happened just before the update. This is not so far from reality
   453		 * because interrupt will most probably wake up task and trig an up=
date
   454		 * of rq clock during which the metric is updated.
   455		 * We start to decay with normal context time and then we add the
   456		 * interrupt context time.
   457		 * We can safely remove running from rq->clock because
   458		 * rq->clock +=3D delta with delta >=3D running
   459		 */
   460		ret =3D ___update_load_sum(rq->clock - running, &rq->avg_irq,
   461					0,
   462					0,
   463					0);
   464		ret +=3D ___update_load_sum(rq->clock, &rq->avg_irq,
   465					1,
   466					1,
   467					1);
   468=09
   469		if (ret) {
   470			___update_load_avg(&rq->avg_irq, 1);
   471			trace_pelt_irq_tp(rq);
   472		}
   473=09
   474		return ret;
   475	}
   476	#endif
   477=09
   478	__read_mostly unsigned int sched_pelt_lshift;
   479=09
   480	#ifdef CONFIG_SYSCTL
 > 481	#include <trace/hooks/sched.h>
   482	static unsigned int sysctl_sched_pelt_multiplier =3D 1;
   483=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

