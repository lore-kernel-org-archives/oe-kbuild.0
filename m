Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366FFA95E
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 01:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715564484; cv=fail; b=Mxg7g4qx16k+5kStaQ8yK5husWfez+cE7O04rQg0PvJvmsuQb3GoddNmEMxlLnieybuKu7xBE4dCT8MIEwEEoRTrrKpQRkeOA17gA3iw9PDx49UfwHeOtZVeOyx6vbJz6thlCNIRvvYLE4wmWXgGZWRy4YbqMGFM02LTtO7pZjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715564484; c=relaxed/simple;
	bh=WMpAJC9jbRnyREQ0FaaLg08wqYFiVWm7wq/XEm7HdOg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dGq18thjsl5kMf6XTKE+YdJJRUMAdQdOMcGuN0Q0/MHDAOtKl/CXSipv4x4kmmHUJ8l7iGu3dLFQKlNr+ARkFdwtIVJGU4JQLBg6xzomH52Cb+MlYNLNFy0RzERMoiQuvLnRz/IU3+CrgttjRR0CN/lROEIxlYChvxWggsc36LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+Ukwcbc; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+Ukwcbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715564482; x=1747100482;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WMpAJC9jbRnyREQ0FaaLg08wqYFiVWm7wq/XEm7HdOg=;
  b=C+UkwcbcSAS5UCUulu08V9d0AD9J0IekA7l5ubzTQf9UHSkTvIN/mvlm
   lTXx134m4vC7P/kTX2heBMjUJ1ZkmMZQBhG4ONfD6PFLS+7RggOE7c6Tt
   yO7v8T3yu+U6rSdxAMPxPepevbZ96TUwJscj77rZ9mTDho0hNmoMOIM+2
   s07Mcm1j7Bx7PiyzhDaHxHqee/e0BFRwoU8xGEJc9ZXY7LCIfPOSTB1zA
   psKtj4SWkJdDshFixFcj35zNcdQ5yh/vCt7LakSvL3/nUGoXuFQMBGolP
   BDgqBqn76VZ3nqPovWU+KGD9WA0/s+aYue8Gs04SzMsUBU0sPT8P4/27g
   Q==;
X-CSE-ConnectionGUID: +CKYTRC8R/aYvoagbwtH/A==
X-CSE-MsgGUID: z1UI7l+uTeme7avWE4X2bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="33992581"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="33992581"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 18:41:21 -0700
X-CSE-ConnectionGUID: R91Vkp5lSRyvxoDjFlUOBw==
X-CSE-MsgGUID: 7bJUww30QCqg6CSDr4K0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="61370074"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 May 2024 18:41:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 18:41:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 12 May 2024 18:41:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 12 May 2024 18:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y13zWapSxr2Z7ctJxhz0MciDw5pvcFqOHF4lU39owRBsn1AZIkFW3Mt3lhSMvmWfFAYIzgN34qThZSLm09PAmMtgjde94M8WTyuCGSP3MMk77F6ZkhicoSPkrSQkamqAYQaZGFv4XOhZTtr0vL4T7T5wnzirbQvh0MOzPQaeBW++5NAwqh2SvOG7v+cWgBAK+My33A9I0e/hCcx2g9NMTyMoaQI0moTKSFNBeEZAyDfHzZFj9snhV12+f0vxq1kc2PxAWihd0KGLaAjjneHF1euMSjgM2xm/Jh40PZklyoj12MSR2FZfhE9SdwbCutvVKLwjINDsRQ1oQIa4Y1S0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ+ieksM6FEolNyAbloO2pE4ydY2wjHioD8rTLqMMuY=;
 b=aAX8kYxB6Te3KdR0vZG42sBTNG67BssD80k7b/cypCO4ZG9Pj7WWIDU+LR0aujYzr8tGkLASPS7xqKNDfyOlSTyYNhp5mN219l5oT1sv9prSyjs+nYaU/w66shmgZM/s4p52p5pu69URNahdPscZoQtmQMEUXRkN6El3am7VzuOb+NxRdvC0iJfqGisTKwxLOgaVqrhOWcftlbpFbdAsgTxNhDZMMnsST97MgnDwCJmRqmrP+lWslmJhoSx9mPDOEq1fOmXvWVpIsb6OAXLWAlkeVp0zKQWxD2LnwpfvJGmvkVbI6NS6vNWOzZAkaaCOmsbOQvGUolh+NGQJBeYnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 01:41:18 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 01:41:18 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [linux-next:master 12023/12533] test_cachestat.c:2:9: warning:
 '_GNU_SOURCE' macro redefined
Thread-Topic: [linux-next:master 12023/12533] test_cachestat.c:2:9: warning:
 '_GNU_SOURCE' macro redefined
Thread-Index: AQHapF+gHu7Ko5nrIEeL3S6y0vwE57GUZHnw
Date: Mon, 13 May 2024 01:41:18 +0000
Message-ID: <SA1PR11MB83932FE8AF6F34BF9971093AFBE22@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405121952.nKKkle9V-lkp@intel.com>
In-Reply-To: <202405121952.nKKkle9V-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|PH7PR11MB6772:EE_
x-ms-office365-filtering-correlation-id: 39b67896-4922-4a9e-30c4-08dc72edc922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?g9KNF5DpOQiiDYT/LTWDHDPoGkSHk3DfXhgB3An3XCnl4l4/yo8QTql/GmIK?=
 =?us-ascii?Q?pc008qkcCMlxbtV3IiXd9gwpUFpwmWsWsQ8zOFS6F7KloJKWr4EzqIfDK+vP?=
 =?us-ascii?Q?lmF+rgJDJJDkSZ1hceVzLJoif9Hy8zEXnsn1vyV6hD+zt94l/XLHasnNlR0b?=
 =?us-ascii?Q?SwC4jS+b+zdrEoagzRHx5LQJU6kb2XGcTAXivK9z92OlQE7Z1cb4Fdb5ACg+?=
 =?us-ascii?Q?FKG6meoS/OVpXBB6WlZr279aUw87tH2n8qvJOXYzF8VkMcaOZa4mtQ5OnglP?=
 =?us-ascii?Q?J/0TJnKz0YdaB/qCQCsfhG9mU24N+QpJBJpFC8j/NMfEhkLMWykOo2n8YCa6?=
 =?us-ascii?Q?A2wQi2JwPDB9Qye5JnU52o1byFjwz+py6pQv3ULI42K6QK+jeNAPdfmcyQTG?=
 =?us-ascii?Q?vPiLSPPtVpqxAAwbp/dcyDSAiezkS4cRAt8uWmFuGyDTpFOFBzgz0lMSErga?=
 =?us-ascii?Q?Pg4JtJzUveuAewYu97NMw79SfOZnvKClUZOJubMxV9oNEKiMSxeXUveei0rs?=
 =?us-ascii?Q?s7jgJKdOG5ChBqTFy5M0+xn5fHddk2TH+CWThVQRkcUWEUo+e/nV0Pq2DjUl?=
 =?us-ascii?Q?mQAmUBJS9cjN33qLwWr03a1NqfbYvAZKDmKLcGDel6rIjLyqtOKaaElR834L?=
 =?us-ascii?Q?Jywwz+4Kdm1bKMtgq5vDWfuqg/gMi7a5HygTmu39j2H3oTpAHtSgJ9Fw3fAg?=
 =?us-ascii?Q?XBroNU2QPXChhCgaLHOBP+h3KxxSJSz7ef9/Bno8fFNvdfdDwC2heUgDGhNN?=
 =?us-ascii?Q?CKYD04O+g430IXu9aN7xktgQ1pyiVVA+zLCiwT+0AXx2wzwy8sHMMghtsiHZ?=
 =?us-ascii?Q?REG4VKERLGkcK45oK4yYGc0D9MCxh4CoQHji1ll9u3+USpAD0gmG4QWPVZfn?=
 =?us-ascii?Q?sSrmTA+V8hCPiKRYOxvlTeWP6hOiuuHrfo0sQFrpiat7xuF5S61lIb+cuTSo?=
 =?us-ascii?Q?uR5kcmkIrdH0+igL6sulttAt/9Ubba+aHrSOycdl9ndKst0wCq+iT37vcjW5?=
 =?us-ascii?Q?zup8VbyjZkVpJSFH0FXoi0P48fwzLB5hrjPnnyC6bRhKmJYnICvyZlBNUzHN?=
 =?us-ascii?Q?gHFXFEPVeiKZ7BmvWDRAjDWGGZtK9USH2UOiY9DbXvmaOPTzfZD/5Sxqmv7/?=
 =?us-ascii?Q?6SOVIgvHN7OTj1AY7SbMthuUfiGLst7CEjswYDLDDPVvP8s1l6OdpU8blXoU?=
 =?us-ascii?Q?XLqE+g16QqT2XeSpN0GJFTri8XSP1qUTWhpsNq2jaYDCHTsWfggHgytd+ldw?=
 =?us-ascii?Q?zKO12ET24Gqt8PZTggxnB1P0+PxhKB1Ui/oE1djK560LVfefDmyU+3WCq7At?=
 =?us-ascii?Q?BtQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ETVPgHJZYrtz3/euROzQj7NrW7588Hvdk3oiY06QzlSPice2bDtiLEZGj4Ow?=
 =?us-ascii?Q?7yijAnefPfsaR+GDu+nhbFDx7c8JGFFGACvnyOBu2xUwOF/48PYamJBiW/j8?=
 =?us-ascii?Q?qzHcu2bAAPyMlLS3yEApYKJFSHU43t/YmhIwG7mt1mWTEOUN012EWxyN3+Gn?=
 =?us-ascii?Q?Twz0eMilMCVXcTQXzWSkuKRAlN7fwpDNzylRIg84uqJtqcehKCM2CXe+I7tZ?=
 =?us-ascii?Q?l1dE0h8WsH+4CY8BOf5DdcLhL4Rk/Au6p7Kcb61jin/ZxJ0Qai/g/XC5xq2y?=
 =?us-ascii?Q?JtdRnSdO0OV9k2cLeCuqDZUWd3q3OslkVPREk84Ljk49VKF2FV3JM2DqrdFt?=
 =?us-ascii?Q?NEsCP4/IpJlydlznruYIihifFrV4iQurvE57EsiZ/C5fAb4PNU6HR5nrLTeR?=
 =?us-ascii?Q?yY1zzsGbDz/tUckVLVZjJEYNrFp7dfmL7qwElnr2Q28Z74qUi8cLEMULt5ho?=
 =?us-ascii?Q?mBkE5AtU0klQUjnbPbfxumTHow0jxAdDaiAsz7jsSEXKWdHxxI4Y8GkNzEis?=
 =?us-ascii?Q?o9uav9Ez5BBQIzULSBtP1PwSEQzI+dxMpsOrOlTuXSvYrRSa9xpe8MyNMtxZ?=
 =?us-ascii?Q?EHU62UW+YOfAMS9eApCRoxFkTWAr7i1IaMxvAwT5nGxmBEvLCNIC0PtdOZsM?=
 =?us-ascii?Q?sEh0Wm2bXPUGgT/3tEfJpDC5k6h7lYVOsumMxzENCRrT5b67uz9mT/EMZ3/9?=
 =?us-ascii?Q?3mE2VijmhiWMjT7/oeiKlSMQ+e8lskD0SqjUKEU5NIl+0YMr8IXwLGPLAZb0?=
 =?us-ascii?Q?cPzgp8mm8F41dRf3qjK72WN9nHQ7pPJm1ZmEn/RMuYllf31cuY8gZi+kq+T5?=
 =?us-ascii?Q?hIQw4RTx5i+QbZe1YSfxOaDqY/kKMMnSmXj1laLZnJWvch38ZLHG3onlXCqA?=
 =?us-ascii?Q?6NBO1pk3Vwe75ikCktex1wu5u5YZfLqZ7I9na9gDMghuLpv640msH5bAB2PR?=
 =?us-ascii?Q?R1rPLejZ1G/+lSXDfLw418wZvIma/CXlZQoVzyzmop5PiE7ABph3zjQHXdAT?=
 =?us-ascii?Q?hAJTrWEWkny3onq7Evl3RLE8FcD6s34k5dfrZNgmy1TfpkNk4ofbenN1GMG7?=
 =?us-ascii?Q?odr2skXj8OfUMRKr7BGiHoTJPhXmbID3agp2x6zrQsEcudS2xNHYj9TbqvvZ?=
 =?us-ascii?Q?XdlHceTQw6inQkGue10w6sZpTS4Em3ZyrGfIJ6XyfLhpn8A/19wTFC58bzqp?=
 =?us-ascii?Q?qDM+Nva4oXZ4lDsSvIE00Dg5YsRx4xkKJotqFThafk7gWA5UX4O4LD4F5xsX?=
 =?us-ascii?Q?nq/YzEo1vR1rWBRIaubS3b/cuKU+i60wZMUhZoRduzcFN8/Pm74Qo9Fttl41?=
 =?us-ascii?Q?j6WrqPiPPeTeVCw/RJn4DRfZ9sI1R4DV1uTlEsvl1ThZsTWEcJFIRFw5DGvK?=
 =?us-ascii?Q?bWTyAUwyrDqaaDaEtbSbUTdoHrjVe6cet1HTrk21a/zc4k7okUjbu/mHV0wS?=
 =?us-ascii?Q?6ula2A8OT/+MCYYMCUo6Yc58pm0/jQePRF7a8vhB0iK9Y21DRhzAminN4CQT?=
 =?us-ascii?Q?ZAxDc2IXk1D7vIb5BedVBy4ljZ66FmHsffZe3z35ePMRH67i2zN3+7LIMSP+?=
 =?us-ascii?Q?z2283JzBojA4CoTKXAMUtt7vWXPEDK/TNpgYq3ag?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b67896-4922-4a9e-30c4-08dc72edc922
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 01:41:18.7033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9MARU1C0iDtL57OMDPxNP0FHiiTENf/wnx9y1i94O/XJ08ihJsRh/kgSa1D2ZHXB407UKWZARftMWg/qiaIEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202405130312.R5mxIDyQ-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, May 12, 2024 19:28
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [linux-next:master 12023/12533] test_cachestat.c:2:9: warning: '_G=
NU_SOURCE' macro redefined

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   75fa778d74b786a1608d55d655d42b480a6fa8bd
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 [12023/12533] selftests: C=
ompile kselftest headers with -D_GNU_SOURCE
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240512/202405121952.nKKkle9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405121952.nKKkle9V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> test_cachestat.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-re=
defined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> test_execve.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redef=
ined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3.c:5:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       5 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_clear_sighand.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wma=
cro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_set_tid.c:9:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-re=
defined]
       9 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_cap_checkpoint_restore.c:11:9: warning: '_GNU_SOURCE' macro redef=
ined [-Wmacro-redefined]
      11 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> close_range_test.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-=
redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> udmabuf.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined=
]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> devpts_pts.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefi=
ned]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> dnotify_test.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-rede=
fined]
       2 | #define _GNU_SOURCE     /* needed to get the defines */
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> binderfs_test.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-red=
efined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
..


vim +/_GNU_SOURCE +2 tools/testing/selftests/cachestat/test_cachestat.c

88537aac0b38403 Nhat Pham 2023-05-02 @2  #define _GNU_SOURCE
88537aac0b38403 Nhat Pham 2023-05-02  3 =20

:::::: The code at line 2 was first introduced by commit
:::::: 88537aac0b3840314d3a5cc401a7fc400c069bc9 selftests: add selftests fo=
r cachestat

:::::: TO: Nhat Pham <nphamcs@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

