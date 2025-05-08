Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4951421577E;
	Thu,  8 May 2025 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683788; cv=fail; b=HmRhjmsoNYS/Sqp4+Wdu9T8ZqFJMdn6lzLfEZPyMmde02xzYRtEIKk/7RNj9INOypE67gvI/1Hsi27hfsik+WSHT+MMMQ1Py0k6bSrSnzH4K6c7CyoGYd5Y+SdeVCVx9/lubSgPIgxjXxuTrEhXWS9idjmBV0dhCaIhH9OzNFys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683788; c=relaxed/simple;
	bh=kCRxY8cX8podWGTOydy4VF8DP7J0leMdK+fWZuwt6iE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To:
	 Content-Type:MIME-Version; b=lLpGPcgva5CR7tsUWxmR/QsR84kz8S2XBVfKIAOBOgm4ViR6Z3Z4wOAB44gyE7iEvGolmcs27q2oakQ2Iw9oE53BTNHtnxdyl4x/PYmsO00pVrubY4j3+AllMgpbZqI56BH23vf5Ql5LEj+lMLwDiCgMbz+qWK++j7sKiOxDDtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WAes8S92; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WAes8S92"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeCqHFq/2tp+KXb76EmrooThEfRoU34wAYf0ZZDmPv9JeeVYFUZtLAVdtWg+b/4u1pgYGYv0okk4bclq8e5H7k56LjYtqgWqizNlCsOhzeTntd9cBaUNZD7n3NAq9UuHKDjLordSl7EXSG/uKdORnhhtnbUBWFPuYJAh6r2ls5HmAYcSwqemf7jJZpeMjkgJdQusISseeGcawrVUoI1VlL/kbiogTYk/s7V8XwS5ziyRogHfadGcZlU2WFH28hdx6TELxmL+EwQ9VYNiNHwSq7OLV3Edwj+cCT5N4MI/xLIpl4z+aNwwzYGwpyi2UMJf8Z0tYfce/grfNeCIUATRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gLXpP5Dg4MK54U1gUNY+avpDLQf9WQz+DmUf4soq8o=;
 b=hG2HBL9xIIcs+8mGc4znafml6lqUBQauTO/X30PzzcrotJG+vAlqduOOTqw4rySfKiY+6PkdpehtuQ7f9P9hq1AbGLjm4u4FU3XwqdG6JTsFZ1WG1F/JO8u5vn1dNSjCwzjxYyvN4OB/Fx0IU4Dp2FoNF306KSww7DEhQcgSB8dbInVPCQn8oSJxFFI5ay9YSuhOkhOUjvPiD/uWbjp0FYSt/b5hd7S9MAPbndDdjCfoj/+wTPEb7/1cdCi9gHvD4OnAw332mQHkOjOVO1zpda+kLNAhcN84LzPj9zf1XAhS7wtjyfnnY8mn7woI81zXvSmBkau3F/CESC5aBiDuIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gLXpP5Dg4MK54U1gUNY+avpDLQf9WQz+DmUf4soq8o=;
 b=WAes8S92Tiryd5nln2pbp5R9yxlFWC7QayoIh59TwWsvKZ9v+i+aZGetZZ5XpOQzW26M04pqRExn9bEVWI+/9IyCZBqpI3L/SnO+3eLUGhg36hIeOIgb3kgcRA+C49plZgXl1UT1tWBmexRQqlWWAN9lc0nPPD68ELtWcbbqxWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 05:56:18 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%5]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 05:56:18 +0000
Subject: Re: [linux-next:master 6980/9308]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856 amdgpu_userq_wait_ioctl()
 warn: missing error code 'r'
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Arvind Yadav <Arvind.Yadav@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <202505080458.rnV8YfiY-lkp@intel.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <8d228ff2-c53f-d4a0-ae34-588b53137760@amd.com>
Date: Thu, 8 May 2025 11:26:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <202505080458.rnV8YfiY-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN4P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::9) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: 675300de-200d-4801-71f3-08dd8df50cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czM5U1dEVU8xQ0szYzZMSU1MdnM0czRFM05xMjBDamd1ZjJveStOZHNlcXRG?=
 =?utf-8?B?ZlNPMmkyUDRsZVBhMi9GaUhobXQ5U0tDRTl5MGxjTXF3R3o0WVhFNEF2ZUJo?=
 =?utf-8?B?SGM4cHBmalVWanhoenplWFdQSi9nL1o2c1N4RWh0RDR1K3pSK040T2dMUlNQ?=
 =?utf-8?B?OG1BZ0Qxc2d3ZEFPYXZRYlVJbDRxODdmMURrQ2l3VURtaWhxczlQWk16RmZB?=
 =?utf-8?B?MDcrSnc0WjRFdWx3ZGY2VUJ3Wmd0N2xYZjBoazVFQTdWRjJLdDVqdHdUdWxp?=
 =?utf-8?B?WDVwN1hZYmsxM3dJa2IrUitSbkl1V2YrbnJwcFUvODIwVS9hM3FxbjJKdE9y?=
 =?utf-8?B?MXRGTkJiSHlyNVhVcnR3T3VUOG4xSFZOcmZaSUE5RWVqbzdYY1BldUkvVWNG?=
 =?utf-8?B?c2tDeUhXcW1lZXphSTFlbTRleEpCUUgvaFpQbzNQbThPcnhhL1FMcHFlQ2tx?=
 =?utf-8?B?OUNFaGpwM2oyVVVobnVISWJ0NjlMajhEaXp1b2tPTzFUM0FoYUl1VEVUc3Rs?=
 =?utf-8?B?ckJJbTV1L3AvbEF6T3hZazN2Zld0QWZCQURQbTVQTUpmNSsrZmNFZzdLMGVF?=
 =?utf-8?B?bWlJSUFtMVdwRmhzSUdEOTZOYU80cVR1VWtZRTZFeG1QY1lJMldLaUxIQWdL?=
 =?utf-8?B?TExzalNGYmYzUXJMdEdTSjVqY3g3L0JObEt5UFIyRUpIbEFHbStoaDhyazRq?=
 =?utf-8?B?VFpodnFNWklWTFd5b1BndFRQRVdWSzl5QWVxQ2lsZmllTXNkM01NVUw3TFY1?=
 =?utf-8?B?QkJUU3VZQWJyUFB3VmtDVVJnWWVURmp1bUsvTkxFMlZUR2VUVjJmUWR0cjh2?=
 =?utf-8?B?L0Y2emwvYWJOWFhvQ3VEYkxZeUpQQmdOOTBPZTJnbEVwNXk0bklTcElEWlhT?=
 =?utf-8?B?VGUxZUZoVGR6czJnSjlxTjdhYUhGWDIwTy9SMDNtN3R6SHNGMU5EcUwyWUp6?=
 =?utf-8?B?TmFFR2VJQi9OdUUvY3BnVTg5QUFDWHFGNVpGSmhwRGlEc1JPTHl3R1BMdTZ0?=
 =?utf-8?B?SDY1TG9nZ2czQk5xMyswUXFaNTh2bWlFaE5xb2JsUHVMM25YT2wyc2lzdW56?=
 =?utf-8?B?TWZCVUVNWSt5QndJc055N3BtTEZkcEVwb29ZMDB0RUM5YW9YdTA2Nnh6RDNC?=
 =?utf-8?B?SUliVWlZc1BHL3Rnai9nQ1lpUFNlUllaOVV4SW1zTU9MWW5ONzIzMzg0bFF5?=
 =?utf-8?B?c3VLaGtqekhWam1PTlF4d0NKZTMvTkZPZkpEVDJsQVZpbndFbzY4RThDUG1x?=
 =?utf-8?B?TmJLbjdnVnZLN2tPZUorcUpZTjJlbEdkQi9nK09lOXdlclNRdno4STZ0UFVX?=
 =?utf-8?B?YUd4ejV2TnorTEp3MTA5eW5UMWtWdDY5a2YxRS9CQmxHK2Y5amhCT3lUNDlq?=
 =?utf-8?B?S3U1OVoyd1V5TVMrNWVkZVVLbGFla2VKUXpWTktDYitJN1ZQS3Y2ZktNWUZk?=
 =?utf-8?B?elgzc3hPWWV0NDZuVmxWWHpLLzBvZ1RVVjdWRUFqb1R1UTJHMkE3YUhZWmdU?=
 =?utf-8?B?TUV0YnBrcituQ05iM3g2ZVFuWWMxaDc4WDlaVlU0dGpaSG1QRUZkRng0eWdE?=
 =?utf-8?B?Vi9BSi9mdTFWbzRDT1I4OHptdmhhZ0hMRzhIbGVRNGtDcFRDRVV1WlNBbGhj?=
 =?utf-8?B?MWpyQVNwV0Rxa3N2dFppWENxSmJSRFpwMCsrZ0tOL2FzVE00WERCaGdhZUl4?=
 =?utf-8?B?OTZYMnZHb0tCeWR5RVdlUGxXaDYxcGliUW5TcnFQK0RCOU9qZkxTT2pJR0lH?=
 =?utf-8?B?Tm83WG5VY3FodDZJU2VFQXU1cnFVY0swTEtMZXdEdDJCNHhOYVZNLzJTMWIv?=
 =?utf-8?B?R1Z1SStFbHpWeXA5emZPZ3hKWnhBS1FzV0d5OVhyZlFxZTRFMHgrRkRKKzlS?=
 =?utf-8?Q?lZ4nuQF9vIgEF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5052.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elNkUzFmWlV6allCcWovTzJtZWpqazRNYWtveDY0eUhBeHVYQjZoSnpNdTdq?=
 =?utf-8?B?UkNvNThyZm9xbldiSmM5NG9EL0xtMXgxUHFSM1dQTUxTM1prYU96OGNLQ1pE?=
 =?utf-8?B?NDZSempsSXpzVTRqdldOTll1clU4ejZEYmtrQWdESlBBdUk1d3VpcDkyMktI?=
 =?utf-8?B?NjlBV2IyS0wvcE14bytCVktXWFphaVoxczg5K0NaUFdBeUxScStPY2tLTGxm?=
 =?utf-8?B?c1kyUzFtNWI1OFlZdzhCQXoxWXhXMVAzOWdsdW4yZTJUb1RLS0hYYWExRlcr?=
 =?utf-8?B?a1ZlWTdWRFFOZzVEa1pKcXVqUlYvYmJjTFJFZVRYTnZvVjdKblY2ZzI0SUlu?=
 =?utf-8?B?TXJIQm10cWRXL3N1eDZPaE5DbEdkRjR6bnpCeFRYN0svdnQwZDhwalNVOUd2?=
 =?utf-8?B?VDdaMzlMRUhwTDVYRVJQSXFlVVJnTDV0eGwzY2trMFdCWHR2ODVvNCtsc3lL?=
 =?utf-8?B?dmJxV25kd1p3dmYxWHZxZGcrc0k2WnAxaFZaVzJyZjFINjViSjJMY0ZJd3JV?=
 =?utf-8?B?YjJGTGdwR21KMXdlOFFvaURtMFFNY2g4WWVYYlRyTWQyOHcweSsrUEVwR3R1?=
 =?utf-8?B?ZG9LS2xVQVlYMUxsOXNNOURDdGEvODVaSWJHVXpVUnBkNUVCNE1LZ0xkbDRV?=
 =?utf-8?B?bklZSlQwT2FxUzVaUUFNNGpwZXU4MXhPUVJXVXM3ajIrZlJVTnh6M1NVN0Zk?=
 =?utf-8?B?MlZ5OEF1cEFQTnFBTm13MHJTaWxabktDbkR1R2FrVXQ5NkUyY3BGelVpOW5y?=
 =?utf-8?B?cDBSNWwrUjRDRjJ5Z0RqWDdwY3pPdU1uYXVIcWFHMEQ1WVkzVlBPRElPaHMw?=
 =?utf-8?B?L05CVk50QWJIdjNVZXA5VW9XTmRIekt4MUlPN3JrNGhLWHZoemZyZUc1WmU5?=
 =?utf-8?B?QXh6emJuNWt0MlNOamdIeGIyU3liZWx1RWlvVjBxS3Q1TEVJcGhnd0JGd0JT?=
 =?utf-8?B?MFRiK0wreWROY0pMN2YzWG1mTzZwT2ZvQmorZHRtMFV0V0VRd2IxMVFwRDhG?=
 =?utf-8?B?TE56ZXZTemw4YkVlSXN1NmpRMVJyQWJZdEZxUjk3dTZDZGNHUHRjTlhFKzFv?=
 =?utf-8?B?NmJMdjVYWHV6NE50ZG82KzdXSlM5QzhEZGUxK3hxNS9NdU9aNUovNTFYVzVT?=
 =?utf-8?B?NWN1U1FzYUw2UWFab0pKOG1qN3UyK3FIVitpOGR6eFJRMWFDNXNqV1ZVc0Qv?=
 =?utf-8?B?dnh0YnYrUmNBTnVFVGlTaU8vS0swNlVncFc2VHcvTUJSbiszdGFoSGpYUEhF?=
 =?utf-8?B?UTJoR01WNkxYY3dJbVJIZTdmK1IxNE15WU44VllRRkZwK1dWUjZqRkluSnhq?=
 =?utf-8?B?TjJOVkZlSXk0YWw3R2JEaUh2VGtadTZvYkI2SlFORmovRk9BQ28vS2wvcUtq?=
 =?utf-8?B?aW4zb0xFUmdWUGxPWXpzTjgyZENud0pCdlk3azdOU1BvaHA3STNXRHdrRGxF?=
 =?utf-8?B?b0Mvb3l5WkpxZHF4Qncza0tRM0NzdkQ3enZiL1FRZm9PaWxJT3JXMXBUTk1X?=
 =?utf-8?B?anlTUHExYlJZSTdnUlMwRDQzcFBtbzlPQW11RC90R1V0ZXNUMkdRUjhQd1JF?=
 =?utf-8?B?NGk0YjZkU0hPQkJmUk1DTjNEc3ljKzdZSHYrckVIUWdGRGRzUXd2RlplbGY4?=
 =?utf-8?B?MDN6MUp6SUY2OElOcjgvbysyeU5NdytNNGtYVmFwT1FlN3YyaG04bW5mQ1ln?=
 =?utf-8?B?M01rai9QdjRyR1U4TEJZWGJYY2U1cFM3QUdFblk2T1VjVU85d3NVb3BMS2Ra?=
 =?utf-8?B?M3FOdFdYWVpwQmZldzh3T2daVWE0VE9hMWlMbkdnR3lzYUpWY0FHT2Z0dWRI?=
 =?utf-8?B?aDhQWkZqUDVIWU9KeXE2WGlOT2k0d2Q4K1VtVjZCMTVjMXp4K1VIMnVvS0kz?=
 =?utf-8?B?aTkveUljTWJDMjJRM1RMR0l4VGVORzIwazhiYkcrTk1hNnVuM1ZLRnQzRkhi?=
 =?utf-8?B?L2h6NEczWkRSNXNxOW9wN3Z0V1dSdnZjU0VFQ05RRzhqank0V2JmZkpCQzRr?=
 =?utf-8?B?d1hHSEVRMGp3ZkJpMkZCQUgxUVNHNURwdVBEVlFJd3NuWjBVbmJrQU5Ic0ZR?=
 =?utf-8?B?NlRlcTUzRzV6RjhsSEV2ZkVONS9DckliTjdMcU5mS2VaUmtUWE0vN0dUKzF0?=
 =?utf-8?Q?fsaUyABzFMgOwPKTYUQs5+KZu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675300de-200d-4801-71f3-08dd8df50cda
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 05:56:17.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CesXYHMSaUXJ6/uFYcMN/isgzxV0EAYgckN2jhcnSoztKzW+1QV0qchgQSI7rATlPCugrVOsr5+bcG1Y3khgCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

I will fix this and send patch for review.
~arvind

On 5/8/2025 11:20 AM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   08710e696081d58163c8078e0e096be6d35c5fad
> commit: 56801cb83c8c95ae23ea576570c75a01c1f07774 [6980/9308] drm/amdgpu: remove DRM_AMDGPU_NAVI3X_USERQ config for UQ
> config: loongarch-randconfig-r071-20250502 (https://download.01.org/0day-ci/archive/20250508/202505080458.rnV8YfiY-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202505080458.rnV8YfiY-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856 amdgpu_userq_wait_ioctl() warn: missing error code 'r'
>
> vim +/r +856 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  835  		/* Retrieve syncobj's fence */
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  836  		for (i = 0; i < num_syncobj; i++) {
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  837  			struct dma_fence *fence;
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  838
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  839  			r = drm_syncobj_find_fence(filp, syncobj_handles[i],
> 15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  840  						   0,
> 15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  841  						   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> 15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  842  						   &fence);
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  843  			if (r)
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  844  				goto free_fences;
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  845
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  846  			if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  847  				r = -EINVAL;
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  848  				goto free_fences;
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  849  			}
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  850
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  851  			fences[num_fences++] = fence;
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  852  		}
> a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  853
> 4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  854  		waitq = idr_find(&userq_mgr->userq_idr, wait_info->waitq_id);
> 4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  855  		if (!waitq)
> 4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11 @856  			goto free_fences;
>                                                                                  ^^^^^^^^^^^^^^^^
> Set "r = -EINVAL"?
>
> The kbuild-bot normally includes the whole function in the email
> but if the function is long then it chops the end off...  I'm
> assuming that the warning is correct without seeing the rest of
> the function.  :P
>
>
