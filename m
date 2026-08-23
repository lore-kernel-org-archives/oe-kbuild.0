Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9612049362B
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485913; cv=fail; b=mQWTiWoohDYnYGp0Z5Gqa2O06eC/4OL5U+FZ8X2FR0o4MPDFJ7GetL3uENa6/b+9k2aQRQgy06dAryzE3p2S0OPdCjs3eKbVDbeC0sdtkYqMN+UxijisitMYjd0Pbp88+i4gP9HWWQkIvznMff/DH//g1gbhPn7clrfumVrqX20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485913; c=relaxed/simple;
	bh=Bud0rCBl1GLBAWor2jAWqLRRdDWcwHhdss6YbLBcf48=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nuwDPq0zSo9Gp49Sui8Jm8vIDNxgfiOptvbrh4nF59LfbNkLQEC0vWxlxMMypc7eUpCHpWe5sP47S5J52X9miguoPoL257H5lJHb5N978l/yEX7LNI1qgeVMmKxwouogz48lxiDbPhS/0al0d8sl0y4QOSbY1wAElOsgBu6a3sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwW4wGbY; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwW4wGbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485912; x=1819021912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bud0rCBl1GLBAWor2jAWqLRRdDWcwHhdss6YbLBcf48=;
  b=KwW4wGbYqpYp5GkPTrF8y1I6iAkUC52Y761hLiCVdzWlahN6ZCD0obJJ
   yzSEfyAvKb3hKbRP7uTTKgPyuqVsvH67wCF4SSCpbZKBbvOtJqZUyipcy
   jIEZ5q3RUcW3ovJDptsVQgRdbuW8a9cZsEZOpAqNAUmK0+CGDmBCzJ/AJ
   xe7qgJyo13gqjSXGUyWCFrAQYLSvJVMNqTtsrOmX/PunufaYU3D6mt+Wi
   WtWohkon6PxFnvYE/VEVNX6bBfktCsju+6HCLro30jv8JEYORqamroK+I
   8eKEdjPKttx5CLsx5dC/tDBHOwt4jQWyQAyRoN541Df4ubE9tLLHIhyHR
   w==;
X-CSE-ConnectionGUID: w9LsPAxiSGCokTvwjEjBGA==
X-CSE-MsgGUID: /Ie1x2PoQ1+XCt9JBhOqNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="99488119"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="99488119"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:51:51 -0700
X-CSE-ConnectionGUID: OodTE647T0myymCbh4fDKA==
X-CSE-MsgGUID: uYHAXc91SC6Ry4WdSlFxiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="268708793"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:51:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:51:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:51:50 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VABzNKh8Y30ICOAUByz2zxC7fxL7zkMZtt0xZJjCs3g1MvYpTMTJVyrF8TiaJhO3n30tB3adSRf3SakNWc4cKHJ91ogih5b5YFFVD8zFQMctfVtSaoqc8rNbbEbAuAH/zItyfLKmj3zwXvfvkkByDSboelrVbJxudG9L4zmtrhSdQ6+4aqZeAkDQ3EmsJEVYEMzSw3d4HvXB/QrYF6iDLKxYa4gCDpDKKRb9RS+1+eEOJ0xKYzU+cliwymk6f22kfsgG1xW0W34hij4u2AIsvjImGM+0e7wW+Uxco7r9XxDuDT3Qj5P4YbfLKJLJIPNQPnSIDoLiis4cnqmx/GIhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCRGQJyvKV32iAwoBikT4t5ShBp+rKtwbfy3ILEYjKw=;
 b=qOYorDlUjFbGJ1P+pLnSsBfxf9pdoor8rih0RHOdwm3frbpoYK/LhKflTzJGkcbhf+91Nsa0ZLIs39ZdlSVOlKnNZT8FL6ktQZjJ29heBph307DGDmK3laitnvI0Od6wQTTn5b/2SKKnuf9LYhFKI7sVBg94Snlxfz967LHFoD9EpGKEBff5jycuVb0uZS85g6aOjf5tlKPjD4GSi7EtX1KmsvzN6WTlVwkHzTRr+DeD9S4MHJE6d4O1wicitjdhLNVRhjiTDRJEfzbWtOJ8C/ltC8Op7Dz5sNfr461n6MFGCjjVq77Blg4FXNesepR0addhvFo5iIjK+tICvhmkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sun, 23 Aug
 2026 11:51:48 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:51:48 +0000
Date: Sun, 23 Aug 2026 19:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: Re: [PATCH] wifi: ath11k: fix QCN6122 UNII-3 channels 149-165
 disabled
Message-ID: <202608231300.oeIwNFod-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:4:297::16) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e1ede4-5189-4547-7b8f-08df010ce988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: akD54Xm6dbVvgcInTo6pfrHhVVzeC5HWbezeGbVZCf+Eu7J5EudrF8m315tUyqFeKN5fnE5zpecy8VX2HipA0pEBf1/C0HJwCtrJlccUDbZWPVPm+w4Qm4Nx+ssFQbO39PZXD+23GSWlDGExZuFmgpM/7grpRqUsyB6bhGy+pZW+xqLuwnQ8zBsA9SM7x4/bcOVjAFahCdwHCC07T98+FQcDffMtZ+2JhcudrR4xo/6y9UQ2pm6hcc5Q7BoDfwcQt37hGsttkaitHXdfS7PB9ylRDUyqbh5fggkg5Yl5HZekLVq9MqVfNvSg6oNZVEDC7HaBo1ej95ETFiKlYlX2AW4suLo2Ysdx1ljF+xMy5I7bQle8dH5p3yRq8lWL2L1SlDvAQl9GJeQjMjr36MmTVaVEkpKMFgEapC92RcVbqqBsraqSk2OoJqAE2TRIv6enjsq/aLwPddFTKEFj/tXLDSjsS6WPs8kq7DEqSjEzeh7elZZ2v9NgkBlTMwbt9/QnB3MSz/nOetzCf4f5h1BskV0a1J0xHcpVUwu39uhRFc1Ps2G0rXvvBIJuHqGnKIlJbPrquBtxV4WF6dbldZpzS+yirYG4/h/EGGLdgS3epzvLB1GqwG+/l1sBt6zfUD31
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FESdfd+av5rZLehyY6UFgaur4zbfSgytXtkcI0GoTLy1wnaZuq8+Rf3FM7r?=
 =?us-ascii?Q?YklOIZ7C1VcpyulYvpHdQP7096Rp03Khv1rSa14du3+9Bu3eJ9tUEpZNjFQy?=
 =?us-ascii?Q?yPW4eGEddd5HcI+B0YZEIN7E2t3m4AXKYfvikP0pAq6X8hwidKyALief8rs3?=
 =?us-ascii?Q?itu6P+FNP52aFrzt+7nKf4euMeSa919Tg+STzFZfJs1+eP5Odqv9VeAZbp3c?=
 =?us-ascii?Q?MHsUrlSZdfQAmK7BXXaeajcmQsWPM1zsXpsHbL7yS95Ptu9Y59AggZWEeyl7?=
 =?us-ascii?Q?S5Dt9vtLiJTMQDACt/oVq88lCFh8WjLeU/9bA6xNlHzSFYvTdgJymdJkI4UZ?=
 =?us-ascii?Q?K4FD6LzhtqlCzuKCZeHI0Y63rKXnIzsi3aT8SpjXzkaNSKL4V+MLJICsIJe5?=
 =?us-ascii?Q?garRWuZyF2u1B1823EZosIZyXkmyKT3iT3jp2otvBO0+aua+nE+HRkKztPVg?=
 =?us-ascii?Q?+esfj1cVoWWTICrepsgCLo4kCnRZFdNzg5tc3iWq3BgsEgbdKXTd4OsFOg95?=
 =?us-ascii?Q?yI+JMkWzqqNuQLI2EKYB+d62SEuGeKrNy3LR0dWWJPQY2j2/t1dpf5e4NcdH?=
 =?us-ascii?Q?W26arBqawv5KB++eJmXAk9hE5I/e8O+hbvPhpIM2q+cgmjKwAPtCD8WwvovB?=
 =?us-ascii?Q?yj1W6G0m10HJb+Vw7tyto1kUKIhMqgFZ6DlJgdorA+hasFC+vPsvCQUWz5L6?=
 =?us-ascii?Q?clZ0EconMHiWZ7+NX74o75ouU/V8WL0IaDEDDusnc6cN+UgGxStl5JDPwBS8?=
 =?us-ascii?Q?dxyHk8Lv93F576ku76B5nfk3Tskpv9KcwsbLL0S6qQBXxndCWuVOwbZwi+eK?=
 =?us-ascii?Q?WBBildQjCj4wA3evSgUcC+IjJLkHWcf3jXraoojHYCchjMEXVKVapHxJdA28?=
 =?us-ascii?Q?oaUPMGYTaYzJK7FZ2eyXXMTBqhlAhSIoP6ntBBm5naDfveM9wPdzGTmfyH3/?=
 =?us-ascii?Q?r5KVRgtlowNtbZkO8qEnducoUfNU19tvTKelFrJjyUNqWjjX+fdSp8mXV1nw?=
 =?us-ascii?Q?gozjmrOupfd5jSqeVss2A+Qx0urNzdtb7UUjRbZHDzAFtLbzpT0sIwZUOqY3?=
 =?us-ascii?Q?xvkMV5B5XKQtOGALWi39a358L7sjw49MvgzTZsRTihrhkvysv8SSZxFA/x3H?=
 =?us-ascii?Q?AXrDDMA+yeWBsuLKxtDB+al+PtHkRe/85J6TwPgbonsfiYzRDeQ/M3z3/orw?=
 =?us-ascii?Q?uEJ8gBlwNET2FK/maeGayNGJObnA0DuNyFUnU0ToiR6pnUkcKIBDnMKQlAMM?=
 =?us-ascii?Q?eLzJR92jzyEq87U3vuIO+e4T8GJCg5N69OAdOdl3DHhjKA0xS6MP7bbfBOqe?=
 =?us-ascii?Q?KbosYJ+xA9VGYIOWFWVwLmgKgO5KneyjaXs0tMD3iAsRLHhu+WumJiR/5oFg?=
 =?us-ascii?Q?KFPWFtqtY4lhmz+0JsjshlCujo7Fq2qHJ+hbr4FWUuD1jLylRUQiAEu/H6iv?=
 =?us-ascii?Q?EFbR5+DAGihO+x0EiVsORlFxWEVpzuzvgEXq0A3oiDjqmPtiCuYpmKFW2soH?=
 =?us-ascii?Q?oW2l3akfsZ7ZJaQQesqADNxoTaiMojjONl/yABi3ifx5tzaT078ipLX0ONQg?=
 =?us-ascii?Q?PjUpYvMrAThm8jChHBFjx0OFuY2HYOdwTqdfEs0zYU6c5hO2TQsEc6jy+CuB?=
 =?us-ascii?Q?N6m7zEWMYrsd7kAenSHc8c1XiZ7QuYb2bIwFhIIIcqRBSmwoJLvLiRN4iNuN?=
 =?us-ascii?Q?7RcyrkzZKIftKDyG6w8vynLOWVQK4RbnMurC5Pq7ACj31yXSkkuxKngUKhpQ?=
 =?us-ascii?Q?ayDqIM2YOQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: hN67h0HgimPWAPEVYdzvngdnlPERgxJLmdFWcnu+Qu1JZPwZhFeZwyI6Hcaec5v9dmQvu7P1DwiyVv4JDriwenUCwUcTj+ju+R+T/VtWntZPcp1E1CfMvJz+0QkdiVd3XhY/b+4L2KhW8evmZmT3nQAIZwvGbHq+AAU7DYNaPqh/tMj5dslnZYW/WPjofnKK4LXLbd2pn6GoUsIEfIK3Addu0wUTxn/O4A9G3u+SLwc/gQ/ttCNzEARQlnGb6LtbvVpTAWJykZqLvKBeTRWKlO4VQ3eKJTdAbtDamUKm4IJVjOVYxq2HO4VUD7gcRSweXxu/8Y2cKFhj/WYU1LrXmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e1ede4-5189-4547-7b8f-08df010ce988
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:51:48.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKHLYMNVrSp14nRHCwMpe0rfkX7s5IVVh154f4n0z9yol21krbG9tTcDtZkp/kc2eT/vhWAPFXVRioJctmQERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <tencent_CA929E144EEEC926E8CFF32B18ED3A26A907@qq.com>
References: <tencent_CA929E144EEEC926E8CFF32B18ED3A26A907@qq.com>
TO: autumnshiu <autumnshiu@foxmail.com>
TO: linux-wireless@vger.kernel.org
CC: kvalo@kernel.org
CC: ath11k@lists.infradead.org

Hi autumnshiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on ath/ath-next]
[also build test ERROR on wireless/main wireless-next/main linus/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/autumnshiu/wifi-ath11k-fix-QCN6122-UNII-3-channels-149-165-disabled/20260815-230738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/tencent_CA929E144EEEC926E8CFF32B18ED3A26A907%40qq.com
patch subject: [PATCH] wifi: ath11k: fix QCN6122 UNII-3 channels 149-165 disabled
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260823/202608231300.oeIwNFod-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231300.oeIwNFod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608231300.oeIwNFod-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_setup_channels_rates':
>> drivers/net/wireless/ath/ath11k/mac.c:10180:31: error: 'ATH11K_HW_QCN6122_HW10' undeclared (first use in this function); did you mean 'ATH11K_HW_WCN6750_HW10'?
   10180 |         if (ar->ab->hw_rev == ATH11K_HW_QCN6122_HW10 &&
         |                               ^~~~~~~~~~~~~~~~~~~~~~
         |                               ATH11K_HW_WCN6750_HW10
   drivers/net/wireless/ath/ath11k/mac.c:10180:31: note: each undeclared identifier is reported only once for each function it appears in


vim +10180 drivers/net/wireless/ath/ath11k/mac.c

5f859bc02c7bc7 Carl Huang             2020-08-17  10158  
d5c65159f28953 Kalle Valo             2019-11-23  10159  static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
d5c65159f28953 Kalle Valo             2019-11-23  10160  					   u32 supported_bands)
d5c65159f28953 Kalle Valo             2019-11-23  10161  {
d5c65159f28953 Kalle Valo             2019-11-23  10162  	struct ieee80211_supported_band *band;
74bba5e5ba45d5 Wen Gong               2021-09-28  10163  	struct ath11k_hal_reg_capabilities_ext *reg_cap, *temp_reg_cap;
d5c65159f28953 Kalle Valo             2019-11-23  10164  	void *channels;
5f859bc02c7bc7 Carl Huang             2020-08-17  10165  	u32 phy_id;
d5c65159f28953 Kalle Valo             2019-11-23  10166  
d5c65159f28953 Kalle Valo             2019-11-23  10167  	BUILD_BUG_ON((ARRAY_SIZE(ath11k_2ghz_channels) +
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10168  		      ARRAY_SIZE(ath11k_5ghz_channels) +
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10169  		      ARRAY_SIZE(ath11k_6ghz_channels)) !=
d5c65159f28953 Kalle Valo             2019-11-23  10170  		     ATH11K_NUM_CHANS);
d5c65159f28953 Kalle Valo             2019-11-23  10171  
d5c65159f28953 Kalle Valo             2019-11-23  10172  	reg_cap = &ar->ab->hal_reg_cap[ar->pdev_idx];
74bba5e5ba45d5 Wen Gong               2021-09-28  10173  	temp_reg_cap = reg_cap;
d5c65159f28953 Kalle Valo             2019-11-23  10174  
3da35581ef5de9 autumnshiu             2026-08-15  10175  	/* QCN6122 firmware omits the UNII-3 band (5725-5850 MHz, channels
3da35581ef5de9 autumnshiu             2026-08-15  10176  	 * 149-165) from high_5ghz_chan, which makes the driver mark those
3da35581ef5de9 autumnshiu             2026-08-15  10177  	 * channels IEEE80211_CHAN_DISABLED. Clamp it to the standard 5.8 GHz
3da35581ef5de9 autumnshiu             2026-08-15  10178  	 * upper bound so channels 149-165 remain usable.
3da35581ef5de9 autumnshiu             2026-08-15  10179  	 */
3da35581ef5de9 autumnshiu             2026-08-15 @10180  	if (ar->ab->hw_rev == ATH11K_HW_QCN6122_HW10 &&
3da35581ef5de9 autumnshiu             2026-08-15  10181  	    reg_cap->high_5ghz_chan < 5825)
3da35581ef5de9 autumnshiu             2026-08-15  10182  		reg_cap->high_5ghz_chan = 5825;
3da35581ef5de9 autumnshiu             2026-08-15  10183  
d5c65159f28953 Kalle Valo             2019-11-23  10184  	if (supported_bands & WMI_HOST_WLAN_2G_CAP) {
d5c65159f28953 Kalle Valo             2019-11-23  10185  		channels = kmemdup(ath11k_2ghz_channels,
d5c65159f28953 Kalle Valo             2019-11-23  10186  				   sizeof(ath11k_2ghz_channels),
d5c65159f28953 Kalle Valo             2019-11-23  10187  				   GFP_KERNEL);
d5c65159f28953 Kalle Valo             2019-11-23  10188  		if (!channels)
d5c65159f28953 Kalle Valo             2019-11-23  10189  			return -ENOMEM;
d5c65159f28953 Kalle Valo             2019-11-23  10190  
d5c65159f28953 Kalle Valo             2019-11-23  10191  		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10192  		band->band = NL80211_BAND_2GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  10193  		band->n_channels = ARRAY_SIZE(ath11k_2ghz_channels);
d5c65159f28953 Kalle Valo             2019-11-23  10194  		band->channels = channels;
d5c65159f28953 Kalle Valo             2019-11-23  10195  		band->n_bitrates = ath11k_g_rates_size;
d5c65159f28953 Kalle Valo             2019-11-23  10196  		band->bitrates = ath11k_g_rates;
d5c65159f28953 Kalle Valo             2019-11-23  10197  		ar->hw->wiphy->bands[NL80211_BAND_2GHZ] = band;
5f859bc02c7bc7 Carl Huang             2020-08-17  10198  
5f859bc02c7bc7 Carl Huang             2020-08-17  10199  		if (ar->ab->hw_params.single_pdev_only) {
5f859bc02c7bc7 Carl Huang             2020-08-17  10200  			phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_2G_CAP);
74bba5e5ba45d5 Wen Gong               2021-09-28  10201  			temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
5f859bc02c7bc7 Carl Huang             2020-08-17  10202  		}
d5c65159f28953 Kalle Valo             2019-11-23  10203  		ath11k_mac_update_ch_list(ar, band,
74bba5e5ba45d5 Wen Gong               2021-09-28  10204  					  temp_reg_cap->low_2ghz_chan,
74bba5e5ba45d5 Wen Gong               2021-09-28  10205  					  temp_reg_cap->high_2ghz_chan);
d5c65159f28953 Kalle Valo             2019-11-23  10206  	}
d5c65159f28953 Kalle Valo             2019-11-23  10207  
d5c65159f28953 Kalle Valo             2019-11-23  10208  	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
e2ceb1de2f83aa Maxime Bizon           2023-04-21  10209  		if (reg_cap->high_5ghz_chan >= ATH11K_MIN_6G_FREQ) {
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10210  			channels = kmemdup(ath11k_6ghz_channels,
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10211  					   sizeof(ath11k_6ghz_channels), GFP_KERNEL);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10212  			if (!channels) {
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10213  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10214  				return -ENOMEM;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10215  			}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10216  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10217  			ar->supports_6ghz = true;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10218  			band = &ar->mac.sbands[NL80211_BAND_6GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10219  			band->band = NL80211_BAND_6GHZ;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10220  			band->n_channels = ARRAY_SIZE(ath11k_6ghz_channels);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10221  			band->channels = channels;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10222  			band->n_bitrates = ath11k_a_rates_size;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10223  			band->bitrates = ath11k_a_rates;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10224  			ar->hw->wiphy->bands[NL80211_BAND_6GHZ] = band;
74bba5e5ba45d5 Wen Gong               2021-09-28  10225  
74bba5e5ba45d5 Wen Gong               2021-09-28  10226  			if (ar->ab->hw_params.single_pdev_only) {
74bba5e5ba45d5 Wen Gong               2021-09-28  10227  				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
74bba5e5ba45d5 Wen Gong               2021-09-28  10228  				temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
74bba5e5ba45d5 Wen Gong               2021-09-28  10229  			}
74bba5e5ba45d5 Wen Gong               2021-09-28  10230  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10231  			ath11k_mac_update_ch_list(ar, band,
74bba5e5ba45d5 Wen Gong               2021-09-28  10232  						  temp_reg_cap->low_5ghz_chan,
74bba5e5ba45d5 Wen Gong               2021-09-28  10233  						  temp_reg_cap->high_5ghz_chan);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10234  		}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10235  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10236  		if (reg_cap->low_5ghz_chan < ATH11K_MIN_6G_FREQ) {
d5c65159f28953 Kalle Valo             2019-11-23  10237  			channels = kmemdup(ath11k_5ghz_channels,
d5c65159f28953 Kalle Valo             2019-11-23  10238  					   sizeof(ath11k_5ghz_channels),
d5c65159f28953 Kalle Valo             2019-11-23  10239  					   GFP_KERNEL);
d5c65159f28953 Kalle Valo             2019-11-23  10240  			if (!channels) {
d5c65159f28953 Kalle Valo             2019-11-23  10241  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10242  				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
d5c65159f28953 Kalle Valo             2019-11-23  10243  				return -ENOMEM;
d5c65159f28953 Kalle Valo             2019-11-23  10244  			}
d5c65159f28953 Kalle Valo             2019-11-23  10245  
d5c65159f28953 Kalle Valo             2019-11-23  10246  			band = &ar->mac.sbands[NL80211_BAND_5GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10247  			band->band = NL80211_BAND_5GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  10248  			band->n_channels = ARRAY_SIZE(ath11k_5ghz_channels);
d5c65159f28953 Kalle Valo             2019-11-23  10249  			band->channels = channels;
d5c65159f28953 Kalle Valo             2019-11-23  10250  			band->n_bitrates = ath11k_a_rates_size;
d5c65159f28953 Kalle Valo             2019-11-23  10251  			band->bitrates = ath11k_a_rates;
d5c65159f28953 Kalle Valo             2019-11-23  10252  			ar->hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
5f859bc02c7bc7 Carl Huang             2020-08-17  10253  
5f859bc02c7bc7 Carl Huang             2020-08-17  10254  			if (ar->ab->hw_params.single_pdev_only) {
5f859bc02c7bc7 Carl Huang             2020-08-17  10255  				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
74bba5e5ba45d5 Wen Gong               2021-09-28  10256  				temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
5f859bc02c7bc7 Carl Huang             2020-08-17  10257  			}
5f859bc02c7bc7 Carl Huang             2020-08-17  10258  
d5c65159f28953 Kalle Valo             2019-11-23  10259  			ath11k_mac_update_ch_list(ar, band,
74bba5e5ba45d5 Wen Gong               2021-09-28  10260  						  temp_reg_cap->low_5ghz_chan,
74bba5e5ba45d5 Wen Gong               2021-09-28  10261  						  temp_reg_cap->high_5ghz_chan);
d5c65159f28953 Kalle Valo             2019-11-23  10262  		}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10263  	}
d5c65159f28953 Kalle Valo             2019-11-23  10264  
d5c65159f28953 Kalle Valo             2019-11-23  10265  	return 0;
d5c65159f28953 Kalle Valo             2019-11-23  10266  }
d5c65159f28953 Kalle Valo             2019-11-23  10267  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
