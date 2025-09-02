Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17E2DCF70;
	Tue,  2 Sep 2025 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831612; cv=fail; b=ROxGR/Q3NoQ0qjl4V4vNgrcfF7VCIMeQe042KoFGBAbHClVOOEJxKsWFt0sUKtCuo7p9z62c0ekbO8UlClbPwsZOQdRUu7NUpxzZ1z9y/YrbyvpQTLTUbc2d5AaHwGUGZ6E5dRxoAo2z4HndppwcvnDhhhKdhb02gj8nxm1weYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831612; c=relaxed/simple;
	bh=/E1mNFLwnGEqb/VQEoYwCFGuX1pyJUdkoLhnis46nys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qyROcPVtGKKXZXw+1VlLXzrCrtrFmwlnRaIb2b8HnRA1yk8iVCinKVLMKTjsLu3T7YiSkvcnfczO87Zp3fTDysg6rrPzA9MW/hjXI7qMvfUT4rdJ7qUNlF22dtgf75P2kQ65uvy7x/P/kFS5jTcs1DlctNXUGpb9jlJ3BkPgqoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nSy+1uDS; arc=fail smtp.client-ip=40.107.212.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nSy+1uDS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1S78LrEbM1QTihpD4oUoiHqAIWHpH6jJTUWzQHTidtABVk+qo59qTavIp9robSK7w6WPVOH/GrF3KEVhKSSy3qveKatqPke0CnlGz1R4URGR7WiSoIC6x/5+U63jzHC066yPe9ePJa0wBBbea+4qMI39SeE+Lraig6f0u0LbE2VLbUBqnenIV3n9SadSAoqrliZgNJ6qymyLHJx2qx/AkzeEBVDRNUXv6dc+CIpe2HDFvQRJEH8idL5fzLmFP2Y3vu299RCCAxIEfOh+juLFcMS/G59J40eE/uBFlRy1tiawXkM9etlmqldvsRKyFmPN/ZhhSQbbG4IWG1P/SEFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfPZDNyfTCm7RiyyuaCSz5yA/3rou9BonGZ/GOFc6Ew=;
 b=HP2LA8BuKdu5AYlCjAGjDBtlWroM4U47YPKzWR27wiF/dKkS7AP/3pksd/He7SwGoD7+g3FhJ01HUT1mM5sY/KxOB5VE65ZvPGQGdwbhgQt67pxfB2YRKWJO/WnmgOWATEdmxT2rop49c/6pxytDhOiSmaCENhKJ5bhf1V5anLaZg3dhsaxCe5v5OepdWeY78emKa86WecM63xlU9E5ka8n84IcMuGwVLm4bp5iavgxABO8gqDGhHlrAG4YbMP4lwJDynWqCadY5NnQCfzwSLxK/15FYW22skRjLm99Ez7/So73CSADlRwrVXVd0ftqBONwV76tupjjLzs/reAl+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfPZDNyfTCm7RiyyuaCSz5yA/3rou9BonGZ/GOFc6Ew=;
 b=nSy+1uDSAG5DEbfIRFL2bVIU2U/mW9q8AO0+DrJ1rPslbE43K4nezD8RqTawAMiSGAf3CThZSOpF9J+EpgzlCH4GkvMCxQ48Fnws2DHEykCn2jjdC2Vw1HlnVW4O5qQt1PpX6Aa7uv6QUxewHkNQpM5OoNmd9Z3XizZWuGKhlCzgwKx4uqEI2SyfQaDkrNf4HaL6tqmcSCHEHIFPfJ6EbIw5BEOt9lVpmZ3KC62O0pemDBG0ZiyheIOIItd+LPScqKBmj2C8hYPgefY6EuefmzlUcOY5KO+y0US0ycx3By5EPK9o+GUk6pVyIun+b2GnymJASXOT/npoS5PWvBLUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.25; Tue, 2 Sep
 2025 16:46:47 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 16:46:47 +0000
Date: Tue, 2 Sep 2025 13:46:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_all 41/56]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:735 __cut_mapping() warn:
 continue to end of do { ... } while(0); loop
Message-ID: <20250902164646.GA376160@nvidia.com>
References: <202508301321.c3GXwQnF-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508301321.c3GXwQnF-lkp@intel.com>
X-ClientProxiedBy: YT4PR01CA0319.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: e48f1be9-4f7e-4449-bf39-08ddea404e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5OWE5f6wxE/YHxgflCkGbfRKv42U/LlUHkylrwBmHUu6xM/fJEiLWNggak50?=
 =?us-ascii?Q?ClCoxdPXFYWWBi992PdZCkjPGvTu8MoRsTu/66XnyM7tg4VQ8+0BRHobusGu?=
 =?us-ascii?Q?GKoO6nCr67lzmieAzfXRihlE8/l095p+XWjmY8rEi93gkW8dETrXhEU1lA2e?=
 =?us-ascii?Q?7GeGyTsyod0UX8RL2O/+SPsqElnQg7q4R9rsCtqZ5PDy7bkOH3viiOAX1Jah?=
 =?us-ascii?Q?9UK3uZiQ/GmYD5QObCxqSCP0gB2RpZWpRMjCRUCXdOEqRX5y6+ZZNmzdxhRP?=
 =?us-ascii?Q?FSYuG6yiDnZvZOJhfXFmd4MP4c+pksj4DSxYOiimUoiLWXoBWKqIXCnjiih9?=
 =?us-ascii?Q?IxaAHgAhJNwLJs83wF3p9pQVFvgLRDVO2uThJUiwMv9Kozw3Qm6/4rnBXVep?=
 =?us-ascii?Q?SvToA8y4/GR/3K97nkwelKiMvYNGHOePySWzbPnTA3wpP4LxBYQSCaIssU0u?=
 =?us-ascii?Q?dIoYcYzzvGHGDv4d08MzzlxBKmQ50GLbLZTmcWsycwaQJ2n4RHdNcH2aeBa+?=
 =?us-ascii?Q?v/jiLAhrgjOjZOVFppyq5yC0Ma9+QTAht8KPrLSlWh7nBsN0HuuWNAukVqOh?=
 =?us-ascii?Q?CPmqnJfvmT3c151iXWbQSprwAnQxQM18vVgoup/4ZvuUc18lqoTtEfQOkqBL?=
 =?us-ascii?Q?drN+QvCYyz7BX58n8R2WG9blIrS85FO1mC1WQH2bF+DdrwYzOiIh2oaFTUrZ?=
 =?us-ascii?Q?XByuwYadfNYAJrl16PqcIrV2CT6Flvi6WJAj+MVbb1RCu+GeFKrAhHsOrRU6?=
 =?us-ascii?Q?39LO9JvH2a/6TXudac48HwFdZQupts8m3tq96RgPQOHgKGY8Ux+rYpvj9nW2?=
 =?us-ascii?Q?zu3Rd8A9NLdkh4a4iLvjbSMyf1hzX8kI36CSTZzZFYwtVgCKUrfyM8eL/JCn?=
 =?us-ascii?Q?sA9bGlw2TBgayPQMwXTXhYsi/ILjQnLFC01fm2wc+Lavbc9twGtxUpumEzn8?=
 =?us-ascii?Q?ukG/BgL/pe8gkfRhGynNwr09UV09sI/f/KiWXgOCiyNK1r2N9wPmyY9yBH8c?=
 =?us-ascii?Q?Rca2NmR5n9cHnx5e/TK/OyZzfFja/OBykTVM+cpvjg7d0ksnI2B0P7wQNIkf?=
 =?us-ascii?Q?tIZTPS6MNbbEQAd2e9eVxoZvwLrQB+1AFCpMGPD9FHQgKsCZ/k8kfcAIzQMM?=
 =?us-ascii?Q?x2yhCDEwXc39l5GVyYGupfojhsgJ/91YgomNAJFvjST7v+uZXbK/kdIdNnYS?=
 =?us-ascii?Q?qsfRP/0ZiB9eUO8EJfyn8EQir7uGvAkaAXUxo9mdexWYS49UAR8k+pQ/AKAC?=
 =?us-ascii?Q?Z38ZVXmDtDnGrfrb11rs4DfL7yNeAjswiAlUNLw46i43bYgfoQjTI9OszCG8?=
 =?us-ascii?Q?JraOoH5fTB9Bq+NHxoNymCRivAcfecEOcwmvmXPj1DdQ50tPUeviEkfQnswA?=
 =?us-ascii?Q?HFj6E9+ILwR7Cw57ho1tM4VWK39m6cFUjpinEZ3+bSqj8Dkz7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/qCzowopzlU7HAPzzyc10lacQNHQXupms/QMhbo8PImRyABhI1A9EAWQkOia?=
 =?us-ascii?Q?kkrG1vdOkTiWWjnkWW5x8L5jJEnAutLOq21hpDw4vVpIvA2vTgYee4saynvi?=
 =?us-ascii?Q?yqmPTqKs8QAzkkxgdAP9PZC/5VWPwrKjQegcZmCPnhRHo8CqbgDXDssaAwky?=
 =?us-ascii?Q?U6A9hxF9U6a3nkONJVNomxq3umkJo2uteS/nIejeJ0cZqMArTJFu2oj3l2tM?=
 =?us-ascii?Q?f9DLFxovgUuBH0X9b8letJXgHnFfkvZ/WW8Ge28gyoxHpuvcN1AI3725cRj1?=
 =?us-ascii?Q?ohBfJZb2oO0G1ixgbiK4oQ6aQjtgNUorxcrIgOhubwTVoDGJZVl8nVZWObol?=
 =?us-ascii?Q?9piQ59Kw0NojslMexGAb58ankHdwbhSZL+gfa6F3gVSfneS6lMK8yJl2SAkN?=
 =?us-ascii?Q?+UEveNhocDag5EFZyK2HEzdHSkDIjIX+qzaXyjxnsDUK+zQkSbimfc+NlYgv?=
 =?us-ascii?Q?fliXa7fya8J/hCvxWdW1EzRhlg90+JOcHh/XUJSYgY59l9nTwLiD/nMy6a7r?=
 =?us-ascii?Q?o0/WeT0K9UtNXYV8g+uykOz6u1utKq19RPud4bhW4/FjtmdDraFmWda0L+xo?=
 =?us-ascii?Q?U5sR9HBBiVVstnt8P5EgxGUjBF5/vuJ2Qrqmb4HygSZxFE89HUJXi8d8IexE?=
 =?us-ascii?Q?m14UK3urgvZycTQwZ1Szi3EDYwxLs8G4PMrcYxobhqWACWkfe6lNgXHTqSHL?=
 =?us-ascii?Q?EwFPATU043Sb2FWpIRbquEEi8n0bqmJh6u8UsHyysLWmlFlAgGTLVjNQFChh?=
 =?us-ascii?Q?xyq9XbtU6WcibJ1DYD5UmaO2bzwSalL78ZnHqWef4kOF1yIWhL5Cu8Qk3XdE?=
 =?us-ascii?Q?8Ug50Gihojrv4w6/foUCBZwFKJYFpqqJvJ5PEteR23zSdrtAAm0aHiKsYxSa?=
 =?us-ascii?Q?lpdR8+HvxstOBjYLOvnGbv+N3OTUxH8+28wucmP7iKYP5Dkhn7HNUIBkxki+?=
 =?us-ascii?Q?78GWm0MZURbRU/YylqjNovwRIbDGC2pyv8nmkaroyYbiRKg+stI7bMsrOiPc?=
 =?us-ascii?Q?TArGOiVMhbpsGrK6hDwFdiQc9tBIEmH1hXtZ5NruU5YxBUok+G1fbe4uw7zm?=
 =?us-ascii?Q?aX/SRF/wyLZXba4WMf3hT/3W1rbbVt2UUaUsSN9E8DKfxrw6hF5ghuOGh4Ph?=
 =?us-ascii?Q?MrwdwqD/WkyamT1f3GiBa6g7vT0oyGEcOE1d57iRv7sRDjnUJik4tdv30PR7?=
 =?us-ascii?Q?YeRHAADoTLhG+nV2eM1iSEmWjn259l2thBZVu5sJc844oWqqDK0w/TVxb8T2?=
 =?us-ascii?Q?lQ3kpr/wvsDZtJdb+OAuUw6KQClqFIB/AjtFivNbq8IfMpB5YU/jl2tofDUC?=
 =?us-ascii?Q?IR1HGk7OSr4dM2HH9jlcapVkIW5dwcDaTumsqcFWGPvPXXgMx9rmEiAXz652?=
 =?us-ascii?Q?FQ6TZlezGdjJ+LsxvYjxn1yRidgZNtJcdCNV+x8K+77bPT34D6mKjygKSkwh?=
 =?us-ascii?Q?I/LHbEH6CBZxPRCqONSUoMXWZKlsG9aCvjPCFJJ7w86eBxB0wMcLb9pXB2Bo?=
 =?us-ascii?Q?DLluin9aBy+8E4zqLxbTv5a77CEeogC8/cONRtbbVyuMgXXFDvxdwiqLzpzC?=
 =?us-ascii?Q?GmJvp/NymdKXc0YVu98=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48f1be9-4f7e-4449-bf39-08ddea404e68
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:46:47.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGrh+f8RH4/AanIRks2cUGFboPaJPW3VSKTA9DnUiODD9wRHHueZILgMPAPmCHwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367

On Mon, Sep 01, 2025 at 01:59:13PM +0300, Dan Carpenter wrote:
> 
> e3440a4e2ef962 Jason Gunthorpe 2025-04-03  746  			return ret;
> e3440a4e2ef962 Jason Gunthorpe 2025-04-03  747  		}
> e3440a4e2ef962 Jason Gunthorpe 2025-04-03  748  		}
> e3440a4e2ef962 Jason Gunthorpe 2025-04-03  749  	} while (false);
>                                                           ^^^^^^^^^^^^^^

The false was supposed to be true :\ All the continues mark cases
where the structure was changed and we need to rewalk.

Thanks,
Jason
