Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6FFC00
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 06:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hw2D/sNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702450128; x=1733986128;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lw+IBE4W652u6Zkc1/DXFNFwMly0hQTVKrw3b6HIkBQ=;
  b=hw2D/sNb3UpBLHnJkBwT3n3i1zIhY4mQlD+AP4F3TbTZkIj+bpR7de9r
   Y8kRXTFVafEe8In2IIXyfgKdgMixX6qrHJFVShA7tzj1V4xlcg0G+BDMe
   Xhb7D5eyj7CilMFyUtcdpd9JqAYJxW+XGzkE/Osa/0b1vOBbFjF19nsG1
   12qO/pRnIIUVhdTFQCke4UUuDEsf7km8j9iqBYE/ZFT+1p8Y7UmalU9nI
   s4ZCUAXzZHzWcf2ZyuAg/uLeIxia1G3q2HY6UL33OUZbKQFdExKER3Fi8
   8I3la/h1HC9pv5g80n7jFqt3Nbz8hVqxTYTiUvuheb8lKRpbYe7ht9ubr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374427479"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="374427479"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864505458"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="864505458"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 22:48:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:48:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:48:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 22:48:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 22:48:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuZpu0pO+sPXgTEkacUtG+d5MRL+u16IwqTuoR1wFvXFAFXg3s2MtKdAR7RVaqHFJ5tQwJl4r5Q6kJ8/5FxPNrEc70iVBRkjuss9HUPtOSHcBOvdzXM2gUVEojny8IHhzadgldjGQDEbpsc2OQtjzyJV/Mwkdq75Zygy0IuzsBTcmWV0FiJWlUNsfj3BHH9L4gSlbqIW03MUPmn4UJur+08rHj1OvSgvuqDlIgHBS9TXlA4hnzm83+nFCxfgskJrFa7HreyotATqXOjQDms4kPjAlLU9lBgLNuUQX6mDsxCcPmVwdC3eLiG7g3WsSSNRASsUo1VOu3kGIe3mM6Bt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpY0UEFiWPbNq3x+KbWIAYgyuXVznI5FHA9JctNB/uM=;
 b=DOVwGHhl9HI7h1gnMXQg05LQblkDpaQTyGlRcMZ1jlSopbQQtI9KxX0+TPqoDqEq23m3ycfn/R7IlJDNAiJnqmY+4Uxdy3sN9b037fKkoKhdRW0hDF1n6fogApGjHcto7Bl06HcuH59+8Y21mOsCDp9E9SHdUb8Xu5Y6uJ3WsZiJGe8kj/ezJONJxXw+oXdLCUC7+ZAkyCLeuYR0/xDTGbvifP/2ADc/9Yy1S56fNF7h1vl9K07EyBdpYy2S72pqq2gBQHP8jFq6Sh4HO+NHYvFxzjzS0xBQXoMO1SwI3+iagAtKduaLZ7eJeGo7RbYKo7fMyQIhvIa8gveVCav+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:48:42 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 06:48:42 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Thread-Topic: drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Thread-Index: AQHaJuErZ27kYOyYMkSptCgKmYMvlrCm0t9w
Date: Wed, 13 Dec 2023 06:48:42 +0000
Message-ID: <CY5PR11MB63925CBFBD59AE70B520CD19FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312050222.9hqPhX0M-lkp@intel.com>
In-Reply-To: <202312050222.9hqPhX0M-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB5249:EE_
x-ms-office365-filtering-correlation-id: ddbb49db-147a-4035-136d-08dbfba78b88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /AeVJaDurOX4VjLV8wd8LJD/s4js9Ud9B/zvrZ2/RtoPSzAOEKiPG6VH09i8VmNrL+nZ7anSvsrjGkE4trFELGgklpgGOfHuA7NiUczWyNO3i3KWb2LvyW/lhK12u/oZz9AFQm1od0E0yVtTi7UehJP38PXKANUZk5Ue9CEnl+bBYC18QMqJM2PIAxnXsZ6OofSXcZfNgTISfcSFeeKlXzNCE1pZRWZDFAWrCLZRsPc8sbwE8VX6KDIZRb3JFfisTBi0VLDuD3y5Irrw842q3VdfZG6HZSf07jv6dEoz5tFsuvhQo8wSyhsD0TCXYLq8GW1aj6+aBMMMKbbKNHkSZFc144rBpVVD4GVLGkOw7j07yEuncAJ7pb0XKn2Acyu7cI4Hq/yoqwstdMuocu2NwRvx7sWi/1Gjko3mZebknuZM5UeNOUnD/lE23Ga2nzLD7tbW+nVqenThpmLfk5/n6Z32JE0k06dHjUvdbAfSZ/vAq/yvYllGapkdLbIzfmXIk3xVyv+4mQc2YJRe4svBdbt6xt7ziCtNmfYLp58L7sFcv8Fc+0dhUgUGY2mmkw87VRdEP1EDEOyhuZ1HMo+r2Ic6oX6YvIbOpEAIj0wqGnd1PTv6baP58Jb1NHrlAJwTtWN9OR7wOF3HJPu3ILCUiAYq1WzrawROyxdqyjODrOwoWgPIGs8pcl6fdZOelePE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(26005)(71200400001)(6506007)(7696005)(9686003)(53546011)(122000001)(83380400001)(5660300002)(52536014)(8936002)(8676002)(4001150100001)(41300700001)(2906002)(966005)(478600001)(316002)(76116006)(66946007)(110136005)(66556008)(64756008)(66446008)(66476007)(33656002)(86362001)(82960400001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tp1AF0Zg/ylwklFBFDeS4VehRoRnsFT2SuJRRepJi0Qy2Ge/ex/BqFFwhZ5w?=
 =?us-ascii?Q?S7vAWUbYVLGvOsreGlH5h3Jvh4BOi/ang2JaIB1KC5DzThqVZhqMbfX194h6?=
 =?us-ascii?Q?y2ON7KKydH9cHrIEYgUZR5wT/iQ9bKrNaDa3H76T8/CPDkbEZ6lLnOFrkiof?=
 =?us-ascii?Q?umgGWx8X7UMKSGBz+/uRGcboZyzcf6hCniWr6FwSyu5TOpAJz3H44RtZChIB?=
 =?us-ascii?Q?kPB+I2cLO+BE04g/6F0dwgf+8PX6aQNygpfxlRr74ZGqRy2QRLasWpbX7iis?=
 =?us-ascii?Q?CYTXt6kWSz1VaEddv/T2qAvldIt4rsO9g2KoHACXCN9ohpRBRg3+TtjL8+Qr?=
 =?us-ascii?Q?c90iA3bY1hRBM9D6HOcNqBnidjGcGt8xLybDzOPxZoKLgijRv8rpgymVPYpf?=
 =?us-ascii?Q?GnzbcIvStJappheATrrdj0yx16VGVm0YlxraYrdnQw/2tCTLFcFVBUmxGVtj?=
 =?us-ascii?Q?GqlZI1jM9gfx5ThsGwmG6YilstMnXZ7o0GMnonaqwzZSVqYjAanVDJhYf1sh?=
 =?us-ascii?Q?+zbaenTOBbbVp87e/+lTz39Jy4i+XjQK39G7UVcbsf7jdSO3tyYUdtqc06gm?=
 =?us-ascii?Q?JqsKevnzrMCKb8c+OEZ61L5LEfFVM3Bz0uC58kjB3f82mtDF+CvIhhw6pJ30?=
 =?us-ascii?Q?BXySQKU2I784iiK4tGqTWHR79112wvgMc31Lx4UPdUO9RVI0NDq6d1GuVJoR?=
 =?us-ascii?Q?lRfrTHI+PSf/5rlG2xirUL5OHAVK7c7J18J66QfizQmwJILhNMjGf97ymTHc?=
 =?us-ascii?Q?THgSvo7qPeQIGO5mvn1gBlaHoGvSBteSCRdDA1Wu/nMFK6OjJNKCl+7VseY2?=
 =?us-ascii?Q?Kq9yheFiZqvnDzpVDK2WaPm3rNfoo/aj37Fo32ysn7kGDRMJPODM6ykmhjiG?=
 =?us-ascii?Q?KefbHUKtWLkyasCRA02hv9AUf3VBvgrKppyx0iZGd/PLn5mHZJOFBnp9qNI/?=
 =?us-ascii?Q?lRhevFY6llHgEJsOC0dMDMrQURWGPJl6i/LTwOUiu5G7hwqBfeBIg+VRHD30?=
 =?us-ascii?Q?UMI0ehZgiSYSqURRgA+Y2JSQMOqnunGfTNTMU2IkMCQBnuNunP/Lzu2k8aVF?=
 =?us-ascii?Q?zK0H1hbsfMgX9qRO0uyZu3jjxE5+OvKBhKh9sXEovbLHXbg/oRmek1/SEm8Z?=
 =?us-ascii?Q?VJp1eeL1zBzzNvbi07J72vqzsgyT0LvthkSkmZ5rUwexRvpxSwe6nuRyryqs?=
 =?us-ascii?Q?muqo2iC1eYqTXIyrW8jEcNth2d+ulAbg88wZ3Vlul18+vwxnFxicaGiQxg12?=
 =?us-ascii?Q?fXU0UDHK0T7F9yRWHvclnuvd8dOxMzW6t4KgjoIUeVezew4KUjXpztUue8Mc?=
 =?us-ascii?Q?VaiMQIAcTFC02+8OBauKG5fCPFVyD840ebmq2CTqPaYBn6GZfPN6yA97jC3N?=
 =?us-ascii?Q?DcaxHhf7TVZVghJ9k02lpWQsEBVephrz+xbjYdXo0Pb7IMV8fBWJgh6zdlQQ?=
 =?us-ascii?Q?6FB9/4PHjznEB2CUWC0BlM4zcaT0jWVqiL2PF/E+WOGKAnauir+7izhkaVZz?=
 =?us-ascii?Q?lHON3lMkALqVGWS9RcBdjGu79mNFCUTcl/Mz3ifBJC1+JGIa/LQBfl0SBvb+?=
 =?us-ascii?Q?wm0uNbk4QSOj+IUTUN8ou87ihtyv8y3v+MQ49f7V?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbb49db-147a-4035-136d-08dbfba78b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:48:42.1659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NXQszEssEDwl8+rXSXAgEvmANzJSLpkM0/3JUmn6mytr3DJktViDd3AsBQyPtjInlup2W2NU2fKRwgwqOqCJhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
X-OriginatorOrg: intel.com

not_report

Only kconfig change, not the root cause of the sparse warning.

arch/mips/Kconfig         | 8 ++++++--
 arch/mips/generic/Kconfig | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, December 5, 2023 02:37
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse: sparse: inco=
rrect type in argument 1 (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GE=
NERIC_KERNEL symbol
date:   3 years, 3 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 3 years, 3 months ago
config: mips-randconfig-r123-20231115 (https://download.01.org/0day-ci/arch=
ive/20231205/202312050222.9hqPhX0M-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050222.9=
hqPhX0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312050222.9hqPhX0M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got unsigned char [usertype] *addr @@
   drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse:     got unsigned c=
har [usertype] *addr
--
   drivers/gpu/drm/qxl/qxl_kms.c:169:19: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct qxl_rom *rom @=
@     got void [noderef] __iomem * @@
   drivers/gpu/drm/qxl/qxl_kms.c:169:19: sparse:     expected struct qxl_ro=
m *rom
   drivers/gpu/drm/qxl/qxl_kms.c:169:19: sparse:     got void [noderef] __i=
omem *
   drivers/gpu/drm/qxl/qxl_kms.c:187:26: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct qxl_ram_header=
 *ram_header @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/qxl/qxl_kms.c:187:26: sparse:     expected struct qxl_ra=
m_header *ram_header
   drivers/gpu/drm/qxl/qxl_kms.c:187:26: sparse:     got void [noderef] __i=
omem *
>> drivers/gpu/drm/qxl/qxl_kms.c:276:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got struct qxl_ram_header *ram_header @@
   drivers/gpu/drm/qxl/qxl_kms.c:276:21: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:276:21: sparse:     got struct qxl_ram_hea=
der *ram_header
>> drivers/gpu/drm/qxl/qxl_kms.c:280:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got struct qxl_rom *rom @@
   drivers/gpu/drm/qxl/qxl_kms.c:280:21: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:280:21: sparse:     got struct qxl_rom *ro=
m
   drivers/gpu/drm/qxl/qxl_kms.c:300:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got struct qxl_ram_header *ram_header @@
   drivers/gpu/drm/qxl/qxl_kms.c:300:21: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:300:21: sparse:     got struct qxl_ram_hea=
der *ram_header
   drivers/gpu/drm/qxl/qxl_kms.c:301:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *addr @@     got struct qxl_rom *rom @@
   drivers/gpu/drm/qxl/qxl_kms.c:301:21: sparse:     expected void const vo=
latile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:301:21: sparse:     got struct qxl_rom *ro=
m

vim +3710 drivers/video/fbdev/aty/atyfb_base.c

c98959f566e0c6 drivers/video/aty/atyfb_base.c       Ville Syrjala      2006=
-12-08  3686 =20
48c68c4f1b5424 drivers/video/aty/atyfb_base.c       Greg Kroah-Hartman 2012=
-12-21  3687  static void atyfb_remove(struct fb_info *info)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3688  {
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3689  	struct atyfb_par *par =3D (struct atyfb_par *) info->par;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3690 =20
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3691  	/* restore video mode */
eafad22a05fdac drivers/video/aty/atyfb_base.c       Ville Syrjala      2009=
-06-30  3692  	aty_set_crtc(par, &par->saved_crtc);
eafad22a05fdac drivers/video/aty/atyfb_base.c       Ville Syrjala      2009=
-06-30  3693  	par->pll_ops->set_pll(info, &par->saved_pll);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3694 =20
37ce69a57ff217 drivers/video/aty/atyfb_base.c       Richard Purdie     2007=
-02-10  3695  	unregister_framebuffer(info);
37ce69a57ff217 drivers/video/aty/atyfb_base.c       Richard Purdie     2007=
-02-10  3696 =20
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006=
-06-25  3697  #ifdef CONFIG_FB_ATY_BACKLIGHT
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006=
-06-25  3698  	if (M64_HAS(MOBIL_BUS))
37ce69a57ff217 drivers/video/aty/atyfb_base.c       Richard Purdie     2007=
-02-10  3699  		aty_bl_exit(info->bl_dev);
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006=
-06-25  3700  #endif
7d89a3cb159aec drivers/video/fbdev/aty/atyfb_base.c Luis R. Rodriguez  2015=
-07-09  3701  	arch_phys_wc_del(par->wc_cookie);
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006=
-06-25  3702 =20
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3703  #ifndef __sparc__
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3704  	if (par->ati_regbase)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3705  		iounmap(par->ati_regbase);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3706  	if (info->screen_base)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3707  		iounmap(info->screen_base);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3708  #ifdef __BIG_ENDIAN
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3709  	if (info->sprite.addr)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16 @3710  		iounmap(info->sprite.addr);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3711  #endif
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3712  #endif
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3713  #ifdef __sparc__
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3714  	kfree(par->mmap_map);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3715  #endif
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3716  	if (par->aux_start)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3717  		release_mem_region(par->aux_start, par->aux_size);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3718 =20
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3719  	if (par->res_start)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3720  		release_mem_region(par->res_start, par->res_size);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3721 =20
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3722  	framebuffer_release(info);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3723  }
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005=
-04-16  3724 =20

:::::: The code at line 3710 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

