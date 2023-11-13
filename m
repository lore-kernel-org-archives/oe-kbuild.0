Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5224402
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 01:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX4S9CwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699838427; x=1731374427;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qtksExCj1SiZGqyHNWNyYgXE05/nk/9yRbNZ9JBHtNI=;
  b=YX4S9CwYCjHoxyyX6cG7zEAfADxFRy00TqPYjPXN1je2XeTC1mM+PyK3
   Ptf6ZU+j47u72rqcomaVzeas5Awh4X/sZZLcQy3D3dkRA0i4K6T3IOJ9E
   TwZpUqHx52s5I/tsFlF3RsakDD+waQQ7l6W5XtINgbeSvcyO40w/nxyN+
   eOhOL2mE9H2OHjG1DyER6rzka3w2zpfVnQIC/yTZDujitjV5+V6jEXU6m
   ntTBDn6BpnMtoiLLC18Gwna2rGAHgDac5Pa8AQeS6V6Hmygc0ZUivD4/3
   x3WV8QoOAMwy2ia2NeJpeVeNWORdftc5svsV1pgdeiJUCDrV9Dch6kfC3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="394262214"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="394262214"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 17:20:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767771462"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="767771462"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 17:20:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:20:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 17:20:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 17:20:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKmEvNv72HgrFUZ3SWcW0102PQfaIDumlZrcwYK6mTW0rIeSYwE4tJSZBjcAinsAOR0y/Mc8A8KIYRQDyjOQQqaM3wCVJtyNM1fZyW6dUChMP/Bo1MQz5tD3XmvFFfzQ3DyMXYXO+iBtJAKBAe7GdQiO8fAl2bSSb/F41w0Hmtpc4DegyLXJZOAZmiyGDkE6HWnlNOP7odHa5M6074Irb5UNScUGx0UFBDxRS/2hvyS5QK1b4tuUmnvyA7JqEZp4ms3maRIIUr+Q2ZNAF1088oBr88f37Xx60qeU94YcRD8yDI+Mm4Afc9YICBvG6NT9L1fm58h+Sxhuy+QDECKMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XY40YGfozF1DendFuJkHIj3Ru7ECmJW0DsVaJmM7AgU=;
 b=X1+e8ykbkWe1lnGsXmT00DAtfhjRmt3Nz51CrT6NHoSa5AHZECkvzg9MdF/v+5T1SaOptLeKR71Mg2Mb3wu2Tff5uZQfl6z05R2BL8bstBbnNpYRQXK0LUbS+IRbt3tKODWUii6cBFLi4Yg1kJUWmLttNEPBPl+f+jBAhmGc1fS1ziZkN0lQs7QpBZJ+R4MsCRQM0ai6S18e6y4QP8BEC7RpGMR5B87tJdBavqrEYxvFmiGjDV5rsnrEYTIcAZiGIpwpxhVCvOm8S5f05cCjguKkh5vrQ/+GCcBWAoBpR6tW715TTERWRIysZX+GQXtw0kjoJkLw5LL3mXJqdUpacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Mon, 13 Nov
 2023 01:20:24 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 01:20:24 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [sudeep-holla:v6.7/ffa_integ_test 5/5]
 drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more than
 once.
Thread-Topic: [sudeep-holla:v6.7/ffa_integ_test 5/5]
 drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more than
 once.
Thread-Index: AQHaFB7sembbZN7aZkSquQK0iahcnLB3dSmA
Date: Mon, 13 Nov 2023 01:20:24 +0000
Message-ID: <CY5PR11MB6392D479A301537E51CE44E2FBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311110545.JOGoXeHY-lkp@intel.com>
In-Reply-To: <202311110545.JOGoXeHY-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6330:EE_
x-ms-office365-filtering-correlation-id: dd6453c7-b611-4592-d381-08dbe3e6b626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: swi2sa1RIyHswCoNTHLt7xOUczIgeuuoCQW2L1GUqDr3zlNqGo+r8IYDyl4ZJTm2EA1CHiBTiNM/0HUPsLmiAme7VT9swUOSzTBYiku98uaufER4EL2XWoqbz28bpN5fOBkchWoHuOCAoSYEui20wf0kUOlgxz78j6iv5fGT0yPGr4RCx+4S+1emmFjl/iQmTCGrkDGld4cwYilEihamWru+XG/w1uIvV3cG1yzv2NGSHTuwss/KRd35zJPT0n8AU9+zV52HikQy0qw3pyu0p2zeE9edEL9DiCY3IJV7JtLh0DMmY1YdZ7NpXSq5ITT5Qe2ocZ8w8gjZfLG5AH2tJL6Uv/JDqZxnKPXAEOrZleByCWABliUrr/Lan6dCIPKgON6XuwZstTiesmapTLW5tfYG7YvV+UkMQOIqeAR69d9MR/pA8eTBDgk8jEL8qOb+9RpF+YtRyLAUkcC3tWDLorD9C/oulBmbzlegcherau5OXfCehKp+NIrWzRT0tnvpr+WIARVDo7ey4d1yATZxSf9tWfwANLurSG9LDoeKWCgt3ksrYaurfOuIFBo77JDIlBAp0X8ddHpkXe9XXp5vMCrLK5e8Nvy/88IMRWeDAncVBBGD+kyEKiuombB2A1ACs5Tyfb++alUrKOjDBQHwMAgWvPmj79RKwM16PuN3zxNU96/iwL7SuAUtMUeeF9fK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(186009)(1800799009)(451199024)(64100799003)(66476007)(66446008)(66556008)(38100700002)(76116006)(316002)(110136005)(66946007)(64756008)(71200400001)(86362001)(966005)(33656002)(478600001)(9686003)(53546011)(38070700009)(7696005)(6506007)(41300700001)(5660300002)(55016003)(82960400001)(122000001)(8936002)(8676002)(2906002)(52536014)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QHpadShOA8orBpee5S+fDRwygcnTKWTEBMhXM2pmC9/EQIuiclyTHyK/wH5b?=
 =?us-ascii?Q?X7zp24/4O1HYZmyzD1TPYpFEH1Pmhc6jyEttF6avh9GAbrAfVvLuodcEyNNh?=
 =?us-ascii?Q?npbw7f4oBBv/c//Y6f6V8yqjfnyKAkHIz2igKunCalqymD3wcLE0OxHFyf9j?=
 =?us-ascii?Q?rLCZqpQi6kRlkIm9S8Y08ffBX5tmNytn0c7eNirasq19+wjLBcjKPygc/D+f?=
 =?us-ascii?Q?jO6aKxtDcuSOowDZLpxawixWEyxqhWSCG6G9vuSv1ktpijPr8yWoR+3beldI?=
 =?us-ascii?Q?vwMIhEbw+aB/gMsoYelrG7pwnhWomFAw0fA2sKmUwN7XAprCvtMyvb8jWDfG?=
 =?us-ascii?Q?esWQFGMwvhd8RgRAxFqjZQ3TndS+7hruwOcRVweM9XmrOYimM0uIAr1G31RM?=
 =?us-ascii?Q?NBXU6nMcNmI/BGgOIDZ4x5t9LPJf+M3iibgw4eOG7hiJ2k90pDh/+wZJtQYg?=
 =?us-ascii?Q?48rleDcrde4KZiUajAmii5dUpMpd7zlv/d4Y9OmAlu1zEICRcAkdcux69StR?=
 =?us-ascii?Q?wBHFEYSHFMqdw0g++6ErnY38Ilj/gdSmQZgvdWs0UWdKWybB69JqlLnyRedl?=
 =?us-ascii?Q?JlLIFxwKgaT9k0DDpsxVIqR1m5coI2B3ln/uxoi3+Bume+VwadD83y2nZQjC?=
 =?us-ascii?Q?HIRr5pEHgmzehM93Hq5RNM+Ordo0I5CnSk29jPctBqAGwFbdg8HbMTe1zoO/?=
 =?us-ascii?Q?QEdJFA0jsc/bdXi1JVMhYNC3MIVs/ElgJXodv+gcafdxNnY2x7aG0BzVOEze?=
 =?us-ascii?Q?WY9wLG3E/H+7TYlpIHAoXxo4vYESjQeI+6cwJ3nia7lbYobLXHD1duhEkKhm?=
 =?us-ascii?Q?41r8WTI7s1vT2d5epXRYxHvRWgiqbqtz9Weis0fOXODwXZwlOXp3gjeaM2zY?=
 =?us-ascii?Q?uNrYr0Gj8Jsd6OoT7gsVt8nlkDcx/Xiho553ktZIhYasNrHIAJKU4slA4LZF?=
 =?us-ascii?Q?rpMX9RqtYvzlcQ6m6WJMR/RtYTrIXhr9XXVKSxuuQ7w1H7FgVS1k31TV0ane?=
 =?us-ascii?Q?d3Z2DWismbNYVJZ7k5KDXoi4QuxXqGsnoU7pcj4pq0ZHei6Ppq1BVqpefAMw?=
 =?us-ascii?Q?L5iJXUajFe0qS2KipVGei81djnzFIczYT8EwDybe4lZqFwEKX/4fZRqt7/kz?=
 =?us-ascii?Q?oTx3s/XAtlJGjPkDWjWLtUCgyp4YUca/GtdKC8wckJWJGxwaqfNawXUamgXP?=
 =?us-ascii?Q?RTazG3ozsq6F1qSvDvKDR/+5OXa7HhFb1eoPaoS9y1N4PKhhGRWhqu2hPw3j?=
 =?us-ascii?Q?kbqh/yL9z19MSlAAsrpXHfUZipKIEE1PXMEiIFwvfSw2BQNVeceHFd93lxIQ?=
 =?us-ascii?Q?HiQv5+VUZ6aj9vJvUdw2p0nSOrqzN0ITdMxPhNfQZ9SHX9jpZ+ZdZewIJ+1+?=
 =?us-ascii?Q?RAwydlxmnu6e6t9gk8WbCV3Ms7nUWg7rhfIU8RSYY4DsocTj/SlFWvNr0Vb9?=
 =?us-ascii?Q?6TOjVJsoBgA1MrinrQqZw3eDYQB1zRjQ2btXNnWzXq9UBXffW1MkpGMcibNr?=
 =?us-ascii?Q?ZFSH8E0wqfXL6SLOAFZHnlxdp7qWZyMvumyrARPO02WDg7jXoLhLm5bMkc6A?=
 =?us-ascii?Q?uiv8SovdQWwLTBQuBCj7L/PSGpgbTMhGbOmu6Evi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6453c7-b611-4592-d381-08dbe3e6b626
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 01:20:24.0872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MejLxPktRad5HHa4I4q48LQ1FLKtONbyVltDbPrNHhs/okfokAnuULTsCw8KSrTYdXyZdDLYNxdoXV1+r+9u9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-OriginatorOrg: intel.com

not_report

Duplicate header file is guarded by "#if 0". Probably for testing.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 11, 2023 05:40
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [sudeep-holla:v6.7/ffa_integ_test 5/5] drivers/firmware/arm_ffa/te=
st_driver.c: linux/arm_ffa.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.=
git v6.7/ffa_integ_test
head:   0dfce5abe57576c4804fc626172b0cd80a320c1c
commit: 0dfce5abe57576c4804fc626172b0cd80a320c1c [5/5] firmware: arm_ffa: A=
dd test driver
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110545.J=
OGoXeHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110545.JOGoXeHY-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more=
 than once.
>> drivers/firmware/arm_ffa/test_driver.c: linux/module.h is included more =
than once.

vim +6 drivers/firmware/arm_ffa/test_driver.c

   > 6	#include <linux/arm_ffa.h>
     7	#include <linux/module.h>
     8=09
     9	#define PRIMARY_UUID \
    10		UUID_INIT(0xb4b5671e, 0x4a90, 0x4fe1, 0xb8, 0x1f, 0xfb, 0x13, 0xda,=
 0xe1, 0xda, 0xcb)
    11	#define SECONDARY_UUID \
    12		UUID_INIT(0xd1582309, 0xf023, 0x47b9, 0x82, 0x7c, 0x44, 0x64, 0xf5,=
 0x57, 0x8f, 0xc8)
    13	#define TERTIARY_UUID \
    14		UUID_INIT(0x79b55c73, 0x1d8c, 0x44b9, 0x85, 0x93, 0x61, 0xe1, 0x77,=
 0x0a, 0xd8, 0xd2)
    15	#define IVY_UUID \
    16		UUID_INIT(0xeaba83d8, 0xbaaf, 0x4eaf, 0x81, 0x44, 0xf7, 0xfd, 0xcb,=
 0xe5, 0x44, 0xa7)
    17	#define TEST_UUID(x) \
    18		UUID_INIT(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, (x), =
0x00, 0x00, 0x00)
    19=09
    20=09
    21	#define SECURE_WORLD_PARTITION_MASK 0x8000
    22	#define CACTUS_ECHO_CMD 0x6563686fUL
    23	#define ECHO_VAL1 0xa0a0a0a0UL
    24	#define ECHO_VAL2 0xb0b0b0b0UL
    25	#define ECHO_VAL3 0xc0c0c0c0UL
    26=09
    27=09
    28	void test_ffa_notif_cb(int notification_id, void *data)
    29	{
    30		pr_info("%x %p\n", notification_id, data);
    31	}
    32=09
    33	static int ffa_test_driver_probe(struct ffa_device *ffa_dev)
    34	{
    35		int ret;
    36		struct ffa_send_direct_data data;
    37=09
    38	        pr_info("FF-A test module probed for part ID 0x%x\n", ffa_de=
v->vm_id);
    39=09
    40		data.data0 =3D CACTUS_ECHO_CMD;
    41		data.data1 =3D ECHO_VAL1;
    42		data.data2 =3D ffa_dev->vm_id;
    43		data.data3 =3D 0;
    44		data.data4 =3D 0;
    45=09
    46		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    47		pr_info("Ret %d\n", ret);
    48=09
    49		data.data0 =3D CACTUS_ECHO_CMD;
    50		data.data1 =3D ECHO_VAL2;
    51		data.data2 =3D ffa_dev->vm_id;
    52		data.data3 =3D 0;
    53		data.data4 =3D 0;
    54=09
    55		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    56		pr_info("Ret %d\n", ret);
    57=09
    58		data.data0 =3D CACTUS_ECHO_CMD;
    59		data.data1 =3D ECHO_VAL3;
    60		data.data2 =3D ffa_dev->vm_id;
    61		data.data3 =3D 0;
    62		data.data4 =3D 0;
    63=09
    64		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    65		pr_info("Ret %d\n", ret);
    66=09
    67		data.data0 =3D 0;
    68		data.data1 =3D 0;
    69		data.data2 =3D 0;
    70		data.data3 =3D 0;
    71		data.data4 =3D 0;
    72=09
    73		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    74		pr_info("Ret %d\n", ret);
    75=09
    76		data.data0 =3D 0;
    77		data.data1 =3D 1;
    78		data.data2 =3D 0;
    79		data.data3 =3D 0;
    80		data.data4 =3D 0;
    81=09
    82		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    83		pr_info("Ret %d\n", ret);
    84=09
    85		data.data0 =3D 0x736c656571;
    86		data.data1 =3D 0xc8;
    87		data.data2 =3D 0x8002;
    88		data.data3 =3D 0x1;
    89		data.data4 =3D 0;
    90=09
    91		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    92		pr_info("Ret %d\n", ret);
    93=09
    94		ret =3D ffa_dev->ops->notifier_ops->notify_request(ffa_dev, 0,
    95					&test_ffa_notif_cb, &data, BIT(0));
    96		pr_info("Ret %d\n", ret);
    97=09
    98		ret =3D ffa_dev->ops->notifier_ops->notify_request(ffa_dev, 0,
    99					&test_ffa_notif_cb, &data, BIT(1));
   100		pr_info("Ret %d\n", ret);
   101=09
   102		return 0;
   103	}
   104=09
   105	static const struct ffa_device_id test_ffa_device_id[] =3D {
   106		{ PRIMARY_UUID },
   107	//	{ SECONDARY_UUID },
   108	//	{ TERTIARY_UUID },
   109	//	{ IVY_UUID },
   110		{ TEST_UUID(0x3) },
   111		{ TEST_UUID(0x4) },
   112		{ TEST_UUID(0x5) },
   113		{ TEST_UUID(0x6) },
   114		{ TEST_UUID(0x7) },
   115		{ TEST_UUID(0x8) },
   116		{ TEST_UUID(0x9) },
   117		{ TEST_UUID(0x11) },
   118		{ TEST_UUID(0x12) },
   119	        { }
   120	};
   121=09
   122	static struct ffa_driver test_ffa_driver =3D {
   123	        .name =3D "test_ffa",
   124	        .probe =3D ffa_test_driver_probe,
   125	        .id_table =3D test_ffa_device_id,
   126	};
   127=09
   128	module_ffa_driver(test_ffa_driver);
   129=09
   130	MODULE_AUTHOR("Arm");
   131	MODULE_DESCRIPTION("PSA-FF-A test module");
   132	MODULE_LICENSE("GPL v2");
   133=09
   134	#if 0
 > 135	#include <linux/arm_ffa.h>
   136	#include <linux/device.h>
   137	#include <linux/kdev_t.h>
   138	#include <linux/of_address.h>
   139	#include <linux/of_platform.h>
   140	#include <linux/mm.h>
   141	#include <linux/module.h>
   142	#include <linux/mutex.h>
   143	#include <linux/scatterlist.h>
   144	#include <linux/slab.h>
   145	#include <linux/smp.h>
   146	#include <linux/uaccess.h>
   147=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

