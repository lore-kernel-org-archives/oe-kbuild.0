Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50CC6FA2
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 01:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJANMitG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701308650; x=1732844650;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=H9RwYUEAOCxAdsRUtVMiMpS7iRfkYO7VzPQbaend3QE=;
  b=QJANMitGUyt9kjErl3eNhOzJUYh3BFWkrqN3jX/n9WazXaIxiHkttrJ5
   UEtE+rG0vxP53pVgwUvVZpQE/LNXTN6vOosLedcfEYfCQqFlnWHrgrGAV
   kYjBJo1qbClWoJ20tEToncl3lx7jLX84cm5s/FOZsEiLmmtOzVC1WNcw5
   2Qh00wVSzht31KjDZIJdhgJROkafgeAfJP4yEZmIHwyU/BKnL9H1dgIY6
   TKhkdguuy/2uSUBw1oADKPqf1lbgcubbstHL2XRg73nOcmRlzaxsVVUMr
   D02iHoaSJuMv2Xtw7xyNXmIMfErTcPt/CP9QOvUR1T55U9NnrIZvxfltp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11956658"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11956658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 17:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718941141"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="718941141"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Nov 2023 17:44:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:44:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:44:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:44:08 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:44:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2VfpcPWgBTwubzpasl6dTLvqCZApY8TnxAaHVGz+83gdo9uXY5p63jxWRH6exQdVSZ6J2TsYTCHq6FCW22lX08y5+PuJ3ZrXvL7easWw5U1Ej5I0JF2vkhJ+3jhY1oXeoT9m68NOVzgNhzrzsvk2tFNS9FMfUSFL7joy69IU0Tg9Z9N+YSQnbwTIfDz4jjrdN+9X2MGslIqKsIxHsMLDw8X4tBfkDDCfzAqHCFMMA4p0nVolzQtES7+5DwCqtlVaBlrW1Coh6OmK4mu7tUYJblbNNoDqe0zbkTlQx1fUr0DberPyZMd5n7BzcCs8LlfVN8aMvqXOOAVjvxQiSKG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtNaDp814xKc9wtLuXC2D1UGss2tZKST3jrpRqBFLqo=;
 b=bAwLHsgqrIZnSW6eej7LDVHK0hGzgfHJPsP6EOrV+FQNDSlzGxDOPzuH+m4yPvrjuOuJmPcRnY7W2B7SKnThn0xJ//OwT6wd3v1/U+N+FZVn0/Li7s0dH6DmXGnlMP9xAFghbQxSktsR9CBof4a5abF80tQuSYP4+24kdYhjJgOSy4GSUm7p6hsI8ns9OD/Bca+z9LzBGqXJ/J4qhTfa95kLNorDjqI9NJy8DQrYAAcbrO7vnmHIreDfHlJPPmmc53UH4WZTa+M98Xx69MmObTTlF7CbyjrbclXyQ+HuRhn6GDRCAFLodwndRfm/LPZAM/3YgdFIO9axO+Rk9f8IJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 01:44:05 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 01:44:05 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/base/power/runtime.c:365: warning: Excess function
 parameter 'dev' description in '__rpm_callback'
Thread-Topic: drivers/base/power/runtime.c:365: warning: Excess function
 parameter 'dev' description in '__rpm_callback'
Thread-Index: AQHaIvKPeU3bH0M+kkqgrqzOKjo1OrCSFw3w
Date: Thu, 30 Nov 2023 01:44:04 +0000
Message-ID: <CY5PR11MB6392C531718D123EFD750BDDFB82A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311300112.x5xFd09N-lkp@intel.com>
In-Reply-To: <202311300112.x5xFd09N-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|MW5PR11MB5785:EE_
x-ms-office365-filtering-correlation-id: 3d479bb0-42fb-408a-56ac-08dbf145d5e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yAW6cADRAup3NpIB7QDCeHtCIW1JKWK9rcUzLjDEAOFNRPKFD9rVA2it0CJfFh8UbdyGJYMggOPHo0apgTqoRxNk+sf5rLRGqfVS6Itdrd+gH0hrUslIRMRlipl/qSLv9UX3dW43Ae6/6JkcQeAqlLy5ylOEAAarHzOJdGXtg2pF6nHRTRkU5n5yjfu5IrSCSl1q+uCAwWpzCtbxFLS5bXyVRtaMXrBJq3Pn6uBa22GZ+bx/yifTRN87BWitY3jcYzu0ADthy2tzv0h2tXo+s5RnTiRh4+6MbBtD46CWSJFmt3TUZmxDDLXNh20QHIFYObzBJ+UOD+1j0cdddzOa7VQ0hPlXhgF2nd5JGvhh4xBXX+/+ZbVTPorMNspkFAePyZgfBfcO2dlpvWpcOS5bvunb8OOstf7Wt3aWpOQsZVIu5/MyPzNaTJS5mWrMuFV+OcGJ36yC5eRP9c45SMtBjlC0HnjZkAfhcD0X7dvEHcyu/iSFIfqkzKK39h1a7W1x5utvEjyzwF+xyLzn+zKMe2nVLrjsIgo6BH9lpuyufOOtZsetnPXKoM4QLdKqz3G6z48y4l2gCZwzByUBpyGOodUkWkpioRZ5rX8NA74Vvu4GGp1BgGmwYT6Dz1+Uz9BXeeDPuG+WbYPMDkfJqfkJlfAV5H+KRTeZwkTuDLr9H/6esSEq4ZyH0TxEiCPbnYRKjVhq5QWJU4NBW91kr5Mv2Fvj5lVRuOUEC/YkM97iul4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(53546011)(82960400001)(966005)(122000001)(76116006)(8936002)(66946007)(478600001)(41300700001)(66556008)(8676002)(7696005)(66446008)(64756008)(86362001)(38100700002)(6506007)(26005)(110136005)(316002)(33656002)(66476007)(83380400001)(71200400001)(9686003)(52536014)(202311291699003)(38070700009)(2906002)(4001150100001)(55016003)(30864003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qRvplYHeVuvHerMqqvuTDdMTFvTMdu+i6uHh7SGbbEdtfMCGhtmfhneuXlAI?=
 =?us-ascii?Q?hYYxquW14o/+EVQyqAhLVuDdXRHUw1pDbg0F5PqDCpbrURb8u/0Su21V+rFz?=
 =?us-ascii?Q?TefjbWtEIDuGPzLAu6RhsytjgizKGdbHnlJkXo0NOJrhekLRnV6xxigGRK7b?=
 =?us-ascii?Q?njiHVlUkWZqRpy1+E6dWJqaph6HNReXd6scxBAuQ7pQnliuPYT+0DrbPN09l?=
 =?us-ascii?Q?kc67LIVVKDhxHO4fix1mw9gpDAZUaXVLDhUErXysJIg5bTWfVMvDbnAT6fat?=
 =?us-ascii?Q?tzBT9cszI9iKRfoxXBtkfMRmPrHgNbDRaS6XYkb12udw1jBo9cZo+rjgyPBk?=
 =?us-ascii?Q?sZz/qTtXq6aKRkCUZgnKOCoLwocQ2MZBp45nKBu0kK6xvsjG4M4GVbrLB815?=
 =?us-ascii?Q?63jCu8FPtj4EAExKQgqazgbRWHoeZe2kAB7YLZ5oHCUYghwIewFMWFvwhAuS?=
 =?us-ascii?Q?w4rUo/oFUmqhn3H6ePm2spwyXyoNMnxGRu0/HGD0D09g536D5THdDc6Oq/Fz?=
 =?us-ascii?Q?5SOCaa++/lht6L75/blV3rZOIKpwoEzmaG5K90C9yeCmSCG+34OCBf2Cqqg2?=
 =?us-ascii?Q?90ASVlaqJvioYjV/P8RcFJ0Xn4LiBh+9JWdJWJ6q0n3NBXmanE4RzjwlXQwD?=
 =?us-ascii?Q?tXUjb46wEbtPv+eGVy3hE/RZOC4rla5wLffmxHK1mxL08Xy6QyB788ht8t6P?=
 =?us-ascii?Q?BzmllnzGL/MG/AKdG6lccxaTWTnT0EG2I/HVZVmdlc0iVIFsfGxSITn08C2D?=
 =?us-ascii?Q?wvmGH3CZvkP+8hDgFc+VOC0s9iKd+sPfZhG/D7NAgaUsPV30hWr7Diyredp0?=
 =?us-ascii?Q?5iGubB5eGR9qBgUuK162WE9RDJKWMRN5vcNYzybUuIehCQypRxGUzo2s89pM?=
 =?us-ascii?Q?ifF7q076jYrb2fAGYnsDyRG9zISEpbCMmvthsgxqvwKMDZfXs+K4R1RqFP7y?=
 =?us-ascii?Q?DgQr+7kMZlW8dUTDmmIDaBZvhTF4C7rfrR/wSjDvajt8s8C8DLmYHU1IWs/q?=
 =?us-ascii?Q?boOv9nv9gtEPJcm6Q1s52QPOgJfm9RA4LqkXJ5xgbwVXIE9sWH+zAkI0ulXe?=
 =?us-ascii?Q?TLapScJQHkBJRkdOfmIzm1EYQIl6No+3jPVwnj9H2OaTVmpbYVA9hkEvwhnc?=
 =?us-ascii?Q?kyGFNt5+yX4XOSfNhv5QMwGoaI8sAYKwe9D+z+9SwV4/5KRHdzAE8iOLaKLy?=
 =?us-ascii?Q?FDa9ZJKZlZ6nyOQULDQcF+ssNKePul0Ad4UQGKdU59dVMsecIPsIFbU+CUn6?=
 =?us-ascii?Q?mAMa7ecQhhJaLw/8V8wWCOIJXoMIBuma3Nu5i4wbX8UK9YLfdMqUP7rGUKjK?=
 =?us-ascii?Q?cdsn4y4DLb2unRVY83vnXgZvZQi0yN08GlOjiuf6k9gDMoHTiv//i2374eQf?=
 =?us-ascii?Q?VgAE5TzKpSBkQVauHJ2AdXXluylruTOK0KBzNN0baO1FH148CwTjeW3k7kbv?=
 =?us-ascii?Q?aqyMymLftleB8vL0fktXEpGmRzw6FAyw2DovqA98mrFma71VQZRyYa6j8ALR?=
 =?us-ascii?Q?onV8yOT76fudpyOmaEd3YWdu8UGPka/55Pm2wKMKpi0aFUvzU9ubnB8CXz0j?=
 =?us-ascii?Q?e4gFRIe9qRfs1nG6t6lAEROIcJODng35TJ+542Mk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d479bb0-42fb-408a-56ac-08dbf145d5e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 01:44:04.6665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LrKSxqOblmNcd/XY43QIhL+RlNYvWJmg+LoPk5IjpyVpkEX7LSXQZ449Q42zPpqqHVafkRxEqyEyXFHXhJz3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
X-OriginatorOrg: intel.com

not_report

This commit only changes loongarch-specific files. No relation with the war=
ning in this report.

$ git show --stat 366bb35a8e48198cefcd3484ac6b2374d1347873
arch/loongarch/Kconfig                |  5 +++++
 arch/loongarch/Makefile               |  3 +++
 arch/loongarch/include/asm/acpi.h     | 10 ++++++++++
 arch/loongarch/include/asm/bootinfo.h |  1 +
 arch/loongarch/include/asm/loongson.h |  3 +++
 arch/loongarch/include/asm/time.h     |  1 +
 arch/loongarch/kernel/acpi.c          |  6 ++++++
 arch/loongarch/kernel/smp.c           |  1 +
 arch/loongarch/kernel/time.c          | 11 ++++++++---
 arch/loongarch/power/Makefile         |  3 +++
 arch/loongarch/power/platform.c       | 57 +++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++
 arch/loongarch/power/suspend.c        | 73 +++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++
 arch/loongarch/power/suspend_asm.S    | 89 +++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 13 files changed, 260 insertions(+), 3 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 30, 2023 02:32
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/base/power/runtime.c:365: warning: Excess function paramet=
er 'dev' description in '__rpm_callback'

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/base/power/runtime.c:365: warning: Excess function parameter 'dev'=
 description in '__rpm_callback'"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 366bb35a8e48198cefcd3484ac6b2374d1347873 LoongArch: Add suspend (AC=
PI S3) support
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci=
/archive/20231130/202311300112.x5xFd09N-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300112.x=
5xFd09N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311300112.x5xFd09N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/runtime.c:365: warning: Excess function parameter 'de=
v' description in '__rpm_callback'
--
>> drivers/base/power/domain_governor.c:409: warning: cannot understand fun=
ction prototype: 'struct dev_power_governor pm_domain_always_on_gov =3D '

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/nvs.c:140:54: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void volatile [noderef] __iomem =
*addr @@     got void *kaddr @@
   drivers/acpi/nvs.c:140:54: sparse:     expected void volatile [noderef] =
__iomem *addr
   drivers/acpi/nvs.c:140:54: sparse:     got void *kaddr
>> drivers/acpi/nvs.c:143:66: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void [noderef] __iomem *virt @@ =
    got void *kaddr @@
   drivers/acpi/nvs.c:143:66: sparse:     expected void [noderef] __iomem *=
virt
   drivers/acpi/nvs.c:143:66: sparse:     got void *kaddr
>> drivers/acpi/nvs.c:182:38: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected void *kaddr @@     got void [nod=
eref] __iomem * @@
   drivers/acpi/nvs.c:182:38: sparse:     expected void *kaddr
   drivers/acpi/nvs.c:182:38: sparse:     got void [noderef] __iomem *
   drivers/acpi/nvs.c:184:46: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected void *kaddr @@     got void [nod=
eref] __iomem * @@
   drivers/acpi/nvs.c:184:46: sparse:     expected void *kaddr
   drivers/acpi/nvs.c:184:46: sparse:     got void [noderef] __iomem *
--
>> drivers/acpi/sleep.c:556:46: sparse: sparse: restricted suspend_state_t =
degrades to integer
   drivers/acpi/sleep.c:656:50: sparse: sparse: restricted suspend_state_t =
degrades to integer
--
>> kernel/power/main.c:133:34: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:133:38: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:134:21: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:134:26: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:136:38: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:137:62: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:133:55: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:162:38: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:162:46: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:163:54: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:162:67: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:182:31: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:182:36: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:188:13: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:188:21: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:188:39: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:188:47: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:579:34: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:579:38: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:580:31: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:581:57: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:579:55: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:608:38: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:608:46: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:609:47: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:608:67: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:629:31: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:629:36: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:635:13: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:635:21: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:703:31: sparse: sparse: restricted suspend_state_t d=
egrades to integer
   kernel/power/main.c:703:36: sparse: sparse: restricted suspend_state_t d=
egrades to integer

vim +365 drivers/base/power/runtime.c

21d5c57b372616 Rafael J. Wysocki 2016-10-30  357 =20
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  358  /**
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  359   * __rpm_callback - Run a=
 given runtime PM callback for a given device.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  360   * @cb: Runtime PM callba=
ck to run.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  361   * @dev: Device to run th=
e callback for.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  362   */
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  363  static int __rpm_callback=
(int (*cb)(struct device *), struct device *dev)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  364  	__releases(&dev->power.l=
ock) __acquires(&dev->power.lock)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27 @365  {
63d00be69348fd Ulf Hansson       2021-06-08  366  	int retval =3D 0, idx;
0cab893f409c53 Rafael J. Wysocki 2021-03-19  367  	bool use_links =3D dev->=
power.links_count > 0;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  368 =20
21d5c57b372616 Rafael J. Wysocki 2016-10-30  369  	if (dev->power.irq_safe)=
 {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  370  		spin_unlock(&dev->power=
.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  371  	} else {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  372  		spin_unlock_irq(&dev->p=
ower.lock);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  373 =20
0cab893f409c53 Rafael J. Wysocki 2021-03-19  374  		/*
0cab893f409c53 Rafael J. Wysocki 2021-03-19  375  		 * Resume suppliers if =
necessary.
0cab893f409c53 Rafael J. Wysocki 2021-03-19  376  		 *
0cab893f409c53 Rafael J. Wysocki 2021-03-19  377  		 * The device's runtime=
 PM status cannot change until this
0cab893f409c53 Rafael J. Wysocki 2021-03-19  378  		 * routine returns, so =
it is safe to read the status outside of
0cab893f409c53 Rafael J. Wysocki 2021-03-19  379  		 * the lock.
0cab893f409c53 Rafael J. Wysocki 2021-03-19  380  		 */
0cab893f409c53 Rafael J. Wysocki 2021-03-19  381  		if (use_links && dev->p=
ower.runtime_status =3D=3D RPM_RESUMING) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  382  			idx =3D device_links_r=
ead_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  383 =20
21d5c57b372616 Rafael J. Wysocki 2016-10-30  384  			retval =3D rpm_get_sup=
pliers(dev);
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  385  			if (retval) {
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  386  				rpm_put_suppliers(dev=
);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  387  				goto fail;
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  388  			}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  389 =20
21d5c57b372616 Rafael J. Wysocki 2016-10-30  390  			device_links_read_unlo=
ck(idx);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  391  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  392  	}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  393 =20
63d00be69348fd Ulf Hansson       2021-06-08  394  	if (cb)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  395  		retval =3D cb(dev);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  396 =20
21d5c57b372616 Rafael J. Wysocki 2016-10-30  397  	if (dev->power.irq_safe)=
 {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  398  		spin_lock(&dev->power.l=
ock);
0cab893f409c53 Rafael J. Wysocki 2021-03-19  399  	} else {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  400  		/*
0cab893f409c53 Rafael J. Wysocki 2021-03-19  401  		 * If the device is sus=
pending and the callback has returned
0cab893f409c53 Rafael J. Wysocki 2021-03-19  402  		 * success, drop the us=
age counters of the suppliers that have
0cab893f409c53 Rafael J. Wysocki 2021-03-19  403  		 * been reference count=
ed on its resume.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  404  		 *
0cab893f409c53 Rafael J. Wysocki 2021-03-19  405  		 * Do that if resume fa=
ils too.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  406  		 */
0cab893f409c53 Rafael J. Wysocki 2021-03-19  407  		if (use_links
0cab893f409c53 Rafael J. Wysocki 2021-03-19  408  		    && ((dev->power.run=
time_status =3D=3D RPM_SUSPENDING && !retval)
0cab893f409c53 Rafael J. Wysocki 2021-03-19  409  		    || (dev->power.runt=
ime_status =3D=3D RPM_RESUMING && retval))) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  410  			idx =3D device_links_r=
ead_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  411 =20
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  412  			__rpm_put_suppliers(de=
v, false);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  413 =20
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  414  fail:
21d5c57b372616 Rafael J. Wysocki 2016-10-30  415  			device_links_read_unlo=
ck(idx);
0cab893f409c53 Rafael J. Wysocki 2021-03-19  416  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  417 =20
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  418  		spin_lock_irq(&dev->pow=
er.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  419  	}
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  420 =20
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  421  	return retval;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  422  }
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  423 =20

:::::: The code at line 365 was first introduced by commit
:::::: ad3c36a534bc7b945d7bffdda1c62e13bf93489a PM / Runtime: Don't run cal=
lbacks under lock for power.irq_safe set

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

