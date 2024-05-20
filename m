Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688F22F23
	for <oe-kbuild@lists.linux.dev>; Mon, 20 May 2024 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716170364; cv=fail; b=Jayz5l/bGICOr7sa9ZuvjC8ZDHK7+N6So4jaNazw096KiOESgwgK3PhJJgN5WEj0P4vuarAGgMtbsmJutQYC2hlnSFXUL7b6nOzmQ4MEF+9IO7CIUujj5wy+e9OgwyUtMaX8jUfmueLWlEvTvvJqe0kQRgFI+TKjlGereP2opT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716170364; c=relaxed/simple;
	bh=INAdZ3UW6Jx6hkR7z/sqJMI8pz4/eDFUIe3zQlZfmzw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lFEgsRBH5rntjwpfTPBNGemwk9B5bWrGq82MxOJ//cGj+qg5vkpw9Aw2tUDHXVHMnxZvLl8TRrylNqbmLbch7JBtT1GXd4sszwKxNNPriCvAnGj6yKK5cUCH19RzqsexMTrUe1eV1K/2m+j+jWch3N0SexLkFZ+D/H0M922FG60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrcVsE1A; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrcVsE1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716170362; x=1747706362;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=INAdZ3UW6Jx6hkR7z/sqJMI8pz4/eDFUIe3zQlZfmzw=;
  b=WrcVsE1Au+iY192FvXDANaekA1/JoQ9lGns56Q7fuWdkldHlFE1h10cl
   m/8STIh5lXoyNTb9PDQPW6Le5BY05CVY9nR/vyZS3CrVSugpaGSdfOVaC
   YQp2Linob6D9OrpcQOvB/3OAZPqBYLOVJo1/XZuuM18Sae0/NlPyAxXNY
   MPC14G9EJH5fMrgSdeK8oAwzjl9dnG1b2p8z494rEJvyPG103eXyU0Eko
   bhKgavSXtHI9+5Lzs5KGFBnr/uyBSX5lGZzSBVuxYShSws4Jn0f8s2mdx
   kIMsmj8XpQaLVTeAeTCXWcL0/iiSpMz5hyQhcjNkqflTjCGjfXfGuzxNP
   A==;
X-CSE-ConnectionGUID: vIAM8PmtR0W38pqDWGHlAg==
X-CSE-MsgGUID: Wld1iqoKTZi/BO0v06sa+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="37659185"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="37659185"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 18:59:21 -0700
X-CSE-ConnectionGUID: ooS5QVLDQ3+lUe018Gr0BA==
X-CSE-MsgGUID: F/NpMQpEQRS89AclMM4bVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32395331"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 May 2024 18:59:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 19 May 2024 18:59:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 19 May 2024 18:59:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 19 May 2024 18:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp0Lri9hfZxi33XxD/sThS3IwBjhtBPKNcXsMrldbmFM6BkyNngAfHwhSPw1H9+O3/af3/qzaO4yOoS/Zp70lqgxFK4PVLWxoeat3n4+cp4yGeKqlKYdiwbGY+DHCGqWu3WSXdbulZJwOiKfsJGL2ZKISIgADmoTEbaoAZeCG0EBWokG/er4No+KXko5TTJ8yKCiWvHG7TyiCLf8cfZwq2biETRV1ns85X5mVkpUhpnnlxFYNlUahdxl4ee0LPDtvR13NqzYBkaFYzVOMcjTQ71sruR8lau06IgaT1ijFtn+jimYAkE4sl3uY6vMffSEgSpgK10RpsKSsAVdJUxpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUzbw88gDqF0Y9YuFbsFeCHRi22SCJWXaJ53HBQdLKM=;
 b=ZG/ETXDwdAfvA6tH3uT7MYGemXKnWRrTJbIsQMm1tbZCA0amCRYsi97WJOoEHLFqIzt6ZIZlujNePtM7NkJagXMM2G1GCfAs8mpTpMoyP8Zo/Fw543gy1MjZ2UAaqtLXk6a1zk/i7+Dmgy/kUfTC6dfEFoxZHjGRF2lx1mxMzwdtaOu9ADCE8vOUFnSC42yNqMQ9l+deOakFFd6oyO5cRYUCipDOaxEEUkJi6qGFE9SmCKvFX3Nyw7rzRHigvgxN7BsVkkZSRUBue7WnTxEFYl8pcs0EvDHPfsJLbCgjdKhZdJZV5Om71oV4sjrelZvyp8K3CvK4EntTC68GcmmHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Mon, 20 May
 2024 01:59:18 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 01:59:18 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [broonie-ci:kselftest-mitigate-gnu-source 2/2]
 ../kselftest_harness.h:54:2: error: #warning kselftest harness requires
 _GNU_SOURCE to be defined
Thread-Topic: [broonie-ci:kselftest-mitigate-gnu-source 2/2]
 ../kselftest_harness.h:54:2: error: #warning kselftest harness requires
 _GNU_SOURCE to be defined
Thread-Index: AQHaqHT26eOCVkxYsE6XmfGjHzEJPrGfYRqw
Date: Mon, 20 May 2024 01:59:18 +0000
Message-ID: <SA1PR11MB8393D92EB0AC309ABFE99711FBE92@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405172341.C6TNmGXU-lkp@intel.com>
In-Reply-To: <202405172341.C6TNmGXU-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|PH8PR11MB6660:EE_
x-ms-office365-filtering-correlation-id: 16b9ee6d-0130-4b7d-dcc9-08dc78707596
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?OBkuvvJZH+bjxca7Si2A/lj40C39lEF52siB3uG6mwrUTM0yiubSDqMoPg?=
 =?iso-8859-1?Q?5IzoRa5pp9Tldj8BodOUQOq9Mvf2xNasua0ADnFnjcuVlNE5MUiYxruaMm?=
 =?iso-8859-1?Q?5RPxfkAbrQXN0tgJ+kahTQQMLWO7Bhro5dUQ69QaD1gtFSpv9f6j3de2z8?=
 =?iso-8859-1?Q?CklYSYy6asfF5b8wSpuFJShJWM6AR1+/FzmTgmd08htlZvEfBU8MYemDmY?=
 =?iso-8859-1?Q?nrOmV6RN+W4rxXdBM/YVRxBm4rpHwVdENR4xIfJzW0cXx99g3ZztArQgf8?=
 =?iso-8859-1?Q?QbGIUpjZuAy/gTVSY7vOayGti3mTDNR3YY+i54AqGs45MToA1bQZmcXey2?=
 =?iso-8859-1?Q?ZNkTUYZ+3vHGhzmEW5HOmr7nTiFYMIf4ZqhvepA56DE0gKrjIr6Wa8GpQb?=
 =?iso-8859-1?Q?0wi6fM/AAAHrs9tX4hmcC9e3PqvSQABjSu4w/S467XDLZb5hdG5lmkrJal?=
 =?iso-8859-1?Q?p2WXh73wgyc68Df/jCQok9rh5SGi7FqrhQJGjzbWEMe0R2L+9pz2Fa0Y+K?=
 =?iso-8859-1?Q?kt+DXEwjnDBzH5MM7QBjlT9REAbkY7X+sv5zqepIOgipiD3O/gqETY/1cf?=
 =?iso-8859-1?Q?+0SNzN7AWRQM4kkK+C40Y4O6fBqIsH0SNJg33Tl8K5l+kgN9L9U/z5DqbD?=
 =?iso-8859-1?Q?Abtfe5ul5fy33Bi3Fxa4YUtc2IZ0mfWhHpNypjfB6UlMXxIXqIbiWxGIkM?=
 =?iso-8859-1?Q?SdRia22ewr8mVc1+X6snJMjuQEAfUACUSclqGxnTbk+7sDYWTFfuoFQQVq?=
 =?iso-8859-1?Q?cYMZkyWmAc1+0YWjAevnU5klA71+MhRDQyy2JRCos7DegNpdhTsHYXJ8UC?=
 =?iso-8859-1?Q?pvW9GUFjt00EV/pXB2Z8/7iW/wi3akjWJWQ9igyqNnOpf2MresdHM90eDV?=
 =?iso-8859-1?Q?BJ2C3oFx7od3MqRYV9ka1bJ9Q41nwstkJj3KuJjS7Zey8sD7a0h6h3Dsn0?=
 =?iso-8859-1?Q?opBAt6J/jA+IEyIPfsZkm1H4mkMV3EayJ6T+R9JzpSc0wTBGaSNn9WvWgN?=
 =?iso-8859-1?Q?Fkg437/vV8s+1JbZ5GANU3Vu74VW2p8+dAMZcenWwzkc06gmDkLQX35SxG?=
 =?iso-8859-1?Q?QawYETY3uiqiQ/DyGErbIseVLWHgu2MJhxb2HDkX9n8mQoBFKs5BD+FZEy?=
 =?iso-8859-1?Q?kpt1UOAiW1vH1f8XATAbaHX36Q8pTCKw4sCAvfFH+/oMivzew14qpZaMxW?=
 =?iso-8859-1?Q?3t0s3YdcTohRzVSwHjvn82pF9wPaF0FsH6bxUzEV/bjKIeYHxkwSpzG0cT?=
 =?iso-8859-1?Q?83ggmy1LNAG24c+PB77pG12ulxKMlBT6/2pe5YgR1lpBnecM+8I6f5Oept?=
 =?iso-8859-1?Q?MOadVe/G2iSAsjKSuLVyXB6M3s5uJ8dfueAry9qvw/q+cqc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?F/ib8A2HNDCjhUETAN0ypsIh1RoUzv2I2N9lyfREWKtjrg8AgJsnyuPfId?=
 =?iso-8859-1?Q?7mTFgMbXAOHeOu7Y2LABRSmehvi7o1Wz8+mp53SnOA/WW24/FF6bIOxsvE?=
 =?iso-8859-1?Q?l9NYh/LeBVUUmA0aeet3riuDsaNTgHuKLqglLzSHtBWqwrnnXGN9U3z5Aw?=
 =?iso-8859-1?Q?jULH/F4mlUYjT7a3H9TSyI9pU6y4QOSaMKRAX2GJRPkT0j1OCWA4MCxO7y?=
 =?iso-8859-1?Q?xeLBJwCZu6afMhg51UqEJze7MwHsvf2v86gWgFgBTKqq9VvfV4KJnqR8Hv?=
 =?iso-8859-1?Q?6u1L7kZPuQPXQDNwm88fcLgfR/GIUnW2WyIZ8FIE5kU82A1oFErfGnfKmV?=
 =?iso-8859-1?Q?B/+h5BRwpTqlGWq2Q770JEDoKKM9tioHCmv03klHKK30XiMVd1JNkPTioi?=
 =?iso-8859-1?Q?ZBrr03D08zhgIX52WAyJ17J/6wSUB453FmgrC6OgC3QeoJWrCJcHI6QjIN?=
 =?iso-8859-1?Q?BbIQ0e+WCCKO5IEnQ5vqSuObPcYmmFEHhUyXg2z7HRjNZ/AL2pvK4Flpop?=
 =?iso-8859-1?Q?iu3AWvdCZuVBXPdfj7sl3VCSRJhCjPuubWzYPEpXNi5x+uCgAeKVQ66elD?=
 =?iso-8859-1?Q?tqAwtXXsoDqQJLpkDc0nDeaaLvfKAJxjSmP8RHAvXSsN3jyLTMQBobea91?=
 =?iso-8859-1?Q?+6h2go7y7h3bl3gVIjqXFMPz+M+caxRLkTmaUI5OXclMjUTXkyy4PJQIXT?=
 =?iso-8859-1?Q?QjoiGQSKX5GC7smHe0teV4+gfeHlLhixIReGbg4v2ktxTKasC19qfLmQAD?=
 =?iso-8859-1?Q?MbSfoVDq3aLAFydjKURz5YZBIJMAVucZIdlXr3j8DBoSiQTvNgr6BrNyPT?=
 =?iso-8859-1?Q?X7JCSztkUxX1/mBda3qcXJ8LzW0VIHioioGhwfTcfQYigarzDLBS3rdC9R?=
 =?iso-8859-1?Q?0Go4DQkj91ezNFtgvpPviKKro1UigdN8n0Gn7hYTKj1SkP4rPIEUQqNpFh?=
 =?iso-8859-1?Q?JqyMtKC4NhdSIBcGglYrlkbMPHD84vlFKoT9A9KYth9ykIUHLHNUYwgVWk?=
 =?iso-8859-1?Q?9HXI/Le2jvvkClxM0mp9TinMHacaVNXZj9+Tf63XlG5YQLxQ/vRZfFaYFR?=
 =?iso-8859-1?Q?5rwoWsmO21/pOhvWJESbdnbkBNqVl9QiJM67LtlUCkC5xbplvXR0XQ6rE3?=
 =?iso-8859-1?Q?kI7eiYVDpGBpeKw3d69mi0bjEr586w41r3F7uKTePcm48YePJsYO5JU68n?=
 =?iso-8859-1?Q?xbyXvgFjqhoUycr7d72CjK0TUpV9f4m8/aI2PxSJQZiNeAjUqpl+X4L3l7?=
 =?iso-8859-1?Q?aeQxy9IcJc6yfARWsG3pXyTSE5j/wHJuMIY+QHcnIjI0h8372D/+7pLepS?=
 =?iso-8859-1?Q?chlEKwNVg2YlP+cT9kaYLFtLv1+4/GP8r+IOsYo/eueKc61BBrz6bCkEsj?=
 =?iso-8859-1?Q?1G6zhnydVQFNildOLlLwOZVDE9e/VI7sFvGfroMsmRMwqXExJTFBWokMKC?=
 =?iso-8859-1?Q?tnoO7SROlOuY7SGv1ck9c8oVTQvsMGYpaY3PJgZrjNsaSftoBuaYP1S0IX?=
 =?iso-8859-1?Q?fL3CrNnT1whZwn9QxUTj9NXVpQps+aUjCnyem0UYkbKaluxbOl/nLeBOCB?=
 =?iso-8859-1?Q?IEXy6BiVouS6pOkGSt4ARNjg7CHvUR9nSeBw0jpSU0TQn5cI949ceHBIV6?=
 =?iso-8859-1?Q?7Z0tpdWLfCutS9RYbOvjpOpaoepZPCisS7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b9ee6d-0130-4b7d-dcc9-08dc78707596
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 01:59:18.3783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vC0XQiFySDuOSPOWaZNe8pKyvkDOAPU6hmFwxOLZMseRtOfQx0YgCug1bP3L4PW/LMB3icFhlfgNCFsyJ4kRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-OriginatorOrg: intel.com

not_report

This commit changes the expression of an error message. Both parent and FBC=
 have the same error.

Parent:

  CC       hid_bpf.o
In file included from hid_bpf.c:5:
../kselftest_harness.h:54:15: error: expected declaration specifiers or '..=
.' before numeric constant
   54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defi=
ned");
      |               ^
../kselftest_harness.h:54:18: error: expected declaration specifiers or '..=
.' before string constant
   54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defi=
ned");
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
make: *** [Makefile:234: /root/linux/tools/testing/selftests/hid/hid_bpf.o]=
 Error 1

FBC:

  CC       hid_bpf.o
In file included from hid_bpf.c:5:
../kselftest_harness.h:54:2: error: #warning kselftest harness requires _GN=
U_SOURCE to be defined [-Werror=3Dcpp]
   54 | #warning kselftest harness requires _GNU_SOURCE to be defined
      |  ^~~~~~~
cc1: all warnings being treated as errors

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, May 18, 2024 00:10
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [broonie-ci:kselftest-mitigate-gnu-source 2/2] ../kselftest_harnes=
s.h:54:2: error: #warning kselftest harness requires _GNU_SOURCE to be defi=
ned

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git ksel=
ftest-mitigate-gnu-source
head:   45552542703cbd042bfdd3fe8584bd42fd0d5d7b
commit: 45552542703cbd042bfdd3fe8584bd42fd0d5d7b [2/2] kselftest: Desecalat=
e reporting of missing _GNU_SOURCE
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240517/202405172341.C6TNmGXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405172341.C6TNmGXU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ../kselftest_harness.h:54:2: error: #warning kselftest harness requires =
_GNU_SOURCE to be defined [-Werror=3Dcpp]
      54 | #warning kselftest harness requires _GNU_SOURCE to be defined
         |  ^~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from test-pcmtest-driver.c:10:
>> ../kselftest_harness.h:54:2: warning: #warning kselftest harness require=
s _GNU_SOURCE to be defined [-Wcpp]
      54 | #warning kselftest harness requires _GNU_SOURCE to be defined
         |  ^~~~~~~


vim +54 tools/testing/selftests/hid/../kselftest_harness.h

c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  52 =20
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook    =
  2020-06-22  53  #ifndef _GNU_SOURCE
45552542703cbd tools/testing/selftests/kselftest_harness.h    Mark Brown   =
  2024-05-16 @54  #warning kselftest harness requires _GNU_SOURCE to be def=
ined
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook    =
  2020-06-22  55  #endif
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Micka=EBl Sal=
a=FCn 2017-08-07  56  #include <asm/types.h>
65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i 2023-01-25  57  #include <ctype.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Micka=EBl Sal=
a=FCn 2017-08-07  58  #include <errno.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Micka=EBl Sal=
a=FCn 2017-08-07  59  #include <stdbool.h>
b5bb6d3068eabb tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-12-10  60  #include <stdint.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  61  #include <stdio.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  62  #include <stdlib.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  63  #include <string.h>
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook    =
  2020-06-22  64  #include <sys/mman.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  65  #include <sys/types.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  66  #include <sys/wait.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  67  #include <unistd.h>
63e6b2a42342c3 tools/testing/selftests/kselftest_harness.h    Kees Cook    =
  2022-03-24  68  #include <setjmp.h>
a86f18903db921 tools/testing/selftests/kselftest_harness.h    Micka=EBl Sal=
a=FCn 2024-05-11  69  #include <syscall.h>
a86f18903db921 tools/testing/selftests/kselftest_harness.h    Micka=EBl Sal=
a=FCn 2024-05-11  70  #include <linux/sched.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  71 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

