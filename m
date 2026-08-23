Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90FF3D3324
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487509; cv=fail; b=kp+htW6mWMw4VxnhQ3KCnQVcua9b5cFbxL52tXxXQF/wN105h9LdLVuNARDV0KAGxZ5rQeDejAb4XUTtpCmDF8pt0JAnLHvq30esJCYpliv41BdC0gikT9/WbhNiibfij3C8wZl+W2AIrcgss1+ITKhJyaxTzceb+JrENLU8m/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487509; c=relaxed/simple;
	bh=MwGM/R8BJ/SyAohTjK4mpsmDGtzZM2Yt/fqUH/iOdPE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TKCrtuXHt/ua37hMwIibIyEypNjmL5OPgg1nrMyPOkdG+5ah0RhZzZRZPSjmILGrd3sKwQEmh6VCM21v7kHFFeITzaBRHSrbudSUqrHnsKQ49PIDPB7BHQqcPrE0M1FNWLiw4jerBzcg1OnALxRXZt8SCjfgUvs+Q6NGIO+nH3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nv8sZQFq; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nv8sZQFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487507; x=1819023507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MwGM/R8BJ/SyAohTjK4mpsmDGtzZM2Yt/fqUH/iOdPE=;
  b=nv8sZQFqOiHtv4LHUHUOIUvFk4p4LZ/sa2wpP2P1PSTu+JE1R5xGnb8J
   yvwh5dzhjC7vtojGZgtrGZgzrDA5qGSXfrQHyaNn6HxXVgQa20qQSUryR
   jINwmT8G4Y0vd6YsoPYTnbRY3IufBERlDZ3FDdMQDAnklK0VLOHYtK8Gh
   4r5gNb4uXpG8MUhO5pECSzKL57T0jkq9VBktVu5mzVB+/jjK4lVaMcqB1
   SDFeNbz+cqFQKHX7DOX3GJwXGxn4OD7dso7rholMHgiTL/jZTjK5UpQuO
   GUuOghAvgMoEz2N4FW6cR4wtk5IgMOuemCby1sqGMM4a79YB6Zfl54Q4V
   A==;
X-CSE-ConnectionGUID: h0En/npWRfCKPXbg7A/5jQ==
X-CSE-MsgGUID: VsD5MO6KRE2WbUh3Twqv+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88089196"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88089196"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:18:27 -0700
X-CSE-ConnectionGUID: eMRjVLvvQJW3iZ2Jz604Jg==
X-CSE-MsgGUID: YTdp/TxqRxOPGJiKR6KLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260603663"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:18:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:18:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:18:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABZR1EyJetLZ4iilzYKDf9MvkZ75HyMZd5P/YA82SFZVGQgYB83MPQdrACJWstnLjMNiNKf1L5NgvSo00Qe6ueHT0uPM/7jx2JQH988yrNhv1ZE7/8rgoGCrgsgYNblrpSqNQ75r4xA27SM4XAGutawhDoIUffHPkHZF7FKsvvB9qZ/xzuEL3/3dF3r5CHIMxjOvCVMpfwRcDGjDQKmgP2hmTWcqT3AK/Lq/oV9XwJKfHsUXM1WK4zRsWmXXFZyninEUMxqxv3WaCN3yjLHDTxLKw8GGEeHm1paAlDyzo4B2kdgsSjltarsWeMEeTgLmJtXizp6KDbN7Jxi4WwRHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSnNg2fa+U/oKYeqM63NfVG8DqSibL3JkUAwsMdCBt8=;
 b=MP4KIRJCrecyQfGoiZVTu9HCDIrsp3uCz6uOy5+ios6/bk4Xjm9vfJ8viJ6fERlhWLE9qN7sJ1WtHC/wsGObj88sezptA92cuc6GTZ0Hkv1DGDKQ4LhtWfAiAUG8cJeRB4P0txPqBlGZgJnJE1DXayoKsjkjkOI9KnM6t0ElO14jSQ5sW9sPJt3C/R6+izeVj1JCisF4YOuWUb3VNkOv4duvu8Cz61utl0c94FBnd8p2hVeAB9ezVGtc9ScLoTeaswMhFyGuNSEkyzLwMsOmMpN1Rk6u9nKzgpqw2jLLctwx8P84S1ox5o+nPu31r/ePwflZEB/T/BGb8zSsmAh8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:18:23 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:18:23 +0000
Date: Sun, 23 Aug 2026 20:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: [cilium:bpf-keyring-wip 6/11] ld.lld: error:
 vmlinux.a(arch/sparc/mm/ultra.o):(.kprobes.text+0x84): unknown relocation
 (40) against symbol __flush_icache_page
Message-ID: <202608230402.ZTgVeqDk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:d10:30::16) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1cc131-d709-4a85-3bbe-08df0110a06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: Dg7AlwWr1oGOl0uUzUN7X5I2UNOC6kSyCo1UGNaeR9izAev/V5xdEd6vIUdSgNbuQhcghwsmmu44XYJ4dcDHA8atUevL6v7EsAK0REGEXoaqEMxI03sXo01MT86dXduPcOw49bFibCYpIAsgomzcjntitRzhkx7CFD94xdR5HV9EZAkBQuC6xHwf6GOJ5ev9Ny38Bk+cGyC3MJRNY4Sek1UcxRdpj7PJTQB4Up81VCSiTT/Tz7Avzo2uDD51+hJgUoHBqZiwnbtXPPbUSsetTeTNOtacThxeG6Cex+5WdvcVxOistpPjfWUQS4Ktg4dDlFljjfemF62AIWDpCY/+L6f4udFEnCPGfB2Plon2kySDEHAFz2nBDCoAwRrqc68psvSKeagGqbobtRwsohR+aB+xx1UmL/AAjuLR09iS8sIngM9Le+ymO/R5xJcoNDTmWX6pPLK53MbVAFJCnLeoKl+ddie2K5ua51uyj4lbtejnv0I7VCAV9wyYXVy9yUVeTPOfclcTw/M9Tkxw1znPieoOimNryLQi9SL8Aa4YayFWogayCtIAsQsCz5LIkIjeb1xo+NaHIP2psD+Oz7JUUbQCfdXZIDh0WGvtDBQRdYGeuEBv3A1AYn6FadDHBAq/ASJ38rtSQrt1YYM9FFaY4SZKBDnBpFxCQRCOePB8O1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJFNCX3kluUtEVoWe5cYq7wcb+9dyuSIZF2GpIhKLIUVED1vd83Abdvbq0G8?=
 =?us-ascii?Q?PMGHC6cYNxqva/ulLOuq+NpEyTQkL0jYMc+RV4GqtluAsUgNc1QBMMts5UAq?=
 =?us-ascii?Q?KHcYBaYajJFojUTPvNCppoYFB7uf179dpZQjsS6GSlBfegmdWyXabok7pmSd?=
 =?us-ascii?Q?Qjlmk2Zay6fBzpKrsRE42ushkiOXucGGt0WHi7nKJJYpupF8GO/OI7qMWxDR?=
 =?us-ascii?Q?BNptoJoIChqBnP6CIwbc3+QKTZr/rVZLiQBf40690gHE9yT3CS1r0tqvMPFp?=
 =?us-ascii?Q?HHb0YXUiwKXeOpdqBdxUtpc6MLwywvcDSswnx0atyYnX8Zf0MDHpHfu/xAsT?=
 =?us-ascii?Q?Gfe1PBMx+R3maA9CMRv+UeZ5kXDIngbm1a492duNQ9rOYrg83HaiXQEDaL9k?=
 =?us-ascii?Q?+WfRNny9CSjHcnAJNQDSp0v0kH3YWplsMxPGxL/qwMKSeasvaYvFEndNPXnk?=
 =?us-ascii?Q?sZGM+lWFDRn03PobQ22H6bqOTHUlcn1LW0Db02K8CyyrVqKYqymHuFVUoyoL?=
 =?us-ascii?Q?ziig1uqDK+BrP093wws+iRR+KTmu5jJGlcRCUUauZf0qKFVNSYrMiEM0T9Os?=
 =?us-ascii?Q?1bLKzUJ6QxyssCc+Fm2wTQjKKHyw0VDLBPqlP4Z46F6+rLS7Pwik0Rou1jDT?=
 =?us-ascii?Q?1dizbBJhKGzM5+fTEz54obU60bZP3S1KEna9sbe9GN545DKcKoopxs25VE3C?=
 =?us-ascii?Q?ksbbf+NeobAbaiGdnaBX+MpnJiYrwa90/WXH7qDau/yd8S8NeyjsiU06zoYn?=
 =?us-ascii?Q?cLIbarh3oUiTnW32r5FNrxVW5ExKkEai7QMZLsP2/cDx0cgDI9z7zYKhnU15?=
 =?us-ascii?Q?oX29Png1ZK7pE3GEe+naptsMNP2Vdwzuv6kp5KUAksv3g1Rce6aHjX3ZPSTP?=
 =?us-ascii?Q?pj+BTncpyWHmgr9W616tA571DZnLlQTyz7Kc3WG0o1YGvRGXMJR9rRlF+a3Q?=
 =?us-ascii?Q?n6LamzxvGnOeVgzwQe40gP6IdOm2boVK1gp4vJBuoIeBUB14YncpV7pcukkM?=
 =?us-ascii?Q?+sP3r03LeB80imKdk/YsGhrcVe6wb3AJOhqWznAoStxppBj0FC46lUJIECBS?=
 =?us-ascii?Q?LCP2h36NWj6AJK8AYVpa1I3CY/JBn6gHe5VVZK4zW+tQX/O5S6DKGxuazOuf?=
 =?us-ascii?Q?UXs4Zd/XRitOx7L44j+xolGvLSPyUzyXjGg99NWjHKKNqrFS8U7xMwsKwLqL?=
 =?us-ascii?Q?cWfIf0m3XpwSJ/L31XT9/dCb+0v+vXfAewJMFSDA+2Iz795ggneZbaEHNHNX?=
 =?us-ascii?Q?Ecbs7CnNDCsAP1s2Ge9A8HZ0O+4KJmFFGUg/fzGA+xraeG0EamQaVIsExELJ?=
 =?us-ascii?Q?9dpIoP3M+1oHVc1TI579hbxUjzoPVyCLTXwCyTlmmKbx1z4Vv5GVDCPmb/is?=
 =?us-ascii?Q?iZWCMkiC3gUsT5o7yXw86iaP1fPU2QDQIyiIfkiwnk1U3tB3vYc33ypzw0QO?=
 =?us-ascii?Q?CBnL1AKEgZ/XRA/AWKm4KbZpwCnEy1+Ki0hkfVpHAZpmM+YPcQYbDOhCW6tU?=
 =?us-ascii?Q?qM5fSh2/ij8PZ5rC58+Zbi8VHu3V0bm5CcU5vpBiwLBco8sAHh5JzRTrtp7A?=
 =?us-ascii?Q?ctCuApC3kSgaAwYnKUN5c2aydDj9hK9JCZaw6TZU/ycjIfEookXps5zFL1K3?=
 =?us-ascii?Q?K1z9ewY/I1gxjNZt+vsFBZUTDzIOnKcY3B2c43AIfy0NWGWBK/u88CIWVS+n?=
 =?us-ascii?Q?PwDrMt8iAeZPCWgkGt/8dhx76RMI+29WLGB1pUMr+aN4KRPUynMTzvM5QYQ9?=
 =?us-ascii?Q?8EYKorhVMg=3D=3D?=
X-Exchange-RoutingPolicyChecked: nk2slzzYWsjVXn/M9rYbHBq38BnkSlvA+9Za125G9wgKt8ZrxtxnEfISuBZfF4oS7Qa/PGn25yx+FmCRj8ZmgNfmXhCZEceiTlOIj45NrNorC3obWLYipCs/icQ3WfjLQboGzScGD9MYv3wS+9sCDHLckpICEUqBzVvi2zYE0IP3XJBkEI7pX3VJ1S5XKSihHEHGAyMaorzmTwk5KA1yHeQ+hdefYfoBuqgPsv2BLE25PLooAWaMdqMZINCkIcVfB8UCkM+5XJ8S5JYotkZnenHfm5pyIvKqgocPblvQUlF4aOwSoLSnIcpVakbWj2TxuubWw0AVTrTvFTTnVYQZZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1cc131-d709-4a85-3bbe-08df0110a06a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:18:23.4980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YKfBaIw5Gg9xAuBmZDhg+Sj2G/HneJUQumtopPHbmMrGKsMXAdQjxsu6U6Oz3eKt7RGzYfNy/01gSPVOC+VzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Daniel Borkmann <daniel@iogearbox.net>
TO: Daniel Borkmann <daniel@iogearbox.net>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://github.com/cilium/linux.git bpf-keyring-wip
head:   c3a7c75fd39b016fbd75c9b2043d843ed14fbfd9
commit: 83733c89959d62b34751803b63de558429f99ec5 [6/11] selftests/bpf: Rebuild signed lskels when signing key changes
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: sparc64-randconfig-001-20260823 (https://download.01.org/0day-ci/archive/20260823/202608230402.ZTgVeqDk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230402.ZTgVeqDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230402.ZTgVeqDk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0x74): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xa8): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xbc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xe4): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xf4): unknown relocation (41) against symbol rtrap
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.kprobes.text+0x84): unknown relocation (40) against symbol __flush_icache_page
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xccc): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xcd4): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xcdc): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xe04): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xe14): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xf04): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xf14): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xf34): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xf5c): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xf70): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xf90): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfbc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfcc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(function do_fpdis: .text+0xffc): unknown relocation (41) against symbol etrap
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
