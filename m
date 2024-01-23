Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6550271
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jan 2024 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.55.52.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706020863; cv=fail; b=VL8FmCgnLLXTDoW46OxnInmMZ+O7mtl/MTMMtARsuGAW3/PGZjY6n95AAszhmsvThDhGf4Oh0zAgwqwssBvy862x+bdLAFb48XkmU6Vm+FOHhLlGdjqDypog6m4kDAlKZLHbzjqCDQ2TOTSmvd1RXgLNFJQA2581xRDiYP7CzXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706020863; c=relaxed/simple;
	bh=HgBCGMcHg9vkZ7yKq14ePlQLHjTmBIwXUQ5W6evgpHk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QjvVgVZxoIxPWd9mR3ikWnr91Vu5mn0JCDtQvWIMv6iNNms0TvW/BfH99oWIo29G12zJ8Nzk79uwxGKvLomskudIdsbjq/2wr42i2AF6BtFYc5MUGa9bP9oq3T8qsCoXR31KEaDQPQot1G3Kh4mX4Xiv7917RuwWdIslwoiCmI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3na1dNG; arc=fail smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3na1dNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706020861; x=1737556861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HgBCGMcHg9vkZ7yKq14ePlQLHjTmBIwXUQ5W6evgpHk=;
  b=S3na1dNGmfkimxtLKCX7Z93wecTZVypmyEhufv3+bSM+wdRgRlUqMIBV
   RLweb5cYFa/Mux6biCScgEshH8qZmaX0hkQuOHFxzUkiDXQ9Im9+t6yvL
   hNUbyWYWQCeH+c0Dbvcx33P102+1305Q8XJpiBewi5hpCPz3wSK8F3eha
   PHWz54tCVR3Q8Iq04CRAr6ziq8H6PGhhrTzLurLS6myoJZ4S/mI8wgmtw
   ApqhBfstenQsvySuDK7oUWw5ixYOvSLn3w1oPbON5s3HWUMgv3cUFUpmZ
   nrqSNu3CMTGZ9WlqKWbQodShIG/EKl0jHatXk/k7HbbkU8/VLpUXH8Wlk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400402248"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="400402248"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 06:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117273250"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1117273250"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 06:41:00 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 06:41:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 06:41:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 06:40:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrEniG9ex7JBwvDJUgD/qYhYCD6kYzZ+AWnL6X35goENDijmpU/ZwbpXWg7szZYJeiYDvhIIPEoMSuvEp2yx67mtbZLg796Rpc90J6YC53Ddgn34WrOmIu93Rq5si7X8tJL6WWcXZzUX5wQ7oq09M6klW1NdzB+Ueq5CP/zr53TFe/+YwYD1Awefc/DnQd7+q7URtvFlbhptNAVfrBdDIhKRIfpxOC4lBy5NAOb2nMPjl11XLY5PTDxDnqUalwcYwgxk3OHNct3qzpYxVbUpYKLxIw2Ytkrqzmvl3FyGh6y1KoaHu8GsxSgPs16Ob3kji8eOKuP2qtGIHEeggReXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i3Cd9lYnmgt6KDWh3bd0m193RuxzEGTCE+P4KYQZ4w=;
 b=Q8DryWU2251RygrYknhhDr1Ud+S/OotmvOIC+n84bBYAgBYUduuJUagVgeOTFmsHvUnuq+EP2RR1w3KDuYX3XSVhDshb6nDt7d21RnssjQFsipUyc3rAd0yfy/YJkg25a+0pSzgzxNOzLIlaRARTAFlnHbghe4zjo5oZ3G8FO+ohNvE19jpy/p2nDyD8NTtVG+cbfNRrb0WTIn3ILbjQi+ib1qf8kLXFab4rOoRKTRE8P5v0cZd1RKJsLAmL460ZJPeTXfGnebt9kTCx7GfEmXbWpGg2x1TGhoSIDFAa6AOxki2S3x9E9pcKcq41+rv3TC+nG/R0A/EzfeZJqMGftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 14:40:49 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 14:40:49 +0000
Date: Tue, 23 Jan 2024 22:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Subject: [ti:ti-rt-linux-6.1.y-cicd 55/79] drivers/rtc/rtc-tps6594.c:442:2-9:
 line 442 is redundant because platform_get_irq() already prints an error
Message-ID: <Za/P6vauR2R4SAjU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 77177325-4dfc-4305-0077-08dc1c214a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8lP/58/qwjsTJhexmXZwe5U5KVMvFxdirAhb8cktDQNlz0lsxULD5pIwY+T6gJrLqERbncVcjLl6aPylmzBK4XeIgSR/NssVktWIORmw8DnS5sm1AWK2o/iksf6nRqdAkjsYJo4KAkOlJIzPTxJE3ihwsB1mdSgKfD8mkWL/PW4groVmdISYmTXlbBcJ/JNU3sphDWNC4lBvxqWLcKd56s7sc70vaxRWAiJwekSILWsITbUQIyyWqLsKr5NNlOLjqcfqAAq9yP1vRbtC7v4a0+zKahyhTvBj5nofy3EYRS0Jt8YPhmdrT6Rct+yfvGMSr2+cP1zR7oq5b7x0KXqyP+bEsr/uI29kiphu2cmc636x2N3TnXwSpZBWScoM1qigWegdNYJERsB32t+lDf2sPYPQUR6lFWC35IIREsx2zCQ7akR30R4+plfl90jXFFfGdWzPxCyaU9PY2EdHU8TgLtpv3X6x+5VgV6N9EEXD1IZzbJ7dFR2Bjkya64Qi0trhmcVKaH8Es152V/Z12kQQ1PMNYssUvp5MmNgrtCx/532tTO3vUfylglcUX6ToLP2rAdpQwxh52GXOaKMfzo2lB4toJ2sOR/tb2D3Iw58stmIV6tw/wPiRBVy+ZkTzu1hKVhGdR6zFtInxdXcbFTnPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(26005)(33716001)(6506007)(41300700001)(6666004)(9686003)(6512007)(316002)(66476007)(5660300002)(6916009)(66556008)(66946007)(82960400001)(8936002)(4326008)(8676002)(478600001)(38100700002)(2906002)(966005)(6486002)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M+44mSKuQuhxfpTNGkiQ45znJWXMjK9jgKN/URvBHEOSUQ1xN2AwBaEP6yBM?=
 =?us-ascii?Q?Zbei4FVgnYquPy1nw8JWWk5JWgGpqq535sxLK2v6RfQ5IWmEKDhIhyHxK60i?=
 =?us-ascii?Q?/YwBfwCR2C/RbMrAnK4uQYAABb41OjvnDVyD4O+XZK0nTDQZCGNefiWdOTrV?=
 =?us-ascii?Q?Z8MhzqobcZGrVyoT/U3hpRFxIyBkp3Apedg6/y95ix1b9qbZiDyMnYdTgYfC?=
 =?us-ascii?Q?ZabY2VCKDzXKOcTUH/h7cuqsJc6EBWy9H4MDF18NSsXdUd4ojMV5VSOx/E/w?=
 =?us-ascii?Q?/b2AWOkkKlmQI/c2RcP7kgxSJ9OjjmOEHemHWl6R/cI9I/uVlwuYguOhgJLw?=
 =?us-ascii?Q?RdoU1Bo3pD3BvaI2kyR6pXEVm3v6hj8yYO0WN1xXeLr7lOMMnkoRFOGJQ+hM?=
 =?us-ascii?Q?h1L0rkjRPtu/Wx3aeGtaBu1kHpJJjPBzmlVNTUbSEc2gW0IMtxhcc2OCY+mB?=
 =?us-ascii?Q?k4Uuv1VmTKD0KjAPe20gBIKHWeaJE5ojP0MLwivzAQvr2ixR6dTf6RkMKiPm?=
 =?us-ascii?Q?gFx4YwbFGuRI9ElagZVWci5/FDEHYqglXlO1JXjCtfoCV4qxHpPlSXYEro3p?=
 =?us-ascii?Q?7qu/zj2cBJXGHFqXiOncmS0tEqXw3AWK7dmt1r7yPmmrf12RDvy8rrGoPKjU?=
 =?us-ascii?Q?HM4HwP5qjqi6terl7UvqKUal4Ug1zYZi370eZmIj8zNMmZTJ2trpqVFWwyI0?=
 =?us-ascii?Q?dfzRKcnvAbq1aOK1craysKelQxPoQfKf/x/KgRuzDZxYktyMQZ2rKBv8bwjj?=
 =?us-ascii?Q?HE7KFOYGDwACyKL9yqGGH8SAW58aGxL5zJWxRV9UMs8kSCLjsK8BYK6k+tfq?=
 =?us-ascii?Q?0nIFi+dFlbiyPcu6xCLd9YV9OE3Cz/2qDoSxvJzaQoLlydW1FFq8BDVquf3v?=
 =?us-ascii?Q?1mGRWV4FCu98mNcPsDVT5UUmgt+UO00PUh5+P+NqnmtoEPQKiTzk5vMVZQbP?=
 =?us-ascii?Q?3n1Ab5oGFbYraEq0/HTxVEoSlFdwoj+uCIVp29McBEewUE3dPHOVs8pUqe/L?=
 =?us-ascii?Q?cI5PRwuM46/4a78hyQzZ7/IO9Ss72ORRiN9dnU5XIvdXh0tGxrzvcjf7flaG?=
 =?us-ascii?Q?yHslNUc3A/9ej0+EYmZCWFoZg5LjVeE9iF41qu1pKbaAfZFJKBaQx37Vp3mJ?=
 =?us-ascii?Q?mq5tRPe7NOVsqwxDu8JrUmZHywkRG837Lu2mQnAksl4fUoIDfSsSdkoK++Ip?=
 =?us-ascii?Q?wGadDb84siX6UZGi9mJAaADaihUEAxprCeRsGZhqGkwP2OeWUUgJ9Hh1ZzCo?=
 =?us-ascii?Q?J28Akm1c57AJ6HnIQ+hapqtItdzFaEqF+X3riRT6fvGuewYZq/pD4gSGOWhv?=
 =?us-ascii?Q?0zm71PJvSjnPVuv188V8gc6GWVz1UHYgDA/l4o9pVFe2+OBKn6BA3P8BKY1D?=
 =?us-ascii?Q?x2ja49dR27k7QEuep6xayGm91dHlABfabGAgz2pbtwZvy/oOBskBFXy+EoSr?=
 =?us-ascii?Q?jt53x6YYp8AfxbFhFn/VxGXS0hcapImH8+vVRZp8O3eSmjgkiheJ6qeCVMYQ?=
 =?us-ascii?Q?Yzrr7OqNF+ZuJwpeny91LfOndsRKDA/Z19anGypIVJrGzan0JHnqmv1mgQUx?=
 =?us-ascii?Q?D4tlID7+w1kKYRmK5WAz38UwhJlympFb5LQhk+dboKLJjs0Mq6+4CWYXC2dM?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77177325-4dfc-4305-0077-08dc1c214a3b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 14:40:49.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4CysYkMsaao+Xba6N7EngQo32TbPTvMlG4ysYIZxXJUcIyJ+uNzxIoUTjlS8La2/Mx6wolraZmZgRBBrlVkgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   95b5a09669edc6d3a5216ab8155a621ac28dd6ca
commit: 2b13d2f1be636addc928fef814e6fdad9cd2c21f [55/79] rtc: tps6594: add driver for TPS6594 PMIC RTC
:::::: branch date: 13 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-103-20240123 (https://download.01.org/0day-ci/archive/20240123/202401231704.rxvH4G5u-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401231704.rxvH4G5u-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-tps6594.c:442:2-9: line 442 is redundant because platform_get_irq() already prints an error

vim +442 drivers/rtc/rtc-tps6594.c

2b13d2f1be636a Esteban Blanc 2023-04-17  382  
2b13d2f1be636a Esteban Blanc 2023-04-17  383  static int tps6594_rtc_probe(struct platform_device *pdev)
2b13d2f1be636a Esteban Blanc 2023-04-17  384  {
2b13d2f1be636a Esteban Blanc 2023-04-17  385  	struct tps6594 *tps;
2b13d2f1be636a Esteban Blanc 2023-04-17  386  	struct rtc_device *rtc;
2b13d2f1be636a Esteban Blanc 2023-04-17  387  	int irq;
2b13d2f1be636a Esteban Blanc 2023-04-17  388  	int ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  389  
2b13d2f1be636a Esteban Blanc 2023-04-17  390  	tps = dev_get_drvdata(pdev->dev.parent);
2b13d2f1be636a Esteban Blanc 2023-04-17  391  
2b13d2f1be636a Esteban Blanc 2023-04-17  392  	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
2b13d2f1be636a Esteban Blanc 2023-04-17  393  	if (!rtc)
2b13d2f1be636a Esteban Blanc 2023-04-17  394  		return -ENOMEM;
2b13d2f1be636a Esteban Blanc 2023-04-17  395  
2b13d2f1be636a Esteban Blanc 2023-04-17  396  	rtc = devm_rtc_allocate_device(&pdev->dev);
2b13d2f1be636a Esteban Blanc 2023-04-17  397  	if (IS_ERR(rtc))
2b13d2f1be636a Esteban Blanc 2023-04-17  398  		return PTR_ERR(rtc);
2b13d2f1be636a Esteban Blanc 2023-04-17  399  
2b13d2f1be636a Esteban Blanc 2023-04-17  400  	/* Enable crystal oscillator */
2b13d2f1be636a Esteban Blanc 2023-04-17  401  	ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_2,
2b13d2f1be636a Esteban Blanc 2023-04-17  402  			      TPS6594_BIT_XTAL_EN);
2b13d2f1be636a Esteban Blanc 2023-04-17  403  	if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  404  		return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  405  
2b13d2f1be636a Esteban Blanc 2023-04-17  406  	ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
2b13d2f1be636a Esteban Blanc 2023-04-17  407  			       TPS6594_BIT_RUN);
2b13d2f1be636a Esteban Blanc 2023-04-17  408  	if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  409  		return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  410  	/* RTC not running */
2b13d2f1be636a Esteban Blanc 2023-04-17  411  	if (ret == 0) {
2b13d2f1be636a Esteban Blanc 2023-04-17  412  		/* Start rtc */
2b13d2f1be636a Esteban Blanc 2023-04-17  413  		ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
2b13d2f1be636a Esteban Blanc 2023-04-17  414  				      TPS6594_BIT_STOP_RTC);
2b13d2f1be636a Esteban Blanc 2023-04-17  415  		if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  416  			return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  417  
2b13d2f1be636a Esteban Blanc 2023-04-17  418  		mdelay(100);
2b13d2f1be636a Esteban Blanc 2023-04-17  419  
2b13d2f1be636a Esteban Blanc 2023-04-17  420  		/*
2b13d2f1be636a Esteban Blanc 2023-04-17  421  		 * RTC should be running now. Check if this is the case.
2b13d2f1be636a Esteban Blanc 2023-04-17  422  		 * If not it might be a missing oscillator.
2b13d2f1be636a Esteban Blanc 2023-04-17  423  		 */
2b13d2f1be636a Esteban Blanc 2023-04-17  424  		ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
2b13d2f1be636a Esteban Blanc 2023-04-17  425  				       TPS6594_BIT_RUN);
2b13d2f1be636a Esteban Blanc 2023-04-17  426  		if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  427  			return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  428  		if (ret == 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  429  			return -ENODEV;
2b13d2f1be636a Esteban Blanc 2023-04-17  430  
2b13d2f1be636a Esteban Blanc 2023-04-17  431  		/* Stop RTC until first call to `tps6594_rtc_set_time */
2b13d2f1be636a Esteban Blanc 2023-04-17  432  		ret = regmap_clear_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
2b13d2f1be636a Esteban Blanc 2023-04-17  433  					TPS6594_BIT_STOP_RTC);
2b13d2f1be636a Esteban Blanc 2023-04-17  434  		if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  435  			return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  436  	}
2b13d2f1be636a Esteban Blanc 2023-04-17  437  
2b13d2f1be636a Esteban Blanc 2023-04-17  438  	platform_set_drvdata(pdev, rtc);
2b13d2f1be636a Esteban Blanc 2023-04-17  439  
2b13d2f1be636a Esteban Blanc 2023-04-17  440  	irq = platform_get_irq_byname(pdev, TPS6594_IRQ_NAME_ALARM);
2b13d2f1be636a Esteban Blanc 2023-04-17  441  	if (irq < 0) {
2b13d2f1be636a Esteban Blanc 2023-04-17 @442  		dev_err(&pdev->dev, "Failed to get irq\n");
2b13d2f1be636a Esteban Blanc 2023-04-17  443  		return irq;
2b13d2f1be636a Esteban Blanc 2023-04-17  444  	}
2b13d2f1be636a Esteban Blanc 2023-04-17  445  
2b13d2f1be636a Esteban Blanc 2023-04-17  446  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
2b13d2f1be636a Esteban Blanc 2023-04-17  447  					tps6594_rtc_interrupt, IRQF_ONESHOT,
2b13d2f1be636a Esteban Blanc 2023-04-17  448  					TPS6594_IRQ_NAME_ALARM, &pdev->dev);
2b13d2f1be636a Esteban Blanc 2023-04-17  449  	if (ret < 0) {
2b13d2f1be636a Esteban Blanc 2023-04-17  450  		dev_err(&pdev->dev, "Failed to request_threaded_irq\n");
2b13d2f1be636a Esteban Blanc 2023-04-17  451  		return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  452  	}
2b13d2f1be636a Esteban Blanc 2023-04-17  453  
2b13d2f1be636a Esteban Blanc 2023-04-17  454  	rtc->ops = &tps6594_rtc_ops;
2b13d2f1be636a Esteban Blanc 2023-04-17  455  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
2b13d2f1be636a Esteban Blanc 2023-04-17  456  	rtc->range_max = RTC_TIMESTAMP_END_2099;
2b13d2f1be636a Esteban Blanc 2023-04-17  457  
2b13d2f1be636a Esteban Blanc 2023-04-17  458  	return devm_rtc_register_device(rtc);
2b13d2f1be636a Esteban Blanc 2023-04-17  459  }
2b13d2f1be636a Esteban Blanc 2023-04-17  460  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

