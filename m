Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB738A70A
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487841; cv=fail; b=Epr0ljZmJMNHrs/yblajGq14JINZbA28RXTX1CxLfBwJWAfbVe8zn3gewbok2VHEAnoXlTKKCMigUggoSS8/XQHlJGqyUesPLqjjYzbGnoUbCS+6s027dNrXvPm2tBHsNhEKeOrVGQw2uCyz56jVeSI5GocwQmGxUdqFs/3lzXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487841; c=relaxed/simple;
	bh=2ghgn/sBGdiy8u6XBIEyR8MZ3ZjUGBe8xmkRYgXenew=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=i9JHTbUyMF4N+2TsHAEfCg+GrWiCMx4TB9TEbj6Qd5GazRGdxI5L2xZxLOUD0truQa7Ytk/spI+wISbfiZEqFiciSf5A+jmvIvRp2HOlQnL74FbIJka+9Bye1Q+/AqB0V/adZ2AwciQtWSYvuo3I0bbbrP7xBdvmF4NJbNROUsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxB1rh8L; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxB1rh8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487838; x=1819023838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ghgn/sBGdiy8u6XBIEyR8MZ3ZjUGBe8xmkRYgXenew=;
  b=nxB1rh8LBoMWGQSwFoTC/VPCwRZmO+9nLpCusaDXvPmFA8UoGctBvCzk
   ct9b/xJF+LvBUpZiNEKPBO8V8Cd9+IDsdpID9gIpefFpCVMa0XQ1xn+vC
   8qkfA9Lez/V1T4BS1ZjaQsPJAgbRjM2JbHivTuz7eJck4ElTDxg5M0Zy2
   ZjXej7lNce0hH71Lp9Oo83m2lsyT9q6tT1RVacb4DN4GA8AKw506eJsvO
   1um5cS7hbOPak9lR7Ssrfj3Uz1UyLkkvnCT4W+MR9StFBxgvVJiEhgSf+
   h+OfadjLe8zTBA1v9bQdlohWsngEsule+WC961/nBLs4/DX+9ExtL3ZRf
   w==;
X-CSE-ConnectionGUID: 5AZEQ5V2TaKQo4ZIuCj9XA==
X-CSE-MsgGUID: T8q04dZOQeOm3rKO3jux6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87725952"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87725952"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:23:57 -0700
X-CSE-ConnectionGUID: 0weENRAdQx23iMoVtGuSMQ==
X-CSE-MsgGUID: GqxsYLx5SDiBnSBjI/Y6/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="291602120"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:23:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:23:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:23:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY8VxZDT4mQ4k5flV63JszRj/2Fks05i3P/II5buGXtTMHqv72m2iparPBQw1i5C9c0bFjyjfSzFDtJuy+mfY6e8JGkOkXdL5rSwCnWh4fAkC6n7VGlMwriuDsSmeB/mn2RwuDxY0h+hwsQm4VY1AUWnLcBbEv6zI2vrG8QrmO8ExnWr9dFukiERp35nUF0Kdv7/iBAsA3DhnJkQpmYUJ7dezvNtLyavzEvyIDMEHIIVcuaw4biT8urn/smQFzoSkKzLUMlv5N2mmsT1o30m1Vl0XYy5DpGFDraIDOGoulUiINBral44XYxsRO1+UIr1W+ie8K4BwP88HinKitt9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBXv0etsCMJQUJLqGN93YtOAixp4S4XL4BjY0yBfGJg=;
 b=hw2vPSht8HOdKlajd8hPw1Ys38CJ8ztXI+iYUc5OOjb7NIlBAs/EIIwXehQgfUT7umsieusxpPCa9k5/LbERLdJI8S9WKoqpd+mXVKpr0T/cUxuJtOhYKDHDi5mU0QX3nxAqU7m7vbY0k9ZPOeqp0yoqnF4KAkcGgixR8+5Acn6RxNuUX0pTAG5LUQ27p78BpR6xWJhfL20Itii86lB4XVvRl9LmK2MjJVWqxSE+jk+JmucrtyL3IdZlUDl9da6VKWjlJQnd4BY88wF83eZKt4XXDcJ7qOmnZ+ihIg8STkMbUONE1j02tbXx1ZL5EYzfdCI5qXYvEm01tiYQKDvE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:23:46 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:23:46 +0000
Date: Sun, 23 Aug 2026 20:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: Re: [PATCH 1/1] nfc: llcp: Pass caller buffer to
 nfc_llcp_general_bytes to fix UAF and memory leaks
Message-ID: <202608230701.proA2MNj-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 33cb6280-de24-47a0-05a1-08df011160fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: YS+ywbx3FrZH/EQZi8qwHRikXBRKDpl6Fj9FeCg98TAah6F4PToIqYNe5DK6xm23XyhTRCRRwkxJZA08huVkVD67UokXkZMNUnnrl/5UH+7aMbaa84FOCXUfit4M6SUPQcL3U2hmQF9ietKy2oVSUan88zJd2No7CYBKSwLn3WBCcbl4JkGrTRf7kCgXlsi9GwWtUTz/ZMMpRWQYi6twe85Oydftz+W+ALXJndW+M5AQ8PxNyyXSkOjBfWMwP2geOZz/eSPAQuazZMRRkkjgXpvFMcU1G7ntNvo/el6jJ+by7tnPx9Mhhyin+B2GCvyNG8+2skONkuEiwa6+2EViJ8nS19XawabVTcKSt7xYu7+BrRkKwUqGQKSzYhg1dyIdQSpwMmc2Ag4YaTGfOaNuic95hSSPqWX4Kg2Ko9lOFGYYVX+OggWJKRiWytx+iL9r346bx0wpCzJXrv79rn7zO1yxI6lw5P76Pb8TF55pheYjSYT8BKmR3fMjY3AfU1SBUlCHIVihzIRrYSWFpipdq3xEbU/FfZLs+hSwjNIA/nDdbktXxZshpDMK9q7leL0kfjtUKWI9Zsv8VR387P7waaLc06l9/5+5WeUNdIXAnReQI5lfvq1r7KK0GHSzuHuk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mBBEVu41Nzg0Ao/J05Iu5DrRSSgyTZe+7tgjzIZOQUXTk5JOGbGIrmZLBNe?=
 =?us-ascii?Q?2xPFn2/qlFJVaRCoW8ooj8RpqXm+qSQL/KgH34mPZkB8tUZNrRkExHDSQ/P+?=
 =?us-ascii?Q?KHur86ujA06pjUsLNMrCmrWoE5wLC7q7onpReHLNxfD2akTnQnDcL/IAP5gV?=
 =?us-ascii?Q?0KpTg7LRzO9q0Wux2MCtFosk/DcmzE5uH19oSE9nD+LRCKggJ5FNDNtoS96y?=
 =?us-ascii?Q?4QrmhLL/B+ePGz5iWg4hTFiyIzLD8pL3hhNt0ql75o+/MRBbWAKpw0gOHcZe?=
 =?us-ascii?Q?kma8yRBbFzONKHBuU6lx5G8GVQ193K8aD7ZQYl7lUGSmmPGVTr1U7jMvqw9V?=
 =?us-ascii?Q?UfmxVGtlsUrB7YcHPzei1QHcxwrx0y/jSv4zT2DdEvoRsqMb2OIvZttPrXVQ?=
 =?us-ascii?Q?tsxgmQP13jshLdw8dOLcQKqhd5N1ucQAckkn8iT09cgAf+wOoTVHWfcNDHZs?=
 =?us-ascii?Q?jIbF70aj4As/MazUYipOMcsr+Uv5kaPWzDvcfsF8hw3tBeadgcxUwoOW4gN4?=
 =?us-ascii?Q?RK+j8Bn2rSU5C3NsHmgjP6FwIJGggCbLV0kk1J+YliWdQK1lkPZmFnYsE6Ty?=
 =?us-ascii?Q?VfxqXy1Y5fHIsKs8QInUqtpo+yIw/rK49ePWepe8Z5xp6O+Sr+1LK3/nC/Yw?=
 =?us-ascii?Q?PNv0QtczUJqTqngv2WL+S2nJooOGVmXxp40fTJ49+EQMH00yLawW/RoNqxC3?=
 =?us-ascii?Q?bwubzBlQaWP2tcbfItjQLtTWzUbmW4dt/+04Y9dfxpGUqcsY4y9tOFBFp1BD?=
 =?us-ascii?Q?/QmXe8BdF738aruXzMBokKbPEn3w4YnfgPqUQ14dOgQgMeFUYoYKXbDLry8w?=
 =?us-ascii?Q?hEUcjQS3Y/fFBylsqIw9m8eG66JvyIA5xmll73Z6zdV05FNZWRk14yjNgtUN?=
 =?us-ascii?Q?KLtzg8c3Y9xpsypL7dpELv+WLxialxMBLFFmjo5BUSR2D15lwzRA2q8o5/u/?=
 =?us-ascii?Q?SuhLW/zyg89VlCyPiW7ftPwqs0YpDexFRpVvY1oDSN2EaAPt6la9iWEMrbST?=
 =?us-ascii?Q?k71l3KfQki23h0YFTjZAzDEU8G5RK/bimT/LS1sDBwCCHVph7iPEog+o/9Jn?=
 =?us-ascii?Q?BNqkna/Z+NFlMbDwOrnFUDLp+EDpE43N3EfSlAs0JbwmX4pXuaMMZ7waU2D/?=
 =?us-ascii?Q?XOXrTUN0JfOZuZHVHuFwePpp28nVwXZRUoKibbSeslJjvdKBFvKhE1YIKKHk?=
 =?us-ascii?Q?2b0lN65JReE5mFVACu0zl7b0zBuEf9NRt3kp2G3hOvgcpQz/Tg7zGsXwjQmb?=
 =?us-ascii?Q?RbE7Y+rKfRU5c+vHFKrrTwwJeyIOOHkzQ1ANMvzLdH14Jreq+e4wudklM+OS?=
 =?us-ascii?Q?M3LDPr7khYuKcd3Tn6AxHKiwybQbaahLuBq0OgSqqs+Vo16hkOO2/cGCQ2GI?=
 =?us-ascii?Q?88GAYE8MJKvFst8xxKhnrXaiQkziRHCqRbnj8T1Ys/pDdasWdYT0ovWEiDsg?=
 =?us-ascii?Q?VBX9+arPBFO31KjS5joUuHUaA6CMRFrBqzjhfNGq6BwNBpZR5g9eFBXmeI9i?=
 =?us-ascii?Q?G7A+KUezyJQzkIDpOvDsYLYx7isDtvgMFeQ0II58+3JbMzBVpgoaPaVuMWPX?=
 =?us-ascii?Q?s7g0X4k0+IiY4Xe4XedMr8dcKQkZkh8+AL8s6q446anWS78L6MaFe1XU4i9p?=
 =?us-ascii?Q?s5JMRBA1b8PMUDdoXmucfXmsbyB5TzW5KSGOYHLAyVeWYFMYyFOCbSBi+OWO?=
 =?us-ascii?Q?Ps5lVm6lHs/7A5XGGWRMeiLS1aZvWkHBQ2P/z49QTN7/xG3pLpa8DsagUk2M?=
 =?us-ascii?Q?PbwiuK5gFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: yePaolg/SbzsGslTbPNP9IkkcHm7KQJKvarYAy+qyKwV4/pJ21X5iE97HAM+3U62GTHPVBUrTZ8N4fKijAYQ3aV9K5a6hGNuOJrN6xiP++9Ocpfu0ID884/zJBh/gIr/+S29RYHdTV5NtUNMDtRIU06XFPuyIg/yqE3Dicf14QYGjMEy2Z/c2sh9aQELa6E9WUh5/nBGrKR2g/ZEu9OH0uM4FlugKA10zhvOUa77AgmKdnmdlFVAG2vtW7lk5BFyii3JmZSJl6t+CwMnvLSvtxA9UIMwJ+DjcCTs5MqfycuNbyheZ2CgG97Dev7+EHBia6qOe9G/JO2U34IxnqTfSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cb6280-de24-47a0-05a1-08df011160fe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:23:46.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6Ossy8lgbZf+SN0X7Fh4dZppueCADWHBjFwwOwMBQJ3OyX/khPVphKLOgxfRPlqVjLIKy0aamojV2aSl5nl1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <006437e618b55acc0df69d94255244a490b11461.1786029423.git.rakukuip@gmail.com>
References: <006437e618b55acc0df69d94255244a490b11461.1786029423.git.rakukuip@gmail.com>
TO: Ren Wei <weir@nebusec.ai>
TO: oe-linux-nfc@lists.linux.dev
TO: netdev@vger.kernel.org
CC: david@ixit.cz
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: horms@kernel.org
CC: pengpeng@iscas.ac.cn
CC: kees@kernel.org
CC: error27@gmail.com
CC: raoxu@uniontech.com
CC: dddddd@hust.edu.cn
CC: ian.ray@gehealthcare.com
CC: joe@dama.to
CC: kuniyu@google.com
CC: linma@zju.edu.cn
CC: vega@nebusec.ai
CC: rakukuip@gmail.com
CC: weir@nebusec.ai

Hi Ren,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ren-Wei/nfc-llcp-Pass-caller-buffer-to-nfc_llcp_general_bytes-to-fix-UAF-and-memory-leaks/20260808-002851
base:   net/main
patch link:    https://lore.kernel.org/r/006437e618b55acc0df69d94255244a490b11461.1786029423.git.rakukuip%40gmail.com
patch subject: [PATCH 1/1] nfc: llcp: Pass caller buffer to nfc_llcp_general_bytes to fix UAF and memory leaks
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm-randconfig-r134-20260823 (https://download.01.org/0day-ci/archive/20260823/202608230701.proA2MNj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230701.proA2MNj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230701.proA2MNj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/nfc/llcp_core.c:653:13: warning: address of array 'local->gb' will always evaluate to 'true' [-Wpointer-bool-conversion]
     653 |         if (local->gb && local->gb_len) {
         |             ~~~~~~~^~ ~~
   1 warning generated.
--
   In file included from drivers/nfc/pn533/uart.c:17:
>> drivers/nfc/pn533/pn533.h:169:8: error: use of undeclared identifier 'NFC_MAX_GT_LEN'
     169 |         u8 gb[NFC_MAX_GT_LEN];
         |               ^~~~~~~~~~~~~~
   1 error generated.


vim +/NFC_MAX_GT_LEN +169 drivers/nfc/pn533/pn533.h

9815c7cf22dacea Michael Thalmeier 2016-03-25  132  
9815c7cf22dacea Michael Thalmeier 2016-03-25  133  struct pn533 {
9815c7cf22dacea Michael Thalmeier 2016-03-25  134  	struct nfc_dev *nfc_dev;
9815c7cf22dacea Michael Thalmeier 2016-03-25  135  	u32 device_type;
9815c7cf22dacea Michael Thalmeier 2016-03-25  136  	enum pn533_protocol_type protocol_type;
9815c7cf22dacea Michael Thalmeier 2016-03-25  137  
9815c7cf22dacea Michael Thalmeier 2016-03-25  138  	struct sk_buff_head resp_q;
9815c7cf22dacea Michael Thalmeier 2016-03-25  139  	struct sk_buff_head fragment_skb;
9815c7cf22dacea Michael Thalmeier 2016-03-25  140  
9815c7cf22dacea Michael Thalmeier 2016-03-25  141  	struct workqueue_struct	*wq;
9815c7cf22dacea Michael Thalmeier 2016-03-25  142  	struct work_struct cmd_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  143  	struct work_struct cmd_complete_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  144  	struct delayed_work poll_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  145  	struct work_struct mi_rx_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  146  	struct work_struct mi_tx_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  147  	struct work_struct mi_tm_rx_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  148  	struct work_struct mi_tm_tx_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  149  	struct work_struct tg_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  150  	struct work_struct rf_work;
9815c7cf22dacea Michael Thalmeier 2016-03-25  151  
9815c7cf22dacea Michael Thalmeier 2016-03-25  152  	struct list_head cmd_queue;
9815c7cf22dacea Michael Thalmeier 2016-03-25  153  	struct pn533_cmd *cmd;
9815c7cf22dacea Michael Thalmeier 2016-03-25  154  	u8 cmd_pending;
9815c7cf22dacea Michael Thalmeier 2016-03-25  155  	struct mutex cmd_lock;  /* protects cmd queue */
9815c7cf22dacea Michael Thalmeier 2016-03-25  156  
9815c7cf22dacea Michael Thalmeier 2016-03-25  157  	void *cmd_complete_mi_arg;
9815c7cf22dacea Michael Thalmeier 2016-03-25  158  	void *cmd_complete_dep_arg;
9815c7cf22dacea Michael Thalmeier 2016-03-25  159  
9815c7cf22dacea Michael Thalmeier 2016-03-25  160  	struct pn533_poll_modulations *poll_mod_active[PN533_POLL_MOD_MAX + 1];
9815c7cf22dacea Michael Thalmeier 2016-03-25  161  	u8 poll_mod_count;
9815c7cf22dacea Michael Thalmeier 2016-03-25  162  	u8 poll_mod_curr;
9815c7cf22dacea Michael Thalmeier 2016-03-25  163  	u8 poll_dep;
9815c7cf22dacea Michael Thalmeier 2016-03-25  164  	u32 poll_protocols;
9815c7cf22dacea Michael Thalmeier 2016-03-25  165  	u32 listen_protocols;
9815c7cf22dacea Michael Thalmeier 2016-03-25  166  	struct timer_list listen_timer;
9815c7cf22dacea Michael Thalmeier 2016-03-25  167  	int cancel_listen;
9815c7cf22dacea Michael Thalmeier 2016-03-25  168  
68a67c03cdab6d4 Luxiao Xu         2026-08-08 @169  	u8 gb[NFC_MAX_GT_LEN];
9815c7cf22dacea Michael Thalmeier 2016-03-25  170  	size_t gb_len;
9815c7cf22dacea Michael Thalmeier 2016-03-25  171  
9815c7cf22dacea Michael Thalmeier 2016-03-25  172  	u8 tgt_available_prots;
9815c7cf22dacea Michael Thalmeier 2016-03-25  173  	u8 tgt_active_prot;
9815c7cf22dacea Michael Thalmeier 2016-03-25  174  	u8 tgt_mode;
9815c7cf22dacea Michael Thalmeier 2016-03-25  175  
9815c7cf22dacea Michael Thalmeier 2016-03-25  176  	struct pn533_frame_ops *ops;
9815c7cf22dacea Michael Thalmeier 2016-03-25  177  
9815c7cf22dacea Michael Thalmeier 2016-03-25  178  	struct device *dev;
9815c7cf22dacea Michael Thalmeier 2016-03-25  179  	void *phy;
bc642817b6d9e05 Rikard Falkeborn  2021-10-07  180  	const struct pn533_phy_ops *phy_ops;
9815c7cf22dacea Michael Thalmeier 2016-03-25  181  };
9815c7cf22dacea Michael Thalmeier 2016-03-25  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
