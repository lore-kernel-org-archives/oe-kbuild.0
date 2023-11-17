Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1382F43
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEPrCVa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700210116; x=1731746116;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=a9l7Jt1X9bJVlshQ0e9KA0ILQFjj9ZS69lqxlSEx3BA=;
  b=SEPrCVa6CBo/Lvg8FGF8TXbOzuZW2a0wRyZSwaHj51bFjikzZSk2iYBn
   x269hsY/ZhoZ8H+U5OhH0VPZQ5t+BvFPDUGJU/98M8YAurVNBQG3t6ElT
   6ShZMhR7bEAaTlUbDuYVownmvsZtpirJyCmpl443EUIsByVf8lu0lb4Ep
   yXthE1RmlhVsHmUxRt5LQ9pI0VWOMypNzC5MFWAZNipl3U+PT+72x8/72
   e1zG04TQgXVAoObcKIy2BRE0XZB4Txk3ZrW/AVYMzmq2ELBv1OhdIec/q
   WBUuY0ndYOjYp9LR9TAefNw/WazGxOYyEMN9mOsJacb1dFF9FZ2DT486+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381651777"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381651777"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 00:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831551398"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="831551398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2023 00:35:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 00:35:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 00:35:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 00:35:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 00:35:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C72gre649ZScahgDPyTG/KwBzTvfKtTjw9Tfh0eCkWKS7aiYbOyrM8t447a7OKhHTAbCsnB2+bTzuOXoGbJNs2jPlnHk2iPEhFHYwHVpjOoKSj9gBX5bVpDUkmEq15bL7tOOggw3epUtPmuifo0h3vC5zBa4TcghCjyEcmaJvNAUji8WSVz9cw09dpnCImsC/bJIRT2jwpRt44C9giiYm7C3V+VW0Iy5oGh0MnWv/ymTEjYZiE3xHTGqJD0rgrbuM3Pef8tC5Dh0TrTjXphUApDV061zg0yJDxJN9/P2VnKGpTWXERlgnX4sPi7OdD6aC1iKFrNyPWLxSeQvEsypag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPS4lN+xaZ8KdxIGj5xhVeSJqSkV0XiFkw0C4cd9jVw=;
 b=GMKUvlKvBoWLSPxCxLVlmq4ISIw3mHNDL03dxOjpWWBQJBxnjlYtg6sjmylWQbBCTmwgfVtXvBqsmxBKkuOS/dNYeb32mNQEFsrs5In68lFomEEsx2OjzbNrsM9OJ3Li7zcWBTyQv0VxW+AriRdXYhLvr5L0V1B+EfJ191o4Qjc8SMcvqxvXrm+MKNHfsGqcZkDg9SjerbaZi85cRwJGdKQxi5U/Qrsn1+QFmUDK67KgQmWQ0qSRR6LuA0o/dMZaO6Rb9sKVENbIUpzdhTHzeWeZTT4ZRT/HHGOXWArX5MMOy0J5GPW6gf3wa6OhKz5Lx008DMqOYIYC9e5LPnAb3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:35:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 08:35:10 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: include/linux/platform_device.h:91:23: sparse: sparse: incorrect
 type in return expression (different address spaces)
Thread-Topic: include/linux/platform_device.h:91:23: sparse: sparse: incorrect
 type in return expression (different address spaces)
Thread-Index: AQHaGPO2SN2cqoC3QEarkFT0OBNrMLB+L2rA
Date: Fri, 17 Nov 2023 08:35:10 +0000
Message-ID: <CY5PR11MB63921EAA6EB39CB245431867FBB7A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311170948.rDwaXfji-lkp@intel.com>
In-Reply-To: <202311170948.rDwaXfji-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB8166:EE_
x-ms-office365-filtering-correlation-id: db00fe93-4522-49b7-5eff-08dbe7481c95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZhKJpWUCdw4/Y5Y4laF6j25DpuU2kwG16vq5H6VF8Y3wyWwStlI9+cbcxa7aCx24OrXDjXI4AYU0OVM9Sth6/e+quBmJErN66DFcd7UiHdgX1OyvaRiPSoSQRSvpafmScGrPHI3CMjwDTakUpqrhs3u7PKVBN1BKwZOOxLkA/Fe/oJ+b3A5lwnf8/56m5uEXmQeiG+oTWSRgwalCAtd+tc7BQMZy8IT4Ja2/5y1rdEUGLlZYNZjbkASICwGJB/yPUbAqBgF+aw1MmaXU+wVBU0+alj5mKj+MjQymxF744jabizvs6orCJGEphlfLSU59WOm1XoW7URjG/Pkc1qZZWedPG8PzOiN4h+JplpIFAXZovl0sdUXUOzf26Je8UatoMGnB9QFlIo0Nmh5yUeI8g1ywTrHJDKFt+FJXy3skHNP7AP+8pxK5EahlFD3sqcuoMCcLJ1NgAh/Yu6Yj80VgZja/uH92lOXvMivH6HUc5jXb7O8QaMSMpBGILj+wY3NngjB3znGft7R1nU5f5HYpWWCw4tyzCJ7ERXZGvtdf3XbobaTmAS5r5Ml3pm/w2CeazEGn7ncX8GDopHhxzQzlwQpERVp+tIQOsRFG/GMPX0QlLilxqSgphke/3T/P+vPXAivs/usGN8IivlTjKP1QEqrvOcl2Sy+jzyncHfevFnZqcD/ypvpRluPY50Gy93Ky
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(52536014)(8676002)(8936002)(86362001)(5660300002)(316002)(64756008)(66446008)(66476007)(66556008)(7696005)(6506007)(71200400001)(33656002)(478600001)(41300700001)(966005)(38100700002)(9686003)(55016003)(53546011)(38070700009)(26005)(82960400001)(122000001)(66946007)(2906002)(110136005)(76116006)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ri536eO41jfKl9+/VoIJlFZ1Rc/gs+sAbJz7Mo5jysOssEsBucEQngQSZp+2?=
 =?us-ascii?Q?oIq5YhBQ1hOEKRveh1iEUSMobc4kSIdwLKHdmWF5Fr5ZnwozZQSx4LKVAOMV?=
 =?us-ascii?Q?fQ07gWPVwOGQIgB4NhstL+vRwa8dnol+42+zvjNHbGVe8gUY5nJW4Kf95pd3?=
 =?us-ascii?Q?m2v+E4dgx1D70uG1GSjU3g4Ax9P/uYSRnZKqPR0AAOl8oIph6IBJGP0vMF7u?=
 =?us-ascii?Q?PMiV8vPNIxulhOJVb9RVKJkUbhNHAH2rsrsR4W04xg8aQQ6EpJSWLx5CR35q?=
 =?us-ascii?Q?pQUlii/ttMI5LXGdUKvPagfKG/5353zyMfRtiUoXDhJyLCF9F1LuphQ5Qmmr?=
 =?us-ascii?Q?KunG/zE/ICbUTg2aX5o9hijNxLbQe5pv0bxk6vvVntUXnwtVEkE3jSt+GyUS?=
 =?us-ascii?Q?66YNiaM6jhWDvoXC8bvWpfVYtXGObia8jSVhP/IW80eAyeedI3y+L87cdXEF?=
 =?us-ascii?Q?fYD+/kTSfruy7B3zNDfvKOCojxDGy+PH5NAMLkImMO5bFSHvZAppShBnIkGx?=
 =?us-ascii?Q?WruVMNe0nrEAAB/5A7AZLpiF49HxGodvJ1WXM0VrLIVQe+Dttf/gdmczJl5w?=
 =?us-ascii?Q?gbWZ5Bol9C2BeLk3LfdHSaNGzN7TVxqtvaInYYVrzVmqBUuhPA9HE19ILaIt?=
 =?us-ascii?Q?E+stjMo177OG+Nxx1hryK0PK8QuMOTaP/Cw2lLq63N0OF4oGc9mACoT3z/yp?=
 =?us-ascii?Q?JsaP9ZNhO9wZ+P+Fjkz6/WdITifxOMFUrvnwTGGJHkqZp85V3b5S3djgL3Tp?=
 =?us-ascii?Q?A+6KjiptbNXHI1Pc4rug2IGangaYSnNPO4bm3B7GCgE6aFr8+pRjkrOPk0C3?=
 =?us-ascii?Q?AZKXHQm2Kv5qkbiz/VJUAgHJsTMujye0GumeZouNWmXbLhXGOc96CQUxHZkc?=
 =?us-ascii?Q?UuHgtQTGjfGBv6jccJQluY62GUm6LKkzqQy6RV4+AtqwJBPiuM7S42c9Ce2d?=
 =?us-ascii?Q?iv9aEnwV6zJAnMzI7HOJ606qVPyIFRydPzpayQ0GbRdrX8aO+eRudRG5uVMQ?=
 =?us-ascii?Q?9EHV0TOZ+LYpO5H7L3XouKHU9dx2GQqY5/MiJktvQdNd98JtZRkDQDHoHnDu?=
 =?us-ascii?Q?sSdjzQhCjqfIVprNxveQZnv2JmU8h+SslwvnBHxkWhZJ/UlJX1wjIpcQ7a27?=
 =?us-ascii?Q?GcMjpetIR8KNxN28q1R6gKSSih78opgaRKDmleGh2pTSY3VmkRo16dXLlCuT?=
 =?us-ascii?Q?OWwLFwQ4Bs4a6mvtft093FuopujEVTZD5ZkdJgXxCNoEXDGAvbzpg+frSgRc?=
 =?us-ascii?Q?/bgwKGa82tPPVdRzDibGkUg05GxnCJ31OqhV2AJB1GMDc38f9TguKVb2xnI/?=
 =?us-ascii?Q?ypLrdly9yn2o0T6wxesJtPEbB7kdYjTE5NQDpnlHcaIDME3Fu451SWZ2uJUl?=
 =?us-ascii?Q?r4wNX65ITeE7q2Jlo78YSMZHsyiCAKTh0DUCVHLJKc10ejE7kedzsSPfIq07?=
 =?us-ascii?Q?UQxkyVP0VcipP80tRUwodHs5vCnWHLSixSIO/42vgZ3Vfly8gWXF6hcEw100?=
 =?us-ascii?Q?BgQkhzpRlPfrQ5aCSpXQFP/293Hn9ndo0Gof+kOcFLWkaZX3bqPjE5ulCM+f?=
 =?us-ascii?Q?UQHaDWCchR0MVSuG5f7QliKXYnosvTHSQyP5uRcw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db00fe93-4522-49b7-5eff-08dbe7481c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 08:35:10.5779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MmYKvO6Ou05l/6u+VuFfT0Hvmu7rVHq+O1Bsdj8Ux79qBJD/U18fUud73SRoFYCPCiBVfFbg4rihARgsCIQbzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
X-OriginatorOrg: intel.com

not_report

This commit only changes Kconfig file. Not the cause of the sparse warnings=
.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, November 17, 2023 09:15
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: include/linux/platform_device.h:91:23: sparse: sparse: incorrect t=
ype in return expression (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7475e51b87969e01a6812eac713a1c8310372e8a
commit: 512d092d78823f9813f4af38090b33c454137a4c ALSA: Enable build with UM=
L
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r122-20231117 (https://download.01.org/0day-ci/archiv=
e/20231117/202311170948.rDwaXfji-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231117/202311170948.rDwaXfji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311170948.rDwaXfji-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/codecs/inno_rk3036.c: note: in included file (through include/=
sound/soc.h):
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in=
 return expression (different address spaces) @@     expected void [noderef=
] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [nodere=
f] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/msm8916-wcd-digital.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in=
 return expression (different address spaces) @@     expected void [noderef=
] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [nodere=
f] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/rk3328_codec.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in=
 return expression (different address spaces) @@     expected void [noderef=
] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [nodere=
f] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/lpass-wsa-macro.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in=
 return expression (different address spaces) @@     expected void [noderef=
] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [nodere=
f] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/lpass-va-macro.c: note: in included file (through inclu=
de/linux/of_device.h, include/linux/of_platform.h):
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in=
 return expression (different address spaces) @@     expected void [noderef=
] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [nodere=
f] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *
--
   sound/soc/codecs/lpass-rx-macro.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in=
 return expression (different address spaces) @@     expected void [noderef=
] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [nodere=
f] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *

vim +91 include/linux/platform_device.h

a0c74f6c9ea9ce Mark Brown 2023-07-18  85 =20
a0c74f6c9ea9ce Mark Brown 2023-07-18  86 =20
a0c74f6c9ea9ce Mark Brown 2023-07-18  87  static inline void __iomem *
a0c74f6c9ea9ce Mark Brown 2023-07-18  88  devm_platform_ioremap_resource(st=
ruct platform_device *pdev,
a0c74f6c9ea9ce Mark Brown 2023-07-18  89  			       unsigned int index)
a0c74f6c9ea9ce Mark Brown 2023-07-18  90  {
a0c74f6c9ea9ce Mark Brown 2023-07-18 @91  	return ERR_PTR(-EINVAL);
a0c74f6c9ea9ce Mark Brown 2023-07-18  92  }
a0c74f6c9ea9ce Mark Brown 2023-07-18  93 =20

:::::: The code at line 91 was first introduced by commit
:::::: a0c74f6c9ea9cebd7a8f38142bf87e7c12c2905d platform: Provide stubs for=
 !HAS_IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

