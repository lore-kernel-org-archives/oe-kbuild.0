Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EF6126
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNjX92U3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702445840; x=1733981840;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ecy6wx4jKJXRZLA9ZJyUiy0J3BZ54yqHE47A0Q/UBp0=;
  b=bNjX92U3kZY5d56z2vhd10ElssZc91/g+grZGYow3QomOS+hCkT32IRu
   Pl1aS7E4Tb/KWjmyuzcukwG9xU2RIpL0ensDe6HeZZCKrNzlxYsQ0Py3X
   s7jmwSsxSc2LmTDWBZVJCz0dZ0MnUu/29tKHNrb4PdBI5O958OOiFRVPx
   i4jrPdUE2fwmwy5ABuPbU6ichD0Pu+aDUaJ7Km34CrvWnpPUQCjQIfu6C
   qRxIjq9gMWY14BrtxdE8VsKwvCucKuGEqRV7p2y1Wr3bvD2CFFD4WSQTe
   ErV/C1dBCYBZOXLC0nbHUkROrlk2tAgCofZCAtBxCdA0aJ1dvXhQVHsKO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2088750"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2088750"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 21:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839725553"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="839725553"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 21:37:18 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 21:37:17 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 21:37:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 21:37:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 21:37:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/4wOwCzRiOfdzvBVKr5TIBzLiJDbJbwhnCwX+PkDBRapmYj4fSYTRVnIQJbCmZKNN5Dk7y9cNXZIaUE2HSMvwcVwpW/2fw1POd1QCvgZPD/pbiiPwhRkHIlDJxOnHZ6oE5sAiq4BcOcfnhOd/ZDC+wvXV+pVxwSxAlWu/oxpkCZvJNGw9KB+/XFYcCjBo5qQK3wcuDzkCZvGDK2RvrGohyr8Z3HrF5c/ETg1ha6SGit4pLssSs87a+QUaIIpi4ta2lRCgINWKEvQnoKYllMcBPN0U05IO0Whq9kZYvywpKDrxbHbup6ibc7CWh5JwFtkW+Q/BS0Qd8E/0OSowhGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iw3Yin7CcQ95L3+nqddE/ZGsKIlRANZMC4OU/HKdU9g=;
 b=Y+8oNv5Diwhd4RJj79wMmcxRRK/JtRzyNVt69WNtB3ANHrGtetT3j8rGJYRMbtnOdhkTsTBBcG9pYfkUHZshNL2SaFG2O2gc8K3N5zAC2S9naxERrj+54IyEo0OR3CbqpWsuEwVFd1B8+ngKzRaB/4pdzhDV92W/YQiNMjVMP/io8xc0APtWKy/xgtp/DiSNaYaKyUvMckT3DFN1zbUfTLSkfcce3CW4BceAu3fBNhBABqfXumyqK4v3fkhhvrXt++E9naTwr/XAF/mCz6JpiXdVL7yxxfbwLHoWTOrLR6sU7gI5NoNEV5ShTbdAHC5ELmn8byPTIYygbIaMcfybmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 05:37:09 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 05:37:09 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/spi/spi-lp8841-rtc.c:112:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Thread-Topic: drivers/spi/spi-lp8841-rtc.c:112:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Thread-Index: AQHaLU94AHXfp22U2UywHR6bBa+ZxLCmsf0Q
Date: Wed, 13 Dec 2023 05:37:08 +0000
Message-ID: <CY5PR11MB639246853F66C64B12B41A3BFB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312130623.js52lhbp-lkp@intel.com>
In-Reply-To: <202312130623.js52lhbp-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH3PR11MB7916:EE_
x-ms-office365-filtering-correlation-id: 21d9f276-0d86-4930-4fa3-08dbfb9d8c93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IuEzUYTlVNqCOqpR27KT6GfOd6ppjqv/nQmasj+jgP5DXiSBOi/qLHYjMqZ9jbudhp9mvtZDN8IAI1Y6GsP5hgUH6d7rH7G7m5qeTZ+WlXOxQ7VXw9gQkDsi+KEHdeoTjyjx81X690SUWZOVzdpT+VojwmKjFzWKsp/j02RyXW2aKwSwB7u7t6FoirjDHBcGao/wxp9OHihgiajadUPWj6vtlbislCGv/CgiuKbmzTLSwPfgarv0flp765WiBFStNM3k3BQ1mwXk1Jg1Q3KBwjXzIWAYKWZIW4GtpgHMC0IcOtm8fu3XSlk211X+GMqASAAhB5NbS8UFmBHYKD0nqLHj10iE34imixRGK04VUOkXoRoK6z6bGBFaLn3YAMnHTPZb8fAatW+FNqDmnYUXwcmZvPyki6Nd/drgZC+D2MW36zIY16Xh90VEaze85pYn42/Hj/pnV6N3YiL4nY/Vi2VTndjRvR8KGYp4bDwE3pRVU3buXKbKqwD5bLHutU4xQAU0LDl92vC9N63bx+EUTM/xoi46yamadcpKEmNMFue/yMnFAk7uc/FqBTum7vQg0gmgYslCHD6sijFjAlVLy45tPHDRlHwqlOKOJfDscLanCft8hT+glcxtD8279hd6F7l4Shs+UZATeY8is1DKr2UTMpm+zATZa1mLm+Y0MmwJVtmZKplmK7FZLpOz26Gt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(53546011)(6506007)(9686003)(71200400001)(7696005)(64756008)(478600001)(966005)(110136005)(66556008)(316002)(76116006)(66946007)(66476007)(8676002)(66446008)(86362001)(52536014)(82960400001)(38100700002)(33656002)(55016003)(122000001)(8936002)(83380400001)(26005)(38070700009)(5660300002)(41300700001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5bi/nDMfv34JyeW5H3FEl86/miCNiF1y0aHvubZ098AXK6JL73Lea6bw3hAe?=
 =?us-ascii?Q?oSiRtWJY78q6LRLlTvj0TMKnoLBp8mMlXRVwinpHb6Y2z4v6yWYk3KSqLEIz?=
 =?us-ascii?Q?Q7/m/iNAldwK5C1IC76ftWBPkq5xswGTlMTIMkrRg6/mm0tNrAeRhrncFF+o?=
 =?us-ascii?Q?qNdgaYyxZdBBzz/dB0AksOvAhQjapdzUvGSuHm56nQ9yfDRFHOwnxrES2Q1f?=
 =?us-ascii?Q?TbHBv1VBgSE0T1KXIoDOlvVPsAi9T8Ez0tHIuny0ifBUv4day/RlKUbxq2I3?=
 =?us-ascii?Q?+UIacjJiWHfRqfSk+V232A/E8lv5C4X9KMP8WBrUD2vNE1QupjU1VHw43AG3?=
 =?us-ascii?Q?dKf9nPDeDIV3SePEFf/Ut6onvOhhw4Hvxu92ZBGYKrhDytEEtKoCIz4DtUx4?=
 =?us-ascii?Q?f62QiuyiAubLatk/xBKxOtNVyDjvuh5nDenCzd5zjRUdaeLojz7wagLB64lN?=
 =?us-ascii?Q?c2e+fowSEjjJNbWUiK3yuJGWQIzE9pokx4pAA2tYLyD9xl91YXVtqdTGoLFP?=
 =?us-ascii?Q?EjZTxMpDaEcyrkRo7EOE2JTsgXLm1AtaF9JBTBHeFLtQbOgtGVBDbOpJllhQ?=
 =?us-ascii?Q?8mrsjFJWK//oZ1/dFwAP/VyylIIOPA/7wEbUfzBXyQOpAuVpyB87/xwUDoMT?=
 =?us-ascii?Q?1IuQaxqFNpI6MHHaF9dKtH3YevGo7qtc6YqHsfIoMVfzSauTJthOo8vjnZ4V?=
 =?us-ascii?Q?OpJkSEuOIEkgd1M1QlJDvm5DJExESaYW9n3208iVFfUkoi+FwEkO8X1Uf561?=
 =?us-ascii?Q?EFE33NDbRh+RgkwESuDBy6TWBfynHcqn/5hfYUVunF98+3u0STB1kwsizzQg?=
 =?us-ascii?Q?B4Y9E2YTinn4+nwNjTokq29qYdjoEj/HPshURB8YXzuC7LH27oDyhWRfVDEW?=
 =?us-ascii?Q?uYFr8cNsV9xo5+/cE+BiOcpbQrR/KTn0+XFCqQbV2BrogPWcb6JSh0wOhZp4?=
 =?us-ascii?Q?ZHIUZ8hEaHmswp/8WwsmuzaaulEDrH56OTFZiXzti3uAwFNc0R7U/0O2laTm?=
 =?us-ascii?Q?i4J6WLB2103Wcehr+bYALC0hpgocPKApGCZnr0qIBfzEnfuGOj8DAPAyhEIi?=
 =?us-ascii?Q?SyVM+xYU5A+S4jMBJG9sldV4VlQAZJFrnhx8WERzxWY9r6I1XAY3n2qLYm+T?=
 =?us-ascii?Q?HBatwp+jYvLX9AqdoHlYpriQudeSqQQrOXL5QoerybTZSxIxiuSqC9fOL6kH?=
 =?us-ascii?Q?7jIRIIrDfiJdQwROCTLR0QqVgVc+CqP7HHn7m2VxijUofQom5pQydty09m78?=
 =?us-ascii?Q?Mwi4iSn/SBlHpPjbCUXAyP3eUH57wclRVkczHL3uGwKOkejDJ4X4p/qNYzjp?=
 =?us-ascii?Q?Qo/+HNjLVpjUhqqfx6ry7cN8VnDo3uPwpxTZM9gftny/SfzSpQWvW8lxLNGk?=
 =?us-ascii?Q?d8Iq790LbtdcKavgHfzm1MV9pj6DZLFA+dEtddgGGNmwyy5+7akl/E4xX4xA?=
 =?us-ascii?Q?Up6qqQFtPX6osh/QXzdtzBGBteqw7LVN4JlBaxa5qoHlt5rM6Uk2BP3jLC4v?=
 =?us-ascii?Q?LQ6FAUx4VHLi9eJ0bcxau47Ni9wSsH5kqOg0MBM5A4s2W5HsT37jnlzoFbFD?=
 =?us-ascii?Q?8W6vt9Yp4Tvi4Hf3gnHrHa6yu3kPxD78kMsm1cPM?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d9f276-0d86-4930-4fa3-08dbfb9d8c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 05:37:08.9518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOZCWSPhZ/aYQTWk9t39U8BW+Gm8xdvz4ZAhX4P++0pqlpyMNuMDc124GdVkG3vuYvquRNUW0ge/q3hc7x0gBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com

not_report

This is a sparse patch, not the root cause of in a spi driver code "drivers=
/spi/spi-lp8841-rtc.c"

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, December 13, 2023 07:01
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/spi/spi-lp8841-rtc.c:112:17: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces)

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
head:   cf52eed70e555e864120cfaf280e979e2a035c66
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines =
by functionality
date:   3 years, 4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 years, 4 months ago
config: sh-randconfig-r133-20231118 (https://download.01.org/0day-ci/archiv=
e/20231213/202312130623.js52lhbp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130623.j=
s52lhbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312130623.js52lhbp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-lp8841-rtc.c:112:17: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:112:17: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:112:17: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:121:17: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:121:17: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:121:17: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:143:9: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:143:9: sparse:     expected void const vola=
tile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:143:9: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:147:17: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:147:17: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:147:17: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:209:21: sparse: sparse: incorrect type in a=
ssignment (different address spaces) @@     expected void *iomem @@     got=
 void [noderef] __iomem * @@
   drivers/spi/spi-lp8841-rtc.c:209:21: sparse:     expected void *iomem
   drivers/spi/spi-lp8841-rtc.c:209:21: sparse:     got void [noderef] __io=
mem *
   drivers/spi/spi-lp8841-rtc.c:57:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:57:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:57:9: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:63:28: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void [noderef] __iomem =
* @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:63:28: sparse:     expected void [noderef] =
__iomem *
   drivers/spi/spi-lp8841-rtc.c:63:28: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:57:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:57:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:57:9: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:63:28: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void [noderef] __iomem =
* @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:63:28: sparse:     expected void [noderef] =
__iomem *
   drivers/spi/spi-lp8841-rtc.c:63:28: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *ptr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   drivers/spi/spi-lp8841-rtc.c:47:9: sparse:     got void *iomem

vim +112 drivers/spi/spi-lp8841-rtc.c

7ecbfff6711fb3 Sergei Ianovich 2016-02-23   97 =20
7ecbfff6711fb3 Sergei Ianovich 2016-02-23   98  static int
7ecbfff6711fb3 Sergei Ianovich 2016-02-23   99  spi_lp8841_rtc_transfer_one=
(struct spi_master *master,
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  100  			    struct spi_device *s=
pi,
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  101  			    struct spi_transfer =
*t)
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  102  {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  103  	struct spi_lp8841_rtc	*dat=
a =3D spi_master_get_devdata(master);
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  104  	unsigned		count =3D t->len=
;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  105  	const u8		*tx =3D t->tx_bu=
f;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  106  	u8			*rx =3D t->rx_buf;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  107  	u8			word =3D 0;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  108  	int			ret =3D 0;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  109 =20
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  110  	if (tx) {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  111  		data->state &=3D ~SPI_LP8=
841_RTC_nWE;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23 @112  		writeb(data->state, data-=
>iomem);
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  113  		while (likely(count > 0))=
 {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  114  			word =3D *tx++;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  115  			bitbang_txrx_be_cpha0_ls=
b(data, 1, 0,
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  116  					SPI_MASTER_NO_RX, word=
, 8);
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  117  			count--;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  118  		}
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  119  	} else if (rx) {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  120  		data->state |=3D SPI_LP88=
41_RTC_nWE;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  121  		writeb(data->state, data-=
>iomem);
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  122  		while (likely(count > 0))=
 {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  123  			word =3D bitbang_txrx_be=
_cpha0_lsb(data, 1, 0,
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  124  					SPI_MASTER_NO_TX, word=
, 8);
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  125  			*rx++ =3D word;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  126  			count--;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  127  		}
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  128  	} else {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  129  		ret =3D -EINVAL;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  130  	}
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  131 =20
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  132  	spi_finalize_current_trans=
fer(master);
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  133 =20
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  134  	return ret;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  135  }
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  136 =20

:::::: The code at line 112 was first introduced by commit
:::::: 7ecbfff6711fb331591003ac32c002ce55a0758f spi: master driver to enabl=
e RTC on ICPDAS LP-8841

:::::: TO: Sergei Ianovich <ynvich@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

