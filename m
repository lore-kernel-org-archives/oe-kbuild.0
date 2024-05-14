Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3E17F7
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650965; cv=fail; b=hNJfAZAaAZsilEJe1vvfMpujv92QDQ1OzOznaI46VVVdzlh1t4T/dZK2SycyWUa+u1T4Enitf4w4bg0VADpmMSqb18YAYuc0QoebWCzjPonhxNtWc1htneZGlABnuJaBUuNojxEN5EjDf02k4BubFIIx9ZaXCvTRM7XQfKRWJyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650965; c=relaxed/simple;
	bh=pgCuLo4/p/NTMDYVTgsGQ2wJaChWoUWnofvw7HD305c=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HU6hHfHLlUDb2t1hc/Wx+3urdsQvLZW5UcPJzMQVF2QOVotdWRe0c4RBGtbIvSg7LhAmFJCNSOZEVy/S6JO7NnCHE0eLhTXwGjngp8dn5d57C4/hdeqcnphR51hoqwHxAow8LKQuzYHaZ0N+mpocvfqWVjWx1yIPnAuKDrBuir4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2SP0pnK; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2SP0pnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715650964; x=1747186964;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pgCuLo4/p/NTMDYVTgsGQ2wJaChWoUWnofvw7HD305c=;
  b=g2SP0pnKTCIn2TkRsu0njDv9GU1NjueOy69F7eKT5DToHgPH8BZuzXUo
   5OXmbXZhtF7TudJQIkws21YsGGB0YbGOQFh0pb1GzRQMiFmlJNBdKwDAO
   t2NAgfIsuxwdyt0jlHVtiySee+wWlesUeQfXOrcvDkNdBNSxzKAIoWtoB
   YCL/Voc86NTx1kbHc4gb8I4Z6TePvCyp+YqIW8gMcQVtF1jfvbBIQtxmm
   U79YuHomchrs3NYb906+VKoKYw9XykB23YcFycVcPdl/JZaAtIocrQIbg
   Gglw9FA8kzxyw/l8mBKHTwIU6HAZAUSyV6iKsAtv2eT3E2HSQkAEJm1tH
   Q==;
X-CSE-ConnectionGUID: fDvK5CwhR+aGOKSFaHgi4g==
X-CSE-MsgGUID: fhY/TeBLSz6FN69I6MAm0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11467913"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11467913"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:42:43 -0700
X-CSE-ConnectionGUID: JKYbvYr8SkKnDap0UvGrWw==
X-CSE-MsgGUID: WWHxsNZATnSYIBsNLNNs2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30590715"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 May 2024 18:42:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:42:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 18:42:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 18:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJqU4PwcrJ8wtw2H7UpI04+965YnchE3ei5hzyox2udVtY8p/N4Ndyxj5t8AEsZfzLaPgq+ZLOpYVr1mYQ3RTEQ3bmXgXoqIXcJqu7Ix+nPr+/dJRzLcqlZeLwllDA0+q4FaGWov7G+u6f8IiwZVPUMV3OkIIebW65KAw3z4fdrZjHZ1hznBLaEPGI65hB4ipROEHQntmkbUZ+CAeV83qDer4cUwnxUY7xPBkOuixHXdaAOFAde/la+0CmBfrveXDMPbbA8f5KKHZsbBB/pzKBRIhw6vvgHtcDTp5A8JmXbiaLPMjJh2M0UMzMplx6yD66VK/iDX5z/9ekW/l0cA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DndPZghJpS3PSjG4A7mNQwgqFBg99L6vZit0nThBEBw=;
 b=SidjMaQBx2rzIsmY2ISK2w2jM6+Tp+mg3XOLnVyW4uhKlx+fPNiQ6GjN9wDRvX/CEdBKSkFjuCgnzkwiuLjnFHBQ0aprZetwDt7I9bTJkHe5YgA2MwJFRKqeUJD60yZXSLFL1PbjV5hHnhfF0PzO7BVOXf3ETUUVbEsb0dPOEsi9bpE2O8aYuAxuSNEBHLMdfQDADBh42sMajL8v6hEm/ZwVJsEbt7TV2cPO+x8McX4c/i30UdjYnwBPAMT6ia+hVbmRAb9POIRFHqR8OVi/a7wAjRF4x+j0ttmqYZtE3mOpB2tQ67AsN9IR752C5mGx8k5dvxn//ukbcAv25QRoew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 01:42:37 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 01:42:37 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [linux-next:master 12296/12321] scm_rights.c:3:9: warning:
 '_GNU_SOURCE' macro redefined
Thread-Topic: [linux-next:master 12296/12321] scm_rights.c:3:9: warning:
 '_GNU_SOURCE' macro redefined
Thread-Index: AQHapY3BjXuD6ghd90ecePpo0eg76LGV9NCw
Date: Tue, 14 May 2024 01:42:37 +0000
Message-ID: <SA1PR11MB8393D43757E3DBF1994F4597FBE32@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405140701.RhrkqSah-lkp@intel.com>
In-Reply-To: <202405140701.RhrkqSah-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|IA1PR11MB6266:EE_
x-ms-office365-filtering-correlation-id: 2e3804f2-d607-44e7-de4d-08dc73b7229b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Xr1AC8CdmzvijUrL8ELyaAaPe9124aMwPLi+Xg3JOLTFPTdia1pvIAk9AK1T?=
 =?us-ascii?Q?rrnMgr/zw9NeQHF3nD9J5/piuAgMi7DQeh+4JCuQxI79TbW/RNszCHPFUUrT?=
 =?us-ascii?Q?yaC+JO6n9bc1EcS1ifl7Xy39fZlXBjoh93xE92vD/atsuNIzH9NpOnzAW2KP?=
 =?us-ascii?Q?6cxpjtLz4JSMxXc15vJaeFB9jvkxojtHXd+1p98cNzcRmwdmTA8d9QQQoeR6?=
 =?us-ascii?Q?NJG4TFyrwFwFwOjV4rOs1y61lVrYAdzquQYsYmT5Iscgujfw540fC/HMv0v6?=
 =?us-ascii?Q?2CeFzEXk8oDVDJmiDPgkKE4wpm50QNvN+wSgG++Z0sXZhzAg4Eh+vm3HpfUp?=
 =?us-ascii?Q?/UIZ50GQLGL7GW64Z0wm3F9IicSy9V5sa177jCXovrPXgZ+RO11yixfaMgdX?=
 =?us-ascii?Q?6f6iKUXG5MRk7qrET1G7vQDF9TU4AAk2yVA16l6CjPfZUXuezxZyCyNpXbwI?=
 =?us-ascii?Q?ubnH8kttO9DSJVsX7xJ6LC6C+Qo3j+wZgXtTdlRlPYEA48d2ohCMNylEig9V?=
 =?us-ascii?Q?WISx/FyT2oUhzggVFnAsxKJE2AecyIka46eDqYHlXRS858MLZxMICwGKgaG0?=
 =?us-ascii?Q?wjnsdIaoCNGgFo+d/2luiYJ8Bm7HYrG8ay5tmVV6IVaP+pTo840ZZQfahol3?=
 =?us-ascii?Q?GkoydzJjUJQ2oLY9zogVxlNLCEJfX50iMMEZ+EbugDWVp9dzYsZLTofDGewP?=
 =?us-ascii?Q?u7lFZQ82/TLvBDmtqXQ5smARmw5i2fDa1PmXVNxLN6XMk/08RyiWnKutjtPX?=
 =?us-ascii?Q?5ZfZxSnhBnS2L0C+fPJOwQOOQjvnNwj7EB5YWMPck2GF81eJSPNYEwdX8Tww?=
 =?us-ascii?Q?0nPx5B/Bu1j6L26O3/jPm+XGpr4zX+qRpzonPrwv6MYlNzQoSMjla2IdEKnj?=
 =?us-ascii?Q?7rjx0+ANyG66mQ6bfTJ9IacpY3+PO0uNR4lQy0RPuZZPheFX9zxJwVFUa7v2?=
 =?us-ascii?Q?Oh0YG1o6VIwAqS4jk+Orz+ClYG6fPDul4urhGkvDGngFyLWK9cgwnyFZGfP9?=
 =?us-ascii?Q?Rot/d/Ge+li2uQBy7dB6JQZ4Ku9NWX+GXmgdjJo0J7e/cqmLI1WYp5v8zIbo?=
 =?us-ascii?Q?m9hr+P1JxQLPbBBWJqRQ9BiT9ULRI3CzmUnXSH2Y5uBbhbTD2hZokYd5Q3wb?=
 =?us-ascii?Q?/Iko589YLpnK2UiN7qAstFJXKnVJJpn5oF9wOpykF5Jw8ngs7CfNRj2nBRlv?=
 =?us-ascii?Q?d4GcDHn7hqmAA1ds5KMTzwlMkyStaUlumOOsysP4fWC9I7xr/JA4ioIbluS6?=
 =?us-ascii?Q?lRWY2mvkkbO8VusC5c67ZStbptVTcpkdrUnin6mW2hhrH/Gj+aYIq10ohi2W?=
 =?us-ascii?Q?Vyg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G0mbp6H11qeVYeG7SYRvdsgRF9wTe0woyNiecyqFqDXcPCY7kPXWzypTfoFL?=
 =?us-ascii?Q?ZpLSERNVihoGGNTW2sOHI9gj57heh+NspLd+c3+nvBL+VFNZHQCWMXNabhgB?=
 =?us-ascii?Q?JFliZql/jZDHfOIJeuDJtGDjuZ3GUDvKlaxAqZsRl6yIZFMwRGQhymLDOLkR?=
 =?us-ascii?Q?RadH8108NZj/0K2c8kRw6iaCvJBXdcuhmjD/JRdd4bAz2vKw54kKXMmXL9C2?=
 =?us-ascii?Q?ztZrPaypkmaYNUhvWP4x4YVDck/aM9D8cOkif1NfVMxcfiSsU41wzPCMEH1L?=
 =?us-ascii?Q?U9GPNm0sm/OxALKlRlQMl9Rq/N92wXTB+p4QF2gFsOscg9luglC/C5DFRNOo?=
 =?us-ascii?Q?ZMZQh67XnUGY2Iv58+TCqAs1YBIKRzMef07kbj8tcCZ6SEucl4lpy3ILXt9o?=
 =?us-ascii?Q?4WzMuKL7uz/wOZq9SUpl2A9tf4RIkvU5yz5GW+hYA76s0mTVzFXEEvMVjDbD?=
 =?us-ascii?Q?B+ErQtXtlQ260AiPOzoaorcHnGF5PhdYq6gYQ5C+YzRQnU88slplJ1ABMxlD?=
 =?us-ascii?Q?e4egGWhsXPgN8aNtbJcWZ63YHXtUk9n9BmPw37vj+RsA8kpPr1QBz+wAL5O3?=
 =?us-ascii?Q?BAVJeIAnpQmzZBXUoQnTH3D3eIIVyI/i572H27lLJtuGFv7yeUqzlBPUtExJ?=
 =?us-ascii?Q?xFe7C6DtpF2i9ZPZZEBh3jkG9TEoLx0bovlaebPX5WEg0Fn0uTuVJyWjlHi1?=
 =?us-ascii?Q?OGPTI8iU4UXyjaD+LjUt0BKOT9ADD5taYagNfJ+Ar2Gxob5reX9Z/aYaiSYt?=
 =?us-ascii?Q?+Yef/QbB6MNvjCNv/XfDsi2G8yJQXv67PueE7iqyi4GHW2J2FgaFyWOYOZqs?=
 =?us-ascii?Q?4KjFOx0venX1DHesaiEX9qyCPH7J9cDV7EbWlEWR27lh+GHGmTNLFvmV+Hzt?=
 =?us-ascii?Q?ymoCM5zeiQFmuzJbvRnfQwUWKiAWHtyyffaGiTF2OBzkcAXz4vpMBdkHIDGC?=
 =?us-ascii?Q?g43qmL9MR0Rc+jfgRyQelfN27mABIStNLjV9PNhsGafspJ77DRRJzDENRcXi?=
 =?us-ascii?Q?wmlXoYonilOG3QN2cZ1qPWAKm5hwXBtYkgEIOKRo61cgg8u3Pa5opGg4P5l8?=
 =?us-ascii?Q?grTePwWg6bTgKYI0qXRFvmY0s3Ar/u2kzYbji8qiG8mWJ9RMkk5T+NfoKX6C?=
 =?us-ascii?Q?0EyRJ5TUmGplXjIRjxiLv0wpYgDtVSiEQT72l7y5v5VIoWe2T7AQrZxMGjVJ?=
 =?us-ascii?Q?oiZcR4m7+lsYSk3wWnqMRC6luGwZWtpTwKiRNQUq08yMZDNIZRTV17vfWQDt?=
 =?us-ascii?Q?aCkKRdwKwWQkOnjxZAl980Do3Y5L1nvdiK7X+Lbl/ox9DDqgJ07/PFvvRBus?=
 =?us-ascii?Q?/90eUJ8bFx4XwcdmqWQBQfAdJvtMOe8foquml+N8xWt2ZodMAU+1yy5PNGWd?=
 =?us-ascii?Q?/4ZncELwcvaYoTjz0MeVo9VZW7/XoZvd29a17uVtF8xtvh/+M/lmaZwM0nKx?=
 =?us-ascii?Q?lrC5gqN+3iXGmr85+FcJ6yT1lZAMXrY+5f/I3BnwpWg/vsCnph2UJNDJmLNn?=
 =?us-ascii?Q?hdV9nPCOR7n0NHOA/tdDOMbrzli6xNHH7BNvVc2iKVNdjR3eebAYAw9phqBi?=
 =?us-ascii?Q?DKLnhQrHKchFs5VyPL2pH4T2o0GWyuviIdv7XHDQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3804f2-d607-44e7-de4d-08dc73b7229b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 01:42:37.6071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXMzTanhnqYmTBMaG32ko5rExselFTyzkq18wtNXWIdrYMJWAH4MQmkDpdHWXo6FH0h3vhCp/LC1ZieFU4fddA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
X-OriginatorOrg: intel.com

not_report=20

duplicate to https://lore.kernel.org/r/202405130312.R5mxIDyQ-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, May 14, 2024 07:30
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [linux-next:master 12296/12321] scm_rights.c:3:9: warning: '_GNU_S=
OURCE' macro redefined

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shuah Khan <skhan@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: 78e0bf04a88a0a3e27ca2651f5f2d12fa39b56e3 [12296/12321] Merge branch=
 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselft=
est.git
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240514/202405140701.RhrkqSah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140701.RhrkqSah-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scm_rights.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefi=
ned]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   scm_rights.c:203:18: warning: field 'cmsghdr' with variable sized type '=
struct cmsghdr' not at the end of a struct or class is a GNU extension [-Wg=
nu-variable-sized-type-not-at-end]
     203 |                 struct cmsghdr cmsghdr;
         |                                ^
   2 warnings generated.
--
>> watermark_signal.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-=
redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> mseal_test.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefi=
ned]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> seal_elf.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefine=
d]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

