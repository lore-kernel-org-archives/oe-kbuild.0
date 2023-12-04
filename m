Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999D10EA
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8r0LMQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656377; x=1733192377;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1JNpwUcYChwOmH6FvPulHb7caUYVs5NjmdchrRYMyvY=;
  b=f8r0LMQkhF21JWxOt3piNu6P4iQy1QfoL8if+VigzH+FrukQWoh3I6eK
   AJzLCjYJm0VxKzGL6yHbrJdeY6HnTgd3y2k0R5d4pneUGcbqBcmf1LD8/
   DABJSf6jOJBGDluHWyh2zIg6Pwf10FYWxaWHUEIA0vdUtZE6UU5nf/ELQ
   KhX9tcDT+7u1l3f+37bgrpJgStvqLP/paFYjb272fvo93cZShg2wAW4vw
   pOpBKTIZtm7Gkd0GPP9DlKBQj3Tp0UICXk3wAgohbLWJm0Hqsj2uIEkGa
   cMJaW8mb2hI2R1ZuR6xTeaK3si/jlNDjFcQO5L8cdtruUh+GWG2b31zPT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397560106"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="397560106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:19:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="799431819"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="799431819"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:19:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:19:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:19:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:19:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:19:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eigapQxgoCklQQDj3jThmyktk1+g3a36JN0m0fMGExd46HFqCImKmXWo6PAtKB4bAcaL3WX1Z30WEPzTHJUiHmzW8g4KT6EfyXOJDk4k8Z15pEtXmEWCr/3cogHjvfFxdJFOtjOkU+n2dUlAE5Hed1msqKuqGZapoOKbJjPsYo7WlknCEBphPRdwbPN4JSoIuMrESeYMGBRqQ1mhFstGUZQ+TNM3GCYnYmNYT1Ez9nCyyt9vckS8wGsuXdFsvWszD5met8H/7JHcs/EYricDUcTGkIgKAlNa5T3VX7VzDERXaXkS5CqoBQJzSby1weRNeQ6HW1ZN3yqeoJMHeB71cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj2AEZd6t+GMTVImfDSLWrUMRU5xJEO/90OQqdHfJQY=;
 b=TmHsSq/Bku84EfzWZOvfXEQ8bBaDXFTKBqJFlMGR4QrWq/kEBZ9cPXKpqONGeNyAiR38LiG58QwqWwvbDLmo29+7L+5Lt2UeGPXdVc4BMbFuvtXfwKJPEoXeeSQRAELxC5tbQJnmZyAgGc8VX32L+9v0WUNxzQyJW3bxovoNlxOa9SnmwBeAePgAbEUCwvd70r2A3m/cV4varPNnIw2VxMAj9A3VruT2sqAsRNBXcrXBGQRd8ZZ6ucq6QMgV10+KbKiSWD97m2E4XEhFRIOzHYeKqZtlJ4vEpXwxKr5RhSApyZoMiEqglrfljB+XLKZrFAgd8h7+QLh58Q3Slv1Kvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:19:32 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:19:32 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/video/fbdev/offb.c:373:48: sparse: sparse: incorrect type
 in initializer (different base types)
Thread-Topic: drivers/video/fbdev/offb.c:373:48: sparse: sparse: incorrect
 type in initializer (different base types)
Thread-Index: AQHaJbKyJBjMAUz+KE+V7taf0GYw3LCYZSSg
Date: Mon, 4 Dec 2023 02:19:32 +0000
Message-ID: <CY5PR11MB63923C099FA3618015644662FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312030347.wIrL2ww1-lkp@intel.com>
In-Reply-To: <202312030347.wIrL2ww1-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 9a16534f-8c34-494a-a3be-08dbf46f7409
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NwULFaAG/feSwUFUcBIW+oyub6oZIm+L1IBe7GTEyy8VmVcAi2Iy7c/8iL8ycLYEPD7SbDIErZg6pLcvu0SPh8O/a4RpTHcMVcBqkqYcydEF43V2sTPtKjUa3sGj7MZrIYFHLnRoF4Wf4888+qci5QdHVEKOWqHI7eTa/nqktCoC/qREiP4ef8qOuYjqD7YwmFey1V2sVvHJYjMNX8cQa/niS/oPIw9oEkPT9w8u5XvrBDqhgrnsjT8bY/rf8edY6BuF1eVKy4XtbZIpimVlqjnfGwMYCCRUqMQ6RY97o5d+Zfbf+owvCXASlAJJ3yaaiJgVBRyvvL5mk82MKm/2SP+6cTjBTTetJwM8YD1JpEZ/WZWbXevhhEX+hArpynjs0WV4HVkbwYZy2Bo3dPFwwuMWT2pXtS+/VhbbnSdXYCS7jFnw+PvMsb7DQ250Fli9ULnMJKI0jpMHElcDqqlHXtlGyoptrenY3f68WE19yhO4kMHMt+k5eWAikavMmq0QXd6X8w3og+HQ2sqN6qnkBmxFFTftqK7OsP1E5veFfgLfIfElP0xPzD/XFT1xutO9F8WH5Qzar702PpzsCZZ4uWFOyIpbXf8Ac2rC1aLHBvgDbM6C0ppczdjR+KTk6u/UMAvji2rFI7Kuq7/BWRJCx+Ss2BpzOwerUYOrs4vfe8PTY3wPo41LZ84k1G2myMHd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(316002)(110136005)(83380400001)(38100700002)(8936002)(8676002)(52536014)(33656002)(5660300002)(86362001)(122000001)(2906002)(38070700009)(41300700001)(4001150100001)(55016003)(82960400001)(478600001)(26005)(53546011)(6506007)(71200400001)(9686003)(7696005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0Q99DXu0VGIcPxZeV+kbzVzziBXLFkBq2KldMdAn30koYKzgjwqANj1IN/F8?=
 =?us-ascii?Q?d96Z2CAD+Jg1N0YuENPyBpmt4EPKqJg9LiRWm6iJf6CMEmbUCC+xTI6LmFoT?=
 =?us-ascii?Q?T3qyvC15TDGUeBlvkq1zopktWYJ9CVdDnorDQVZnWtcxA2p7bHMf6UjjEOf9?=
 =?us-ascii?Q?mdY1T1G6alABu4hX7kyhP7pjm0DNjksjxyZ7Pl6OzB/dDjziRcoLQcSP9gJ0?=
 =?us-ascii?Q?mWh1QogpjktmSY7YN3ujT/4lC5gKTVZI+3WNNuxHarTyCnc9b4S1WKvt34DR?=
 =?us-ascii?Q?/aSoca2SatonOiMz0sn4Rn0EhZ1b7r5/zHHX50WiBUKJkkg/nUsgojmkOl7a?=
 =?us-ascii?Q?RRr96Gg4DWpVXRjkbpvph94s0afqmr7j1Gu5o8DA7p6HMvdJGCBC8yigEttN?=
 =?us-ascii?Q?xREtyJJWm8BCEcD8LDIsnmjIL+qgEQdtcznzv8GoCIleV/kzReBa6EV+/+Xb?=
 =?us-ascii?Q?H6KXB8SILakWuyUPN9klhWArCHuAUQc4ID0B7QPOcXO6Fs/Tf+M0R/jxu6/u?=
 =?us-ascii?Q?iFxm0sD0a5lnF5epf7Mw4L2mrTZrRFmS0n1cPJv2+ocFAm875y0QW7N69+Ds?=
 =?us-ascii?Q?NmqZdPifzmYwM8Ofvy5yf7RMOCrz2LDIxbDTce0FV77iLuzLknXOLvauF2nt?=
 =?us-ascii?Q?EJrAbE2QViTB+yCaKPSELqSczk7JcG1syBg/QgJ4IUrvpAxvwBFdoKUH583F?=
 =?us-ascii?Q?EzzBPFu0hICB1szkAf3oN1+IqpTF1jyx1Kn/WW19aiOnk4v+M9pMJDd8n3ji?=
 =?us-ascii?Q?8PCjUn/p1+6RMvXV2vB5E5i0M5Jyu1FWrADyRWJx2kNIHyWkt40iKJeBjKd7?=
 =?us-ascii?Q?tzDWA4IQkQdX5TdLQ3lNOTBIiJ+OFQ6XAAVbm2SVehS1DPkNEKqiSCgfYhy7?=
 =?us-ascii?Q?1B+00RNON9H9EhJKebkxJ1hWgjNtPPbmc7Ppw4oK7YQZfjagE3CNeOxrsXWq?=
 =?us-ascii?Q?r2kAHVU/Vv6Ci8v+13FOtTzJv6Ha/C8lnWVdqPALLRdQ5QlUrOOJadbh7zOD?=
 =?us-ascii?Q?Kv5NS8gMRigF4KQ6J1ZPTpkhUkeaE4yVFqS4qqqCq0omXVzHcUr34LZxtud8?=
 =?us-ascii?Q?TsRbxtg/zeN5kNwuaLs3xFF2t0vKobCCYQoa4cWpSEZZADFL56jUyme3TlDg?=
 =?us-ascii?Q?2EcgQeoZAvX/FIG9Q2KsTh0bD6fNOkYCYQ6LH2DofqZBujwCf1+HjREdzkgd?=
 =?us-ascii?Q?ea/56FA3jWGiXVTcjsnoyugcFGBQLv9hH8WcgFnobCWbVjlpQ0OodgxdjHEl?=
 =?us-ascii?Q?ihCBfMoMfIHJ5BvkwKtWX9Gzrz/EuAdUirmdV0h2TR+cyvDDgtisJOX/Iiui?=
 =?us-ascii?Q?9nVqXsth5U4C/5j68Ktce2/AMkPai21Wqd9DwlRI17WP9reBAOe3M5y46liG?=
 =?us-ascii?Q?TsnaF0KNLmjfJjL2Lz0nH6AqCLDcpZa2Wf+z0kz3pPAWf6CJMxFVOtqjc+Xo?=
 =?us-ascii?Q?Ojoz/vWVoWLIJGHoYPiigDlZLztCJMeVMpebG8Z9Em/qmIUbhH0Urt3ejYPV?=
 =?us-ascii?Q?C+4U1UufKIt+OUpdJZjVHlvPnB0WpWw90JlpUfETUpvGNs/P8ZBMLgtRVbyY?=
 =?us-ascii?Q?zkeqGSlA+rN9WenDfpKAeT1BhmaPTR1LmucAKJ8v?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a16534f-8c34-494a-a3be-08dbf46f7409
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:19:32.8087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zp1u5kTE6P632EQcmI1D8Q3iy9POtMuts7pGo5lKmKPO1zMrUFjiVP57OOGowQrqU9bPoSqxRuZXeCo5/kwHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

not_report

only kconfig change:

drivers/video/fbdev/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 14:32
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/video/fbdev/offb.c:373:48: sparse: sparse: incorrect type =
in initializer (different base types)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 9d8b5376cc2848ca22314fdec9a7a45b1bf69189 fbdev: make offb driver tr=
istate
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-r121-20231107 (https://download.01.org/0day-ci/a=
rchive/20231203/202312030347.wIrL2ww1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030347.w=
IrL2ww1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312030347.wIrL2ww1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/offb.c:373:48: sparse: sparse: incorrect type in ini=
tializer (different base types) @@     expected restricted __be32 @@     go=
t int @@
   drivers/video/fbdev/offb.c:373:48: sparse:     expected restricted __be3=
2
   drivers/video/fbdev/offb.c:373:48: sparse:     got int
>> drivers/video/fbdev/offb.c:581:42: sparse: sparse: restricted __be32 deg=
rades to integer
>> drivers/video/fbdev/offb.c:602:27: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int addr_prop @@   =
  got restricted __be32 const [usertype] @@
   drivers/video/fbdev/offb.c:602:27: sparse:     expected unsigned int add=
r_prop
   drivers/video/fbdev/offb.c:602:27: sparse:     got restricted __be32 con=
st [usertype]

vim +373 drivers/video/fbdev/offb.c

^1da177e4c3f41 drivers/video/offb.c       Linus Torvalds         2005-04-16=
  322 =20
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  323  static void offb_init_palette_hacks(struct fb_info *info, struct dev=
ice_node *dp,
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  324  				    unsigned long address)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  325  {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  326  	struct offb_par *par =3D (struct offb_par *) info->par;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  327 =20
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  328  	if (of_node_name_prefix(dp, "ATY,Rage128")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  329  		par->cmap_adr =3D offb_map_reg(dp, 2, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  330  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  331  			par->cmap_type =3D cmap_r128;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  332  	} else if (of_node_name_prefix(dp, "ATY,RageM3pA") ||
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  333  		   of_node_name_prefix(dp, "ATY,RageM3p12A")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  334  		par->cmap_adr =3D offb_map_reg(dp, 2, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  335  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  336  			par->cmap_type =3D cmap_M3A;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  337  	} else if (of_node_name_prefix(dp, "ATY,RageM3pB")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  338  		par->cmap_adr =3D offb_map_reg(dp, 2, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  339  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  340  			par->cmap_type =3D cmap_M3B;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  341  	} else if (of_node_name_prefix(dp, "ATY,Rage6")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  342  		par->cmap_adr =3D offb_map_reg(dp, 1, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  343  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  344  			par->cmap_type =3D cmap_radeon;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  345  	} else if (of_node_name_prefix(dp, "ATY,")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  346  		unsigned long base =3D address & 0xff000000UL;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  347  		par->cmap_adr =3D
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  348  			ioremap(base + 0x7ff000, 0x1000) + 0xcc0;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  349  		par->cmap_data =3D par->cmap_adr + 1;
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  350  		par->cmap_type =3D cmap_simple;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  351  	} else if (dp && (of_device_is_compatible(dp, "pci1014,b7") ||
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  352  			  of_device_is_compatible(dp, "pci1014,21c"))) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  353  		par->cmap_adr =3D offb_map_reg(dp, 0, 0x6000, 0x1000);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  354  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  355  			par->cmap_type =3D cmap_gxt2000;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11=
  356  	} else if (of_node_name_prefix(dp, "vga,Display-")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  357  		/* Look for AVIVO initialized by SLOF */
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  358  		struct device_node *pciparent =3D of_get_parent(dp);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  359  		const u32 *vid, *did;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  360  		vid =3D of_get_property(pciparent, "vendor-id", NULL);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  361  		did =3D of_get_property(pciparent, "device-id", NULL);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  362  		/* This will match most R5xx */
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  363  		if (vid && did && *vid =3D=3D 0x1002 &&
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  364  		    ((*did >=3D 0x7100 && *did < 0x7800) ||
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  365  		     (*did >=3D 0x9400))) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  366  			par->cmap_adr =3D offb_map_reg(pciparent, 2, 0, 0x10000);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  367  			if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  368  				par->cmap_type =3D cmap_avivo;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  369  		}
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  370  		of_node_put(pciparent);
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  371  	} else if (dp && of_device_is_compatible(dp, "qemu,std-vga")) {
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04=
  372  #ifdef __BIG_ENDIAN
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04=
 @373  		const __be32 io_of_addr[3] =3D { 0x01000000, 0x0, 0x0 };
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04=
  374  #else
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04=
  375  		const __be32 io_of_addr[3] =3D { 0x00000001, 0x0, 0x0 };
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04=
  376  #endif
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  377  		u64 io_addr =3D of_translate_address(dp, io_of_addr);
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  378  		if (io_addr !=3D OF_BAD_ADDR) {
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  379  			par->cmap_adr =3D ioremap(io_addr + 0x3c8, 2);
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  380  			if (par->cmap_adr) {
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  381  				par->cmap_type =3D cmap_simple;
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  382  				par->cmap_data =3D par->cmap_adr + 1;
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  383  			}
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14=
  384  		}
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  385  	}
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  386  	info->fix.visual =3D (par->cmap_type !=3D cmap_unknown) ?
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  387  		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_STATIC_PSEUDOCOLOR;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  388  }
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17=
  389 =20

:::::: The code at line 373 was first introduced by commit
:::::: 212c0cbd5be721a39ef3e2f723e0c78008f9e955 offb: Little endian fixes

:::::: TO: Cedric Le Goater <clg@fr.ibm.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

