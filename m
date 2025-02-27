Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919326FA42;
	Thu, 27 Feb 2025 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684829; cv=fail; b=S2QfNyiU4J5ADEk/ZDLcPMNC+ymlrI7/wjQMSUki23j6iylEPs4FjlAZci6n5Fb0P5iZDTLNltfNg6AVxqRbaY0sA+Kz/+J6AZqlJ5tCxL2WQgbX5SiKJjVOqLPH2/DvF4+sjr27NyNN+UFb3EUll5z0MpIxinTrDkh4jLwzYEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684829; c=relaxed/simple;
	bh=pcIL+Mmgbl304Uz/t53e6iMFsRPdWbR8MJeLGOEH0rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UYusQlvqEvqL0GW/wwraj5wyBySWGLZPUuoKd9mDatWMq81NqnMnhXy3pPa5vlqkL5OYZa8kDBskjL643b2rDGLyF1syoQ6Q20LtMTMoJV9d2C9dOEPZnVmybbSwLBinjjTxNbjP0vH5M8JZG7nqLJMK4sFOVm7AgcvJMdxNZto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bOihWN9B; arc=fail smtp.client-ip=40.107.100.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bOihWN9B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F88MhyVTJL+Lj4yQjE4x15ATpJcRED3x8tdf3oMw4u799wupbgI3ZmYeSi1yVLlPodTSNJpG3b1i+a2pItRGDBnxTshWDNW/WKq+4gzeg1Grq6B/mdEcsSaH6fOvM26k3MIYB5rCZ9VoNuCmmtIKfjIqnblwHMrsmzgsxueuI+sbgI1zmHk6cgDTluN74H/upzTh9xMnUpvPJM+jV+/ln/YV9IMiw6yr5kPYcu4lmVkuhHlbCLOk0IWCA5Q/wvIaATGS5x88DEmKA+MaiZLLF38+clIxPhCINhv5IGVGfWz7Rj5xKM3mJoNs/dXg3YLEb+dCA/8b+oggTm/pAuwYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoPzsDnT4V8rH7vwR6+0zkqeEga4g9KM4EeSwtAYW78=;
 b=VNZgjL/6p6SNnQ3ZxSOnlJb8joRbm7/lF22b46KCUWulpFVsBENSRZLZEwCZYZ0ZDJZas9kWZyfbi3XLPNjsGlCeq5hDsDT8OjuJtJhGCem8BJWQWwKs1qfvxTibQ9ANZcQSjJC67nDUryoF0eIaadnVT6BypszBXPfX8VRwwHsW/8g8KdhJJnmI9hd6b1WjfsNcQtTO8j1+pl7vl0a5CFt/lT2yfjcGgJg8izkj2qeCIcxyPofUbkvrRfyEYqupeFLJC/Z1KM1VBXYMztDZlq0risPBPKDuvRp5Bq9Hys8l0deI0z5rBkKtqGI06X2x3yISLoQxu27IR4JMK4I5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoPzsDnT4V8rH7vwR6+0zkqeEga4g9KM4EeSwtAYW78=;
 b=bOihWN9BVOU4vS2EBLIGKMeWhN7RMuL6cmA9MPUC/0W4YidUIWsTXRWHbATBqLE9wo9J+JixhGUybm38Zwp15jpoqdAg5bLfMt9rADG/h59vF6RtXZAxvvZsU0uOjTjFW+pQ6digsTFLV/830ts/SZkEOwrpVKjUUDT7WEWXGVaxkVIf2gjzyLQ8Mh4E/Ag/lV1a1T83JLXvGbyzTW5kqsJOaDrlHAd2VioSS7Mtyn8BUG5ct8X1xN+iANcGTuWeeEYBwnQFqGMCfP8debRY3Hgy9+9eenmq3Bs6wXVwAXK5KCuA/IlIH9PYKo1aB6jl8wymOEGcD1Tqf0Cr8HPcBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 19:33:45 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 19:33:44 +0000
Date: Thu, 27 Feb 2025 15:33:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [linux-next:master 4924/6583] drivers/iommu/iommufd/device.c:327
 iommufd_sw_msi_get_map() error: 'cur' dereferencing possible ERR_PTR()
Message-ID: <20250227193343.GI39591@nvidia.com>
References: <8aafd350-322b-4ce7-b228-ccf2c36e0333@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8aafd350-322b-4ce7-b228-ccf2c36e0333@stanley.mountain>
X-ClientProxiedBy: BL6PEPF00016418.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:7) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: b16a1967-ad62-4f9b-c0fd-08dd5765a62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HLnzi1VeLf+6GawTXyewxLEJBbqCMbY67Ke14/W38khzAWZ/V+R8NGYIv1CZ?=
 =?us-ascii?Q?jiF3i+vNbYcAQ6iqdXAVSL0qk5itYxELhsucB1ygoGrn0M+R6sh2Cdrm33Ez?=
 =?us-ascii?Q?Qzbtvj7oSgR+6wte9/TIpYwfQ+81HkQddc8EhTYuNMh1g9Cv3JiIERY11PrR?=
 =?us-ascii?Q?t3jjK8VqdKPczIBO2Q+dyYlvXFEB+amr0thES/TH9Bzo+sbvmuf5xggMUEPu?=
 =?us-ascii?Q?RRpbH2p6kVEalFKHU8C3lvLIrBp77tbjOTideZtYbpV0wi29vgRqHO1JSY5V?=
 =?us-ascii?Q?3gsV07h0/UJ7zjIQTIpeAAzORGp4tDcyBFFef1Kyzcvzf/s/cmsX3isV3hqs?=
 =?us-ascii?Q?FwhWQWo8Q5mdXBi/wDFUcYWmKDApCQOQSZmpfUfTaRZCBvQhVcPqwDQhF5jG?=
 =?us-ascii?Q?sPBi6ypPgtFS685kVRJudkxPg14BSAPBXycp0bCJX+fQGF7FRSHCdbEirQ2h?=
 =?us-ascii?Q?gRCmm1nR/91PtWj6eZT4PlhDnYu/9RrL3/P3Af5xEHSIpXZ58i3sufSg8Hvh?=
 =?us-ascii?Q?8aPkmZOSuzL3VBxr55aeUw/OZVdkKhSrgT2G8HAysd8i4dfRbLYZ5wgm3NJO?=
 =?us-ascii?Q?CPYdaHrtxUmaQ2PJUzkv3NPc/jqs2VYlllhH+Mtm9hRyp8P6sDHXBN/2pwLJ?=
 =?us-ascii?Q?VHN6MS2lP1kX2SCzeTh+dmne4kLcDZgpBfFEKLwCVYCQc7wB99+H3RrriE8i?=
 =?us-ascii?Q?MM43EibFMSkHwSwo6Ev4K7Y6rE5AV/PV/7gYQWFgVdjWBltwyr7Qoy1NY5B2?=
 =?us-ascii?Q?eoE7tCYgBJdm+yCBKLKtmC8qgZoaMgSONKGL/m8gqJ4Syt5QrOXNUYqaQF+r?=
 =?us-ascii?Q?2Hl490m9fqLEnYjNoPOBOH+E+bXyzkB9iHz75vcdJW6VSh47F15Kj9lxrzLF?=
 =?us-ascii?Q?NXvZ9WJ/F11Uv9rFKH/0pr+1NadvacarYLeFkqWmW+J708E4x4kzVT5YnjLr?=
 =?us-ascii?Q?TfcE1/kbuCJBhSZK/zoebjpYw/40sO3p42CzJwB2ONt+L+4+baV7YAU0kGAQ?=
 =?us-ascii?Q?q0sBZ34lEqUkxhsZgGkrmJiqyZdZjillI1l4FG09ZlmroUfjJFbSMe7fGSAf?=
 =?us-ascii?Q?1BQDx0AoKRecXEKSlQuJWIcO+XNGKpUTFGuHUdtQ1G2wa1/wxseHta2f8JY7?=
 =?us-ascii?Q?okE1SiyeljcuvE/eG5fOdgBsXakP/bC9nYWMxxCaHvTYdcBjXpWSo8DGoalU?=
 =?us-ascii?Q?EkcR9RXGeyx3xlgjydsfxk5HdgsuW1yxRot8OI2QreVLSFpb39m0gGn/wW6n?=
 =?us-ascii?Q?hfvG+bbgZXCxOvxrAOr7OjoqbC8I+8r6p3BhEMQBhQ3axn9FeASN7SlCm7lO?=
 =?us-ascii?Q?VLMnU69ylx0Ho5kK/leurbuhM6S2niMM7YKe6IOQChTnyDSd36K6cZHVjNyJ?=
 =?us-ascii?Q?TlBt5asDGKIRKmRY4zTWfeebNGDF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6o056SaN2VWyhHKxBvgL+u2U0DTfrCe3n5QsHz56i0u4vDwvDACDaZaT4J/7?=
 =?us-ascii?Q?ghQUiJZaUoJ9iXbYikKWBX5GnWY2O+sJU4Ddr3iQZdD7Uo146cQ+Bj5uDhRK?=
 =?us-ascii?Q?3PUJ6kJE/hLoyLw9hGKjKOMyNJUkIpc5WZGA8Gxy/20Lvq/o8dwgfQcRpH2z?=
 =?us-ascii?Q?Pobrx852ZGQSpaqD25NH50T6ccrHBJcgz9W2tvYsJ2Yk7m7dwUfVSiEftlIS?=
 =?us-ascii?Q?hQsCHsRW+fO4nmqfdsd8zcqn3UFgUm4qdhg7FDR8RdzDP/XEjrWY5f7P0Ktl?=
 =?us-ascii?Q?5n7tsxLw/eWBHxoAv1xZpmQ0p3lu17zKVjq3cAcXte79hhp279sCZumprF5U?=
 =?us-ascii?Q?S28cOQlm7T/wgRIg3baM8iGg9z+CSOkZAgxgiH8tyL+d7Hip2f8NX/ZRd9cL?=
 =?us-ascii?Q?M2RIX34P+SorVjSGEKp/f6a7Dx6xzG/ZkqbKXVaYGsGuwXO/PpAhTDAnndyX?=
 =?us-ascii?Q?ThJbkPBPgRKhAKmj7XE168PYsgVUyhH7iAWHx7SI6xbWDMgnlYY/2/p6btXH?=
 =?us-ascii?Q?Vc7BGp2brWdXPEb3W7qvL6YYubG5NCiZMD4+20tkec7YHNRisfgd0vcvu8TY?=
 =?us-ascii?Q?ZK8TlZP3fmc5NYMRXPMldRTyR9pI5FGcQ7FHdqR3J/ebi0VE5JI2lWc0vAbm?=
 =?us-ascii?Q?Lx4I+pvdfENTr6ykqUSrRAEn1vRqkjm2tE/x/YVMoQq4R/ZQnFO1bo7WsqYQ?=
 =?us-ascii?Q?2pSdq82B7BZcntuFQ5EeGwvbb+Gm2hdwosG3J7EuBqio3+fhAFbETTDi2gy0?=
 =?us-ascii?Q?0g3YTr9eF5b8Si70LCGmF4YsuYAwNjmThRGtVW30JaWGr0jqaOdmbefMNVsy?=
 =?us-ascii?Q?pc5fgToJ7tBpoElDevI0qssOjahztbATxVLG3nnjAtRTdwSiK+/+4yk6t6UB?=
 =?us-ascii?Q?K79VauCB4gFMOXsC9l8eW2LsOJmhAQSCGIGiPQvPgBklujYVS4ZVjsrT7Dqo?=
 =?us-ascii?Q?qZcm3abt5Qj8m7UtB+C19iB6Cs2FgbqhpbUQ4Bix5fqBtxLYnwUkFELIZoRl?=
 =?us-ascii?Q?nBZw5XifegzizuvL0VSFSiQXx7edWIyGeMFQBFHTCUl6wWEfEWNPQBOEej0d?=
 =?us-ascii?Q?ck1N54Iar6j3tO8jYDSHm0AI0hmpINkFsAX160bvh+k4YewrFVFKu4UyQ6Ol?=
 =?us-ascii?Q?cowaNQ7zVK6NypRYy0W17/xND1LLtfdMRC/BAjaphyynoh56Tf4GrQomgACV?=
 =?us-ascii?Q?lyIEc4QmBXtG9MCzhNkRmvvV4qqWjsTJVt+RR2Y0MD/g4ky5b/Av6YyY1s1R?=
 =?us-ascii?Q?mksz61hrT5D861quN5o1IaEkI8xMguGCva0Ig2YM5u7GX4OMzRmYh0CcvGbN?=
 =?us-ascii?Q?rBbgs4H+WUtlLehSxJ0uD8zYvNbNLSP7nVPAOn3mRG8J/ouMJry2708DjeAx?=
 =?us-ascii?Q?jJP6kvus8qgBM0gYdrshDhvNSpPR3Nj2TSH5Wq/qA8vgCz4zJ3zLdmqe2CXn?=
 =?us-ascii?Q?dsk6JMGYKlUNIyWVRowYX4YI4RE+4jdkKr7OC4nZewpbFceo+3vdl7gib4iV?=
 =?us-ascii?Q?ia99/NdVvcx5+Q8pbsj9bvDhCFBWkD5uSblc0m0mmK0MjgX891RvB4ety2WC?=
 =?us-ascii?Q?uIpNPWccKGOHGAwoupAFcskbB1P/SUgTqCXHS6y6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16a1967-ad62-4f9b-c0fd-08dd5765a62c
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:33:44.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mg44RQpI1d3rGUEa4irLpd1LMAPyUySh2sjlaxPPURL+wGzs+HcSlgASD78+znE7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872

On Thu, Feb 27, 2025 at 10:02:07AM +0300, Dan Carpenter wrote:
> 598749522d4254 Jason Gunthorpe 2025-02-19  324  	cur = kzalloc(sizeof(*cur), GFP_KERNEL);
> 598749522d4254 Jason Gunthorpe 2025-02-19  325  	if (!cur)
> 598749522d4254 Jason Gunthorpe 2025-02-19  326  		cur = ERR_PTR(-ENOMEM);
> 
> return ERR_PTR(-ENOMEM);

Thanks Dan, I fixed it

Jason
