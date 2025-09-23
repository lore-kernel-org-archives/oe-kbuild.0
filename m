Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023122.outbound.protection.outlook.com [40.93.201.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A7314B64;
	Tue, 23 Sep 2025 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614110; cv=fail; b=Iud+BEeOkbuE5skBHyTg2pCPswBgbTtijWVU+Wt9XhOTjiJk2wgM0A9ep1c7o4i0kEaSUdvEK8MwOJufP4oNJta9Op3tz+epsDa3aaDVwBweDOXuLSrH2gNhABid7fdqD8ZyeShj8N8nnoBG5PKIgapgioJm23S+tgHqKzLD0ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614110; c=relaxed/simple;
	bh=52w4QP75wcykzo4G6SMTko+uFJWC0Rt1Ef1kl4cIrGA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=MDm9UNA8asE+mqvSNSJB9iRV3dnfrgnA68zKqlk5Th6QkGBSJ1owb2LAyUWak5pXM+tWoZynG7Z2LMhwiWavi8ZZpZH1bp5s1bYTn6fslADOAO4PiJdi20pscAe2At/MriOvKwbU+Smt5FDbrRCoTWrtNkQ4FwsjJYKyO1OOC/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=WSBlC0fI; arc=fail smtp.client-ip=40.93.201.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="WSBlC0fI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0Zb9doAIoGhxHkE3Q+DRfiwChoUQQwA4KTlhebrVOVXG8s1/srheUyRkmZbb7gnbCQV/7yBX2L+/PptavoTBluDFCTse4obaZLhU5ni++WTcl3N8/8UxuGktYYO06txPQI9CAl1dcKHZDwwXVChWkFCdUiTasFvytyDkFE5rkM3gVC4DDhuhXpOGA4qMvbs2HroB2NvRUVAvm+R6iJldYWaxxPgRgLtfxV6Dh+soH2CJTAE07YQ0C9OXlBePhHQcn2D77yKOX+iK6Hm8eyfy4IsM1NRvBsY5s3EE159fkNshu9IRsmvTybJw68rhKKomAJIjHPln65YVyrRCsWoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6xNMGdsi2igO4i51Rqt+XWwj2S7b4F1/MtTX6vHZ2g=;
 b=BJIpKdUgpEsIwp0ahpXB+VyT7mi1zNIMWE2Y4NX8GivLQkGB1W1W7nYxme+gsnhasR756ie4srr6vQpmq6YquWkoXYUhrjxSbeYzDdI0XlEgWqUCB9+fBHCamBvO5czzAVXFt9QYuHljvKNsJov6+sZAsD0d+cAx5mWy0asCYj7we8XHQ2e/EXAcmJalGTnNY4PLZ+sk+QKjtTlnut9KaiOqHY1TneIOMlUh+oKXpKzyKglL5WyaCJlmhE6s1zwnNq4KrZjzARerumafWomhgPsMJz9snz39UubnVLcbXSSYmr9IUn0VkxAU9x4sJ62pbRUtIuXzIFA5WiTWqbCKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6xNMGdsi2igO4i51Rqt+XWwj2S7b4F1/MtTX6vHZ2g=;
 b=WSBlC0fIsp48b2bbNoo+7ss4YL0QMFQxyi7a6po/1OOeLQ1XBlQIGMcvJAPnW8hBP7GbTHWVAy32TBUfZ+z1cszbk6xkBfw8TZMawf+brw9JdnmmXh/t9It7dsetKgmTWcj66sYhVVZBPXEFpKAs6ImdRbP8qgMK70d5soCoXzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SJ0PR01MB7377.prod.exchangelabs.com (2603:10b6:a03:3e5::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Tue, 23 Sep 2025 07:55:05 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 07:55:04 +0000
Date: Tue, 23 Sep 2025 00:55:01 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
cc: oe-kbuild@lists.linux.dev, Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
    lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
In-Reply-To: <202509231223.gZsX6Eio-lkp@intel.com>
Message-ID: <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
References: <202509231223.gZsX6Eio-lkp@intel.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: MW4PR04CA0187.namprd04.prod.outlook.com
 (2603:10b6:303:86::12) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SJ0PR01MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d38de4-ce72-438f-e7a2-08ddfa7681b6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9jIABs8NIoPbY5xeWUB+pEBn/29cTrpDtH7vF2lOpFNmn0B4j27sErj1lE2Q?=
 =?us-ascii?Q?Ti0J4A0OWFgEQgg1+VMlVrCEUhA7Fw8EQPVnN2qUUjzk61TYOY7B6FcII87k?=
 =?us-ascii?Q?izFyGxjJ7kOS7sGomUTqEnRDz7DLfKz43MP90Dn01Eg4JmonMsWgJHXEkeuD?=
 =?us-ascii?Q?uGs2drhJENw/r7zTgjvc4xE9hw21efF0vv7d/NQN4TrMAB/ebb6/GevsSAEV?=
 =?us-ascii?Q?nPi4R8erCny9KjhmtWcrc1NcTb60YwwZa25C0VEkUGciaGOIrPuERL07VOBr?=
 =?us-ascii?Q?mqvm1NiNEd+9IDTT0/I+PqoHfa0iO90vlmGg3Zxl+piXsz/RutUwVKw9tldR?=
 =?us-ascii?Q?Agwh6b2n3l+Mst+hu/3GFapLs5JtsIXrRCmPHuxPXET7Zh1371Ou5r27r0+u?=
 =?us-ascii?Q?YZSN//GGdGxy7E4bErXD3jgGa2FsaGzBqvCpA/Zc8lNj/i5jrEyWki+QQOyL?=
 =?us-ascii?Q?7l+b4Br1Ca6haa/QGhIvHOEjxmKSYQazh4edjjAf4gjJYUZZf0mUlMzlQqgX?=
 =?us-ascii?Q?0wnvG70C2PEToq0JCROVsiQkBkHWI/JLsKO8KStvktaUuSc88Q2uX/nsTIjk?=
 =?us-ascii?Q?QzRUVthqn6Y2UfHyxLU7T+znl6bRp54fnhNpdZneGysun6Tp4VjjIjMF5M2p?=
 =?us-ascii?Q?YCZ6WfkR1DGI3pugCQGlx4rr02Ckq3l1c9zGjm8+aYpCJ3ubG/OP8C888DHZ?=
 =?us-ascii?Q?XAdW23FlGORIrD6mf65zMputSEq+Vf0MCe+z6W/oph0PygtsrXp5RhiFXx0T?=
 =?us-ascii?Q?ftiRmCroV5XuNWGBvhylnUGuOR/wiBPl+U7nbKtqcZB3exQI+22GBQlDJaL2?=
 =?us-ascii?Q?f387P13QivvmEbzeEef8sWkItpwMlnjAlaDmrAEPH2DiqHD3LyDMUGJtwEoX?=
 =?us-ascii?Q?2vQ7XUNiIKH6tdvc6KkuWNa7qcyfMyN7MqOvgzPE9G2TotUFTPW/waAID62+?=
 =?us-ascii?Q?bm5eD29xK8B2aE5tFY0UekgWh1UUmnrCE6NWGF7XMulPpZB75V6UuC5xdcsQ?=
 =?us-ascii?Q?A+000CYDDBTMq8lDyHqryQlISXnExmI/IVwU032x74gRPzyPY7TspuxzxT/+?=
 =?us-ascii?Q?SgEsP/7Qi7dsseSBLzb5jTcb7D9OqUu3oeLvAWPMjVH4qg91J9kRhLtC6HEy?=
 =?us-ascii?Q?BlhIyniLMHr0gLfI+d4LY21Cpuwd/JjRt8CCaztJdyWEv3UJxE+CVSzof2pD?=
 =?us-ascii?Q?ZEJ9KPxAUeqDWC2pTq0r9swRoa7O3qo5zTY1W9ZolToAYiU8jDWAH4e/aee0?=
 =?us-ascii?Q?8d8S97lQgBxAg/Do05frsSRRw1Q3QE1iRC3FdFlrCGX/GKXzgTcmFS5SKjn+?=
 =?us-ascii?Q?rnW9g8MZi1I7gN6VuF2Zasd0rlK8zpJ4Ku5gPl+N2NAtMk1yO9UTLzpMgT/A?=
 =?us-ascii?Q?5WJQTKbtCiya+N6CGX9E7uPXBJEKRNaxijFGm0uwsqt9PzDYvmRDi9F+zeze?=
 =?us-ascii?Q?wlyzD1ammXnDQlXzBA8ch7Cn/D0pQkZBzWAdBGAeH+1cLrV79MZiIpJN326m?=
 =?us-ascii?Q?jv/8rGt+fXpO0xI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y+W5uELzKFjhok7TMrBeaFsVYsV0CaLFk3o6F6VwE4+g9o8mrolYEIk4asY8?=
 =?us-ascii?Q?PRme17UZRkfCLh1cltVCb7zegp4KMqviXNi/6DaCv8W2iA1amZupU09dC3o9?=
 =?us-ascii?Q?UAHItZlY1OByKaeuZCloFTGoHRxhLx60VxlCYcCLGJMHihDA9e7zaibwka6h?=
 =?us-ascii?Q?6etcUwXeIOJrvxWsxlR71FISkVoIxqr+hB0vD72gAD26LtLCYsTujk+2V6ri?=
 =?us-ascii?Q?C2DKUvzjxS47NPQjcBLTAQruGmog4MZD2fuWi43y3j+In9OlQGI2Wt21fgwZ?=
 =?us-ascii?Q?oWzqayBv98bbnbpnsdm28HnkTsyPounkk+V4ZYNcSR9xgSyMCfRMvWR+CODt?=
 =?us-ascii?Q?XYhPkMAcT6M1GY3yKIGHB5fwk9dqqy1CPNl7zISzpSSjgE8W0hsQbERJW3Hp?=
 =?us-ascii?Q?YcFbU9nM+jOzx2Acqozbc2MQn4xm7o46gA38T8CBf/dT1TBSnYlMDFgtwTbR?=
 =?us-ascii?Q?83NUhMGIB6XHjIfD5946Povpwj8Mdajm3hSh19jueFevtVHuN040sCNdM8r2?=
 =?us-ascii?Q?/SdODnyo32Ld/eD1N9NSsBPbcheqGYwl3ZkT5I4FToLJ8lZA+/4lcVvV+3Tj?=
 =?us-ascii?Q?IzmMxeszM0mY+cwztgtzAadj3/U9BJEa3fflhf5KMyOyzRbLgj88iVf5mtHr?=
 =?us-ascii?Q?zi2w8gZQawW7755zON5/QLxmwmWSzfpkX3OVe/tVlpfi5VjgsH3pgRH9t+M6?=
 =?us-ascii?Q?bRwsUoWoG+zg9Nti39lFaFR1e4dPtNbGcUiZZOLLhAlSBJCKp7ORlBdHuDPz?=
 =?us-ascii?Q?Y+HBlpHP3Wq0EF1AZYdTQYyKiLMImpEn/0hRDMXcg+ChdDpeoL5MbHyBoTZ+?=
 =?us-ascii?Q?gaccWaWKu3GTZZ7zedqkK27yrd3/m43j9GGrhTxwyENCRUy5dQ79BluPdCpO?=
 =?us-ascii?Q?ET2wH8OMZuNYKOMMT/9Z0LKVISnbBLHXi54BVsIBD9w+orafNgUdxqRiooGt?=
 =?us-ascii?Q?RuJIo/yEYg5vIGfHXnycUVSSG9vmrPGBnx8HY6MFM0sRuef3vpmXukOhFNv8?=
 =?us-ascii?Q?0cZYL6FPftfZTvmX+WdtWNLsDCV0F+dab0goecOApWh2OCp013CSXxlw7F3X?=
 =?us-ascii?Q?XF+kRVCjQZVHR+p2rzVOoL9nMPKRdKB4Ev8q07obPHqdVxwa244Ng38WhtBu?=
 =?us-ascii?Q?sSXoFHjqVxle3eGjUoRt1NG0amalh/6IoVrCF67QImQsML4Vg9k2UE/ymGT8?=
 =?us-ascii?Q?2g2pUbBa7HaYEOpnSfDHocu2GAGVmRP54HARGkVu/mTQ+mKkEj+ZC2K2MNOG?=
 =?us-ascii?Q?OdfkgrWZL2UIG8b3iAD6KE4K1q3TxfrcFoQDoy5aBaDla11OKXRzcsTCKpz0?=
 =?us-ascii?Q?aR2N+9KBJggkYgi7rQb3C1iDZXBKe0godErz07VJSUFxdwG18vmuNV0fMOBg?=
 =?us-ascii?Q?bJI6d2P7EVwTpO0K96Mfln4KnlLHO+oJ/4bCDOONKGlGRrID3U5L3YciE/vu?=
 =?us-ascii?Q?T8/VXkVH9krbG3BJNQlZeJCfvmEzUJGH1w7BAWQRNAP83sLGLK4y+F6j6Vga?=
 =?us-ascii?Q?WDRH8brV904gNSSDrsPbSFRugJtrwIN29Bs10zO9/X3+3NBmtwTpe0nBavpX?=
 =?us-ascii?Q?pHYdOO9iBTwUaYwk0KxIY8h4WAP+57DjMgrYDszzave8hyUfuMXxj4gUB679?=
 =?us-ascii?Q?MchE3LAVq92CxUf+wvcpbfA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d38de4-ce72-438f-e7a2-08ddfa7681b6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 07:55:04.8251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2ViWg9uosjUz/GMJoaWtSzv40mFvdlHO0zXB5x2SI6f8h+ypRL1DsPhlO8F/QaI0HnOmsULe+KbFLim33bLG8RsC091owu/x2y1HAvZ/U2iyDw31w1yQpPzw16FHQfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7377



Hi Will,

That's cleary a bug and I don't know how I missed it.
I can submit a new version or a separate patch to fix it in the morning.
Which one do you prefer?

Cheers, Ilkka


On Tue, 23 Sep 2025, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
> head:   6d2f913fda5683fbd4c3580262e10386c1263dfb
> commit: 71396cfac97d0249fa7d8dcc8e649b6ba4c090e4 [5/28] perf/dwc_pcie: Support counting multiple lane events in parallel
> config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231223.gZsX6Eio-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509231223.gZsX6Eio-lkp@intel.com/
>
> smatch warnings:
> drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
>
> vim +/time_event +418 drivers/perf/dwc_pcie_pmu.c
>
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  401  static int dwc_pcie_pmu_validate_group(struct perf_event *event)
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  402  {
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  403  	struct perf_event *sibling, *leader = event->group_leader;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  404  	DECLARE_BITMAP(val_lane_events, 2 * DWC_PCIE_LANE_MAX_EVENTS_PER_GROUP);
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  405  	bool time_event;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  406  	int type;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  407
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  408  	type = DWC_PCIE_EVENT_TYPE(leader);
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  409  	if (type == DWC_PCIE_TIME_BASE_EVENT)
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  410  		time_event = true;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  411  	else
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  412  		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  413  			return -ENOSPC;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  414
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  415  	for_each_sibling_event(sibling, leader) {
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  416  		type = DWC_PCIE_EVENT_TYPE(sibling);
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  417  		if (type == DWC_PCIE_TIME_BASE_EVENT) {
> 71396cfac97d02 Ilkka Koskinen 2025-08-28 @418  			if (time_event)
>
> time_event is never set to false.  I really encourage developers to
> use CONFIG_INIT_STACK_ALL_PATTERN=y for testing.  (Use
> CONFIG_INIT_STACK_ALL_ZERO for production obviously).
>
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  419  				return -ENOSPC;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  420
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  421  			time_event = true;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  422  			continue;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  423  		}
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  424
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  425  		if (dwc_pcie_pmu_validate_add_lane_event(sibling, val_lane_events))
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  426  			return -ENOSPC;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  427  	}
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  428
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  429  	return 0;
> 71396cfac97d02 Ilkka Koskinen 2025-08-28  430  }
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
