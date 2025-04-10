Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9051A2390;
	Thu, 10 Apr 2025 02:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252076; cv=fail; b=Myb0YNh2NauGbprTqxcb2/2JoL+LGs3u3SYwmAUrbiT3X+QhAlIYU/AiCVefrdRQ5wTXM/FuPZdh308PFxS59kMVWWPi+9vZJN4P0m+VstDsIg6hiaeTUk2JGaTBj2dDCwFSx4e4Hx3Zf87EAHMrTMDkIzv3EirSxynk10uDjH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252076; c=relaxed/simple;
	bh=M9ORaJiSVSrqZ87c7WGzx/RIjJVoGNn3BngzBCLxQRY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nhAnREwrgI4h1bMjTz/66zC8zBDoJ8ZQKAOpgdyB30zFPp/6Hs2JEH7R+jLRmpf1K+2t54oO0PxF7QrvQV1/7v1pOn6iKdTJi7v6/W6JUMVE6jlxOtlCIEKGGziv6F2v3kMFZk4Xc352PWGSSSu5dpybIeQNzYL9DGHk1rITJq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=apZ844wH; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="apZ844wH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXrp2nKbMAVz3/G3difi176AjTcMT0OGEq5o8x6rzcsfjewlUv6q4g6pGXHkyOYGfLcommJAuwaOYfqF2G1rmaKYbHSAauGih8ZjAnjIHZsbSEcoKte2v7vVsRW+WQCyiAiLRQjOIQQrA+1fdpyuFNnFryRjbW9rDJWU6EiFmQy1PI26DTOZndx1/YSgdLWlaV6od4CygV3ZhQQdC4xHECvRrDYgws3T9i/zVLYkVjbHlMjDF4vDdG7szhA470oUw1bvRBio4BXwirkSkrWiNjUi6rjvWi2VHgui/L4pAOUwtCrFeRld8J9NI06Dg2kft3H548/RljLzNuMBMH/llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBTaryJgazCWRo/yg2GyD9vm6v/6QlYSw9c0nMtPrJ8=;
 b=pkTRK/B9B6aBiy/9KhMItL/NXEtiaLXG0h2UntZYVi5jisbeamH9Y5U3AZF/4a0VmoQjT8H1pcbrQl1F0Tb5yHGh18CFx2J7Dso6k9PM0GEERkbDsN6ik9kj9nmIK2rnM0txJzNPS/Pc6hWgZgUVHoZmDdfzsKqa2NVQtTG4dZdyvjitUvkILWKBZ16EilC+WatoHhE3++0CDdYFq/QSZyiGM7WjxPHiPRCRkUtRPp4yi0me1dGW2MaqWIj4Ejq0gGs4+nkapxbO3VR6zCyY+k2kOZMAujcF76uvlUe/h2FdQi2oLbfsLMx02aUo6WEDH5Gj5mYhUuyklw2wtbAOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBTaryJgazCWRo/yg2GyD9vm6v/6QlYSw9c0nMtPrJ8=;
 b=apZ844wH4VFMjEm+Ti+wZNj4CIgn43mqPY7Wzcd1kjH+1lESgpL/GPekEiJ9QYyy6RWic7GR4mcvHoqXX6Pdx6n5ZWn4rqV+hdLm450CTWZHQVvUbaZto+3i3udx1rWahAFutYLYDEBsecNtTE9HO7jb2gSu0ZjE3ijw94VCoFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7215.jpnprd01.prod.outlook.com
 (2603:1096:604:148::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 02:27:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 02:27:23 +0000
Message-ID: <87jz7slpit.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [morimoto:sound-msiof-2025-03-26 21/24] sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to 'PTR_ERR'
In-Reply-To: <42101bfa-e3e7-4ae0-9c9e-c37593b8ece9@stanley.mountain>
References: <42101bfa-e3e7-4ae0-9c9e-c37593b8ece9@stanley.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 10 Apr 2025 02:27:23 +0000
X-ClientProxiedBy: TYCPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:3::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf79572-a522-450f-d7ea-08dd77d73a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w2wRIh42GUtXVCq+dsz3AuWe24NPdHTOQTjPU5Kcly0swWx/hvg3lleiNguH?=
 =?us-ascii?Q?zra5so5pS1mNbLR52P4g4CXTvmqBHgYPzO/ODiR9L/dMTxN51DalyYtEB47a?=
 =?us-ascii?Q?YgRQoanFDST0uwVLNxDq1Uu5uomuq04OqyA0c11PuPdJEqsDm/bLzFqhX7bD?=
 =?us-ascii?Q?OHlWB8oMWu/OB+KCTSFheraisyvkNG6LC8J7yrUY6VnuBl/OotuDZa0383nQ?=
 =?us-ascii?Q?GWmMHCKADgg5NZ+5ED3PY6Ku1Kd+RYqH0S0f9jbWv9v8BBtYD0H4wOtu/YXB?=
 =?us-ascii?Q?o31XXVwvzc+pQyC9Me6k7CkRIgliS0sUeNVWS2nPVlm5TNc4KwHeNdAnOeiP?=
 =?us-ascii?Q?rA+IDqC5t+aF+Agc52myTVw02uGXvbN0D0UPMlRtlqkuSWiFH+OwzUQrM/CY?=
 =?us-ascii?Q?jHlPkSS2978CrsyTJaqWzvSfrT2kzonHCoTK3+AQrgJRK/e6wZcuejNlpHJj?=
 =?us-ascii?Q?MdeZ9ae4RZUP4rVWrrePI0zB+zl2XXpQ5RLlDwXfSB7lVkZnPrjDlV0aSK2D?=
 =?us-ascii?Q?FSzgXj6vUg9PqFyKKDI6NIcHRFYWblN1kZbTDUiaGpGvrdkxGDyzvcQXdr6p?=
 =?us-ascii?Q?oqMTs7upcmNWBJelenNb/xcOjSAOANBY5GC00t5DZ9ItRybr8pz6ckBbx3Ry?=
 =?us-ascii?Q?8nzZ5AmnLJKflGgJby82p70KQhghbgwfOdcMV9tOcA14ffYP0INxrp7FOOiL?=
 =?us-ascii?Q?cJzD36gHVg64BgssYoAPBVaV2qm3pxz0rbUU/4h0mioy9kbG8Kh/ZnYGTyD/?=
 =?us-ascii?Q?B9ZMsmAedt6Co67+XiNz92j2h6pnRG4aKBmuwIgH+ae8xSy65aIRq08Cjsv5?=
 =?us-ascii?Q?XXFMUXWsPHjas9oyLaoxWFizpZMSDwFGbICpk29H44DM6qb8OFq5j0iqYYyw?=
 =?us-ascii?Q?K8UTDSiULQP2wjgqjXM9l7Ou3F6T8kb0ag4OhQt5OT73JOCbOkz+XgvIgrpi?=
 =?us-ascii?Q?J2BB4Mj5+z/xR9g792Vdk2OsfEyYLgzCE2Q7GcWjMdSiAE3mDPbCgjfK1jY2?=
 =?us-ascii?Q?ZTAkbupBczb6bTErcsPvDEIkhm9NLEFGP+kt1YQa/GVAk+wOJASXWmJ+EfIX?=
 =?us-ascii?Q?1HNwxuQe7tD8cwsWHzpf54d0+D0S9Dh5G7TZdj8r04V5S93OLVfS5hSQ5c78?=
 =?us-ascii?Q?PhAu92iZamAcW/V7BCTqPaqE28/GSaESNbMPLQcljRob8QazW61gvRMsxekK?=
 =?us-ascii?Q?nGBnAQABdT25fKvKbUVGfpZaCzvqdJhTRJVqbE2joLJ+joU38DLYbQHORnoU?=
 =?us-ascii?Q?hXNOMOoORJnfa9RMHTFrm0Z8VnLweA5SQyjb+JmT+0MtW45JbmvuXFgyrSya?=
 =?us-ascii?Q?jOUM6WA8Jgtg/W6VGe2jGjOpVtayl7nQ/Uq35Lvu7dIzoXGCOaML5PvlyZEw?=
 =?us-ascii?Q?LkDVw10VbHEYruV8YOeHgZBVcLkxgmjr2o2mht8Ur6IeJVJRLw4rkA/PPm6P?=
 =?us-ascii?Q?ZJPcTkbADGyihmYwXoqYb9j1xEObyL9lR+0/H9EjLZ67cIN2G61W4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?erfz/RFQjd9guwXyS7A0qd4NkGnSTRF8BWcD9dSrnI1l4mkdnx34CaCUk4oW?=
 =?us-ascii?Q?jA+lPVjEUB8hAVTWL6S14wfDqiOHKv79uSDVxZxAGNG+pvPIEa2l+C8rLDZW?=
 =?us-ascii?Q?rYte9W4eCUw1lZo6+lT0+IV6cEPEURZaxHrHcWNMaQYnAbCx/dJHjVoowHBg?=
 =?us-ascii?Q?3Vp/+vtYgRufzcvlk9x99JMAHneMzkp4pYdO/2hRaKZduZmE7mFq5Af66j/u?=
 =?us-ascii?Q?JJnCxPpzaZ95+FLyNvhuQp7qZzMXpYrv196NshQv0xefPTE0llE+OGh3qz2T?=
 =?us-ascii?Q?qm8YlvkKpvovkqsf69l0Z3SlAniWcTFAUeOmgMcME4a+bW5QvwjBLbGxUJR1?=
 =?us-ascii?Q?DQ5l5++uXhE6FP18yFERF5sDqcSAhdPsnGN8mtABecPDjGIq57cMh0DiHqCj?=
 =?us-ascii?Q?eUHCdumcIqBJD912//Q08QubJR44xpwbhUre71GeDgzmTzAt6xgFJCTmG76D?=
 =?us-ascii?Q?Zz6qe2EKnwbtoOMHDxXt95zXnGZi+SS7NzSG20c+keGPNF5R0TEHNS8QkTHk?=
 =?us-ascii?Q?dcmHhuzhJ+fVC3qBVSnXNxcxjoUdBgr+/8w3wf44zpR+bYS6qKNSqHPhVQah?=
 =?us-ascii?Q?OlcF7Mx2rKlzZZmT8uzGwxP2W88ef3/TERD3e98EBK/zhyN0BUDAQvVNGrb8?=
 =?us-ascii?Q?Ids2PKmsY/jnyc9deUvvVzg7noPg8QeRZXmF7WWORqJ1EI/E/LE1BwBuAqBT?=
 =?us-ascii?Q?0GXFLRdooET4N+WJf0il/QwNOHHjwTOir7ErjWfFMbIArmQqd6OTmbQSE/IK?=
 =?us-ascii?Q?IBK5kw5L1aLp0Spapna3Y4MKeLL/5Olb3uoy7GuUKdliC4nB7yT2VfXeAA83?=
 =?us-ascii?Q?/vUqXcfouSXm5RI/nK5eIQB99nc02ZhhlqYaPa25Pa+AGI3B9drh3FJ0e8CI?=
 =?us-ascii?Q?18uJNKXBvuOOtkgIbGrjkOtssF19gBMaq/4nDVuXWUfjreccFegD+nrqQOGw?=
 =?us-ascii?Q?hZbDXtBWzPK1A0p2nsyPX2Hs47uuuHlVgy67oNpnI7eXmZx7pEaVP5YfGFqE?=
 =?us-ascii?Q?yKnGhz41ytBSMa1mhLCThdP7qApWsGtD6EwHWt1Rbxx8/s5eM9BmQ/84IzSH?=
 =?us-ascii?Q?XTORaCtv70G48a46+24+k5Vim/dpLV3w8++cANotzGl0ERbaHzsYybcwOIP2?=
 =?us-ascii?Q?js9mo+9YwRXe25ZDNtP0e4+YoGhZIJpL5wgl67UpRiveoBLkHUCfXGDxd2gb?=
 =?us-ascii?Q?Y9nEd5cYtrd6eYl54Xbe1bOV2ONc0q0rpRBwNo4ioIIoHSOOowUOesNNp+yr?=
 =?us-ascii?Q?eLJZ+35NdbjYU9Pfyiz0ar7vAjeihkyWqeNUigTRK68jhfzSqwOzkmuRSGar?=
 =?us-ascii?Q?lz0CPZ6Tiz4ZYlvRwLlHBIMqGcj+zfzQK8F3p4eZhiYoHesr+8W30tDj+YX2?=
 =?us-ascii?Q?H8xmus/KQMigtR7X6qaWDisz3hNpCbNYmgE1UXpiS4uqlBoqDodRyLtYubvV?=
 =?us-ascii?Q?evXQib6RxxIC7drkfcD8TsuC0O9f5AF4l3zxx8e1gDVk9ycumEM8AL+XMxeG?=
 =?us-ascii?Q?RRblpMor4S2NP8bxQsTBzPsvwaBEbf6nFJkOMEZseMg6+tXb4qCcWbB3KSKI?=
 =?us-ascii?Q?rmJDAidj4o/JkIxfURqrNG/R8lkDXOqqPUM9Jy2PZa6FZxVaKjKo+KuZq+5n?=
 =?us-ascii?Q?cTkEGuGWVs7RVtOfpeGV+SA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf79572-a522-450f-d7ea-08dd77d73a16
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 02:27:23.4233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wlf5ErVdfxt+0MS/DDqAWLbPy7UhAALgrSa1IXmhKDEplaG3AoJqzqTwJQgjqv5zzGjT8//DAxbLFg2/YEFOmdz9PF9yw0Ip7/nuVTqHHv0k9XvgKWpIKT5cozxyshZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7215


Hi Dan

> adf5f819442084e Kuninori Morimoto 2025-03-24  356  static int msiof_open(struct snd_soc_component *component,
> adf5f819442084e Kuninori Morimoto 2025-03-24  357  		      struct snd_pcm_substream *substream)
> adf5f819442084e Kuninori Morimoto 2025-03-24  358  {
> adf5f819442084e Kuninori Morimoto 2025-03-24  359  	struct device *dev = component->dev;
> adf5f819442084e Kuninori Morimoto 2025-03-24  360  	struct dma_chan *chan;
> adf5f819442084e Kuninori Morimoto 2025-03-24  361  	static const char *dma_names[] = {"rx", "tx"};
> adf5f819442084e Kuninori Morimoto 2025-03-24  362  	int is_play = msiof_is_play(substream);
> adf5f819442084e Kuninori Morimoto 2025-03-24  363  	int ret;
> adf5f819442084e Kuninori Morimoto 2025-03-24  364  
> adf5f819442084e Kuninori Morimoto 2025-03-24  365  	chan = of_dma_request_slave_channel(dev->of_node, dma_names[is_play]);
> adf5f819442084e Kuninori Morimoto 2025-03-24  366  	if (IS_ERR_OR_NULL(chan))
> 
> of_dma_request_slave_channel() can't return NULL, but the zero-day bot
> doesn't do cross function analysis and the IS_ERR_OR_NULL() check tricks
> Smatch into thinking "chan" can be NULL.

Thank you for pointing it.
Will fix in v2 patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
