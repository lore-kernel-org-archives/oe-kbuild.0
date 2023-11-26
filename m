Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C55A4C
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1nrFodz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701015115; x=1732551115;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zTOFKqIP6Zt8Q14R1iuj/G2qruk5AzcWTaXVL5gGyPo=;
  b=E1nrFodztxXS60E7V6b5MsyopGJsrwkk2xGbpg4p++9+PQ4iv/WHnw2W
   USPzaapaygl5MbIe5lzdDT58+VP+32sjcKxWTgdLwxyzNPTJQ7rckYvkA
   4+5vTrkzeVW7s5gDPkTklOOMbvzq1I9c3gx/pT+4xPO+i+gjyp/Vkn93p
   cBG9LWLw08sL24AcyX825BjFsVrgLzgRNi1qdB6uav3mPPCdocqacju+X
   SS02M5Lwgv3ObEQ5l/gHGTXCtmtpjL41CGEVm5qzcOHgNY1rGo+tS+iFO
   xQjs2csDh+kGhSQQfglL+cqLgZXny9O0bY7m7bJAoyPTJo8GulqNSMIYw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="423718985"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="423718985"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 08:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717812856"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="717812856"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 08:11:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 08:11:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 08:11:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 08:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoHP8JH1H/o/st6iNnudc8llY0QZenZKrKpOWDkYtV968++Ouvh5Z+F5ejvQO1K8Ajm1HqNMkXGzr8mrN99l1/BKyU8eWt/uk14NWnJ6W/XeV28odrxITWmRYbhbroVaBvGUq+yH6kARXGghzXpI4zurKsn7F3tdxFjC1ISC6Tgjb6qsq9XpMghrqtk7/W/Y1EfVqowf7ibHBLRKcpOM021gEPahVJvW5GOkTlRri2YhG7KgUAAEl20We0mX87qyy/B33mMgl6jVkYTdTtcEkwUx3eAKhJZfl0XI1PkjJ7Lhq/l5Z3NCIxCy6PjtH0Fr4o8cWX1LmbZQstkdCxdqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noxmofJB5T/33dv6E1bJWBN4vtWGDuCQhPERw+85RSU=;
 b=U5fjL/WV5B0nrXpL22SI3TR9nrQNv4yPkDrwURDEknYx1WcnYJVDtI4ayQAM5Ne3Xx/j8CoJQbExsGAi1Gjc4UQEjJg7Xu04h0EhS0KfqrG6We88w5FW6hpCSDdrz7cWYv9kDw7LSH4512y4sHxDgEKaAnMMJymmFOdHuezL13OkFIVMQIpW3anCKcYuWG2DvX0CY2D/4G/GEiLerUP6CqjbGYJBG91D9UgBKe2CdiHnApCa0UUCCOlnhKa0za180pX86qGcFpnA1snRPekBcr+80IuxnxiwbdlDDeFdyT9x5Oc2fmHoI5m6oPSkRM/BQtFbdYvPkCgm9yGmV4HTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Sun, 26 Nov 2023 16:11:51 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7025.019; Sun, 26 Nov 2023
 16:11:50 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse: sparse:
 incorrect type in assignment (different address spaces)
Thread-Topic: arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse: sparse:
 incorrect type in assignment (different address spaces)
Thread-Index: AQHaHuRcbilLbvQU+0eguApMBdhh3LCMyKcg
Date: Sun, 26 Nov 2023 16:11:50 +0000
Message-ID: <DS0PR11MB6397B36F4D7DD3CCD212527BFBBEA@DS0PR11MB6397.namprd11.prod.outlook.com>
References: <202311241507.Af76zcvC-lkp@intel.com>
In-Reply-To: <202311241507.Af76zcvC-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|IA0PR11MB8377:EE_
x-ms-office365-filtering-correlation-id: e972a728-d6d1-40bb-a8b5-08dbee9a65eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qHnTmT4YgVpmMK7GCdWdzuX+UPg76kRFmpcA0eBRfJ0Oru7K+/UqFH3UZtzUMA5s927KNw56eQQQihoqSAgTTA0oIUzx71pjx9wQR9gRcXdm14p9EWHuTWRNNBWB9ALjMnGpSf6ZG6BGHNa6B+cWL05LM58FYXFkFg9sbns7pWTdbBZ1GyRJBZN/oB968P0AxMSOammdlWQPqpBjLvN1q4EwIZzvsmzri31JeTMSpgalLPU3VfsBTMdMfAlknW0SaouQxb+7qCSHnICHXL5eE09p7r974nkPF9sNB4OM2H093MiPxSXpxbOMCDTzOr7IALH9Le1YjXEFklAnXJ1iO4Odz+RU4fO05ptXhlwfT2B/T4jjmNpvtZrzVG8ugyQlNGSnyMF+2GSgoaJUd5sF2s3dTx+niaTD21ory6GaN3nsecEQZn1nFPmNUlqoFTcbdaWeQe6JiSMS5KrMYU5VHDZaEECHLpAdqoOGQ8O7z9//QWJI1pihWy+GtEvE1cG1XvWoug+m2DcKRmvhvxt5van0GR35dCsi22+uvvhoQnsma3q+qmAR/v0fBfe1Q+K5Df3bGMUyTCuYcZDCKBByUGw8dfB4EDnZKXIAWnDi7YOrqmcxOP0Iv8zDoPFPohlBS6d3wl6L3f4GGVLThJJsyxf2n0+Yd86jjPYMQ7/f+kyB41+2mw3kiGh8fkNktLis
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(136003)(346002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(52536014)(71200400001)(8936002)(8676002)(9686003)(6506007)(7696005)(53546011)(64756008)(316002)(110136005)(66946007)(66556008)(76116006)(966005)(478600001)(2906002)(122000001)(30864003)(55016003)(33656002)(38100700002)(41300700001)(38070700009)(4001150100001)(86362001)(26005)(66476007)(83380400001)(66574015)(82960400001)(5660300002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MrFpM4Vk3PhnSG7RjlM33B1YoGcWm96B+qA7wKRMC3CpjP5O3pmRadx7CY?=
 =?iso-8859-1?Q?mkgmcb/s9p5mtb14R3ffAhbd/pgUcyhNMcPhEomNfIOYZZFVZkcJ6lpJYi?=
 =?iso-8859-1?Q?V+DxOc/teM80Q+u3HHpC2bwR8qtuv317RRZCckGlMpisljcxKVMx8q/6Xk?=
 =?iso-8859-1?Q?Wppbk2I/4gJSOKYdJxbXe3XY3do9YFxn16M3xRmU2SK/X9rTSORAB8MrQV?=
 =?iso-8859-1?Q?rPG/ewmxCBbX9HXVHF8CFNpmUaTsZyBSo+ZCrLp+bJTvu30HCbz+X5DYX3?=
 =?iso-8859-1?Q?0W1gdi8pPJU1BdUT2zJMfP+xyo5pimfsNXE35Y7bbsX8p3oedfuRgTCmsT?=
 =?iso-8859-1?Q?9QNR4lbzcuIKsuBGfUFLzYzbRqTKl/a243QjqTu95OTDGa2FSPDqqhYiJp?=
 =?iso-8859-1?Q?oVXDCUXivC8tzq1t55yVadl6pNedzvaV8Dz788w3VNjs4r9rqp29KM2YKv?=
 =?iso-8859-1?Q?GnV2z+Xp7yTAerZAKjtkD71OB/G5dWKx36oYdsDfZLRf1HAMK51GglHYpU?=
 =?iso-8859-1?Q?nG89+xFZDV/SHoblswZzEdzxLmfZJXiMu2QnhdXgeqRCNT6FypbUpXuaaK?=
 =?iso-8859-1?Q?3e6kWDPH1fNJFvjHr/xuGGIRZxILcYRSJjx6FFA9xuQBg7OTuJKeoWoMzu?=
 =?iso-8859-1?Q?g5gq9W0mOg25fwVviyiDIHFlLTr/xAbjgr7h+qffPEogE9pRi8FnYmdFf+?=
 =?iso-8859-1?Q?Fsj5YN3zRoVa5qlaHOQfqQ/mXO02/ktAke9efdVx2/IRR3luB8MXb9eNoL?=
 =?iso-8859-1?Q?oQqI2oBe3GVGQs8mYuQTUPqWMowpOf9ipvQ5mymMdauFcm/g28IFuD/kUr?=
 =?iso-8859-1?Q?QG5SQAuzs06FOBeNdgrYsnk0OG7Tks11rXk4MP4+dQXLfkK4+b5FxFFLYW?=
 =?iso-8859-1?Q?vuQq/M8ynW1FYkNLB+E61SCDjv7a58l9Y0g2PU3Ea1uZRrzHqucQPy6/yL?=
 =?iso-8859-1?Q?54TuatUElCj/4aBRhiy/jMQOhbSLdNznM5mXlSajiH0d3rIlYm2R/j2ArV?=
 =?iso-8859-1?Q?2I3/d0PaL8CO6cZf5fWdWFZm6lyh3Yu0WbnTuxm5eLnY/NlBVAgvd8teFY?=
 =?iso-8859-1?Q?QBJl7Ht2lg2VTOpjJ9J0mG8e199dj4Ru8jpL2+6VAfZkiCB5KZPTmJjDvF?=
 =?iso-8859-1?Q?5TZmm881fh3sbsHks/cMumlal2as61iaFlwwrrw9cThrHo3qfSNQT7xwdI?=
 =?iso-8859-1?Q?QGoEx4G/meblvIfbAPdZV3KwAB25ZbilLwASD9p7ugxzTt32yd6aIUgxgo?=
 =?iso-8859-1?Q?QojiZ6xN3AW37mM8IqrK3YPGMrF0tAu0KrzhEK0EiJ1aQ9q5WLnFqeDBdB?=
 =?iso-8859-1?Q?On3jFTRxZiXMdIjUOG4oZ1TvcHzZUuCPfC4O5387Y7kaiUdLP90ao2KDDK?=
 =?iso-8859-1?Q?USQwy009P4qug7x+G0heEZMqdh33lsYDef5MaaPqDfDqX3ySaLgM9o/FH/?=
 =?iso-8859-1?Q?tHE7HT+vzGLy3w4rHGFPqs61AKY/ozgtZXtgEchaEkgVA6w0+8HLmpri8W?=
 =?iso-8859-1?Q?oFvtRSwR//JzISC8xAlMb6PgJ8t5/9++Fk1OKEihgz79kkQf6T52yqqBsG?=
 =?iso-8859-1?Q?xmKRV3qxRF/F4j4md+n2ToU9C87slL24Iy+5EOvvWkFsEL0kXKHXzRjw6r?=
 =?iso-8859-1?Q?W91IvGBgdyXV5TswIzOD2aTT4JiBOOC4r7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e972a728-d6d1-40bb-a8b5-08dbee9a65eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 16:11:50.4989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02xf8wUEJ130waqrmRAv1msRH+0V3HqOtcahrmGuDahKqh134VfDN1AjlF+8ETHc+Gefe//A5ct76LUp+Shiig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-OriginatorOrg: intel.com

not_report

only kconfig change:

arch/powerpc/platforms/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, November 24, 2023 22:40
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse: sparse: incor=
rect type in assignment (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pali Roh=E1r" <pali@kernel.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1a09972a45ae63efbd1587337c4be13b1893330
commit: 22fdf79171e8509db54599fd2c05ef0022ee83f5 powerpc/fsl_uli1575: Allow=
 to disable FSL_ULI1575 support
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r122-20231123 (https://download.01.org/0day-ci/a=
rchive/20231124/202311241507.Af76zcvC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241507.A=
f76zcvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311241507.Af76zcvC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected unsigned char =
[usertype] *dummy @@     got void [noderef] __iomem * @@
   arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse:     expected unsign=
ed char [usertype] *dummy
   arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse:     got void [noder=
ef] __iomem *
   arch/powerpc/platforms/fsl_uli1575.c:238:39: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected unsigned char =
[usertype] *dummy @@     got void [noderef] __iomem * @@
   arch/powerpc/platforms/fsl_uli1575.c:238:39: sparse:     expected unsign=
ed char [usertype] *dummy
   arch/powerpc/platforms/fsl_uli1575.c:238:39: sparse:     got void [noder=
ef] __iomem *
>> arch/powerpc/platforms/fsl_uli1575.c:240:38: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected unsigned char =
const volatile [noderef] [usertype] __iomem *addr @@     got unsigned char =
[usertype] *dummy @@
   arch/powerpc/platforms/fsl_uli1575.c:240:38: sparse:     expected unsign=
ed char const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/fsl_uli1575.c:240:38: sparse:     got unsigned ch=
ar [usertype] *dummy
>> arch/powerpc/platforms/fsl_uli1575.c:241:41: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void volatile =
[noderef] __iomem *addr @@     got unsigned char [usertype] *dummy @@
   arch/powerpc/platforms/fsl_uli1575.c:241:41: sparse:     expected void v=
olatile [noderef] __iomem *addr
   arch/powerpc/platforms/fsl_uli1575.c:241:41: sparse:     got unsigned ch=
ar [usertype] *dummy
>> arch/powerpc/platforms/fsl_uli1575.c:338:26: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected restricted __be32 =
const [usertype] *addr @@     got unsigned int * @@
   arch/powerpc/platforms/fsl_uli1575.c:338:26: sparse:     expected restri=
cted __be32 const [usertype] *addr
   arch/powerpc/platforms/fsl_uli1575.c:338:26: sparse:     got unsigned in=
t *
   arch/powerpc/platforms/fsl_uli1575.c: note: in included file (through in=
clude/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison alway=
s evaluates to false

vim +236 arch/powerpc/platforms/fsl_uli1575.c

b66510cb9992d2 Kumar Gala         2007-08-16  217 =20
b66510cb9992d2 Kumar Gala         2007-08-16  218  /* We have to do a dummy=
 read on the P2P for the RTC to work, WTF */
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  219  static void quirk_final_=
uli5249(struct pci_dev *dev)
b66510cb9992d2 Kumar Gala         2007-08-16  220  {
b66510cb9992d2 Kumar Gala         2007-08-16  221  	int i;
b66510cb9992d2 Kumar Gala         2007-08-16  222  	u8 *dummy;
b66510cb9992d2 Kumar Gala         2007-08-16  223  	struct pci_bus *bus =3D=
 dev->bus;
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  224  	struct resource *res;
1fce2d01dff65a Kumar Gala         2008-10-02  225  	resource_size_t end =3D=
 0;
1fce2d01dff65a Kumar Gala         2008-10-02  226 =20
1fce2d01dff65a Kumar Gala         2008-10-02  227  	for (i =3D PCI_BRIDGE_R=
ESOURCES; i < PCI_BRIDGE_RESOURCES+3; i++) {
1fce2d01dff65a Kumar Gala         2008-10-02  228  		unsigned long flags =
=3D pci_resource_flags(dev, i);
1fce2d01dff65a Kumar Gala         2008-10-02  229  		if ((flags & (IORESOUR=
CE_MEM|IORESOURCE_PREFETCH)) =3D=3D IORESOURCE_MEM)
1fce2d01dff65a Kumar Gala         2008-10-02  230  			end =3D pci_resource_=
end(dev, i);
1fce2d01dff65a Kumar Gala         2008-10-02  231  	}
b66510cb9992d2 Kumar Gala         2007-08-16  232 =20
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  233  	pci_bus_for_each_resour=
ce(bus, res, i) {
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  234  		if (res && res->flags =
& IORESOURCE_MEM) {
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  235  			if (res->end =3D=3D e=
nd)
89a74ecccd1f78 Bjorn Helgaas      2010-02-23 @236  				dummy =3D ioremap(re=
s->start, 0x4);
1fce2d01dff65a Kumar Gala         2008-10-02  237  			else
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  238  				dummy =3D ioremap(re=
s->end - 3, 0x4);
b66510cb9992d2 Kumar Gala         2007-08-16  239  			if (dummy) {
b66510cb9992d2 Kumar Gala         2007-08-16 @240  				in_8(dummy);
b66510cb9992d2 Kumar Gala         2007-08-16 @241  				iounmap(dummy);
b66510cb9992d2 Kumar Gala         2007-08-16  242  			}
b66510cb9992d2 Kumar Gala         2007-08-16  243  			break;
b66510cb9992d2 Kumar Gala         2007-08-16  244  		}
b66510cb9992d2 Kumar Gala         2007-08-16  245  	}
b66510cb9992d2 Kumar Gala         2007-08-16  246  }
b66510cb9992d2 Kumar Gala         2007-08-16  247 =20
b66510cb9992d2 Kumar Gala         2007-08-16  248  DECLARE_PCI_FIXUP_EARLY(=
PCI_VENDOR_ID_AL, 0x5249, early_uli5249);
b66510cb9992d2 Kumar Gala         2007-08-16  249  DECLARE_PCI_FIXUP_HEADER=
(PCI_VENDOR_ID_AL, 0x1575, quirk_uli1575);
b66510cb9992d2 Kumar Gala         2007-08-16  250  DECLARE_PCI_FIXUP_HEADER=
(PCI_VENDOR_ID_AL, 0x5288, quirk_uli5288);
b66510cb9992d2 Kumar Gala         2007-08-16  251  DECLARE_PCI_FIXUP_HEADER=
(PCI_VENDOR_ID_AL, 0x5229, quirk_uli5229);
b66510cb9992d2 Kumar Gala         2007-08-16  252  DECLARE_PCI_FIXUP_FINAL(=
PCI_VENDOR_ID_AL, 0x5249, quirk_final_uli5249);
b66510cb9992d2 Kumar Gala         2007-08-16  253  DECLARE_PCI_FIXUP_FINAL(=
PCI_VENDOR_ID_AL, 0x1575, quirk_final_uli1575);
1433fa7d8da608 Jason Jin          2008-12-04  254  DECLARE_PCI_FIXUP_RESUME=
(PCI_VENDOR_ID_AL, 0x5229, quirk_uli5229);
b66510cb9992d2 Kumar Gala         2007-08-16  255 =20
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  256  static void hpcd_quirk_u=
li1575(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  257  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  258  	u32 temp32;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  259 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  260  	if (!machine_is(mpc86xx=
_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  261  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  262 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  263  	/* Disable INTx */
52ddd1cdc92380 Anton Vorontsov    2008-06-12  264  	pci_read_config_dword(d=
ev, 0x48, &temp32);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  265  	pci_write_config_dword(=
dev, 0x48, (temp32 | 1<<26));
52ddd1cdc92380 Anton Vorontsov    2008-06-12  266 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  267  	/* Enable sideband inte=
rrupt */
52ddd1cdc92380 Anton Vorontsov    2008-06-12  268  	pci_read_config_dword(d=
ev, 0x90, &temp32);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  269  	pci_write_config_dword(=
dev, 0x90, (temp32 | 1<<22));
52ddd1cdc92380 Anton Vorontsov    2008-06-12  270  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  271 =20
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  272  static void hpcd_quirk_u=
li5288(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  273  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  274  	unsigned char c;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  275 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  276  	if (!machine_is(mpc86xx=
_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  277  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  278 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  279  	pci_read_config_byte(de=
v, 0x83, &c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  280  	c |=3D 0x80;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  281  	pci_write_config_byte(d=
ev, 0x83, c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  282 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  283  	pci_write_config_byte(d=
ev, PCI_CLASS_PROG, 0x01);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  284  	pci_write_config_byte(d=
ev, PCI_CLASS_DEVICE, 0x06);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  285 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  286  	pci_read_config_byte(de=
v, 0x83, &c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  287  	c &=3D 0x7f;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  288  	pci_write_config_byte(d=
ev, 0x83, c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  289  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  290 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  291  /*
52ddd1cdc92380 Anton Vorontsov    2008-06-12  292   * Since 8259PIC was dis=
abled on the board, the IDE device can not
52ddd1cdc92380 Anton Vorontsov    2008-06-12  293   * use the legacy IRQ, w=
e need to let the IDE device work under
52ddd1cdc92380 Anton Vorontsov    2008-06-12  294   * native mode and use t=
he interrupt line like other PCI devices.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  295   * IRQ14 is a sideband i=
nterrupt from IDE device to CPU and we use this
52ddd1cdc92380 Anton Vorontsov    2008-06-12  296   * as the interrupt for =
IDE device.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  297   */
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  298  static void hpcd_quirk_u=
li5229(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  299  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  300  	unsigned char c;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  301 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  302  	if (!machine_is(mpc86xx=
_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  303  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  304 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  305  	pci_read_config_byte(de=
v, 0x4b, &c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  306  	c |=3D 0x10;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  307  	pci_write_config_byte(d=
ev, 0x4b, c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  308  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  309 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  310  /*
52ddd1cdc92380 Anton Vorontsov    2008-06-12  311   * SATA interrupt pin bu=
g fix
52ddd1cdc92380 Anton Vorontsov    2008-06-12  312   * There's a chip bug fo=
r 5288, The interrupt pin should be 2,
52ddd1cdc92380 Anton Vorontsov    2008-06-12  313   * not the read only val=
ue 1, So it use INTB#, not INTA# which
52ddd1cdc92380 Anton Vorontsov    2008-06-12  314   * actually used by the =
IDE device 5229.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  315   * As of this bug, durin=
g the PCI initialization, 5288 read the
52ddd1cdc92380 Anton Vorontsov    2008-06-12  316   * irq of IDE device fro=
m the device tree, this function fix this
52ddd1cdc92380 Anton Vorontsov    2008-06-12  317   * bug by re-assigning a=
 correct irq to 5288.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  318   *
52ddd1cdc92380 Anton Vorontsov    2008-06-12  319   */
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  320  static void hpcd_final_u=
li5288(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  321  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  322  	struct pci_controller *=
hose =3D pci_bus_to_host(dev->bus);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  323  	struct device_node *hos=
enode =3D hose ? hose->dn : NULL;
530210c7814e83 Grant Likely       2013-09-15  324  	struct of_phandle_args =
oirq;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  325  	u32 laddr[3];
52ddd1cdc92380 Anton Vorontsov    2008-06-12  326 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  327  	if (!machine_is(mpc86xx=
_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  328  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  329 =20
52ddd1cdc92380 Anton Vorontsov    2008-06-12  330  	if (!hosenode)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  331  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  332 =20
2361613206e66c Grant Likely       2013-09-15  333  	oirq.np =3D hosenode;
2361613206e66c Grant Likely       2013-09-15  334  	oirq.args[0] =3D 2;
2361613206e66c Grant Likely       2013-09-15  335  	oirq.args_count =3D 1;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  336  	laddr[0] =3D (hose->fir=
st_busno << 16) | (PCI_DEVFN(31, 0) << 8);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  337  	laddr[1] =3D laddr[2] =
=3D 0;
2361613206e66c Grant Likely       2013-09-15 @338  	of_irq_parse_raw(laddr,=
 &oirq);
e6d30ab1e7d128 Grant Likely       2013-09-15  339  	dev->irq =3D irq_create=
_of_mapping(&oirq);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  340  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  341 =20

:::::: The code at line 236 was first introduced by commit
:::::: 89a74ecccd1f78e51faf6287e5c0e93a92ac096e PCI: add pci_bus_for_each_r=
esource(), remove direct bus->resource[] refs

:::::: TO: Bjorn Helgaas <bjorn.helgaas@hp.com>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

