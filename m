Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B282D9C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 01:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717464244; cv=fail; b=lywJ10BvlKZ5wvTeiLWSyBTGI+ezVWC5imOZGNBj+H1Ni0EsTt9O7NVeRVmbrXJfbEKp4E/i8Qo5GJ2CYahUf/YYgf1Ir2hvikTcXejokFnWXKNIoYOid3RcHm6mQcJ3FLGr6FMZUauJkPY7AjVKyDF+eoisuCt9YikZcNQnm1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717464244; c=relaxed/simple;
	bh=ggFDuzYynzjKUDOSYlPhAIFS/MYVelDhM2LJrMsX904=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZxyOZfIdRfju+4ke5QQZohA4yNg7azVu/T0KQdSqR24z0vq/WewljgEpqz2wPffY+pRTAv66RGXn1cNGu4KGVCY2Y8BGgdl8FBUtwGR3mMJoQLTaAi3jGWq8h7P1O8o98igDAQe9XUR/FzmhryR4Sf1ALdp2xSEl05SUmvw98Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gX3KHWqH; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gX3KHWqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717464242; x=1749000242;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ggFDuzYynzjKUDOSYlPhAIFS/MYVelDhM2LJrMsX904=;
  b=gX3KHWqHDccz/Tb1EeZMqm/DsusaEZKIBIin2xhCS6Kj6bQlu4C5JVIx
   VO17f5S25eD1xWHpvr+uQjSl1vedaSFzTcuediZdM+DCpCVyzwAskpwA2
   ntRI23IDBhUNN8hsyY02ltx8kwsFmKjvmAmhzkU/kXAeIl5g50xpSqWBm
   ZRJBm8jNG8eBfZ/5aul0PTW81w5pZ5rEpwNDUBEF/igus0F5lLDQkrnL/
   P3EamdZaKDThp0si2npNR051isrxJgQlC6XNXfzwWXaU6v9d07JF4NOQU
   86WrgqFsyEVaCkQR3CiebRPCNJXbUCnZ3Exhe3DrswhjNvxt9rbk8tXz+
   Q==;
X-CSE-ConnectionGUID: 6KTt7jHWT7a7vSRZo96kiA==
X-CSE-MsgGUID: cpIvtD4/RWSgdnRbEBisag==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25382562"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="25382562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:24:00 -0700
X-CSE-ConnectionGUID: EOVyIj07TdmIBt79QS+owg==
X-CSE-MsgGUID: LmlIjTkASOyvYPfYqmNHVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37175763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 18:24:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:23:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 18:23:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 18:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beCvMbIR8WhGeokvZJWrPP4mQhz0I9a4R8IvzwXXrUVU8pU2c9Pbn3nZzfEnBfF8YLrsVSA/73BCm+zxDTkvJZnbQOPf4iIJ/aGhFQEnkG4XMY+t9fOkCi5SsrrME5bjQ7oNOLY69agw3eyyQGbScMeQjfBGikYNL3+DdqWIiK/2cVtUDYli2jYD5cAU6fwALFVJben7Og/6m1x2O1NtcjVzlUT8/js+HK8uYzKTV2rQ28alkyYxD7XjWXtItsvNWEWgFibxxbn4Ni/05aFSJa3fKNhI/LfPmGLoAfoAYJ1vMat7+C2Gb8sa7xbWt9rTY8CpVswZ/57vcrUua4R47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh9Z+MHjx1vRH+uiQwZWem23DgB4FgJ3ucg+NwfDJ6c=;
 b=NQeYqzSr6BisbKtpB1KtXIAOePgxcBGzHR9Y93tNZaOGM9XhtPunQ0AoyzmMCmVdkuIuTAy79TZHZSr3d0JB2Y1MlbEaIs+opGTSQJGk5Q+k4i2FnKLh8r/mxYunF5HitYEYEQyQ6N5n3EvkXviryLsAtN772/flGOJQvIdoSVZtuBaLjBfJyT5qcwJiSw+tTvq1TwrR2z3af2XG5VP5JKj1OA9KRjqHpP9aeoOR8qfd64Qqvqo+JOvIo8fePId2NHd/WIxTcELcov72QPIYtae5o8akbMCRIPhqFt9jOTrfd9m1YSt+IcCUhkh2PEXXpJ3/JtyE4ytVt4ro7HOVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SN7PR11MB7440.namprd11.prod.outlook.com (2603:10b6:806:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 01:23:57 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.034; Tue, 4 Jun 2024
 01:23:57 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [djwong-xfs:health-monitoring 304/310] fs/xfs/xfs_linux.h:
 linux/seq_buf.h is included more than once.
Thread-Topic: [djwong-xfs:health-monitoring 304/310] fs/xfs/xfs_linux.h:
 linux/seq_buf.h is included more than once.
Thread-Index: AQHas6UpFf7C58mfVEm8EyXmAylGq7G21FXQ
Date: Tue, 4 Jun 2024 01:23:57 +0000
Message-ID: <SA1PR11MB8393B9B0C6F7F58DE0EF7A5BFBF82@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202406010535.QgK37g3c-lkp@intel.com>
In-Reply-To: <202406010535.QgK37g3c-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|SN7PR11MB7440:EE_
x-ms-office365-filtering-correlation-id: 82682d48-09ce-425d-19ad-08dc843501c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?U93dA/nqFdrNP6sPsG5k5WQPWPGO/rFnEHQv3S66pZC1HD88v5YFNJCwhptv?=
 =?us-ascii?Q?G8mdP0aNf9lbnvrwpGiR0Ud2p4+CEzdZ/2wE9rzxS22KUiTiZgfG4ODfvwxk?=
 =?us-ascii?Q?sgdrrJKtJ76aBry4yWVTMh9xNBq34dEkDoo0AGzn8riFinysPEtMB3xbtCTE?=
 =?us-ascii?Q?+Yg2tMLIt0nUYMuzY6GoVCl9+33WEelu/Ywqb6hRw8bu4hxvMPGSI7vp2TNa?=
 =?us-ascii?Q?TEw8vwLhayt4KXWizmcGUabEe2IP6R3m8DECOI4bIx45mMpZ1qeMRK42g8ut?=
 =?us-ascii?Q?8r+O+wiKPbcD5PFmy78cyRDESEVg13R8q2cOfwJLewceDK/HIhws0ZgsPzTL?=
 =?us-ascii?Q?qwy2cH9C3o4pIIhNiaWtElj+kQEURmw16/ZwoUUIUioE2lrVojYjt4RhFjrV?=
 =?us-ascii?Q?IEkm0fyT1unF3/LgBsMuzmDGHrtJ3JUhB5Dx6eAB48Xj4PNVjHsbNRP3JWAm?=
 =?us-ascii?Q?WcSxjsKqsvCD6noU1mFU3c4hdiLBlizBkURuraietYzAeVd/5AXwl7UrSLPX?=
 =?us-ascii?Q?btL35JBNeDFOAuTfoDAx1IvDQzFLmwBOuaUk41qwmJKW07jZbkDNWR0a2Dfn?=
 =?us-ascii?Q?EpybS5Z6127YpCQ39vJa7AwjJeuwFyRlIK8MRksNRd3xiQ3RgQyA3R+InSNJ?=
 =?us-ascii?Q?0OsY5M6mj/iR84fqhsXwvE33hN9r/bvyutfT6jzDEkz54IVBt0ZyQ3n+Ef9w?=
 =?us-ascii?Q?QgwYfw/mOhNyHQeX3kR+71DfYhm1VJg6jswySYrJv1BmpzLwDVCRKVaWRzL4?=
 =?us-ascii?Q?rfrq6jaLNpRqulsqoCsUdH71ytixLXwEwcxKc7vkeDnw30oI04S8GD97XVoW?=
 =?us-ascii?Q?f1AtYSnZhvoQ1dc4dFwWxX0GQVugcxTHrW+L9DjPkDBV5Mfn5spBoxjIDoz5?=
 =?us-ascii?Q?aiZYPuGiDqr9zowwi+7p9M3U3NascMaGBvN59YVNGUx86EIKRNJsYmL1Ram5?=
 =?us-ascii?Q?iFJDduQZigV5HYbyzZ98j64bie4Irf/SeNGq+W9AITl9EEYvqq+tDwHBxk+n?=
 =?us-ascii?Q?h0jt95tRGirM6Jn8rVR+2hYlfO9BGtiEyC6iIq1409n9SGtFsH7EBC1RKupv?=
 =?us-ascii?Q?PdPnx8vrMZC5JvtLnbCGjwMeb7gR+yhg0v/a4pRGmy0mt9F7+8brtCgucdTV?=
 =?us-ascii?Q?nuiVX+ibbHJ0kY3XyI0EcRSnE+oUkA2q1nze6GW+ezmpFYpIjeZ87BcwNRmG?=
 =?us-ascii?Q?rE16NS4n+vCzWEa2E/XxIjZ1CBmc73kermfdHxWcGWvukyoWGl5cdnP7Vs/L?=
 =?us-ascii?Q?l8ZBM5jhr0gUWNJYXd0vq0/DC49hYZgUdOynF2GqEOmn4EBskp1Wwd3bsIZ5?=
 =?us-ascii?Q?BYA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MApk3R/mDh3HjAnpClvgK6sYT7HV8A+GPNHVXUTXx0qyCI0yCt9/2jvzM1du?=
 =?us-ascii?Q?67HLDez5nOiXcjRZV21/LksvHobf3AbJLHtMFpVbXHA8wotvVRojLWXY8kuK?=
 =?us-ascii?Q?jBQPcPr4wjCkrMfeYQGZe2/XDd3/favH5DLJSt619VXvcGzhwlIp60YZuuAt?=
 =?us-ascii?Q?RrZr7V8/prJtnxBYoya3MiVeteFymyVyWzBVBl3G4/EVFY/6xajwxiBXs7kB?=
 =?us-ascii?Q?BrCDNfJBrrCJj42wHygy5umpPFYcNSEmOs1rswl/KBzwMjUIkjZXBjNBghDL?=
 =?us-ascii?Q?eFMSnP8KZCp7QInh3la/yVvii45RI4pykfkdLHgSwhGtOARJRte20z2aXqz7?=
 =?us-ascii?Q?eIhPooGxu6mqKEHCJyT5Mh+x8Rk90p3ajm574mox5KarsbWvdHL6Xf20cNvh?=
 =?us-ascii?Q?wlJAB+veU/9WFiIdlxUuLT3mlkLM5guBHhTVRUsUR3HY4ZlxRaNGvI/VtjbE?=
 =?us-ascii?Q?+yYbhty+mWqFOL78oqkvNTWG0rDf/JyyBLzghu/kJEjGJzTBEUpAiT4fsjEf?=
 =?us-ascii?Q?xaZHeprJaxrNKhN6f8hN/JEWnrFyQHQnaD/7QPSPE/QZImkwS8uzY6Hym+qK?=
 =?us-ascii?Q?Qs0o1UVBB3A694yiQMBiH/jqAwSk47paa18Vj4/EuZ3w7pWCUXCyCMgPa07m?=
 =?us-ascii?Q?YUCCOhjXDKUT/jbkWUu9rLAYVEpNYB5tc8F12UBAYT/zTJlfPFa74v6vw38n?=
 =?us-ascii?Q?7W1J40QOCcr00FHqzwxxHcVeGYMCSADjIlgs1OdBMyadEf3MoXj+ekiCnK4B?=
 =?us-ascii?Q?QvVuFrjEQupZ1xN9/BC8JNwWIAuZz5U6CYgymucamkvFQEU/6xl+t3VBqw2Y?=
 =?us-ascii?Q?erJm46bqYaZuZKsT79dt8WTG/tN9S0zR60/sunQZJbMx8+2zxc5ySPWDDlKu?=
 =?us-ascii?Q?5BmyyjPy9kRQmxOebPNw5TRqEAOrk6RGd309dcId8nM/aFsTCxpJNET52Ktl?=
 =?us-ascii?Q?xSuU4lGfB9tdLa8KnoYHr+z80IpN7904YsIS1FqoetG6ugXh6ZU7jYdBv9UX?=
 =?us-ascii?Q?/oReyPU05AmB7lxhf71yBZjNWTshEB584AcHPQAAtyujpJ0tVYJhkS+wZoIV?=
 =?us-ascii?Q?qlFwJsTR84WFbJ9k9787VUA22H4I2bIOnbVbHxHn3e6/KyAljwZewa5i4ifx?=
 =?us-ascii?Q?Sk7Iz8YgI7gv4CTYoyGK1tXWpJ+e4HHl18M3wWZRKVQKSEkiCShUseAbhlr7?=
 =?us-ascii?Q?lMXrKXg3jy5jgRgJmfvjjvh9YycI/KMuwvRDiRw/ytB8yEYgXF2FLvWOCm94?=
 =?us-ascii?Q?WQdgiFFef/mXnjMFGy3wHbLCW+PC0ckl/M+36RffBdBsdiOCucGhsqmcpx+X?=
 =?us-ascii?Q?sXBMBCNRTuYOxaLh0p/UYrldaF8q65XrtQuYirvICv3y3eDtstTWXmdnw4d/?=
 =?us-ascii?Q?+hGVyAa1vHnZKyP8LDSyab/dQby5rtDF5Ori/vYtD6tWbZRPey/ZD4mm14/E?=
 =?us-ascii?Q?bhL8YDC4/NFqC65mcQ8MBA4stbsEikKdnhnspX/lLlnC9UxplV5COb2eWqPs?=
 =?us-ascii?Q?pBK03br2S4RUYtDkOfcFQdjtmWh+O6LT2JOyNhVjyP8JywnwTWjQHLSpB1vK?=
 =?us-ascii?Q?PnoD0LTArpiTrWmVF6gLKxQpKYdtofJGPrZf3M70?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 82682d48-09ce-425d-19ad-08dc843501c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 01:23:57.7427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oe0uHiDgBxsfmU41pmryXq1oViAwTtmpriWwR2fa5uSvZzPotQxRwu6YqgVy7E4fOeiJlrLFqq53f3Pd2vc1Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7440
X-OriginatorOrg: intel.com

not_report

guarded by different #ifdef macro

    66	#ifdef CONFIG_XFS_TIME_STATS
  > 67	# include <linux/seq_buf.h>
    68	# include <linux/time_stats.h>
    69	#endif
    70	#include <linux/sched/clock.h>
    71	#ifdef CONFIG_XFS_HEALTH_MONITOR
  > 72	# include <linux/seq_buf.h>
    73	#endif

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, June 1, 2024 05:52
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [djwong-xfs:health-monitoring 304/310] fs/xfs/xfs_linux.h: linux/s=
eq_buf.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t health-monitoring
head:   074ce47a8bd5ff767d2a86c6669ddba0d3a5526c
commit: a95f96985f277dc4ec03d9244c19969360b99eaa [304/310] xfs: create even=
t queuing, formatting, and discovery infrastructure
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406010535.QgK37g3c-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_linux.h: linux/seq_buf.h is included more than once.

vim +67 fs/xfs/xfs_linux.h

    23=09
    24	#include <linux/semaphore.h>
    25	#include <linux/mm.h>
    26	#include <linux/sched/mm.h>
    27	#include <linux/kernel.h>
    28	#include <linux/blkdev.h>
    29	#include <linux/slab.h>
    30	#include <linux/vmalloc.h>
    31	#include <linux/crc32c.h>
    32	#include <linux/module.h>
    33	#include <linux/mutex.h>
    34	#include <linux/file.h>
    35	#include <linux/filelock.h>
    36	#include <linux/swap.h>
    37	#include <linux/errno.h>
    38	#include <linux/sched/signal.h>
    39	#include <linux/bitops.h>
    40	#include <linux/major.h>
    41	#include <linux/pagemap.h>
    42	#include <linux/vfs.h>
    43	#include <linux/seq_file.h>
    44	#include <linux/init.h>
    45	#include <linux/list.h>
    46	#include <linux/proc_fs.h>
    47	#include <linux/sort.h>
    48	#include <linux/cpu.h>
    49	#include <linux/notifier.h>
    50	#include <linux/delay.h>
    51	#include <linux/log2.h>
    52	#include <linux/rwsem.h>
    53	#include <linux/spinlock.h>
    54	#include <linux/random.h>
    55	#include <linux/ctype.h>
    56	#include <linux/writeback.h>
    57	#include <linux/capability.h>
    58	#include <linux/kthread.h>
    59	#include <linux/freezer.h>
    60	#include <linux/list_sort.h>
    61	#include <linux/ratelimit.h>
    62	#include <linux/rhashtable.h>
    63	#include <linux/xattr.h>
    64	#include <linux/mnt_idmapping.h>
    65	#include <linux/debugfs.h>
    66	#ifdef CONFIG_XFS_TIME_STATS
  > 67	# include <linux/seq_buf.h>
    68	# include <linux/time_stats.h>
    69	#endif
    70	#include <linux/sched/clock.h>
    71	#ifdef CONFIG_XFS_HEALTH_MONITOR
  > 72	# include <linux/seq_buf.h>
    73	#endif
    74=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

