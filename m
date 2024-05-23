Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86052A34
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 01:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716429222; cv=fail; b=fjeSnXThtMeHDpAGD5ODD+vDT5DwcP4n44rEhSDcsmRogOxRo7rpoKWGp1m4N6XT2g7FmTBcXUxudTx7wLa3gmXVTn3H/8NQEo8GrwLOmFvvr/fHg2c5E1CyJhD4Y/WXOrl+lyKa79FtPw99CJ/Suxy77maAJ/WWpkT1VhO0Jf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716429222; c=relaxed/simple;
	bh=0ub7rCBK5ZVue8buSfdrxLOvxHM/OUcopmbSSy8ui0s=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SGjyROHHWUoHzfHL711tRhYcUmU7wqmyXaUACVjGAVvd6RWGiVhCQKsU26Nh0eqSGkRmETdSXCDgzt2ST0qw0U1pwWPFU8rt7F/y3U3KtMMO63nLNkUrAoFBLwfj3ClK3kjQPU5NLtkXvS2R/HQiqORo6kn8BoCfrUBCmQjTQww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcTT4f6T; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcTT4f6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716429220; x=1747965220;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0ub7rCBK5ZVue8buSfdrxLOvxHM/OUcopmbSSy8ui0s=;
  b=YcTT4f6T0DIwyTNJEW2aeUuM9P2c482ceNxDdTP1dh1zrSo9/gDwV1aF
   VYxidknLUU1qyz50xep1+Iy/otOPPuE6Pl9NEKkxzEOzYCO7feMYEMwXk
   swG2emVrOQBol0ufLY7VBZ4SAEM9ItltDRpSW9YCO7GYnYfxCFQBbrx8L
   IcF1rYP3cRDzKDbMGF9lm0QRDCIrwAFmcR/7I4NK7dhMOsbRqjD0VZ9yr
   SXQ2sCmqEkgyHuccAsM+IEvgHDr2n0TnV0HNxDA0xuQsJJFLBuxrF/71P
   OcTxVjpxh0c87rJC4xp6H/+rwNzLg9nLIaRfru+xgo2EcKIO7Qj++bWdL
   Q==;
X-CSE-ConnectionGUID: /+NcVntPSZq0S34lLMlVrw==
X-CSE-MsgGUID: 0GxtPgNdQGOIi1d8coyGJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15666330"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="15666330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:53:39 -0700
X-CSE-ConnectionGUID: bOg//lvVRSmG2fB59y/aIA==
X-CSE-MsgGUID: ci/Y5vCJSVyCD40eEYjp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33506047"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 May 2024 18:53:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 18:53:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 18:53:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 18:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiCN7aVr0zU+qZF7VelHXkRterUwrVIDXvyU2mQKm7Y+GTFYHs1yB9edI1duN6+IO7XChQZ8zjn2eFo7LhA8lcK480cN67wn160oaFRvhA7yGL2p4KFUsl0XxtqfXXrMc5965BnQoaXGCUbtxx2OEKPtQOY8Sh545HTionl2HDvnktoPcBh5Z/BxV/0G+qSVBW2rTQKPE5ZSxOc5jAmF/aFjKV/lVXk4hmBHybA++vSc4KYKBe02z28In0WBiobDNbPxJzS7PPyxoF/vN2XDv8XZh70pmWdxntRW1oqAIjEZxHG3GzCacec/FAphDHy5HDGQsw1u8DoxZu+mpuSu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrBTdjWSoYfAMOkvis82023sz4JUPS3Kli3DRJdaFrQ=;
 b=Pt7Z5AgLerOx7I/Xzm97a7CyQQfQ7n/pKM8PjkMjrhr43Ypv5TimNRo9TNfDlBCW0Kbtgb/+ZqTiGI+ldAfe8yQbbXHgTiVHC2eEGD4P2nW5kpblrYAKAO+yUS3z1DPlDkLYdy6M3JD4vFzCh0e2spqnCKRtFhyIxHmwwOuYZOsPU8iApS+nS/mTzJsx/bWp22ja3YQedqWOzTlWnMMmQ3Y/mZxYIoMkebbv6SGhGHYltFqwT2F4W9dwOAKBZJqATGm9ZLhaYhGtc1MkHYEsweRZGtBoC2W/pXJu0h+tgOids9ruI/gLq+Xb97law2u6XzduSBh6Y4zGgrCeIipX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 01:53:30 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 01:53:29 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: WARNING: modpost: vmlinux: section mismatch in reference:
 grpci2_of_driver (section: .data) -> grpci2_of_match (section: .init.rodata)
Thread-Topic: WARNING: modpost: vmlinux: section mismatch in reference:
 grpci2_of_driver (section: .data) -> grpci2_of_match (section: .init.rodata)
Thread-Index: AQHaqnPeAZhO/Pr350OIdeXrVJwVC7GkEowQ
Date: Thu, 23 May 2024 01:53:29 +0000
Message-ID: <SA1PR11MB8393F541CC20EB73BD451B7CFBF42@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405201257.Uk7LHoFV-lkp@intel.com>
In-Reply-To: <202405201257.Uk7LHoFV-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|DS7PR11MB6223:EE_
x-ms-office365-filtering-correlation-id: af3c39d1-43e5-4adb-7c75-08dc7acb24f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?bIVcI2w/Y41fqEg7zc52Lp1NyL2d2tXrogY0+ylGSY2HiG95nvNCP79O7kXV?=
 =?us-ascii?Q?vJ34gHlfuISQJeRKiQycTSjQgYTaux4L0JgmoYoXHIx7chVs47X+n661o+00?=
 =?us-ascii?Q?hwd5xc3NJESHrecYRBr2xSAnQ3Xef9B2YAD6dZm/mECvyConKiDCYN9DdcG0?=
 =?us-ascii?Q?L1XsFN3NB5xOIa+aY5qZ7NpEQ8ldP/kAkzW9ZnSUhASk8LxdEO41L/cdU2y6?=
 =?us-ascii?Q?6XXpCw3ZZQwbpHzVC1wnqH6soVdlT0MPgNudEZfwv4Ny1BSM6yIl8R/5Uhh/?=
 =?us-ascii?Q?u/N4gRF+p7NMnsq8xs4XOrzELSdCEU6a0WCrcmqANnPNDyp8+CnnHktOFFU9?=
 =?us-ascii?Q?FErjGSab3fdEymgcaoVtkfslOYxgG/+Cmq5qfQ1hWzcyHz/ksTmaf8ifrA6E?=
 =?us-ascii?Q?bvjxJfelFoIaaK8XICixuOe59khntae9PfHaKtZhNYJpSci/XBQlzNWCJirZ?=
 =?us-ascii?Q?XsUc0XRzd4b7eprQjki9CQRCquBN/JrI/5uLKBm82oI1Frjx4avvArKmH7qA?=
 =?us-ascii?Q?pYDtb6CoX0b7Rc8oDYWFMaI2E2KZga5iM6WmArZcTwEJ56mhLQQlKL6Aqrmy?=
 =?us-ascii?Q?hWDzsh32y6Jc+QQEwa4VpZh/vNmZUbtERK0LlVj47QLl68mYBHhKuSkjybwF?=
 =?us-ascii?Q?WDxkUdPgOPiaM3wokoTX/IUESK1UbtL55C4aqk4uR5X1kC7srOZq8dUbJMWH?=
 =?us-ascii?Q?R+VFyIS/+jCXf62WeXzr815d13UhYNWtE65eSASA2wBokcsdNEpCz+XwNA0D?=
 =?us-ascii?Q?aM4f5FFKpbUclXWapIFgfR3Yc23Yq52sd0nMVc0SLdWUtoqSFkWlzQ3X+jTa?=
 =?us-ascii?Q?glkB783ynBAgxFAXKiUIqq2ldD1G0ospcBBM3Sy6QISdggdrVAWFZFAOE5Ns?=
 =?us-ascii?Q?bhqYFc4PpA443ERB4e6a2WieK7fQUjMjtud+f4DzHj7cN1to5KsohSkUTqN1?=
 =?us-ascii?Q?kxsBzEHYUI8jYutHVgQ3ag6DTBr7emiq8Z4Mv30Bw/fShw1+WEye2QDd96J1?=
 =?us-ascii?Q?BDGSPA99ckLBHDM9NvhZVSYdSF2Xy9QHF8/kR0Gnus/UWwwX8nPDd7VijFkG?=
 =?us-ascii?Q?kBdvG0hIBZs7ImgE5XOXmAB0fEFCN6jVyPH5uBO1ERFjO79g9Fjc7tGICkqJ?=
 =?us-ascii?Q?T4i2WnWnUXTjGSIMeJbDXK9Mfil1tPojY7MGioOrOKbl2XxjaTvXCOreS7sf?=
 =?us-ascii?Q?7mvWD0kpRL/p3qIR9tSG/tLG9NCOXzDhGDMXdsBKQlYx+5E6nEFA1tpDIsOY?=
 =?us-ascii?Q?pnSlQe6QIXWgkvLdztbXEBIIFBKpF05hMHv1NrJUQgcau4qiDeku+v3qVcbS?=
 =?us-ascii?Q?aws=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z2dfUMmLC5VU6gUxbxG6e3d/BFay8jlilpThAat0QH0vNwXLx5ooCe/fnBca?=
 =?us-ascii?Q?GJGWxQO9lQW81vjLZklFqneaGvECFrcStIJenNRiJUHgp47XHN1z6eQaTOYg?=
 =?us-ascii?Q?wOUOEz6347VGx60o/HJxS7AgOpa03TyZY33SpRWeRQ8eeTpotPl07Sueyco2?=
 =?us-ascii?Q?WHjAJSjmb5Ma6E2GLFXOSLg+BSRoKnD/nS84j9G3bVZ2vY7X77PiqOZBvFeM?=
 =?us-ascii?Q?i/5I/8zvHiwAarwp9/opSIExxDOkcNVa1AFq20UqCWBMQftX/3APCWjC0CpZ?=
 =?us-ascii?Q?SccZarbns1HqV7CrrI1/OLIBiDUKm2sDV0bg4SxN8N4slUM6I9Mrph+RriyR?=
 =?us-ascii?Q?CvDtwmjRdm3ywE9xevcXjfFWih35adc5vYWsqpkiN8N5BHp96mg8zRbJhXY9?=
 =?us-ascii?Q?n/q0aOKp+TAGZtFFnmieKOvPI1zQgU6I1m9nIagRPBgIBXhv5FisvX/rf5Eg?=
 =?us-ascii?Q?BisjNPL5UPaUV50TBbJaWBuQsiKbpZCKIh1CH4dpbEAuzPL4l4HurK5GsaIp?=
 =?us-ascii?Q?cmaPaymTF9AD7mErxz3k30tnG0/4wT7N2ztMKBhVgl2lV8c1ZFY4nDVF7PPG?=
 =?us-ascii?Q?oHRZRSZO9kxa3IBduUl2VqWlPAbk7IdbZZgFBcP2W8ibQN0cSZvXBHT4nYyG?=
 =?us-ascii?Q?v9/a5ASTz1OiX1thPsWbtKPmDHjQVOUTaff/ltbbC4Ma2CrXY/Ap1vOEWyIU?=
 =?us-ascii?Q?6ZsngBaMZPJayCk4JZYnHW3c2H7UnKo847NWZCWodq7W+PQM8pW3je1dkzKr?=
 =?us-ascii?Q?piFAYShoqqgTmzYJvBezMY8flmkr6T+yVZF5npDcrM3M2oYgziL5+pbfTtxQ?=
 =?us-ascii?Q?fy75iMOR/XzSslDbSAbUpkO4Bqn3L7NRTMqk+PoX+CHGPnJb/VlROFPaWTUU?=
 =?us-ascii?Q?D+CRgxVmBRlWpGfbGo61pIid9V3qCevp3pEj1JTcYctBHtMbtrIYKimiKnfh?=
 =?us-ascii?Q?i19j667XHJwTNP3Y/cI9DGhlgUSIurt08UT9ICtdJVZ4nyUbgNJ52ofXdNTS?=
 =?us-ascii?Q?GY6IQBDXJ8JJO4SjxGI+TZlaFSVKyvkas7RRpPfiPO2F2Xf70EZsAx0hlASh?=
 =?us-ascii?Q?ROETIlJDqOUXaZzIHiDxSoWelW8853iPeSkdcDiXHO8AaeQupVb4i6Q7AfXH?=
 =?us-ascii?Q?UOJE9Kae9zyT7NJ4f3ljVzo5DeFxRkJdnuJ/bPT80xyIUPfldyNCS9ezVOV+?=
 =?us-ascii?Q?3W84BLmmzPkt4BLBNgb2SHhD2FyxgH+rZKtiHxTZIAw7oxPTmu9JYxrZQjuS?=
 =?us-ascii?Q?zyp2n7tybNQ2o0YX+O0pxpwXH9kSsZ0rR8o8VD/3//K4yCc7qpcyDyHegFMc?=
 =?us-ascii?Q?d4nbIxO2KIXO/fpo7pk/u2MzEVFzD9l7b9jQfT2ZzVMk3DZ9bdaLIy4dV0JC?=
 =?us-ascii?Q?BT2VEvL0Q5YHPnOn79SUN/pxZebPLiayV+jOAXKeZwcmifg0utd9/O/Z61E4?=
 =?us-ascii?Q?St3GS7jhxhEelBb8YbVqDisOGx4bvnx9Ofj9x+ThCEmBjR6zFk9HpFOLSTt8?=
 =?us-ascii?Q?MrTD0YtXIgy8/Rdkhyq4tnQvLPM6Na3fR0OY80/GUAkFW48kLRXJPfDVfX0S?=
 =?us-ascii?Q?xrMBlJe+n6luoi+LUjvKXQPNc8tLf1sd2gg8QMyv?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af3c39d1-43e5-4adb-7c75-08dc7acb24f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 01:53:29.6474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y14Ak2Eg8WmKkZ3kIN0uAwtTRZVzWn9ldMHQKYmruHw6k3hlnggODxF1rxm2iRiwyvx+N1RP/NlckuaOb6C7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
X-OriginatorOrg: intel.com

not_report

This commit causes minor text change (vmlinux -> vmlinux.o) in modpost warn=
ing:

Parent:

$ grep grpci 94d6cb68124b7a63f24fcc345795ba5f9a27e694/kbuild.log
..+...+...+...  CC      arch/sparc/kernel/leon_pci_grpci2.o
  CC      arch/sparc/kernel/leon_pci_grpci1.o
WARNING: modpost: vmlinux: section mismatch in reference: grpci2_of_driver =
(section: .data) -> grpci2_of_match (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: grpci1_of_driver =
(section: .data) -> grpci1_of_match (section: .init.rodata)

FBC:

$ grep grpci 92e2921eeafdfca9acd9b83f07d2b7ca099bac24/kbuild.log
  CC      arch/sparc/kernel/leon_pci_grpci2.o
  CC      arch/sparc/kernel/leon_pci_grpci1.o
WARNING: modpost: vmlinux.o: section mismatch in reference: grpci2_of_drive=
r (section: .data) -> grpci2_of_match (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: grpci1_of_drive=
r (section: .data) -> grpci1_of_match (section: .init.rodata)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, May 20, 2024 13:07
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference: grpci2_o=
f_driver (section: .data) -> grpci2_of_match (section: .init.rodata)

::::::=20
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
commit: 94d6cb68124b7a63f24fcc345795ba5f9a27e694 modpost: pass struct modul=
e pointer to check_section_mismatch()
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: sparc-randconfig-002-20240520 (https://download.01.org/0day-ci/arch=
ive/20240520/202405201257.Uk7LHoFV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240520/202405201257.Uk7LHoFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405201257.Uk7LHoFV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: leon_pci_init (se=
ction: .text) -> pci_assign_unassigned_resources (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: grpci2_of_driv=
er (section: .data) -> grpci2_of_match (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: grpci1_of_driv=
er (section: .data) -> grpci1_of_match (section: .init.rodata)
ERROR: modpost: "ebus_dma_irq_enable" [drivers/parport/parport_pc.ko] undef=
ined!
ERROR: modpost: "ebus_dma_unregister" [drivers/parport/parport_pc.ko] undef=
ined!
ERROR: modpost: "ebus_dma_register" [drivers/parport/parport_pc.ko] undefin=
ed!
ERROR: modpost: "ns87303_lock" [drivers/parport/parport_pc.ko] undefined!

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

