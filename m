Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5088417C2
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 01:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649060; cv=fail; b=qim6MhzYaqBUKoI1UbmXT4DEKOkvU0e0/lP6uFOD+1gq/yZGAcTTPz0uPnJrzm+bYjCxv5tdgOieLmvNj6vPSkw2ORFyYCepLylS5qOz/okq2oIi+GhOIJMox9XGftjFcJ8VcPzSs1izAT8Qawnvvam3IuqVTLxEt7+ePMxNRas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649060; c=relaxed/simple;
	bh=p2VDTVEBilRTo6V04hQu8sL4OzJXqHdyPyN7XoqB4VM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MsmHh73Yd63IZnv2O6ZnaNSzezYPtalo+GCp1Dp5cuDFof25mNeVooVTwElCmck9NfHdDON7ITskbx4JmIJCZX+NlLl7z9ka15WERD3QyztUGzZW3lEHkrIj/CxCWDtCQz2MhpHBzWvtMkHxAcHgF7SQUsP+8i8l6gk75RqzWZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFUzUA4Q; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFUzUA4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715649058; x=1747185058;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=p2VDTVEBilRTo6V04hQu8sL4OzJXqHdyPyN7XoqB4VM=;
  b=dFUzUA4QBFO7NkNNphVZJzhEgEZYgq2XUhLO4M/dbue8NPpUtzyZNaEU
   0lvc0Xi41vTWbygpR4Wz+Gk5ofvU5RSkW4R7JuPfKVjHeae6llaWotdT0
   L6IVH9cpHVClZxZDsxuIb8WXEIr+5NtJCuVNry3QcatfN5VO/LnefWTfc
   AMsiVBiNUc8kPiBPie6zL6DIG83GJYf0C2GjvEKX2/3TcZXDQwSozG0h0
   vnMjYZKkawXMJ2GDHkIML3qe0G4naOEFWOalvnhbRg+a0RgRQExKRD0KK
   ZiEAJ1zNQP8xTSg2O8BuRXeN3RtveMr8UpGy3sBwkJRh+92S7gGjxaiZF
   g==;
X-CSE-ConnectionGUID: A3qEKUUERa+m2exWHrSmFg==
X-CSE-MsgGUID: fHXJbMp2RQyOabRJJ1yaRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11781672"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11781672"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:10:57 -0700
X-CSE-ConnectionGUID: nP3umfaXQPmp5h0CySegRQ==
X-CSE-MsgGUID: AGIaz32uTxyflfYRxxMleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35061947"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 May 2024 18:10:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:10:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:10:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 18:10:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 18:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmjIJYFXouKyjXstjhCu6lMmGqvdDeCNdP2i6I6fNC/W0Xot/1cWQnRDJHfrW4iqHv2kLC6pH6BJ8jrjtpRMgutQfLlRMUwz85jdIi69bNHqiL3xIyl/EFroDZ2GD/EAZ83vY7/vwYzEhe+5rl0jXV30hVYtq31Kq8YVAPa1H3xC6Rs+uiDyoORosVa552QYxUFtCXPr2OrZRcNIpxiOHHgacrW0pWCTIHPHtZvbDlgBsrfokxnLYupo5T8534tmlcKekjbacQD+2TXMertE4ds5WJWFLUYccDBsfx7G6PC956bAX0Meso9fmiZrxPar/VIYNGWat3KgfS2RfMm2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oedEaJbDpH6B1EfrzOL8o1HY0uagipInEww0NiqEJk=;
 b=HMbZiuLZmeGZjgjzMN6OA9f5+Cg7gF6/UZtgMch7SlI5LtBsurLrIKVPLTTReC/REaMc1n0/fH7GTYsVr3wkvh1qB2eFeqbUIC4IK3GFofhAJDHo0Um1NuP8U3o4usxef+EK5G+JFjVH44goEg0O7zOEkNKc3GcDKXHqo/ceqGsMulHaAPc5zOXHzRjjOYcBcnSwqg671eKRYb3ZMETN5Q92ycEAq0mwCnEsks6pEe7sy8gfpB1T1VPXwwCbUbd+dLmE2qf7dEy7bZ69gye+mCiVOgPuEL0yOneemyO3VnUZ42tyBM3HD2biVrbOAyk2uOLgm0XQhe9Q87Eyq4Ivrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 01:10:54 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 01:10:54 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [arnd-asm-generic:syscall-tbl-6.9 30/46]
 arch/riscv/kernel/syscall_table.c: asm/syscall_table.h is included more than
 once.
Thread-Topic: [arnd-asm-generic:syscall-tbl-6.9 30/46]
 arch/riscv/kernel/syscall_table.c: asm/syscall_table.h is included more than
 once.
Thread-Index: AQHapQt32oXZOm7xYUGT3eU45bFIFLGV7AVw
Date: Tue, 14 May 2024 01:10:54 +0000
Message-ID: <SA1PR11MB8393CE59CB4A127B3789E0E9FBE32@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405131504.7yK7W1Kn-lkp@intel.com>
In-Reply-To: <202405131504.7yK7W1Kn-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|MW4PR11MB6740:EE_
x-ms-office365-filtering-correlation-id: 282ad4de-f6fe-4a5b-6bda-08dc73b2b409
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?3+OZ9OOTEviRkcY/trYfEdzdxfJfEO1xTelWe9CAKbHZzrd9vF8M0D1mwZxd?=
 =?us-ascii?Q?2AYnDHCPRIh2ZbiixGwuw4Ipdv0yUCbuqHLYCh/n6XipSFAWhqZc8q5oa6gc?=
 =?us-ascii?Q?gxAxbVY2j4yMrU7+gtTnyCjIh1ByfVoPQFU4z2HxXcy3SNa2Qv93/lay22d+?=
 =?us-ascii?Q?BoI5X1XyYxnfK8dtPatOtxk5+MLvNkFOQn+iGe6xiSfKd9kp23Cy90l4WDYw?=
 =?us-ascii?Q?bMGwtt16fqxR26Qgj3S2qDmywHmgWdeAHp3lyoFBI/5bzmyipEpefVXAXHYW?=
 =?us-ascii?Q?cmDZgtkjobIzI0EjvcnwVz81qSMIXCpqSzTu+scZseNsCtaJcVAvmgKMVvfr?=
 =?us-ascii?Q?NmeoGSdlJx49xh+rUir0ShGjGMzNM/FxVf2HIPm2nWEHRrZsvmRuir+FRqQi?=
 =?us-ascii?Q?Xj+A+0zD20qj4sEK5BfCoL8L6uhR8Xc0ASD+dey1RChO6kCeGa2oenT9TjUs?=
 =?us-ascii?Q?UiMtZZhy5y3FZU5HE/sIYL24R21vZ+pME4GjVXqO/TZZI820TbVs2gbs6zOb?=
 =?us-ascii?Q?m7TeT7zNf7U1vNmHekQ2eAYe3UM44bZbrmNDXigNf5mQy7K9e9pRx6oDBoFz?=
 =?us-ascii?Q?1ryRQ4rZ7x6JYbTUlx5M/oGiBptmcJ93F6uFC1gbii86FInDPCC3YTilNSet?=
 =?us-ascii?Q?4KtcWDGFu5jdsQlUuHR5q1qE/bVm4SvT2fGuCcBGhm/weCmhEoQzM2/jWLnD?=
 =?us-ascii?Q?nF0g2zWCW1YIGK+Nz9mldlWia7SP4dqqbil9RX6G8alC0l5eis9PraAYQg+x?=
 =?us-ascii?Q?XJ5XqvtPfSCd74yin6HapKLEMRajF0RF9geqcj6cYFVkJjHIXMpNH5m0F2NS?=
 =?us-ascii?Q?WNuHtsFwhGJVyeEcgingsPWCa3+8fagEihug9FLnmz1slsZ6j4lEHXKcRYKA?=
 =?us-ascii?Q?vJg0OGTs+aED08KI9K/t6pOQw5NQ0fb8Lm1Tn7TdJtrbhk7ZhQkXzr6bCJxK?=
 =?us-ascii?Q?XYrA0WaPm7xFBk45pUePGkcoXW2xwWYzb3mHGh7ATa0feQIP95KL3m6F+WJH?=
 =?us-ascii?Q?CC0+bl18NRzaBPqoaL7twlw9arrUmbWkM+VQ+PlSoVMnPxcw1dmaOFCF7EsF?=
 =?us-ascii?Q?D4VEBP4VNQGJdudA3V1zasG5+BZnRmZeNlgC5rVe3zX5sXXNz4wbmY+Lee3w?=
 =?us-ascii?Q?Cxp5kLyPWn2v0f8rn/HXmtdpk4wENfU3OL1gv+lSgBpCy0cZbq0Ep4GawsdJ?=
 =?us-ascii?Q?I9IhnkxA4kc9fKl16eQweb1xoLstSJ6QrJMs9+R4HZBbyeezImd4lmaNSKh1?=
 =?us-ascii?Q?sSAadynCfD5eHhBCLJ9R8yqmLVr1zHv+1ZW2St2UMvUvAPg3Dgj96IrG7P27?=
 =?us-ascii?Q?4lU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OXz76H+XHEKUoQ39dznW5zqWjI3zL8U36N4T/vu/UkEO/EveFsiSg8MlC9fx?=
 =?us-ascii?Q?4QywduHK+lTK8/MZVFZjSYvepbVebngHaQCjeq8iIXk60vvhKsxwhEiOLgas?=
 =?us-ascii?Q?ZJgh6xTL84utnWKVzuEc/+nmph17MwAqnIAe50B0SDAnURqG1Sk3Uc0AxZBZ?=
 =?us-ascii?Q?wQEEprWraafr4vdfQPo+CN2wACiiXQD5K+xwxZlsgvJF0yhF6RIzcFgU6J7e?=
 =?us-ascii?Q?WqSZ6j+8m4cdwGxQqTnjLNsnZi5FArgyYGyrJ34DV85g9bHTYYGavmvQqOUb?=
 =?us-ascii?Q?iat+jEJZ9fxbTRHxOm77SYmg90CqI5dkVUYnlnlG6zZj62H35WFemF/fQqO0?=
 =?us-ascii?Q?XI5WI9eMj44UDFmb7k0zBRfwTZ3/P7Qoqz4c7AHMgWeFnH/KRQkjnnAQRCJj?=
 =?us-ascii?Q?e2fAC5eFYnmHi/ohP2WzMEhh2Uc53EkEkSToAk0W+Wf4O67e0QFMthdmcFND?=
 =?us-ascii?Q?MX6jyT3Ki3AI/caklNOTgl2NH0ibFl4j7/VKCMMwM9p+mko16EFl+tctdyxZ?=
 =?us-ascii?Q?iJWF6rtuQpNpLO+DBIxx0koGHuPsl59ihIAkMDafAeY1+vpEneytfe2hQHQz?=
 =?us-ascii?Q?JzAhc1MvGQ/klqP4i9pPD0TW3URE0R0RcEMOWAU26hEcDqisZKYqyf3ohI3j?=
 =?us-ascii?Q?LLQ1Iwg4hWJdwqDF+U2W/ivCW9ZV9ybW8LwF287F0r2LJ4KLsTOTdopyE6Mw?=
 =?us-ascii?Q?YR3Gk018TEqA+Ks5nH/vSFMBhia2XTlnKATo39ZOwoOseA5EWXclNlKrUHCu?=
 =?us-ascii?Q?piRqWQWvfoBdE/GeIAUwOTgemMFCFrD2bhAmkWsEQbFVKCmlxq4v8INp3v/+?=
 =?us-ascii?Q?hnzUORWtqO6rGzqalUrLw3dePexq1L9R/LjHLj0w1ZxlMYLS22NLnoOtGLjm?=
 =?us-ascii?Q?Sxuy0RHmD0MiXu+XWWcvGhr3mVXk7wPIPKK5MKV335Ks9qVrN8yi0SGp3Zpv?=
 =?us-ascii?Q?rwERyAS/bhJVM8rmY3msV81uCRmOWSjHuV6YetrmApyiC8G1PLLs0uybfEGN?=
 =?us-ascii?Q?pGrke4qzKXCOa/MKtI1h0X/N0QfrDQN+QX1riWzuvHww8ajw4/TxRpU8Tcus?=
 =?us-ascii?Q?gw69y7DTUndWToQOa5xBwhtx5X/ZS+s0HnGGZSDbspajrN/13PHiWcja/aJk?=
 =?us-ascii?Q?6NICjU9tqD8DLmpNl8N2hDUWwcHKCVnea3Fe6FHkRW4RFa/rJdq040fWMavM?=
 =?us-ascii?Q?ZkhMIe4v20mkeCtuCq8gQL+JxQ/MtyeEA5qbDS8jpI2hu9wSUeg+sK6LZ3ti?=
 =?us-ascii?Q?mNy/tCaHUMh47z79Geq62ZZ+gXf1terCQvMOxkml8qRbei+uyrZs0Ppoy6iB?=
 =?us-ascii?Q?MtwLvJFYxYW9NN02K2Jv0yD8xyf75eKpCuACGRHN64JMRz4RQGoShr3IN/Mi?=
 =?us-ascii?Q?6ZOH0c2k07wA01SoA+OseOa56X8Sydw/uUJ2SZTrYERqWTVY5ebLKahNP0Ne?=
 =?us-ascii?Q?mMfr622IoiY6Jn5B9Dv0hoCzxVcMSmGmsYP8nWqTIsiBTghgXgKScpS44UbL?=
 =?us-ascii?Q?chsuIsfWgw31IbPyTbvRvvA+pAF+zvZSukZGYkH0fCXiZeFRAwBKo5wllNkd?=
 =?us-ascii?Q?GZzXpJ+b8XN5hBTMfckcQjxtYogY9aqjob68LXYi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282ad4de-f6fe-4a5b-6bda-08dc73b2b409
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 01:10:54.1037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyaQpPZONRmIKI/R31qer0/LcZz242hDCfg9ra7Qhw8r8CnLdh4m2EXp4KX3HCAdfFvDFtvaDnY1HSpKAL4oXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
X-OriginatorOrg: intel.com

not_report

The old code before this commit is the same. This commit is just a replacem=
ent.

diff --git a/arch/riscv/kernel/syscall_table.c b/arch/riscv/kernel/syscall_=
table.c
index dda9137649034..6f1a36cb0f3f9 100644
--- a/arch/riscv/kernel/syscall_table.c
+++ b/arch/riscv/kernel/syscall_table.c
@@ -9,14 +9,16 @@
 #include <asm-generic/syscalls.h>
 #include <asm/syscall.h>

+#define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
+
 #undef __SYSCALL
 #define __SYSCALL(nr, call)    asmlinkage long __riscv_##call(const struct=
 pt_regs *);
-#include <asm/unistd.h>
+#include <asm/syscall_table.h>

 #undef __SYSCALL
 #define __SYSCALL(nr, call)    [nr] =3D __riscv_##call,

 void * const sys_call_table[__NR_syscalls] =3D {
        [0 ... __NR_syscalls - 1] =3D __riscv_sys_ni_syscall,
-#include <asm/unistd.h>
+#include <asm/syscall_table.h>
 };

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, May 13, 2024 15:56
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [arnd-asm-generic:syscall-tbl-6.9 30/46] arch/riscv/kernel/syscall=
_table.c: asm/syscall_table.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arch@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.gi=
t syscall-tbl-6.9
head:   e0d7a2fe9b74052a280531e773ebaba59e2d523f
commit: db45142644e8dc6281d8091b80dc827421245d86 [30/46] riscv: change to n=
ew syscall table
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405131504.7yK7W1Kn-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/syscall_table.c: asm/syscall_table.h is included more =
than once.

vim +16 arch/riscv/kernel/syscall_table.c

    13=09
    14	#undef __SYSCALL
    15	#define __SYSCALL(nr, call)	asmlinkage long __riscv_##call(const str=
uct pt_regs *);
  > 16	#include <asm/syscall_table.h>
    17=09
    18	#undef __SYSCALL
    19	#define __SYSCALL(nr, call)	[nr] =3D __riscv_##call,
    20=09
    21	void * const sys_call_table[__NR_syscalls] =3D {
    22		[0 ... __NR_syscalls - 1] =3D __riscv_sys_ni_syscall,
  > 23	#include <asm/syscall_table.h>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

