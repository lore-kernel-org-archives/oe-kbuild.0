Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207386132
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL7dgQUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657066; x=1733193066;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GMHi1YEwPqNEhv5MX0h/yOpNjlWvhSPbZVKcAOclWP8=;
  b=VL7dgQUDSie5V9qCwS23tD2PIE8CaRM4Vvt/K5DTYt2ToE21HiEqyemK
   EpP4mLOAPl/nLxcotxoObv+oypkFpqyK3SJexrJ+o2R+oeTl0e9zCwI3I
   b63CX82uFt4aDtd/8rrd6oZrnlBl0aLwO/kd7kbhbyFN7T1Lj6slqCet7
   TDUigbOrEorn9e3JNDju5klaYxBlz4U2rFepaVbd8BrgzgQL5suix0yoY
   Ghdc6q0tVPrzVsMILYnAjSJnnaE/tJRr+z5s/rfKpQ3w2riT177Jm2Fu7
   M88HZ3juO84VRmuxE5SVAZHlDxH5/H1sRAJPTPhoLu2N1c6K+Dk5qe0bj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="396484312"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="396484312"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:31:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774114066"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="774114066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:31:04 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:31:03 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:31:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:31:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:31:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byBnRCvDpNoyWMx3dUxf3QcfApQcSncZlTQqtEXb0eji9xc7sGGW0oLV4myy7+Hzm6pceXrtxfXsBP9eit11m3etI3g0FnjJg9MBXTHCPR5qzyZi4awkUOF+G8R1+dE0v4jLhl3BqvpNBKL6fJdoP9iU7xYEjgLtbw6qsCuMRzJWP6DBwRYYZPm52KQBHfNtErwhLgLC34cdh1krG3z8DJOrv/39y1NOEV5ZcrwWt+DtcWrB8ROh3oiv+xnzGlQvCO7MLxmKo+HjyuJNT3oLHxVfZ8/3hcRhywnCWqnlYjaGGVMKxBUEFtXybL27sWoi+INIxFr8Rk6DDELKa4anDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ryr8F5I3h5zVBsPw/mU6wbPDAiNIk3kW7m5PIceacwI=;
 b=VQM4HDEwsyhO5QTu9DzUsSjI4AJS/c96ljyOrsOgQ2R/gw+KOzBKYqLg+WW0/QZcjul0MEhvYkDQjpo4vxdKrQs7Obc0Lc4uX5UOZqw5oolCxYB6gKr8X+EgApCjAWvyIKTdOkuUIxbXvobexcNmn/WorFFUFpZNb3lb7zu67YfbToKIwzeejR7mh/zXvjuZWLrxehw7ERr4L3WD4/NhYGMkmUEOjXtFViaULzB6AlwIlnkTjMaUiz6Yn+ArnCqQWaWTMTIPbY2YVzveupYBYbU1SALz2KrPFZ6cqE3muf/jVg3otYuxBGo+2hZdA9hfympcUQjCgm+VrXPO6bYQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:30:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:30:58 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Thread-Topic: kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Thread-Index: AQHaJJyI74ixVWarH0WZj2tv454VOrCYanmA
Date: Mon, 4 Dec 2023 02:30:58 +0000
Message-ID: <CY5PR11MB6392B480B1E5623F05DFD67EFB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312020532.PwEXoxyr-lkp@intel.com>
In-Reply-To: <202312020532.PwEXoxyr-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: fba6225c-76c3-4079-1115-08dbf4710ce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fto8ofvggj3gK7kQvB0lANuDt6h+/6P0S5E0cbX3oxGlGv10yRROzoCIPz11ARs7gSouyzvK3RrSP6lGG45k/Ks3emmKcWBaxIZqu8rKOAPsBx6/mEe7kRVqYQSRF11AweF7P78ajBuk9QlgCuytKXpTpueos/sxJ8eM4UeZoaYskDjhJ/Ru38dlisKrYcPC5l2n6XaOTsHrbhjiAeBn2ohx3mZZTFFn0TzLOJjUenwWtKe4gPwzVqx0w/yNZgKSX0CBq8xMDKga5a0JmMtUrz66q7RQL8rWaTXvNxBslIoTcrW/Sd7CANHyL/khorqo/YPaDw0NE9sVZFpitepT8pTKfIO+CxdQsEz7OzFhuykD/shGk3ky+2gK9cTF5hPCz39w1/4K5ppVYpdchxB5YMmlMFnhAZAKV9TWVGNTQ0Qv7vXj6bk4pMRurlvtWSVl/wfoPqoai2QXuOf7Y6dad2QfmdpPa5a5jHazGDtzbhCihgVebXIeWqIMKaD0bPMUEd+DPMKjIbLbdGRPNZu71IRrhAv+U4PDhPqGPJQd2OcsNDkzCiU131a5GTyyTjeMJXW3PZiUPZxYnv2jjaB7I4WZ9KftzfHjzxeKU1FzaavYDIPGVGp3biA4AHu82uFWMWe9jt99j1SkVe8gCKa7GevO76T3l/s+RZ7iZRN1SkN4JvHoqNwSiEx7nkGqXiB+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(82960400001)(38100700002)(122000001)(41300700001)(26005)(66556008)(66476007)(66946007)(76116006)(64756008)(5660300002)(66446008)(8936002)(8676002)(52536014)(316002)(110136005)(9686003)(53546011)(6506007)(30864003)(71200400001)(966005)(478600001)(2906002)(7696005)(86362001)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qx+Qfmi1VuYrIKGcXV8crVUG+Khvnkyvr1XJZP/jM2QaKvT0CsHDIHE7nGK2?=
 =?us-ascii?Q?udpyyPkhNTfsSIK1ugvewTIu6lpIeltLoSOKLxoKNpNmvGqsA7PVUEWuxPmP?=
 =?us-ascii?Q?FAetHMz6xiI8C3QvnsFMTQJ5MdqBS9bHyIYmfB9gAA+a9Wno+6Un7bkBbTM2?=
 =?us-ascii?Q?t2m2v7Zv4bXe6PifnrvzEwNyyexf+KOIbfBmu9/koU9ks8PYYeew3yyy3i9h?=
 =?us-ascii?Q?/HqvAlOVDAlQ5l6smTlB+/qwE1qPAiFC5jTQtYhpCm9wmY8j1Tze4Vx6olIq?=
 =?us-ascii?Q?Og0h/vs0rCmk8Xyyjb2VW2zhRHGzayngRoEbleu4MOdTDaW2JXkYXw1JufeO?=
 =?us-ascii?Q?zo0zsjPK+7nM9XjhjOuqNiyQYl45LBFfGm5DGBWGyxx+JcpQwC3oOkYol4t8?=
 =?us-ascii?Q?bnV4yqqw/4Z/1TXlkyVxEpppNy/7pbkOvide3jAgsD79JyzEV2gtDuDPkYl1?=
 =?us-ascii?Q?EeFLA0TDKKZ+d+371E0n5xPXH2oKYUciSGKUOQgy/aOSIQZ6odV2dBFRRd26?=
 =?us-ascii?Q?8gbHpxym6bCdkjP7xFnkmFARfVjrebu5N+Zss7uWSWLLBDVbCpUY1Iqcg8OJ?=
 =?us-ascii?Q?1wL8FZQxnGDUfPJ2+Ngr7xujb7DCWWBukEurzwliiG1ZvTr9Ko80m/bv/Yhd?=
 =?us-ascii?Q?fQI0RjMvT/EB73VurcL5Q7PB6cLA3Dp40TNlLUi4kwhNw4qNUm04WeqXwCNI?=
 =?us-ascii?Q?0o4LvWnpfz5QHBYWjdn27pngaHETk/zvvBqAmHi2WBshP7I2vcOOIuuIGz8D?=
 =?us-ascii?Q?y0Lpr/71k//3Djwn2c/kCClzftt3NU2YxkTzmEE1dsjnr/O/ET3VKu56sZP8?=
 =?us-ascii?Q?NVUGzI5l3F6u4ddeVhZYBSXy50nh2NssvQCnPh6fCBwmevmk9KLMTcD5WoOT?=
 =?us-ascii?Q?LSZpD7KsGewnobzCTXrwHbcdf/f4hpJRbtIivcX3LeVPROD7KUHuMRZF9jZN?=
 =?us-ascii?Q?zNG/x5cPwWOd+/8qpREjUigdVbMdzEbXbRA5bWaI6zGpQX+0ITjr9Sq8WsQ0?=
 =?us-ascii?Q?gwjaEUt44qsT1xUgOfhpuHnnOxPcFtJABYHQ5/QYdmfI5ZEcWMMHL6M6lrrY?=
 =?us-ascii?Q?WwgH2aYl6fGCcinax+sNlmF96Lmemu+6cGYImE37EY5A/FqELgq2OxgkJ1Ea?=
 =?us-ascii?Q?jw3M+tELPvO1A7FyB5PxySPwZ4pCztwO/nYbAApWJ56Nl3r7cjIBInXIY33e?=
 =?us-ascii?Q?Py9vfqm7ZAHF69/CchiMZk9iYxBHLYQGYnTCRBhsYpMeR8589JFNtJOwUMCI?=
 =?us-ascii?Q?wDHw15tOv82LK7vvJXq2fwGwxPaUBgss+3P3xDAys0D5i9cE0qJMrxdOyecq?=
 =?us-ascii?Q?voWOI3VDMj7ZJFPN+p8VRQTyOzqZPHQix/9hrj7APYoSJIOqlLfTmoicduaw?=
 =?us-ascii?Q?pvDO51qrHVGyEOX9xeexvPu/6lZiTe+niylNrNoE34Z38kEDSNn/ENw2iJpr?=
 =?us-ascii?Q?8nHycXqffFBYctwirAfNr1OBVi4huxL/pnsIpj9LRhhHir/Mz59lkJUPhGUD?=
 =?us-ascii?Q?510cjCNDF6li6IHey+x8Rmwznal8GNJsXPwTJKMdpTYUNLFWclHOjQXIJfP9?=
 =?us-ascii?Q?LE4cmRcg0ir4qaoDisCx2Ph3Yf+acdM0yI8og+zC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fba6225c-76c3-4079-1115-08dbf4710ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:30:58.7580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPBoe+7I7US9FI8Zie8EfeUrL4lBpRCduyZ0Y+XSDW17bBJf2LAuNUadrhmvS9Rrps3YplHgXHYhMn3zMLdl2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com

not_report

only kconfig change:

arch/Kconfig            | 30 ++++++++++++++++++++++++++++++
 arch/arm/Kconfig        | 15 +--------------
 arch/arm64/Kconfig      | 13 -------------
 arch/csky/Kconfig       | 13 -------------
 arch/microblaze/Kconfig | 18 +-----------------
 arch/mips/Kconfig       | 17 -----------------
 arch/parisc/Kconfig     | 16 ----------------
 arch/powerpc/Kconfig    | 17 -----------------
 arch/riscv/Kconfig      | 13 -------------
 arch/s390/Kconfig       | 17 -----------------
 arch/sh/Kconfig         | 16 ----------------
 arch/sparc/Kconfig      | 18 +-----------------
 arch/um/Kconfig         | 16 ----------------
 arch/x86/Kconfig        | 16 ----------------
 arch/xtensa/Kconfig     | 14 --------------
 15 files changed, 33 insertions(+), 216 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 2, 2023 05:22
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: YiFei Zhu <yifeifz2@illinois.edu>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 282a181b1a0d66de1f0894d82f395fcd478f51d1 seccomp: Move config optio=
n SECCOMP to arch/Kconfig
date:   3 years, 2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 2 months ago
config: s390-randconfig-r113-20231102 (https://download.01.org/0day-ci/arch=
ive/20231202/202312020532.PwEXoxyr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020532.P=
wEXoxyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020532.PwEXoxyr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:989:19: sparse: sparse: incorrect type in assignment (diff=
erent address spaces) @@     expected struct task_struct [noderef] __rcu *o=
wner @@     got struct task_struct *p @@
   kernel/fork.c:989:19: sparse:     expected struct task_struct [noderef] =
__rcu *owner
   kernel/fork.c:989:19: sparse:     got struct task_struct *p
   kernel/fork.c:1501:38: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct refcount_struct [usertype] *r=
 @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1501:38: sparse:     expected struct refcount_struct [user=
type] *r
   kernel/fork.c:1501:38: sparse:     got struct refcount_struct [noderef] =
__rcu *
   kernel/fork.c:1510:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1510:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1510:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1511:36: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected void const *src @@     got struct k_=
sigaction [noderef] __rcu * @@
   kernel/fork.c:1511:36: sparse:     expected void const *src
   kernel/fork.c:1511:36: sparse:     got struct k_sigaction [noderef] __rc=
u *
   kernel/fork.c:1512:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1512:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1512:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct arch_spinlock_t [usertype] *lp=
 @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/fork.c:1605:9: sparse:     expected struct arch_spinlock_t [usert=
ype] *lp
   kernel/fork.c:1605:9: sparse:     got struct arch_spinlock_t [noderef] _=
_rcu *
   kernel/fork.c:1906:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1906:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1906:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1910:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1910:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1910:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2196:32: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct [noderef] __rcu *=
real_parent @@     got struct task_struct * @@
   kernel/fork.c:2196:32: sparse:     expected struct task_struct [noderef]=
 __rcu *real_parent
   kernel/fork.c:2196:32: sparse:     got struct task_struct *
   kernel/fork.c:2202:27: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2202:27: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2202:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2251:54: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected struct list_head *head @@     got st=
ruct list_head [noderef] __rcu * @@
   kernel/fork.c:2251:54: sparse:     expected struct list_head *head
   kernel/fork.c:2251:54: sparse:     got struct list_head [noderef] __rcu =
*
   kernel/fork.c:2272:29: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2272:29: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2272:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2287:29: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2287:29: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2287:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2314:28: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct sighand_struct *sighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2314:28: sparse:     expected struct sighand_struct *sigha=
nd
   kernel/fork.c:2314:28: sparse:     got struct sighand_struct [noderef] _=
_rcu *sighand
   kernel/fork.c:2342:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2342:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2342:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2344:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2344:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2344:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2731:24: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct *[assigned] paren=
t @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2731:24: sparse:     expected struct task_struct *[assigne=
d] parent
   kernel/fork.c:2731:24: sparse:     got struct task_struct [noderef] __rc=
u *real_parent
   kernel/fork.c:2812:43: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct refcount_struct const [userty=
pe] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:2812:43: sparse:     expected struct refcount_struct const=
 [usertype] *r
   kernel/fork.c:2812:43: sparse:     got struct refcount_struct [noderef] =
__rcu *
   kernel/fork.c:3030:47: sparse: sparse: incorrect type in argument 3 (dif=
ferent address spaces) @@     expected void * @@     got void [noderef] __u=
ser *buffer @@
   kernel/fork.c:3030:47: sparse:     expected void *
   kernel/fork.c:3030:47: sparse:     got void [noderef] __user *buffer
   kernel/fork.c:3016:5: sparse: sparse: symbol 'sysctl_max_threads' redecl=
ared with different type (incompatible argument 3 (different address spaces=
)):
   kernel/fork.c:3016:5: sparse:    int extern [addressable] [signed] [topl=
evel] sysctl_max_threads( ... )
   kernel/fork.c: note: in included file (through include/linux/key.h, incl=
ude/linux/cred.h, include/linux/sched/signal.h, ...):
   include/linux/sysctl.h:242:5: sparse: note: previously declared as:
   include/linux/sysctl.h:242:5: sparse:    int extern [addressable] [signe=
d] [toplevel] sysctl_max_threads( ... )
   kernel/fork.c:981:23: sparse: sparse: incompatible types in comparison e=
xpression (different address spaces):
   kernel/fork.c:981:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:981:23: sparse:    struct task_struct *
--
   kernel/seccomp.c:1098:31: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1098:31: sparse:     expected struct spinlock [usertype=
] *lock
   kernel/seccomp.c:1098:31: sparse:     got struct spinlock [noderef] __rc=
u *
   kernel/seccomp.c:1110:33: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1110:33: sparse:     expected struct spinlock [usertype=
] *lock
   kernel/seccomp.c:1110:33: sparse:     got struct spinlock [noderef] __rc=
u *
>> kernel/seccomp.c:341:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct arch_spinlock_t [usertype] *=
lp @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/seccomp.c:341:9: sparse:     expected struct arch_spinlock_t [use=
rtype] *lp
   kernel/seccomp.c:341:9: sparse:     got struct arch_spinlock_t [noderef]=
 __rcu *
   kernel/seccomp.c:355:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct arch_spinlock_t [usertype] *=
lp @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/seccomp.c:355:9: sparse:     expected struct arch_spinlock_t [use=
rtype] *lp
   kernel/seccomp.c:355:9: sparse:     got struct arch_spinlock_t [noderef]=
 __rcu *

vim +1605 kernel/fork.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1595 =20
dbd952127d11bb Kees Cook      2014-06-27  1596  static void copy_seccomp(st=
ruct task_struct *p)
dbd952127d11bb Kees Cook      2014-06-27  1597  {
dbd952127d11bb Kees Cook      2014-06-27  1598  #ifdef CONFIG_SECCOMP
dbd952127d11bb Kees Cook      2014-06-27  1599  	/*
dbd952127d11bb Kees Cook      2014-06-27  1600  	 * Must be called with sig=
hand->lock held, which is common to
dbd952127d11bb Kees Cook      2014-06-27  1601  	 * all threads in the grou=
p. Holding cred_guard_mutex is not
dbd952127d11bb Kees Cook      2014-06-27  1602  	 * needed because this new=
 task is not yet running and cannot
dbd952127d11bb Kees Cook      2014-06-27  1603  	 * be racing exec.
dbd952127d11bb Kees Cook      2014-06-27  1604  	 */
69f6a34bdeea4f Guenter Roeck  2014-08-10 @1605  	assert_spin_locked(&curren=
t->sighand->siglock);
dbd952127d11bb Kees Cook      2014-06-27  1606 =20
dbd952127d11bb Kees Cook      2014-06-27  1607  	/* Ref-count the new filte=
r user, and assign it. */
dbd952127d11bb Kees Cook      2014-06-27  1608  	get_seccomp_filter(current=
);
dbd952127d11bb Kees Cook      2014-06-27  1609  	p->seccomp =3D current->se=
ccomp;
dbd952127d11bb Kees Cook      2014-06-27  1610 =20
dbd952127d11bb Kees Cook      2014-06-27  1611  	/*
dbd952127d11bb Kees Cook      2014-06-27  1612  	 * Explicitly enable no_ne=
w_privs here in case it got set
dbd952127d11bb Kees Cook      2014-06-27  1613  	 * between the task_struct=
 being duplicated and holding the
dbd952127d11bb Kees Cook      2014-06-27  1614  	 * sighand lock. The secco=
mp state and nnp must be in sync.
dbd952127d11bb Kees Cook      2014-06-27  1615  	 */
dbd952127d11bb Kees Cook      2014-06-27  1616  	if (task_no_new_privs(curr=
ent))
dbd952127d11bb Kees Cook      2014-06-27  1617  		task_set_no_new_privs(p);
dbd952127d11bb Kees Cook      2014-06-27  1618 =20
dbd952127d11bb Kees Cook      2014-06-27  1619  	/*
dbd952127d11bb Kees Cook      2014-06-27  1620  	 * If the parent gained a =
seccomp mode after copying thread
dbd952127d11bb Kees Cook      2014-06-27  1621  	 * flags and between befor=
e we held the sighand lock, we have
dbd952127d11bb Kees Cook      2014-06-27  1622  	 * to manually enable the =
seccomp thread flag here.
dbd952127d11bb Kees Cook      2014-06-27  1623  	 */
dbd952127d11bb Kees Cook      2014-06-27  1624  	if (p->seccomp.mode !=3D S=
ECCOMP_MODE_DISABLED)
dbd952127d11bb Kees Cook      2014-06-27  1625  		set_tsk_thread_flag(p, TI=
F_SECCOMP);
dbd952127d11bb Kees Cook      2014-06-27  1626  #endif
dbd952127d11bb Kees Cook      2014-06-27  1627  }
dbd952127d11bb Kees Cook      2014-06-27  1628 =20

:::::: The code at line 1605 was first introduced by commit
:::::: 69f6a34bdeea4fec50bb90619bc9602973119572 seccomp: Replace BUG(!spin_=
is_locked()) with assert_spin_lock

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Kees Cook <keescook@chromium.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

