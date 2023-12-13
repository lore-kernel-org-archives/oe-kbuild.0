Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54231C8CF
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzT0TA/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702446001; x=1733982001;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7xNWLJRGMg5oLSvWFk+zN8L+KxdQD+uC7CAnjZAVqxk=;
  b=AzT0TA/+BIxaEzZIFY5FrF5eLVW06gpsv2WztAxLSRwAWuM2XNt+y39o
   p58K//3ZRLnOzpkGpi402EbWd4Xek1HVk9jhun7s8pcTz3c3/UPFV2YV3
   YY8ak5Q6k4D4SutSd6Vd7hy2K2QG0agwslxBaAaUbmhx8NN/IMqAJLvDA
   HydX+1ag7o3y3gpeO2PvoiKIhPqq07nMygCXIXIzoNqCCckRYHGLFS06w
   TlKJigGpraDU5MafiY+LR9Xa6VcdcwYN7PwJyFWEJR7YBoHp5euqW0jUL
   llBxfPLuOd5gykV61uMXn3CWjQq5B8jJSnzksVVoTR2HAzoqe2K66h0OT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1773170"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1773170"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 21:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="723510441"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="723510441"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 21:39:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 21:39:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 21:39:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 21:39:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1/0a9Jxarmp8EXBEAZBeHLflg5j+S0FF2Q4BygfDobjkAIY9Bxy067S9xEW1P+Q5P6jLhD0CGEqaaBWb//9eE0mGI0+oE3ENGbugV/mSqIwqj5/9H7mriZnqPqZlBMm/L/xKqjgvRQQkYaGlTupL8VrMbyDkzRTR6y4G7XaxSra+P1bh3LWnMCHTjPwZ+9xpOSvuGqUb/32DKbtuAkfCV9Ec/WH0UG+fFqAxPOQ8y6azXmZUF+dRJJEsZx1H5j0elLqaYHydx5mHE5oOSzr0xH63B9vITG3c3AE2B109CtibqcbVkrurVF/9t9CFpjdwBXGRzVbMPdbRYh7bE9iIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qyVpDccljN2B/Gtc2MXF5HUGvxDdcW+XEs1l8E3bKc=;
 b=R9e+N6Yu9Dh/JBhm5er8xJnCbJ+COlVlGzOB0n4XTQnYjIQyQ2YC4aVkumwMShKDDEN5rjiEjWkTuU5669VTLKR9/Xb9P1bHAvUrN1fy9d6GSXdazoYOU0r3AOTeMm6riN40eH8mxFnmsnr/C1wxMaFQOTZD6s0XqE4cE99ZrgihbsfmRk3STd5Twjfkv9yPo5FlA2EKzEsKLRaBhYWCTz1g1n8OtHUWJIc0BMIW5UjBBJJ3bvCEKVvgw4JYHNkb43qNh8jYgQxV78c1z/cxgjCp1uAG9L+sKMkvQbOZ1AgE+uV+vtuutF03WHUK8oT2dk3P7Xe7AvGY9gEzeLsDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 05:39:46 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 05:39:46 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/soc/qcom/smsm.c:152:22: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Thread-Topic: drivers/soc/qcom/smsm.c:152:22: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Thread-Index: AQHaLD3pZyclXjq/jUO16oraiokRSrCmtOxQ
Date: Wed, 13 Dec 2023 05:39:46 +0000
Message-ID: <CY5PR11MB6392CABD2F0F362FEDC032F0FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312112210.PJrAQM8A-lkp@intel.com>
In-Reply-To: <202312112210.PJrAQM8A-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH3PR11MB7916:EE_
x-ms-office365-filtering-correlation-id: 966665de-1820-4000-16ef-08dbfb9dea74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7uJdvg03XivMsa3jkJNNWmKCF/EZ07965j5+m1+mKsQC+3KeSP8VmpZq0ilRQVed5Je/IuhNxjKLYY3eLrTK3W9viIoAeeueIreAF8J11yVSJAO3bZz1n+2F/lFqaG63RfyeZeQg2kee2BC0APLp94f9mg6p92xxVlxSY0LF1/coZf4EOYmQcc/2l++C571tf3MOPOLUbfN8FbQlEHoQY58qUtEZa/9OngW4NPiCu+L66aiG51x55T9IXV02btdzhfwYPZ3Ebl1+X0CiHsIn3Kqd6AUYnjNAwzu6n8TylGn+5mr2bqGiqn0l1y1X/dTYtxaBtRNx5hIZZQNnjbZKF4eiiJqle6zGr/XILVuhGbrurXpsZc2wETZXqbLY3D7GcGKidrCXMpDPviEKZK6z3TuZVEbW395hlTDR83AydmGGorV/2JNZQg8msYibMg6vP2Oyudz7cj8jmxpNIOT/rFtXpfHN4kqipS/HMMTXFb366GS+CUs8BAtP60plwk7MxBWuMFag1vkEJcgzcdLLvPpzSAISWSXrFXCSgWjqkzsVb/aQOnnx9k+skzhayCvIDhIgV9wIdUBsy3XJEaP4qptk2MWrcjnvLR04gZL7u0XZddZRIXiYJs/b1CD6LBPiq9JAntMFFZkZnLUH6u71lT3+jlysjNrY3WRhlpE3O7K4ubDKWzbjIa8PJRQeGg9P
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(53546011)(6506007)(9686003)(71200400001)(7696005)(64756008)(478600001)(966005)(110136005)(66556008)(316002)(76116006)(66946007)(66476007)(8676002)(66446008)(86362001)(52536014)(82960400001)(38100700002)(33656002)(55016003)(122000001)(8936002)(83380400001)(26005)(30864003)(38070700009)(5660300002)(41300700001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?maKugTqatgZEUZVl4BKz3dAfMLd8dXRBZhUzZ2KFrW/nkBgy/jGSGfgHiAM1?=
 =?us-ascii?Q?cV0pLxB6KvE3zYC9qR9a5Q4b5DqqF7ce6fgsiqp51R4uU/jDgQsoTe2oWPQn?=
 =?us-ascii?Q?VZias74psVNlpeaT2E7cpqb3jyenMlRphJ1cAsEQyCJCOHVGW/jTmwEeDklD?=
 =?us-ascii?Q?DyTnMzpFh0kZjcOOq1HTjRzXkG8Ya6jr3wgpWqm37PhGiZgRI0b/oWFXdxft?=
 =?us-ascii?Q?aWCASht56KlrgSlztH0/8HADcv2UHfxVueH64ojM60FLD69wTpWzFrMV6sBv?=
 =?us-ascii?Q?Nr2Rioi/4fjhCxuWdRpTdH3g7IOEcqIqBImMV3u26DA3UwBPDQy21gbMteXu?=
 =?us-ascii?Q?vg8F0eRn4mRCRoQRcl9VBPRj1yKoLYvg+WtryLD3BHbjsJH88VrQRz9bFj1O?=
 =?us-ascii?Q?317eOyKoLm3tGdd9oypuGrCcYe5T5bpcsAWE+wE0Fw+vXH5gPi9U+881YjZn?=
 =?us-ascii?Q?DCUTdQoaSGYzW9xc7HJxMRO3y1aFb3k/N9bpBa84RLZGiQcbvgvAM5v77tgt?=
 =?us-ascii?Q?INMzr36nocs/uiF8vDiDqWSQbSJpFntJzPegjUR2jdoC7/EL05gIhjTQ2MFD?=
 =?us-ascii?Q?xC5JOQD9jiVe6ohfQBMK9AMHV2tCY+RjpQlxJzjIoT2l3caIk510A/N2yp4I?=
 =?us-ascii?Q?UYMJVXgrI9SQ4kzFabsGrbx2wAHnVB9oUJv+QkZYTqZd27v+wj2yyCYR6oyE?=
 =?us-ascii?Q?qMQFAgwZGIUl3cebac0Z209nwaqHGwtQXsRBOH8VgOC8BaKZrpv/MBxoQJCL?=
 =?us-ascii?Q?qqot40clrR2fgO9GfQGNw5d5b8rAIZR1jTXS+3hGhS8tmTlDYIHvk1JQGA1n?=
 =?us-ascii?Q?DN8lOVGDqK9DIOz+EQEjAyiNETt3AiqIk/9ojLo1by0LDE54z/YWiWgF0UXS?=
 =?us-ascii?Q?JBVw9+ksjlZAPPJgAxuvRSU6OdaAH7QGCv1ZquIHG1BQ6F1I0AI/CG5VOT7R?=
 =?us-ascii?Q?T7riOJBVHeQOMVi71OIxLIc8YbmrFKmOxoIGY3ARAFuz4tnj0CpmGetvaVAh?=
 =?us-ascii?Q?VdV2Sg/6ZVq7C+owoVxLuPbLSPwJ37K5HsQB6qJRqmSo3NaX1a3c9nqeEupV?=
 =?us-ascii?Q?HkTynyRtjvwx5BPxiOdFts/wFI97NWwdULO8kY4DZhodu6yYtSLPPsjHhZC3?=
 =?us-ascii?Q?EioYqjjpz4VefluFP89DS7jyl9Rkan6kYIXC+S57Ji9lwDCRc+IQz4n3CTij?=
 =?us-ascii?Q?ozvsfUnVB18LvhYJOhHbdwjz/gHD+tIc/fXP1uo6mkhJ2HZzjgY1pRspl5uv?=
 =?us-ascii?Q?XFVrMHnNny0qGpCaZ6O1DwUQgKZG7t+JVBfITjRo3UOvmi1i3I2W31PZZzC4?=
 =?us-ascii?Q?o4Noda0JeexVBKLcjK0bTcf/ASmvDCKLFGilKdIw7C9RF5Ya/SLQME3wWFjW?=
 =?us-ascii?Q?A/sXbnVHogjEmwjd8HbK7Qa4VRwN7GJrHXMQstPZ42pNE/QyPOc1bVoI1acJ?=
 =?us-ascii?Q?UucrDyvUahO75h7hcNJRpu97WxYio+w2IE6X97QPAHLzLCrsIsEAP0r8oaMA?=
 =?us-ascii?Q?l1BDYNI0nZnb/XlbzoIzMSyS6TPTA2cAYA5CiHGBcKJTRFV8NpOyZ8eb+wtt?=
 =?us-ascii?Q?YNLxVkWSrsESuW2/CFgIz64C5ICBBlxlEklaZqHJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 966665de-1820-4000-16ef-08dbfb9dea74
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 05:39:46.4550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFKPSDqlnZVF0cKAn7uswIHvFjWA5BZgScjHVcS5r8CfN9J5fDANmM2O/rH4Dy5A6PIF1IN1WA1wlTvFpmagMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com

not_report

This is a sparse patch, not the root cause of the warning in soc qcom drive=
r.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, December 11, 2023 22:23
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/soc/qcom/smsm.c:152:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces)

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
config: sh-randconfig-r111-20231116 (https://download.01.org/0day-ci/archiv=
e/20231211/202312112210.PJrAQM8A-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312112210.P=
JrAQM8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312112210.PJrAQM8A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/smsm.c:152:22: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:152:22: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:152:22: sparse:     got unsigned int [usertype] =
*local_state
   drivers/soc/qcom/smsm.c:164:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __iomem *ptr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:164:9: sparse:     expected void const volatile =
[noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:164:9: sparse:     got unsigned int [usertype] *=
local_state
>> drivers/soc/qcom/smsm.c:174:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:174:23: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:174:23: sparse:     got unsigned int [usertype] =
*
>> drivers/soc/qcom/smsm.c:206:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] *remote_state @@
   drivers/soc/qcom/smsm.c:206:15: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:206:15: sparse:     got unsigned int [usertype] =
*remote_state
   drivers/soc/qcom/smsm.c:245:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:245:23: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:245:23: sparse:     got unsigned int [usertype] =
*
   drivers/soc/qcom/smsm.c:247:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:247:17: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:247:17: sparse:     got unsigned int [usertype] =
*
   drivers/soc/qcom/smsm.c:272:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:272:23: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:272:23: sparse:     got unsigned int [usertype] =
*
   drivers/soc/qcom/smsm.c:274:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:274:17: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:274:17: sparse:     got unsigned int [usertype] =
*
   drivers/soc/qcom/smsm.c:569:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:569:17: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:569:17: sparse:     got unsigned int [usertype] =
*
--
>> drivers/soc/qcom/smp2p.c:218:23: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:218:23: sparse:     expected void const volatil=
e [noderef] __iomem *ptr
   drivers/soc/qcom/smp2p.c:218:23: sparse:     got unsigned int [usertype]=
 *value
   drivers/soc/qcom/smp2p.c:325:22: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:325:22: sparse:     expected void const volatil=
e [noderef] __iomem *ptr
   drivers/soc/qcom/smp2p.c:325:22: sparse:     got unsigned int [usertype]=
 *value
   drivers/soc/qcom/smp2p.c:328:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:328:9: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   drivers/soc/qcom/smp2p.c:328:9: sparse:     got unsigned int [usertype] =
*value

vim +152 drivers/soc/qcom/smsm.c

c97c4090ff7229 Bjorn Andersson 2015-09-24  129 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  130  /**
c97c4090ff7229 Bjorn Andersson 2015-09-24  131   * smsm_update_bits() - cha=
nge bit in outgoing entry and inform subscribers
c97c4090ff7229 Bjorn Andersson 2015-09-24  132   * @data:	smsm context poin=
ter
c97c4090ff7229 Bjorn Andersson 2015-09-24  133   * @offset:	bit in the entr=
y
c97c4090ff7229 Bjorn Andersson 2015-09-24  134   * @value:	new value
c97c4090ff7229 Bjorn Andersson 2015-09-24  135   *
c97c4090ff7229 Bjorn Andersson 2015-09-24  136   * Used to set and clear th=
e bits in the outgoing/local entry and inform
c97c4090ff7229 Bjorn Andersson 2015-09-24  137   * subscribers about the ch=
ange.
c97c4090ff7229 Bjorn Andersson 2015-09-24  138   */
c97c4090ff7229 Bjorn Andersson 2015-09-24  139  static int smsm_update_bits=
(void *data, u32 mask, u32 value)
c97c4090ff7229 Bjorn Andersson 2015-09-24  140  {
c97c4090ff7229 Bjorn Andersson 2015-09-24  141  	struct qcom_smsm *smsm =3D=
 data;
c97c4090ff7229 Bjorn Andersson 2015-09-24  142  	struct smsm_host *hostp;
c97c4090ff7229 Bjorn Andersson 2015-09-24  143  	unsigned long flags;
c97c4090ff7229 Bjorn Andersson 2015-09-24  144  	u32 changes;
c97c4090ff7229 Bjorn Andersson 2015-09-24  145  	u32 host;
c97c4090ff7229 Bjorn Andersson 2015-09-24  146  	u32 orig;
c97c4090ff7229 Bjorn Andersson 2015-09-24  147  	u32 val;
c97c4090ff7229 Bjorn Andersson 2015-09-24  148 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  149  	spin_lock_irqsave(&smsm->l=
ock, flags);
c97c4090ff7229 Bjorn Andersson 2015-09-24  150 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  151  	/* Update the entry */
c97c4090ff7229 Bjorn Andersson 2015-09-24 @152  	val =3D orig =3D readl(sms=
m->local_state);
c97c4090ff7229 Bjorn Andersson 2015-09-24  153  	val &=3D ~mask;
c97c4090ff7229 Bjorn Andersson 2015-09-24  154  	val |=3D value;
c97c4090ff7229 Bjorn Andersson 2015-09-24  155 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  156  	/* Don't signal if we didn=
't change the value */
c97c4090ff7229 Bjorn Andersson 2015-09-24  157  	changes =3D val ^ orig;
c97c4090ff7229 Bjorn Andersson 2015-09-24  158  	if (!changes) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  159  		spin_unlock_irqrestore(&s=
msm->lock, flags);
c97c4090ff7229 Bjorn Andersson 2015-09-24  160  		goto done;
c97c4090ff7229 Bjorn Andersson 2015-09-24  161  	}
c97c4090ff7229 Bjorn Andersson 2015-09-24  162 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  163  	/* Write out the new value=
 */
c97c4090ff7229 Bjorn Andersson 2015-09-24  164  	writel(val, smsm->local_st=
ate);
c97c4090ff7229 Bjorn Andersson 2015-09-24  165  	spin_unlock_irqrestore(&sm=
sm->lock, flags);
c97c4090ff7229 Bjorn Andersson 2015-09-24  166 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  167  	/* Make sure the value upd=
ate is ordered before any kicks */
c97c4090ff7229 Bjorn Andersson 2015-09-24  168  	wmb();
c97c4090ff7229 Bjorn Andersson 2015-09-24  169 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  170  	/* Iterate over all hosts =
to check whom wants a kick */
c97c4090ff7229 Bjorn Andersson 2015-09-24  171  	for (host =3D 0; host < sm=
sm->num_hosts; host++) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  172  		hostp =3D &smsm->hosts[ho=
st];
c97c4090ff7229 Bjorn Andersson 2015-09-24  173 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24 @174  		val =3D readl(smsm->subsc=
ription + host);
c97c4090ff7229 Bjorn Andersson 2015-09-24  175  		if (val & changes && host=
p->ipc_regmap) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  176  			regmap_write(hostp->ipc_=
regmap,
c97c4090ff7229 Bjorn Andersson 2015-09-24  177  				     hostp->ipc_offset,
c97c4090ff7229 Bjorn Andersson 2015-09-24  178  				     BIT(hostp->ipc_bit=
));
c97c4090ff7229 Bjorn Andersson 2015-09-24  179  		}
c97c4090ff7229 Bjorn Andersson 2015-09-24  180  	}
c97c4090ff7229 Bjorn Andersson 2015-09-24  181 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  182  done:
c97c4090ff7229 Bjorn Andersson 2015-09-24  183  	return 0;
c97c4090ff7229 Bjorn Andersson 2015-09-24  184  }
c97c4090ff7229 Bjorn Andersson 2015-09-24  185 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  186  static const struct qcom_sm=
em_state_ops smsm_state_ops =3D {
c97c4090ff7229 Bjorn Andersson 2015-09-24  187  	.update_bits =3D smsm_upda=
te_bits,
c97c4090ff7229 Bjorn Andersson 2015-09-24  188  };
c97c4090ff7229 Bjorn Andersson 2015-09-24  189 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  190  /**
c97c4090ff7229 Bjorn Andersson 2015-09-24  191   * smsm_intr() - cascading =
IRQ handler for SMSM
c97c4090ff7229 Bjorn Andersson 2015-09-24  192   * @irq:	unused
c97c4090ff7229 Bjorn Andersson 2015-09-24  193   * @data:	entry related to =
this IRQ
c97c4090ff7229 Bjorn Andersson 2015-09-24  194   *
c97c4090ff7229 Bjorn Andersson 2015-09-24  195   * This function cascades a=
n incoming interrupt from a remote system, based on
c97c4090ff7229 Bjorn Andersson 2015-09-24  196   * the state bits and confi=
guration.
c97c4090ff7229 Bjorn Andersson 2015-09-24  197   */
c97c4090ff7229 Bjorn Andersson 2015-09-24  198  static irqreturn_t smsm_int=
r(int irq, void *data)
c97c4090ff7229 Bjorn Andersson 2015-09-24  199  {
c97c4090ff7229 Bjorn Andersson 2015-09-24  200  	struct smsm_entry *entry =
=3D data;
c97c4090ff7229 Bjorn Andersson 2015-09-24  201  	unsigned i;
c97c4090ff7229 Bjorn Andersson 2015-09-24  202  	int irq_pin;
c97c4090ff7229 Bjorn Andersson 2015-09-24  203  	u32 changed;
c97c4090ff7229 Bjorn Andersson 2015-09-24  204  	u32 val;
c97c4090ff7229 Bjorn Andersson 2015-09-24  205 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24 @206  	val =3D readl(entry->remot=
e_state);
c97c4090ff7229 Bjorn Andersson 2015-09-24  207  	changed =3D val ^ entry->l=
ast_value;
c97c4090ff7229 Bjorn Andersson 2015-09-24  208  	entry->last_value =3D val;
c97c4090ff7229 Bjorn Andersson 2015-09-24  209 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  210  	for_each_set_bit(i, entry-=
>irq_enabled, 32) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  211  		if (!(changed & BIT(i)))
c97c4090ff7229 Bjorn Andersson 2015-09-24  212  			continue;
c97c4090ff7229 Bjorn Andersson 2015-09-24  213 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  214  		if (val & BIT(i)) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  215  			if (test_bit(i, entry->i=
rq_rising)) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  216  				irq_pin =3D irq_find_ma=
pping(entry->domain, i);
c97c4090ff7229 Bjorn Andersson 2015-09-24  217  				handle_nested_irq(irq_p=
in);
c97c4090ff7229 Bjorn Andersson 2015-09-24  218  			}
c97c4090ff7229 Bjorn Andersson 2015-09-24  219  		} else {
c97c4090ff7229 Bjorn Andersson 2015-09-24  220  			if (test_bit(i, entry->i=
rq_falling)) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  221  				irq_pin =3D irq_find_ma=
pping(entry->domain, i);
c97c4090ff7229 Bjorn Andersson 2015-09-24  222  				handle_nested_irq(irq_p=
in);
c97c4090ff7229 Bjorn Andersson 2015-09-24  223  			}
c97c4090ff7229 Bjorn Andersson 2015-09-24  224  		}
c97c4090ff7229 Bjorn Andersson 2015-09-24  225  	}
c97c4090ff7229 Bjorn Andersson 2015-09-24  226 =20
c97c4090ff7229 Bjorn Andersson 2015-09-24  227  	return IRQ_HANDLED;
c97c4090ff7229 Bjorn Andersson 2015-09-24  228  }
c97c4090ff7229 Bjorn Andersson 2015-09-24  229 =20

:::::: The code at line 152 was first introduced by commit
:::::: c97c4090ff72297a878a37715bd301624b71c885 soc: qcom: smsm: Add driver=
 for Qualcomm SMSM

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Andy Gross <agross@codeaurora.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

