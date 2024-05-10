Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584EE13A3E3
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 01:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715304598; cv=fail; b=S/Pi2432sbPfHuz03zwC41kPpnma3tuey21+Plt2Fx897yVxvy0xr65e+QP30iZRqnaDDBQf/02zhcr0wskUFqmhHELOx16B8Ul11I1X+v0aOvYVqdmvjLKAYKMCdPzXndoGi+Zzrhcvx/3D0xmfH2PZ0sNLIuKbgyEo0Q1X8A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715304598; c=relaxed/simple;
	bh=Kdwg9g3pcSSkZrW1TupDKDflVY7PW3srAdo/R8zUzDQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MXeiVIJzlP024OqhOHOwZL5A0jAgMXqRQyJQFlXlHf6OaWP2+eD5x3jiliRLTRCXrBn/sbJ2PjJkC1+VyXpUnl3Tiiu5J8lPJPNmErbWaM2A3KaVc32iz7VBbH+vGwU6aBAuiUoZ2UJvOahOSb01R7Nd/uOaPijxgikZHQfQ26I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3X54uYg; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3X54uYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715304592; x=1746840592;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Kdwg9g3pcSSkZrW1TupDKDflVY7PW3srAdo/R8zUzDQ=;
  b=Q3X54uYggbMYLQwXjsLaApbnoXb4Nd4BmjxwZwf4rrAsSKCsGLcwdDrQ
   ScW26Ad43g6nisd8juTBGf6CijAumSq5CzkrAsg20OMLXD0wM2XMZXePz
   BTwoQHg43saDc2H7JrV748dtJawIHfqBIaQKF2w+EmC5lojO5AQ9mtq0v
   9nSe9oRIIXd1bTBiqW1fFPOWSbsiPnzarhyjuAgGcQBSKxxpeA1SwkkqC
   QpVJ3w4qJRTKIPSD1MJjP0zOk7f99Zp/0M5Ekh+sfrvtG1MBBxn1D6wAa
   0PCLATei+8LpB3YV/ePisYxy9F3wI7ILKvmWqbW1XEL20h2XICfVnRqJF
   Q==;
X-CSE-ConnectionGUID: nTIlbDfTQj+354xnGhWZng==
X-CSE-MsgGUID: Tj7UHgNTQ5mR2v/l5lo4lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15099327"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="15099327"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 18:29:52 -0700
X-CSE-ConnectionGUID: jbYOqQAsSxa1EbihKeGZww==
X-CSE-MsgGUID: zrnAhRz5TeuS2iPM1tzoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="29826131"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 May 2024 18:29:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 18:29:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 18:29:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 18:29:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 18:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COm2AA8WpXKTb82O6J+OI3KRA/oClE9N7IrPTMCYdRSXxwYOJH1qT8JfJ0eWwH1pVCDafFEv1hxN+C3791Kvxcoxz7SEwIyPRdL2AJZ3DGSCqa3+KZigR7NogCNqtnXLOeA4h/3k9mUz2QfqF2Aa5yplpHq+d5cOFYf8slK/z2OyPYAklWIFcU99B7VLjLoSUZNwweAhMBda1UD39SGlyAFE3QQ9qvCZs/Vxoov97dblAkPvTvNn9AW+iCTgM4IuOxr2Ok6sN9X2vDvrYrQC818BAH27rtc0k5+5yQk9FD3Skp/7uwa0V7FkIqsPX0zETsEfcdBzo8IPNQG7WvqTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcJXxAV/50SQ0sBKGMsujSFYcCeUlpprWCcFNiwrjmE=;
 b=XGuwAC3qFqiPWlE5o51tx2QOruD5dBDuEx3VQJJLn9o7cCq0umDF0g1tovs1v4Os17g4SSRXVd4U1cYrdh2ExaofXA9L6ti3LBpVTIZ65tWgmnUlsMq/IP0aVlUUB9QrZGtg0TwBTeJ5JginSZxOiOWbdB3MZXBLcx2qx2p3Wt1ox5Ow/ttxlVcRin/Fi21qQCQMRGfvq6aPY35YzPGzmOzmcTx3ANopJUTtf91dQPlpJE4LBH7JoRlJeJqs4OyMiR+ih4oll0rsCDp41e/n8pLEH2PR1YERMHLCPgBRDZGNfFhcXf23T2TwHJVG+7CVm4IjrLTy2K17rgkXaafD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 01:29:21 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 01:29:21 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH V2 9/9] tools/perf: Add support for global_die to capture
 name of variable in case of register defined variable
Thread-Topic: [PATCH V2 9/9] tools/perf: Add support for global_die to capture
 name of variable in case of register defined variable
Thread-Index: AQHaoD1y36EKkVjJYUyIjGImLPK277GPsajA
Date: Fri, 10 May 2024 01:29:21 +0000
Message-ID: <SA1PR11MB83931D7AE4F871986D549456FBE72@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405071044.ww9iNjyo-lkp@intel.com>
In-Reply-To: <202405071044.ww9iNjyo-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|MN6PR11MB8242:EE_
x-ms-office365-filtering-correlation-id: 5464855f-3de3-46fa-6967-08dc70909e3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?xutY5W2Ehtavka+c416+85RxRagS2R6z7i8c2CowybzQlD3ytx7xBtwX4ZhO?=
 =?us-ascii?Q?tf9AQb3lPv9H9Vgvuc9tha/rsrduYq56ZoGBkaBGfLpNe7RVZ03rvVYp+RSp?=
 =?us-ascii?Q?4nqMPEsy0xN4i1fpMb2BctcfCB9+6pG4vppuYoqDdMejojaoy6a+FJUhPXjD?=
 =?us-ascii?Q?l/xZdwQrMzTx7NPoKxj3WJi3WyUP6uEtu8kBGQ7Zu148SEJ8TJW9gRi3tjMp?=
 =?us-ascii?Q?HZrwDIHAJbVtjr2kAZOt2BwGJP/QYNl4gKwYb/IZoYzMIkvw2Ve3cL/7hl4o?=
 =?us-ascii?Q?sCmnv89Fbl4KQYz1RS0BRWpY5YK0oBv46yKSIfRclML9FWPin8kb9v6jcgEF?=
 =?us-ascii?Q?W2tp9sVW75A+8NIzl19T10q0q9jOcKctJd7kjDZ6fhUts7m65hnIVeP9B3ND?=
 =?us-ascii?Q?lgeAGQfnpUTgOGl0p8Uk03RcWmeO6Aw3v+1o1P0dtZ0Vrl/D4ahKzwRiC8S6?=
 =?us-ascii?Q?nCficsNUpTQs06fwW9xfnZlOEOwn8a99HJwUt+pMmhxdAJE7kcBzRY7uT9Vp?=
 =?us-ascii?Q?jQK3uXdPrZ4fSXPkEfOPkzL5lkictNl7QRywu6nUV6pVQPtdC1VoytA10xZb?=
 =?us-ascii?Q?rGSMh/sURJn52BsuimG4eQ3GdXb3bKA4lzv1ytawuLPuMdRBanke9lddDBwh?=
 =?us-ascii?Q?zmDuc45Ap7Kl10R+OMN3ehmTRml8FeUyZX/jqLR66AsYMo29hgl5InspUgmG?=
 =?us-ascii?Q?1JmbZ1Xnjg0E/qP55aUi7mRqKQ+gsySo3zik9EYk2SWdm/p8JIpWfZbBKKOI?=
 =?us-ascii?Q?AzYgT9qLbMYdLaAY9Kq1AIOk4t3OXrlsE3cU7UXjHqYbN3EilHLZjcdqmFo3?=
 =?us-ascii?Q?qPNm4o08pZ0PSpSd4AMSxcq8jeLNimTMGqXTiY5ZEaKLdyF47DSCcqZbSCqE?=
 =?us-ascii?Q?LQths/D5vJDyEsEkbVxbKszE728/sCDifDDvpBP8KhTm3b+ms4e9G5FNyXzc?=
 =?us-ascii?Q?lYtQ1gPwSeGDPMhCRppNOtudJtp1Q0iPnQ4EfFatEus8Td8I2pTbzzQESEzo?=
 =?us-ascii?Q?yCneFysBJD6bhTef3+ztlq8sPk1olUas3DVC04BOzu8SjOFg5VuDWZRWZavr?=
 =?us-ascii?Q?hyCvCIlA6XPzgjd0tfQ8p5B6/Zso3+lHhd1iV8oJPpBke1YG8I9I+paGRmlN?=
 =?us-ascii?Q?2gbuaNGtukBAgbZvyf67pmGKN/udMD112rlCM8Ux2qlwO2GNrdpgG2W+nwCu?=
 =?us-ascii?Q?tHvU164zL1gqBkyryCtm+87uBElPWQjr03CM9obf0nvc87dQVSKsZNMRdDLL?=
 =?us-ascii?Q?vASmziR8vThXUeqsOw/aGTFwvjxJ7JqBjy3iX/MGIbJ4QaEG9gResYK5tUh+?=
 =?us-ascii?Q?f8c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LNlNumRty07sCb2E80dS1taoQKRg+zZnc/a+Kw9+jRNeHGvKypYA6ynOr/Rh?=
 =?us-ascii?Q?de0giPp4rwxkPeTH4furmJJHkkoCPf2ILTEWkiBvuFf6ESh1c443qYKOlVcd?=
 =?us-ascii?Q?a1TJ/lNJ+4aGt59UJkwraB0oeyWoCmmOFtRc0zOumaJwX6+OqEi3zyqJidjS?=
 =?us-ascii?Q?N/m1miT/KMyCKs+OVRipHfjAs7SDZcSzy3yqRVdWE7ZP/r133ytkD9551MRm?=
 =?us-ascii?Q?Emb1CenQkybRg9nXF1EJmuYhoLYib/1Ufn4Ir4ZEoGIEYbyimT9KjZJrlQGD?=
 =?us-ascii?Q?TzmeWcmj/fWPp7UDhBjZnsuynAKoyYjo9PRQxoS6fZPEpOzO8HSNW0zbqZnn?=
 =?us-ascii?Q?Pg7mT4bwa8k3aMpmrN6hvaeZnK02X7HdwCJmRO2blkgmoXukR8x4zBI+d80j?=
 =?us-ascii?Q?BevRg7iKy96NXgzEqDsIZTU2IbVlLD32wOYqg42nLrPyAnm4mnTO9/GSxlYY?=
 =?us-ascii?Q?Nv98XxrKZu5H67jLAHOSqnk9ESrP4VehWxEsBjJ/ICAjfxrc3bZEywt4NRLT?=
 =?us-ascii?Q?Vx6SCH27Bhnp6Nfw4clUG+uu1buCVEjHahbH/aPB72K22e9u7GHWHIPQp1oJ?=
 =?us-ascii?Q?ePn/KhAophwXsioEHDae/o+NbAzLx0uOkTDSOr48yu3+lXiJ75Q0yU7QiG6O?=
 =?us-ascii?Q?GDUayNn9ywDQw51pbJxEvlSuhNnboyoW3+r4UKh/cUq59iLGg4zP1O1oiED4?=
 =?us-ascii?Q?rirvPZGGcEEqtrmU8yxLUBc3YhJfINecjPJP5UCMD+ULKHd91gVxbmr3u1l1?=
 =?us-ascii?Q?hZx3nFPh5tApHk++7OWdCGQzVgWO19QCu51ROmuILVGIjjLrkNzotMmXJiEm?=
 =?us-ascii?Q?189lM/8JdWmnSs6Qh3EP2UuleOHDa4w9rAfmjGG+JeAiOUIIpSHq39tPh+t8?=
 =?us-ascii?Q?VLt8yvCxq4XdUM22jFf644lNKCG3+iVmBFZO0HU6yfLRf026rylt3MSymR0A?=
 =?us-ascii?Q?PFNnpriHuae5UI98Hvb/M4MB0O3uv7XCsAs7hCz5QCSgxJAOMpsgh92BUZwD?=
 =?us-ascii?Q?h7HYxoqnr4ygrlG/Y0GPOkZM+jRRm85hgseE7KHhdYQ9YlmzSoKdDiWJo3TN?=
 =?us-ascii?Q?R0V6NzuUNdlrjX18XpqvpGLM7vToqt63hrh5yI4XjplEcEEAdVSOX8OaKitO?=
 =?us-ascii?Q?6vNquIgUI0v7+1pA+lMXdCwgI587sIabkTCzDBNYWvH+JLCr9KHLGs+fdtpc?=
 =?us-ascii?Q?aYKgERR4VbQTWcKvOfdyuuioBwUzdKTHhLf+UUluRWSbe0k10XsVp6GyWWro?=
 =?us-ascii?Q?NKpPqjSAGw6SS+2BXoqzmjVz+VhmtypiaOMJMVVyE60n4xa2/nl1FdJfozZG?=
 =?us-ascii?Q?2bIz/DGIkEYVo/yQ4rB3QBILn2uYMDU6tiV+3NR7t6hNXNv29nDDzcB4O6yo?=
 =?us-ascii?Q?kkUk7757mWvlrohhfor1lWNmKi1gaeJGrPI+ieNLfAYCOfo3/JUydUfsFGSS?=
 =?us-ascii?Q?LmtfezlAMOAyXS7iDxQYsm6NlRWqhDGb+7LWN1spdm+fzMPcMjzYC7Hl1bEZ?=
 =?us-ascii?Q?viYg/LmvwLg9Eq6DCemqODyOdJMcy22PCyPUNr1hJlcE8S+q3PCGFXqAJafI?=
 =?us-ascii?Q?/mKEvny+0LjAupLD1VLSJpWbN4cZhLFao5VBLGsM?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5464855f-3de3-46fa-6967-08dc70909e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 01:29:21.1925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ux5vYe5ENVu2CwTKQCWCRXUQpAP/txqgS8KFsGQ3EhTI50wsI+lD6V8qsPMi2PH1fhd/pkUawH2VUrRYL4OsxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
X-OriginatorOrg: intel.com

not_report

Possible to be a gcc-13 bug.

No error if built with gcc-12

root@1d8feefda89f:~/linux/tools/perf$make CC=3Dgcc-12
...
  LINK    perf

Got the error if built with gcc-13

root@1d8feefda89f:~/linux/tools/perf$make CC=3Dgcc-13
...
In function 'dso__findnew_data_type',
    inlined from 'find_data_type' at util/annotate-data.c:1426:11:
util/annotate-data.c:313:39: error: 'var_name' may be used uninitialized [-=
Werror=3Dmaybe-uninitialized]
  313 |                 result->self.var_name =3D var_name;
      |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
util/annotate-data.c: In function 'find_data_type':
util/annotate-data.c:278:15: note: 'var_name' was declared here
  278 |         char *var_name;
      |               ^~~~~~~~
  LD      util/intel-pt-decoder/perf-in.o
  LD      ui/browsers/perf-in.o
  LD      ui/perf-in.o
cc1: all warnings being treated as errors
make[4]: *** [/root/linux/tools/build/Makefile.build:105: util/annotate-dat=
a.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/root/linux/tools/build/Makefile.build:158: util] Error 2
make[2]: *** [Makefile.perf:727: perf-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC      pmu-events/pmu-events.o
  LD      pmu-events/pmu-events-in.o
make[1]: *** [Makefile.perf:264: sub-make] Error 2
make: *** [Makefile:70: all] Error 2

The code itself has no problem.

+	if (global_die->name) {
+		strbuf_addstr(&sb_var_name, global_die->name);
+		var_name =3D strbuf_detach(&sb_var_name, NULL);
+	}

+	if (global_die->name)
+		result->self.var_name =3D var_name;

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, May 7, 2024 13:13
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH V2 9/9] tools/perf: Add support for global_die to captu=
re name of variable in case of register defined variable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240506121906.76639-10-atrajeev@linux.vnet.ibm.com>
References: <20240506121906.76639-10-atrajeev@linux.vnet.ibm.com>
TO: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
TO: acme@kernel.org
TO: jolsa@kernel.org
TO: adrian.hunter@intel.com
TO: irogers@google.com
TO: namhyung@kernel.org
TO: segher@kernel.crashing.org
TO: christophe.leroy@csgroup.eu
CC: linux-perf-users@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: maddy@linux.ibm.com
CC: atrajeev@linux.vnet.ibm.com
CC: kjain@linux.ibm.com
CC: disgoel@linux.vnet.ibm.com
CC: linux-kernel@vger.kernel.org
CC: akanksha@linux.ibm.com

Hi Athira,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20240506]
[cannot apply to tip/perf/core perf-tools/perf-tools linus/master acme/perf=
/core v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Athira-Rajeev/tools-=
perf-Move-the-data-structures-related-to-register-type-to-header-file/20240=
506-202255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240506121906.76639-10-atrajeev%4=
0linux.vnet.ibm.com
patch subject: [PATCH V2 9/9] tools/perf: Add support for global_die to cap=
ture name of variable in case of register defined variable
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build):

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405071044.ww9iNjyo-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now=
.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All errors (new ones prefixed by >>):

     PERF_VERSION =3D 6.9.rc5.g88acbd2c1d13
   In function 'dso__findnew_data_type',
       inlined from 'find_data_type' at util/annotate-data.c:1426:11:
>> util/annotate-data.c:313:39: error: 'var_name' may be used uninitialized=
 [-Werror=3Dmaybe-uninitialized]
     313 |                 result->self.var_name =3D var_name;
         |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   util/annotate-data.c: In function 'find_data_type':
   util/annotate-data.c:278:15: note: 'var_name' was declared here
     278 |         char *var_name;
         |               ^~~~~~~~
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/util/annotate-d=
ata.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
