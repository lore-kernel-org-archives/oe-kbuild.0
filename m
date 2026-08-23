Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C852609E3
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491381; cv=fail; b=hcusRKUQnsdIA+6rEsB6fn1emhQZzreA9ULKm8rj3zjukMrYw06xdsPu4DYIilTECA4xcNNSujIhCJ5xYy/v7sl5jGbC/XlKhv9IONIGoTDGz/vLlJCKa+krUSP8i6GEbKjQy9/CZXmz5ZIhgSgxQykqmH8FgTZlJ73oTR+2UW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491381; c=relaxed/simple;
	bh=CSxIs8dycO8hXDOHu1TKvjdCwkZuaQ1YbKzt2RJlU1s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZY/mM26LOK1EgXBkPhiSFwlpxYovlKvP4pQo24ZztjBzbcLxI2cehzyAGgygiuUHebBiU/Z23ah7Pqe1E9Js2ft0dQNlBZrOCm7nXSaZJ7bWbs8j4RTZAKkJn8jEL0+Qq8Gwvms+wgsE8bFbKWZAPBJC4+Z/n9xSpwbz6gHcgWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar7btcg6; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar7btcg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491379; x=1819027379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSxIs8dycO8hXDOHu1TKvjdCwkZuaQ1YbKzt2RJlU1s=;
  b=ar7btcg6CwL7Qu06UmFGUY8n4dIHiGzsFbuKnJe8YaMJykE3KeVMW0AV
   dx3HiWQifMce+ezlBHZEn55Pb3jqjEKUGN4QaVXVM1hA7h60k11dhMog8
   1KXYYFdLNCn/TnolQdQ49s0kS9e43eNyVVW1g19DxPtnsj9qpfUlBVSEt
   qhHXA8UQhLVsNl3rDP1B8uAeU5hk+bw8U3OLkQxoHHMoS0ijnnSeXtld5
   zbbVqocf+Q24OwJDjDcuRTmkjcrY90puZykfk2sNxXTErwMxuSP/O+rRX
   iqcA+QZxVhIUNSQOT4Qk9fYhB9SiNljiKFyMZEwk60XtROc4y15+/Xlvx
   Q==;
X-CSE-ConnectionGUID: 30oGLdFsRICOjdkiyjpyEA==
X-CSE-MsgGUID: X4xCfXHHRTGZ2rpbn1PRoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87823052"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87823052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:22:58 -0700
X-CSE-ConnectionGUID: P0t0NdIBSZKb66qdpy1a6Q==
X-CSE-MsgGUID: eiNbIekdSjSOn9e0kmYe/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263509858"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:22:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:22:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:22:57 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly+QCgF8SXSdcei1iqtf4HC7g35Zim6NOROXLEfktjoMg1Yyh1e1zgR1FhrsA7kLw5Q5OfSG0+lq42QY2dfRBX7Iyh0kJohmN50cqQKVG60VaIDkxuEJECazbPAbIyQG6pdOKuH8bdGc1JplYldWd/OZ3gm/KuZ804umCB6cL5aemJMcSyEECxCetnAi5xct7Qk0v5SKz55Ems9S1b430teL1kcBoOtZdJFXvir3SXmxtVUjXSl2xXF+ap+R/mizJRJ2PO+7ovh6pkOOjZaftwzMxK5g3R/L5E0Qe/BRVjsdFIdP65H+u7G/LZRMWbbpkJcZ+gkIRHC/qSn0z8RmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIE6OWKBNlkWO+ioHZsurfSCJlnBimbInw+Wq4AXHUc=;
 b=Z5tJTRLd89VEKXHf6dx5r67jG9SEHEWphZ/fZOm4gFWe1Nk6Dk2DNqfYoJRf8wyN4lDu3rClWQh1HNR63CwaVLUXuhdVS/XjG6cJ+no3AMoHLITBqJ92Pnv9jLD2pQxOVqxIHaD9kaIEUlZhFrXDF080uyqHUoSeho4jUCreSmm6mtvGG3qAqvyfL7R76tP/+z4X79rGXkqDOZCMwrGOB/TCw1mpupctHqkWy+3cS8nvnRF6BAD1bYdEjNm1kfb/lKENuU3GuyDfybW3cbtz25NWMrcXF9ve+hdGad5I+7t2+md09SVlhQ49PY9a73sXVnMgiQMhQEJQ6bZT/9hm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 23 Aug
 2026 13:22:55 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:22:55 +0000
Date: Sun, 23 Aug 2026 21:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/fixups.c:1058 jit_subprogs() warn: mask and shift to
 zero: expr='addr >> 32'
Message-ID: <202608231153.d3tM7ui6-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0056.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::7)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f75f832-0ae4-4587-1ed5-08df0119a3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|29003799003|25016099003|56012099006|3023799007|6133799003|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: 5uEO3Hiq4NJkgYFE2n1Z2VBeI+gH8DW7F8Nw8kp0ga3xBMNx9nhg0TWAQzUa/opkCX8AudnHBJzBc1eIeclafeVzZYaMTbgJxiKYa9cMozHpdJGB7+ASCl2CNKgeYOuCJj/C0jji9RbW3XI2tk8Edno6wfKvCzkXm3MYmX5TVnHih2NwB+2dFm9VKS4kWgM5nSRUpwgGFah9TC/lkm7GpsvAyS9MlxXpbBVJau+v7ur0tS7JQU5+37q+r4Jttw3sw/RMznpcUgD5eT3MU3cUCFHEsmYvLrDmuJrnwCcKfOG9Hz1Y9XV4yGNvJARzwN7c1s3x+CGkYYqUynQeAmPSfiyv7seEwoShWmE1CsBnVL8wfiacvGaMGfezoQpX5mhzUucjR1tQqnexxojV97AsEOSOYMjFqBmKcO1DNygA/LCx8zGP4BWpi+sjzR8lXdZvnq6zX16wHQdRRk5B0q34owZT0L7BC7qqlZDCNbDmnZfkKoCjEcBvPSp4tNPGLTvS/xbmrlll5sC4ESDZabKAhD6ZSCaLb0IrmreBAy5Etvy8p/e0kGnJoMBau1pRhdrzKUV2o2lvyQuyVmwi63FbKy7GMihLL6ZmuJq7x5LAnEQtiiVt1OO0P6PRWy6lfW8wWKXUXC4/5EP1j3CS00c05vWBRiYPYebyKEqME9kiAXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(29003799003)(25016099003)(56012099006)(3023799007)(6133799003)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YsO+VE5UAVmUqwOC5GjwEG8+bRCiM0bXtGxXKtCupBpBtamKgTOxpF54pKjk?=
 =?us-ascii?Q?ZaztZMaRgcgAZ1kn3qPYlGTlqEziOESOhS6O3MskkNImflEPtlGK355EM2a1?=
 =?us-ascii?Q?NNN/DHF7bKreL+OUHCly3wDupsy5yvm5e/jWzK25EtHU9icZkNhdwiZgORUT?=
 =?us-ascii?Q?jBDaY4BfiFdeoo88/d8M4c0akeAtIsmFwTfJ1mZxSsemdVmfkVl+QQ0Vt/nc?=
 =?us-ascii?Q?fQ3I4ZZiPMCD/4fpRnnaMrFaTuLFgLDNg3Mwzux9LXBmmzBRuENAQfvq8Dz5?=
 =?us-ascii?Q?OE3/SJVkvsVsYZtTzc9bhTm5iux2kcothQ6+l5Jkwwv5VTmtuw8l+LGr5B+i?=
 =?us-ascii?Q?WYiYRmKbYEVphLGrac6thvH68mQYyqMnoM/9vfMkd5/TWCjbhIuTOHh2osev?=
 =?us-ascii?Q?1arkjS2bNJuM8zH1Nzk8Vhc5dZ9wdREYxp6FP4aYJnqLwqDCg++Ln2+oRbjG?=
 =?us-ascii?Q?IDUtMby5tPtLe4R2ZFCQTW8lChxtbzKxlmOPIJRI2ZZxAGTRTqO9ksXM3sT5?=
 =?us-ascii?Q?shCb023w6Bx8AmQ4V03XBxZgDnSsXHc4Rv0UMRAdHnD9hBgCCbBNM7W74r29?=
 =?us-ascii?Q?o9KSK4V7WhhmSJILz1gOYlnpHHba35zZQm5LKCLYy3nO3dy2fjTFto0r0i65?=
 =?us-ascii?Q?FC/gAHTaaODEBNe5tr241szsyaY4tdz0gIKi+br4pcPALhj99ABYkYZoCrmG?=
 =?us-ascii?Q?qoF/9OKtlg7vrZvFfJmYGK+7F6cb7p0T2tBwbYHJLdH/QgxEV16thUBmxTbC?=
 =?us-ascii?Q?/a4f13hwfSYeFP2uSlXCaD7UsC06rDpAF2T5ppDGUoR6lAsWZWVLvqyFzzwt?=
 =?us-ascii?Q?oVdLEvSpUO/a3MxwcPo3fbkIR2hHYM9Ih1tJZ11FSXduQolUiZUOWYbVYlMG?=
 =?us-ascii?Q?CMVoDgVxC1s3e/EvYvf+v9mnVTOeTd6SLf2aQGZ0HAOeAXzVOsmgBKUAF9Eb?=
 =?us-ascii?Q?a69hvIH7t0x/xZ3pAzBvBo7sEktlGVTV01qrk7LGyoXE36QCOMZdafQQH7RE?=
 =?us-ascii?Q?BdtmD7M8c+6pTiaLuGP9EYzxTwfBdpyx+v3gTaDwgR1PUVDsu5XWy4HXrmUQ?=
 =?us-ascii?Q?jQawcIelrHMHVd6NfoqqLetYKZcyOS6WXRQ6oAWZGFT8ApgxgOIytNVeiiHu?=
 =?us-ascii?Q?tZkEAsyhIpR+IT8xoKlan7HYRXm/g+wg0ADV5wMSilMS+GRDE/TORZ0APHkq?=
 =?us-ascii?Q?W6fATmkaw7Y9olTcibz1E9Py5L8frLjRw2c09+hQRXkb2t6XywIkHjOMVTxa?=
 =?us-ascii?Q?gb/nM/Wb94s6/sLM8CleNJs9Am3ysuXi0VGMhAZqlRaHVKUsR40iwllbWfjt?=
 =?us-ascii?Q?Id32XY9C1y2L+0Obgc6ko1RaJIH05OzBtQWDuW/n8XfRCLFihIi6fGsEr6tm?=
 =?us-ascii?Q?Fu+wDG2zqYeL9GyU8OXZ9zgktxrqmXzR+AsuAHHXRQWb2gQfsY1K1Lj+1sD+?=
 =?us-ascii?Q?N/Ujnccrhq9dxqfMBBygevCyTt7IrcuImx5J7lr1k2xXUlrbNBzO6DMF/tj1?=
 =?us-ascii?Q?dF8cCO3Pfkk1xp+/GdrvOEEP5CyYNCnGMcPZdUBprvnD8WwnoaLU49Q//JGO?=
 =?us-ascii?Q?0Kf4LWU0lhAdg97LCgzenRV/U+8YUKT5iknBy7m7wlPLVQl4TaqR4Y+tOoMT?=
 =?us-ascii?Q?L5Q7lkHDE/4nu/7mnPWwMPtbF1zCbOHDVhrQhBDHcWiY/jr8ig9Qb19XsRBe?=
 =?us-ascii?Q?vemUmH5Y0fVmSWKpnOok8jpbTKmZIxmQn3vSJTXGSIcD3Qq+TnnkIARkd26I?=
 =?us-ascii?Q?oF/bYgPpbQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: KvFlkJm7WANu8xraXUw12l+3hmutu3s1tFvF7KPs1zMAER1yVyyTWfQ3dxQNV6vb/+3YjAEb8HvmlQaboHDvZowg4jczE10Fd55C0mOEJPjk7a/lAx26VoKrlNR2KKxn9engw9BR3xh7o0mi/mPCn+XaPnFdOCPkl3zJBXD2EnVUXB9QOOGABalhuqa5dsE3KwpkvxQCbCjV1WL/DmwzvmfbpEpWf4evMrZScNKC52o8936MDIgg01Tndwa9gXLRms+lk5KKa0tCT94+ywJ3EirME6Q1e2tR4+TXIiERy0KBZvH+OBbCMiCLwqp7/hHLJ4WreGYKhrHknqrmdA6p3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f75f832-0ae4-4587-1ed5-08df0119a3fc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:22:54.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0s8PV4nXl4Yc+H8SeZv4qH/YhELGsouq9walg0TxkWN+/aLJuJsKpqwfX3V6WAkI+9ZXqN06xJ07SXFuIrYrVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xu Kuohai <xukuohai@huawei.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Anton Protopopov <a.s.protopopov@gmail.com>
CC: Hari Bathini <hbathini@linux.ibm.com>
CC: Pu Lehui <pulehui@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26260251022fbc2f248a3d747a9b2b961b18d2d8
commit: d3e945223e0158c85dbde23de4f89493a2a817f6 bpf: Move constants blinding out of arch-specific JITs
date:   4 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r073-20260822 (https://download.01.org/0day-ci/archive/20260823/202608231153.d3tM7ui6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d3e945223e01 ("bpf: Move constants blinding out of arch-specific JITs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608231153.d3tM7ui6-lkp@intel.com/

smatch warnings:
kernel/bpf/fixups.c:1058 jit_subprogs() warn: mask and shift to zero: expr='addr >> 32'

vim +1058 kernel/bpf/fixups.c

d3e945223e0158 Xu Kuohai          2026-04-16  1015  
d3e945223e0158 Xu Kuohai          2026-04-16  1016  static int jit_subprogs(struct bpf_verifier_env *env)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1017  {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1018  	struct bpf_prog *prog = env->prog, **func, *tmp;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1019  	int i, j, subprog_start, subprog_end = 0, len, subprog;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1020  	struct bpf_map *map_ptr;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1021  	struct bpf_insn *insn;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1022  	void *old_bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1023  	int err, num_exentries;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1024  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1025  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1026  		if (!bpf_pseudo_func(insn) && !bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1027  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1028  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1029  		/* Upon error here we cannot fall back to interpreter but
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1030  		 * need a hard reject of the program. Thus -EFAULT is
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1031  		 * propagated in any case.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1032  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1033  		subprog = bpf_find_subprog(env, i + insn->imm + 1);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1034  		if (verifier_bug_if(subprog < 0, env, "No program to jit at insn %d",
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1035  				    i + insn->imm + 1))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1036  			return -EFAULT;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1037  		/* temporarily remember subprog id inside insn instead of
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1038  		 * aux_data, since next loop will split up all insns into funcs
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1039  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1040  		insn->off = subprog;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1041  		/* remember original imm in case JIT fails and fallback
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1042  		 * to interpreter will be needed
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1043  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1044  		env->insn_aux_data[i].call_imm = insn->imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1045  		/* point imm to __bpf_call_base+1 from JITs point of view */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1046  		insn->imm = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1047  		if (bpf_pseudo_func(insn)) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1048  #if defined(MODULES_VADDR)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1049  			u64 addr = MODULES_VADDR;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1050  #else
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1051  			u64 addr = VMALLOC_START;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1052  #endif
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1053  			/* jit (e.g. x86_64) may emit fewer instructions
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1054  			 * if it learns a u32 imm is the same as a u64 imm.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1055  			 * Set close enough to possible prog address.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1056  			 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1057  			insn[0].imm = (u32)addr;
449f08fa59dda5 Alexei Starovoitov 2026-04-12 @1058  			insn[1].imm = addr >> 32;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1059  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1060  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1061  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1062  	err = bpf_prog_alloc_jited_linfo(prog);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1063  	if (err)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1064  		goto out_undo_insn;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1065  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1066  	err = -ENOMEM;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1067  	func = kzalloc_objs(prog, env->subprog_cnt);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1068  	if (!func)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1069  		goto out_undo_insn;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1070  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1071  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1072  		subprog_start = subprog_end;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1073  		subprog_end = env->subprog_info[i + 1].start;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1074  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1075  		len = subprog_end - subprog_start;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1076  		/* bpf_prog_run() doesn't call subprogs directly,
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1077  		 * hence main prog stats include the runtime of subprogs.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1078  		 * subprogs don't have IDs and not reachable via prog_get_next_id
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1079  		 * func[i]->stats will never be accessed and stays NULL
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1080  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1081  		func[i] = bpf_prog_alloc_no_stats(bpf_prog_size(len), GFP_USER);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1082  		if (!func[i])
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1083  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1084  		memcpy(func[i]->insnsi, &prog->insnsi[subprog_start],
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1085  		       len * sizeof(struct bpf_insn));
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1086  		func[i]->type = prog->type;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1087  		func[i]->len = len;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1088  		if (bpf_prog_calc_tag(func[i]))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1089  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1090  		func[i]->is_func = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1091  		func[i]->sleepable = prog->sleepable;
d3e945223e0158 Xu Kuohai          2026-04-16  1092  		func[i]->blinded = prog->blinded;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1093  		func[i]->aux->func_idx = i;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1094  		/* Below members will be freed only at prog->aux */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1095  		func[i]->aux->btf = prog->aux->btf;
d3e945223e0158 Xu Kuohai          2026-04-16  1096  		func[i]->aux->subprog_start = subprog_start;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1097  		func[i]->aux->func_info = prog->aux->func_info;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1098  		func[i]->aux->func_info_cnt = prog->aux->func_info_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1099  		func[i]->aux->poke_tab = prog->aux->poke_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1100  		func[i]->aux->size_poke_tab = prog->aux->size_poke_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1101  		func[i]->aux->main_prog_aux = prog->aux;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1102  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1103  		for (j = 0; j < prog->aux->size_poke_tab; j++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1104  			struct bpf_jit_poke_descriptor *poke;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1105  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1106  			poke = &prog->aux->poke_tab[j];
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1107  			if (poke->insn_idx < subprog_end &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1108  			    poke->insn_idx >= subprog_start)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1109  				poke->aux = func[i]->aux;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1110  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1111  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1112  		func[i]->aux->name[0] = 'F';
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1113  		func[i]->aux->stack_depth = env->subprog_info[i].stack_depth;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1114  		if (env->subprog_info[i].priv_stack_mode == PRIV_STACK_ADAPTIVE)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1115  			func[i]->aux->jits_use_priv_stack = true;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1116  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1117  		func[i]->jit_requested = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1118  		func[i]->blinding_requested = prog->blinding_requested;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1119  		func[i]->aux->kfunc_tab = prog->aux->kfunc_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1120  		func[i]->aux->kfunc_btf_tab = prog->aux->kfunc_btf_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1121  		func[i]->aux->linfo = prog->aux->linfo;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1122  		func[i]->aux->nr_linfo = prog->aux->nr_linfo;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1123  		func[i]->aux->jited_linfo = prog->aux->jited_linfo;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1124  		func[i]->aux->linfo_idx = env->subprog_info[i].linfo_idx;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1125  		func[i]->aux->arena = prog->aux->arena;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1126  		func[i]->aux->used_maps = env->used_maps;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1127  		func[i]->aux->used_map_cnt = env->used_map_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1128  		num_exentries = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1129  		insn = func[i]->insnsi;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1130  		for (j = 0; j < func[i]->len; j++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1131  			if (BPF_CLASS(insn->code) == BPF_LDX &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1132  			    (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1133  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1134  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32SX ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1135  			     BPF_MODE(insn->code) == BPF_PROBE_MEMSX))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1136  				num_exentries++;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1137  			if ((BPF_CLASS(insn->code) == BPF_STX ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1138  			     BPF_CLASS(insn->code) == BPF_ST) &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1139  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1140  				num_exentries++;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1141  			if (BPF_CLASS(insn->code) == BPF_STX &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1142  			     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1143  				num_exentries++;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1144  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1145  		func[i]->aux->num_exentries = num_exentries;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1146  		func[i]->aux->tail_call_reachable = env->subprog_info[i].tail_call_reachable;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1147  		func[i]->aux->exception_cb = env->subprog_info[i].is_exception_cb;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1148  		func[i]->aux->changes_pkt_data = env->subprog_info[i].changes_pkt_data;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1149  		func[i]->aux->might_sleep = env->subprog_info[i].might_sleep;
0251e40c482992 Eduard Zingerman   2026-04-15  1150  		func[i]->aux->token = prog->aux->token;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1151  		if (!i)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1152  			func[i]->aux->exception_boundary = env->seen_exception;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1153  		func[i] = bpf_int_jit_compile(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1154  		if (!func[i]->jited) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1155  			err = -ENOTSUPP;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1156  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1157  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1158  		cond_resched();
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1159  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1160  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1161  	/* at this point all bpf functions were successfully JITed
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1162  	 * now populate all bpf_calls with correct addresses and
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1163  	 * run last pass of JIT
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1164  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1165  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1166  		insn = func[i]->insnsi;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1167  		for (j = 0; j < func[i]->len; j++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1168  			if (bpf_pseudo_func(insn)) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1169  				subprog = insn->off;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1170  				insn[0].imm = (u32)(long)func[subprog]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1171  				insn[1].imm = ((u64)(long)func[subprog]->bpf_func) >> 32;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1172  				continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1173  			}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1174  			if (!bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1175  				continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1176  			subprog = insn->off;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1177  			insn->imm = BPF_CALL_IMM(func[subprog]->bpf_func);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1178  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1179  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1180  		/* we use the aux data to keep a list of the start addresses
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1181  		 * of the JITed images for each function in the program
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1182  		 *
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1183  		 * for some architectures, such as powerpc64, the imm field
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1184  		 * might not be large enough to hold the offset of the start
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1185  		 * address of the callee's JITed image from __bpf_call_base
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1186  		 *
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1187  		 * in such cases, we can lookup the start address of a callee
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1188  		 * by using its subprog id, available from the off field of
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1189  		 * the call instruction, as an index for this list
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1190  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1191  		func[i]->aux->func = func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1192  		func[i]->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1193  		func[i]->aux->real_func_cnt = env->subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1194  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1195  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1196  		old_bpf_func = func[i]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1197  		tmp = bpf_int_jit_compile(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1198  		if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1199  			verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1200  			err = -ENOTSUPP;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1201  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1202  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1203  		cond_resched();
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1204  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1205  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1206  	/*
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1207  	 * Cleanup func[i]->aux fields which aren't required
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1208  	 * or can become invalid in future
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1209  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1210  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1211  		func[i]->aux->used_maps = NULL;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1212  		func[i]->aux->used_map_cnt = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1213  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1214  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1215  	/* finally lock prog and jit images for all functions and
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1216  	 * populate kallsysm. Begin at the first subprogram, since
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1217  	 * bpf_prog_load will add the kallsyms for the main program.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1218  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1219  	for (i = 1; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1220  		err = bpf_prog_lock_ro(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1221  		if (err)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1222  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1223  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1224  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1225  	for (i = 1; i < env->subprog_cnt; i++)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1226  		bpf_prog_kallsyms_add(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1227  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1228  	/* Last step: make now unused interpreter insns from main
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1229  	 * prog consistent for later dump requests, so they can
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1230  	 * later look the same as if they were interpreted only.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1231  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1232  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1233  		if (bpf_pseudo_func(insn)) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1234  			insn[0].imm = env->insn_aux_data[i].call_imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1235  			insn[1].imm = insn->off;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1236  			insn->off = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1237  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1238  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1239  		if (!bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1240  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1241  		insn->off = env->insn_aux_data[i].call_imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1242  		subprog = bpf_find_subprog(env, i + insn->off + 1);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1243  		insn->imm = subprog;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1244  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1245  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1246  	prog->jited = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1247  	prog->bpf_func = func[0]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1248  	prog->jited_len = func[0]->jited_len;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1249  	prog->aux->extable = func[0]->aux->extable;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1250  	prog->aux->num_exentries = func[0]->aux->num_exentries;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1251  	prog->aux->func = func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1252  	prog->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1253  	prog->aux->real_func_cnt = env->subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1254  	prog->aux->bpf_exception_cb = (void *)func[env->exception_callback_subprog]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1255  	prog->aux->exception_boundary = func[0]->aux->exception_boundary;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1256  	bpf_prog_jit_attempt_done(prog);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1257  	return 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1258  out_free:
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1259  	/* We failed JIT'ing, so at this point we need to unregister poke
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1260  	 * descriptors from subprogs, so that kernel is not attempting to
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1261  	 * patch it anymore as we're freeing the subprog JIT memory.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1262  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1263  	for (i = 0; i < prog->aux->size_poke_tab; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1264  		map_ptr = prog->aux->poke_tab[i].tail_call.map;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1265  		map_ptr->ops->map_poke_untrack(map_ptr, prog->aux);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1266  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1267  	/* At this point we're guaranteed that poke descriptors are not
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1268  	 * live anymore. We can just unlink its descriptor table as it's
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1269  	 * released with the main prog.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1270  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1271  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1272  		if (!func[i])
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1273  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1274  		func[i]->aux->poke_tab = NULL;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1275  		bpf_jit_free(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1276  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1277  	kfree(func);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1278  out_undo_insn:
d3e945223e0158 Xu Kuohai          2026-04-16  1279  	bpf_prog_jit_attempt_done(prog);
d3e945223e0158 Xu Kuohai          2026-04-16  1280  	return err;
d3e945223e0158 Xu Kuohai          2026-04-16  1281  }
d3e945223e0158 Xu Kuohai          2026-04-16  1282  

:::::: The code at line 1058 was first introduced by commit
:::::: 449f08fa59dda5da40317b6976604b877c4ecd63 bpf: Move fixup/post-processing logic from verifier.c into fixups.c

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
