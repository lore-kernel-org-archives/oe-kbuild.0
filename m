Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7B367
	for <oe-kbuild@lists.linux.dev>; Mon, 20 May 2024 01:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716168313; cv=fail; b=GdvPWxRw4iUJ7CJZFvcdib6YNBIW7cZhFjhoLzb0ZLduS4FDupXehmDdx08C9d4+D7T74FT13SV4OZajbifoNMipN4wxjJ9iTYo1Y1X9VfDkVj69bQBK5vnSdxRTkZJNzu631o5BcPRoOP6KgLkOXl7/oPiNv36LIYd0IePxakU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716168313; c=relaxed/simple;
	bh=jt0OX8tCNFUyPFhCIJjQzmEMC529rtr2EEEmQQWALkk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eOb6FCL0K/KpuHe58iR0mbgTsffDxyagdNhNvg4GJPoBu6naXB+N3nSWcgrsFoKOEDf5rJqIKtIBC76I36hvxA+LZPkLq7n5uoeu9ihOTRYvX32CIFgjaPf6cT4QQ+9Mkf8pjANT808wjEqI5oPyYWBMhLUCcIrLrpJW8iarHNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMcqgFiY; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMcqgFiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716168311; x=1747704311;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jt0OX8tCNFUyPFhCIJjQzmEMC529rtr2EEEmQQWALkk=;
  b=HMcqgFiYLZeD0wh4iQr38v6o3dxdKkFfi+YhPzrT6ogaQOPBBMKLco5I
   ThRO0SlKkFv8pLynUdA4dZ66o4LsKXYrwa/HgrL9Y03blY1oKB29SmZqa
   w8YCXtEJXQgj6mJEXN17dGI3LKrrX3B5SMZCMjCsSNFLoI1+GhCRMvOd2
   D23XAkRWGPnXEH89ZufffYPLBrFyZsC/2732APQ9ugKVcFKiTHCearQvb
   oXl+aMhenny1v88wtS2jYE4hVaH0pBGU26MVkptuvUp6m4kmF0KmiRslc
   QE5iz1RHUkvgAlcqCe3J0jBJEE5ZNuVS3OXyosk/U+ASZVnfTsamvxVJ/
   A==;
X-CSE-ConnectionGUID: AWNl0aLHSAuMJQPilzQMAA==
X-CSE-MsgGUID: 5hDOOaFfTlWb42TEuXKx/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12388141"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12388141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 18:25:11 -0700
X-CSE-ConnectionGUID: KG9Ing9LRb+wfmzb5MTguw==
X-CSE-MsgGUID: nznXfIYMRO28T5nE2RkUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32389588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 May 2024 18:25:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 19 May 2024 18:25:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 19 May 2024 18:25:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 19 May 2024 18:25:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 19 May 2024 18:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDFYZujJZVoLgK2qzJkxIQZ3GattjeR15f5dhWlim6WLP169UmCJPkSe6wj8Dqg7FHngv0gzLppkZx8JThI7FD8nOQwb0otnuLt6kE50NpvQIafwgT15mRU4ScERMi6iuGSr337VIgMJ2ouDF5CXh2N6gzXiwqxTk50pg5n1uMQx+DHpVUPC2ExS7ZL2cBv9SunwdFGKuFFT1UlSDbPgDMU4q6GBQwdhnrY2PwCw1ltntCYbfFX5Ac6H2SZkLEO8PQRd+TtSNr0osp9UyuzKVtXWoEhPSd0wY0MCxHMW7SnkkpEo6oar1gCP0/LwVW8q4W6CULMZW4QORHHHYBAJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIkj0xaUR29f9XklhlE11vjsjBFIEUttB8mv6w4StGw=;
 b=SjnXlHXWpjSzE2eImvkC2elZVK7cm7GLsKYjMWi3u5oVIemuPQr6LuHtz6z3Ko7d43Yq+zbBAnvkefZwJT4fquLfyO9D0pmGZRyRqoLl6lk40Bo2nRIvxGZ7SA0bcT2fsdRjh9mGERT4sy7doILybB6JUBQSdUlX+zRAVtMuJtZm1yWVtSJZf8A6veRT1m9iKpTpQOi5L5XTvluX3fCo0KaXOrXYJJTf5xXjoRwSTTb34BgLDbYRHKrFCm44sA553iilhJXJASBk4pHlYEmfccTym4In6XTxWsyOUDGPPgpBcYdurr8gCzCabdPSDwV+VNQ3yVRc5ly9FeKACkG61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Mon, 20 May
 2024 01:25:07 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 01:25:07 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: cgroup_util.c:410:65: error: 'O_PATH' undeclared
Thread-Topic: cgroup_util.c:410:65: error: 'O_PATH' undeclared
Thread-Index: AQHaqA66gThQMurQZUyiA2r1WS8g5rGfWOdQ
Date: Mon, 20 May 2024 01:25:07 +0000
Message-ID: <SA1PR11MB8393D1ADAEB5BD42FACAD7F1FBE92@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405171144.KpYfFYKr-lkp@intel.com>
In-Reply-To: <202405171144.KpYfFYKr-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|SA1PR11MB8328:EE_
x-ms-office365-filtering-correlation-id: 405e0233-5029-4239-9a55-08dc786baeef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?xYD6yNKMjIOc6Cwv51ZtBBSzU7Uigew/x8xv+/kvpPwePoHOrgZObyiZoKER?=
 =?us-ascii?Q?598pVLotlGlTgOwC1A7G18yxqnz6E16GZfDeo/PkTpAanuIkh7o89pQ0sTuI?=
 =?us-ascii?Q?Sz7lIMTSscJT6w/sgEzfaowrNYuqi8cvVzYmIrn3PiJfWShxLINzO5wKQ5mk?=
 =?us-ascii?Q?XBW6GFrZobmnw/JiFD46xUFxxk3+nK4GQiXksllbxxAmVHJLlDAZa8GXuEsR?=
 =?us-ascii?Q?DyDx5h+dfmExnM5ln7AuP7EBReIgIuJVJu5xvrcHfDOmBYwHgDz8QfDG+ANN?=
 =?us-ascii?Q?7JO798Z4Jx3j+5YKWLtoATh9di8dpy6pcRRZKIj0bkl+QoFmjA0yRJI4BDvr?=
 =?us-ascii?Q?JGMQHtFw71QtwARoy3kG7DdOJYka82m7tzZMvbJFSI/71A+MnbdcHzRoPGkX?=
 =?us-ascii?Q?qlti1WjF9gT6JnSJ7CMDne8vKZhyGc7sCydDP306+1IJz94QKCbCUx8rS4y7?=
 =?us-ascii?Q?tDBnCcn+XjGlgVRFEVDNibx66P6VAcP1XUBuPWiCDQ7wj6h76GvSF4kumFlt?=
 =?us-ascii?Q?IsZVHrw/17Aqzp98HPgs1HbgdCtlT0voQjjBaupkwI+uijxXCp6DxKLq7+pV?=
 =?us-ascii?Q?f0nXBivyLop//E/hB+418GgIbX/bH8+ldVFsj6XvJ1js6c1kHErm0/KZPeJ9?=
 =?us-ascii?Q?GnWO8SC+OvjUEarRHpZrANeOQKfD4VKCmMSy8QTLJJiNoio9neCJA2wpz5v/?=
 =?us-ascii?Q?FBedCaU1tAEbtm5Chwzooh7os5Uy5PY3KHgXNDFDrS3LBsEg+KfuqI8zifa7?=
 =?us-ascii?Q?q18pfxnEsV0LMM12sgLjN59s7G3eQ+Wvte3UKFG5r+tV7aL+5D/tyh8KoDAs?=
 =?us-ascii?Q?j3eVz0sUOJjoi6TuwJKAdoJeCtvkBA61O8PPewmMM1/Byf5hTjb1rNzRuKHC?=
 =?us-ascii?Q?QytPWKqyjdAomca01Q30K78n2bfj4euWqEoKFBOtzBNSI9rXP7HFR3Qt5Rhl?=
 =?us-ascii?Q?RApSQMStKB6KyQnA5cd50bX3TPAM9lY08YlhatgaiSwR8ATotBNx8cv+Umt6?=
 =?us-ascii?Q?rPYJXqwfF6fy6vi/GLMAtBqKilx/nzxjh7qRvrqwABrnM8M+7IgHyKI7+R5e?=
 =?us-ascii?Q?uRr/aZ/xZK73wEZZd/X9Idv50trUSUtbpeEV8IrjRbbF2eOBj5VIFxzmdUS+?=
 =?us-ascii?Q?w6hbyBRBXo4cYZ8SwV93lGJH7KYfvs68/o2MebfbdqLNbEAll3LrftnQmzKr?=
 =?us-ascii?Q?Ls0B7eMc2PiUYPuA+VvzSWWw8JlIqc5QwROWUshxDzLY2Ggs2UIKoL6qposC?=
 =?us-ascii?Q?XI00FiGYMtfZmydcRWavVN0CeVh9VR38YVBJw/AuCo1OkrCEhi2DOTBas0Tl?=
 =?us-ascii?Q?/zQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HtQnftr0H7RaXVoOmqYRqBJcbbRD/+O7cigHop5t8PTSCZbpqycu3bXwzZin?=
 =?us-ascii?Q?IcV01dM8atxdip0jIcpczZLeWyO1+igXNjOHDhlBvTAsUJeeG3onjvY8T/vw?=
 =?us-ascii?Q?jwk1DL1nPMTA1yRe6XCf4pZ7qPDtWGDfRlsrdCDNRG+F7FenYs77q05deOGO?=
 =?us-ascii?Q?vs9UmKTXRdToAsB7N1xmWQhzlr2Igt20f5iDceIo1mpYjvi1iUQdR/5HSGcV?=
 =?us-ascii?Q?B4sMh9edffLBDTIMWD1mr2beXQqDwyB3KvMJwCTSe8E4WPst9K3RODVM8g65?=
 =?us-ascii?Q?N163N0TAx55tVdG5M5Bw2TYB1Ont7+ool2Mb0J9mX0eP3qqMWSsbMmnUCq7H?=
 =?us-ascii?Q?AYHR9yzyX94+cfTvbYUuOryCU059HAP6zqhEJVcismfKKeY1ZoW65sy0vpQF?=
 =?us-ascii?Q?lmMEPAUMh03tfFKXonnzu+NOEuu+8DM3egzW7TUg2YTnPkUGE6YTaboeG3Iy?=
 =?us-ascii?Q?AlU4r6HQ+LmXKHr1wLkx4puQ7VN3mOgGmOU+ldVfC/Td25yRGiIoobhTO0jj?=
 =?us-ascii?Q?0hiwkVTKEe8B5p+6W6zibBz3LA7/4CAFmAf96SynCgxzHqkdurtDDyc3IBWj?=
 =?us-ascii?Q?dpuPj7UgER7bEO3oOvlAIVVMIxBMvevNW92RTNh9Mqmi2hFxvbszwbRIGzOS?=
 =?us-ascii?Q?q7CWu6T0h8LLWM5uL7Dv26fpeQ5TgfBPJmw4P609WQY45Oq4SS6aQZ72YEm4?=
 =?us-ascii?Q?aXLJkKv/IfeTJLkbeom0mVp0Msg3vKhPqVfn/DhMovhJvK8BIez5PiUELAOR?=
 =?us-ascii?Q?6DCXQevJlyuHIlEIwRAmHhEqRfFFlsC2qJe15/rHmwUn2c9AN3B0jEiyqv6g?=
 =?us-ascii?Q?EUaZbl/SPpStfsp+PE3TusPpshMAS2LiCBtA5HqaEsAa7C7/rJ3IWkxS1PRo?=
 =?us-ascii?Q?vrt9qRW4LJ3hkwewfy2cSfp1YDQ08bRDdnXbiY2bGGd2LUordYjPQVt8w9jq?=
 =?us-ascii?Q?SKQBCVZzAG+TIwTO1fR5/AeS54D1ORidit3fRiB9nnhGQr55bakaksq74/Lu?=
 =?us-ascii?Q?yZl0gUt00fJJVPtjvvfeh2CSUmslKNt7BwHBl9PDrWKqBTwOZ8yje9HFdaLu?=
 =?us-ascii?Q?W1mi2JCj5kVYd/4j2ABcyjiZqARtaYmsqe8NAVdjepu4z9XAiLTih9nOeUuN?=
 =?us-ascii?Q?qDZEJxwwc7aKzzuFBejsv6x19Nwi8/DRMQ1hwQPSd9V0Vmi6+ihsBOqgJWb/?=
 =?us-ascii?Q?IIe5lIKCD1wVWvWBHeIfLfknPxN7/EtuTdz8baC9X+IBo+TGQqT/OAF4wpJ7?=
 =?us-ascii?Q?M3qAZKiRIuCc8kJ71gppJO9WVbM7AtMB1XtiD+PdlOcQASMcLwyvE6+8ECD4?=
 =?us-ascii?Q?Wnn2HKP6xI1U/LTOeeZp5b8kObZtCntPVDRNLkbEWLrSSWdye5Tia78lMKmA?=
 =?us-ascii?Q?D4AcGIR2CCgL05ZlCDjS07Kgn5kVAtn4r2u5B3qGU9qIsRsX1alw9P+377k/?=
 =?us-ascii?Q?9UUlxT8YfMIKJvJFYYbmxS+KZgTLj/qgQyLicZJ+IlTLKXHW8H8T2OAuhOD5?=
 =?us-ascii?Q?YEAXNGT3B6DiBkkRLAenApDae6oWxEVqJWFvnlnzrfFBjNUeulRFsiCLFX1R?=
 =?us-ascii?Q?mkk0P+YX7HiBU+RrpQh0sGrVlrnbEKTflFeFNbeq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 405e0233-5029-4239-9a55-08dc786baeef
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 01:25:07.1357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NUttwFrPct7X0xc4gp5IonN+gGOkF4XDJGXx45K3/xSkMAc1Qt3p40uRW3x+SLhg4qLbSAift+ifVvIoVxhYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202405181620.zh4EErMk-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, May 17, 2024 11:55
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: cgroup_util.c:410:65: error: 'O_PATH' undeclared

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Edward Liaw <edliaw@google.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ea5f6ad9ad9645733b72ab53a98e719b460d36a6
commit: c1457d9aad5ee2feafcf85aa9a58ab50500159d2 selftests/cgroup: Drop def=
ine _GNU_SOURCE
date:   3 days ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240517/202405171144.KpYfFYKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405171144.KpYfFYKr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:410:65: error: 'O_PATH' undeclared (first use in this func=
tion)
     410 |         return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | =
O_PATH);
         |                                                                 =
^~~~~~
   cgroup_util.c:410:65: note: each undeclared identifier is reported only =
once for each function it appears in
   cgroup_util.c: In function 'get_temp_fd':
>> cgroup_util.c:468:26: error: 'O_TMPFILE' undeclared (first use in this f=
unction)
     468 |         return open(".", O_TMPFILE | O_RDWR | O_EXCL);
         |                          ^~~~~~~~~
   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:411:1: warning: control reaches end of non-void function [=
-Wreturn-type]
     411 | }
         | ^
   cgroup_util.c: In function 'get_temp_fd':
   cgroup_util.c:469:1: warning: control reaches end of non-void function [=
-Wreturn-type]
     469 | }
         | ^
--
   test_core.c: In function 'test_cgcore_lesser_ns_open':
>> test_core.c:804:15: warning: implicit declaration of function 'clone'; d=
id you mean 'close'? [-Wimplicit-function-declaration]
     804 |         pid =3D clone(lesser_ns_open_thread_fn, stack + sizeof(s=
tack),
         |               ^~~~~
         |               close
   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:410:65: error: 'O_PATH' undeclared (first use in this func=
tion)
     410 |         return open(dir, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW | =
O_PATH);
         |                                                                 =
^~~~~~
   cgroup_util.c:410:65: note: each undeclared identifier is reported only =
once for each function it appears in
   cgroup_util.c: In function 'get_temp_fd':
>> cgroup_util.c:468:26: error: 'O_TMPFILE' undeclared (first use in this f=
unction)
     468 |         return open(".", O_TMPFILE | O_RDWR | O_EXCL);
         |                          ^~~~~~~~~
   cgroup_util.c: In function 'dirfd_open_opath':
>> cgroup_util.c:411:1: warning: control reaches end of non-void function [=
-Wreturn-type]
     411 | }
         | ^
   cgroup_util.c: In function 'get_temp_fd':
   cgroup_util.c:469:1: warning: control reaches end of non-void function [=
-Wreturn-type]
     469 | }
         | ^


vim +/O_PATH +410 tools/testing/selftests/cgroup/cgroup_util.c

9bd5910d7f3db2 Christian Brauner 2020-02-05  407 =20
9bd5910d7f3db2 Christian Brauner 2020-02-05  408  int dirfd_open_opath(cons=
t char *dir)
9bd5910d7f3db2 Christian Brauner 2020-02-05  409  {
9bd5910d7f3db2 Christian Brauner 2020-02-05 @410  	return open(dir, O_DIREC=
TORY | O_CLOEXEC | O_NOFOLLOW | O_PATH);
9bd5910d7f3db2 Christian Brauner 2020-02-05  411  }
9bd5910d7f3db2 Christian Brauner 2020-02-05  412 =20

:::::: The code at line 410 was first introduced by commit
:::::: 9bd5910d7f3db2f65be139d2679dd9daa4a3419a selftests/cgroup: add tests=
 for cloning into cgroups

:::::: TO: Christian Brauner <christian.brauner@ubuntu.com>
:::::: CC: Tejun Heo <tj@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

