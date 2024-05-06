Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449F1422A3
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714986455; cv=fail; b=rwUUiWpsKTMJPWxi0qrT4JYATBtrIMnlF/8rhyJN00KaIBgWnkPNeA9kzMDUaJJ87jZ0w5Lt4/GpsPbzAI3z70c/2MyTlP24rPO4QmBHX271vIGOOKbC7RpitJkn1TtAIGjPvjhNBGYF78o83uOVxbeZTPSIwlyIRPeJ9GgxBuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714986455; c=relaxed/simple;
	bh=X9YQx141+HGwK/ln3aUHfU0t3+ytVVQPKI6A3CSr0KI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J47B9HMfh47U4PUp1PVaNTGJDxuqrHDVUuhq0wwiYEDWiA194cocaapKAcd+1iW9uoj2f9nH0C1qPEzsxnDh/j5R+vxqgkX7A0k7Q9awDbMZIYAbR2aZyxgc5vtVQn5grkcIGCNDZIi+/vCeKsbR5lXuBpHsJcm0DU/RZ6hPFtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F48tktgM; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F48tktgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714986453; x=1746522453;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=X9YQx141+HGwK/ln3aUHfU0t3+ytVVQPKI6A3CSr0KI=;
  b=F48tktgMIuoodFDfGNq/hW8uiPH2VPy4k+TzTMvHPi7dfOC4lakk0iPs
   FgfYT6NYBSI37caKiXOZbULOHpcWdg0AEcoOz1Kq9QQCYXvliT9IZBZ5e
   7gtb5mIugv552zJlk07Z+BZ5Hqhv3Hq8mKMUKLwVRlkghZlVRqGprZicl
   W6dXndEH53Zvja8G6TMuezNfWz3kP7Yw1Q3ZWOn6zs/nFdsFiBgbqxZIG
   pyNYm31ZWhaDqL0tC3MZ3gRJuQZCBJgfEbqzTd/WCglBFqz3e4OJK5FGt
   iEer9FEIcWjwj25JCyi8dSUPMAj0w5sKoZy7cPZL96+55WgGdX5wuKrK6
   Q==;
X-CSE-ConnectionGUID: vxjxFvEPSeeKVI0rvbPjjw==
X-CSE-MsgGUID: heDzYs7FSteL0lp8uI/psA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10601997"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10601997"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:07:25 -0700
X-CSE-ConnectionGUID: ee/WgNVpRdeCv6Zm8CjOag==
X-CSE-MsgGUID: RMUIhsBURMOhwpcyEH/8jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="27986103"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 02:07:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 02:07:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 02:07:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 02:07:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 02:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJUl18AfBq+SgjMMudcrWHS12/Uzay1ojKwBuw8NCvqL8W1ozqe9eBJKlO17hGxcXdxtakfxr7L7LHs0VdAfdYl28MOgfvChLRBmbtfAMVzDp2+cPzEbXF163pNrTKRU4sLT9d6ToU/UFUps6ndMMSGqwuH6R4OhGEIsYV1LsxtmPSJ/n4YAq6rD6hwCjBe5oIhAVQBxm45p7l9PQPkmgc47hhbtEJZVPiBWa9iCOg/X5srJfzQ1pCv6bYI6xasg2s91li7UJtCLj642W8Au0K0ffxSLCv6AkB+InzzRam/L9JRaeI4/gxvTGrf41uKHVNxfiGPL3eGRN/Uc4+Zt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hcq6vW3BRei6QQFUU/JQP4y3iNn94cXXj7V5jxy+9uU=;
 b=W/BznuSBjROnGkX+dNzqX5RYqxE2GxVUuMw9NY6RceDyqx4LWfwyUdQVV62ToLFr1NvMmPaN0vh7KIg064Q07h8dP34VaigAwsLzkkUgiVP/CR0XH9MkB8tgYUb9NvL1Ojb+HGVLEMU4phoNkvI5W4YKoZ9adTj25vw2I5jiktr3yK1FSDI0ewJhukBR+YaUVE3Ccd9ojow3/zCuEzW+oWg2NUxP3ZrEoRGjybzHfnFrILnQtg6R5InLSNYEFGHeq8oV+28YkGfmwZ8Oy2EuHSfcA7IWbv5GhN97pKzLg6E8Akc/Ir9C4vxtEkWVC15VeLf6mtKjROFh2v2UMNhJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 09:07:22 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 09:07:22 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v3 1/2] perf pmus: Sort/merge/aggregate PMUs like
 mrvl_ddr_pmu
Thread-Topic: [PATCH v3 1/2] perf pmus: Sort/merge/aggregate PMUs like
 mrvl_ddr_pmu
Thread-Index: AQHan3uTBK4NItKeZEGDFz3b6JIH0LGJ6kMA
Date: Mon, 6 May 2024 09:07:21 +0000
Message-ID: <SA1PR11MB83934197F3341BA84720BCABFB1C2@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405061357.4RZaM8jd-lkp@intel.com>
In-Reply-To: <202405061357.4RZaM8jd-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|CO1PR11MB5012:EE_
x-ms-office365-filtering-correlation-id: 7e5b9957-616f-453c-af58-08dc6dabf067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?lVTiyqPgxKEThNiIho9d+/P4XXA8f1sw5eFY/6npIqXo+8QyVzh5a6knlARj?=
 =?us-ascii?Q?BsgCl9v1tPfzxgPg3YcWwRDXFGhTQj3vLad6EyAaVtInn54qU5ejcyesCqVC?=
 =?us-ascii?Q?geP70SBENyr6ZQROJA8iauQQvWddF02yZzstfmoOPSDW3aQf/SVJfSZZ6sD3?=
 =?us-ascii?Q?0ZqsIEUbaCR4BJk5WWWQG1i/UrB4SGhgOnZtSgOwx3VQoFtEtfOqG8X5q3hU?=
 =?us-ascii?Q?fzLydwwSUMAAb7BKL+yaePw8xDVDHvGCbshi6v0ibTNjrkOStLi9TSA1DCPN?=
 =?us-ascii?Q?SrWcM0yQFY6C7Qixv7wcniv/Z5Djr5A959Q8Rkh4RD51OeEtbkW1ATJXtqyA?=
 =?us-ascii?Q?oZ8uCy7DN4l1RO3fk5fZ47z3J46cJ87Php+9CrQBg6zvjzA+aqR/I1XsfKfW?=
 =?us-ascii?Q?ZohmY7/qW3t9mVKiu9wwKEH5sHZhRgtArSoVeZLrkP8lm8Mw1cBG+WNDgp4j?=
 =?us-ascii?Q?eXNC3C5I1V8pizks3K8mkm+0G0Jos+JrYQlht+aZsYM3YWKGZQEvGS+hEC92?=
 =?us-ascii?Q?wljN8tzBYH60PZ0pzhBi8x6PUlUeilt0k6zrKnwSSxXbRZ6WLGL4A/K/csaY?=
 =?us-ascii?Q?grKEDf5ZSFsFK4dWSlFbfnJED6VPdLdSb2GrJypXn8GdKhLqulW+D/yhP2ow?=
 =?us-ascii?Q?ldqaEHzaeYQfM4FzXRBBHonXJAuDlfCL8FcdtP05coGuhQ/B5rc7xdeDoDSO?=
 =?us-ascii?Q?/evmrTSD5ESNo0OW3FHcjxUXEiEbx2nPD3LjVvpURi+PsELrzJErbMCujAWP?=
 =?us-ascii?Q?PekW7gV2UYLsSOaXVfdG9qzypIu8ARPW/KmLRkYgHTN/BMAS20HG1UNBZNIa?=
 =?us-ascii?Q?iwfw2fBet69c7T+w4KLGg36XzGRwB38VltoZBb0Xr0dtalkj+gKGb63V6WkZ?=
 =?us-ascii?Q?Al3Ge1QY6Owe6JItCWg6Ri9gb0jMN54nIt4TZSYJSMDv1e/fteNoHMmAlrRr?=
 =?us-ascii?Q?7rYSzEs3qRM/JqudKz38Lh3+Mdf6OtJUg1K+UH+CI8n5UXczmP3zqct8WL7T?=
 =?us-ascii?Q?IBFKceXRbgzEzecMHUpl1DIjVvQ9qctpD/s4/7aJNJRM49fX0bs2CC0KjJRV?=
 =?us-ascii?Q?kZy+IdPEW6Iiao/Wfw+dB7UUsc7lF/AKzf9S9XH1P36YOwE5xjsiPDZTI8ti?=
 =?us-ascii?Q?IAjxB4dMWtEBBgq7xVg+3oCTAgAMeTr6E01oXXvAwDdElbXggjf78iTFdkZk?=
 =?us-ascii?Q?bIBULr64fP/3E78H67G5YWVORlr1Y210ef4HVuk0CgWAErbe2y/AegRVjgRT?=
 =?us-ascii?Q?P29hcUm5D00jwFiILhrPnTswbT8cbV5c0/YgdgWwmpBx7/CqXfOocucX4kEG?=
 =?us-ascii?Q?ANs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UzgWt0aX5xk3Ho/dAr7LnyUMxMNVUQAQyR2dSRrq3eGBnf7slP0HR0WaDsCf?=
 =?us-ascii?Q?qgA0IhN8EYli451Orb4TcFHfly1XizMi4Lv0hDCJY49NkudViHix4diQpmjL?=
 =?us-ascii?Q?U0vL+9nZ5e/TErEFFfiZkbgwItmkbHA+iZlLXhhtIBN0iy+k48fj2g93IzEd?=
 =?us-ascii?Q?miUEXASynzchoSkm4LQGKQncwLikqnFuvWC447N4P6D2Tzk8z7DJT8gjZmrI?=
 =?us-ascii?Q?K2LdGTtJtMoaVvLq0P+e+XrEXq4wonwoKPPlZRqvN72DlbjPcBcscsDuO9xC?=
 =?us-ascii?Q?wb/FUvPWXSbNiPGsupz4Zz8cSe+Znf5AO2DuTUV/OBW/XARn49wrK5oSLiMm?=
 =?us-ascii?Q?NmUs+eO/CSRkAzxy/dQxzukVsO1pv16hwzk6u9Tas3hcpZqITzQE8RBi1kfE?=
 =?us-ascii?Q?CYXq20DoAtMIIUnVWF5PNisjZMmE69kgiv72lP0lEt4HDxAcIllfOtHBDGUT?=
 =?us-ascii?Q?yn//cZx2DKXUIh3QmIQSrQBkArLhMt8PUxWOdw7OsyHY/uwbWU0BQQDdNhBN?=
 =?us-ascii?Q?Tlq8VYJXteWwZ8Kl2W7u6tGBRZgh6U/9vpVmHSxCA6YyGIHnasBVO2kiu3K3?=
 =?us-ascii?Q?cRxI7aKsDTR7lMhqcQi5vMJM4QI0gl9rRM8eQ4TliBAd6cdst0l2T8NzpSq2?=
 =?us-ascii?Q?sPrMjsDCq7/tU5W5nIsT92BskGfP98VL8DIT/oB1zjpuKkwuGCbC+kvZ5S66?=
 =?us-ascii?Q?mFVUKGgXi9O83jA9uNhrOheEefQ+/BOAHbf5hEXc7wwbjY8OzZCyYZxUl5It?=
 =?us-ascii?Q?33kFjF8wnVDvlGkJpO5JzpxiYC2bNuU1QhjyFJXoORHQg5QHQHNJrbYAHLE5?=
 =?us-ascii?Q?aPZBRKtjBYF/7QDCNsT16pmN2wkgPc82zotKIT23l4eV+PShqvy2U57DNMok?=
 =?us-ascii?Q?MAixXylN8yu9CfJ0AvQh5ediIDrkSjUc6vJERxzyl9Z2hT+alUMu7dory0Ok?=
 =?us-ascii?Q?NUeu0tqGyqdKJxVd4D7CDqfK34n5vtoohGY2wjtlptMjEkx4ZvAgFL5b1DI/?=
 =?us-ascii?Q?aK1N8VK75DyYRxdryUD72iYNIISbm6z+XLVShhY1V1eMdPMT5RGKb7FJAKuB?=
 =?us-ascii?Q?/ti2fhiLiRWABP2uv6Mu9KtGDACUBT3yrZdC5H6flVD/wIvGcWAPQQSR7dXD?=
 =?us-ascii?Q?VrSODf4fnw5dzB5hslspQ74yfSEMg6PR3IlJ5XvPBDUHb7FoRcO2mMXNk9yL?=
 =?us-ascii?Q?4Sjz9X1Dz7e/nGkHUqOBTHyfZU+gQplD2eiM3ExS+KOdocoxBGBHebwseM6f?=
 =?us-ascii?Q?5t7NdyDtHIlevBUVlpBiPXd6D22+jSTMXj0SYKc7R4IWsH1TTBHiEZfWZEEd?=
 =?us-ascii?Q?WczlhH4xTmVKqS1eMpWeUG22NB+Q38FcjIALx1an7WIV5oV56mQzw8UMFqvD?=
 =?us-ascii?Q?GEcwQLyxNed0QPlK1Ri+snMOacZr+WrBzpxnFj7kIl+hq9fw3klQEyGmqG8C?=
 =?us-ascii?Q?HAPwqnJg2CxPl6XLmU758vKyg9vFqeDikS5Mb+EQ0mnPaqZKMyFrUn4oQW04?=
 =?us-ascii?Q?eJaViRPR8D01/PDJT89Uc4KiRk3MJzojccEEvsZjilJu7IYMMNm0SstnbA?=
 =?us-ascii?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5b9957-616f-453c-af58-08dc6dabf067
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 09:07:21.9665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xP95/kT2AoFRsvd8C1cZp/UNkH59w72xA2MdcuSLciVnr+WFUviblEedy/Enf7Nb81a1mCxTzb3aBiexHPItkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
X-OriginatorOrg: intel.com

not_report

cannot reproduce

root@2314f8997660:~/linux/tools/perf$git checkout 7926653c7be830de3fcb93edd=
57298e27c6742ab                                                            =
       HEAD is now at 7926653c7be8 perf pmus: Sort/merge/aggregate PMUs lik=
e mrvl_ddr_pmu

ot@2314f8997660:~/linux/tools/perf$make KCFLAGS=3D"-Wtautological-compare -=
Wno-error=3Dreturn-type -Wreturn-type -Wcast-function-type -funsigned-char =
-Wundef -fstrict-flex-arrays=3D3 -Wformat-overflow -Wformat-truncation -Wre=
strict -Wenum-conversion -Wstringop-overread" W=3D1 util/pmus.o
...
  CC      util/pmus.o

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, May 6, 2024 14:05
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v3 1/2] perf pmus: Sort/merge/aggregate PMUs like mrvl_=
ddr_pmu

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240505031624.299361-2-irogers@google.com>
References: <20240505031624.299361-2-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Thomas Richter <tmricht@linux.ibm.com>
TO: Bhaskara Budiredla <bbudiredla@marvell.com>
TO: Bharat Bhushan <bbhushan2@marvell.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-perf-users@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Will Deacon <will@kernel.org>
TO: Stephane Eranian <eranian@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20240503]
[cannot apply to tip/perf/core acme/perf/core linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-pmus=
-Sort-merge-aggregate-PMUs-like-mrvl_ddr_pmu/20240505-111807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240505031624.299361-2-irogers%40=
google.com
patch subject: [PATCH v3 1/2] perf pmus: Sort/merge/aggregate PMUs like mrv=
l_ddr_pmu
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240506/202405061357.4RZaM8jd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405061357.4RZaM8jd-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION =3D 6.9.rc5.g7926653c7be8
   util/pmus.c: In function 'pmu_name_cmp':
>> util/pmus.c:67:19: error: 'strncmp' specified bound [1844674407156206796=
8, 18446744073709551615] exceeds maximum object size 9223372036854775807 [-=
Werror=3Dstringop-overread]
      67 |         int ret =3D strncmp(lhs_pmu_name, rhs_pmu_name,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      68 |                         lhs_pmu_name_len < rhs_pmu_name_len ? lh=
s_pmu_name_len : rhs_pmu_name_len);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/pmus.o] Er=
ror 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

