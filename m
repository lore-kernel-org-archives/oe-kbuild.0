Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664655782
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Apr 2024 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713861196; cv=fail; b=Y4PTyN3eoU15U81wxE66J4uxmEoA4CaMd9QRDeX6HmNF+gH+JqbH94eVawB2lqPklmJqXp7kzyacJBqLWwqGhhqdX/2t5h2uG1CPo4UBSzHZzGvwRhypYYMT1hOw/tup74HKGHh40GCdYFs1RuZD7FQA0vUuAzItrYcskFf/ut0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713861196; c=relaxed/simple;
	bh=BoAw8Y2OJUtV8Oz0JEk6J2pN1X0QGcVZO71gxwxSmXg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sXqqRfIR02xXv2ISVWtC/GOqHIrkTv61fjaw7eZIbQzXwgmBA5R3VOFjiezSkuikpIQTXcS8nCdLkagj1s6TgBXEneQXxq9c6ChOEcWv7TL3O6CUOdeFFfFcEtfO/78YstH5mNHZiXw0ILTmzzhk3rdL87OL6hpeAEsqWfMTx8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YahOqfpP; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YahOqfpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713861194; x=1745397194;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BoAw8Y2OJUtV8Oz0JEk6J2pN1X0QGcVZO71gxwxSmXg=;
  b=YahOqfpPI2CvsrHOdAgMBl4SaHMJgjF3oZNzWyPNASbQYlkcZy0DrOiC
   xb6ahL1incAG/oyPvneYr3cL//OvCrpKxqxKVniQ0hbakgtuF7So41SCZ
   AM++ZZ2QWNrYN1/n5/Mfhw8oc/Da30A+fJgDKwL38P/OAhnncIdbtIKpV
   pOh0aMzWLgAIAEO/+C+QMEtYaH5mIsBqfyEMSeLbDtLlqYzA3PALcRkUj
   1DQ1/1HIlUpaPXi1LYL8qojvROhzWqPibEh98XtEemVEeq/w4ZVCO5CEa
   cuhlj8R5JA6BrvndjH9YPvIpfaHYUjqkxkIwRF54mRps5xS++4OvbLd8w
   w==;
X-CSE-ConnectionGUID: SQ4GyU0nT1C7RAScwYMjJg==
X-CSE-MsgGUID: nxmNF32dQaS3VnY5lrRYRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20044606"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20044606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 01:33:14 -0700
X-CSE-ConnectionGUID: zmZxE3RKSBupYbIxOCHtmA==
X-CSE-MsgGUID: 5mujg1JuThyaSnHNmsf01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55241553"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Apr 2024 01:33:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:33:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:33:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 01:33:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 01:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzDVOrKDhPxZ1gQEQrycn2lxxtNV1/bnstvYb84sfkzZ27aN+Vu6xqvBkanemaUOv8wObltNxh0s88/zxZ5a5ZI4BpCjIkbh/DADf+ildnFBzqh+syja7dAvt7/iWy0Rwsr/Mb3CwPa8SDYs+atYhC1acut+NFV5ivs5qD0/uW/Ro3lKFh629Ets6DGZkHYhJJySGFYfDu+f8DgjBkmiYx9JYEcPYkMI3TDEeybHic0R3Ij9tKIJC+zL1tu66vMsgNXdIkQ/NU6XffXCIjWfUr4KPfCXnVUJ/rVCHYyvcRuLmoYhibrdnqIO14qLSnFC3QhxQQh/ZFO2fTFpXUEkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7COQAsx1gZ8LZVsHr5RAwCnPea3E7HF/neYSC8qnGM=;
 b=Mr1+gxlYfM/egQ0B5ObJ3Ch+K7tYmHMgDDWgjebbsuCmKc1OE4mHewXEJDPl0jM21AHDv9oeyPgwkmdOi0ZBeGQ1JqxZcs20m9acPa/JDnQ6NmJrJgKrM9zR6fF12A0J2XIDqjVhZP6dzgL9chf9lhifCaVRSYVBZq5/dsT9a6RK71ETzY//jqLvG95S8OeK4DGRLku+UHAzph/m4EsVJ7CCajF8W8J/yhd3wXLkZMswsyX462hTVlYKGBOASmbLA5XoP/9+wmBmpzY18vn3lDc3jsiwqM8l1swrHAWwsxM0PwZxukA0+WMEZ963pCZY0qAYIf+XmdqTK6U+NaaFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 08:33:08 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 08:33:08 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [linux-next:master 6621/6937] mseal_test.c:84:45: warning: format
 '%s' expects argument of type 'char *', but argument 5 has type 'char (*)[5]'
Thread-Topic: [linux-next:master 6621/6937] mseal_test.c:84:45: warning:
 format '%s' expects argument of type 'char *', but argument 5 has type 'char
 (*)[5]'
Thread-Index: AQHalT1YlUMJbNPwe0Kidyig3iqE57F1hzIg
Date: Tue, 23 Apr 2024 08:33:08 +0000
Message-ID: <SA1PR11MB839329EDA53682F29997B9CCFB112@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202404231353.L1774EEo-lkp@intel.com>
In-Reply-To: <202404231353.L1774EEo-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|IA0PR11MB8400:EE_
x-ms-office365-filtering-correlation-id: 968fd1b3-1f1d-49a8-1ed0-08dc637000f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?84p+CWiXBQXwLlSDRdAUW9RHE8USqx+UGbz4eRnMm/6XVwaFvVQq0sdoyydq?=
 =?us-ascii?Q?hVI+vwkFZKVyDRoo9g3PPW+bMIkHTTTR7JAsN6msgUNVPQjmOAlAS5YPEQ5L?=
 =?us-ascii?Q?xslFyyil/si0be5bkHQbGrKv62n4xNnGE+Kl9S4dANk2ujCG9zEcPJfwHmlm?=
 =?us-ascii?Q?aAthZDvPz1Q0ZmLT/kRlULjp68M2iAMEI2+0LZ/DbQtWYCjw259r89nrVZ16?=
 =?us-ascii?Q?H+p+/MThug3BwRoig6h1mRWXBVMQ/4cUblt6dexF5j74ErD2tbjrdGU7kHTw?=
 =?us-ascii?Q?U34wGDEEVt0AkRE+zvOwZCxvRYPnv7lXYok76eVPpFva3LLiZBtbQLPf8shB?=
 =?us-ascii?Q?84WkuZku+lFtLvmZYp77kFCVXLehSj8qW05h9o9gpXNMuZBv+XcN/+javRPE?=
 =?us-ascii?Q?nbZLz6OAJd0rTDAe2bNvZB6z3nY1L9SpA0hnD3tGGP2eKJaPy5q0DSo4hvNn?=
 =?us-ascii?Q?N3sHAvfJqN3/s78p2feb/+tPQE2Di1jgFGSRv5L7NgccLpct0mqcdHYXS17i?=
 =?us-ascii?Q?AlmyM4ExG9ORxJLqYpdUBqlyWm0lepc2bC866yJE/DKsl9/esZ8oUcFvXvwJ?=
 =?us-ascii?Q?b6Uy7FwFhEwV1Y5oQtWABKKtPhELvHDf3mAQ4MVW4R2kK9JskSLlMO6hpE5T?=
 =?us-ascii?Q?1SEzPFExM3f+LQIXi+ora42KKxxJxyU9zsENaXlgi5EWAHu6rAQptTULoqS6?=
 =?us-ascii?Q?+2TdzUN1/hYI3E6kXQQRIR9cZNxxEeUMYLXSfo75RM9Oijo18md97rBCJw8B?=
 =?us-ascii?Q?n9fyOYVr8fF9bidioXsJXE764eGTxEHNMC7BVdw/jwr7fEnY19F15iEPFosO?=
 =?us-ascii?Q?vNvK190ew2iRsHTjfPLOzE72dW8wcv8wI3bIiiIIvPfql2IwjBHPBn1ju3Xx?=
 =?us-ascii?Q?/qCEC6egBw5JudNZeyOIfKrFoou0BTvz7EMz9anjkfOQ03UGL7+4g0L8V1nV?=
 =?us-ascii?Q?XNFHZATiK9S5uCoMOt6Y38/vrOUL2Ew5nizOK/PNyp5lf5LnquvHTn858u1K?=
 =?us-ascii?Q?7MH+fP8OK9FoPrTq83NkRFpP9jsw5YylJaZy2jLaLhjjxG+KI8JjnQ8CYo+0?=
 =?us-ascii?Q?FHvTpoLTKUPqTUvX35Z75eH6JbgEtm3Io/jSg5DGGFq3XjFQcQVfPYFN5Ili?=
 =?us-ascii?Q?o7GF7dD3kl528xVX6j3uXKDl5USuJsSHUkJagUvNB3PcyjSIGIhr2mACbC8B?=
 =?us-ascii?Q?0XTxq7IDFYVuHJTtZVhuvYfk5mAVARF+2BkT0R75FQ4ufO7ei85X3FzurmJS?=
 =?us-ascii?Q?94Lv7aiP6397V6EtU4Ix43YumbogjjZ5QLqMHYlW/e9KuX+sbRA/gx6tOHc0?=
 =?us-ascii?Q?ps4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FQMumVg9rmQvifJeaZPBo7mC1fPiG0yDaXOvELR5XmdtNfFUsP/jw5LXfiCv?=
 =?us-ascii?Q?55MsaFqzncjB3tFT5m+iU9rY6FZ1FmHsY5muV9nO+2HDcwxGEdYxvc9cOTV2?=
 =?us-ascii?Q?MH+MxbXgnkVGXMA/WXI9s8BkF1Krk8ZNxQ7DMQ5To8T6uNJVvgcDGtMnquNM?=
 =?us-ascii?Q?c8kRrscoei+EkdTvRCycs3nmQwxPCL13+gadgqVy5ykiI5vWygi39MNj+IdJ?=
 =?us-ascii?Q?+3YxHobzurAIoduR6HLWU2cH3tNYB5qiaoYqfpnt8/ZpQyPYIM4uln5FQSfq?=
 =?us-ascii?Q?d6214Vq9i54VL0pAOWGTs1A+CFx0bIQJjUKRycSPeyhIByG4KaK94N0TB9Wz?=
 =?us-ascii?Q?ONCUs2VF7puM7CkqlX4xeHihUywCiYASuYR9DNOdgiXYak2Jvk1tOG2DHU/C?=
 =?us-ascii?Q?QaW8JZ2vgX22qteQMxRDGJ2WxBW+J/32Meq6VmgAUKJK6sAWQaOUmvwvsw5k?=
 =?us-ascii?Q?lg6ETKR/1EyiRrksaD9omppSvpstRh/OiyCwMDffAN3o+dNkqahheci0bOjZ?=
 =?us-ascii?Q?JovUAIghHJG011++tOkWxAj8dllog+lk4J/mfxBH9pft8M3OUQXYbmZjodYN?=
 =?us-ascii?Q?nKh1DsHQnzPKSWcsKuF+sLR6bgM+EISfZXKLO8xgZUFqh1A5ErDcU96NuXuP?=
 =?us-ascii?Q?DD3Icd5MI4m7slCQUkXZCID6uv64bJ+cw0mjsxaUUfGjV8qgdK2BL7TGSUs3?=
 =?us-ascii?Q?cNyDbkkzESnN9LWepsxi3ycqi3GpiN2Ei25toTokOcfvTKM48+86yCQxTOHr?=
 =?us-ascii?Q?PMk6LOaFS+skKrs/U7Fl78E/HhXkPucb0HGt5bkIwjbm8e7kG9gFUIdp24Mw?=
 =?us-ascii?Q?jcipyck0PLLeTQPzAMS8jf263floa3VujCeytDJHsipXaRWU/NANAlV8w8X3?=
 =?us-ascii?Q?BABN0I1RpkjXSN9BSWPGt30JgFsxtBKGYDZvXFgXwvep5Zk+iKWcJZGH9a/n?=
 =?us-ascii?Q?1q1VUQPQt/L+AvbojOyeEmN7U6G3WnT/H+32FkvBVXfhDiLRUsBcFMKjp2h9?=
 =?us-ascii?Q?ikGFgbeD+cH0rhJIVPMcgt/HF6Di89EYC/KqUqVXkG1LQJ1Fg4zR/BClCAvL?=
 =?us-ascii?Q?NMRsm/Um9xOOEQ3k2KG1C8cFGj/tThmTozF4vn6ge7lhZa9DK29Fpv13gsAK?=
 =?us-ascii?Q?woFNLPqGnC8x26m4cfGlwT0hS3nKgVwb4G6U6/cODXsKEwgs8Xxc0pxa1jPL?=
 =?us-ascii?Q?DoOeVxKtsXSXOlj4DY1g2bAQfP5Tq9RGxvUh33y6vADsUZtDVCELMHKpe/TP?=
 =?us-ascii?Q?xgZHz1cGkypSPH4EwtJA/XpoFUeOXnc+EupiZ8SnnOiraA5At1evGjF0o/Zj?=
 =?us-ascii?Q?/GtLxN6uy66p2D8kSckCXiFNQkmvu4dby94RBFwQbtbBvUbz/osg8vZKW9vR?=
 =?us-ascii?Q?AU4sFsf4ffuf28hMYgntXx6gPYkh7HgmAOcKNJ30DNZXEVHRtP/wTRKuuTmU?=
 =?us-ascii?Q?mplKW2ndrKfxK3ZvXmym8DhQweJHhOr4QTsS9DaRVbrCfKpDdaKGEe5YA81l?=
 =?us-ascii?Q?xgVkLo1XQOc3PQzpNQVPBAWGjC1oqYHJR6waGdShan06kQk95EgOr0JQ8rW7?=
 =?us-ascii?Q?eaLBGxJxHexmqWlZKDM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 968fd1b3-1f1d-49a8-1ed0-08dc637000f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 08:33:08.3066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsPDhwAad9qV0nyr/wt1DPEnCLsTJHQcjWKJHTWV4xM9LKaAV1INfgPD3xye7kCHanTC9L/6APPKJnIPoKWEuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202404190226.OfJOewV8-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, April 23, 2024 13:14
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [linux-next:master 6621/6937] mseal_test.c:84:45: warning: format =
'%s' expects argument of type 'char *', but argument 5 has type 'char (*)[5=
]'

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jeff Xu <jeffxu@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f529a6d274b3b8c75899e949649d231298f30a32
commit: 99e05a968cf1c4b88aad1c6e1bbedd2442e9a50a [6621/6937] selftest mm/ms=
eal memory sealing
:::::: branch date: 23 hours ago
:::::: commit date: 5 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240423/202404231353.L1774EEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404231353.L1774EEo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mseal_test.c: In function 'get_vma_size':
>> mseal_test.c:84:45: warning: format '%s' expects argument of type 'char =
*', but argument 5 has type 'char (*)[5]' [-Wformat=3D]
      84 |                 if (sscanf(line, "%lx-%lx %4s", &addr_start, &ad=
dr_end, &protstr) =3D=3D 3) {
         |                                           ~~^                   =
        ~~~~~~~~
         |                                             |                   =
        |
         |                                             char *              =
        char (*)[5]


vim +84 tools/testing/selftests/mm/mseal_test.c

99e05a968cf1c4 Jeff Xu 2024-04-15   69 =20
99e05a968cf1c4 Jeff Xu 2024-04-15   70  static unsigned long get_vma_size(v=
oid *addr, int *prot)
99e05a968cf1c4 Jeff Xu 2024-04-15   71  {
99e05a968cf1c4 Jeff Xu 2024-04-15   72  	FILE *maps;
99e05a968cf1c4 Jeff Xu 2024-04-15   73  	char line[256];
99e05a968cf1c4 Jeff Xu 2024-04-15   74  	int size =3D 0;
99e05a968cf1c4 Jeff Xu 2024-04-15   75  	uintptr_t  addr_start, addr_end;
99e05a968cf1c4 Jeff Xu 2024-04-15   76  	char protstr[5];
99e05a968cf1c4 Jeff Xu 2024-04-15   77  	*prot =3D 0;
99e05a968cf1c4 Jeff Xu 2024-04-15   78 =20
99e05a968cf1c4 Jeff Xu 2024-04-15   79  	maps =3D fopen("/proc/self/maps", =
"r");
99e05a968cf1c4 Jeff Xu 2024-04-15   80  	if (!maps)
99e05a968cf1c4 Jeff Xu 2024-04-15   81  		return 0;
99e05a968cf1c4 Jeff Xu 2024-04-15   82 =20
99e05a968cf1c4 Jeff Xu 2024-04-15   83  	while (fgets(line, sizeof(line), m=
aps)) {
99e05a968cf1c4 Jeff Xu 2024-04-15  @84  		if (sscanf(line, "%lx-%lx %4s", &=
addr_start, &addr_end, &protstr) =3D=3D 3) {
99e05a968cf1c4 Jeff Xu 2024-04-15   85  			if (addr_start =3D=3D (uintptr_t=
) addr) {
99e05a968cf1c4 Jeff Xu 2024-04-15   86  				size =3D addr_end - addr_start;
99e05a968cf1c4 Jeff Xu 2024-04-15   87  				if (protstr[0] =3D=3D 'r')
99e05a968cf1c4 Jeff Xu 2024-04-15   88  					*prot |=3D 0x4;
99e05a968cf1c4 Jeff Xu 2024-04-15   89  				if (protstr[1] =3D=3D 'w')
99e05a968cf1c4 Jeff Xu 2024-04-15   90  					*prot |=3D 0x2;
99e05a968cf1c4 Jeff Xu 2024-04-15   91  				if (protstr[2] =3D=3D 'x')
99e05a968cf1c4 Jeff Xu 2024-04-15   92  					*prot |=3D 0x1;
99e05a968cf1c4 Jeff Xu 2024-04-15   93  				break;
99e05a968cf1c4 Jeff Xu 2024-04-15   94  			}
99e05a968cf1c4 Jeff Xu 2024-04-15   95  		}
99e05a968cf1c4 Jeff Xu 2024-04-15   96  	}
99e05a968cf1c4 Jeff Xu 2024-04-15   97  	fclose(maps);
99e05a968cf1c4 Jeff Xu 2024-04-15   98  	return size;
99e05a968cf1c4 Jeff Xu 2024-04-15   99  }
99e05a968cf1c4 Jeff Xu 2024-04-15  100 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

