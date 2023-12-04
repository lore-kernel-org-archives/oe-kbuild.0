Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BF642
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4M1Yo7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657711; x=1733193711;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Mdhmzk77xDGxz61/un643bXQufUearyZgm6EuhlVbZM=;
  b=f4M1Yo7n2ShPwSR83ky6WOLSomVw7Lexc3iTctfxsZiDj+6BJU1O4UBu
   EVjM2hCzA4kV7qGZ7nHNoX71Kydi+076F1nM0r3ckvglUOknsY1BIcG3p
   rxTvaudKyzJBVdkMclpuKiFUM3n0j7Gqv9aamjrlh9A42ufttlqS90wl2
   6YBU7hrk63fYGmRv4FRgNlUKDbdFHUXdxp4zIHtIieprcwfFT1FHaro/7
   Ll2bzJI2/HUcJthLqY3YCECGvwH0ioUXhDiGppKky9RF2Onv03gjNi+sE
   YPDC0pnW4LYm88PMcVRtypfMdectTWDMYBrNJFNBOF/zQHzftcH9vq1ol
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="12392866"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="12392866"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804755209"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="804755209"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:41:49 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:41:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:41:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:41:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flh9Je5oGrsquQiZTRtr9qdXLzRbHWRpuANMdV0nLxRPecfgi7kDRHv8fpAA79eT5Po/6pPwqihIgK1QLLO1uKoHx9r9lkcszFNnqgFet0L1yf7uC5/MdSbO0qtM+U8HyiBFsxSBaMBrxgJ8INYbCExrU0SpLi9O/+pZA2b4XoY8la/4Rj/sQ81XiY4O/Elv9L/ZeVGR8Z/wBdmuRL1ePfnNHVHeY+IQ3xbhBpM+yWKqGHlTCDCMPfw/YlE2vhPags1KjoEns0y5lo1NeK5vR13LzavB+cmKXWSQ7B0lJ8BExcYg+DW+c+iHQCpDg4lMBdNAoECHVFmiyiq4RUnxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SbFatvXh3XH1zgg/xEb4COXRYusPydT4ilfN1RaH08=;
 b=bXUGa/XuR/F8Om5W+wWWr2OhZ+3N3VLnlCWiUXjElHWiIpSFXZARmlKOrOsw4JddZl5k0hlKNp+ga4Jc2soj5nhsVupRTpZjUM7EYD0xgDHSPZ3khSJhlUJz58ot5yebcuuWQPO6VgAshbfF+RLcQNxmudhMSZ8tnOJngumAE39GRdyjAKjj/76pRnqKpDN4P3mZfVgi6fnCyqVoBMq4hBD3o3ax4zzD7F9dF+MxY4Mvt6ku8G8WOylSrioapzFUkRyWW/qzQdsU4t7X4EgiNxvUlKUxOATpVrnA9IgO0MjWglBMGaPPwtO1oiC/yMopIuqQz08t8YAutT2FexJ9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:41:45 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:41:45 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Thread-Topic: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Thread-Index: AQHaJBS2R49M9ijfDkGCYFu/qSUiJbCYbnPw
Date: Mon, 4 Dec 2023 02:41:45 +0000
Message-ID: <CY5PR11MB63927BF386C44C5637EFAAF1FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312011232.UTLgLmow-lkp@intel.com>
In-Reply-To: <202312011232.UTLgLmow-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: ff4b5d30-8d3c-4169-c19b-08dbf4728e52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cFFTvNRgLHdJiZLpnXmP2K20c5bDNZesSNS6HAlu7hH/k3gJv5ZKcKlRObVW93uguLkGHciAiPiB6SyKRnKYSyMHKh2z15X400mI0iqfZwPSII+lfVivb9WP07jA/kzJLf1FcnpIuMdl02Drw2azgd+ugof8y+g1ew1J4HA2qtFcgCs+twmcLr4xD9ILSgKISj2qm11YZz+UkNO5GGHlYl3OQrNkKwQ5effwI+BjiugKcLAaSQq7a7jUuvB6OhXN03xNKhAfuKIIq6DGf71gds6UxY00Jki/QtYPdrv9oTc45kHrH+Ol3RDrTQG42vRK2p78bliw8+zEDQjJs+dGn32QY4F9/Cq9VHt8f2FsITlVB0svqlOe3RTK6vsUQPPPDWTifH7616WGgadljdpqsoH+Y/WIvz6Uk/obbl9IH57n6xk5DV0fyYQxB91uFPGrShHD1lo0Ay+nhKf5bmWMe1xol9zfhic9i9NVKQX/LZ+FB2uzXys02Y1hqsjE3L5+cOUVpDWhkADwMz0HMCwjPovHBkpnPS9uvhSdt0iSldOZv4gvxOpRM7lzmMiDQX5B8dzYoIiGvxt/lcZmtNU7DaMbe8ptw7IxK4+gKnDI+5alVw9crXQI42yMwJ97rWjR7xmNN20nxx8AQAMN0W/uGLOqdGFr5B6XeVWG8CABNw9Tfs1MGcUg3pfJg1t/6OP2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(30864003)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K7w7inr0YXInGOoY/9So21/6yr1als3AtlX5ve4jyW+sYeoITu22aS8teCel?=
 =?us-ascii?Q?2BSgIlWNT6S3EsnQlPbdVtJWZvMM6pZ/hwwfnYU6p7aHdPy2hGBIDjoWGkDr?=
 =?us-ascii?Q?XZwO4PCnR5CFaLYF2B2ZhpTPe1WrByHFLGQLL68q6dSGORwuYttJUBaI+t/z?=
 =?us-ascii?Q?uvEhqqN/6wTmoAZrTL77MxZgGtjGhO/wbf2Xvk9+Tnefr7ThI16mea7jGOqF?=
 =?us-ascii?Q?Fj1vGIRed+X+SY5mbCR1ShIaqyjx0DpOhLon5gpdnj9StHPgu4GhnWoq1iDJ?=
 =?us-ascii?Q?ljcnwlUSgmXt0493L6/ABV/7Oh9LsN7fOk7kjDXUmjudnEV88Mmv/zIdgW4R?=
 =?us-ascii?Q?sOwcYVfqQXWIaVFwi6+xgtZjAAMZ9QEIvK87h2L/JXsku1WkldNafu8NyDZF?=
 =?us-ascii?Q?Fx4KH0pY7UU403+lV9HnfQcyxZ4+Jtzol3Cx+rgixrkdVU50vLeeqjhNUzhM?=
 =?us-ascii?Q?JnID6k3XdrkkexAo7RtkmW+lohIypTca4VKQvlAhi5zI10cT3J7EBQwtMuM5?=
 =?us-ascii?Q?nbXBmSbL5zMGPHMfHzP448WygYUcYOPP1XWhWn/npVhL4wGTYRx333ZsK3p0?=
 =?us-ascii?Q?6dHd7IqnpXGa1JGh6Lm7vnYBRREivjMl4dEpSHxV4jrzFj+Pg788GiUb8Ycu?=
 =?us-ascii?Q?wTfBWkDEUaM5PH8J/LKRqgRImEFtLkqwOquLxLXFFubxk2tcB1IFSgFI/G1W?=
 =?us-ascii?Q?cMatqHW2DiTuumiI7/2Lc9S8r9/6V1oq+P12EZwfP/6bIOonarKa1kDV/5na?=
 =?us-ascii?Q?UTRVYcLBOAftZb021tV6NCWa/iGM9fK35huuydVsf9yYlETm8PRbiBDNW+tD?=
 =?us-ascii?Q?fg9UIWtDl1GMhitYsLZ1B5BkUUlY/x2rDCJ0Oz4Ni721xjmmiJHvBcepa9zb?=
 =?us-ascii?Q?FtRAslw/sxVXq3p1yYntPPEwfJzwqOTMZjmNXSKinuVq8WBxGzhJkYaAXCCV?=
 =?us-ascii?Q?xZqoC+OCpf8fK0ckL1R8W282XrKfFeg22JWZgyezNDjo53ZwSfOBI4+c5+hP?=
 =?us-ascii?Q?t74tVjWrE5S3hk98NTmi+AHL9uawouVuAnmOFZSOo1oIIPNKhTFUH3ywiX1c?=
 =?us-ascii?Q?Zuphj9Q+NlFmdVhKyxbPrwdB7A7AHoEd0+me9zU/3/AE/LfvELvwW5WDX7DZ?=
 =?us-ascii?Q?+zmZABFPa54YOq9cAnAWGTA7m4sHauVrkAMqtwxASUhrRL0lG6JcLAKFWwZA?=
 =?us-ascii?Q?jSRiOFg8bcNwny+KBaSW2lBanfMFU1HIfHHDVz48sxSigAs61YtJ1RAF2bGB?=
 =?us-ascii?Q?gMqONTda6V6IyI17VvclIqWv+nutd85Xhq+4iVVQeCvf7mvVvr3TnPN/46C2?=
 =?us-ascii?Q?51E2lWkDWfSqFZB581uuk016kn6LXiC1MvRR5WNMsCxB1zjI92+0KfK0qtCi?=
 =?us-ascii?Q?m2lbcHdWTAXl4Z6cECqXZn5Q96y3usjlfHvs/gNuOAZ7CY/j6Ifi7nauY51p?=
 =?us-ascii?Q?JApj2nAb7jg1eV4EEDjv5r/B0wACrUFMynRszwB8ApFvj3INWLx7QZWaMBKV?=
 =?us-ascii?Q?Inap+YrzmUz30pULVjltyIR9cUavyNB3ehoZ9g/Eqp1/LVYkTCikWKlQ6pIo?=
 =?us-ascii?Q?qB41uTOHw+e8x8vELamGvXd+FhvhJJ7n3vi+NNiU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4b5d30-8d3c-4169-c19b-08dbf4728e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:41:45.3800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7E2oWs3MMim7mW/eQ09bp4s+5VUmJUbPppbEZhfT1hRdP85m+8oJDtVtWxftcHMKsHp3h1Fbm3zPef0U9lVn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

only Makefile change

arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

No relation with the sparse warning in kernel/unwind/sframe.c

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 13:08
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse: spar=
se: incorrect type in assignment (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git =
sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: ec004e900e02c9c85cf8c89d4c26d4168a6c5d18 [10/10] unwind/x86/64: Add=
 HAVE_USER_UNWIND_SFRAME
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-121-20231111 (https://download.01.org/0day-ci/arc=
hive/20231201/202312011232.UTLgLmow-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231201/202312011232.UTLgLmow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011232.UTLgLmow-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/sframe.c:94:15: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@     expected struct sframe_fde [noderef] _=
_user *first @@     got void * @@
   kernel/unwind/sframe.c:94:15: sparse:     expected struct sframe_fde [no=
deref] __user *first
   kernel/unwind/sframe.c:94:15: sparse:     got void *
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const volatile [noderef]=
 __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:98:21: sparse:     expected void const volatile [=
noderef] __user *ptr
   kernel/unwind/sframe.c:98:21: sparse:     got signed int [usertype] *
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space=
 '__user' of expression
>> kernel/unwind/sframe.c:134:11: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected void [noderef] __user *f @@ =
    got void * @@
   kernel/unwind/sframe.c:134:11: sparse:     expected void [noderef] __use=
r *f
   kernel/unwind/sframe.c:134:11: sparse:     got void *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned char [usertype] =
*
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned short [usertype]=
 *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:151:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:151:17: sparse:     got unsigned char [usertype] =
*
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:151:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:151:17: sparse:     got unsigned short [usertype]=
 *
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:151:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:151:17: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const volatile [noderef]=
 __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:168:9: sparse:     expected void const volatile [=
noderef] __user *ptr
   kernel/unwind/sframe.c:168:9: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const volatile [noderef]=
 __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:168:9: sparse:     expected void const volatile [=
noderef] __user *ptr
   kernel/unwind/sframe.c:168:9: sparse:     got unsigned short [usertype] =
*
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const volatile [noderef]=
 __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:168:9: sparse:     expected void const volatile [=
noderef] __user *ptr
   kernel/unwind/sframe.c:168:9: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space=
 '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
>> kernel/unwind/sframe.c:175:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed char [usertype] * @@
   kernel/unwind/sframe.c:175:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:175:17: sparse:     got signed char [usertype] *
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed short [usertype] * @@
   kernel/unwind/sframe.c:175:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:175:17: sparse:     got signed short [usertype] *
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:175:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:175:17: sparse:     got signed int [usertype] *
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed char [usertype] * @@
   kernel/unwind/sframe.c:181:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:181:17: sparse:     got signed char [usertype] *
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed short [usertype] * @@
   kernel/unwind/sframe.c:181:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:181:17: sparse:     got signed short [usertype] *
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:181:17: sparse:     expected void const volatile =
[noderef] __user *ptr
   kernel/unwind/sframe.c:181:17: sparse:     got signed int [usertype] *
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:181:17: sparse: sparse: cast removes address spac=
e '__user' of expression
   kernel/unwind/sframe.c:303:36: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void const [noderef] __user =
*from @@     got void * @@
   kernel/unwind/sframe.c:303:36: sparse:     expected void const [noderef]=
 __user *from
   kernel/unwind/sframe.c:303:36: sparse:     got void *
   kernel/unwind/sframe.c:308:35: sparse: sparse: dubious: !x & y

vim +94 kernel/unwind/sframe.c

09460e60dd1c2f Josh Poimboeuf 2023-11-08   85 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08   86  static int find_fde(struct s=
frame_section *sec, unsigned long ip,
09460e60dd1c2f Josh Poimboeuf 2023-11-08   87  		    struct sframe_fde *fde=
)
09460e60dd1c2f Josh Poimboeuf 2023-11-08   88  {
09460e60dd1c2f Josh Poimboeuf 2023-11-08   89  	s32 func_off, ip_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08   90  	struct sframe_fde __user *f=
irst, *last, *mid, *found;
09460e60dd1c2f Josh Poimboeuf 2023-11-08   91 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08   92  	ip_off =3D ip - sec->sframe=
_addr;
09460e60dd1c2f Josh Poimboeuf 2023-11-08   93 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  @94  	first =3D (void *)sec->fdes=
_addr;
09460e60dd1c2f Josh Poimboeuf 2023-11-08   95  	last =3D first + sec->fdes_=
num;
09460e60dd1c2f Josh Poimboeuf 2023-11-08   96  	while (first <=3D last) {
09460e60dd1c2f Josh Poimboeuf 2023-11-08   97  		mid =3D first + ((last - f=
irst) / 2);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  @98  		if (get_user(func_off, (s3=
2 *)mid))
09460e60dd1c2f Josh Poimboeuf 2023-11-08   99  			return -EFAULT;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  100  		if (ip_off >=3D func_off) =
{
09460e60dd1c2f Josh Poimboeuf 2023-11-08  101  			found =3D mid;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  102  			first =3D mid + 1;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  103  		} else
09460e60dd1c2f Josh Poimboeuf 2023-11-08  104  			last =3D mid - 1;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  105  	}
09460e60dd1c2f Josh Poimboeuf 2023-11-08  106 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  107  	if (!found)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  108  		return -EINVAL;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  109 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  110  	if (copy_from_user(fde, fou=
nd, sizeof(*fde)))
09460e60dd1c2f Josh Poimboeuf 2023-11-08  111  		return -EFAULT;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  112 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  113  	return 0;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  114  }
09460e60dd1c2f Josh Poimboeuf 2023-11-08  115 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  116  static int find_fre(struct s=
frame_section *sec, struct sframe_fde *fde,
09460e60dd1c2f Josh Poimboeuf 2023-11-08  117  		    unsigned long ip, stru=
ct user_unwind_frame *frame)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  118  {
09460e60dd1c2f Josh Poimboeuf 2023-11-08  119  	unsigned char fde_type =3D =
SFRAME_FUNC_FDE_TYPE(fde->info);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  120  	unsigned char fre_type =3D =
SFRAME_FUNC_FRE_TYPE(fde->info);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  121  	s32 fre_ip_off, cfa_off, ra=
_off, fp_off, ip_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  122  	unsigned char offset_count,=
 offset_size;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  123  	unsigned char addr_size;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  124  	void __user *f, *last_f;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  125  	u8 fre_info;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  126  	int i;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  127 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  128  	addr_size =3D fre_type_to_s=
ize(fre_type);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  129  	if (!addr_size)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  130  		return -EINVAL;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  131 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  132  	ip_off =3D ip - sec->sframe=
_addr - fde->start_addr;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  133 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08 @134  	f =3D (void *)sec->fres_add=
r + fde->fres_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  135 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  136  	for (i =3D 0; i < fde->fres=
_num; i++) {
09460e60dd1c2f Josh Poimboeuf 2023-11-08  137 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08 @138  		SFRAME_GET_USER_UNSIGNED(f=
re_ip_off, f, addr_size);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  139 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  140  		if (fde_type =3D=3D SFRAME=
_FDE_TYPE_PCINC) {
09460e60dd1c2f Josh Poimboeuf 2023-11-08  141  			if (fre_ip_off > ip_off)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  142  				break;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  143  		} else {
09460e60dd1c2f Josh Poimboeuf 2023-11-08  144  			/* SFRAME_FDE_TYPE_PCMASK=
 */
09460e60dd1c2f Josh Poimboeuf 2023-11-08  145  #if 0 /* sframe v2 */
09460e60dd1c2f Josh Poimboeuf 2023-11-08  146  			if (ip_off % fde->rep_siz=
e < fre_ip_off)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  147  				break;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  148  #endif
09460e60dd1c2f Josh Poimboeuf 2023-11-08  149  		}
09460e60dd1c2f Josh Poimboeuf 2023-11-08  150 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  151  		SFRAME_GET_USER_UNSIGNED(f=
re_info, f, 1);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  152 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  153  		offset_count =3D SFRAME_FR=
E_OFFSET_COUNT(fre_info);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  154  		offset_size  =3D offset_si=
ze_enum_to_size(SFRAME_FRE_OFFSET_SIZE(fre_info));
09460e60dd1c2f Josh Poimboeuf 2023-11-08  155 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  156  		if (!offset_count || !offs=
et_size)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  157  			return -EINVAL;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  158 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  159  		last_f =3D f;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  160  		f +=3D offset_count * offs=
et_size;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  161  	}
09460e60dd1c2f Josh Poimboeuf 2023-11-08  162 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  163  	if (!last_f)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  164  		return -EINVAL;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  165 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  166  	f =3D last_f;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  167 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  168  	SFRAME_GET_USER_UNSIGNED(cf=
a_off, f, offset_size);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  169  	offset_count--;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  170 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  171  	ra_off =3D sec->ra_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  172  	if (!ra_off) {
09460e60dd1c2f Josh Poimboeuf 2023-11-08  173  		if (!offset_count--)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  174  			return -EINVAL;
09460e60dd1c2f Josh Poimboeuf 2023-11-08 @175  		SFRAME_GET_USER_SIGNED(ra_=
off, f, offset_size);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  176  	}
09460e60dd1c2f Josh Poimboeuf 2023-11-08  177 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  178  	fp_off =3D sec->fp_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  179  	if (!fp_off && offset_count=
) {
09460e60dd1c2f Josh Poimboeuf 2023-11-08  180  		offset_count--;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  181  		SFRAME_GET_USER_SIGNED(fp_=
off, f, offset_size);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  182  	}
09460e60dd1c2f Josh Poimboeuf 2023-11-08  183 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  184  	if (offset_count)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  185  		return -EINVAL;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  186 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  187  	frame->cfa_off =3D cfa_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  188  	frame->ra_off =3D ra_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  189  	frame->fp_off =3D fp_off;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  190  	frame->use_fp =3D SFRAME_FR=
E_CFA_BASE_REG_ID(fre_info) =3D=3D SFRAME_BASE_REG_FP;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  191 =20
09460e60dd1c2f Josh Poimboeuf 2023-11-08  192  	return 0;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  193  }
09460e60dd1c2f Josh Poimboeuf 2023-11-08  194 =20

:::::: The code at line 94 was first introduced by commit
:::::: 09460e60dd1c2f8ea1abb8d9188195db699ce76f unwind: Introduce SFrame us=
er space unwinding

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

