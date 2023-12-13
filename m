Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7C6126
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZjmcnvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702445933; x=1733981933;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PoBsJB44U+fCHDkJjP9WlFQhjvQ6Zv0LaNqSqcwLm6M=;
  b=YZjmcnvkLN+mcl0LyRULw5EpUj6zvdAmIVIo8gGQUmhbhdC62E4Jc6HK
   Mvk040JP1MzIUlkd2xn+wAVUQtXso11eih+UargLyiOs8aXmYbFoo09e2
   gqXTzHjukrF8V0rw2TpaydvX//Ual1sW4ZUm4SG8mhzI3mlSgi/h/TT3y
   AtfLGJP8Bb7xnRojvbRpyRhwrLmD3laMo6eRYDg37zEnujXVJ8x1qg0/3
   SuihB6fdUi3ZXER7Aj9HNqf6CmBip8L+dCDUaXpThELPPzPIEZJ0QfUe1
   edbM/clgaZSCz3pU1wK7deyCWJWpg7KbFHvZx1ymT6ASU5ng4i+DaOcxG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397701161"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="397701161"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 21:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="844183923"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="844183923"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 21:38:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 21:38:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 21:38:51 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 21:38:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcl29m93pyT9y8eXOH0XBAD0X4xDjOZmJ2SnI257HBAh0KQzfn0QgMLvdcYmjNkL1zpRA4uh9ZndZw3vMcU+F7EA3DBse4yNXsEcmf1+TzrRRvooLR/Pz70UxZopgEr24k8p8WvPYnnvzLR96n5TEVsPSHb9zACoKdDCh/YMfxFKDO9xjFXGrtZSJrq3RTgVL/AJz9qEYfTvqRBWIOJXR5rJAremA83iRD4D44c/MVD60rtRsOUDr4x89q6ov+qQLbYk4SJokARs3d4xhLW4erExKRJz556sVKefaQbpYTOFiQcYkvgxXtC46qFsrU/j4nMXQZwEcfPdVnXys4MAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZSjjVv/SD5hkS7+vEvkYWvLN/lnC1wfmljA+P693UA=;
 b=dCcNO9HAn+D6vX9slaBrAxR79DWPyCZsIvbl4876uGZXDlMYD4bmnWMSy11sl49vIfORyBdZakiAjwOSAsdszVm4h5uFAXBCSGLPH68G+hlYyRrO6da+5/VJfIQKa6uCLvljlXfvqBWq0Z18MVmlYCNZe3Qrop7OxkM1UDn02lrwK92oZ0/EZekj9sbJfFU0+zaFrN7mTZGXVDllBkBcj1dpfkPFy/hbiPTmKhADrUfFaJ4/g2FZnDgWIFDDScCbfrj87mrIrf9XMMTS0JGk4bZy5Y6yLTM++ivdDNxwHw9hfgSZ6jlMS2wis+C9I6tZ65Kn5wfhs1JSGd6hqJn+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 05:38:43 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 05:38:43 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Thread-Topic: arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Thread-Index: AQHaLEN7KRkTj9CVWUuMZGoVJTAjVbCmtHXA
Date: Wed, 13 Dec 2023 05:38:43 +0000
Message-ID: <CY5PR11MB639215A2DC1FDD495C494D44FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312112243.5guklOnS-lkp@intel.com>
In-Reply-To: <202312112243.5guklOnS-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH3PR11MB7916:EE_
x-ms-office365-filtering-correlation-id: 031b829c-3f84-4af1-9771-08dbfb9dc4c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p3nuS21Wqe9FZrYT8h+N/D2NXFF+TDN7Fuf9SKWclcSS4XwLYr5AJYDtb5ZG3K2PRkr9Tj8Qp5MbQw1YVw0dMj5rd6SrCu/Sl9NgcQJgTe5HPhg5+cakOG4BT8gLCQMcArYJJOGLvzl8/r5wjjsJXN65ccsF31udE8MPGMkkQ1OkxHFcR+8ypNqnyo8eheX14ligSdigiyRmUilm1OrCTACxH4yQjs/GL+Vsm0kHtFfr4UL9nZV54Jh6Pae0gLgHg29pb5D8QkRkIRqMdEY41R+gS4CMFLG53AUoZ7tZdcY1K4N8KXqhG5xUk3Z/VasuROKrNbioWtMNf6uIWsK8zoMcPO0ToCELJ0MuQ9MB99mOxhtwfJtfv/TNtrSfT8lXAO6GpC6DU7cHeI497k4t7XYze2R7uqbongvMgn3VGzZgN+lH0UOJKV4DGlLXKriS+S/DgTj4D3gy6byIQ2T/ZgAJy5iXs49wdzvfWh5WgJGcCc5Q4Ovoht5RL4nOsciKtwjodFw57fj90zDIVEmWz2GKZoSS1nTYJ7rhUeAIoyKVXGgffUaDgCmMY3Qitni26AvzMIv5u9v2N2EAiL4my7SZ6y0K70yfuu57aVnoUfVZfNCaCDC2G8IDHPphqRcY1ZPuUQQQbwMKT/uuwrbksmaWP48lA4WJpR4ffZF2KE4PiGW/EUsnA3zASL6fqQW4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(53546011)(6506007)(9686003)(71200400001)(7696005)(64756008)(478600001)(966005)(110136005)(66556008)(316002)(76116006)(66946007)(66476007)(8676002)(66446008)(86362001)(52536014)(82960400001)(38100700002)(33656002)(55016003)(122000001)(8936002)(83380400001)(26005)(38070700009)(5660300002)(41300700001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cg2sGls2jX2nnCNK6aVnyIqhJ+7FHD+5Qavw7gafYUqmyaTJCfjSrA9uBwCF?=
 =?us-ascii?Q?nbvTOadSpIuzWoj2U/UFG1Yk6EYyMEJpM06ggdKc+7VfRLKvKPOrzNdztoQ0?=
 =?us-ascii?Q?Ah+2aloBnxQf4bDVXjj0R9G5N/5uolwFLdc0BBmb7eiLwXSYtXDdgbvMC6Wj?=
 =?us-ascii?Q?Vnoh1U343lnkyFofWSjUKq2hTWXOH3NU6ngTG1aC9ja0jCVEdUplVps1fivJ?=
 =?us-ascii?Q?12KO0JB774D6PpnlIJ+k/1j+LyjZgt7l7GcMQyksYCIPKnwllnkC4nXfwRFd?=
 =?us-ascii?Q?pOOFet8CNHHZ4dLHrfhZ2evpTnosZD3iDUOzfr+8k25jNct78USx3xoeaPg5?=
 =?us-ascii?Q?zGxua3pQNMj6LJVEvG43agE3IYwwlTXxTMXULlIVcxR05S5qV2AxFTZxcFfd?=
 =?us-ascii?Q?kmKLK0HQ6shJeNimaE29cdFQOaP5kn86P8GdaUx8fK1we39R6TIcyLNPKlQi?=
 =?us-ascii?Q?l/eLXH1ALaWxtGUs3zGtmSXC9wUy9H66EAIDvQSLrhwngTdoM8gPgl8Uecig?=
 =?us-ascii?Q?v/8hc81ZdJLemdLS3CE4kXcMyJ39y/v/VVtVrXf82HHkUMjDJN3gbVmeW1dk?=
 =?us-ascii?Q?YUvs+A1qAIhfOEYBq2WpeJmcRWSviM5Yc09wl8yj0ErewcfiY24zwuki6F1r?=
 =?us-ascii?Q?lW4uBBrop6LqKS9hf3q4gfcZJYV2CH7Bde2tgjZ9TsQSETgKuioBXIpVwP+v?=
 =?us-ascii?Q?/8EI6KgEl/VMDP5rwbimCXR/raaphepa3+U749cw7fLNQ0BTnjWO264Y1Xou?=
 =?us-ascii?Q?2p+k/Do7B+hZbvPReaDorHV+1R6s4KQV/e0nKLzus1uxF72Oe8AgnJXyKYom?=
 =?us-ascii?Q?zGFBALhsCiKP5P5kZQOBnZgShRKxCzHPsfnBkInLt6q26HGoV58VdxHd8B5m?=
 =?us-ascii?Q?YUsP720E1kOBfYQRdOeIAqCfFw89Bepd/sxbC0uUsJgZ8CLuuefwDk8iMpnF?=
 =?us-ascii?Q?mYZx3OGa9Uty5lMFWy+fRqTrNQZN8jF8i2cBOQ6hoYAx/Q4pU/htXApnHgRY?=
 =?us-ascii?Q?f9HKvFauxDJw+auYxysdgOtg+1uY42IMT0y+hu9viCgL0VdNPLjsMcvc31m3?=
 =?us-ascii?Q?FwGFB5hDi+TgOWd8w5CrRafKzEMpqOTempmeYjezMU3hK72sB++xHpdJX9lW?=
 =?us-ascii?Q?Qn2TYB2CUFTv7if3PiaBvBMCo703X7YCq0GoZy+HVZR+CzB5hWu4dOq6OwUU?=
 =?us-ascii?Q?6QVCSPyVOi9gYlEITv8Lx7aCdzbaDhQFY5lQAtcTp/zGGNmIe1r++z5Yh++f?=
 =?us-ascii?Q?Ay1uCcrcqqd/EdUU0ThNuRkDiUalCLEWrTF9dz97hCbVZ5xHYS5PXXpoBtBT?=
 =?us-ascii?Q?+pEouZULZPvAR9BsORHLBVzswY7K2MWJnjRmSJrwjtTtFR5fOGyXEXPzk9iU?=
 =?us-ascii?Q?IxecEAAMF3ixUOiB1qhDVCX0hb9JgM56GRwVczRMn5rFDmxGMbGtuOqy1E9B?=
 =?us-ascii?Q?civCZaEsEk564Y5GiuTf3fUPr8gpJmsLdFMIAX8aaVRULbUz7EFa8X3RVcii?=
 =?us-ascii?Q?xzdNDImRJxUC4fNkklRgu7uzgrJZJTiSxJ5gPdvc2m6y1HVMnxlO+eXQIt0W?=
 =?us-ascii?Q?gyQhFagdx/FE1FO51RCfGX/qvBs9zMYs5iQ1U+Hc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 031b829c-3f84-4af1-9771-08dbfb9dc4c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 05:38:43.2368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KMAFlsmsQQmVkz06ZFeffx16OKnNl5H+Z/uGkPIwwF9fCF1+UR3cQWZp0u7J2t/alWrY/1O5AzTFgiVvIPRkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com

not_report

This is a sparse patch, not the root cause of the warning in watchdog drive=
r.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, December 11, 2023 23:04
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse: inco=
rrect type in argument 1 (different base types)

::::::=20
:::::: Manual check reason: "only include/linux/compiler_types.h file chang=
ed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines =
by functionality
date:   3 years, 4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 4 months ago
config: sh-randconfig-r111-20231117 (https://download.01.org/0day-ci/archiv=
e/20231211/202312112243.5guklOnS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312112243.5=
guklOnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312112243.5guklOnS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/shwdt.c: note: in included file:
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const v=
olatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:135:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:135:9: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:135:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const v=
olatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   drivers/watchdog/shwdt.c: note: in included file (through arch/sh/includ=
e/asm/watchdog.h):
>> arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse:     got unsigned i=
nt
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse:     got unsigned in=
t
   drivers/watchdog/shwdt.c: note: in included file:
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const v=
olatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:145:16: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:145:16: sparse:     expected void const v=
olatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:145:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:157:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:157:9: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:157:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:135:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:135:9: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:135:9: sparse:     got unsigned int

vim +44 arch/sh/include/cpu-sh2/cpu/watchdog.h

^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  33 =20
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  34  /**
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  35   * 	sh_wdt_read_rstcsr - Read from Reset Control/Status Register
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  36   *
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  37   *	Reads back the RSTCSR value.
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  38   */
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  39  static inline __u8 sh_wdt_read_rstcsr(void)
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  40  {
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  41  	/*
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  42  	 * Same read/write brain-damage as for WTCNT here..
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  43  	 */
9d56dd3b083a3b arch/sh/include/cpu-sh2/cpu/watchdog.h Paul Mundt     2010-0=
1-26 @44  	return __raw_readb(RSTCSR_R);
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  45  }
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-0=
4-16  46 =20

:::::: The code at line 44 was first introduced by commit
:::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __=
raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

