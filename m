Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1633D45D5
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488174; cv=fail; b=SQtovD7CdAYKtiZ+L2gU2x/EyOxZ36OJNqAf9yzg13xEOxRf2AFfZWRSxGW45WlW83RNbPWGvMFykIXi58Z4GiW/H6iLmk8A9VgescIXu+rVp4B01NlRUzeQc1kiYtKTSLqJZK5IdYrtMxLkVOutWVbz/Yj3f/9MWr64aftkadM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488174; c=relaxed/simple;
	bh=wtxEGIdya1F/fH4t+3qjh+oVC2lHKGXXjTtprH5NQXQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ee3Lku2ubbeCJTqBUj57zzxVKDzbd6v6XGT6vjG0M3iiELTyamV5m7YqIefALiKxaYTrLKGyP43zNDsHdRcJysrZUpcHC22YOEt/p2nGK2YzAd5nfs6O42c2sFHjtOiZuKhRCwRF2VxQpBXVglfW1sNh1YJqAbkejy2cW86yWKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeuGyYIK; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeuGyYIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488172; x=1819024172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtxEGIdya1F/fH4t+3qjh+oVC2lHKGXXjTtprH5NQXQ=;
  b=LeuGyYIKs3m3z81b9YCLxKBftHU85MBLIUf6kEwr9JVPOt0ipk2Gz8VH
   2lnvjgkvFbtfYD0+gN70qbwy3HlHP31/wUf3lFk78bXk9iWg+161trfvX
   axI5koH6OvCoqAG9tlQ52L9gmxJ9lUr1QI8S6k/T0l9cmWmpxdoH7Xzmh
   0p2ER4GDJ7cawducHO9h8lgGAACkmPU1LCi2GNfXpBU9EZ5mm5X1QwQf4
   UKpkm4hdMmpF/B1vt9E6wwePy9Bw39h1Q49u3cns0n5AKNbOfiE4i8uin
   sLd7WwMVF1RUOV4nIihk7B5Quk1assRrD8u+P1fAVHbuFtAMoJQXBz4bn
   A==;
X-CSE-ConnectionGUID: chfadOR/ToS1dRU9C6qK/A==
X-CSE-MsgGUID: R0Pp1ub7TCOV5yNAvBgy5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87981895"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87981895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:29:31 -0700
X-CSE-ConnectionGUID: pC5hnODNQLqn6U4k+R8ZYQ==
X-CSE-MsgGUID: 1Vz+ZfrwTCGwvUho9PDeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="304954865"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:29:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:29:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:29:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEcJec2o4K7fM+hKS6nbkkAZF5cCeFqgNOglIkSHr3chVO0IeHEgrJaGnt3YUuA1X/jrO/YSQKRBZaBY/0BbV5JUH7H5vgoft3YD6782hPfLkgIfFsxApmqwci0la+u2qHvpkRWv2/CPp0q+PnE9VQiTWG0+NyY4aT4cOcDSmA1q360KWBDgHNCFNGyMza/YV0tBdlk/7Bt5mikKmkPvp8HvpXvsa1L99IQnk5e4Pzd/iGZcbvYBEGG1NoUD96FLUM+1tUOqn1LwidmMpNMExa8jMYEFCCQvQ9IVN6Df6AFZ5TgbyRZH9zPbo9LaOWnFRiMt+il9eX0zqgglg4007A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTamq65fhDrSQI9aMpTRwBMwAqa2l+5tishpaqbWzfA=;
 b=d9F1pzdCasYdbafIVQGrdrSyyhg+9MkN2zA04H8EK9RP+0zhUSxN46aV8KqYzdb7jNAPOgXHkIHkpGyWTFBzPwXssuXJuu4tR8fDIbOqEG9yceoNFglSy2RA1erpt0Sj2xFhnPUeK23513mm9wbnyWubw/MOd4wkBv1iUuHZMy29JQ7SSXCmo6uhjWhw8wrZnYuU+4rsGbD1wQ18WPlnXT2ON+usXYXVMVfymllNkT4x23G6lcYBOJzDjYvhdBtI4SDXuNTgwe91WkoNplpszkHnXkBurEk2wXzUnlEd2J5I09afxEuVdDaTQUwkhPoAk0P/n6HcjhltNjo6KgghVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:29:28 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:29:28 +0000
Date: Sun, 23 Aug 2026 20:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: [asahilinux:tbt-reset-wip 31/36]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/cio@381ac0000: failed to
 match any schema with compatible: ['apple,t8103-usb4-acio']
Message-ID: <202608221636.6B2KUVYY-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0011.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::6)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: dee5dd6a-4c2d-4d5a-3370-08df01122d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|13003099007|18002099003|3023799007|56012099006|10067099003|11063799006|220923002;
X-Microsoft-Antispam-Message-Info: ZLWh97+WWxoE5fj7ra8/wRBEb9pXp83eL3ncoOmy8NYeft5+Q1/D+cX2kAR5qSdE4DpDfJ8dUHycUqV9i6QMbcgb2hKPBBK2n1imBxSGlwtq5TwL241TsMeokFDws7Eg/DNFZjCR9IGTS4VYB7insGptF3p8tBAK1isZwXORBxfT4BIf8YzCIMR0uitljGsEOxru0ZudLt2Ylz6sT+AyYLuk+ZFgvR8j66vCazt7808CkagirMMR4xpr4noxkmIyOSZ44aChla1bppgfCwOOINSCtms5WngWLws2eSHPaproh7YpjJ+4jPNkXolVhokUNWZlp+9gNDQjliU5/eXxKXW34tQmZYMz8p4mxD41OINjTyhYnAP1nRzO60/HOkJgdg3lvpqHWxCzAPFBHHo1L2QJRaL7wfRADO+uVn0laSeYdO2wHMW+tAbV7km06hmh438R++2iXhJ9ygB4zXG18GifeAbjR9aTkp/+Ra323pwhJAsoYyAPQA1reP4YpjyOdyc1cz3btFscuSzNRu7WUYuS9p0t6gW3nDAZhRMIRDJ6JW34DABrPsF9cNOdO4ggOjkDwH31bOydkMuocdfSm1hPU03VduWsNLLARqYKfru/PzCfXz8rRNAyt1vIDwZU5FVXKPfcgMYgNszXl2nPXGOxJj7yr5snfBDgC8cmyho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(13003099007)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZsHnvAwNAqIcgHLEbyZyLlXkhquAgZ798vfVs5YDk8mfWvr3Nm42xyKWajHp?=
 =?us-ascii?Q?CzBYs5NXRwOumYYJHYNJnuKaHucXk7DfaorkXZbK1ImZsWQKlhYdc4tSdJ3Q?=
 =?us-ascii?Q?tz4xoEzGz/qMUd/Fx6OghShKQDltPSXWqfRg8aY0+EAucGkJF/xH8shzh3HZ?=
 =?us-ascii?Q?O+1fvNfvu7ETKn1E3M9GdbziQlgKAAv/v20oPvmcZngR35fb2Vyy2widtaoq?=
 =?us-ascii?Q?Hr/elH/mZ9Q4oYvRQEW6gbMqQPkkl26PL7XqGbcXzwp0Gviq5a9nOuP+twkd?=
 =?us-ascii?Q?YSVUrNBJVojD4cV5yEZd/LYj2IjYQr847zPu2oSbhahEbKCz4YE8ZCJQZa7w?=
 =?us-ascii?Q?49iKJxMCPV6+PWVGECZWpCJ+k/usMYkBrZe616YjRUAMOGKoeyDefWFceMLw?=
 =?us-ascii?Q?7y2ATMPu+aVuNKu8nepgcVgXrqIjKBscB7ugQd+hkKtFTeLpPH8v6c3GaFDx?=
 =?us-ascii?Q?31a177YE8FhT5clfM3f/ktGOIA1d/iOgX3LQ4O2vva7alNarVOdov+/N8Io7?=
 =?us-ascii?Q?JiBsz1DnlZevPDXU8FRzyfCToI3WnBk5tDalhqNF/Co360pL934HtTraJX86?=
 =?us-ascii?Q?npci8qLPYbif+VMVb1O8Y78eAv2BR/b0X2OhKWDeJ4dykAnB/+d8uosfxLO5?=
 =?us-ascii?Q?hFxT5qXQdEjQI7kueeQuNFa9/jQkRucFDN4DwcBSy3U+ISZ06FhFKN0Ec5Ej?=
 =?us-ascii?Q?fmfT2ptQs0jUmHoZ22B+jczJcaTkQHzFXM7lT04OpFwiE4eVlV4mPuRJ11m+?=
 =?us-ascii?Q?jIJbxV4LlKOADFgdzW1IjH/ZrWyJaSKflwWO1RNCF7/nu2kzdjXnTjpNng4B?=
 =?us-ascii?Q?sUYPs4jzWhG83DsgFJXF59VROB7Y5kmVOOvbYq30sMAWRpsSGbwJzB9dWtGb?=
 =?us-ascii?Q?PCzhEs0sXrrT9kCAalrd4ml/P/Gq6TzG48Q6j71yf/TtMH1t8cVFkcC45Hba?=
 =?us-ascii?Q?k9iuoK3hysdHsrkqJelFzNIg6V49kRySG1xqShnaJuRHkyQ9EoJmifI8FdNU?=
 =?us-ascii?Q?4A0hz1iGB6SJdwLR9SyTIR0irejywKcF6HDOu4qjQ5RJnRbfXz1O+/aUFiu+?=
 =?us-ascii?Q?FQNIm1gSLOwckjAfi3KCQcgTsa0TX3i0usZ/xwsErMlxV9QSJugoLHlHnMWU?=
 =?us-ascii?Q?LTlQV8QSh5jj41CqbP0/9Eg8lWnMkFP8kvJHyYTodqZsZETQOaJCU/TupR/q?=
 =?us-ascii?Q?esG3gGd09pKVIkE70QeTJbikrD/wDd14CEX5mJBsmTC6mGXbMzwzYaD+d0W6?=
 =?us-ascii?Q?s5xxNvyvFWe3hXQyeMpKTjFuvkwn0DD0FQ5YFue3wbs4ML20i8RMYS1qb6Tm?=
 =?us-ascii?Q?S4XjoXoDUYgiqMjeTZMHV4Ls5ZIhmlIsIxQfwzlEcs6jY/Z7/0Ks2Zx+0cmm?=
 =?us-ascii?Q?2gg3sqDv37x5bsZHXWrlOAU0waPmEP07JQvlPg9+DEirA7jCYN0Y+yHmh0ao?=
 =?us-ascii?Q?Xa461IcfrehgV0flmBs6RDnKHEoX4SbZnXH0TVjPBRz4so3+XYI+6b15Nf8P?=
 =?us-ascii?Q?u0pb3xVHo2ONk2WW9lDNHKscSpmTiOFF+4Icrk51trQRZrhKWexrC8pH/7ls?=
 =?us-ascii?Q?L0/NvCV3yWe4rdnIbo155qHo5vxA7UwF8Ql68WLqBX472pfSbsyjeauOIwsI?=
 =?us-ascii?Q?HwahG5Pow4Lfr0oskXRWA+OHA8ISLKl2ATni0+lYIP8WPKG6kN2VZswYlKa6?=
 =?us-ascii?Q?MNnS9ww9R9th3ZJ/LXHaKDImoRVadX09hxFtHy8oimwrFiy3XQybsODp12Ze?=
 =?us-ascii?Q?sHW9sZgrfA=3D=3D?=
X-Exchange-RoutingPolicyChecked: WIdQJgpkZ5JQqe2NYFueWBd7VWkYgNrLXfQMhj0R25q8ySdD2jOzLQZtGovI71utSOTNILsoDCquNwNTqpL5qiuekqYfQfKGCW+5Yf2l/OvLSpby6RBJo1rgO9f3sk/SAiDvryBbOdFcWgjKqEx9fbVONIrhK8K0fh8Y969XqZZHT+uky9OiwoQjDw9byWX6c5fI5GQ+wAKxa7OaLdhwz0kRAVxH3WgiX87TzUV+yd+Wb0Zw+YQEUby/1GvSaGGMMyrIx5CSo2JPDhtxvg6/W73dpFRFxTQgOyM3ULUI1tpbxnk+JRx2ge5ddMost4mluYhrQOGLmu6/VQ7wrEKRRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dee5dd6a-4c2d-4d5a-3370-08df01122d0f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:29:28.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njzuetk7wbpM+3YqcP2JCOH3wkmHEcYr5ywpF+UiGHya1r4jv7a4/eyYrcsNv+9uVIL571UKl4+QmUu/gqtIaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   f42b9fb4248a76449873cb91cac2696aa1df9818
commit: 8506afe43f6ba444922fa9e457a0e9cda2b109e5 [31/36] arm64: dts: apple: t8103: Add USB4 ACIO and NHI
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260821 (https://download.01.org/0day-ci/archive/20260822/202608221636.6B2KUVYY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project f39d58144cb1dd40c4135af6ab2ff17ffa3d902b)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221636.6B2KUVYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608221636.6B2KUVYY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: nhi@f00000 (apple,t8103-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
