Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6A4C8A
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 01:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLoYn+pL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699837973; x=1731373973;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MDhYgANQlm/86wAT1MxkZQOZVZJocVPX/jIQoWXZ594=;
  b=FLoYn+pLIeaOM7bfIvYMxRaH1lWYJOa2FY6zQ3ieTqXOW0QdgjohMYPL
   DQTiVMF4w3wZPoTbQp71fRyL2pZIusRa8v4b1wxjMhYqM1aGwXdgXrtcK
   8xzmCZtzpQTiSiSgm6c5e1Kd9p2yTzNlQIddZxod2J7Mb8UWnpfgRbk8W
   zQkmg6oLxyw7i44dnN2ci12ttsYiAhlexPh8V77yV0EMDWCeggX14XzEt
   sL302Ich1qubo9Y8/m37m6GG7KEyxMV/ZFp2YVgobsG16orGpJ4RzbP2I
   sAsoES1NbuDBuQjh0uo/th3yJyJnN7JGYSqjzQM01tMjpXlDOPNJYAL0E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369692211"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="369692211"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 17:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="854832641"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="854832641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 17:12:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:12:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:12:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 17:12:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 17:12:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0PMSEBSApODVIKULymYufVxkzkAnd7OGj6XYnZU1W88VCDzzvsxOMT35SytZkkplrI9A4/P5XSDvmc7gRyoP18o8LrZKrkq5XeDu53PJtrqfxxqwGg2g5fRzy/0HOooeb20cTD7kRIzQRDYCQYOQu/EwRiE7vg4wcOAsqunHkoOBUBPVDmcOcnqzL1P958YxUFpTZT06XzdjcWrLT8gpBVJq4r5sbDb5OLxvcVBDLQum/mGSlY2r1iIqbjfdGjZAdCJt8RMQUz+LojgeDFkoh1MUdIb5qjDSORFXwKZxTkdhOX4hu2yzlbtzgjFYw/prOaOWA3DbNEtvBBw2EfF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amGAPvhSyiOK4PfPDNbq3WKCA6VmJx8rMWpP6hAfMzI=;
 b=YFOaSTg7rheWgoKcMAeuS2jgSb/GIve+EMp1ZlxYHSk1fiQaEseFOJCYHOFrJ5IqwcCBG+sdFf3kvgxYEhHoLBL2ENk2MXGfO3BL9ElDmQhzVtaVAPPzqWYBH531lOH3Oq8AZ5UpulX9I9KMnlEBpXd0NpE1vIpXwTWpT3LM1SrdOQMJjAv1HkxsyXRVSP/7Oum8/5MS0nb5cXyxW2S7EOafqgtSb4+Nl1+dHyIBsVdnRBjCt1lWrS9igmmAaOjwhQhpNCVoJBsgsmowrecuJfU9FRlzswIPKoQUrCmSca1VaXxzYuDffnztn+d9xG/5B54zb+rcDqdxjBawCz2b9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:12:47 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 01:12:47 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Thread-Topic: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Thread-Index: AQHaFD0Ag2lLvGa1j0KynAYZBTQBn7B3c5cQ
Date: Mon, 13 Nov 2023 01:12:47 +0000
Message-ID: <CY5PR11MB6392313EE130192A1D474A93FBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311110900.lQTbNjdT-lkp@intel.com>
In-Reply-To: <202311110900.lQTbNjdT-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6722:EE_
x-ms-office365-filtering-correlation-id: 1b46ffa8-5249-4d21-5053-08dbe3e5a5fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jaLgprHeJUF6ya/k4CZPRDa7uMGucT/9Tzxq1STFA0kwrrXKVeDo9faHlf+kJZYSa9cRItDGH75chptCom3zuGIPej9QtpwpJWE3aSClpP5DfPXHt/CKXfquPGTwcupBdheXRh/4oAvgYuOMDnLQKFCiWbgiwW7hbcwqLoTpBmPTI3902fzyncYIjOWKLMe4tPIQKqfj8UCjX5/54DtpfCNrCKV6EMGGCZKr5NmAt6qTB71iApMUI10vqD81zUx/lWr5tUEWgnCTBe1OA8cDNQ0QEnRlsFuR0H/Cx9GbrRMbNqWfDbBwZLwLxth+cEmwfH3kYPHfWOdvt611bJ8czN5kfd/fPQDE3KhzZ8C6VqrukcZxox06dY/4STfx8p2nWUxobwXcOA5bYhaEh+Fe7xlX26eWcISVaV7p7cnmsr2INBSX3N5l8UKTdVcXYH6I+cSQBXJ9Ee7GQlLv+xQi7dqKBpO2wks78QYPQsa9iUUekCWYgh9dm5cdpUhIc6U+tVLeINodzt4nWjvxqgeNf+oXJOaNxdziclhD1YFqcpe3WoeGK7aZ71Wo8tTibun72k7IbITiHUPH7JmXI7DKYKzRBvevU5wvjLcnuoDTM5Yxy5YhwXM/X1y6wo8gLceUlzVgF71eOVkJ8zTUwwLBxnE//ICRh2MrAIP20WRKjv9eOp7BKIqzNN6FHNUZtQa3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230273577357003)(230922051799003)(230173577357003)(1800799009)(64100799003)(186009)(451199024)(26005)(53546011)(6506007)(7696005)(71200400001)(9686003)(83380400001)(5660300002)(8676002)(8936002)(52536014)(41300700001)(30864003)(2906002)(966005)(478600001)(316002)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(82960400001)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q2xl3VhXxxkFUg0sjkeZU3HALyeP8OjMkd4lh+IwDu0SSNfMVs8U1OjtBbnh?=
 =?us-ascii?Q?LrOMlSCHmKiXUPApulVpl8F1W7n5rq+j7ygMAig+5wkFOsTfyiQ4IhFfNvlB?=
 =?us-ascii?Q?j3z1lJDHU45ySfEf6Q8GYV05fOx60+LNyRDP1YUDjYMz+uk3KW/9pUo/O9c1?=
 =?us-ascii?Q?hXRlNqlfwrv1e4tXz5zvL9LcohxsPW5O0XlILLmOCdiC/X5KJGzIChaaXjk7?=
 =?us-ascii?Q?81bCdmUmjs+D+g84ugxqzBt3f/g5pPu6uYYNmHXSAj0O6aWqCKQQfPzMlT/f?=
 =?us-ascii?Q?rNlSkYncuqA4FDMQL5WEHykeZPevY4g3xdD2R2gwacILKX47cqEvkszC45ca?=
 =?us-ascii?Q?5ZXjHUdrQ+mLquLSkrHO3iu/1MS3G/9ZHHsMduAkVhyJWpbVRBJoh/1gXdZS?=
 =?us-ascii?Q?A70QLR42yRh7fOLQFb/ir0qnM/V3mOtka0Cfhe29m4QqwJFMqcSoLFzN+nNr?=
 =?us-ascii?Q?k4U7o9D+Q6WE8ObLpdILL4bIeji0hsG0U6GT4+hn2mn4QWzXZo2PPGtdwvGB?=
 =?us-ascii?Q?2FtWhq5fd0AsUvQih08TXXHrZFc7y2g7/fydfbxLBOOHs6dEtTL4CoDtikvt?=
 =?us-ascii?Q?H1dVjueW/4JD0xkkhA0MVnoSlO28f2RlTrG70ctL/5ICFvgYMGmmAZVZTH05?=
 =?us-ascii?Q?M16DMxnjcvbm5WK9EHUyGpjTRv0r6kxuxDko92yCyt7e6DEUlZZd19Jr1yV4?=
 =?us-ascii?Q?7opaKun9rbbSjqBrncuMUFZTjJwAQ0fhNQjJlorhHHOapTvNGzGrhieitzbE?=
 =?us-ascii?Q?j0wxk/dmtlKVJ4FvODJWqqV2beXcExhnNMrtrP/9BzV9tG3PtIcLfN4oywqW?=
 =?us-ascii?Q?ldVJOr1ETBAJwcHSuApg3qG2odpZC96Lyti26iK55N8h0PJgR3Nubc8vusv/?=
 =?us-ascii?Q?Ho1IOhCDQpRxKk3hKJ9xvZ+i0E0QxC5z+jr6d9ofBCOLuag2QRMJL+kcfzl/?=
 =?us-ascii?Q?w/bDPT87ZWidfz85Ku0M3HYBV+MRrd2EyavDgO4fxcfMI3axtitro3tzRXdJ?=
 =?us-ascii?Q?WyR4q/7K66cDDDtlsfOEstq7Hy8cPMws0bjSpKx4H36q6o7CGLOvYI6UImcD?=
 =?us-ascii?Q?GxaPj+yUpKT/muPSk16cbHIl8tjKbbCj3ZXdW3UCPNkXWgOJzKdxO0Z8SztX?=
 =?us-ascii?Q?l4BgkDayuIqFLZ2YbdcodJgJ3sYS8MYeeK+ItEfJ2yBYLhvfgEY6UiM4x238?=
 =?us-ascii?Q?WKE8TBdg3061NL75z+08e1lKtLEASyogTa1wYSsyD1+Ju3OSrn9AfwlKIQU1?=
 =?us-ascii?Q?vtQ7yab+BsoSHWF3P5iYz+OPm6ld5REO757bGXMvFyfpYNUzaTY0JKInMWXY?=
 =?us-ascii?Q?Redefw4m3gokTaEa2vngCzu2v1W2FfdtXFdhrW6GsxaRGCpq+oAdFDWgm6Jr?=
 =?us-ascii?Q?UZw8PRN31NQESpKF3HN6VjczKI+PTWgVmlIbPducl6pxO8+7+gpmmVlregca?=
 =?us-ascii?Q?J0p5gm3WCbG1nJBVOu+z2JEnskDnljaRNdCNnK3/ynqTobiZkmuu0IoKmW4Q?=
 =?us-ascii?Q?Md7HtP3dBzgh/lXfsmhHpQR1kxAN+lJihgnZ+onveWgs9OxUVfEuCtRRpBqa?=
 =?us-ascii?Q?T9t9DSCBBFCt4wvYEwFixr9COJMukI7sizUQ9SOC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b46ffa8-5249-4d21-5053-08dbe3e5a5fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 01:12:47.4581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eywi2M2D8M9gWPPP460dJcE8uNaOGnwJmzDWAKBnVhHUoubPFqCnlkofJmelgiIS0B93OrlpSNeYOOuG6ksq1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
X-OriginatorOrg: intel.com

not_report

Only kconfig file is changed. No relation with the "cast removes address sp=
ace '__user' of expression" sparse warning.

arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 11, 2023 09:16
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse: spar=
se: incorrect type in assignment (different address spaces)

::::::=20
:::::: Manual check reason: "low confidence bisect report"
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-121-20231111 (https://download.01.org/0day-ci/arc=
hive/20231111/202311110900.lQTbNjdT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231111/202311110900.lQTbNjdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110900.lQTbNjdT-lkp@intel.com/

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
   kernel/unwind/sframe.c:175:17: sparse: sparse: too many warnings

vim +94 kernel/unwind/sframe.c

09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   85 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   86  static int find_fde(struct =
sframe_section *sec, unsigned long ip,
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   87  		    struct sframe_fde *fd=
e)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   88  {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   89  	s32 func_off, ip_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   90  	struct sframe_fde __user *=
first, *last, *mid, *found;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   91 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   92  	ip_off =3D ip - sec->sfram=
e_addr;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   93 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  @94  	first =3D (void *)sec->fde=
s_addr;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   95  	last =3D first + sec->fdes=
_num;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   96  	while (first <=3D last) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   97  		mid =3D first + ((last - =
first) / 2);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  @98  		if (get_user(func_off, (s=
32 *)mid))
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   99  			return -EFAULT;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  100  		if (ip_off >=3D func_off)=
 {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  101  			found =3D mid;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  102  			first =3D mid + 1;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  103  		} else
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  104  			last =3D mid - 1;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  105  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  106 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  107  	if (!found)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  108  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  109 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  110  	if (copy_from_user(fde, fo=
und, sizeof(*fde)))
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  111  		return -EFAULT;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  112 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  113  	return 0;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  114  }
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  115 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  116  static int find_fre(struct =
sframe_section *sec, struct sframe_fde *fde,
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  117  		    unsigned long ip, str=
uct user_unwind_frame *frame)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  118  {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  119  	unsigned char fde_type =3D=
 SFRAME_FUNC_FDE_TYPE(fde->info);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  120  	unsigned char fre_type =3D=
 SFRAME_FUNC_FRE_TYPE(fde->info);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  121  	s32 fre_ip_off, cfa_off, r=
a_off, fp_off, ip_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  122  	unsigned char offset_count=
, offset_size;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  123  	unsigned char addr_size;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  124  	void __user *f, *last_f;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  125  	u8 fre_info;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  126  	int i;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  127 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  128  	addr_size =3D fre_type_to_=
size(fre_type);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  129  	if (!addr_size)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  130  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  131 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  132  	ip_off =3D ip - sec->sfram=
e_addr - fde->start_addr;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  133 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08 @134  	f =3D (void *)sec->fres_ad=
dr + fde->fres_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  135 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  136  	for (i =3D 0; i < fde->fre=
s_num; i++) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  137 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08 @138  		SFRAME_GET_USER_UNSIGNED(=
fre_ip_off, f, addr_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  139 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  140  		if (fde_type =3D=3D SFRAM=
E_FDE_TYPE_PCINC) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  141  			if (fre_ip_off > ip_off)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  142  				break;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  143  		} else {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  144  			/* SFRAME_FDE_TYPE_PCMAS=
K */
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  145  #if 0 /* sframe v2 */
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  146  			if (ip_off % fde->rep_si=
ze < fre_ip_off)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  147  				break;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  148  #endif
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  149  		}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  150 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  151  		SFRAME_GET_USER_UNSIGNED(=
fre_info, f, 1);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  152 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  153  		offset_count =3D SFRAME_F=
RE_OFFSET_COUNT(fre_info);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  154  		offset_size  =3D offset_s=
ize_enum_to_size(SFRAME_FRE_OFFSET_SIZE(fre_info));
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  155 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  156  		if (!offset_count || !off=
set_size)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  157  			return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  158 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  159  		last_f =3D f;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  160  		f +=3D offset_count * off=
set_size;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  161  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  162 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  163  	if (!last_f)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  164  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  165 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  166  	f =3D last_f;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  167 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  168  	SFRAME_GET_USER_UNSIGNED(c=
fa_off, f, offset_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  169  	offset_count--;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  170 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  171  	ra_off =3D sec->ra_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  172  	if (!ra_off) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  173  		if (!offset_count--)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  174  			return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08 @175  		SFRAME_GET_USER_SIGNED(ra=
_off, f, offset_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  176  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  177 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  178  	fp_off =3D sec->fp_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  179  	if (!fp_off && offset_coun=
t) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  180  		offset_count--;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  181  		SFRAME_GET_USER_SIGNED(fp=
_off, f, offset_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  182  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  183 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  184  	if (offset_count)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  185  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  186 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  187  	frame->cfa_off =3D cfa_off=
;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  188  	frame->ra_off =3D ra_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  189  	frame->fp_off =3D fp_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  190  	frame->use_fp =3D SFRAME_F=
RE_CFA_BASE_REG_ID(fre_info) =3D=3D SFRAME_BASE_REG_FP;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  191 =20
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  192  	return 0;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  193  }
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  194 =20

:::::: The code at line 94 was first introduced by commit
:::::: 09460e60dd1c2f8ea1abb8d9188195db699ce76f unwind: Introduce SFrame us=
er space unwinding

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

