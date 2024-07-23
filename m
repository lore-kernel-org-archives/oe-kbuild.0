Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C813C3F5;
	Tue, 23 Jul 2024 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721761229; cv=fail; b=g8G2bUpteDElcexDLJDjr9FEBlgRlLmyxcxyfDkGyJrXCEV5Np374jbIWWCaFnVkDJ/2IuSWUoEysuQLbWhwElSqsu7jiiBMPy75JL4CwCvN9s1ssMWsOMV8lZSG+1Id551Ev13tKYz+6s82DcCD6sA04fpXcrcQfsmuAOwr/eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721761229; c=relaxed/simple;
	bh=09j/c5uwGpgaWfFTyPf/Oi/6k1TzoNSs43/quf1wTSA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aW5xJf8G4ixEa6fizD0py1Z1MsDFW3EGJlbzLA4gwUKQqGfEtKOKPQy97R6zd5PPJAjktXTaH5ZkItKDpn7eioSdGXzMT0jd/DerBXWNfkf3uMVx2vdxXBTGukB3p1wEqvLU5TPYJpQLIPVI8DwNZ1svLNZ+Q1poIYRQ8mmGGJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCkbGger; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCkbGger"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721761211; x=1753297211;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=09j/c5uwGpgaWfFTyPf/Oi/6k1TzoNSs43/quf1wTSA=;
  b=UCkbGger1X0GxxLuCKAXLIKUhhukfWWvR3WmXxRo7wp0JfcM7w2clp+L
   k+quhkjr5zSg1bq6NWOthCg/uVo1x8LQwqnQwkalTOXI3YCxppipX/DHF
   G6W8UtF+1ej0YL0ig+D52QpvL1O/owCks5E54l/+mriJ/IUyf0USKqXCR
   y/dFgXxmKvRTWfXZpjo+ohWSBQ2eNo9eiwIkZTqsGDVFZrQOc4fM0H+by
   v+2L0NhYTMqrUhl+AUQcvQR5juqGV3rU5qY+euQfFBlaH2mbKsil8kPSF
   1jkxXfjxjNcj7YfL4jk/URDOj0n7mY965t/1JAX33eO7Y7LhZdns2Dzot
   g==;
X-CSE-ConnectionGUID: kx2bsc7TTm6YgeNIZlfXDw==
X-CSE-MsgGUID: imOcom2HShGSSd9x/sW8ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="22308869"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="22308869"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 12:00:10 -0700
X-CSE-ConnectionGUID: jHMi9rZGSJWr8zGWO7JdBw==
X-CSE-MsgGUID: 4PPBbLwkTduIpof9RN3Cyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="56627069"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jul 2024 12:00:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 12:00:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 12:00:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 12:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2smSewjxmWrCbcAQ1bPHC4XYNjORzqENMfZjzIxB1HBIPndUq3kc4TzhdVS56lWSWVbXaEKy9dCspA4gLlSeoe8uLHaw70BREcC4WUErmYUUMKJHEGuDFHMcXxAN6PcOKPY3ej6/XYke5kciGe5W0DGOfx/ygo04h5P8swZQRNwmXA1OjlaCnbIPeDlRKouEMsV1gJ/Zby6YRnmv9zxPmwCrrkuKxIUQ1SEofsIcPx0rpc6h98mrsagmtc6r23LYdA9QPm6RToriccLJvYlauc/r+n6e6rKPcsbxNC/c0rnNM4JKA9dEfQd8lnl1Q7gbsCSHp7+n6AzIiA2xMeSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAXyBKUNLPu0+ZIKD2kx/4GydsOVsZVn67m/fpluFsg=;
 b=VCLG9aoQkzkxD9aO50U/DedNWtRDAUuCK7DUfsU8TPaiSmBloxVRldFVoDwtsAbeVhSbFcZf+CbAzwHodafiAoVuVVJ64U/wS9cCwpj8QtQoQEJZ5wRlnQxx+PmGvJ5nVxjtR3Uo9luWM4uyaNo3ZCCALI3jDUS6T9TqoRiiabudnK3Di4MrA2/lDWoBE/PejVKzJuWRy+qXhKMpOGQODZUdiboDzhYvCfFy8hHjfBGOskIit8L9ck8v2PIBYXVzo/qWY1nzNIN2vbFOwX/Zz9/g1cAC34aBhJS4Mdhl3D/id+XIwZzo341fExRUy6ozCjKB6dHf4zkoHR3oyenWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 19:00:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 18:59:58 +0000
Date: Tue, 23 Jul 2024 18:59:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [linux-next:master 13298/13495]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation()
 warn: variable dereferenced before check 'fence' (see line 178)
Message-ID: <Zp/9e5rwvQNvk2hg@DUT025-TGLU.fm.intel.com>
References: <c8d58c8d-4e89-471b-853c-49d365d7f4d4@suswa.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c8d58c8d-4e89-471b-853c-49d365d7f4d4@suswa.mountain>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 8812864d-e7ec-4f4a-65b5-08dcab49a5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?36O97I19lgkYITR0YUWbRoWPDY2CwCcyvaYvgJSJ5xK8MeyYfrhT2105A2fX?=
 =?us-ascii?Q?1KHiinE1nj7Y0iKHtHYM/whl26iCLtCtz8+ME2f3efZDmkORaZByCtOgCuJ0?=
 =?us-ascii?Q?9+mDbIMMbIZqW1tRXJDmmSDqOp4/U5lqXZGfF251mFhncmZo7Vzp7+7H5GZW?=
 =?us-ascii?Q?4IPKx8HQrjnP/fIRQVnn5d9MFkT2mK79ZXG98z2IWQH7bUM8u/zA8ohBPD8C?=
 =?us-ascii?Q?BYk06y5cQq0JXHiIQlRS+nL6T0beSd5yTIOzuOgoyT/wDECdIxa2yqMV6Lor?=
 =?us-ascii?Q?sOzJem8SoV09NEHrr37RUj62UPCjMBt5Vh60K/OJOTEgwwTgttTNkceNbLr5?=
 =?us-ascii?Q?btC5XgnchgsUIjSQW5BqMxysZEuWJ3QH0lkphrQlDniDkW4mTSxCWm6JJf59?=
 =?us-ascii?Q?QAlzMgt35BUP9XVfdOkMpM3Ry7oJw2RTd+3gyjPZPw3fg69ePlzEAeD12ohZ?=
 =?us-ascii?Q?eGhJd+bt86qSWyibSC7vYfl8/EFWfOejSJQxn+C5Jwe43TLQgWd6ahLOdQ1/?=
 =?us-ascii?Q?hFsAziGvwgtmKC2EkdDLj/+rqfZooU2Ql7zXVfieqx8RIp/lX3pam0U2RCZo?=
 =?us-ascii?Q?pmu1CcvApgKs4B/t+NISm8p0G97QMH5WExJjht1xzg7EiHaR9jVUCxZAi8vF?=
 =?us-ascii?Q?quH/AG6ca5aijIhZHOutuBFmKNsSC8X3Oke786+8LcEyL7dIuFvHXWwtHM4Z?=
 =?us-ascii?Q?wm4uZh7Eddh+sxQezuFaq/2DMX7uRT9QjZRGtGuTehME19tfm5dHzuoZ8M0O?=
 =?us-ascii?Q?dvpzI6f5CC8113Or4lcPSJtZPHqWg9eNN4cMPWSp/rhy27tuvCMnLGviNUjq?=
 =?us-ascii?Q?ItuwAev6QMGh+fxjLyK9T+Op3cF3qcKCuQ5TSC/GfIhWR5G5EGrTU3d/Aj8D?=
 =?us-ascii?Q?r8h3WNRfPugo6p+d+9yVlXzE2Gus4VAA7WWQT1TO5m+z7RkRmxPDcfvSA/wW?=
 =?us-ascii?Q?khh8SY5pToS4pLEV7OXYWBrRjGdwHmDJwFL1oV27+1BrJ1Nt1wRunxSjmDGO?=
 =?us-ascii?Q?AwZZ1xaPgktaqv0nl8NykyqI/nq9L9b9ETEg5F4ySzcZI5s+IbERd2aZ5RMb?=
 =?us-ascii?Q?g21kZwVi6qpO6vFphtXESQJML51Zr7PmqbLRraQvlqHclM6UVW0UPQ8398AA?=
 =?us-ascii?Q?Gy3uCvkRGOSVStmjiX+lP52ReoLWTz7CnfiE6tCp/i4BxLXpcMoSM4heK/I6?=
 =?us-ascii?Q?6gylJzJr64ArFU98A5IYKrZuvUXWXpP6+4n6k2A/8vX7YgQYpgivSDqIvuds?=
 =?us-ascii?Q?F9oxqmjGzqpmRwqdJ4fdRnXcldwUh/lQPShY2NVDKpVCJA7BlRzFR6ex622L?=
 =?us-ascii?Q?1DY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?080j7xLaSnl+YVYobxJ238SG+/xejpLj4Cm2jTTbXXkUrIDrIKq7dtyvfmSK?=
 =?us-ascii?Q?rbgK3M80Lf6JnEgC1Xqyp9pnOR5OQ53FREvjcUIPHqMjnKn3Q39Dk5tqznX/?=
 =?us-ascii?Q?G0yCPM8U3GG5aSOZb+tfH51FumfiRgs2qHegffZrpgTS2jlPrVyHHONPowPu?=
 =?us-ascii?Q?Xux3Bc5sjkO5twWMATO7L6PjYG6qaKGLx+U7AIB1Bv5Je/CcTPZgN0pflEwu?=
 =?us-ascii?Q?zOF6nJSsGNs+zxDhyfU+RN9OEFSYhhN9TNk6zo0Qnq583GtoNZaSXe/YqqJR?=
 =?us-ascii?Q?HjP8KBpLBqzBUjwceGX/gnSsD5kteLsd+2MpDGhyXQxoXomq4xArqnsbCB73?=
 =?us-ascii?Q?lMwqA8jZ2YJZPU4QiXA/rEtz3eiiwSqw5VqTNTgzRhB1V3Oysoh02tkOV1Qd?=
 =?us-ascii?Q?E0K9U3Rhkt0NiGJUOtGCsSz/8VzbRE3Zfue7nAEZ2+Kym8PgxMqRxIAXDp6A?=
 =?us-ascii?Q?SXXI91Xx/aE0uhFloBcwfeC3WLNxBT1htBzaOVn5mgzI6f6RkVHqVoBKX98u?=
 =?us-ascii?Q?/iaquG5+7dnJJBCmuCPeuiOAADlHvnjq5Kz5xDId/VWJq5nke0X92Pq9s7Z4?=
 =?us-ascii?Q?Uzd6UfHdQilkvPDOR9zpgmfzLloPprkdAISLH8ollV12I7KM6ntkm7g+CfF3?=
 =?us-ascii?Q?txcOTSZVUJ2SuKmVA4drZ19L8JvBl+dU1h5q1xxj7FpdT7/t6Zzg7zZSIpFW?=
 =?us-ascii?Q?236oqxmojxlu3Vq8vyC6mv/Di0/EkqDxdx+ezowftyDwyIWF7gehptxigiev?=
 =?us-ascii?Q?+83Y37AlmAGc38E4okwUKpxD7xpse1x5kCaQQmLZrbCKKdHhvZumoXNndcDu?=
 =?us-ascii?Q?bfcHeaEldiq0Pc1wmlmrabv4oDPtCzsgM95TIg0S0/P+2lVqQLgW5Z2PZzpj?=
 =?us-ascii?Q?LX+XAW1esYjAlL9FxoYQnrAP7me9X2iIo8qpJPt9yPZ87DG3XbZblpphXY0L?=
 =?us-ascii?Q?Zs+lfbUQr9c+EKW8GQK5gl8V6URNrH/1TDmLyyvSL//pnm8U96R1cw/atJHD?=
 =?us-ascii?Q?JG0+Y6IUFbgZPb/Ykh23bLQGSMR9dHY0t9//ldhEtxZZwwySfteD5Yg0LV10?=
 =?us-ascii?Q?ilR2ec3tGiQCLmQs/ktF4vrsSBOHewY5OaSmJjvY+O72BJCDvt7bTc+NXGmv?=
 =?us-ascii?Q?GrSYpkv96WDa6FUKXSDVpKJrLv7O38JlJbBRYTJNz/xO4Airurw3NZ2aYZGO?=
 =?us-ascii?Q?GdjHof3a1Nmc+TFviJbEW3WHSFdW0k9Igon6NNb2U/mSn/BwxdRq/OqC0arE?=
 =?us-ascii?Q?j3E60cEdQpUfEC5nJQBn1EqKLc1RouKHYZev67fmuu95PYHTre1KwypGH0pp?=
 =?us-ascii?Q?zVOd8fxvgx1FxTFM76CaM2NVaM1d2eTQ/0/oEIE4FcrSpuG31YzoMz3C1wpW?=
 =?us-ascii?Q?3tip/oSHN4nCRsJFjPAIvIWqlB+KXliKFelIPF/n/4Pmm1UWP78jrav04Jle?=
 =?us-ascii?Q?0/hqvcOkNaIL1d70bBoyy4yuCydFIfLAdJTaBGQ2EUs87qyDl8H0NV/F5jSj?=
 =?us-ascii?Q?xW5FYKd05RTIRE0CK6MprtV7Eg4DSvMaBR8rmzx48JK5u+ngGFBy2tmqxSAD?=
 =?us-ascii?Q?O8dR/om3jZsdpJZ62ZKo1sTmOSI5UZQba2eLbCeGB2devYfcW2eHzvUKV+Og?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8812864d-e7ec-4f4a-65b5-08dcab49a5bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:59:58.3389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g10yB/LFdIpwf9B5iaDiOOFdoX8PFTkHyPcMx1o6zrGyL6P+jlv6mS2m5mZufO9+c/9GxknSPuvlsQgrYBivYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-OriginatorOrg: intel.com

On Tue, Jul 23, 2024 at 01:52:46PM -0500, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   dee7f101b64219f512bb2f842227bd04c14efe30
> commit: 61ac035361ae555ee5a17a7667fe96afdde3d59a [13298/13495] drm/xe: Drop xe_gt_tlb_invalidation_wait
> config: i386-randconfig-141-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231049.esig0Fkb-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202407231049.esig0Fkb-lkp@intel.com/
> 
> New smatch warnings:
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation() warn: variable dereferenced before check 'fence' (see line 178)
> 
> vim +/fence +183 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> 
> fc108a8b759f52 Matthew Brost        2023-01-17  159  static int send_tlb_invalidation(struct xe_guc *guc,
> 332dd0116c82a7 Matthew Brost        2023-01-24  160  				 struct xe_gt_tlb_invalidation_fence *fence,
> 332dd0116c82a7 Matthew Brost        2023-01-24  161  				 u32 *action, int len)
> a9351846d94568 Matthew Brost        2023-01-17  162  {
> a9351846d94568 Matthew Brost        2023-01-17  163  	struct xe_gt *gt = guc_to_gt(guc);
> 501c4255c40935 Radhakrishna Sripada 2024-06-07  164  	struct xe_device *xe = gt_to_xe(gt);
> a9351846d94568 Matthew Brost        2023-01-17  165  	int seqno;
> a9351846d94568 Matthew Brost        2023-01-17  166  	int ret;
> a9351846d94568 Matthew Brost        2023-01-17  167  
> 61ac035361ae55 Matthew Brost        2024-07-19  168  	xe_gt_assert(gt, fence);

We assert the fence is not NULL here. It is invalid call with a NULL fence.

> 61ac035361ae55 Matthew Brost        2024-07-19  169  
> a9351846d94568 Matthew Brost        2023-01-17  170  	/*
> a9351846d94568 Matthew Brost        2023-01-17  171  	 * XXX: The seqno algorithm relies on TLB invalidation being processed
> a9351846d94568 Matthew Brost        2023-01-17  172  	 * in order which they currently are, if that changes the algorithm will
> a9351846d94568 Matthew Brost        2023-01-17  173  	 * need to be updated.
> a9351846d94568 Matthew Brost        2023-01-17  174  	 */
> 565ce72e1c2d54 Matthew Auld         2023-05-24  175  
> a9351846d94568 Matthew Brost        2023-01-17  176  	mutex_lock(&guc->ct.lock);
> 62ad062150c2ab Matthew Brost        2023-01-17  177  	seqno = gt->tlb_invalidation.seqno;
> fc108a8b759f52 Matthew Brost        2023-01-17 @178  	fence->seqno = seqno;
>                                                         ^^^^^^^^^^^^^^^^^^^^
> Dereference
> 
> 501c4255c40935 Radhakrishna Sripada 2024-06-07  179  	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
> a9351846d94568 Matthew Brost        2023-01-17  180  	action[1] = seqno;
> 332dd0116c82a7 Matthew Brost        2023-01-24  181  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> a9351846d94568 Matthew Brost        2023-01-17  182  				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> 38224c00d9c284 Matthew Brost        2023-01-24 @183  	if (!ret && fence) {
>                                                                     ^^^^^
> Checked too late
> 

This check is not needed. Let me post a patch to remove this.

Thanks,
Matt

> 35c8a964398e1c Matthew Auld         2023-07-10  184  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
> 35c8a964398e1c Matthew Auld         2023-07-10  185  		/*
> 35c8a964398e1c Matthew Auld         2023-07-10  186  		 * We haven't actually published the TLB fence as per
> 35c8a964398e1c Matthew Auld         2023-07-10  187  		 * pending_fences, but in theory our seqno could have already
> 35c8a964398e1c Matthew Auld         2023-07-10  188  		 * been written as we acquired the pending_lock. In such a case
> 35c8a964398e1c Matthew Auld         2023-07-10  189  		 * we can just go ahead and signal the fence here.
> 35c8a964398e1c Matthew Auld         2023-07-10  190  		 */
> 35c8a964398e1c Matthew Auld         2023-07-10  191  		if (tlb_invalidation_seqno_past(gt, seqno)) {
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
