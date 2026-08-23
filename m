Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63262D6E5A
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488354; cv=fail; b=ce3TxXEjNlLsAoSTNldem19tdEnF/hReV5jb3O92zlQMmgamWHIL7Qno5YJAPi+oz2XBBuIadaOerv/2hKfLJokYWlGIkBpNMpevdk+Lqz2Ud9GOSHA6HFZURmGG+g53aYtMjyryFCBm23iM/ptPiILXzis9j8Kv1WEdQe8/dD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488354; c=relaxed/simple;
	bh=uF5EKOC3KED00NTsBrA1cl/Jtv0BJFwHhCdOyfzxDOI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CYc4fRORYH5zyFejo44YORNuM73xAvRDxs+ZopB0E0v8ksLx/7IPulffynXFU65dtJgtCOWomFsI1urria0Ucv+ocZJ9Gl1thwwF4yr1F5bcJs/iKDl143oknFnPxw12pnCgFLZF2I2JZnucSxoqlVC2LPa8x0p5cKBL7ehJeFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6NAylwe; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6NAylwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488353; x=1819024353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uF5EKOC3KED00NTsBrA1cl/Jtv0BJFwHhCdOyfzxDOI=;
  b=M6NAylweje69voA38T95yLRzXEHLR43fvClmq1ihGnEZRyLLSUBOzD7V
   0oJh9kEsG8+Dgm5ACzAMjB+P+BvlN5nDccg6MjFLmWcS2JzeAU80rwSkW
   BE4Eusq8bdaOBiQ4I+VxWCLxicEykoXnxEcFtFEiGBU6BaePkri4RFDYo
   cBXGgaJhrbHpwUY6ExRQrn+h9qIPZWQssg+LJ0ifxjvcwRfF1hm9j1A4B
   b6yMAdvKFKXyd3VwYzotN5dnr9jAhVE1FDyheoEW3Qgid5inqNziVo9D6
   ZRPPaLCNoBBPXOBXp/QuOr0P8na5WU2ncgGOIKCoy2R3LCsrFI+1H9K3+
   w==;
X-CSE-ConnectionGUID: vC7z8I9zQKiamfLVzv8prg==
X-CSE-MsgGUID: 1mpuFF1jRA+jGY0K352UJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87830794"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87830794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:32:32 -0700
X-CSE-ConnectionGUID: XyUJEFg6QQ+wFd6cpWMY1A==
X-CSE-MsgGUID: EAV4HxqnQm6zhJM32J2boQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="270573567"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:32:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:32:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:32:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfArSY5xsz+dmmQnQTx6TO6N4iBke+Sua3Zd+vjuDvl90kTPreOxdlD+Y5cOP+VejouXQhwzmTZjEGEHPSRea8CAuRpZ62AAbYDlEfF7XZA/RtC1Q0XWtXzqGkBiJBAInOGe1pzPqcWoHO2CN0/Ga/x9Bs6EooIBcZ6OIBtBlpJgHvhmA5JmjU5uwq7cEM2h6r6u92IBu+AKxZfgMA+e4RDL4Kapcd34u1QPohgDy0s78cwW4NlQxHLoiM1TMultB6enwY3ecvZMjj3F6cihwhMEo20dke4+D1Dlsz+6Ydgwe+dyUwpmrXs2n7OTr0NfRBkf8WlXvjCgHSan2OwDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAbAeAYfPcPJw0gLih0TwDirpG2ovrH181kfW3jkD5g=;
 b=chPk43nzbye99aHnGpvqkhMvwJq9R2D8g9tUOyf4jPS88eHj8hHhws9zKNzZ4GEL01fXOjaeZG2IYQmjBx+KBOmLo92NXyPFPQy1hrAKuuSFnlTV86sxED2lqylFBmtRnRWaqx3AjnpDX6onkzABRKpyzf5Dhg36abtNC93BOA9ZRwaUL4mNPDI8kNvyTD4pzuyaor+bmJrE0kdVeydGQmFRH47xrqbnvxnW8BMJdyX3Zt8+V3NCvItylznSHQSKThIReL0p+6U02kXvA9eUvCVr13IhSWfjD4Qu5Raau/X0R8xZM+b+4bt6kOXX/HbLuizcoK4FXKe5CMYG+dqa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:32:28 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:32:28 +0000
Date: Sun, 23 Aug 2026 20:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 226/226]
 drivers/dma-buf/heaps/page_pool.c:116 dmabuf_page_pool_create() warn: use
 'gfp_mask' here instead of GFP_KERNEL?
Message-ID: <202608221811.Dujad3y9-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:820:c::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fd9089-d480-4bb5-f941-08df011297e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: qJMAJK7DtPqED6XJw8yEO7TYDwXrctmD2s+H6VxZNTFLm/fLHoqbS7p/1pjztDnvyR4w+oVT8dDRglWaVRi/w569YpJDSYHBlB1++bMRgSskP2PH3OHroD5H/1sx+uXNkao0nTer5+91jr9rg+dWqeClj3NHlLBsx1WHal6kQL0cah4GgGUGxUOnj626Ebb5WZP/vAZvoKqiWz3ySlVc3DnqJI8/ODU2ONlo8j30laiMDMPbkv76b659kybv/jYAhFZtF8xDHh2c9l++ulMgmf6vLXKhgYiuAiv4iPYCtI7AM8RZq/F2hrDVX8vd4DXmHMhHGMLjvSs8SNozuNZcYzf02LinmpHbyWU/DJUn7LDchlcPbgkONmbnouaxN8lNDeJp5gTPYs3VHSvDVouFKT0zCm+WOodvcvkXEq7SjBaB+SOBHFuo4qC44b18+L1HozHbjJ7DRnWP5sC7X9b0hj4TaCx49upL5nMmFoOhQH52TUBrYOzN4Bi4IOzi8vAYWu+uM5Fo8Iji2eM5ssOpi6ZMIiPJyRcUrePvWPt/hgEujiquR0V7jMIOPMoFExd2GlS8YSdbA99QlERrdICD78V4i+hzkjJLEI/zuADnJO5Mbzm716Vnmv1Pp2TqQ2/+yXTcvEx8xhQJjwA+w1TU0PP2IJ5gipoxb8W9GQ2iHsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HlGqq+jnSAemQcxsMsbaGC5NZ9eOgAbPlKsKyM8AKZh1XcZf2MF3l/++EyoP?=
 =?us-ascii?Q?7i7qyzwJy4XHhvrJl+sp4KEznTG6Q7zDcAkycudWEhZF8q6XYOaN6T1/QlN0?=
 =?us-ascii?Q?qu0pqmZGIIyhgKjoKXJH6TKUf9HH8cmdh6NcrtRkL+ZSGDDSSG9pXOf97zuj?=
 =?us-ascii?Q?zNdwHvPy5+zVitdCqs+ld/mUEWLwwCpWmWj8LRjeCcLNLeFMfnUHjeVkxhkZ?=
 =?us-ascii?Q?V0NP0kTTnE3giX+smZxr/Cx4vIwvuaXsxZPWtaHAF/jTjVgZvb0SgiOjoiQY?=
 =?us-ascii?Q?XefV7rclNMpD0vifWt8BT4IdKsOMiWuRCzNR3gnw0f0pm8y+E2efeyXD4tAN?=
 =?us-ascii?Q?ydwtiT4gAgQYWYGMQQFopvLpz7jZUZ0HGQOnOE9wdkP6TDk3qBdmPgMhHEn9?=
 =?us-ascii?Q?FCrXPQmicup+gDohX20VXPwmi72lIgltN/aUX4/+jzMoFvk8ky83M1dSRQEO?=
 =?us-ascii?Q?8RhP+Xk/ajfTHGomOpCptWgxF6F3jLwy937G+eyULl6bfPQeW7w0iqK5+ZQF?=
 =?us-ascii?Q?yZiPbEuZadvT74FwBA2r1UWTGSxF37z5eIJylqOi+u4pU5E/0zgJRKvUIBEA?=
 =?us-ascii?Q?1R7InXoUCD4Ubwgv90HzsHDd0JuZzuByevcu3i2z0yOcJvk3yu8a9RX4bbQN?=
 =?us-ascii?Q?nPvQqmKaz5e4xAC1i2ZPKjyPi/uy9EDdP4Tmz1L6YX3lEu2fouARG+cX0bc2?=
 =?us-ascii?Q?fZS8NytjxJz9Mv/rW2utA+j++Q0sVjVAzGMavL0KSc+QHscQtSrPgzUETvaX?=
 =?us-ascii?Q?pw7KNEqPrETRqihsvJMFL1qqOAfTUtQOlS6fu4NdTjz9bcHlOXYyAo9c2LUw?=
 =?us-ascii?Q?hXBwW/Q8VH7z3ML56ICjkYkv/7mmeThRRph99vrfubU++WNf9UE7QwP4KxX+?=
 =?us-ascii?Q?AInpCYeHVEnMZeUXsEWnXMOmWQncNMKtoBkwuvrQuaxsyWl697kbOyT8UrpQ?=
 =?us-ascii?Q?dUYMtQDfr1IulmmSCyUvDifJu58lFw1UpPACjRLeGA+uUJUz7lfJst+ZeL0S?=
 =?us-ascii?Q?ZoNEFA9DzfaOaBY5hWG2J0r8iDJbPHpkNyy+WfDt0RmktOCrRZe9jt+50GRf?=
 =?us-ascii?Q?5nJX35+mrG05uJNtchsFvqvkU6p3ZBHQHDrz7z8LHziu8VK+RoXHTfXg3FA6?=
 =?us-ascii?Q?RORKfUyhY2/5hG1Ge0J8yr832hjifSPtv1DaMYQ+wreOz3VnBz7NcLAwknt+?=
 =?us-ascii?Q?SBrcbmLoVDfiIuF60j4UYQLdXVdKfb2T3Rt1SQMyd0knWslUXEf+a6uskyZo?=
 =?us-ascii?Q?aAllZDKWal47fRGd30xwnvo75vBRXaiFCHTEZ1dzXSataV6qh5H0omhZz+MT?=
 =?us-ascii?Q?VQKplycYj0pB3IIZaCIjiEH5ZmDIyWma6xkU7YLP75CWZVII93Hjth9S3XAH?=
 =?us-ascii?Q?eKVU7EappaT0z1qtOJef6SihnRUru5fgmCV4/b8PDY/4MQWLkmxm3ifhflYv?=
 =?us-ascii?Q?EFOz4GF6AMqpGCpIA406jEUbVsh+ynkVGBSEB/2k9SmExY31TeWvz1vGZLNp?=
 =?us-ascii?Q?2yEIafsyp7cO06rUqKoJrOmGBHDPqdmBieLLybCZkSrZRl6RKpLQSdGQKZV7?=
 =?us-ascii?Q?ss8ePj62PQ7VJw0GTcigcNxGLrVT1yiUPIR7qGrLm+E/vGMjRo1LRgs0paay?=
 =?us-ascii?Q?fUItsJig+7GMfzm2DprPBdwOK5qjcNISU890VqCHk0bhBi7anT2Bi4CDgWYm?=
 =?us-ascii?Q?Ztz3m6MW3YeawEFmN3CC3QX0tNLuLA/13aPfLxhbcP3OYOouHvVYntkFyObU?=
 =?us-ascii?Q?5QcJ02tJyA=3D=3D?=
X-Exchange-RoutingPolicyChecked: QAkl0nLN7N1lEeHNcd9aH6W2OIPARMiKiDCRAwrPYjxHEocCPhKyHgA0BH5PLIZ4B8xwQ9AyDe1QpxYQ+lNGYe4XTNPxYKtZDOFQUxfTQ+V+UuMJOKWyEfNTqEKvQJYsouB2FjhpMMkAYQBnwOug0D4EZ9EJPJt/v8aHEkYHpk3atYzhZPSYoEVMQiKfrUTRcIRidte9WtmyCUg6crHVMVBJ/weDkqxWRHEp/8GsBvjfDBE2e6GweNY+wjltYbT8UiuUA6FtcrBdBK8GO0XhpBVO372Bw88o3Z7uN6vaXtRb9n4v0d4/EXQ15Tdi0/CDDjiy3KHdTRFquHDBtxZ5og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fd9089-d480-4bb5-f941-08df011297e9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:32:28.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLW5go0WndDsGXfltGNDMmGsFVepnzBR+8VkPSYAxcFLjL/yz5z/nJpaNVqzzXclCkUrTyrtNgvEml1dGKWCEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3d2b0075700eab3a7aa5b384a24ed78ffedc1c24
commit: 70ad75e771d15cdf21f43548ee47bb38b4c2f564 [226/226] ANDROID: dma-heap: Make the page-pool library built-in
:::::: branch date: 20 hours ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-161-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221811.Dujad3y9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608221811.Dujad3y9-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/page_pool.c:116 dmabuf_page_pool_create() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +116 drivers/dma-buf/heaps/page_pool.c

d3b59a75e86384b John Stultz 2020-10-02  113  
d3b59a75e86384b John Stultz 2020-10-02  114  struct dmabuf_page_pool *dmabuf_page_pool_create(gfp_t gfp_mask, unsigned int order)
d3b59a75e86384b John Stultz 2020-10-02  115  {
d3b59a75e86384b John Stultz 2020-10-02 @116  	struct dmabuf_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);
d3b59a75e86384b John Stultz 2020-10-02  117  	int i;
d3b59a75e86384b John Stultz 2020-10-02  118  
d3b59a75e86384b John Stultz 2020-10-02  119  	if (!pool)
d3b59a75e86384b John Stultz 2020-10-02  120  		return NULL;
d3b59a75e86384b John Stultz 2020-10-02  121  
d3b59a75e86384b John Stultz 2020-10-02  122  	for (i = 0; i < POOL_TYPE_SIZE; i++) {
d3b59a75e86384b John Stultz 2020-10-02  123  		pool->count[i] = 0;
d3b59a75e86384b John Stultz 2020-10-02  124  		INIT_LIST_HEAD(&pool->items[i]);
d3b59a75e86384b John Stultz 2020-10-02  125  	}
d3b59a75e86384b John Stultz 2020-10-02  126  	pool->gfp_mask = gfp_mask | __GFP_COMP;
d3b59a75e86384b John Stultz 2020-10-02  127  	pool->order = order;
d3b59a75e86384b John Stultz 2020-10-02  128  	mutex_init(&pool->mutex);
d3b59a75e86384b John Stultz 2020-10-02  129  
d3b59a75e86384b John Stultz 2020-10-02  130  	mutex_lock(&pool_list_lock);
d3b59a75e86384b John Stultz 2020-10-02  131  	list_add(&pool->list, &pool_list);
d3b59a75e86384b John Stultz 2020-10-02  132  	mutex_unlock(&pool_list_lock);
d3b59a75e86384b John Stultz 2020-10-02  133  
d3b59a75e86384b John Stultz 2020-10-02  134  	return pool;
d3b59a75e86384b John Stultz 2020-10-02  135  }
d3b59a75e86384b John Stultz 2020-10-02  136  EXPORT_SYMBOL_GPL(dmabuf_page_pool_create);
d3b59a75e86384b John Stultz 2020-10-02  137  

:::::: The code at line 116 was first introduced by commit
:::::: d3b59a75e86384b6d5302159fa89446ead81e71e ANDROID: dma-buf: heaps: Add a shrinker controlled page pool

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
