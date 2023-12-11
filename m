Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50F613E
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 00:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6hTBaf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702256122; x=1733792122;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EZxsNYPluBeK8enT3mq7dwCuYLNesv23zikLhDyob2A=;
  b=U6hTBaf7qWmqdNnLPrE1H/oibiCwxgnFG8/J4HxrkG7ZQ+DnG2T6haIH
   rzmHgFJGsVhgWWEZ7OSEyNEZfAF0GcMa5F9DOm/ywJnjVhnV7k9igtr33
   hI/k/PSpprqSglptWcOAQSm0k71sXsCxdJ5IU3na1VT2W3+bIJto+5SDz
   rgjG33SPL8bF8oHBgIWI3vpM1H1BbowdezhYJOZzUIZritmkpF7u1GfyN
   Lg4VcTlQ1bzFyWGr6R2z8Drwvq5rG/9LtxtbyO8bfmOJ+F/xlWncsDd17
   M5454b71XCVnBCRLCRRCgWTzmpZ91+Z6D8G+6L1FJZX2RUaiVALe+2feo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379576009"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="379576009"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 16:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890899572"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890899572"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2023 16:55:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:55:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:55:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Dec 2023 16:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByZ1tVxP7feuZwB6JYdg7qkOTZITBmNhu5SClH7JEj35+4Flba+pZsl43QnXmHJyF+2rus3CaIQMGZpP985pHVK/rMMA9n2JAM9/W79nnlU8R1mZZjDtS+6x3dRY7/RFHZar9+7vfsgamm4cuD8ymsARupGCA/KpGJVdbemyM+gx87Z/wcUTGy5RNTJH6GZ8CysW41wST25GKkglfgeCS+kyW+IITuDynY5hrhz/gz0LtoWGqgFqq17WMouLMoWLIRNzTxknbFGG0RXvA1ABvKiDYi+LzDl6jpUhPbsLXTqpCUAO5pJ/mcWMey30N1c1+MjxaiviEYup+Bg9H8S9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cE5FmT/m7rStWMx138LZlgI2CaqovdWNyp5GtWhW3k=;
 b=dNdHNQBWWMzc219CNoT87IWTGiomVYnxNtDYSvGVc0Y6GeGx2b9s+hGDZLkBrvmoCv5VyPbO17CAipr/pqNO7QX7MwWm4UZYkC3Ljqs6DimjVnm3c2H7nnPeGzLoCNYd6nPzpYrLh2t4xOUCJ+HK/sNTjuRwDSwOk7xz/FnR8N4vzHLbSt07FJ06lC2rIOscYWFY8wd/M43HMsEX3HM56nNIFPJ0cJNHDBnpxo0+1jTDsCVKAorXV3hKIWRvYOpBae8Ei6icIdH6mJSmVkOWHzZKIUSRE4UnIIwYTZxH81BIofy02TuN8oBZoqf7M9qC56wc97S2K2+38Cq77uW6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 00:55:10 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 00:55:10 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as
 NULL pointer
Thread-Topic: kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer
 as NULL pointer
Thread-Index: AQHaKxHABfq/DkVzLEWS1u+EojVjprCjQwtg
Date: Mon, 11 Dec 2023 00:55:10 +0000
Message-ID: <CY5PR11MB639239C76FF2EE56EFF38576FB8FA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312101050.6FqHvugR-lkp@intel.com>
In-Reply-To: <202312101050.6FqHvugR-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4879:EE_
x-ms-office365-filtering-correlation-id: 9a15ebd2-966d-4605-055a-08dbf9e3d389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 85R4Bmmu4WGTV5pn6jRWYIK4pnkydfJYm/p1IFKUMrxtrx4fA27NJH+HvOsE7zFF2UWER5yxkinFEus468b/wMNd119ecq2GGksNESx5obGEBEk9XmjbYo7Qdr00phzFfcvp+nsk63ld7VuUMJNv/RQfMzQhMQX2LRyxYF6oF9EHoYP19YfToynk4bsZ11sgamjlR4Uqeo7mlj7k3Bdqx5jPt9k0LN4hkKpdzL9T5HkX5Z5TB5sdMCnA2FC0ZNlsyAtxAC3SiIR1kq7sMlfM5H3qcubfH7W61lvgG90q93k798cQHQLcHZcvGIE2PGCttAlSbNQ+P1cMRVC88mQ/0SCBLKhSqB8n6z//I5kCwXGNLIV4aK9Ydoj7N+SyYfvGwxAowhSP6+2wfLHY1cBpEYsN6ysU8lEVfo1QyaFtJsejetNk9p+QG0f08miayMuYYGxocuqqu1uLqlfwX/wI5k9Bf6Wj2Gz9f9e7H41ut/19aolHF/bFkASzyvlnPmLBJafRAtN2ASJrzRkcP4GYn+JptSEA0yTeN8pZXDjehqAJDEHLDNuXkv5AE9P8g+mVEgAhrKFE16uMhsp/sA2Ss4wX8e8sy5xmP970iS5JpSSiUsbaqJYLc15YiLPKhrUC34b4lvAGY9Nt3+pkqqqvu2DIk24relRFhWdD9ZtMunAx0/O8Fo1MGjJ5yhTpImt/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(9686003)(52536014)(6506007)(53546011)(5660300002)(26005)(33656002)(55016003)(38070700009)(76116006)(66446008)(66476007)(66556008)(66946007)(64756008)(966005)(2906002)(83380400001)(82960400001)(41300700001)(478600001)(7696005)(86362001)(8676002)(8936002)(122000001)(110136005)(316002)(38100700002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mSZ0C+R0bxo6qNUz/Lbyed+27yx1C2I73M6MPbbUGct1nzh2pWTGtWrv+Nqe?=
 =?us-ascii?Q?MkbZDqrrTs+l10ht6B2HxCamNy1GXurJJa+wVmcYmVfjEOjuArSXNS6zryh7?=
 =?us-ascii?Q?M2QNkQZVsuRO8Rfff6scyx8lvMErLmJoN2Eksdnp5q8Wsz1V4uSZRr7moPoi?=
 =?us-ascii?Q?92diOLvXfP6BviHKcJ10/KW9lQ4VviVno3iC65vQJBOB1JyUSP1uR0qmhesX?=
 =?us-ascii?Q?J4gny15gl6nivvVo8RmI7RAnRfEXIH0bq9S4DYUtzVWVLNBbuhhzhyQYNMTL?=
 =?us-ascii?Q?fZmT7MUX6LciAEUTW+9Ex2aMSKDAdbFmCORyR5F02WP9hMuOANX2akb5HTQD?=
 =?us-ascii?Q?N+eUzH9Ga9yV9kdnsIBWw/5iaLdxPdteHI0JwOglQIzQMLzzr3x6gl+3wud6?=
 =?us-ascii?Q?vbJY+prdPqJFcYp+685z4FVvXmxThG1txcKamnLR6SaEh0+Pk3AzbDTdQi6l?=
 =?us-ascii?Q?BgEB8SRcybRAriy0bzL8lm7ovq6w3YhNF/CPRGEfZ46BrWxlu9Krv5FPXJWc?=
 =?us-ascii?Q?cqpFRO9OKOr/wuO/6OY/pTXw9zCo3f+yste8YfQQc/DOVM+cfyMH41K9iu+G?=
 =?us-ascii?Q?o31m/cfJxGXFckcAmrXloRm5JIGIwqXvg/k30WjB6IIYvXbb+I/zEHHWcvF0?=
 =?us-ascii?Q?2DZOTKCdYuKPrDrPmLTKJwEl3xqI30/Eso79/3yUgeoyw3gQN+/9+csD0VoM?=
 =?us-ascii?Q?6M0g4m5bPVScf56JY3U0YwG8CxUFqA9JNE7HchPpVL1JsbV6qTr6NbQIrwBq?=
 =?us-ascii?Q?fxxn480k3kcYVsk/nBpRuxNhJDjL41s4KxH/qxNUeHSXkA0sFSNv5FsHRDjx?=
 =?us-ascii?Q?X+gKbdsl3yrGf+9jVDTRiPHBZG9ecPB2voq1Pfyq1NoZ+8W5OYyz4Ifp6B6H?=
 =?us-ascii?Q?LJD7rEnCzJQh6asvLwrZ3nTjyHEumzoFcBOy8LCQld+VJX7oap298PyboNEB?=
 =?us-ascii?Q?aNOWXyVywNLM1kGfRv7SaEEe7OU0yT8AIa+XLO70CZJjW0DK7KcaQ3T9mvU2?=
 =?us-ascii?Q?yyoTplCot/XIeqm/EK8CSASgDhDIrfMHlV4Upx1f4/urV2KJTpZMCltAXM/6?=
 =?us-ascii?Q?V0kCAt8L0zVGE45MnZW3DUBQyyFHE241Xw1fPCqxGTaWGLT8VX30KcChJdPw?=
 =?us-ascii?Q?L95ADld6rKN28PLLPVn3vSfcxGhA9Cs7+KQFjHmy2P/ZKYbsUu5qUfSUFUmG?=
 =?us-ascii?Q?ldgIiAa+r//0Jt2d72qX3A/CP/Y0s/c5Fg5kEou053ccf2mKgWwOW+dveb49?=
 =?us-ascii?Q?etNcanqr/2Z2qQgiCfM9AzOQupUuyS5OMOou8n6djn6rl+TrEToxS8EVQjiq?=
 =?us-ascii?Q?i4c8km05bAfmNbQQXSyGnDOnqbD+TbhsenybnIKkqZBawAdoNsWaIHgkkfn/?=
 =?us-ascii?Q?LMcGFz5kgpBvRIazLZRSWN+/F701rgOSQM3CVBhqz3dJdSd9OdJrhfSuDZLQ?=
 =?us-ascii?Q?HZgTI0nfoJiH7mqIUYVp/AgJc/TfW59yQFlGpHCpe7YidHaZiU/t1+wh4x43?=
 =?us-ascii?Q?joYVVX/6WXM+c22wIOHVhr8g2q43wUjZ3i8bjIPWCRLCnwNsu1bCh3Cb0SEn?=
 =?us-ascii?Q?YgS6TVQbzKy6QaeB9wkoclS3QIo62JaD9A/nrM/J?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a15ebd2-966d-4605-055a-08dbf9e3d389
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 00:55:10.4325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hOYPQauH2BlKNZyw8clvAKWHfoqhTBW+VLhOBaBdgc7dSs817QotAkk6FPA6h1XNxe2sMUaZu5TST/alw0duuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
X-OriginatorOrg: intel.com

not_report

only kconfig change:

crypto/Kconfig         | 114 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/Kconfig | 115 ---------------------------------------------=
----------------------------------------------------------------------
 2 files changed, 114 insertions(+), 115 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 10, 2023 10:34
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as =
NULL pointer

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
commit: b7133757da4c4c17d625970f6da3d76af12a8867 crypto: s390 - do not depe=
nd on CRYPTO_HW for SIMD implementations
date:   1 year, 5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 5 months ago
config: s390-randconfig-r113-20231115 (https://download.01.org/0day-ci/arch=
ive/20231210/202312101050.6FqHvugR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101050.6=
FqHvugR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312101050.6FqHvugR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as NULL p=
ointer
>> kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as NULL p=
ointer

vim +320 kernel/kexec_file.c

a43cac0d9dc207 Dave Young     2015-09-09  319 =20
a43cac0d9dc207 Dave Young     2015-09-09 @320  SYSCALL_DEFINE5(kexec_file_l=
oad, int, kernel_fd, int, initrd_fd,
a43cac0d9dc207 Dave Young     2015-09-09  321  		unsigned long, cmdline_len=
, const char __user *, cmdline_ptr,
a43cac0d9dc207 Dave Young     2015-09-09  322  		unsigned long, flags)
a43cac0d9dc207 Dave Young     2015-09-09  323  {
a43cac0d9dc207 Dave Young     2015-09-09  324  	int ret =3D 0, i;
a43cac0d9dc207 Dave Young     2015-09-09  325  	struct kimage **dest_image,=
 *image;
a43cac0d9dc207 Dave Young     2015-09-09  326 =20
a43cac0d9dc207 Dave Young     2015-09-09  327  	/* We only trust the superu=
ser with rebooting the system. */
a43cac0d9dc207 Dave Young     2015-09-09  328  	if (!capable(CAP_SYS_BOOT) =
|| kexec_load_disabled)
a43cac0d9dc207 Dave Young     2015-09-09  329  		return -EPERM;
a43cac0d9dc207 Dave Young     2015-09-09  330 =20
a43cac0d9dc207 Dave Young     2015-09-09  331  	/* Make sure we have a lega=
l set of flags */
a43cac0d9dc207 Dave Young     2015-09-09  332  	if (flags !=3D (flags & KEX=
EC_FILE_FLAGS))
a43cac0d9dc207 Dave Young     2015-09-09  333  		return -EINVAL;
a43cac0d9dc207 Dave Young     2015-09-09  334 =20
a43cac0d9dc207 Dave Young     2015-09-09  335  	image =3D NULL;
a43cac0d9dc207 Dave Young     2015-09-09  336 =20
a43cac0d9dc207 Dave Young     2015-09-09  337  	if (!mutex_trylock(&kexec_m=
utex))
a43cac0d9dc207 Dave Young     2015-09-09  338  		return -EBUSY;
a43cac0d9dc207 Dave Young     2015-09-09  339 =20
a43cac0d9dc207 Dave Young     2015-09-09  340  	dest_image =3D &kexec_image=
;
9b492cf58077a0 Xunlei Pang    2016-05-23  341  	if (flags & KEXEC_FILE_ON_C=
RASH) {
a43cac0d9dc207 Dave Young     2015-09-09  342  		dest_image =3D &kexec_cras=
h_image;
9b492cf58077a0 Xunlei Pang    2016-05-23  343  		if (kexec_crash_image)
9b492cf58077a0 Xunlei Pang    2016-05-23  344  			arch_kexec_unprotect_cras=
hkres();
9b492cf58077a0 Xunlei Pang    2016-05-23  345  	}
a43cac0d9dc207 Dave Young     2015-09-09  346 =20
a43cac0d9dc207 Dave Young     2015-09-09  347  	if (flags & KEXEC_FILE_UNLO=
AD)
a43cac0d9dc207 Dave Young     2015-09-09  348  		goto exchange;
a43cac0d9dc207 Dave Young     2015-09-09  349 =20
a43cac0d9dc207 Dave Young     2015-09-09  350  	/*
a43cac0d9dc207 Dave Young     2015-09-09  351  	 * In case of crash, new ke=
rnel gets loaded in reserved region. It is
a43cac0d9dc207 Dave Young     2015-09-09  352  	 * same memory where old cr=
ash kernel might be loaded. Free any
a43cac0d9dc207 Dave Young     2015-09-09  353  	 * current crash dump kerne=
l before we corrupt it.
a43cac0d9dc207 Dave Young     2015-09-09  354  	 */
a43cac0d9dc207 Dave Young     2015-09-09  355  	if (flags & KEXEC_FILE_ON_C=
RASH)
a43cac0d9dc207 Dave Young     2015-09-09  356  		kimage_free(xchg(&kexec_cr=
ash_image, NULL));
a43cac0d9dc207 Dave Young     2015-09-09  357 =20
a43cac0d9dc207 Dave Young     2015-09-09  358  	ret =3D kimage_file_alloc_i=
nit(&image, kernel_fd, initrd_fd, cmdline_ptr,
a43cac0d9dc207 Dave Young     2015-09-09  359  				     cmdline_len, flags)=
;
a43cac0d9dc207 Dave Young     2015-09-09  360  	if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  361  		goto out;
a43cac0d9dc207 Dave Young     2015-09-09  362 =20
a43cac0d9dc207 Dave Young     2015-09-09  363  	ret =3D machine_kexec_prepa=
re(image);
a43cac0d9dc207 Dave Young     2015-09-09  364  	if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  365  		goto out;
a43cac0d9dc207 Dave Young     2015-09-09  366 =20
1229384f5b856d Xunlei Pang    2017-07-12  367  	/*
1229384f5b856d Xunlei Pang    2017-07-12  368  	 * Some architecture(like S=
390) may touch the crash memory before
1229384f5b856d Xunlei Pang    2017-07-12  369  	 * machine_kexec_prepare(),=
 we must copy vmcoreinfo data after it.
1229384f5b856d Xunlei Pang    2017-07-12  370  	 */
1229384f5b856d Xunlei Pang    2017-07-12  371  	ret =3D kimage_crash_copy_v=
mcoreinfo(image);
1229384f5b856d Xunlei Pang    2017-07-12  372  	if (ret)
1229384f5b856d Xunlei Pang    2017-07-12  373  		goto out;
1229384f5b856d Xunlei Pang    2017-07-12  374 =20
a43cac0d9dc207 Dave Young     2015-09-09  375  	ret =3D kexec_calculate_sto=
re_digests(image);
a43cac0d9dc207 Dave Young     2015-09-09  376  	if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  377  		goto out;
a43cac0d9dc207 Dave Young     2015-09-09  378 =20
a43cac0d9dc207 Dave Young     2015-09-09  379  	for (i =3D 0; i < image->nr=
_segments; i++) {
a43cac0d9dc207 Dave Young     2015-09-09  380  		struct kexec_segment *kseg=
ment;
a43cac0d9dc207 Dave Young     2015-09-09  381 =20
a43cac0d9dc207 Dave Young     2015-09-09  382  		ksegment =3D &image->segme=
nt[i];
a43cac0d9dc207 Dave Young     2015-09-09  383  		pr_debug("Loading segment =
%d: buf=3D0x%p bufsz=3D0x%zx mem=3D0x%lx memsz=3D0x%zx\n",
a43cac0d9dc207 Dave Young     2015-09-09  384  			 i, ksegment->buf, ksegme=
nt->bufsz, ksegment->mem,
a43cac0d9dc207 Dave Young     2015-09-09  385  			 ksegment->memsz);
a43cac0d9dc207 Dave Young     2015-09-09  386 =20
a43cac0d9dc207 Dave Young     2015-09-09  387  		ret =3D kimage_load_segmen=
t(image, &image->segment[i]);
a43cac0d9dc207 Dave Young     2015-09-09  388  		if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  389  			goto out;
a43cac0d9dc207 Dave Young     2015-09-09  390  	}
a43cac0d9dc207 Dave Young     2015-09-09  391 =20
a43cac0d9dc207 Dave Young     2015-09-09  392  	kimage_terminate(image);
a43cac0d9dc207 Dave Young     2015-09-09  393 =20
de68e4daea9084 Pavel Tatashin 2019-12-04  394  	ret =3D machine_kexec_post_=
load(image);
de68e4daea9084 Pavel Tatashin 2019-12-04  395  	if (ret)
de68e4daea9084 Pavel Tatashin 2019-12-04  396  		goto out;
de68e4daea9084 Pavel Tatashin 2019-12-04  397 =20
a43cac0d9dc207 Dave Young     2015-09-09  398  	/*
a43cac0d9dc207 Dave Young     2015-09-09  399  	 * Free up any temporary bu=
ffers allocated which are not needed
a43cac0d9dc207 Dave Young     2015-09-09  400  	 * after image has been loa=
ded
a43cac0d9dc207 Dave Young     2015-09-09  401  	 */
a43cac0d9dc207 Dave Young     2015-09-09  402  	kimage_file_post_load_clean=
up(image);
a43cac0d9dc207 Dave Young     2015-09-09  403  exchange:
a43cac0d9dc207 Dave Young     2015-09-09  404  	image =3D xchg(dest_image, =
image);
a43cac0d9dc207 Dave Young     2015-09-09  405  out:
9b492cf58077a0 Xunlei Pang    2016-05-23  406  	if ((flags & KEXEC_FILE_ON_=
CRASH) && kexec_crash_image)
9b492cf58077a0 Xunlei Pang    2016-05-23  407  		arch_kexec_protect_crashkr=
es();
9b492cf58077a0 Xunlei Pang    2016-05-23  408 =20
a43cac0d9dc207 Dave Young     2015-09-09  409  	mutex_unlock(&kexec_mutex);
a43cac0d9dc207 Dave Young     2015-09-09  410  	kimage_free(image);
a43cac0d9dc207 Dave Young     2015-09-09  411  	return ret;
a43cac0d9dc207 Dave Young     2015-09-09  412  }
a43cac0d9dc207 Dave Young     2015-09-09  413 =20

:::::: The code at line 320 was first introduced by commit
:::::: a43cac0d9dc2073ff2245a171429ddbe1accece7 kexec: split kexec_file sys=
call code to kexec_file.c

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

