Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244BEC5
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 02:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695695133; x=1727231133;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3oyfYbDFib0gxiO7yNy8XZyXWJV1D1DMS/iIXOaU0tg=;
  b=F4cPu+SSNNfgME+OidGPYgxtXH8J5JHiYD/RtqSHOtEo6NoAmd+auOr1
   oMIxfy1q2A4YuM2XwuwRdO2oVpSdZ36npANSm0AK5afxWFB9g+A3qN00p
   6Cd6H/cNDgrwm+hveMJxba6hlYlrxgkidu0Fxk70adSnuyYYSrJxrBvsk
   opqvGjPDwbAUCeBtKWkbLwuQuOumSiLuwZmRrGsqbAfMFcvw4QxGz3tle
   VKidPbuXDB7r6napDvOws/dG7qn6bIvcLeQogbwcgpVe61qklhyh/5OMt
   Av4kSklzl9EtbOnfoal65w2z1FKa7Bvi+7vq5W9xwuNQta/A6BFtcG2WN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385312633"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="385312633"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 19:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777942770"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="777942770"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Sep 2023 19:25:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 19:25:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 19:25:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 19:25:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 19:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHZLmJG3weqZ9nhL0zwJhG839BDPPU515f0MhTW1TT2p4C12Xn4i4AlkoTEbxPTc6gPbIhUADmPxPqjsWisqT5NvekTUij0GDEowvbbtR/pihrvqFPFYM2DggjQRncR1HD3BWcBt4rNjc1OLfX6FFGLLsMRwuEUmkT5lxG2uEKVlCPpFS1OLz+dbEqr107XaqzqT60rDK6D/XQI5P3qB+XEYvqF7mYllb9Wo8F7XLeV0idYV9XjPcom+h8Jnsp+ZLJdWcQFlYggT4T5/flm8Lyh3oPOv+xiUEe+az6N3J9c8Czgmw+RJ9zpc33p3kCjz8QkYCpduOloko0VCXF6DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiVp+/yOY5c9gK1TlPrZZXc0s0iOJraq/wg0Ri2CdJ4=;
 b=BLZ+JJQDXCo5zRs9rzLRbw4AamBKjwpAESRRT3xCCl/3LHW+FOyQ51JKyjZgiIg2QOjIVOsKd5o80nt86n4WpoZwoNS/aQNB7Ez7HVnPB2TJV2/lj3Lrj7UM4PDDNid0tLnkusSRSkVFJsDAypHc/GlAae8Vj1/GXsLK3sJ2Io4dUE0NIZTX1qUmZ1alTM8N17SnRYLgzXX8qEItUsuW2KbqSW/tnEDV/VsLyN74Sm8zNu7evkBmiK6m73w4HD/p0ZWYY+FdBZhlqT9yojVNyk3XHMtVjGKz6XyPwdfOv2ODIBUo5KPuzvci+7xyYOEkd4vdyVTIyUEfdLISVCjmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 02:25:27 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 02:25:27 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v3 02/11] gpiolib: add support for scope-based management
 to gpio_device
Thread-Topic: [PATCH v3 02/11] gpiolib: add support for scope-based management
 to gpio_device
Thread-Index: AQHZ6N75c5s8ARKsLEmazD1nksO0nbAsbe6Q
Date: Tue, 26 Sep 2023 02:25:27 +0000
Message-ID: <CY5PR11MB639270E7A1087E3813BF471AFBC3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202309170423.Uh3nwNdI-lkp@intel.com>
In-Reply-To: <202309170423.Uh3nwNdI-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM6PR11MB4660:EE_
x-ms-office365-filtering-correlation-id: 0dba4f59-f104-4127-23f7-08dbbe37d91e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cNxGcIS9OjTdwi17v5UcjEtRclMrJlvt5ue5Kroydvasg3PH/+wTYVYuWSyjprb0wgiC1uQQOGHHlKyUCPWEQlojO7JKccQzw6VPukzU9fKPuCQl0auYlMX+2TNT0ush3SxLmbG2IgTE2/9yM7RyCO+ckYDQNYWJqvAHFgsDUgN5t9YO+QscvDx/3yTgSFGeHHHrPp+na3Ht2LfSli18t/9zlbj0Hj5F0xWdsVcZm7bVx96f9fPdXKWtR0a5yrRfZIPDOZTka73v+J1595ud05IXxVUHdARlYJ4MPEZeUl09MNNF3kkHjOpsFtqp5BptZ4Oc7W7SRLc4WlaPDSsp2S7v7kiDZ0TrFPEX585mx4jD7qF2Fpzv40t/dg7U4xZqU8mzAU6XaKjqtmVojC4M6rtlMv1ZaRP1kN1lpXuDKlzpuMvgo4XKVRMd1uw3nD/U5MgBaaycvSydxZCtf/gqOQYVgRxW5vNG6AnlBoARUqMSz1wYTHxHU1Frt6e3jzUjOiyXTH8ZmeMTbiMzf1SGbVcQE7ja0WASTwCXDe53XEEk2xFNQe1C4CMarKMCrsiLbWcmTKBK44jSUHaFG8x+U8msIemgQmw4pVT5aGVsRAtT/jiZrUiwf5uRH8k3Jt0M81LhgURXa0KzUb7jZ0ZH8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(1800799009)(38070700005)(38100700002)(33656002)(82960400001)(86362001)(76116006)(55016003)(53546011)(30864003)(9686003)(5660300002)(66476007)(2906002)(66446008)(478600001)(52536014)(41300700001)(966005)(316002)(66556008)(64756008)(110136005)(66946007)(71200400001)(122000001)(7696005)(6506007)(83380400001)(8676002)(8936002)(26005)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yURqknJbviEiFmUx+sluKXol4BoHa94p1bB3+fv4DVm5lyG3gdjmcpwyhIBR?=
 =?us-ascii?Q?aqVkYfCHvJZE6lI2Mm/36+7MuqmSzSRj6PlgvFG8Q/NodQr4N9l77zlEogPA?=
 =?us-ascii?Q?9iRflYa63kQowXn711EFaMHMZJr5GotGVVynCjcX9tWqgbBmdi1UrsNykm30?=
 =?us-ascii?Q?LpEkzC/7Kn/pMuJOUJ4TjTAllEMa+9jXW6yl0jG0Hqybmnk7UaPbIB/borK3?=
 =?us-ascii?Q?ep7K3XSqEDdLy6d1ximvCrnfHso7BHsDxeTYUXJllPpYGtjYLvcWTLMcbYk4?=
 =?us-ascii?Q?OABY6Z9NBhCFrB2zkpqjNT0toqAI7bS/SevVMFjXEDSvVtbeLFJlQR6zh2ja?=
 =?us-ascii?Q?cJfv6u9VzQur0I/ao8t34u/6Ok9LVSUk/0hAhKuz8utUETldxFK5bGM4csgG?=
 =?us-ascii?Q?b4OkTytHwvZdQL2w2B+a2MH3QoL4/2+DsNjAkhlHTy12FdPYStzwxx7Qkz8q?=
 =?us-ascii?Q?fpPGYv0okLDuY3oZ/REy1UgmRA7d7Kc3U42izJSoV4ryWWL0/ZbpePKAFaOh?=
 =?us-ascii?Q?EPPH3xYrrSY5ylY3XP6WhqqZcCOV7Gf3ALIsKvbn5pU06i5GSKGgKGP+jgnn?=
 =?us-ascii?Q?SsaXls6vai50VKAaxJPhgYIfguNM8DHn0BLAxC+6/HepfUI2du78H5PL9855?=
 =?us-ascii?Q?de8lzvRSU8N9+GFwlWWX91xfu05SFl3UrvGLMv4XAi1QW9eCgzK6ADxAIaMF?=
 =?us-ascii?Q?bg0Ri9g867Ykjv7MshEjidnHImtTRe5o2NxbXO1doYKKpK0i8IHKt7JT30ja?=
 =?us-ascii?Q?gvrqDD/g+Qacu9B0Q/TJBJ+N95e42LnyZb6Yjv9lMAyX1MDVrPWaAKWZ8/F4?=
 =?us-ascii?Q?FEIjgItGfOmcZ3ooohXkbR3DzAUn+ZuS1cPfGebFD/nSzFFEaocvnooSn62d?=
 =?us-ascii?Q?AXBjM9iVyWMpg/skL829y8fILAP3usc8Q5hdiTlZ9ajXWZ1vJvNBfXgcFmPY?=
 =?us-ascii?Q?G5QxsIMVCHVErcKnugiHHwHd3zY6RGFr7jqHpKffrbPIgZHRQ16EcWyCD+Hw?=
 =?us-ascii?Q?6+BpMhR0y9ynruwVvoGLoDIZ1M7qlz8NAeNaoxH2QlR1kFQyPKFYmfzzU1vi?=
 =?us-ascii?Q?IqcEJ/hIkjy6z6iLruBZ2LSWt4q3Rsswyt6Z5Z8et0aMVffbI5NEhXuxy/r4?=
 =?us-ascii?Q?ZVJpvQxZ3IsERjIJy5dY6rnQNrIoqSBxt7oPm6LKR2DalWxYguaCTRkP5ZLW?=
 =?us-ascii?Q?qostZyLYFHOcYXQ5As1lZLcaHyWEK7SWP4DpH9BsjvKHdedzasWynErawkI/?=
 =?us-ascii?Q?xBKokjhNl5eQLwJUw+ZJJfAtVYOPQy0X5989napnMllaVnGanM1rveWMyO6H?=
 =?us-ascii?Q?g3Na+oVi6UBKfS2yY3ZISUPPa//BN8oAlNPrNOAe+f1wTFGuv92+uvdfVP7h?=
 =?us-ascii?Q?4PmoLrE4k4+h3alAMrArs44lND/lYjrMgTnx3QBn9dH1UoxqUTLnUeDQ1sUb?=
 =?us-ascii?Q?6qi6gX8qOIDtSGe4MxsAxhs8xTyCJWnM8fjftr1x2F8hX0Eg4HMxNkqx0MNY?=
 =?us-ascii?Q?D+lhJI3AoXrCMcfL27F3gzPa4ta/xj0apHDC5dZWbkKZZ4an6H8zTZkZTwN+?=
 =?us-ascii?Q?ZzLqU2XvAXYyqy1Cb6rS2hJ6T6xiTaz+/cy2s2JY?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dba4f59-f104-4127-23f7-08dbbe37d91e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 02:25:27.7962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gt9Edp6cwiSLV8Dac23UyksXZf0gxIcJFrvgBBUhG1LtKANoIB86rm6JnHqB4sDcWwneIoBwR3Ov8gjrg/97ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-OriginatorOrg: intel.com

not_report "guarded by macro"

   778	#else /* CONFIG_GPIOLIB */
   779=09
 > 780	#include <linux/err.h>
   781=09

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, September 17, 2023 04:46
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v3 02/11] gpiolib: add support for scope-based manageme=
nt to gpio_device

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230915150327.81918-3-brgl@bgdev.pl>
References: <20230915150327.81918-3-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-acpi@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/=
gpiolib-make-gpio_device_get-and-gpio_device_put-public/20230915-230912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio=
/for-next
patch link:    https://lore.kernel.org/r/20230915150327.81918-3-brgl%40bgde=
v.pl
patch subject: [PATCH v3 02/11] gpiolib: add support for scope-based manage=
ment to gpio_device
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170423.U=
h3nwNdI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309170423.Uh3nwNdI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/gpio/driver.h: linux/err.h is included more than once.
   include/linux/gpio/driver.h: asm/bug.h is included more than once.

vim +7 include/linux/gpio/driver.h

     4=09
     5	#include <linux/bits.h>
     6	#include <linux/cleanup.h>
   > 7	#include <linux/err.h>
     8	#include <linux/irqchip/chained_irq.h>
     9	#include <linux/irqdomain.h>
    10	#include <linux/irqhandler.h>
    11	#include <linux/lockdep.h>
    12	#include <linux/pinctrl/pinconf-generic.h>
    13	#include <linux/pinctrl/pinctrl.h>
    14	#include <linux/property.h>
    15	#include <linux/spinlock_types.h>
    16	#include <linux/types.h>
    17=09
    18	#ifdef CONFIG_GENERIC_MSI_IRQ
    19	#include <asm/msi.h>
    20	#endif
    21=09
    22	struct device;
    23	struct irq_chip;
    24	struct irq_data;
    25	struct module;
    26	struct of_phandle_args;
    27	struct pinctrl_dev;
    28	struct seq_file;
    29=09
    30	struct gpio_chip;
    31	struct gpio_desc;
    32	struct gpio_device;
    33=09
    34	enum gpio_lookup_flags;
    35	enum gpiod_flags;
    36=09
    37	union gpio_irq_fwspec {
    38		struct irq_fwspec	fwspec;
    39	#ifdef CONFIG_GENERIC_MSI_IRQ
    40		msi_alloc_info_t	msiinfo;
    41	#endif
    42	};
    43=09
    44	#define GPIO_LINE_DIRECTION_IN	1
    45	#define GPIO_LINE_DIRECTION_OUT	0
    46=09
    47	/**
    48	 * struct gpio_irq_chip - GPIO interrupt controller
    49	 */
    50	struct gpio_irq_chip {
    51		/**
    52		 * @chip:
    53		 *
    54		 * GPIO IRQ chip implementation, provided by GPIO driver.
    55		 */
    56		struct irq_chip *chip;
    57=09
    58		/**
    59		 * @domain:
    60		 *
    61		 * Interrupt translation domain; responsible for mapping between GP=
IO
    62		 * hwirq number and Linux IRQ number.
    63		 */
    64		struct irq_domain *domain;
    65=09
    66	#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
    67		/**
    68		 * @fwnode:
    69		 *
    70		 * Firmware node corresponding to this gpiochip/irqchip, necessary
    71		 * for hierarchical irqdomain support.
    72		 */
    73		struct fwnode_handle *fwnode;
    74=09
    75		/**
    76		 * @parent_domain:
    77		 *
    78		 * If non-NULL, will be set as the parent of this GPIO interrupt
    79		 * controller's IRQ domain to establish a hierarchical interrupt
    80		 * domain. The presence of this will activate the hierarchical
    81		 * interrupt support.
    82		 */
    83		struct irq_domain *parent_domain;
    84=09
    85		/**
    86		 * @child_to_parent_hwirq:
    87		 *
    88		 * This callback translates a child hardware IRQ offset to a parent
    89		 * hardware IRQ offset on a hierarchical interrupt chip. The child
    90		 * hardware IRQs correspond to the GPIO index 0..ngpio-1 (see the
    91		 * ngpio field of struct gpio_chip) and the corresponding parent
    92		 * hardware IRQ and type (such as IRQ_TYPE_*) shall be returned by
    93		 * the driver. The driver can calculate this from an offset or usin=
g
    94		 * a lookup table or whatever method is best for this chip. Return
    95		 * 0 on successful translation in the driver.
    96		 *
    97		 * If some ranges of hardware IRQs do not have a corresponding pare=
nt
    98		 * HWIRQ, return -EINVAL, but also make sure to fill in @valid_mask=
 and
    99		 * @need_valid_mask to make these GPIO lines unavailable for
   100		 * translation.
   101		 */
   102		int (*child_to_parent_hwirq)(struct gpio_chip *gc,
   103					     unsigned int child_hwirq,
   104					     unsigned int child_type,
   105					     unsigned int *parent_hwirq,
   106					     unsigned int *parent_type);
   107=09
   108		/**
   109		 * @populate_parent_alloc_arg :
   110		 *
   111		 * This optional callback allocates and populates the specific stru=
ct
   112		 * for the parent's IRQ domain. If this is not specified, then
   113		 * &gpiochip_populate_parent_fwspec_twocell will be used. A four-ce=
ll
   114		 * variant named &gpiochip_populate_parent_fwspec_fourcell is also
   115		 * available.
   116		 */
   117		int (*populate_parent_alloc_arg)(struct gpio_chip *gc,
   118						 union gpio_irq_fwspec *fwspec,
   119						 unsigned int parent_hwirq,
   120						 unsigned int parent_type);
   121=09
   122		/**
   123		 * @child_offset_to_irq:
   124		 *
   125		 * This optional callback is used to translate the child's GPIO lin=
e
   126		 * offset on the GPIO chip to an IRQ number for the GPIO to_irq()
   127		 * callback. If this is not specified, then a default callback will=
 be
   128		 * provided that returns the line offset.
   129		 */
   130		unsigned int (*child_offset_to_irq)(struct gpio_chip *gc,
   131						    unsigned int pin);
   132=09
   133		/**
   134		 * @child_irq_domain_ops:
   135		 *
   136		 * The IRQ domain operations that will be used for this GPIO IRQ
   137		 * chip. If no operations are provided, then default callbacks will
   138		 * be populated to setup the IRQ hierarchy. Some drivers need to
   139		 * supply their own translate function.
   140		 */
   141		struct irq_domain_ops child_irq_domain_ops;
   142	#endif
   143=09
   144		/**
   145		 * @handler:
   146		 *
   147		 * The IRQ handler to use (often a predefined IRQ core function) fo=
r
   148		 * GPIO IRQs, provided by GPIO driver.
   149		 */
   150		irq_flow_handler_t handler;
   151=09
   152		/**
   153		 * @default_type:
   154		 *
   155		 * Default IRQ triggering type applied during GPIO driver
   156		 * initialization, provided by GPIO driver.
   157		 */
   158		unsigned int default_type;
   159=09
   160		/**
   161		 * @lock_key:
   162		 *
   163		 * Per GPIO IRQ chip lockdep class for IRQ lock.
   164		 */
   165		struct lock_class_key *lock_key;
   166=09
   167		/**
   168		 * @request_key:
   169		 *
   170		 * Per GPIO IRQ chip lockdep class for IRQ request.
   171		 */
   172		struct lock_class_key *request_key;
   173=09
   174		/**
   175		 * @parent_handler:
   176		 *
   177		 * The interrupt handler for the GPIO chip's parent interrupts, may=
 be
   178		 * NULL if the parent interrupts are nested rather than cascaded.
   179		 */
   180		irq_flow_handler_t parent_handler;
   181=09
   182		union {
   183			/**
   184			 * @parent_handler_data:
   185			 *
   186			 * If @per_parent_data is false, @parent_handler_data is a
   187			 * single pointer used as the data associated with every
   188			 * parent interrupt.
   189			 */
   190			void *parent_handler_data;
   191=09
   192			/**
   193			 * @parent_handler_data_array:
   194			 *
   195			 * If @per_parent_data is true, @parent_handler_data_array is
   196			 * an array of @num_parents pointers, and is used to associate
   197			 * different data for each parent. This cannot be NULL if
   198			 * @per_parent_data is true.
   199			 */
   200			void **parent_handler_data_array;
   201		};
   202=09
   203		/**
   204		 * @num_parents:
   205		 *
   206		 * The number of interrupt parents of a GPIO chip.
   207		 */
   208		unsigned int num_parents;
   209=09
   210		/**
   211		 * @parents:
   212		 *
   213		 * A list of interrupt parents of a GPIO chip. This is owned by the
   214		 * driver, so the core will only reference this list, not modify it=
.
   215		 */
   216		unsigned int *parents;
   217=09
   218		/**
   219		 * @map:
   220		 *
   221		 * A list of interrupt parents for each line of a GPIO chip.
   222		 */
   223		unsigned int *map;
   224=09
   225		/**
   226		 * @threaded:
   227		 *
   228		 * True if set the interrupt handling uses nested threads.
   229		 */
   230		bool threaded;
   231=09
   232		/**
   233		 * @per_parent_data:
   234		 *
   235		 * True if parent_handler_data_array describes a @num_parents
   236		 * sized array to be used as parent data.
   237		 */
   238		bool per_parent_data;
   239=09
   240		/**
   241		 * @initialized:
   242		 *
   243		 * Flag to track GPIO chip irq member's initialization.
   244		 * This flag will make sure GPIO chip irq members are not used
   245		 * before they are initialized.
   246		 */
   247		bool initialized;
   248=09
   249		/**
   250		 * @domain_is_allocated_externally:
   251		 *
   252		 * True it the irq_domain was allocated outside of gpiolib, in whic=
h
   253		 * case gpiolib won't free the irq_domain itself.
   254		 */
   255		bool domain_is_allocated_externally;
   256=09
   257		/**
   258		 * @init_hw: optional routine to initialize hardware before
   259		 * an IRQ chip will be added. This is quite useful when
   260		 * a particular driver wants to clear IRQ related registers
   261		 * in order to avoid undesired events.
   262		 */
   263		int (*init_hw)(struct gpio_chip *gc);
   264=09
   265		/**
   266		 * @init_valid_mask: optional routine to initialize @valid_mask, to=
 be
   267		 * used if not all GPIO lines are valid interrupts. Sometimes some
   268		 * lines just cannot fire interrupts, and this routine, when define=
d,
   269		 * is passed a bitmap in "valid_mask" and it will have ngpios
   270		 * bits from 0..(ngpios-1) set to "1" as in valid. The callback can
   271		 * then directly set some bits to "0" if they cannot be used for
   272		 * interrupts.
   273		 */
   274		void (*init_valid_mask)(struct gpio_chip *gc,
   275					unsigned long *valid_mask,
   276					unsigned int ngpios);
   277=09
   278		/**
   279		 * @valid_mask:
   280		 *
   281		 * If not %NULL, holds bitmask of GPIOs which are valid to be inclu=
ded
   282		 * in IRQ domain of the chip.
   283		 */
   284		unsigned long *valid_mask;
   285=09
   286		/**
   287		 * @first:
   288		 *
   289		 * Required for static IRQ allocation. If set, irq_domain_add_simpl=
e()
   290		 * will allocate and map all IRQs during initialization.
   291		 */
   292		unsigned int first;
   293=09
   294		/**
   295		 * @irq_enable:
   296		 *
   297		 * Store old irq_chip irq_enable callback
   298		 */
   299		void		(*irq_enable)(struct irq_data *data);
   300=09
   301		/**
   302		 * @irq_disable:
   303		 *
   304		 * Store old irq_chip irq_disable callback
   305		 */
   306		void		(*irq_disable)(struct irq_data *data);
   307		/**
   308		 * @irq_unmask:
   309		 *
   310		 * Store old irq_chip irq_unmask callback
   311		 */
   312		void		(*irq_unmask)(struct irq_data *data);
   313=09
   314		/**
   315		 * @irq_mask:
   316		 *
   317		 * Store old irq_chip irq_mask callback
   318		 */
   319		void		(*irq_mask)(struct irq_data *data);
   320	};
   321=09
   322	/**
   323	 * struct gpio_chip - abstract a GPIO controller
   324	 * @label: a functional name for the GPIO device, such as a part
   325	 *	number or the name of the SoC IP-block implementing it.
   326	 * @gpiodev: the internal state holder, opaque struct
   327	 * @parent: optional parent device providing the GPIOs
   328	 * @fwnode: optional fwnode providing this controller's properties
   329	 * @owner: helps prevent removal of modules exporting active GPIOs
   330	 * @request: optional hook for chip-specific activation, such as
   331	 *	enabling module power and clock; may sleep
   332	 * @free: optional hook for chip-specific deactivation, such as
   333	 *	disabling module power and clock; may sleep
   334	 * @get_direction: returns direction for signal "offset", 0=3Dout, 1=
=3Din,
   335	 *	(same as GPIO_LINE_DIRECTION_OUT / GPIO_LINE_DIRECTION_IN),
   336	 *	or negative error. It is recommended to always implement this
   337	 *	function, even on input-only or output-only gpio chips.
   338	 * @direction_input: configures signal "offset" as input, or returns=
 error
   339	 *	This can be omitted on input-only or output-only gpio chips.
   340	 * @direction_output: configures signal "offset" as output, or retur=
ns error
   341	 *	This can be omitted on input-only or output-only gpio chips.
   342	 * @get: returns value for signal "offset", 0=3Dlow, 1=3Dhigh, or ne=
gative error
   343	 * @get_multiple: reads values for multiple signals defined by "mask=
" and
   344	 *	stores them in "bits", returns 0 on success or negative error
   345	 * @set: assigns output value for signal "offset"
   346	 * @set_multiple: assigns output values for multiple signals defined=
 by "mask"
   347	 * @set_config: optional hook for all kinds of settings. Uses the sa=
me
   348	 *	packed config format as generic pinconf.
   349	 * @to_irq: optional hook supporting non-static gpiod_to_irq() mappi=
ngs;
   350	 *	implementation may not sleep
   351	 * @dbg_show: optional routine to show contents in debugfs; default =
code
   352	 *	will be used when this is omitted, but custom code can show extra
   353	 *	state (such as pullup/pulldown configuration).
   354	 * @init_valid_mask: optional routine to initialize @valid_mask, to =
be used if
   355	 *	not all GPIOs are valid.
   356	 * @add_pin_ranges: optional routine to initialize pin ranges, to be=
 used when
   357	 *	requires special mapping of the pins that provides GPIO functiona=
lity.
   358	 *	It is called after adding GPIO chip and before adding IRQ chip.
   359	 * @en_hw_timestamp: Dependent on GPIO chip, an optional routine to
   360	 *	enable hardware timestamp.
   361	 * @dis_hw_timestamp: Dependent on GPIO chip, an optional routine to
   362	 *	disable hardware timestamp.
   363	 * @base: identifies the first GPIO number handled by this chip;
   364	 *	or, if negative during registration, requests dynamic ID allocati=
on.
   365	 *	DEPRECATION: providing anything non-negative and nailing the base
   366	 *	offset of GPIO chips is deprecated. Please pass -1 as base to
   367	 *	let gpiolib select the chip base in all possible cases. We want t=
o
   368	 *	get rid of the static GPIO number space in the long run.
   369	 * @ngpio: the number of GPIOs handled by this controller; the last =
GPIO
   370	 *	handled is (base + ngpio - 1).
   371	 * @offset: when multiple gpio chips belong to the same device this
   372	 *	can be used as offset within the device so friendly names can
   373	 *	be properly assigned.
   374	 * @names: if set, must be an array of strings to use as alternative
   375	 *      names for the GPIOs in this chip. Any entry in the array
   376	 *      may be NULL if there is no alias for the GPIO, however the
   377	 *      array must be @ngpio entries long.  A name can include a sin=
gle printk
   378	 *      format specifier for an unsigned int.  It is substituted by =
the actual
   379	 *      number of the gpio.
   380	 * @can_sleep: flag must be set iff get()/set() methods sleep, as th=
ey
   381	 *	must while accessing GPIO expander chips over I2C or SPI. This
   382	 *	implies that if the chip supports IRQs, these IRQs need to be thr=
eaded
   383	 *	as the chip access may sleep when e.g. reading out the IRQ status
   384	 *	registers.
   385	 * @read_reg: reader function for generic GPIO
   386	 * @write_reg: writer function for generic GPIO
   387	 * @be_bits: if the generic GPIO has big endian bit order (bit 31 is=
 representing
   388	 *	line 0, bit 30 is line 1 ... bit 0 is line 31) this is set to tru=
e by the
   389	 *	generic GPIO core. It is for internal housekeeping only.
   390	 * @reg_dat: data (in) register for generic GPIO
   391	 * @reg_set: output set register (out=3Dhigh) for generic GPIO
   392	 * @reg_clr: output clear register (out=3Dlow) for generic GPIO
   393	 * @reg_dir_out: direction out setting register for generic GPIO
   394	 * @reg_dir_in: direction in setting register for generic GPIO
   395	 * @bgpio_dir_unreadable: indicates that the direction register(s) c=
annot
   396	 *	be read and we need to rely on out internal state tracking.
   397	 * @bgpio_bits: number of register bits used for a generic GPIO i.e.
   398	 *	<register width> * 8
   399	 * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed =
to keep
   400	 *	shadowed and real data registers writes together.
   401	 * @bgpio_data:	shadowed data register for generic GPIO to clear/set=
 bits
   402	 *	safely.
   403	 * @bgpio_dir: shadowed direction register for generic GPIO to clear=
/set
   404	 *	direction safely. A "1" in this word means the line is set as
   405	 *	output.
   406	 *
   407	 * A gpio_chip can help platforms abstract various sources of GPIOs =
so
   408	 * they can all be accessed through a common programming interface.
   409	 * Example sources would be SOC controllers, FPGAs, multifunction
   410	 * chips, dedicated GPIO expanders, and so on.
   411	 *
   412	 * Each chip controls a number of signals, identified in method call=
s
   413	 * by "offset" values in the range 0..(@ngpio - 1).  When those sign=
als
   414	 * are referenced through calls like gpio_get_value(gpio), the offse=
t
   415	 * is calculated by subtracting @base from the gpio number.
   416	 */
   417	struct gpio_chip {
   418		const char		*label;
   419		struct gpio_device	*gpiodev;
   420		struct device		*parent;
   421		struct fwnode_handle	*fwnode;
   422		struct module		*owner;
   423=09
   424		int			(*request)(struct gpio_chip *gc,
   425							unsigned int offset);
   426		void			(*free)(struct gpio_chip *gc,
   427							unsigned int offset);
   428		int			(*get_direction)(struct gpio_chip *gc,
   429							unsigned int offset);
   430		int			(*direction_input)(struct gpio_chip *gc,
   431							unsigned int offset);
   432		int			(*direction_output)(struct gpio_chip *gc,
   433							unsigned int offset, int value);
   434		int			(*get)(struct gpio_chip *gc,
   435							unsigned int offset);
   436		int			(*get_multiple)(struct gpio_chip *gc,
   437							unsigned long *mask,
   438							unsigned long *bits);
   439		void			(*set)(struct gpio_chip *gc,
   440							unsigned int offset, int value);
   441		void			(*set_multiple)(struct gpio_chip *gc,
   442							unsigned long *mask,
   443							unsigned long *bits);
   444		int			(*set_config)(struct gpio_chip *gc,
   445						      unsigned int offset,
   446						      unsigned long config);
   447		int			(*to_irq)(struct gpio_chip *gc,
   448							unsigned int offset);
   449=09
   450		void			(*dbg_show)(struct seq_file *s,
   451							struct gpio_chip *gc);
   452=09
   453		int			(*init_valid_mask)(struct gpio_chip *gc,
   454							   unsigned long *valid_mask,
   455							   unsigned int ngpios);
   456=09
   457		int			(*add_pin_ranges)(struct gpio_chip *gc);
   458=09
   459		int			(*en_hw_timestamp)(struct gpio_chip *gc,
   460							   u32 offset,
   461							   unsigned long flags);
   462		int			(*dis_hw_timestamp)(struct gpio_chip *gc,
   463							    u32 offset,
   464							    unsigned long flags);
   465		int			base;
   466		u16			ngpio;
   467		u16			offset;
   468		const char		*const *names;
   469		bool			can_sleep;
   470=09
   471	#if IS_ENABLED(CONFIG_GPIO_GENERIC)
   472		unsigned long (*read_reg)(void __iomem *reg);
   473		void (*write_reg)(void __iomem *reg, unsigned long data);
   474		bool be_bits;
   475		void __iomem *reg_dat;
   476		void __iomem *reg_set;
   477		void __iomem *reg_clr;
   478		void __iomem *reg_dir_out;
   479		void __iomem *reg_dir_in;
   480		bool bgpio_dir_unreadable;
   481		int bgpio_bits;
   482		raw_spinlock_t bgpio_lock;
   483		unsigned long bgpio_data;
   484		unsigned long bgpio_dir;
   485	#endif /* CONFIG_GPIO_GENERIC */
   486=09
   487	#ifdef CONFIG_GPIOLIB_IRQCHIP
   488		/*
   489		 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
   490		 * to handle IRQs for most practical cases.
   491		 */
   492=09
   493		/**
   494		 * @irq:
   495		 *
   496		 * Integrates interrupt chip functionality with the GPIO chip. Can =
be
   497		 * used to handle IRQs for most practical cases.
   498		 */
   499		struct gpio_irq_chip irq;
   500	#endif /* CONFIG_GPIOLIB_IRQCHIP */
   501=09
   502		/**
   503		 * @valid_mask:
   504		 *
   505		 * If not %NULL, holds bitmask of GPIOs which are valid to be used
   506		 * from the chip.
   507		 */
   508		unsigned long *valid_mask;
   509=09
   510	#if defined(CONFIG_OF_GPIO)
   511		/*
   512		 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers describe=
d in
   513		 * the device tree automatically may have an OF translation
   514		 */
   515=09
   516		/**
   517		 * @of_gpio_n_cells:
   518		 *
   519		 * Number of cells used to form the GPIO specifier.
   520		 */
   521		unsigned int of_gpio_n_cells;
   522=09
   523		/**
   524		 * @of_xlate:
   525		 *
   526		 * Callback to translate a device tree GPIO specifier into a chip-
   527		 * relative GPIO number and flags.
   528		 */
   529		int (*of_xlate)(struct gpio_chip *gc,
   530				const struct of_phandle_args *gpiospec, u32 *flags);
   531	#endif /* CONFIG_OF_GPIO */
   532	};
   533=09
   534	const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int=
 offset);
   535=09
   536	/**
   537	 * for_each_requested_gpio_in_range - iterates over requested GPIOs =
in a given range
   538	 * @chip:	the chip to query
   539	 * @i:		loop variable
   540	 * @base:	first GPIO in the range
   541	 * @size:	amount of GPIOs to check starting from @base
   542	 * @label:	label of current GPIO
   543	 */
   544	#define for_each_requested_gpio_in_range(chip, i, base, size, label)=
			\
   545		for (i =3D 0; i < size; i++)							\
   546			if ((label =3D gpiochip_is_requested(chip, base + i)) =3D=3D NULL)=
 {} else
   547=09
   548	/* Iterates over all requested GPIO of the given @chip */
   549	#define for_each_requested_gpio(chip, i, label)						\
   550		for_each_requested_gpio_in_range(chip, i, 0, chip->ngpio, label)
   551=09
   552	/* add/remove chips */
   553	int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
   554				       struct lock_class_key *lock_key,
   555				       struct lock_class_key *request_key);
   556=09
   557	/**
   558	 * gpiochip_add_data() - register a gpio_chip
   559	 * @gc: the chip to register, with gc->base initialized
   560	 * @data: driver-private data associated with this chip
   561	 *
   562	 * Context: potentially before irqs will work
   563	 *
   564	 * When gpiochip_add_data() is called very early during boot, so tha=
t GPIOs
   565	 * can be freely used, the gc->parent device must be registered befo=
re
   566	 * the gpio framework's arch_initcall().  Otherwise sysfs initializa=
tion
   567	 * for GPIOs will fail rudely.
   568	 *
   569	 * gpiochip_add_data() must only be called after gpiolib initializat=
ion,
   570	 * i.e. after core_initcall().
   571	 *
   572	 * If gc->base is negative, this requests dynamic assignment of
   573	 * a range of valid GPIOs.
   574	 *
   575	 * Returns:
   576	 * A negative errno if the chip can't be registered, such as because=
 the
   577	 * gc->base is invalid or already associated with a different chip.
   578	 * Otherwise it returns zero as a success code.
   579	 */
   580	#ifdef CONFIG_LOCKDEP
   581	#define gpiochip_add_data(gc, data) ({		\
   582			static struct lock_class_key lock_key;	\
   583			static struct lock_class_key request_key;	  \
   584			gpiochip_add_data_with_key(gc, data, &lock_key, \
   585						   &request_key);	  \
   586		})
   587	#define devm_gpiochip_add_data(dev, gc, data) ({ \
   588			static struct lock_class_key lock_key;	\
   589			static struct lock_class_key request_key;	  \
   590			devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
   591						   &request_key);	  \
   592		})
   593	#else
   594	#define gpiochip_add_data(gc, data) gpiochip_add_data_with_key(gc, d=
ata, NULL, NULL)
   595	#define devm_gpiochip_add_data(dev, gc, data) \
   596		devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
   597	#endif /* CONFIG_LOCKDEP */
   598=09
   599	static inline int gpiochip_add(struct gpio_chip *gc)
   600	{
   601		return gpiochip_add_data(gc, NULL);
   602	}
   603	void gpiochip_remove(struct gpio_chip *gc);
   604	int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_=
chip *gc,
   605					    void *data, struct lock_class_key *lock_key,
   606					    struct lock_class_key *request_key);
   607=09
   608	struct gpio_chip *gpiochip_find(void *data,
   609					int (*match)(struct gpio_chip *gc, void *data));
   610=09
   611	struct gpio_device *gpio_device_get(struct gpio_device *gdev);
   612	void gpio_device_put(struct gpio_device *gdev);
   613=09
   614	DEFINE_FREE(gpio_device_put, struct gpio_device *,
   615		    if (IS_ERR_OR_NULL(_T)) gpio_device_put(_T));
   616=09
   617	bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset)=
;
   618	int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
   619	void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
   620	void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset)=
;
   621	void gpiochip_enable_irq(struct gpio_chip *gc, unsigned int offset);
   622=09
   623	/* irq_data versions of the above */
   624	int gpiochip_irq_reqres(struct irq_data *data);
   625	void gpiochip_irq_relres(struct irq_data *data);
   626=09
   627	/* Paste this in your irq_chip structure  */
   628	#define	GPIOCHIP_IRQ_RESOURCE_HELPERS					\
   629			.irq_request_resources  =3D gpiochip_irq_reqres,		\
   630			.irq_release_resources  =3D gpiochip_irq_relres
   631=09
   632	static inline void gpio_irq_chip_set_chip(struct gpio_irq_chip *girq=
,
   633						  const struct irq_chip *chip)
   634	{
   635		/* Yes, dropping const is ugly, but it isn't like we have a choice =
*/
   636		girq->chip =3D (struct irq_chip *)chip;
   637	}
   638=09
   639	/* Line status inquiry for drivers */
   640	bool gpiochip_line_is_open_drain(struct gpio_chip *gc, unsigned int =
offset);
   641	bool gpiochip_line_is_open_source(struct gpio_chip *gc, unsigned int=
 offset);
   642=09
   643	/* Sleep persistence inquiry for drivers */
   644	bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int =
offset);
   645	bool gpiochip_line_is_valid(const struct gpio_chip *gc, unsigned int=
 offset);
   646=09
   647	/* get driver data */
   648	void *gpiochip_get_data(struct gpio_chip *gc);
   649=09
   650	struct bgpio_pdata {
   651		const char *label;
   652		int base;
   653		int ngpio;
   654	};
   655=09
   656	#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
   657=09
   658	int gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,
   659						    union gpio_irq_fwspec *gfwspec,
   660						    unsigned int parent_hwirq,
   661						    unsigned int parent_type);
   662	int gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *gc,
   663						     union gpio_irq_fwspec *gfwspec,
   664						     unsigned int parent_hwirq,
   665						     unsigned int parent_type);
   666=09
   667	#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
   668=09
   669	int bgpio_init(struct gpio_chip *gc, struct device *dev,
   670		       unsigned long sz, void __iomem *dat, void __iomem *set,
   671		       void __iomem *clr, void __iomem *dirout, void __iomem *dirin=
,
   672		       unsigned long flags);
   673=09
   674	#define BGPIOF_BIG_ENDIAN		BIT(0)
   675	#define BGPIOF_UNREADABLE_REG_SET	BIT(1) /* reg_set is unreadable */
   676	#define BGPIOF_UNREADABLE_REG_DIR	BIT(2) /* reg_dir is unreadable */
   677	#define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
   678	#define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output v=
alue */
   679	#define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
   680	#define BGPIOF_NO_SET_ON_INPUT		BIT(6)
   681=09
   682	int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
   683			     irq_hw_number_t hwirq);
   684	void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
   685=09
   686	int gpiochip_irq_domain_activate(struct irq_domain *domain,
   687					 struct irq_data *data, bool reserve);
   688	void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
   689					    struct irq_data *data);
   690=09
   691	bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
   692					unsigned int offset);
   693=09
   694	#ifdef CONFIG_GPIOLIB_IRQCHIP
   695	int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
   696					struct irq_domain *domain);
   697	#else
   698=09
   699	#include <asm/bug.h>
   700	#include <asm/errno.h>
   701=09
   702	static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
   703						      struct irq_domain *domain)
   704	{
   705		WARN_ON(1);
   706		return -EINVAL;
   707	}
   708	#endif
   709=09
   710	int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offs=
et);
   711	void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset=
);
   712	int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offse=
t,
   713				    unsigned long config);
   714=09
   715	/**
   716	 * struct gpio_pin_range - pin range controlled by a gpio chip
   717	 * @node: list for maintaining set of pin ranges, used internally
   718	 * @pctldev: pinctrl device which handles corresponding pins
   719	 * @range: actual range of pins controlled by a gpio controller
   720	 */
   721	struct gpio_pin_range {
   722		struct list_head node;
   723		struct pinctrl_dev *pctldev;
   724		struct pinctrl_gpio_range range;
   725	};
   726=09
   727	#ifdef CONFIG_PINCTRL
   728=09
   729	int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_=
name,
   730				   unsigned int gpio_offset, unsigned int pin_offset,
   731				   unsigned int npins);
   732	int gpiochip_add_pingroup_range(struct gpio_chip *gc,
   733				struct pinctrl_dev *pctldev,
   734				unsigned int gpio_offset, const char *pin_group);
   735	void gpiochip_remove_pin_ranges(struct gpio_chip *gc);
   736=09
   737	#else /* ! CONFIG_PINCTRL */
   738=09
   739	static inline int
   740	gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name=
,
   741			       unsigned int gpio_offset, unsigned int pin_offset,
   742			       unsigned int npins)
   743	{
   744		return 0;
   745	}
   746	static inline int
   747	gpiochip_add_pingroup_range(struct gpio_chip *gc,
   748				struct pinctrl_dev *pctldev,
   749				unsigned int gpio_offset, const char *pin_group)
   750	{
   751		return 0;
   752	}
   753=09
   754	static inline void
   755	gpiochip_remove_pin_ranges(struct gpio_chip *gc)
   756	{
   757	}
   758=09
   759	#endif /* CONFIG_PINCTRL */
   760=09
   761	struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
   762						    unsigned int hwnum,
   763						    const char *label,
   764						    enum gpio_lookup_flags lflags,
   765						    enum gpiod_flags dflags);
   766	void gpiochip_free_own_desc(struct gpio_desc *desc);
   767=09
   768	struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned i=
nt hwnum);
   769=09
   770	#ifdef CONFIG_GPIOLIB
   771=09
   772	/* lock/unlock as IRQ */
   773	int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
   774	void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offse=
t);
   775=09
   776	struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
   777=09
   778	#else /* CONFIG_GPIOLIB */
   779=09
 > 780	#include <linux/err.h>
   781=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

