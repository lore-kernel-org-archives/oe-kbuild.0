Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE5929A2;
	Mon,  4 Aug 2025 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754290920; cv=fail; b=WBxy1hZ/1vzX+Xa9jFoOlM/NCwu3xXrRRhrVwdXYlhKNcfnjkswMFtCFoh+BBzBwjK6zmT2UoZ7iyTTtXQbICu9O2ItpQM+a/7d5TknS/ISA4dgGoVPx4eXNBtXBLhZiiJ4uwc/En3PwRcaaFI0b3+ade3xTiu3qgBndA9OGIXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754290920; c=relaxed/simple;
	bh=sO6hzyo9KBQv9lgktFxhJFhgyKCWZWvUkuGm/TzSu7Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfLNrQgrl3QHt5Yn4rpNnR4WaIg8nOINEP2a8T+U1S4NSar2tho7d1eYc2/GthW1qZ8TJ2nCrEliqKEI/LK92Q3S910sSVBCpPhoJSMdl79mxDuUNZF17O4GcPDNp7Mweq34C8vbXAVB5HWVaZMh8goLBlu33CXEUvrBOSH3JAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d13WC3jt; arc=fail smtp.client-ip=40.107.96.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d13WC3jt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8sjB+UT7fu3TcdCTHyVbKKG05A5OGqmSvA93yZHHBjUyo+azBfC37/NzyVTci3+Mvh62c3mD++AzUUeBGBbo8Aaof9O4fIv7bYXAzHvOcxMwRg8io1QooWPmvsA0lSf1TOfuxki118n7/P0od/y71nF5sm7YGydKmMvP5uE/+XAJqubycVXcpmcLFzOEzUoARuWXlSRsUaulkvOO5TzhCt3S+ZeIUPvcZs3ULY2Nsc9/sZHRMzrIVcxUM2YHDcLqp9NtBjAUN6xCnGdvd/wnbK1yp706G2hlu2xvnzxhLrK1nPZU8r0YdZ8K9zX1phj5oV124pSIcPsXivubLCcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgK3HY+g+O3LqB8B4ZBaUNyU3H9iLLIT9B5fu777Nl4=;
 b=DEJ0WqdwpvHFdrMyhpnE/TW3ITmuk1Whem6OiqucOaGAoH9p7HKD2jTgokkwr1AOQ+6TkxYCchb30P6Fr8jc94AASR7aF8nxbGOMUPqqeZlFNW0CBznF+inXSkVY/QpHcKiGThs2fweFggqnEcr3BCEUXqPPxmywxUmJRU10W8B53Y2Hmx+zd0V7Gg0qEfkAsng899BvcI6ZbAZv/AWsNniAsTwojq2XRU8BOOPXCjUe1h/NwLRAbV9Dwf8+LUWSVOmsLW5F1zee5BoOBYs6MS8INUpov57LuvwiGGq7RuebzS8xUHPiErOJ87W6cO4JttPnkjntYasH0SwOSdxZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgK3HY+g+O3LqB8B4ZBaUNyU3H9iLLIT9B5fu777Nl4=;
 b=d13WC3jt9v0TWS49Xh7OLt3f0Ec0P3P/v3xL3A4qGA9RaBQiOFbU/46LumQ7vSIPNlvaXZ1uhjZEbqFIZFmtxTmIFleTqFY5eD3or73q92D6Zk4tqxs1L/4q2UZkCKqlKKDaZ+jAJgbnRHx1Cvsa+NpEGBZmcw20F+0vUHeRFeuMtLugwdSSmRk/Vu0qmLmyGNQ/lT3LCfjT5ndmhNrQQkmvp7fJJ6jPMmBtKLT2kHvMhIbb9BOD8N03QvCCQ62Au0dAr+tMjgXYc57yfu93kaRPPAC7BPJ/mRVXNAwYYMAcL6TlDOrpc++L6kYmfsu7JXVYJBvRJyuK9vHeAUOhog==
Received: from DM6PR08CA0055.namprd08.prod.outlook.com (2603:10b6:5:1e0::29)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 07:01:54 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::47) by DM6PR08CA0055.outlook.office365.com
 (2603:10b6:5:1e0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Mon,
 4 Aug 2025 07:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 07:01:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 00:01:18 -0700
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 00:01:16 -0700
Date: Mon, 4 Aug 2025 10:01:11 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [leon-rdma:dmabuf-vfio 20/26] drivers/pci/p2pdma.c:378
 pci_p2pdma_add_resource() error: uninitialized symbol 'mem'.
Message-ID: <20250804070111.GS402218@unreal>
References: <f3fe4ecf-8532-4356-8c01-3166e79d4c21@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f3fe4ecf-8532-4356-8c01-3166e79d4c21@suswa.mountain>
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faa8114-418c-443a-9f20-08ddd324cb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6tNX81tXJSXPi0ZZF73Trsl7K66j22XLWoVSkahZTfgqXuDB2xgRelsf44h+?=
 =?us-ascii?Q?g85iCGx2mmoBtiCSdSTVbB0sTo7FZIFtkFNXMxGsoy2nJpgTiyjsMEqBYa9c?=
 =?us-ascii?Q?DGoimQBOuU94C49d4rMcE3ADEPZk/7QmTOBRnrOIkWK4Na/drqC0XMtcvK5e?=
 =?us-ascii?Q?dWBYwgEj/UX9qYtWNCdEhvbXwWau4KUqhtypJIpPruXU4Ajv2rxRUweGPxDm?=
 =?us-ascii?Q?m+zO0+RkK3YZZgaijiTJxGpaM0ky26CEhQSZjO4N6ual05Dt/81uKm1cMymD?=
 =?us-ascii?Q?g+JgrOvJVrZBT5Pg/NS+Oks0xVLoyWXRlTMouVjQ9pYmyh6eAA403k/iND8g?=
 =?us-ascii?Q?Lg9fuvyWmXX0rM/FArQlEbvzCZT8kOTxFoqGrLSbhjsioJ8x0k5m1cvrSHuv?=
 =?us-ascii?Q?dxUy9EnjwQcnAHlthlFlotFyPKPrBYlSdFnj1erYXUR6kA38isQsemCGi+PJ?=
 =?us-ascii?Q?tspw1/X4ucDQI1bPI5B7FqpU5s/u3/WTJtg393F/S0zuGphNQZQ4VzxImhMt?=
 =?us-ascii?Q?z1dGAdjaM0XFzUhQ/Yq3ImfyNGB0nZj8SGElpXDDCw7bQjgM6a/xEEEy+e6I?=
 =?us-ascii?Q?+evtWByq4BZQKKhfn6NW2/9PRHiw+MXEHnGfDfb5KYesikBikvAzmm7+n8Wl?=
 =?us-ascii?Q?qy69JsvRgnGPx6Sgu9huv9brXEiaMQ+u9BplOUF/n9uEFxyeWf/0+IS8ySzN?=
 =?us-ascii?Q?bjmNOu3LIBrgaFe/TW/Z/Jo3/jSgg+0r1WG21xfUGoC6FP2IzIgi8JBdQF0V?=
 =?us-ascii?Q?Q3JnXTChMSF71W71lGR61Ju/BChxgypptGzQROi9CPtcJO7rZbrIih8gideZ?=
 =?us-ascii?Q?CDRLbe29P3rgYjeIeIvqR8eFjBCArCBJCtPO+1wgiiqKbOaag3cSS2APdGKl?=
 =?us-ascii?Q?t/73v/rS3DuM0B/wflPvBS0k31Bu00gcVvk5VxHlu0viXx2gO2IcuB1NWRqr?=
 =?us-ascii?Q?VfUr5JTQGPr6cON4hwGSEXX8Kh2AIeWSoMoffIN2hPOYXq6QaO2ISkSEG5Au?=
 =?us-ascii?Q?t4JwrmbFThasOCAFB56Gozs2gX6Dmkufh74QxQAaIuBe2E8lCFvOFqDZgv9M?=
 =?us-ascii?Q?ixsISP1sfVYO3tZo7AXY8iKifbHoh0AD26GajSWAyxOQCGz8H+25kWWNfO+T?=
 =?us-ascii?Q?zulaVKYNxYvBIMJqtOuES/NkZXyvcnYyjEdeKUrWPMC1L0Cn3GjA/Up4FERi?=
 =?us-ascii?Q?t5wntpJYq8YI+9VJNeDwYF2eP9+1dQdPke5xTctcj5kOHmnDFhzwVV1nz7Xt?=
 =?us-ascii?Q?EnS+W0un1x7Vhaoql0R1xPIof9IjFTZtuW0fF+GEu/jzV7G3BjEVEQbhyZqc?=
 =?us-ascii?Q?hixOtXRyv8VoC3r9RYp8vKgEAYyxde5p3Bt2E7+Fct2g6Rena51SrGlbcIkU?=
 =?us-ascii?Q?QNYmR6NRRiUl2sWyIKGAtDl9nDIRVaPxtbjSnHKTvuaMhsd8jWLj/7ptDVhM?=
 =?us-ascii?Q?GXDLZ4aitAV2EjdZZUifCjrsQ1wgTuRb0y4MU+Jx+qDcn6FbwL8ncre1mLaY?=
 =?us-ascii?Q?X1rE+0l2PICE5+OS9CRqtblfAn0vQXDkk5+sCQFjvsdFQKewRdY4zE145Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 07:01:53.9266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faa8114-418c-443a-9f20-08ddd324cb6c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254

On Mon, Aug 04, 2025 at 09:40:45AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
> head:   f4212771ee1cf899f5ac8c9b6acd3bb7f49691fc
> commit: 906b14c15e3d67c3aa9031bc3fee805343fb75c6 [20/26] PCI/P2PDMA: Refactor to separate core P2P functionality from memory allocation
> config: x86_64-randconfig-161-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040847.0z9fDkel-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508040847.0z9fDkel-lkp@intel.com/
> 
> smatch warnings:
> drivers/pci/p2pdma.c:378 pci_p2pdma_add_resource() error: uninitialized symbol 'mem'.
> drivers/pci/p2pdma.c:391 pci_p2pdma_add_resource() error: we previously assumed 'p2pdma' could be null (see line 356)

Thanks, this is real error, which I fixed and pushed to the same branch.
