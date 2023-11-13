Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A404409
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 01:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndWWXBLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699837549; x=1731373549;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=IaEFKk/uquPYbUpqDWeavj9LFOtDTimt6Vauad5uTAs=;
  b=ndWWXBLAUw5+DE++GQSHXiGvu4TINbv2wuPfVDllOtLmGV5pLe7a5dMG
   r5ijWcr4b8eq1zJ/LACPxrKLKP1JGgU9a/ttCwjc20Kl7Yo9yWJTtdmJN
   YxwnhPVXlpPTwq3d0JBaefQE3q/K5ENP0miNRADXxOB3GH6FbmUr7nYJo
   FbOLDGEapnR53FUQ97Qskp3iW2p+UD4WLNdT9bIvQ2baJMB67o6oOeApt
   HhRI1AvxBxrS9jXrO5dL7Vyapbs7BvBA3vjKSu4GGTRinW+TyLMW7EnqB
   c6MrIN5RLLKwqGFtj/cBFCu+JuZC9Y0N76y3ikVCZ5rrJalZ6iUDAIuDa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421460349"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="421460349"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 17:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767769533"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="767769533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 17:05:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:05:48 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:05:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 17:05:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 17:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5czo/kqGijU04KL9omI3vi3fJ5a9d572XBFDUNdfOcd5XpmD32wRIJwyIaX1Y1QH8XP5GtW06T+ktOow85GsZKbRW1FVqNS/iwZCrC2BxyMuxPWwj+qH2Lq7Gy/uZ0xmfH6B2ZzitRT4UHSSmXebaeJu21i2jtecG8MZFLMhSUjZCzp7gGOS626Ab2JJvWkGlj/vAH4Vr7ih078uS4gXMSiKVMsimNw48IOkccgPWPMJUJLUNxS84MUVKQH0mmg6JA11RzTw3kXFl+tXkpZq2B6c2tLRuKKOycG3kXUq/SMzFKNjddcDMyuRRx+47WpBQA6za1Eb8OoG43pzc9eSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANCUvr//JNG+lqxXMWLlsdBU0XVxMQg8a+GFwh7j2yQ=;
 b=WpzwvnwJjgtmtyhxGA94PDsiTY91EQ3nvPuhnhW3bcqybFa4LP0h/N7wS6qtAa2JIbLH400b+UcSGWo7Gkx7wTq5SLBjs1qBaVDhQpdsefofDQhi5lnmF0P2Eq3/0l/LzR01FWvISYiHfXfYelKMYDk1B9TeLiH6+LsG0TuCewzvsFdqgRFHznGtVNNUvgK+GtAFRNh8Ju7/QSTsehJPPCTg2tPRRX3JISozAIEx/9k85A0shQWeXkL4P2/PERifke/PYg9krQwCvAkW/88uyUGBU4E2ajUQupFpxn1ugpSCe4OpEEy45N/Nr801bNa4rOXIsW/nvmgObLKzBl4MXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:05:44 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 01:05:44 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/crypto/inside-secure/safexcel.c:1103:30: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 2
Thread-Topic: drivers/crypto/inside-secure/safexcel.c:1103:30: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 2
Thread-Index: AQHaFNjPIkwiicf3IE2yOW7/XtNTjLB3cQ1w
Date: Mon, 13 Nov 2023 01:05:44 +0000
Message-ID: <CY5PR11MB639248E662571CADB86928F1FBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311120319.2ZVpDvrs-lkp@intel.com>
In-Reply-To: <202311120319.2ZVpDvrs-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6722:EE_
x-ms-office365-filtering-correlation-id: e95286d5-f628-435f-1380-08dbe3e4a9aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b9vA2zKvsP/F4vCuSYT8+Vq2YpG4IMbLpCGGdeNfrNlMS3+SmDGonmcjtv0jwjT4UdctIjbBr9s1yTxOu1mqLz2UeEAKT0dvletHknc/zU11bkzpOsZx4NnqM0HjBs3eX2oOdxYv//gMD3ai1a74jhAUIdbkx9cXBhhgWNtBOwBf72pCl0zBRsy6Ce34J1C4HlKAAt+js7c2m8Y9koAkDjvprJ8o2UbXPUxeKIEyTQ0nUuo6yMVSfIt/zRaKV9wvqK4OOE++iZ9z48WfgHocOxzsRnszcJh7parxievPpN6S+JtGYolucJTMRkoizdMhfv61B2Q2xX335n5mK2smmFtcg854ikxXdPMcf/u+i4Ab4ooD7VqU4Iz5U8xQe4EqZ/lWcaSagcoR0aGfVA8LZekmbr+Vw+nQq1phH+3c6EowvE6VX5t5vMiE+Gy3jPKdIUez6f7Ye36Lj5SJzS3r0Ik32vAh87B3mw9LBCKnJGRxbrBVwbTjfPXt3kYCRLvdVzqWbOAGGG29xSYHfQGx+AvXwk7yHSCnwYlz7Te08aVjl97smJ6w/LvgyGX48Fnv67owSBiILgr/BH2qy5P2naDL66E6Jv7Yfbdpl4/sEsqZvcuRVhqc+8AAe2FREqE6MdYHZ5kVuXbzrlSfvQEOvEE4XD1IeExnjvRKLO1poj9BpdgckgNF5rbM5KE0D6Av
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230273577357003)(230922051799003)(230173577357003)(1800799009)(64100799003)(186009)(451199024)(26005)(66574015)(53546011)(6506007)(7696005)(71200400001)(9686003)(83380400001)(5660300002)(8676002)(8936002)(52536014)(41300700001)(30864003)(2906002)(4001150100001)(966005)(478600001)(316002)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(82960400001)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cnfCnmopph//sou30m67ha1EaYTd8UsCzOL412vevulZi/UVZl2S44T3IU?=
 =?iso-8859-1?Q?G48d2Y/r3AJ687Kapluje97myZ8fvCr1t+u1uAwpPyx1gLNOmsMmOkD0ru?=
 =?iso-8859-1?Q?Go7RxMEypYbv0RTkIU+ii4PgftAlr4rmTqLZwqja/arkUR+UQ0DCAbg1RX?=
 =?iso-8859-1?Q?wMzweVC1p9DvB23Yhe7TOXwtajSSq8V8EaG5PYmfIjIyxUoZAzdI3sZmc7?=
 =?iso-8859-1?Q?7sYHZizW/WIGGfxnMdFgc63lUor3o3CxNSCagXAsT3+C6VGmh36+Uqgg3A?=
 =?iso-8859-1?Q?AhWTYs3LbAKbdWK57yxDCM7FlXfD54HjFhBw2CG2t+rPTsbzPHnzc4tfMr?=
 =?iso-8859-1?Q?unP040tTwsRVW/1GA/iYofccpimPbJVauzPY5FXyYZyK1goUOEZpXAN5OO?=
 =?iso-8859-1?Q?ttZ/VQlXwUzHtieS0cVp8k62cJxT4wbeT3cGRzlhd3U8jOekGEFaKvBliu?=
 =?iso-8859-1?Q?Y6ogEU97TZFdWZt6AbkRIAoVI895deUhUNV/aZlrOKqBTiPw3Vivxt1gqM?=
 =?iso-8859-1?Q?55QSrABO7lPmLp5A+ckdSGFghYC5zvoKPA1tBHium6A1wXFdtFWfEI5cgI?=
 =?iso-8859-1?Q?eFL2ejoStpED/HcA7o54QRxENtTRVpm3dw7cZ0HMZMaGpklkwxBgf82fHa?=
 =?iso-8859-1?Q?j7H42jQve7ac0ICMsdHW7XpG6opspq5UdhqErfXauFFY7czL72IcqzW2WI?=
 =?iso-8859-1?Q?ZEAAyp1xlDFcMTM7Wv1sWGLG3ZV9CfAYaAINZvOjsUtsFhvogRPhUGJSo0?=
 =?iso-8859-1?Q?wKNJkafFKyHYf5HPrFGUSDoXeM7eN8lngaJSizBeP3Tq/ePeMD3qZMw6yW?=
 =?iso-8859-1?Q?n0Q2WtW6wQ9VaTWTlB9/YvQYYTHloUN5yUGcDOYDrUdL7/uUtrEIlDsjWC?=
 =?iso-8859-1?Q?Jd7p7/bcrBhVGrI0utSlseEEElF5FBE0jgNoaffwqhFDmUlTO8pmLyjyTC?=
 =?iso-8859-1?Q?KY5FMhCJjIyl7uTrh5tpFPoz4IBFOnO+OosByGsNlX/XaM52pPQxY8subz?=
 =?iso-8859-1?Q?FzDMhEzHJ0sqAAhY2vBcvifTk43pKq98q+sbpE5RaKn5h67oZxVSFzYFt8?=
 =?iso-8859-1?Q?b6RQuKOwVt+UMl8J7N0xCnrKDPJi3ugCXA294hvr1hiF31E2B2QyLHsW48?=
 =?iso-8859-1?Q?5jkJw8EpGXpbH6dog13rkSPtZoYYlsCYWVHsXXhF7zwFRP5Wg30RSVGCpj?=
 =?iso-8859-1?Q?pczNOslMV/4VewT8l1P2S4NFTyicSTMbURHqwGTZd2jJT9MBD2MRRTGoLj?=
 =?iso-8859-1?Q?Ct3WfYRppTLd7HI/8AI/dP8daIJ9maLypBSQO6CSsd87EKNKlbYORFxhxW?=
 =?iso-8859-1?Q?PzflY3PZ2RzpGpgNl3HCflFdkL6J1lUfBJg2H3+PDwKwRRaQXop3gc3oSc?=
 =?iso-8859-1?Q?d0E/qjw0Xp34hOKXPJTlbpfOktyIbJ8/ApTMdJY8OYqCptCjulOeZWD92Y?=
 =?iso-8859-1?Q?Ewnxjyw8Wqj3J4XR612Ly+X7vnPATlXSLekDNrCxCrs1o64KdpgR7yr2IJ?=
 =?iso-8859-1?Q?3dV4QB26/1SgfSz25GjLBndxF1L+ON4l6im3Bfd6G0BWWneb3uFpWEui0y?=
 =?iso-8859-1?Q?imnaXKAfu6B8daXkg+W0vKmFy8i+/nZf/E8iwb6345xOBxbir7aCeHtnqb?=
 =?iso-8859-1?Q?UK0kTYMACE2aWLXbTXsYp/C+cNJYRuaBX1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95286d5-f628-435f-1380-08dbe3e4a9aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 01:05:44.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q61fuOfVOCfYPJ1RVKm49aGfd5F6x37Z4HPDQR8vbZVIiimdhaZ/RvE2byht6E72chbcJ0lvaPchBBZ3B5hkAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
X-OriginatorOrg: intel.com

not_report

Only Kconfig file is changed. No relation with the "format-truncation" warn=
ing.

drivers/crypto/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, November 12, 2023 03:53
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/crypto/inside-secure/safexcel.c:1103:30: warning: '%d' dir=
ective output may be truncated writing between 1 and 10 bytes into a region=
 of size 2

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pascal van Leeuwen <pvanleeuwen@insidesecure.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Pascal,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 0f6e5c8234778f7dadf5789ce85ac1e062ebed9f crypto: inside-secure - ma=
ke driver selectable for non-Marvell hardware
date:   4 years, 2 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 years, 2 months ago
config: x86_64-randconfig-r011-20230829 (https://download.01.org/0day-ci/ar=
chive/20231112/202311120319.2ZVpDvrs-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231112/202311120319.2ZVpDvrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120319.2ZVpDvrs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/inside-secure/safexcel.c: In function 'safexcel_probe':
>> drivers/crypto/inside-secure/safexcel.c:1103:30: warning: '%d' directive=
 output may be truncated writing between 1 and 10 bytes into a region of si=
ze 2 [-Wformat-truncation=3D]
      snprintf(irq_name, 6, "ring%d", i);
                                 ^~
   drivers/crypto/inside-secure/safexcel.c:1103:25: note: directive argumen=
t in the range [0, 2147483647]
      snprintf(irq_name, 6, "ring%d", i);
                            ^~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1103:3: note: 'snprintf' output =
between 6 and 15 bytes into a destination of size 6
      snprintf(irq_name, 6, "ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1116:32: warning: '%d' directive=
 output may be truncated writing between 1 and 10 bytes into a region of si=
ze 2 [-Wformat-truncation=3D]
      snprintf(wq_name, 9, "wq_ring%d", i);
                                   ^~
   drivers/crypto/inside-secure/safexcel.c:1116:24: note: directive argumen=
t in the range [0, 2147483647]
      snprintf(wq_name, 9, "wq_ring%d", i);
                           ^~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1116:3: note: 'snprintf' output =
between 9 and 18 bytes into a destination of size 9
      snprintf(wq_name, 9, "wq_ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1103 drivers/crypto/inside-secure/safexcel.c

871df319bd48ac Antoine Tenart     2017-12-14   998 =20
1b44c5a60c137e Antoine Tenart     2017-05-24   999  static int safexcel_pro=
be(struct platform_device *pdev)
1b44c5a60c137e Antoine Tenart     2017-05-24  1000  {
1b44c5a60c137e Antoine Tenart     2017-05-24  1001  	struct device *dev =3D=
 &pdev->dev;
1b44c5a60c137e Antoine Tenart     2017-05-24  1002  	struct safexcel_crypto=
_priv *priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1003  	int i, ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1004 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1005  	priv =3D devm_kzalloc(=
dev, sizeof(*priv), GFP_KERNEL);
1b44c5a60c137e Antoine Tenart     2017-05-24  1006  	if (!priv)
1b44c5a60c137e Antoine Tenart     2017-05-24  1007  		return -ENOMEM;
1b44c5a60c137e Antoine Tenart     2017-05-24  1008 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1009  	priv->dev =3D dev;
871df319bd48ac Antoine Tenart     2017-12-14  1010  	priv->version =3D (enu=
m safexcel_eip_version)of_device_get_match_data(dev);
871df319bd48ac Antoine Tenart     2017-12-14  1011 =20
5eb0911894b17e Antoine Tenart     2018-06-28  1012  	if (priv->version =3D=
=3D EIP197B || priv->version =3D=3D EIP197D)
53c83e915ce8b2 Antoine Tenart     2018-06-28  1013  		priv->flags |=3D EIP1=
97_TRC_CACHE;
53c83e915ce8b2 Antoine Tenart     2018-06-28  1014 =20
871df319bd48ac Antoine Tenart     2017-12-14  1015  	safexcel_init_register=
_offsets(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1016 =20
f8dab5575b76ea YueHaibing         2019-08-02  1017  	priv->base =3D devm_pl=
atform_ioremap_resource(pdev, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1018  	if (IS_ERR(priv->base)=
) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1019  		dev_err(dev, "failed =
to get resource\n");
1b44c5a60c137e Antoine Tenart     2017-05-24  1020  		return PTR_ERR(priv->=
base);
1b44c5a60c137e Antoine Tenart     2017-05-24  1021  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1022 =20
f962eb46e7a9b9 Gregory CLEMENT    2018-03-13  1023  	priv->clk =3D devm_clk=
_get(&pdev->dev, NULL);
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1024  	ret =3D PTR_ERR_OR_ZER=
O(priv->clk);
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1025  	/* The clock isn't man=
datory */
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1026  	if  (ret !=3D -ENOENT)=
 {
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1027  		if (ret)
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1028  			return ret;
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1029 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1030  		ret =3D clk_prepare_e=
nable(priv->clk);
1b44c5a60c137e Antoine Tenart     2017-05-24  1031  		if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1032  			dev_err(dev, "unable=
 to enable clk (%d)\n", ret);
1b44c5a60c137e Antoine Tenart     2017-05-24  1033  			return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1034  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1035  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1036 =20
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1037  	priv->reg_clk =3D devm=
_clk_get(&pdev->dev, "reg");
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1038  	ret =3D PTR_ERR_OR_ZER=
O(priv->reg_clk);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1039  	/* The clock isn't man=
datory */
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1040  	if  (ret !=3D -ENOENT)=
 {
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1041  		if (ret)
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1042  			goto err_core_clk;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1043 =20
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1044  		ret =3D clk_prepare_e=
nable(priv->reg_clk);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1045  		if (ret) {
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1046  			dev_err(dev, "unable=
 to enable reg clk (%d)\n", ret);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1047  			goto err_core_clk;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1048  		}
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1049  	}
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1050 =20
a2069aacbe58a8 Antoine Tenart     2017-06-23  1051  	ret =3D dma_set_mask_a=
nd_coherent(dev, DMA_BIT_MASK(64));
1b44c5a60c137e Antoine Tenart     2017-05-24  1052  	if (ret)
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1053  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1054 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1055  	priv->context_pool =3D=
 dmam_pool_create("safexcel-context", dev,
1b44c5a60c137e Antoine Tenart     2017-05-24  1056  					      sizeof(struc=
t safexcel_context_record),
1b44c5a60c137e Antoine Tenart     2017-05-24  1057  					      1, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1058  	if (!priv->context_poo=
l) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1059  		ret =3D -ENOMEM;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1060  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1061  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1062 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1063  	safexcel_configure(pri=
v);
1b44c5a60c137e Antoine Tenart     2017-05-24  1064 =20
329e09893909d4 Kees Cook          2018-10-05  1065  	priv->ring =3D devm_kc=
alloc(dev, priv->config.rings,
329e09893909d4 Kees Cook          2018-10-05  1066  				  sizeof(*priv->rin=
g),
18e0e95b82e444 Ofer Heifetz       2018-06-28  1067  				  GFP_KERNEL);
18e0e95b82e444 Ofer Heifetz       2018-06-28  1068  	if (!priv->ring) {
18e0e95b82e444 Ofer Heifetz       2018-06-28  1069  		ret =3D -ENOMEM;
18e0e95b82e444 Ofer Heifetz       2018-06-28  1070  		goto err_reg_clk;
18e0e95b82e444 Ofer Heifetz       2018-06-28  1071  	}
18e0e95b82e444 Ofer Heifetz       2018-06-28  1072 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1073  	for (i =3D 0; i < priv=
->config.rings; i++) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1074  		char irq_name[6] =3D =
{0}; /* "ringX\0" */
1b44c5a60c137e Antoine Tenart     2017-05-24  1075  		char wq_name[9] =3D {=
0}; /* "wq_ringX\0" */
1b44c5a60c137e Antoine Tenart     2017-05-24  1076  		int irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1077  		struct safexcel_ring_=
irq_data *ring_irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1078 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1079  		ret =3D safexcel_init=
_ring_descriptors(priv,
1b44c5a60c137e Antoine Tenart     2017-05-24  1080  						     &priv->ring[=
i].cdr,
1b44c5a60c137e Antoine Tenart     2017-05-24  1081  						     &priv->ring[=
i].rdr);
1b44c5a60c137e Antoine Tenart     2017-05-24  1082  		if (ret)
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1083  			goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1084 =20
329e09893909d4 Kees Cook          2018-10-05  1085  		priv->ring[i].rdr_req=
 =3D devm_kcalloc(dev,
329e09893909d4 Kees Cook          2018-10-05  1086  			EIP197_DEFAULT_RING_=
SIZE,
329e09893909d4 Kees Cook          2018-10-05  1087  			sizeof(priv->ring[i]=
.rdr_req),
9744fec95f0674 Ofer Heifetz       2018-06-28  1088  			GFP_KERNEL);
9744fec95f0674 Ofer Heifetz       2018-06-28  1089  		if (!priv->ring[i].rd=
r_req) {
9744fec95f0674 Ofer Heifetz       2018-06-28  1090  			ret =3D -ENOMEM;
9744fec95f0674 Ofer Heifetz       2018-06-28  1091  			goto err_reg_clk;
9744fec95f0674 Ofer Heifetz       2018-06-28  1092  		}
9744fec95f0674 Ofer Heifetz       2018-06-28  1093 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1094  		ring_irq =3D devm_kza=
lloc(dev, sizeof(*ring_irq), GFP_KERNEL);
1b44c5a60c137e Antoine Tenart     2017-05-24  1095  		if (!ring_irq) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1096  			ret =3D -ENOMEM;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1097  			goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1098  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1099 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1100  		ring_irq->priv =3D pr=
iv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1101  		ring_irq->ring =3D i;
1b44c5a60c137e Antoine Tenart     2017-05-24  1102 =20
1b44c5a60c137e Antoine Tenart     2017-05-24 @1103  		snprintf(irq_name, 6,=
 "ring%d", i);
1b44c5a60c137e Antoine Tenart     2017-05-24  1104  		irq =3D safexcel_requ=
est_ring_irq(pdev, irq_name, safexcel_irq_ring,
69ee4dd5ea8ce0 Antoine Tenart     2017-12-14  1105  						safexcel_irq_ring=
_thread,
1b44c5a60c137e Antoine Tenart     2017-05-24  1106  						ring_irq);
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1107  		if (irq < 0) {
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1108  			ret =3D irq;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1109  			goto err_reg_clk;
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1110  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1111 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1112  		priv->ring[i].work_da=
ta.priv =3D priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1113  		priv->ring[i].work_da=
ta.ring =3D i;
8472e778108cc6 Antoine Tenart     2017-12-14  1114  		INIT_WORK(&priv->ring=
[i].work_data.work, safexcel_dequeue_work);
1b44c5a60c137e Antoine Tenart     2017-05-24  1115 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1116  		snprintf(wq_name, 9, =
"wq_ring%d", i);
1b44c5a60c137e Antoine Tenart     2017-05-24  1117  		priv->ring[i].workque=
ue =3D create_singlethread_workqueue(wq_name);
1b44c5a60c137e Antoine Tenart     2017-05-24  1118  		if (!priv->ring[i].wo=
rkqueue) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1119  			ret =3D -ENOMEM;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1120  			goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1121  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1122 =20
f7268c538b3d84 Antoine Tenart     2018-02-13  1123  		priv->ring[i].request=
s =3D 0;
dc7e28a3286ed4 Antoine Tenart     2017-12-14  1124  		priv->ring[i].busy =
=3D false;
dc7e28a3286ed4 Antoine Tenart     2017-12-14  1125 =20
86671abbbbfc95 Antoine Tenart     2017-06-15  1126  		crypto_init_queue(&pr=
iv->ring[i].queue,
86671abbbbfc95 Antoine Tenart     2017-06-15  1127  				  EIP197_DEFAULT_RI=
NG_SIZE);
86671abbbbfc95 Antoine Tenart     2017-06-15  1128 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1129  		spin_lock_init(&priv-=
>ring[i].lock);
86671abbbbfc95 Antoine Tenart     2017-06-15  1130  		spin_lock_init(&priv-=
>ring[i].queue_lock);
1b44c5a60c137e Antoine Tenart     2017-05-24  1131  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1132 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1133  	platform_set_drvdata(p=
dev, priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1134  	atomic_set(&priv->ring=
_used, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1135 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1136  	ret =3D safexcel_hw_in=
it(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1137  	if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1138  		dev_err(dev, "EIP h/w=
 init failed (%d)\n", ret);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1139  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1140  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1141 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1142  	ret =3D safexcel_regis=
ter_algorithms(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1143  	if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1144  		dev_err(dev, "Failed =
to register algorithms (%d)\n", ret);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1145  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1146  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1147 =20
1b44c5a60c137e Antoine Tenart     2017-05-24  1148  	return 0;
1b44c5a60c137e Antoine Tenart     2017-05-24  1149 =20
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1150  err_reg_clk:
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1151  	clk_disable_unprepare(=
priv->reg_clk);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1152  err_core_clk:
1b44c5a60c137e Antoine Tenart     2017-05-24  1153  	clk_disable_unprepare(=
priv->clk);
1b44c5a60c137e Antoine Tenart     2017-05-24  1154  	return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1155  }
1b44c5a60c137e Antoine Tenart     2017-05-24  1156 =20

:::::: The code at line 1103 was first introduced by commit
:::::: 1b44c5a60c137e5fd0c2c8b86e58fdbc9cd181ce crypto: inside-secure - add=
 SafeXcel EIP197 crypto engine driver

:::::: TO: Antoine T=E9nart <antoine.tenart@free-electrons.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

