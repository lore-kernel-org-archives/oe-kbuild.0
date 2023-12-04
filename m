Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE3814
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAn7j/jJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657581; x=1733193581;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BewDCDRfGvhXkVoIOS8Xlve6zVsvJSyU8lj4qlNBLAM=;
  b=UAn7j/jJBEH8Q95v+DF3/xa0OiChw663HyIdq5uTeeCGZq0KNU9bSSz0
   H+U5V5XPjVJ/Ga1GofsDNWQG9s3uDh+W+K3BD0T1IH9yEsehOyRqB7Qoa
   uIqP4KJVEqB/lAqkTBwCXZFhFYB0ua5H/aCIc3jXS1Deg52ocYG7qxYP5
   PEL5J0CbB5cgnCSzZh860mCl9+GRnYHUvasNdL3XrdOBjDLv9+S4TQwBB
   2omN9kYVkzjajO/uTMrL7jUIhUSFUXZGSACYGcuOHY3UlzJnTsvswmZPk
   szVMPJQAK2NfTfrCcy+5zn/gcpnEXOzdt5bbKOKSIUEMZsEswcfd4R4IV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="734786"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="734786"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="893841349"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="893841349"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:39:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:39:38 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:39:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:39:37 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhjNB9+GhjLcj/ApoFnZWHpFS3J6TjliKYnRfflhG3Ef35g+s4MYdAuxuLvdpDyB2hlHVJYCvW18QuxlqRcMXquAQgtVisZqtWwhjyI6xnWkF5pZG2ueLDbnWPh7P9TSGRs+H61JNMiiw1Awzk4GI1VnSAqmzv5H1kym7JpGSOZXJRDNAiJOkDVW+X8GZFuGhDWNtDKaQufRCh1ccQxi20Zt+ftmoijIMxXBHbB9K8ZH4IhD8jtS8k5ydSDw3/BHH/+AaMjJETYOQsAaYbB5qRIDZq0IFNtmtRg5c/DRQBG69jWVqjWG1zXfq+a0kOsqu7A947+boSsaC9CKAvpvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Tr66E6T725WFNhRRgxhoi6+6/00nKm7VGFhR/jWM70=;
 b=KafcVIU9aquVgKqxR0OSh6jgxkdsqDwo+TX42MqT7nesujUUTL+Q3mvIW4FP6d3o5gq5iuc1qkwqwEeiVB3hsuteWABy8wk2SCEK8IRCjbVgkRyUKmvnmUJYPx/VN4OvULNShtFbsaQzvDvvgVSlMVVWfoXsQDWC1axf/9ypzb02pflFcmSkgOvbFs0qmH1YSutiOrwOJWOxzOOEF8T1nkT4tNAagY9QS+R+FFwtDMkWwHKW0SF2BRbqsdd6LVPSrjq+QKVxva92X+TftdcebW8plx95GLPBoB4/1+ZEPunxkvzSiWcPEDQYd3SglRPiK1YBFw83+bxFWl43uYC5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:39:35 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:39:35 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
Thread-Topic: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
Thread-Index: AQHaJD0zlef1dlH6UEC8TVrOBTLSdrCYbaIw
Date: Mon, 4 Dec 2023 02:39:35 +0000
Message-ID: <CY5PR11MB6392F995812A9A0348D92AADFB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312011721.RxlcXd9E-lkp@intel.com>
In-Reply-To: <202312011721.RxlcXd9E-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: 17b722c1-c670-45c7-42ff-08dbf472411b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R4BIV/N+Hle8xTQtI1Xdwws0dw97hkBC3engQOq2bHfEExqJdxr4H+2GZd7iSba6O3S99BpHv5zR5BSksxa7XBGhAqunoRZozPVM9fSFYMb8rz49P8HkAjVXExOeHeqBDCTnTUUJJmYC67ffUIq8JrNpwMcQGy/8Y4XL+cV7lt7//AEY83TU/ymi4cw99MmzJ/YhRZJiKmhykMDMbvoJva3OAcn0d0egmwOscyyMMAZXd1ucRmKNRc3ujdODcr9qIp7DXEY+gJCx4V7r2MUt4WpSdbp8JWAq9W9asKibip3dKKc2aB72EjS/hNnXtLUsazNWWFqg3donSSbkwkCvwPLvHZGvNx8pwbyye2q7VnVSUceKqrMo6n1el/Cd0CJdhQL5TU98moT+nW+gWpRmZFiW5OazjD9h9CzMFyrSUp1ZwRrosaE1ug76CqahJ1o6lSjNHwRfxTnV8hUzWJcTnEFN5KGyRPY106HPQt8cVc93CjwEwIg77Z4JsHMtBqcFi0dYMkhcWXytDLYLdghhVySG2dp9UIiLAlQWohBH1UJ/25HIGW72oPm2EFJ5iwvt3ZGFtPA+4osUbbAP1KSGOw3f0QO2rL1djIUM4GZ/t5XzxrT3j28X6ISo5QTmxeqY9QH6Bz8sDYUec91umCqEkkCu5zRFFSe0VBjnlHee7M3gFVNUp0euwEyG2x3BTqMhfP5GMMmSA+QY6oVmVNjR2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TbFebEKiDaI1q8x9EVeV7wgPSHaQsH+S/n8PGMvWCY12jDjriHieqhBYOhpX?=
 =?us-ascii?Q?NcJ/nqD2zJx7TdcHUjkrdDXwCWhCYQ6s2GgpYivwgbe4FB+qcgS5UsC/mcP+?=
 =?us-ascii?Q?O+DO4yG9Co/6BXcMt9eAG4GMw7R2+IcfFDkOx+k8cnt1CVmpOJMtm93aVaLJ?=
 =?us-ascii?Q?OB1DBjsgYqSkGQwqqEnJcVT3A1LX0CEB511vmFYWw8k4rDgGiI61mglsZwp6?=
 =?us-ascii?Q?e0XhE13XI9wz6LlF/I9iMTfptgLyIrd87W5xwUzTxQeeN40Jn2fWtB3H5Ouo?=
 =?us-ascii?Q?0gw5D/zHNzO7uWIPn/17FyWKpQHd3WQDSdvwg03yg+5nQv6dl5Ue/cSBIONq?=
 =?us-ascii?Q?qILUhxe13Ex26ksuw4TT0w64CRIe2d80NgUTbBjYkt8AQ9Mdk6XU9ZuUwsdh?=
 =?us-ascii?Q?u/G91kdSMLXPSMnDHvQYAvpzJ1Uh16UnWGYWwhP2ed1Nz2hJvgX7lrF5kekh?=
 =?us-ascii?Q?T3weYSeoKfrTVEhBCH2USwoZek/+eQwvmpZRW2oO35RLCTbu+JqTD/t/L+RC?=
 =?us-ascii?Q?8s/X3LjLaKyHm04Z5Ghdlok/aFTvK1B1l64941fESSn+5Qbs8vt9pa7I0ZSG?=
 =?us-ascii?Q?NZdfJQ/GqMCs50ZlMbBIVVLdICb+7SbToar8T3NRMbUpU7vPf3ocCWJ4thhM?=
 =?us-ascii?Q?ikMRMG2XvtjfWf3/yUrfslDjdm3tKsF3HVjvd1pQ16VWgpUj8WT0uqGYDC6K?=
 =?us-ascii?Q?F1fMaaYtLm99u/t52m2VBraG5vA3Gyp1iDfBtUGVKvL0IeTWTJ8Z5OS2BHOZ?=
 =?us-ascii?Q?urN8wwPXzpFbDXBP5mRIuPQ43YboL5w1n35kWTtOUJtCZ0MeBf4ml/WXdDwi?=
 =?us-ascii?Q?3pSZomjmHyLoyLjO0nzpVMJlKU/POw+kuP4bCvYgFCZZs82GIgsok3IjaNbO?=
 =?us-ascii?Q?DnVf4wvbX5Y70BX8deJHAf3Lm9BBKfAKCbxl5chawUy91u9+Ru/W4l5PK9dj?=
 =?us-ascii?Q?AVjK+XnDi7K58KHcr1YXapNNc2fYJRlqV3pMlMIrD01GWf7jNqsgLcBp7203?=
 =?us-ascii?Q?oFiQ1Kuxk2en7Iiqi6DJU7QnUujdNEkawrcMH2HOsXJK9HLfYsExZP0cH4Lj?=
 =?us-ascii?Q?U0WI2HkJt9rb//4fMUsEqxCqctZQCDvKyMBzUCAsBxu9rxVYztUCgujEDlis?=
 =?us-ascii?Q?ywCGgikJReu3BM08scYZep3vXnANzSGvyDMmqyymhL/ymBELNl8ZVA22aedy?=
 =?us-ascii?Q?9hNpbiBExpLRhrEymceuVyvXxn7lmh9z/C+4tjMlPCrMZqW4s7MYbyrp9SVT?=
 =?us-ascii?Q?PSPVnZANxCMpHJyiRjGbv0nB9/BLfNe29sHRAOLqSqigfqnna0m1EMCq5Hss?=
 =?us-ascii?Q?HNqj0ZG7K0/EzVSuts10mB/2z2mn2OvvMvKhaCt7UNlUQqZPGALHBjxHLFiw?=
 =?us-ascii?Q?IR1WjuF4qVu9iRlu9TyTD6H4n+YdgW2s2s+McpPj/f7ulJbdmqRvs5l8tpdB?=
 =?us-ascii?Q?TBTg/Yfp8eqzbJa0fGOjqppyoTkQCcCVFB5OKGDAreVL48rQEjIwAC1gqo1r?=
 =?us-ascii?Q?tryF5E+Oz68bIXTXI803oenEm0PCe0JDzqKk+KZw9JvGAlUDP0BlUxdJnl6u?=
 =?us-ascii?Q?1t+yaUV97GnA69xnM96a4sLu4rjuLCHi901yfEx8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b722c1-c670-45c7-42ff-08dbf472411b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:39:35.8714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yp0ymOMyIiqZLzR0URWaLkSLc70jTSbSkLXl8nvOaAJhK2BBTYgiZNiqVIA63cJjRrbhQGvHJHpeFVzEeYqQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

guarded by macros.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 17:57
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH] riscv: Avoid code duplication with generic bitops impl=
ementation

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231112094421.4014931-1-xiao.w.wang@intel.com>
References: <20231112094421.4014931-1-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: arnd@arndb.de
CC: geert@linux-m68k.org
CC: haicheng.li@intel.com
CC: linux-arch@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc3 next-20231201]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Avoi=
d-code-duplication-with-generic-bitops-implementation/20231112-173655
base:   linus/master
patch link:    https://lore.kernel.org/r/20231112094421.4014931-1-xiao.w.wa=
ng%40intel.com
patch subject: [PATCH] riscv: Avoid code duplication with generic bitops im=
plementation
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011721.R=
xlcXd9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011721.RxlcXd9E-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__fls.h is included =
more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/fls.h is included mo=
re than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__ffs.h is included =
more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/ffs.h is included mo=
re than once.

vim +20 arch/riscv/include/asm/bitops.h

    17=09
    18	#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
    19	#include <asm-generic/bitops/__ffs.h>
  > 20	#include <asm-generic/bitops/__fls.h>
    21	#include <asm-generic/bitops/ffs.h>
    22	#include <asm-generic/bitops/fls.h>
    23=09
    24	#else
    25	#define __HAVE_ARCH___FFS
    26	#define __HAVE_ARCH___FLS
    27	#define __HAVE_ARCH_FFS
    28	#define __HAVE_ARCH_FLS
    29=09
    30	#include <asm-generic/bitops/__ffs.h>
  > 31	#include <asm-generic/bitops/__fls.h>
    32	#include <asm-generic/bitops/ffs.h>
    33	#include <asm-generic/bitops/fls.h>
    34=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

