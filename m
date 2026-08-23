Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA153101A6
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489679; cv=fail; b=SKXtlrYVFvs4wGLn5MbeQEUYBaRiaP5dTLhRern6IE+BaJayr5VVSqcAOtTikCWrN7ywHRnor/+dBULN004xL3I+8+h/lg8+QejnL5Jjyjqez+9bT1PTYPs4kcA0LQp7c2js9rpovW10E/01cJ3aolj2f/kqi+1+7eTe/0Qaus8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489679; c=relaxed/simple;
	bh=LVoq0OK9LImSe+csvArxkvScBi0ZKv9fj3IlojOrx54=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=R/KiYYLJeZoe5UB+JW1EvA6mntS0kwz+b8V+OhYt/qUMxyGJHdnZdwy8VXrNL+YnaexHm1ne8Vhkrw/bYOjA+rth2PP0gxZRIMWWvoiOJJeSJhURFAYVY7jGm53t0SOPjMFt5BKVPUPAnoCXkaIE5MtS4pf9FTbb7hzXFq2NCvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aL4cJUEp; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aL4cJUEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489676; x=1819025676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVoq0OK9LImSe+csvArxkvScBi0ZKv9fj3IlojOrx54=;
  b=aL4cJUEpYchb/gQjDGmJiBqSwZ4kavqMTaK6feHlwW4Dm5uDBeZFmXEw
   aT5ExoLdtVdeTqK0FAPSLUZDs4pcLCfivLuMK2+S9HeJ99uxe+6vYtUcm
   eFKRVEpn6T4iexJX1XEkbAcNUCqeTD41RLezTeGp4jAZFigfWJ92L8AfN
   5iytjSz1IcmDZGUg2DuUdSzc1PXdNjG1Afd6Hr9h6/tSlLZH6G1w8oBUe
   G7/KIWIJVJIwCeZgO+5MqMoT//TrZ36agk94z3kA2qfKdqQeL5NP9TENY
   7Hk4JyWomqkOSo2gZhe7qydmqRooAXKkxaBPZ0NyHuH55DETDW0mwYJ+m
   g==;
X-CSE-ConnectionGUID: 4QMzBSsfQW2Ac+VRBsDenw==
X-CSE-MsgGUID: omYKa8kCQACnTBrAnM/rOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98634215"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="98634215"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:54:36 -0700
X-CSE-ConnectionGUID: 976jP6gvSWy3rEvfcNg2OQ==
X-CSE-MsgGUID: PnZnGtyrS7iQcNop9/lXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266810124"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:54:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:54:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:54:35 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYd1t3Vr/cgBvP+nHncuZ2an11kX7pc/Wrq+vhsT03lH5Aq5Yrla6pf89g/Z1eivt8W6rOQGnxDtJ1HD32ThUJqthmRWgFJUC5selKwjslwaIs6ivdtXGohwCvSj7og38gp1hQobccmU3iFmzR4CfID0Ktv13KJ8QlOdwFEeaEe5gBYEQ+wO9iCys/n9ZTWTTOR/ip8aPrV1qHnGrE33zjYqTDFuwukRDPF5siEvQpqvv/iump7QMsVAgyHoLLSG3PvH1IsgEDuRu6VUlEa+Bx9Y7D6SF/GM9DYH7g5f0Tei8LyEV+gSr/pCIbNjzTJljqRoIPgByi1FK8NTdn5/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS3VSiFBmlXlAlDTcF26AGZdHvdPQIzxqb7qLRKrJ8Q=;
 b=qsqvQQxXAfhK/VNLkN4SHVyaQwaGTRaLIpZGTd2Dnt7MpBeOFzDVOFM/kEscdQDE5Zsfr+jKWL648is02fsYos84CuSZP0CAuWkIJmBHIMcYbzlGD/FYqD2U46fxHRle1HVztUEkb3/IqXyC8cVHBO+Rf/07/luNYZ4Txqqyj3SGG3sBNaz4sZrIMAFoHUE008037lUEcUXoN3ysR9aG3evCu+O+NrU9b1bXkGXsyemqdhGz3d1bBDZRbJ+hUdi+cnpxn3RnxwWeATtAWkpxY/3zp7Mgkhn460pEM0wAX8lAghwmVcNLL140CMG57VpE92rdVxYAVfAhdyaBXKG5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:54:33 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:54:33 +0000
Date: Sun, 23 Aug 2026 20:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: partitions
 (fixed-partitions): Unevaluated properties are not allowed
 ('uboot_env@3F000' was unexpected)
Message-ID: <202608221014.QJMMtcl0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a32b70-5dac-439d-011c-08df0115ada0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|3023799007|18002099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: US0v/DU3kOvvzNLyYI44gM0bCfv0r+UpmatPSjxt0OY9rOWY6XoMIUGgRYVrTKFq06z/iZmVDgOFAW3KORagQIJvGFqHfZgHTkBdBqOcwrex+pyju6u050KVfzNuF+BVyL1dzOUd1gzeQqAU4SH/O0cyJG7BX6ibstRqDOiC1NgqmILft6M+0DoV8w4VJHv03guh4t6YYoEjQHvy6dZRqXOBA9uTS1KQljnTPzw/CBkmbaHCSw+OBMQIBm0qArPi4xmWJDEUDUkkPWGSkzeNrjqicVuYRmRlWITq9QrXRqw6yzAVPQR8cxDAEUkEOpE1QfSk00Qhw/DK8W120dEa4dZwP6YQ6Zeu/viX222YDVLpQNBrlwEi03LqSx1QhnoMwAPE8kCOufsnwr8hHQl7nXeJRBxXW4OAplvlapccc5Pk1b+OQmPPVffV0HC2M0WabAC2qBtb7RbvLTuCsjHJZt8y3smqV8MNU5i0cLJ20a7Cjmi3MdMSRfdDB4XdUYZMPRKt7T4JvQ+gcko5gdG2ya21ONY+H1u0cYektlasj5GzMW8127WEY8Dbxgcv/bOiKWZKUqDA5w7mX/0Lz0fIYXAR95U5e+V9VNBwILPFV4Z/qfhG+32o6nuQ39cBYEj4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nsl2VFb+O6XQjD5C85zU9MNOFzF8EtlTUsJqXPunb9/D87191gkZg/Kw9Lug?=
 =?us-ascii?Q?lvP+y/0ltPSHsTUnWDdgVDZkJZ2xAhQTQbh1kAlpKkkoo1EHkUd37VApo6O/?=
 =?us-ascii?Q?zEpdAls3fcR2TvM7u9/AgcoKTHr+ai4V+XGyPJlQbM1bQX6yzNN1rwYg6hTA?=
 =?us-ascii?Q?bb7Tmh/ki5kNDKadqWj58O/z4nyF5wLvsoaS4KXQPiaxZIAEuygLLDWmC8F9?=
 =?us-ascii?Q?D2teVDJoFaFsqS7n4t6aXMGkhJn8uvMFUF9Z3+jDp8KNnsJ95rpvlC0M43mG?=
 =?us-ascii?Q?SQG3eJUjNm5gGVu7TwYg/oqRTFiElBAoOa9TdpnkRrkUKh1j8wUP9qaX3srI?=
 =?us-ascii?Q?YbJhm7thpTQFou/sUWVSYg8Oh8uNcZeOaSoxezd77w48fq1gA2djo6cKgp5K?=
 =?us-ascii?Q?5/LMkxqOUGg4IhZ9Te0LzXSpIOJ31tB8DT5Lyr8WKb5yvF+ykzQS62pR35Du?=
 =?us-ascii?Q?QsHXIS2mgiHb90nhtWpuYek7C7iHbQ7IWELpOuXFVV6YgCBgoBdZF2V352mH?=
 =?us-ascii?Q?iAn/FdIS1BWIzSiTdFG1UGpsQzoyNs52Hk2EgbFUgAKenUrOR96jI3PlXvSy?=
 =?us-ascii?Q?/bmGBd67Aq8hmFYIXe//0PGP1Ar4jVC3IxJmiUXhFSKSLUvkwlu26N9q1CBG?=
 =?us-ascii?Q?sNIuSDlKQDOTRPITJE3+W6MNBiRYUcA2mXDxTjEe1HJZEo4BJn0eaVNeP6TZ?=
 =?us-ascii?Q?bYeVNkgPwLbKNNiDK6hGfkJoTO2bTYMKxSQQfM+Hv8sKBY+bsdWb7Mcudnb1?=
 =?us-ascii?Q?ZGwjZoAKsp7IK0hkTTPmLs5IG7my6KrrtmIo5qVUZcqoc6hQL7Uvm6MnWLE9?=
 =?us-ascii?Q?1mTEsvv012tq1Loish6YFT4Ze95HG/bVmq3mtyoOLETPlS1aK7tTPF1Ir2Fq?=
 =?us-ascii?Q?HKL3jWw2ZjexgZZ+fcVz5PpbYeps/AVOMl9Pth3vnEpa3u3oVPWqn+1T9pc9?=
 =?us-ascii?Q?xosUVQojggu2Rb2BYD2hA9O0x0JP3pywurxq+Q/C39DzQGthhT18PO92pp2E?=
 =?us-ascii?Q?VvcEYUg0LiH8gPHw5G7ackR+8hB+UJ1nhucrRFnVCMKRbHBn06zuR8WC+3tb?=
 =?us-ascii?Q?Svv5AvFpdS0XiMKD+iTxnSOoKGhLcc6/cPNNyUKCkV+b1d53zPwoXKe/4XRo?=
 =?us-ascii?Q?Y6Tdcb15EHZe/5tTz7dAM0apPyafa+vSwgYHf7/BXbiROADwUmcov6AUfftR?=
 =?us-ascii?Q?5UXeAqGKq8iZGGO5xE+B4SAyrMuiJHOmg75GvxqqTLbNvbVU0bQULdAFs8LN?=
 =?us-ascii?Q?Fkqq84x2JcvrwQLi6YiCoLAIRZw9nWRjDkQKnTOOsMs12VLmmJ3UIk3YSkps?=
 =?us-ascii?Q?TfFeiIjA7PQxPvp66RbTT7n8s6YVfVwKvUVbN6udvApRnK4adjcPiA9PD3pm?=
 =?us-ascii?Q?YuIt8LcRyNgigcxUE1u5bYEKDNcvr25eWHcq56rFI2aqImQ4njdBdQxq9+lj?=
 =?us-ascii?Q?46sJlyM2YnJzlXRojoOMbDOTN/dTJOjzA2F+Y+aq+myZzSJzTuunm0HfGmTg?=
 =?us-ascii?Q?LRW9AN5s1+LcWrPhsFgr/n4dX/pW2rIywXqnxvdXBJynwNLw87QHt29EWANv?=
 =?us-ascii?Q?Gr+B/AyjrkeTu1SLQl/ZdNdg0NMWC7Ep7X3e9C0h3kAy8cYqo3Bn54meKvvG?=
 =?us-ascii?Q?I214fCzpVynvVsquZmRN3ro4FRd4zuHoPaNgrc882VwoknWJZYkR/Pjwi5p5?=
 =?us-ascii?Q?nDkTMSxrSRmZK5h+6lhA2gOEjs+VhbY3faDXSEONhsJVJE5MWf/bzo0TItxp?=
 =?us-ascii?Q?LLSwOkVOig=3D=3D?=
X-Exchange-RoutingPolicyChecked: fxhbHc080yHnfhdrI9n2+svWR6SVjSF4aDJufW77k3JjeeuJzon9xfw3PIml8VNX0yiCgPzqQ5q64ET85z82aeMgHlU4wAbf/J5l+N2Ue+vZILC3RuZC4WVvBu7fAT/+P2RKOn9IFXllG076xNwvDLv4NQoXYvLayNzVQbSqW2/HIbPDqrmPIGEIPLomCvI2y6/vTpH51/5RdAAOpB2jViG3IBgcdDpwc57DcuvkRWf0zl/ZGlbN6SUyg7JvHzcEx4RbasERfVmFUfrhBogDYkXGpsz9kiQbzgi8IeZRbLt7qLalCp7/Zhws4YJ0VyDAKROPiZC64gcCepXwIsfMRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a32b70-5dac-439d-011c-08df0115ada0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:54:32.9770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75HnE31EdjG15vXXmO4zFnGbDQEfYEIDqbhHcY605R0tffV/PA/yYEh/q1lkc9Rit3osG9AKuC0DdkQqD54TRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26260251022fbc2f248a3d747a9b2b961b18d2d8
commit: 6ecd7715d64ee3bf0b55b374f731d1518b57bc81 dt-bindings: mtd: fixed-partitions: Restrict undefined properties
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2051-20260819 (https://download.01.org/0day-ci/archive/20260822/202608221014.QJMMtcl0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221014.QJMMtcl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6ecd7715d64e ("dt-bindings: mtd: fixed-partitions: Restrict undefined properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608221014.QJMMtcl0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-cs0:ranges: [[0, 18743296, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: soc (marvell,orion5x-88f5182-mbus): sa-sram: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: soc (marvell,orion5x-88f5182-mbus): controller: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
>> arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: partitions (fixed-partitions): Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-nand']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: devbus-cs0 (marvell,orion-nand): cle: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: devbus-cs0 (marvell,orion-nand): ale: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: soc (marvell,orion5x-88f5182-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: soc (marvell,orion5x-88f5182-mbus): sa-sram: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: soc (marvell,orion5x-88f5182-mbus): controller: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: partitions (fixed-partitions): Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-cs0:ranges: [[0, 18743296, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-cs1:ranges: [[0, 18677760, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: soc (marvell,orion5x-88f5182-mbus): controller: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: partitions (fixed-partitions): Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: soc (marvell,orion5x-88f5182-mbus): sa-sram: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: soc (marvell,orion5x-88f5182-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-cs1:ranges: [[0, 18677760, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: soc (marvell,orion5x-88f5182-mbus): controller: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: partitions (fixed-partitions): Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
