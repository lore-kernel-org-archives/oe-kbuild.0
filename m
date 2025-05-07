Received: from outbound.mail.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A136233145;
	Wed,  7 May 2025 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618611; cv=fail; b=jpDxR9QaKBC/9o8DCHPF14cfHgme24Ib7QyqaiSfTuVOld9WNUZJzp7VGuj039uk904O5i2ci70Y6gsCiMu3QLn0RbQujfhN5xvNBYqdFNizrhL0wnwJlinZlbZilWKgkZyzh9/ngHuWcr1MOQ2Z32D46xYLr52s+1hoAfPt+s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618611; c=relaxed/simple;
	bh=G0N8zTrF9S7MQFZJlGadNXEKH0h47PlTZaFJDUwi6DQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t3XFH+KsoMOAW5BbNcZ3lwmA9BYntiGsrpuHccLczHt6zSz22b2jYttVpJa9NNXq4NOlExRASEhalVwEXHGA+pHFBwzuWW3764onek14Xi/7kUkO+UFljku731TxZhAg3Wxu6OIQfqT6rzOCVbOsyW/36IvqkwR0+n+OC8Dfrkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hgSFRQbb; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hgSFRQbb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbgSl/OYVYz/QWT2ymVhaBMJu+y2h91XVb1t0X+Gwp3S10eu7NlbXx3qGEpap4q5ohGCBVUMqsJIoaIQP4TegYBIWia3in849R4bAavGoqqPKRR+cYMo2w9rQVRo3N91hHPSBtJu7PXW6oYcV1eZaofkzYw7Wfv+/HaaV1l6rD1hMAS7hmo0i+JjKGSaY8xrafZwBAowaslFvXBT5nrbjzb1d+jQ4fHWAuPJlHw2lq0wuXNH+3wTaJzKiN0GWYp8UW76uDbP4Aiu60Hm1XTwwYsit34vEBJNioqtt+fJbdFchPkVoN6Mz2vu3COP6q1DeVMQ0tvdTnh3OItsmPwApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXdXI2nyVkK/bD8BGKmQ8mOSGxcYCNzlrdwgVvS8s40=;
 b=KgacoN4QbYhUOJbHVVOjUDhFtEexqThY6azOcB5X1HYG3Jq+LoQguAkOVKfXZOV6QwC8C04sT1ADmlA/BUy8IcwwIPma2fCYCeOuYeCPatzoD+mzCPLm2KWGrz2Z8rj9uxEHGYa+Db3pJFr9K5UUSKIyUTC47yzyzGo7mma3EbGOXDxvq+eUi5fB70K5LoJCbZC4MopFD+jTzP6uwx5VMHxwXg1R/hkgo+nzc/i1ikrnZ9Wsx3iIm9NKZy6n0N/LMfSYm1XBq3vsGld+Zp3hYP04tU4wkXr+RlYEh7H0b4G1Hj9i1i4l/1rZM1nnw/Ma0sKLmJypvbOFnG4q0aV+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXdXI2nyVkK/bD8BGKmQ8mOSGxcYCNzlrdwgVvS8s40=;
 b=hgSFRQbb7XDmGY/jmfPo2VZig0r8xERaqaI3uFWbcsMroBis13rhzfjFK2Q1OKJsnwhLy1geJwS9IflKD6RWRGt/6pH0K9hivTjHhJiHzJ9BYeX+2E3Y/I4RU4WuQmBTSXsu17kr1JActAiIlooWdRKh3oB3DKIiisQygeqZzKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by IA1PR12MB6577.namprd12.prod.outlook.com (2603:10b6:208:3a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Wed, 7 May
 2025 11:49:59 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 11:49:58 +0000
Message-ID: <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>
Date: Wed, 7 May 2025 17:19:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202505071850.XaOkcCkX-lkp@intel.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <202505071850.XaOkcCkX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|IA1PR12MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: 6838dd8b-3b35-4502-ae90-08dd8d5d4a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YytPTW5rS2dxbDBlbzFTZXE2UiszN0lGa2ZMZ0sxKzhDVTE0d2ZtUFlqMWE0?=
 =?utf-8?B?Q1NZMk9oL0ZBTUNTQ1lNWGkvM1NINDhSL1Fmem1LYXgvN1o3cGtBL2VhbDZI?=
 =?utf-8?B?RnRySlA3MG9IYXdSVndvZDZMREhZclo5dk02eXZwMXU3ZStLaXhrZXlaZlJ4?=
 =?utf-8?B?Vm9WVXJHazFSZjI4RjhHZFZ2eVVtcVRnUUFETTA2Sy9LbVpGdGVKOTlTQzRJ?=
 =?utf-8?B?WXpmZ2RwTFFJSDFRMXBJN0w2Vm51RktrUXZDRU1MTVpxamI1ZDRSbDRMY3Zr?=
 =?utf-8?B?MzlIY0hsK3I2K2V5Mk02REhOQmdBdUIza3BkWCtTcFg5MnZ6Q1RsT3lGcWV5?=
 =?utf-8?B?RnlrRVpja0FYYVJoZ2dTaTRPMFZoamRJcjVVQmVXVlFxOXlhUHFXd1lNcEhw?=
 =?utf-8?B?WkJEOGZPc2wyRWpBQnMxTTNGdkdQeXNwak9OYi96RlJHYlNSdXRFUHJoNzBB?=
 =?utf-8?B?NXoybDJ4YkRDRGFrbGVsNVV4YWVwZ0o2WFkxeHpDY1NPeVBhcm9FTUgrNE9O?=
 =?utf-8?B?dEgxSk1FcGNtZUxLN2JHUG5FSFBzL0pheDE0QUNKTkpnN2hoclhJSnZBVUdu?=
 =?utf-8?B?SkNCMzdIR0xYZmN1ZnlORkdKOWFvcXp5d2pSOHdIRWQ0dkNwRzI5RlJZMVRi?=
 =?utf-8?B?aHcyQ3kzNlpHM0hmM0VjZkRGSlZTT3lnK3laa3ZoNEF5NTBkVHo4cHI5THpR?=
 =?utf-8?B?MkRTYkVlZERUK0NNU3FjUDRWNU9TOFhnRUZKZk9iYW15Uy81ZmpnbUh3OERi?=
 =?utf-8?B?bm9YMmVKN05RbW1FSDZ0NFZ6ZHR6UnhUZE91VllFM2ZsQ3d6dkxEbVFEZVVv?=
 =?utf-8?B?UWpvOXNjMHE4cmY5aFQ5SUl1c0VnTjQ5VTBzcnVkM1Q3eVV1TGp4cDFqZ1Zu?=
 =?utf-8?B?VW1VMnVFL0laL3FqMm84OElibDByMDlpMzRyRXhFODlzWFRKUWxaMHN0WGd2?=
 =?utf-8?B?MU5IMkJaa0NncGNwemhzeXI1a1lQRkRnMkpSSWFHdTkzcThUWWFSY0ZFWjJr?=
 =?utf-8?B?eUl0bEt4QkVwTXJtTmVnWVFuYlkzR3BOVU9vWHdyVTZDRmxVVUZXenUvYjg3?=
 =?utf-8?B?VDhjV2NGazhaQVl6dnMycWRFVUNEbFl2NlBvVGlrZ2lyTUlsSWM3N3RyWHFm?=
 =?utf-8?B?T3ZDM3NJQXUyM0hxTGxqUll5SkxlUkVyYldoTzJ4YVZjdkg0elZpQnhCREJ4?=
 =?utf-8?B?WWtUTFZRc2t5ZXkwdy9oMTBwcU9aMXJlT0dVYUdidjcwdHp4V1M5cGliREFE?=
 =?utf-8?B?dWhDNVo2ZC9jcWxPcWhHVTdNVTNKaWpjSmMvTVhQK2xuZ0R6ajZIWHlQcUht?=
 =?utf-8?B?SW1KSUR0ejJPZzFja0s5amVGWHUzNUJyNlFQUVRvc1dlZW1ZREZOMTJHS2Rs?=
 =?utf-8?B?VVNab0dpRnJLclY3eTFqWnp6ZmVFR2h5bllFK2M4bUtDRFJkSUFpYWRycEZS?=
 =?utf-8?B?UWEzMERvL2c0dlFtaVg2QW5sanBkQnVScGRJb1A5MjVEbGlyTGI1MVlDZUxV?=
 =?utf-8?B?SUdqTEhVUjRIRGx2S0Zva2hYSFVkdExCTGNUVnQ3MS9JZm5CTnlZS3ZFbnNE?=
 =?utf-8?B?UUhlQ3J0d3hIaFBadzlRV3JZelFCWWgvK3RQSlVUaFE2VFM5YXBTVDZYQzk2?=
 =?utf-8?B?enBFcHdReitnNlErMUhSeDdsUjlVVm9BM3ozaW9zRkRzM1FPRTZBdGwyUTZX?=
 =?utf-8?B?emwwYkFqUUE3ZDFJQjA1cmwvU3J4dVFlempHbzZUcDBnMm8yNWgrenh0b2ln?=
 =?utf-8?B?NDdlalNMcHpuMVhJYUprazFUS3BHaTVuekhpZVpiUHNWZzBCREZ0VWhRMTEx?=
 =?utf-8?B?OGxsSjl2UDlscEZRb2c3eHFMckhvNUZ3MkVkZXBGeFBKbm9YdzZDR3VjZWFQ?=
 =?utf-8?Q?bMGHUTgYwMqs2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mms1VWQ3OU1lVlVtZW51RXZYVWRycktKZTQyS2txQXc4bCtkdC9USFVwTnhI?=
 =?utf-8?B?VFlsL0JzOWpvV1JOakJHRmR2QTdWMk5MMjk5QXRKRk5HN1J6SC9kSTBzaDFp?=
 =?utf-8?B?MTFURWhEUjcxSWRkbW9iZGtuMzEzZnR2bWd3TURGMk5xeEVtOE9KT2ZiaG1D?=
 =?utf-8?B?MGtXbEt4b3dsK1FpOTZhY3hOYkcvaStxWXRmWmNLazlocVR2dFRHdHlFYUFY?=
 =?utf-8?B?VUFnU1JEVnpBejdGbThkZEM1RzE0bGRLMEZOVFJ6Y0ZqaStWcEp6YkJmNlNw?=
 =?utf-8?B?Tm81RFlEV0JDWUZRSlVwVkQ4bEVNNEk3dHpFVkVQTmRJeXFKeitzbW5ScElT?=
 =?utf-8?B?anNNZzFXSUhmd0dpbTJlRGVpeUEwVHMzQU1pTGVsUEhUeUx6TVVWUEllV05X?=
 =?utf-8?B?a2YzSTZlYnZMaEs2TTdXb3haVUwxcGJESjY0NTBFYmNRbndVbVhHN29RWUVG?=
 =?utf-8?B?MWJUYnVITnZjRDBNbGdPZWJUQTc0MzNVTU55aWVoTFJsemk5TGdLNlN2Y2hh?=
 =?utf-8?B?b09hNTUvQkp5RVZDdFc0SjB3aHljclpCZWsvb1QxMW1DeFpUdW1yZ2Nvc1hs?=
 =?utf-8?B?OVlOTHJXeDZTUTlaMHZMVFJPTEFWOGVUUG1ZanZ3UzFJd1dCdW0reU4wT3NW?=
 =?utf-8?B?WmlRR0RUSDhRQWU1d0tudER6SzU4SGpJUGVoTHowaW9LMDhFWE95WGtGaCtC?=
 =?utf-8?B?M3l5cVJEdlRVaXBIb0UvdFJUVXRQVy9wL0VEMkl0OEdLRExKdlovK0gyaVdB?=
 =?utf-8?B?cnpQUXYzM05Yc3RtdVVvTXVtK2pwT3RJTFUxN09ycTk1WXNVbWtTVjJkcUtC?=
 =?utf-8?B?YURTZ0dJQVYvY1NJSC9iR1A4MTlHNDJkazY5d2VoVVV5b2loeERsUFFrZWlO?=
 =?utf-8?B?OFNWa1ZpdFkvbGRhUjdmUWhXTW5na3hlRm9SVVZjWlB0czB4c2x0dXk5SW9Q?=
 =?utf-8?B?ZDM2bjlhMTN0Wm9CNUNmcWhJNktHVWpRcjF2dzBWaVFzQkllM1JBS2NUVFBR?=
 =?utf-8?B?eXBFZy9CcTRzcGZleW4ycnRvcllETmJDTzRGcGdGbmdudTRvOWdKemZ0RXRo?=
 =?utf-8?B?R01GblpjSXJZTnVZWWIwRlZHTHl4NWhEL0FPVHl4VUJmSlp4UWMyYVlOSW1T?=
 =?utf-8?B?RmJoNWFFdVlZVVdhNk1Zc1QwaXBZOFNvZmVCdVhvd1k2NGxQdExwci9DT3di?=
 =?utf-8?B?Z0tLRlNGQWV1dnNPbXIyeTcrVDl1L1NZakFPcGdONWYrMGc3T2ZRaU5yU1lT?=
 =?utf-8?B?LzVSVHduMW1iQjVMSWpMN3NUOERIeWhDbkdsWFpvRERBUVZaQmJMcDNOSzYv?=
 =?utf-8?B?OGdiVUNPbmw5dy9zSFZodFk5OVdLcjJockZGbVBuZEFoZ0o1SjNxdVFmc241?=
 =?utf-8?B?UHZHTWx1VnZzaFdaRlVqVXVrV1hpTDFKbGpsVy9mRVFON3k1K01KWE0rRmhl?=
 =?utf-8?B?OFZVVnY0M08ySE5ISGNiMDhYUzNLRHRIcHdIVGRwTEd0QzNybEFla29GMVhB?=
 =?utf-8?B?dUI3RUZQemF1QXhZRlNpeWtUcUgvWVc2ajN2SHN0N3RiblJKT0pjU1JHNklC?=
 =?utf-8?B?dVYzSkpINmZWaFpFTk8yR2xMaU1qWUZ3eStqSTdTekxMMnJ2L1M1Zzl6VTBa?=
 =?utf-8?B?cjVjYWZSN3FSeW94RTV5MG9tUmlRWW9Ua0pHdjdZRUFLT3BxMGg5WTVwU0Fp?=
 =?utf-8?B?RlV5S1B4eVR6TjVWeU9rbDBtNnhGcGdCSDZnUzJmVFBSajN2d1g0RU5zYmpz?=
 =?utf-8?B?OE9xK1pQK1VqRFV6VGdZaXpjcWRyMFpjVVdwelVFU2RxWlMzOWlZU29pS2tH?=
 =?utf-8?B?d3pCNkV2cWhzMDVKVFh3aEZReDlrbEo4MXBBQlFFdUV0bUUyVDJoMVRkTVpL?=
 =?utf-8?B?dnVWSVNXbUVnR0o1Uk1WY3p1V215dFZQZU02NlRrK2w1VVdqTXd0VmowdW9a?=
 =?utf-8?B?UkRkcnFieDlYOWxQSHdwaWxVbUg2Uzd4VEZ1Ylg1NExzT2tkNytkeWNQVmE5?=
 =?utf-8?B?YlJPdUorVXkrR0hHYk1FdTZvME12VmhZdkFTQTdTSTkyN1NvcUVyZXJHM3NK?=
 =?utf-8?B?dUdXWVVVQnNSeGxBdWR0cjNHdEEvY3M0c3UzQ1o3NmViUjAzQVAyRWlJV2ls?=
 =?utf-8?Q?Xr4xpcFx2L9hSqV5hoAChqVty?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6838dd8b-3b35-4502-ae90-08dd8d5d4a95
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 11:49:58.3283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFG8L97waoXaI0ZV0yCZ3xQ4XTvRdTK0snEgcNOrFaZLBjxGSFYtWL7pgqqlfTQ8HFCca1FZ7MMDCAz4ViEnag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6577



On 5/7/2025 4:41 PM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   08710e696081d58163c8078e0e096be6d35c5fad
> commit: 39ed4d1a0e03ce3ac2145ee7ef0714c78bae9c61 [7893/8235] jfs: implement migrate_folio for jfs_metapage_aops
> config: i386-randconfig-141-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071850.XaOkcCkX-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202505071850.XaOkcCkX-lkp@intel.com/
> 
> smatch warnings:
> fs/jfs/jfs_metapage.c:245 __metapage_migrate_folio() error: we previously assumed 'mp' could be null (see line 235)
> 
> vim +/mp +245 fs/jfs/jfs_metapage.c
> 
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  227  static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  228  				    struct folio *src, enum migrate_mode mode)
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  229  {
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  230  	struct metapage *mp;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  231  	int page_offset;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  232  	int rc;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  233  
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  234  	mp = folio_to_mp(src, 0);
> 39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
>                                                     ^^
> If mp is NULL
> 
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  236  		return -EAGAIN;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  237  
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  238  	rc = filemap_migrate_folio(mapping, dst, src, mode);
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  239  	if (rc != MIGRATEPAGE_SUCCESS)
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  240  		return rc;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  241  
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  242  	if (unlikely(insert_metapage(dst, mp)))
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  243  		return -EAGAIN;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  244  
> 39ed4d1a0e03ce Shivank Garg  2025-04-30 @245  	page_offset = mp->data - folio_address(src);
>                                                               ^^
> Then this will crash.
> 
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  246  	mp->data = folio_address(dst) + page_offset;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  247  	mp->folio = dst;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  248  	remove_metapage(src, mp);
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  249  
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  250  	return MIGRATEPAGE_SUCCESS;
> 39ed4d1a0e03ce Shivank Garg  2025-04-30  251  }
> 


Hi Dan,

This is a false positive.

In metapage_migrate_folio(), it checks if (!src->private) and only calls
__metapage_migrate_folio() if src->private is non-NULL

static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
				  struct folio *src, enum migrate_mode mode)
{
...
	if (!src->private)
		return filemap_migrate_folio(mapping, dst, src, mode);
...
...
	return __metapage_migrate_folio(mapping, dst, src, mode);
}

Then __metapage_migrate_folio() calls mp = folio_to_mp(src, 0), which returns src->private.
Which should not be NULL as previously checked.

I think we can skip the mp != NULL check from 
> 39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
It seem redundant here.

Thanks,
Shivank





