Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C4C4683
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zeme0Wlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700034958; x=1731570958;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ieNGf1ULNlDmcZYkR7n4PKGZc3eeTF2c0FpBUZhr4v4=;
  b=Zeme0WloUAxA7It87QDph/qz3Df3icTDgkfCIM851KEzjRcdajI+6e+f
   bA6ZxQ6UNL1s+SbKNf4ry8nuzEhn45e+gXEKklV2URal38euaMFOCkyuY
   QcUsP3NC1OjAjezbpUw+VC56mH9Gcrbvg93fjMGDC2ZIx7ahH5sZnOLGL
   U9airTd7GmgbUHLmtYbwbesnqlN1iHRYAA2IyIN3oAljtNKgtIvCkD2Yf
   nE1QYhXbb5Z+CDn50ktw00TUT3HaUUIWJi21WLOjmSoQT1Gb3B3vDreSN
   8gKxonLXBl5bO/BEnQQWKDKRVJ9iuHqY6bDouIS8FWYXj2bXknuaNNtSS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="387994397"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="387994397"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 23:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855572877"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="855572877"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Nov 2023 23:55:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 23:55:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 23:55:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 23:55:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxekgqU7hFC5hNoOS6b7sBjzCWCOVzdDaokAeSzsYNqStCdPdTY0gKg8CY2mRgBAqwdKv6okUN46GcIomDhK+xy18JHnuNfDwh5gCmW/hRK1mkQLZ/wpKBaa9hLAxZK7kGQFhtoz1YWt0hhA8Lf56Qfa5Rc2kdRhz0ZIYmEcklQWZjRjmcZZIFsgBUhFNFKMb/mjzgi6zLISu8c31JiMSfXFIqlGDnuPKb7hTPHMlbpItLy08knmfoiExRbkTjkwb2ZTHGdSHTz2t1Ht7BLNUNYcGyYBx+XW97JnwZlOpduQlKFgracnlgYTv8WrPtAEEiqpLPQltVg3Id0KqJk4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUpe4bWMS4VeU3xoLSGi9wOmIu8qUtM10a/1Gpkh14Y=;
 b=bGOQVGMPqusd+KyarwSm4csLuG/ph9htEIM2oTbX5rF3caGizVB4+SZIiUGBvJ+s7KMZjmHr9sR7jfhyvkqYBkxczqi6jbpjIvPyAm3I0D1WpJq9xnaSMBAyYUnVwFLbLwE7DFbAiy0GBufIYJGfTOhUHSOaRR1/NZgu9Gcad0l2QdBKbTHpgWlrpLNxRoewUfwSxoct18G0aRkJWe5tltxyTnymcUgA/j18RluR2cSwMrU5a4TU2Y/wFGqdKCDW6nv6n25O2D1RGCVOAW/jE+qygq/tNgEONyTCDQMYptfNPnT8x4qa31RfsrK1n68t9JVBqmDKvEjFzOnuegNpHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Wed, 15 Nov 2023 07:55:51 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Wed, 15 Nov 2023
 07:55:51 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Thread-Topic: drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Thread-Index: AQHaFz21AlOmnSYDcUWp86Bzyf9yBbB7AyFA
Date: Wed, 15 Nov 2023 07:55:51 +0000
Message-ID: <CY5PR11MB6392D832A04D8642BDCE9A99FBB1A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311150438.8fBUln6F-lkp@intel.com>
In-Reply-To: <202311150438.8fBUln6F-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS7PR11MB6126:EE_
x-ms-office365-filtering-correlation-id: 5d55b5f3-aec4-4f9c-dfc4-08dbe5b04984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cfQZRcW4AL983PuVzYmts0af1Wb4KcGEny/xvcRnobpUq7rDoU+BG0F3/lg8RgCjrcGpRZxMnaf2zPDmoo7rsRDzxYMrOOxcF5jcTQBPGytlDtNRyfJlmn4FqCRbQe7JCAL8X39i2vPL9RqlqmLotPTqCoPZGYBCXOE6fQ+Rmp8Bwz1lQNAU6zICX+c7OWuoQnl7gx9QPNKEA7DlEBVXpzHJRAVL+VMFjwOiF3l1t0O8hhCqx28zqDDxBbPMOQp4DL5aDF2oRDgi2QfMsMxgLaX5TJlM8skFGznIOn1dQoSpDDVAVB6udjYylw9IclkByUpD5lw2tvKAlMF8TZa2uCai8WyJ+ZP/uC23xUfqG+Pln7byqsbuNH2fI9lotWenW1UK3RWtrElzFx8oV1DFVq4JoVABBISJQkfpk1pwmrjwXkhnHZVF3E/MwbMqOj63GeCvLJ46g7yZgjluAuyvDoYwgtbB+fV6Jveg2mxoYt2JDj9Fq6OxcrItnRKoc0X9TAHUutzZJwuqfn6r7221ycLehQdCjZE2W92rD9ry4hXQ2XPBB02q/zPt/qkeIbuQPHRInaU76kUmg102s4Tp8/GVHz9spp/n/q+5Lmkt7YR66Kof2cKelhrfjI2fxFwe/jcrUSf3AIUd7w7E32iAcPV18RlL4jbX58UDU8XiFihPAZ2+1dZbElhDxGZc6V2G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(966005)(55016003)(66556008)(66476007)(66946007)(66446008)(5660300002)(478600001)(64756008)(316002)(76116006)(8936002)(8676002)(71200400001)(110136005)(52536014)(6506007)(7696005)(9686003)(41300700001)(86362001)(82960400001)(83380400001)(33656002)(38070700009)(53546011)(38100700002)(26005)(122000001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M7U+x7axx6Zm6UCtHWqKaO6S8PZlF0nIuKK9A0tS3/GAgMagOEtRsjo4vo6g?=
 =?us-ascii?Q?1s2fGXm5wOVUYmgrjdUfpqbGAFq6Mga70fOThrKJ0mVP85/cHW9eld4CVonU?=
 =?us-ascii?Q?0jk1JvZ62iyaWaSWhTKdahcEwWJf8uYwJd7kxTfoRuyi4TN8zIWoZaOg3Nbr?=
 =?us-ascii?Q?NIwinIaxIkZQ0dvj9alDyCDTBqE78tU3J+4Zsw56fIo/m+NXgyU/4z79OM33?=
 =?us-ascii?Q?mie76mqjfV8se7Jm7PwBBSho4iGwk1jPek+ejxjAjorrjkm0ko1GHML6Jmrq?=
 =?us-ascii?Q?D1RS+/TmH3lHVuyMFHENHK6eJDuuhmGwL4YXouCiLTu16l9FxfuorF3mBC2L?=
 =?us-ascii?Q?5x7KwwR2MDc7VgSrnjL6SB4hloGRRBIbICG6BQ9rYaoFJCTOaMIcoN+wQ3/+?=
 =?us-ascii?Q?yaOX2A8JpPTFCZiGSG32tUVr98EH6Wp0HdbJlzwhMy5ycj9aYtVdMnITQT+r?=
 =?us-ascii?Q?e4Kd17TPNnQNL01feuniPgqAU7SWrQAfARZ71LLk98i4VBqiy2kQtAJARReZ?=
 =?us-ascii?Q?xgun7VNHKmIe98zJF8ZeXf6EUEHV3pggh/rHzN3oZaV6CdsgINcvlTRaApIU?=
 =?us-ascii?Q?NXrAMBR4kywEmPlTV7mfbUXVbRozms2lddtI/llC4RuxJNZ89LLs4UX/nAAj?=
 =?us-ascii?Q?ruuSQSGlG+QB87dW/DcKJGAC/ynEG4J6D735gpUxyLOjeMGroGP3PyP5pYRk?=
 =?us-ascii?Q?CqScikZ8b+Dm0dIqz73hnsfBOFBU5g+UWX2i87P8IhdyYONdrcIaC9cmDPOU?=
 =?us-ascii?Q?9rIqOzzYRrBXgPd2izONPzHmPbszfRxenC9pWcpNY7NoDEPS7rwjslH62FC8?=
 =?us-ascii?Q?2s2lWkGbUCJF2pciT2ISmx/0+Se56BBQWrbyzLDMIELKhtc//VcQO25c8ZnP?=
 =?us-ascii?Q?ASHKQH5ymHe5hP+wivFR3NvRgXCkzjSk3UiXLbG3KTtmiySbfx5lZ8A4RFCI?=
 =?us-ascii?Q?mnc+3AvtTnr900epFrFm9eI4QEcf9QBThsT80OZQXjU68bN8r+XqwhXMlHEz?=
 =?us-ascii?Q?LJI1TbUTwY+fgKWxzmVTM5mq/uF8wmlvUEuy8JCYABR4Q4oKCnpVtIP60m9p?=
 =?us-ascii?Q?9ksqFc4vxyH1xSmoaSkkmrJiJ9nh3YUoOPd+11bAEJU2qdQ5nsFUnEDutt3p?=
 =?us-ascii?Q?lQR83lTVxbCaZQMKxY5CYpe6O4J7XAJmV3NbyCMZTmS+S7/TtjIfvkziUbd4?=
 =?us-ascii?Q?8xkMEFZNJ/w/OgKw7Qab+ntqtQSffMUvHWnFJ1yqo+IFz7vBKGmp3rPZ3fd4?=
 =?us-ascii?Q?yXmgdjSAnpx+jxqDpHklyVTSLIi8pD9uxiGkzia/MKpvGVPHWKyjuUeCeD6y?=
 =?us-ascii?Q?n2WsFefNgneDgaQn6nByqYty9Zs/REbPUzMGhns4748KapaPDiczZrqq/v9R?=
 =?us-ascii?Q?lSgUINsLWyg/9rtGH13D4KhE9Wg5rH3rTjKxwQKvP4EL5TpzbAz+XyZMoIfe?=
 =?us-ascii?Q?1nMNybL3ks9r8nFVextpvMm7mgCPgFV6fKYGu0cMNmrx54BukZdJjNrWwLeu?=
 =?us-ascii?Q?RPQC5Ctm6yHyYf0zrPxfGsxGlTZ84XPKxXwzqJjpsqXwwr05vmkmpVp6eJ8K?=
 =?us-ascii?Q?q8zzP4eLSzRETR8IEUCtjzM014Xz/esidivTHoac?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d55b5f3-aec4-4f9c-dfc4-08dbe5b04984
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 07:55:51.3282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uh7/tzxFVbeCHEqJGX3QLpgjIoFLDRCwWq9nXQ7OSX7z2m9YGJ0o43Nhellck9sWIPYs1wUSvDoQozrC65dhZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-OriginatorOrg: intel.com

not_report

This commit changes some loongarch-specific assembly code. No obvious relat=
ion with the video driver file drivers/video/fbdev/atmel_lcdfb.c

arch/loongarch/include/asm/string.h |   5 +++++
 arch/loongarch/lib/Makefile         |   3 ++-
 arch/loongarch/lib/clear_user.S     |  70 ++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++-----
 arch/loongarch/lib/copy_user.S      |  91 ++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/loongarch/lib/memcpy.S         |  95 ++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/loongarch/lib/memmove.S        | 121 ++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/loongarch/lib/memset.S         |  91 ++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 465 insertions(+), 11 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, November 15, 2023 04:57
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse: sparse: incorrec=
t type in argument 1 (different address spaces)

::::::=20
:::::: Manual check reason: "has Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Jun Yi <yijun@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: a275a82dcd4024c75337db15d59ed039c31e21da LoongArch: Use alternative=
 to optimize libraries
date:   11 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r133-20231107 (https://download.01.org/0day-ci=
/archive/20231115/202311150438.8fBUln6F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311150438.8=
fBUln6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311150438.8fBUln6F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@     expected char [noderef] __=
iomem *screen_base @@     got void * @@
   drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse:     expected char [nod=
eref] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse:     got void *
>> drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *__s @@     =
got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse:     expected void *__s
   drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse:     got char [noderef]=
 __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse: sparse: incorrect type=
 in argument 3 (different address spaces) @@     expected void *cpu_addr @@=
     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     expected void *cpu=
_addr
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     got char [noderef]=
 __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse: sparse: incorrect type=
 in argument 3 (different address spaces) @@     expected void *cpu_addr @@=
     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     expected void *cpu=
_addr
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     got char [noderef]=
 __iomem *screen_base

vim +362 drivers/video/fbdev/atmel_lcdfb.c

14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  336 =20
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  337  /**
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  338   *	atmel_lcdfb_alloc_video_memory - Allocate framebuffer memory
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  339   *	@sinfo: the frame buffer to allocate memory for
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07=
-08  340   * =09
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07=
-08  341   * 	This function is called only from the atmel_lcdfb_probe()
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07=
-08  342   * 	so no locking by fb_info->mm_lock around smem_len setting is =
needed.
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  343   */
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  344  static int atmel_lcdfb_alloc_video_memory(struct atmel_lcdfb_info=
 *sinfo)
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  345  {
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  346  	struct fb_info *info =3D sinfo->info;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  347  	struct fb_var_screeninfo *var =3D &info->var;
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08=
-12  348  	unsigned int smem_len;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  349 =20
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08=
-12  350  	smem_len =3D (var->xres_virtual * var->yres_virtual
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  351  		    * ((var->bits_per_pixel + 7) / 8));
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08=
-12  352  	info->fix.smem_len =3D max(smem_len, sinfo->smem_len);
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  353 =20
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01=
-22  354  	info->screen_base =3D dma_alloc_wc(info->device, info->fix.smem_=
len,
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01=
-22  355  					 (dma_addr_t *)&info->fix.smem_start,
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01=
-22  356  					 GFP_KERNEL);
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  357 =20
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  358  	if (!info->screen_base) {
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  359  		return -ENOMEM;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  360  	}
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  361 =20
01d3a5e7fab773 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-04=
-28 @362  	memset(info->screen_base, 0, info->fix.smem_len);
01d3a5e7fab773 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-04=
-28  363 =20
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  364  	return 0;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  365  }
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05=
-10  366 =20

:::::: The code at line 362 was first introduced by commit
:::::: 01d3a5e7fab7732cfc5d5d4533e9378ea435295a atmel_lcdfb: don't initiali=
ze a pre-allocated framebuffer

:::::: TO: Haavard Skinnemoen <hskinnemoen@atmel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

