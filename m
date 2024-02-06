Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A04A08
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Feb 2024 01:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182813; cv=fail; b=EfvSUDNY4MTD++2aCJrgS502L5AusUdBVRhZ0ORAD+qgOBe2smUw6jzmxH3GSqP06DFX/hAzLqB6Bd8jOZ2hCAbwQ1QI54f1XGcjUtaD+gPesX0GhPHvI/c13RXw00fhola4pIwcCJnDKacEvnSo8lQ4xEW8WSI5P7DyJwFEVFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182813; c=relaxed/simple;
	bh=Cgweey+Grx/Ah7ORpQvFXfv9HZp68Eqp7MxU8JDJdzI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nLhkfzoCZ+xKhIKO+eP/2zTfphSqICBx0iHRPemwoPSt2PVW0kDhK/hADUDCBz90iGVjPC5TQhitcMX2sOjyt8fC2CXhP0IvLhLexLl8r9aN2fvMUPm5EfiJtEvVKr5NeN19LCxfwDPM+lm3Bo7ob2KANsKgojnw4St17FUBLpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emUxrwCE; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emUxrwCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707182810; x=1738718810;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Cgweey+Grx/Ah7ORpQvFXfv9HZp68Eqp7MxU8JDJdzI=;
  b=emUxrwCE5zpbEuQ1RuPAE6sBZUv7cLTo6i+CBQVkftVOoFIZmNQF7AHx
   x6JohCxEIO3JP8OcS8t45KR24GlOw7wQnn8Oi+q1vE56XXDVwbZ5roeul
   YQDfBLQHQUeg71VDjpdcfU9iRCWMCi4HLNJb35Qrjy3HwpIZP5Ckknqaq
   OsucAMlDaKJ66ntc6pBC6+u16aL3jVxRBTCJE5WXNfLo+0/HMsWAPW+X2
   QrA57fOPsonlsUCh5L6nyGCU6qHdg/RdoVC8cFN9mDy92CmSyWlOOTdMx
   geZ7mkMYlAsj3WP8XgJLlJOwp68yp3wcOooOU31Vi2QxerAgwp/tbE4zp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="544636"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="544636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1149283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2024 17:25:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:25:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 17:25:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 17:25:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0rzpExlYmuTJkacHQ3Xigodu70bs5eWOki4rHAi5P88eunetFL8R0FLHKJPfo3rH8UVXOMP5u5C/a4StCuBYGW02F2CKjXg8AUCj+izN+RReKZgSmlDe1gmPT8uYEcoBTFUvXKfmIF9YVaYtBjVqG+i5ADmlh7sA32uDGOa4CFWJ9rqK56yUTObRkEcsou7h4PCU8Nlsx2QmMUMwXBSNrvuPLJKSV2YuvYgn7pjGWcTfbg1xIguWqMRPdhD/ur3JmSiWdeAcfdFSOLxWA3Z3ouwyyhvncJeKX6AniAOdXj3DBv6+rfGfoyND2pvwwjrcW6iJEzgrrsF9+D03RPbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPQiWUJpzTapkmAKNF6rFTUyBk5kOq9EkEI3MNYV2Rc=;
 b=GBN3vqCAYwVfRiFs+F0dL4qq/DSIPikWZrYovjhVoxDJJAisWbzycZos1zoS3K1YS2Rs4MDnvSlT+3vD6p9wQaXjBXHPW/TUSx4NcBXffuUi0hwpzNSVqI7fXPDuyORmAZjE1/qjHVi8UXQeC7gwFL+jZAM7/gQBLdtyMeEky89r5elUaav9PanFPnDSa+Tw8or382RzThHZ+o0CqX+xUbz7DLs+zoE8W6GzHW7qlm8cyoSAJ+IIHT5AVZhgsl413mdSX7/Px4M8HGFW92eylSqvCi1AaC18yrnEV/YUGwFGBV/z8gqpbNRdLhc4eqxcqpqhrbanSAqb0C7VmDFl8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 01:25:52 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 01:25:52 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [frank-w-bpi-r2-4.14:5.4-spi 10/41]
 net/wireguard/compat/compat.h: linux/ip.h is included more than once.
Thread-Topic: [frank-w-bpi-r2-4.14:5.4-spi 10/41]
 net/wireguard/compat/compat.h: linux/ip.h is included more than once.
Thread-Index: AQHaWBzgzrw5Tnp1RkirWb8DMQl5sbD8hl2A
Date: Tue, 6 Feb 2024 01:25:52 +0000
Message-ID: <CY5PR11MB63923E01256DDA9C98FF5282FB462@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202402051806.Z3KZ7cWt-lkp@intel.com>
In-Reply-To: <202402051806.Z3KZ7cWt-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|BL3PR11MB6458:EE_
x-ms-office365-filtering-correlation-id: fecb221f-6f47-4787-b29a-08dc26b28ee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytj+OPTvXYUhyS/0IyByqhSbiw4d/DSz0pW5wnVYDxPof0CVf3JhnJVfV1kqrnQUN4dBejX5M1UL5OtoeK6lVL/3FaoTjujUa2mKby7Dsl8KbUdprklrR3fKpwMULLjy/tOX2N28DJXhrA34Tgn6d0vfnTp1EV68TU6y78Rn05Jniop0LORJQikEkajuiAqBcC67THJXREkWLRM7ii4V5/VdouQBLG52xk7AFAnuIpk3D/cN/7CtEoK5+znX5s4lsaP4bQ0t+BYHevmjSiehuNoZJBjhu+36NiE8rDnCSExkkjqU8D/8P4I9XAGxMEM8bZa+cXe9TZckt7tsj+c+oiDJfkB26LmRTv8yBdlURi9x1KeduT6WhwVaD3g/mvVNbKRkUhbHNoRhfL853VYcth/CHLK4XYGxYmOVoQBpEWFhsuFYLQUOQiM54xUH04bk6MGSp3Klugrd5sZ550ik+WAf+m95PwzLDzC5nfDepx8+VTAiIL/gLplTIsDB8AINAK4hiurHd8P/rPCsJGSeO8sUKqF0AE/FmIt8MX7JSmcKPlhy0t8vXyXuNs1N4s4zHGk7wPZ6bHHecn9XY39skvHfUqLw22/mDqQmJgkkVkcvohhlZfaHkRvvIM5GbUje3JjJfvy6R3y7T/SJkFx8sA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230273577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(316002)(53546011)(33656002)(122000001)(55016003)(7696005)(82960400001)(38100700002)(83380400001)(6506007)(86362001)(26005)(41300700001)(8676002)(52536014)(8936002)(9686003)(71200400001)(2906002)(478600001)(966005)(5660300002)(66446008)(66476007)(64756008)(66946007)(66556008)(76116006)(38070700009)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UrntSQQIWmHtK0GkiiUrmPSsJXJUIu0nnOczB6yTNtL2PgY4bsUYNpAoEJyQ?=
 =?us-ascii?Q?p8DCNzs2YiAYg6lVcwSCHbkfUIThCG//79mTvO7oVN/atQaS/uLQD0mjdwXF?=
 =?us-ascii?Q?Ol9mFiqjKJYRIxJfhAEEi0FlVu5Y40Ikwag3SIKnAmfElnoCbr871Kn7drw1?=
 =?us-ascii?Q?C0ABhhAk0/sMG29bkGEafrnfCXnNqgdGbNZxnGkdjWLsHrZkfZiFnVTPfmW3?=
 =?us-ascii?Q?9Ev6cUV5s1EyC/PiEz757QlrqYqKfP8ytZBzQ6B3uaY2qnDJCmrzY7NUNJ9r?=
 =?us-ascii?Q?1Ya2OA8DmEPAhEbmr2sXAAXYkWm00KxRmwmioeM1BES8yRvuYEhOtOLQUz0s?=
 =?us-ascii?Q?HwdP2lZiQYzFHyjLeOhGsHmc6/UDQGRmdx5Tt5VZ8WI+DP9+8MmRo6x90tIm?=
 =?us-ascii?Q?6aeq6+ugTx+6XiP+SJElyNdLBxNeq0AuZC4b0YPLbVk0tTsBFPnpyOSuUgGv?=
 =?us-ascii?Q?2/XhaTSWYaR3NuS0fvBPsXctJzZhJgHrin3FPMXSY617WHA638LhhwqEKWVE?=
 =?us-ascii?Q?QkrdjFr7lCVKodh8EbZk2FbzlEngb9kusEqxG6qKRrrUvTAmnidvwNAqYPfl?=
 =?us-ascii?Q?EqZ9M9TrZ+FhhkMJiTYp4fRnaztUP0RGoO6K3sJLFduH0ov8gTi2HRhw7IDN?=
 =?us-ascii?Q?nSQse3gchOWq3oS0+v3KvZsMGfTcgemG6t3ocWUOOeX8xZ4PLN4ZAVXfjPso?=
 =?us-ascii?Q?CD7tMU7r2m6pg9cO64ifJ6qz78E8+7z7HZtBQSutOIXQdHf7p3LJVOI9sepy?=
 =?us-ascii?Q?MTQaGN1pq2CpuDmxCv3GxsHSaMA3h91ipSERujB812sGrgdEiZKmhNxGcrac?=
 =?us-ascii?Q?+YQJZ3MVSbHQHfSUGQthB66PoApRqZC1KuAcw4WLdMWXkEDzUhXbe/SoRIfz?=
 =?us-ascii?Q?OXO3vpshr3/mXwKNwoghgO+KObBiOPhZXnk58Ar+KnFBQ8BXx6HHWpRXpDq+?=
 =?us-ascii?Q?YdSwKxucqm0haw8YAg1C3kSsUNbnhhqA/tSBzTmamlLYiaE/ZHnhpJ92kx/w?=
 =?us-ascii?Q?quVojjHVwIO/V9zsGFiYiJFsLBuX1yxiG049cM8W8sbPhLleGksdVv4Pconj?=
 =?us-ascii?Q?1tjTyCN/nILAtDFIPg/z+3E9pjXbhuzIwuNUiQIkHMvXZp1EyTQtmNgrNX9W?=
 =?us-ascii?Q?HZsXWiAmr7W96O331hzsPCRKYObGW0w6kx8FJLcZOTK7GDluKbjakXozmP+l?=
 =?us-ascii?Q?dyERbIlEtq6wYC/RIMP5Z3iiHa/IaLNzwR1SM5TnOfxN8m53e0UgTYZmqKAq?=
 =?us-ascii?Q?2i4eZGPrVFX2xQv8AvNGfXVSMmDXSbHWLoc0Nr3wVxWYRxgKY4VOgbHDCCgH?=
 =?us-ascii?Q?PhTV10pAwtur3d8NiCmavNihl+zcteK1+DxW1ISQYIWz1l+QVLqVwVnfQ/s4?=
 =?us-ascii?Q?3MImmaamFYdCfsV8K/jN1s1gVs849leu63WTFHTGj4mxN5+AGJoQOF9nLU5m?=
 =?us-ascii?Q?rCwV2aX0ZKrDQ7+pdZbI+rAVFDQgAgg/7n+KRox/tG2Dswlky7p4dshhaXsY?=
 =?us-ascii?Q?u5jTUcEGNB4pqPk0MffnuWLUsrg0cjqKC+fwo6Qcs1QLK+oePPr3aZTDOxHe?=
 =?us-ascii?Q?uW/nSh8OYDNiWX0GfgiSBRQgcM6OqNw0pokC5vdj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fecb221f-6f47-4787-b29a-08dc26b28ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 01:25:52.2881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bWKxGZR/0cudkcPUt4rB+kV4Mggf2peC5oLd38ZfhkStg8Onxc1Dt24rCq3W71oIlgeYmnOZcX41a3VFhUzuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
X-OriginatorOrg: intel.com

not_report

Guarded by different #ifdef macro

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, February 5, 2024 18:14
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.4-spi 10/41] net/wireguard/compat/compat.h:=
 linux/ip.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-spi
head:   f18d6b8720893df4172d217fd074ba23ac53a7a7
commit: eb31f9fb1fa2612c9024fcd18b95e511df50a1e5 [10/41] net: wireguard: up=
date wireguard compat
:::::: branch date: 2 years, 7 months ago
:::::: commit date: 2 years, 11 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402051806.Z3KZ7cWt-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   net/wireguard/compat/compat.h: linux/mm.h is included more than once.
   net/wireguard/compat/compat.h: net/netlink.h is included more than once.
   net/wireguard/compat/compat.h: linux/rcupdate.h is included more than on=
ce.
>> net/wireguard/compat/compat.h: linux/ip.h is included more than once.
   net/wireguard/compat/compat.h: linux/random.h is included more than once=
.
   net/wireguard/compat/compat.h: linux/siphash.h is included more than onc=
e.
   net/wireguard/compat/compat.h: net/genetlink.h is included more than onc=
e.
   net/wireguard/compat/compat.h: linux/skbuff.h is included more than once=
.
   net/wireguard/compat/compat.h: linux/slab.h is included more than once.
   net/wireguard/compat/compat.h: linux/cache.h is included more than once.
   net/wireguard/compat/compat.h: linux/vmalloc.h is included more than onc=
e.
   net/wireguard/compat/compat.h: linux/atomic.h is included more than once=
.
>> net/wireguard/compat/compat.h: linux/kernel.h is included more than once=
.
   net/wireguard/compat/compat.h: net/ipv6.h is included more than once.
   net/wireguard/compat/compat.h: linux/netdevice.h is included more than o=
nce.

vim +939 net/wireguard/compat/compat.h

   934=09
   935	#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0) && LINUX_VERSION_C=
ODE >=3D KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5=
, 4, 102) && LINUX_VERSION_CODE >=3D KERNEL_VERSION(4, 20, 0)) || (LINUX_VE=
RSION_CODE < KERNEL_VERSION(4, 19, 178) && LINUX_VERSION_CODE >=3D KERNEL_V=
ERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 223) && LI=
NUX_VERSION_CODE > KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE < KERNEL=
_VERSION(4, 9, 259) || defined(ISRHEL8) || defined(ISUBUNTU1804)
   936	#include <linux/icmpv6.h>
   937	#include <net/icmp.h>
   938	#if IS_ENABLED(CONFIG_NF_NAT)
 > 939	#include <linux/ip.h>
   940	#include <net/ipv6.h>
   941	#include <net/netfilter/nf_conntrack.h>
   942	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0) && !defined(ISRHEL8=
)
   943	#include <net/netfilter/nf_nat_core.h>
   944	#endif
   945	static inline void __compat_icmp_ndo_send(struct sk_buff *skb_in, in=
t type, int code, __be32 info)
   946	{
   947		struct sk_buff *cloned_skb =3D NULL;
   948		enum ip_conntrack_info ctinfo;
   949		struct nf_conn *ct;
   950		__be32 orig_ip;
   951=09
   952		ct =3D nf_ct_get(skb_in, &ctinfo);
   953		if (!ct || !(ct->status & IPS_SRC_NAT)) {
   954			memset(skb_in->cb, 0, sizeof(skb_in->cb));
   955			icmp_send(skb_in, type, code, info);
   956			return;
   957		}
   958=09
   959		if (skb_shared(skb_in))
   960			skb_in =3D cloned_skb =3D skb_clone(skb_in, GFP_ATOMIC);
   961=09
   962		if (unlikely(!skb_in || skb_network_header(skb_in) < skb_in->head |=
|
   963		    (skb_network_header(skb_in) + sizeof(struct iphdr)) >
   964		    skb_tail_pointer(skb_in) || skb_ensure_writable(skb_in,
   965		    skb_network_offset(skb_in) + sizeof(struct iphdr))))
   966			goto out;
   967=09
   968		orig_ip =3D ip_hdr(skb_in)->saddr;
   969		ip_hdr(skb_in)->saddr =3D ct->tuplehash[0].tuple.src.u3.ip;
   970		memset(skb_in->cb, 0, sizeof(skb_in->cb));
   971		icmp_send(skb_in, type, code, info);
   972		ip_hdr(skb_in)->saddr =3D orig_ip;
   973	out:
   974		consume_skb(cloned_skb);
   975	}
   976	static inline void __compat_icmpv6_ndo_send(struct sk_buff *skb_in, =
u8 type, u8 code, __u32 info)
   977	{
   978		struct sk_buff *cloned_skb =3D NULL;
   979		enum ip_conntrack_info ctinfo;
   980		struct in6_addr orig_ip;
   981		struct nf_conn *ct;
   982=09
   983		ct =3D nf_ct_get(skb_in, &ctinfo);
   984		if (!ct || !(ct->status & IPS_SRC_NAT)) {
   985			memset(skb_in->cb, 0, sizeof(skb_in->cb));
   986			icmpv6_send(skb_in, type, code, info);
   987			return;
   988		}
   989=09
   990		if (skb_shared(skb_in))
   991			skb_in =3D cloned_skb =3D skb_clone(skb_in, GFP_ATOMIC);
   992=09
   993		if (unlikely(!skb_in || skb_network_header(skb_in) < skb_in->head |=
|
   994		    (skb_network_header(skb_in) + sizeof(struct ipv6hdr)) >
   995		    skb_tail_pointer(skb_in) || skb_ensure_writable(skb_in,
   996		    skb_network_offset(skb_in) + sizeof(struct ipv6hdr))))
   997			goto out;
   998=09
   999		orig_ip =3D ipv6_hdr(skb_in)->saddr;
  1000		ipv6_hdr(skb_in)->saddr =3D ct->tuplehash[0].tuple.src.u3.in6;
  1001		memset(skb_in->cb, 0, sizeof(skb_in->cb));
  1002		icmpv6_send(skb_in, type, code, info);
  1003		ipv6_hdr(skb_in)->saddr =3D orig_ip;
  1004	out:
  1005		consume_skb(cloned_skb);
  1006	}
  1007	#else
  1008	static inline void __compat_icmp_ndo_send(struct sk_buff *skb_in, in=
t type, int code, __be32 info)
  1009	{
  1010		memset(skb_in->cb, 0, sizeof(skb_in->cb));
  1011		icmp_send(skb_in, type, code, info);
  1012	}
  1013	static inline void __compat_icmpv6_ndo_send(struct sk_buff *skb_in, =
u8 type, u8 code, __u32 info)
  1014	{
  1015		memset(skb_in->cb, 0, sizeof(skb_in->cb));
  1016		icmpv6_send(skb_in, type, code, info);
  1017	}
  1018	#endif
  1019	#define icmp_ndo_send __compat_icmp_ndo_send
  1020	#define icmpv6_ndo_send __compat_icmpv6_ndo_send
  1021	#endif
  1022=09
  1023	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 10, 0)
  1024	#define COMPAT_CANNOT_USE_MAX_MTU
  1025	#endif
  1026=09
  1027	#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 14) && LINUX_VERSION_=
CODE >=3D KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(=
5, 4, 29) && !defined(ISUBUNTU1910) && !defined(ISUBUNTU1904) && !defined(I=
SRHEL8))
  1028	#include <linux/skbuff.h>
  1029	#include <net/sch_generic.h>
  1030	static inline void skb_reset_redirect(struct sk_buff *skb)
  1031	{
  1032	#ifdef CONFIG_NET_SCHED
  1033		skb_reset_tc(skb);
  1034	#endif
  1035	}
  1036	#endif
  1037=09
  1038	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0) && !defined(ISRHEL=
7)
  1039	#define skb_get_hash skb_get_rxhash
  1040	#endif
  1041=09
  1042	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 15, 0) && !defined(ISRHEL=
7)
  1043	#define hash rxhash
  1044	#define l4_hash l4_rxhash
  1045	#endif
  1046=09
  1047	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0) && !defined(ISRHEL=
7)
  1048	#define sw_hash ignore_df =3D 0; skb->nf_trace =3D skb->ooo_okay
  1049	#endif
  1050=09
  1051	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 3, 0)
  1052	#define pre_exit exit
  1053	#endif
  1054=09
  1055	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
  1056	#include <linux/skbuff.h>
> 1057	#include <linux/ip.h>
  1058	#include <linux/ipv6.h>
  1059	static inline __be16 ip_tunnel_parse_protocol(const struct sk_buff *=
skb)
  1060	{
  1061		if (skb_network_header(skb) >=3D skb->head &&
  1062		    (skb_network_header(skb) + sizeof(struct iphdr)) <=3D skb_tail_=
pointer(skb) &&
  1063		    ip_hdr(skb)->version =3D=3D 4)
  1064			return htons(ETH_P_IP);
  1065		if (skb_network_header(skb) >=3D skb->head &&
  1066		    (skb_network_header(skb) + sizeof(struct ipv6hdr)) <=3D skb_tai=
l_pointer(skb) &&
  1067		    ipv6_hdr(skb)->version =3D=3D 6)
  1068			return htons(ETH_P_IPV6);
  1069		return 0;
  1070	}
  1071	#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(5, 1, 0) || defined(ISRHE=
L8)
  1072	static const struct header_ops ip_tunnel_header_ops =3D { .parse_pro=
tocol =3D ip_tunnel_parse_protocol };
  1073	#else
  1074	#define header_ops hard_header_len
  1075	#define ip_tunnel_header_ops *(char *)0 - (char *)0
  1076	#endif
  1077	#endif
  1078=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

