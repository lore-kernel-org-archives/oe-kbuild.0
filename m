Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5486BE6D
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ihs9QYC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702446097; x=1733982097;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BL+A5vlpL2TT9u4HkAmA5BxXMag/4jXcP7A4lWcAvA4=;
  b=Ihs9QYC5xus2NyQwtyrDzGgGpOW4qY3RE5YFvO70NLPiDFc8F5/9InBM
   EbixRAXomWY3VeT+DYmPNKVwoFNAVaWeGrxKlQfQDvPEI8JaixDLnfG5t
   0RgwgWX0oMU0+9qisSvMKXQHaiGOAt/ZmVWNyVT4OxAPRIIW+0GBlcDTK
   QfLO9u/rQ1q7r+8U3kpzDdnsSDcq2e0u7kGMGLzYCfL27HyI7GZVeC96P
   FSe91j4aDzhKpAZqCizZVLOsk/yvb8+jFdia4Tz4u7tlWXz2CipFvWJJj
   ueiZW4XfTgfuRrw3gQpWUZS/sn7qSJHCUa7jcz/WUN+ewuxtaX3bGm6bU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481117237"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481117237"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 21:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802760633"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="802760633"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 21:41:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 21:41:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 21:41:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 21:41:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 21:41:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsmvXsEo++QPppaNlLFrT923IvJaLvQsxK4J+pOM7e9QcAkMJcdoq4+bDgapgzFPw2dITj2RGnMDHMlV1UThLCA65piSamFeEKHteA0EOwSnXWo3qDYsLioz152t7jw5MsAcsiJqYF8KnnXdFX1Xgcz8YPz1B4CjcmFJn3gRUiVnRZraFjJzA3COIFhGG3TY+0XFAFntX9jvx48LsleAKzLfrtZOFw0PTezLtFpZjcDfBqN8qs6tG8hmaDBrfoAk4YyOD/cBTWnjW0HYlYa73oeknx0PsL/oGeltXlbmAYfl/L1VhDjMkGecAy5Ft/CmgEI/LID7I4BuDLe5dxHmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWf4ScauSRYO7EJyEIjVT+Q2wjgIIIOGyTrEa3xoFDQ=;
 b=mihKCeRc9gS3QDnCNZeNn6zTlsgU7XN1TDVLYuOXf9JXlNFlgFl2Unb2ilMpQKya0tNtK6Cgxy4dKHL39rRb0bIl8k/1V2ikNbpjsB5FKb0/N2DmPtK9UbVqKyZRbX3v5LxubS4Oo08RdjN0dyna705ARSzQS9LUGlvcr2I5JAaubp2v3vhH6nNzdAoyLEv5KCo5mdM+Ul2tqjCukyFdvxI2/Y/QM1AqIAEb6Odn+yTJaDIe1matEk8Yh2j1PbqIMABFwcQRHs5Igf5X9BedHeuRqwvW+95POEit6dZfz2rY+sdXcSWwAl3vZMuWL6Yx+Q+heSeFOe68De1voHweFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 05:41:33 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 05:41:32 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/pci/controller/pcie-mt7621.c:241:49: warning: 'snprintf'
 output may be truncated before the last format character
Thread-Topic: drivers/pci/controller/pcie-mt7621.c:241:49: warning: 'snprintf'
 output may be truncated before the last format character
Thread-Index: AQHaK/ZzlNgfunS0dkGaH0pEyOW5pLCmte3w
Date: Wed, 13 Dec 2023 05:41:32 +0000
Message-ID: <CY5PR11MB63924E3E862331D0417B5AC3FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312111344.ghnJwbSD-lkp@intel.com>
In-Reply-To: <202312111344.ghnJwbSD-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH3PR11MB7916:EE_
x-ms-office365-filtering-correlation-id: b0f090f5-4ab2-4eb6-bde7-08dbfb9e29e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1kNc8l+1FwiIRkGRLL6+LPh0NG8EZv4OKoVU3ESMcAyLfN6+LrYVrqZ7Uud80HrXy7W0/5CAbC+31uIE1zOwd0E/LFC1XFeBipBl/xZagImu3MZdpWD7Q4vcCPKO2YI3oOXZC/9a1C/xjR4eMpP0x4zE5+R6hlQ+KdE3VSPZsZCUV4U25WYJfBTflSFR6azUzCC6awbLYVniellLf7pSV4atyjEcNm7Nau705VvbEc7DKK841saO8fYsb9Rh+KzhWKEinkYDRGjDR4yABTxlzq4fonDOVhkzhVtoqgvon59Nz80kqeq3i8P7Hcql9M4fT5Otj9w8CKXJddw+xS8bozpOXRXaMoyxwIk1OrkzIQBixb2Wy9eGvwN5HJG3U2rCUUqry/P8rOpomV7AP0NIWEA055b5OMJr2YLomNzJrX6AXPOyYq0ijxMDdCF4fJEsm/S56nOg/yPalgO0efz/MQla+KDAcnWiM48rzlzVzGRnkhl3C6vvZHrJk+D/2jDD2TCmQSzCnb8AkON+b5af46D2zJ58f+z2j6ht+L54IWKEjHWMryWK/4OFhun1xg1nTxTXLlwtT3EkhmolCHaXNrdHRO7zQfA/6dvTGQEJdR9SDqmJRVeMkShc7MEHYrQGrdYoPivm4vPxsTceN3rTGVKuRM7T8f5KSIEe+Hb84c5CiH8bgfojJdBci/byM09r
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(53546011)(6506007)(9686003)(71200400001)(7696005)(64756008)(478600001)(966005)(110136005)(66556008)(316002)(76116006)(66946007)(66476007)(8676002)(66446008)(86362001)(52536014)(82960400001)(38100700002)(33656002)(55016003)(122000001)(8936002)(83380400001)(26005)(38070700009)(5660300002)(41300700001)(2906002)(4001150100001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r+vaMfwgcGjDeZwrEPZtvdP+fti3+AstMKKXs/NeAYacNbXZPhGKlfbaowYB?=
 =?us-ascii?Q?bneWjljtYSXOh3OgMplGwNWcJhO/u5Zvoc1buwf8SilSh79zV78vYsaJ14iu?=
 =?us-ascii?Q?VAZKiEah1srPMyAcQlIE+1WjgHKW0Ewoe3VCfc4W4uiXQiCFp4cVdudmnM0i?=
 =?us-ascii?Q?jxIkXXjqa5WULL9qMQd3mi5OMRH3HcjWmjXj/Z7XUzm+bOD3fU0Lfn3YlC8i?=
 =?us-ascii?Q?OjbEH++g12PqQg9+9QQiWabCcoodFVY1WGL5IaJ2p/TunyqUdPRhqEPULjUC?=
 =?us-ascii?Q?8HaeIC3YRZP+rq3IzOg13m23kmKMhl+9lVkyjNPpaWJkURo6DTjAHXWYMsE6?=
 =?us-ascii?Q?2VeKRW4ToITW2/NOqQeawQ3M5ymxKcnrSvq4TcvEI8qLvCreq7sZi9wEHo3t?=
 =?us-ascii?Q?QQjormw3HJoaKQPSlIb4Un0KG2yv3vQcrOs9U6wy2cxPQxaywyTq3lpx0GA3?=
 =?us-ascii?Q?zHAAoLqlJDpENg8aKmFnZB3QTPapQC3g7Pe1RAZtBYiGPwt6gBycX74QrUlW?=
 =?us-ascii?Q?aWRoeOmdI0YTlPIz/1nRLKGOf5SfBvNWOL1Q68fy+2EOyPoGZDKeyG3+8+NO?=
 =?us-ascii?Q?pjYJGj+IDt4GhjULZDEsb+Yqdsmwb5pnjKdowx6ZeePIGkeq182yUb3r1oZB?=
 =?us-ascii?Q?U5A0SWH5BBsaL2roJQfmQGKchpvRylnHaPO7AYe54A1AhiotXfPfo7yqmpHI?=
 =?us-ascii?Q?e4OeFXtmWgAHDTmmlB9QyrKtCs+3RLhwvn1EujgUJNLpx7teegv5XVVb+BSK?=
 =?us-ascii?Q?gt65uRLukPlfhfbUN7/mFc3x6Ah/kOCPhAp1s409sp6lyd1cuq/roaNXztZS?=
 =?us-ascii?Q?ff3sNK2TMC9ymdY8QxeqTQUDkrOiT+sc3XxMej8b7qEidhPgeHOaR2bT9UaD?=
 =?us-ascii?Q?HvZ1Q1XlF9x1kLEt6Xp1yG3qQpAx/YHBj7+Olz4Jr6ewi2SJUhThIPPqmWXO?=
 =?us-ascii?Q?tLQcaHg0ccNn8nEAe0sEnxip2Nqmw70GufBTNjEnt04TW/+CwHr+9LGzDU0o?=
 =?us-ascii?Q?uNG3ukXJOkvzVGrkWv3bzdky5ZsaSzkZe3BmYw+tQ5mVnlsGUDj4/eeI8B4D?=
 =?us-ascii?Q?CXRXbAtpuvZnB0XJNkd6jIcqfvXdgmDVRarEmBFORAVFCauDuNQ1fImMA0sR?=
 =?us-ascii?Q?Vx3AebD2tMGckgQthh3N5MkFmiuvNXgY4oKMiViJnGr+rUiP5DRyXA0bAEf/?=
 =?us-ascii?Q?EH0xcc9Yqh7YsQfiB7NJqNuLQpgKI9KTRtaAXIdaQGwR28W6w7QurYmQt/hH?=
 =?us-ascii?Q?KqQE+3H4Ln5/fDst1p0MkTdfgmutAbDROGH/jZPFLB55Esed+udLbTrERhKK?=
 =?us-ascii?Q?lueszu98FD1pkv5vnMgeqzTSAY7tRxoB+2iK7sThq/3aY7DduntNIMbZc82o?=
 =?us-ascii?Q?D2TTkpSHpk5y3dOiN6ao4fLYu4LyH1w3ql6g8nJJurGMTbokWs9nKyTw8e6A?=
 =?us-ascii?Q?dCcuvmR4Fya5gr3/EPOgmy1ua3tHwwvC72LeEctG+AWjV7xs8qTeDmoB40GV?=
 =?us-ascii?Q?Po9bR+NgMrfaLec935NZcDx7iO8DY+dXBC44f2ckEGU03x6ypBxh0g7aAxds?=
 =?us-ascii?Q?1Seem3W5z+LxRBY3zLb4mJNegQ7UsRCHsb6H4ywV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f090f5-4ab2-4eb6-bde7-08dbfb9e29e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 05:41:32.8981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qG6hfLY1GPgkBliKIAMwv4s6lt3dV75W9BY5TCzOrjTmEvTe8eXcUfOL9E3v+LtMGWzRBuv0VGinerF5ISjS3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com

not_report

only kconfig change to allow COMPILE_TEST:

PCI: mt7621: Allow COMPILE_TEST for all arches

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, December 11, 2023 13:52
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/pci/controller/pcie-mt7621.c:241:49: warning: 'snprintf' o=
utput may be truncated before the last format character

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

Hi Sergio,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 44ddb791f8f41f5f9f2ab4280a27c179ca7a8aed PCI: mt7621: Allow COMPILE=
_TEST for all arches
date:   1 year, 11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 11 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/2023121=
1/202312111344.ghnJwbSD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231211/202312111344.ghnJwbSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111344.ghnJwbSD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-mt7621.c: In function 'mt7621_pcie_parse_por=
t':
>> drivers/pci/controller/pcie-mt7621.c:241:49: warning: 'snprintf' output =
may be truncated before the last format character [-Wformat-truncation=3D]
     241 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |                                                 ^
   drivers/pci/controller/pcie-mt7621.c:241:9: note: 'snprintf' output betw=
een 10 and 11 bytes into a destination of size 10
     241 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +241 drivers/pci/controller/pcie-mt7621.c

e51844bf825169 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-24  210 =20
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  211  static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  212  				  struct device_node *node,
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  213  				  int slot)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  214  {
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  215  	struct mt7621_pcie_port *port;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  216  	struct device *dev =3D pcie->dev;
fab6710e4c51f4 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-04-13  217  	struct platform_device *pdev =3D to_platform_device(dev);
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
019-01-04  218  	char name[10];
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  219  	int err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  220 =20
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  221  	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  222  	if (!port)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  223  		return -ENOMEM;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  224 =20
108b2f2a972454 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-11-23  225  	port->base =3D devm_platform_ioremap_resource(pdev, slot +=
 1);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  226  	if (IS_ERR(port->base))
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  227  		return PTR_ERR(port->base);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  228 =20
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  229  	port->clk =3D devm_get_clk_from_child(dev, node, NULL);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-05-05  230  	if (IS_ERR(port->clk)) {
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-05-05  231  		dev_err(dev, "failed to get pcie%d clock\n", slot);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-05-05  232  		return PTR_ERR(port->clk);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-05-05  233  	}
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-05-05  234 =20
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  235  	port->pcie_rst =3D of_reset_control_get_exclusive(node, NU=
LL);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  236  	if (PTR_ERR(port->pcie_rst) =3D=3D -EPROBE_DEFER) {
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  237  		dev_err(dev, "failed to get pcie%d reset control\n", slot=
);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  238  		return PTR_ERR(port->pcie_rst);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  239  	}
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  240 =20
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
019-01-04 @241  	snprintf(name, sizeof(name), "pcie-phy%d", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  242  	port->phy =3D devm_of_phy_get(dev, node, name);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  243  	if (IS_ERR(port->phy)) {
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  244  		dev_err(dev, "failed to get pcie-phy%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  245  		err =3D PTR_ERR(port->phy);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  246  		goto remove_reset;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  247  	}
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
019-01-04  248 =20
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-03-13  249  	port->gpio_rst =3D devm_gpiod_get_index_optional(dev, "res=
et", slot,
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-03-13  250  						       GPIOD_OUT_LOW);
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-03-20  251  	if (IS_ERR(port->gpio_rst)) {
2bdd5238e756aa drivers/pci/controller/pcie-mt7621.c    Sergio Paracuellos 2=
021-09-22  252  		dev_err(dev, "failed to get GPIO for PCIe%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  253  		err =3D PTR_ERR(port->gpio_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  254  		goto remove_reset;
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-03-20  255  	}
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
020-03-13  256 =20
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  257  	port->slot =3D slot;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  258  	port->pcie =3D pcie;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  259 =20
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  260  	INIT_LIST_HEAD(&port->list);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  261  	list_add_tail(&port->list, &pcie->ports);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  262 =20
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  263  	return 0;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  264 =20
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  265  remove_reset:
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  266  	reset_control_put(port->pcie_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
021-06-07  267  	return err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  268  }
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2=
018-11-04  269 =20

:::::: The code at line 241 was first introduced by commit
:::::: 61f9bde6ea578f5baa1662c97365f7b36fc790fa staging: mt7621-pci: handle=
 phy using new generic phy 'pci-mt7621-phy' driver

:::::: TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

