Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6780E2DB783;
	Tue,  3 Feb 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114892; cv=fail; b=Lu7xjOD0vcGlLbDYnCe8w3V3Y50ovHeiJcLz2rof0yKdNvMfyJDcrnNPdy821aPRduZl1+RqoOVe7eINmWg+CxPp2TF8Hv30oXMP+1SSweYGanhjmT8igGDOJlFI2PCklBIzw4TE+StJmsMAKNQJP2xdaVycNPfznKqeGCPz9ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114892; c=relaxed/simple;
	bh=E/XxeOCkFZVMokPSp1B/dxrCKVqLdWaXNUZRFfPZEeg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K6vu9jjyDkWsDBPa3v7F4fySLgluC4we1cH5wHYJ0XbNBISelMIpunyPBJfgfoaus9DUgoocc/voKLS/GkQXf2xHNCHa60+bv9mjZRUpiL5/pp0D5VrG5HuDNprdLrNdqbFDnTxyhIp4rPkyii8XxnCuRAMKJHEQ01otjHrA7O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Psg06onJ; arc=fail smtp.client-ip=52.101.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Psg06onJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gi01oTAytmpNOQqmhbqCmGDVb9AfoEm115w90Vw631eK1EKSDzFbPNxafhECbMwIKcF3oiCOsXyn5V4AG3g+47BYYhWzrFFIA9kiCQ271HwVZ8DOZrbMnIPbb0PTuvvbDDBV51Qwwyb38Uxtgwatm7dum40+uHEz8u2c+qxqRHD5sIPYqfeNRrOps/jxVQg1EbvT7s+soaYn2I3z15r3XaCEM1M3F+D0+XGaCelCm2JVfXjW1M1iVraBcYku23mSyNsDrpIi27S6aSgP4YM67aEPvp+UOr5vGClz6GWAYhbU7cccby71DYkcIqPwm/jC6evCLA5f0p/p2qpbWSGPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgiP16H/5vbOAOUEQKRXSwwi65RPFZzRTBXoK/c/1Qk=;
 b=kYVdOD4fJCQg1XUUVvxpwdrRlGIqAL8bUN2yej/Q29QVjNOMRNtZm50NSrpLw9oPMO/ufzHOd3FRD2eShVAN5macaN5u48HHCq0IJRTXPilHxr+vOvwlZpUlqu9RFY9oO5egL6gVo186tnlN1ZpEXLQ9tT/C61DjW/XcnhbqyjAKsHxFssYZLLnE8PpBjIDlVIwb8vrUzg3pUHjk75/IQeNcRxFaQlkQvLG3KKAjMad47b5RqeI6MsilhxE4tJzsgE5Q9bd4YA/nmurY14uDGZooEoZA8/vX7ZMtoAaG1K+tZTGN7jhFACMaUlEY1Czdu2a0YXAuSqitnXgR5tYJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgiP16H/5vbOAOUEQKRXSwwi65RPFZzRTBXoK/c/1Qk=;
 b=Psg06onJm9nggY5KGP9Y8/7wLnB/o+JcxctgcEcLzYg0YHG86unDDI1+ZHWWXA7okYHWCrsH75mJAZ9V2hA7iKhoAqsZAWvvVo8NWVFjiAJMRbgv/OaS3hkT5oPpPU/thxCFzORZ+9lx66Hj7PZ4CaR9U4KpT9CfBq43/6ANHne6l9TAti+wk8P8aPuMoDdNWupDVMp7s2aIFrVwU92K9kXo5SCWKN2dKglrmYnXkkpWIUWvKhiid57JCm663zOkTU49RPRi7dgT9XzGiMjjMNeLjwVGRQ7vla7LUsm9vdz9fccsLWmip5pLAHlVy2tmmN5yDOZ2PmxSK1PR/pMeJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:34:44 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 10:34:44 +0000
Message-ID: <ba7dea85-4bd4-42f7-be04-c23afff5b34b@nvidia.com>
Date: Tue, 3 Feb 2026 21:34:40 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: lib/test_hmm.c:932 dmirror_migrate_to_system() error:
 uninitialized symbol 'ret'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Alistair Popple <apopple@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <202601152125.McLpiKxS-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202601152125.McLpiKxS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::39) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e007361-f40b-4026-9f36-08de630fd8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R043SHdxN0JBR2QwUThJVCtrYWpvVFBSVXNMMFh4OW1pSHc5T2k4NDJGUmFP?=
 =?utf-8?B?QzJGdW5WRFo2MUhjUjJrWEJ5MXQ4ZFpxQVlvcnVkLzMzN0JISUdTRXlWc1Y5?=
 =?utf-8?B?YzdBVVhMcGF5WmJMWis4TE9iUGcvYytoQlRkVU5DTnhMV0hJckF1bkd4NVJU?=
 =?utf-8?B?UW5vL0hKNGQ1QmFSblJZSnB6Zm1NdllKYmM0V2dRd3hNNkkrVVRHRDJSL3lr?=
 =?utf-8?B?a1B4WGp0bjhGZDBGYVQwMnI0ZUwrSXo4T2dnK2FGZk9DYTFVSDArVHJ6bDhu?=
 =?utf-8?B?VUNtNHZDdHdRcGtYVUp3YW9VMkJmUXd5SVNGUTUwOGorSnBObXgwM2U2OWts?=
 =?utf-8?B?OGU1WDRnczNtQkNSWGs0Vy9MUmVxQm1VRUpRT1I0WmkwUUF1YVR2Z1ZKbWgz?=
 =?utf-8?B?YldtSFByeXFPeTFNZm8rY24vb3orMlRUVEpHaXA4SVhpd04vaUhWcUdNYU5a?=
 =?utf-8?B?TEtNZCtpaHpnNmt3RDBIcHhoQjlYcXBSU0h6RGpyT1dLRVM5aHlmZDl4d3hv?=
 =?utf-8?B?dE5NU3RhQzF1Z0N1dzRQQUNNd0I5MDQxOUp4Q0h6b1RGTGJYdTNCY0VjdEtF?=
 =?utf-8?B?TGRISW1iOWJPamY4TGprNHRCZ3BuNXR4WURWUGpyZHAyV2Q3bElMMEFUR1A4?=
 =?utf-8?B?YWdDRHF6dUk5NVZaMXRMSjMybUxzRGJjb0VDQmRvUitiUm5sOEtHY3IvVGxH?=
 =?utf-8?B?MVFpTUxCbmpKREFtdjhVVGJMSGlJQkIyQ2xYS1NNRGNzMjY1VWF2dHRscWha?=
 =?utf-8?B?UWhvZFpKR204K3N5cW1jR202YVNZRjVSVlZ5NXU5VmNjdlROS3JNeTlYZExo?=
 =?utf-8?B?RzlVaUdMTkMvSEZGNURnam5ZSm5CZ0lRVUNqN1Vtd0szaERHOVpqSFlKWXlJ?=
 =?utf-8?B?c3VnRXUvd1gzQzBjTTRTc1BmUTc2TEFxZ2lWak15NjAzVnNPSGgxRS9kMlZO?=
 =?utf-8?B?NnJDbTB2R0ZPY2lnT3dQWkhQa0NXRXl1ZUFrczZrUE5TeVJIWnFvemJZMmV1?=
 =?utf-8?B?RC83MHVaQ1ZsSi9IT0ExZEJ5aGtFQ0hyYklqc202V3NKS1g2QU5XQUczQkpT?=
 =?utf-8?B?c1d3SXdOSmltcEQxS3ZjMmpFOE9rZ2FkMW5ZU21UWXI0bk12QUJBazJScXBP?=
 =?utf-8?B?dVRjTmpiZENrMVMxR05LamtDUWp3aVhkTU91M1NmWHdmR2wwMnhPTzluRktO?=
 =?utf-8?B?T2VIYktKNlVIMC9vajg4bi9KSzlXTTZJRFZJY29MQW5wLzNQTzlyTklHNUhj?=
 =?utf-8?B?enZ0Z002M09sTUl1TkZUQ05oemY3aENqVk5RRjFnREh1S2YvMnl6d2UwaVdZ?=
 =?utf-8?B?ay9kYngrRjk4Sk9uNllGUTA0d1MxaitFSktOdldGaVZNRENVc3FRS1p2OG9y?=
 =?utf-8?B?eTdGTkZaKzFoNklMeTlQaEZ6Z2daOG5HMFQ2eTZscC9yTzgwdExVcnRQdHFk?=
 =?utf-8?B?Rk5TVjhrOFc4TXN0TldWZldyZVdtS3dLUk9KUkZEelc4K3lXL0ZTQ1UyUHNm?=
 =?utf-8?B?T1R2TU04THVXWWcwNEJlbFZickZSTnFaeGZPTzVtSCtzWElRdkxybXQ5eElC?=
 =?utf-8?B?QWJnVENlaGxqdjRmVUR5Vlg1Qk1TajJONzVnSzR4WHdUc0dkMGhDRXNPck9l?=
 =?utf-8?B?SkVBVUJwZGg3TFVpMzI3T1dJcndETjhoS2pJeHBGbzROUSsyNEMramZqOVBI?=
 =?utf-8?B?Zjc0ZjZiaGNEOGZnSnk2OU4zYVhjR1hOYzhUSm14L09ZdmRvUGdCaUs4T3FJ?=
 =?utf-8?B?SGx5RVZiaFRabitJTXdNQ29KUWVrcSt6dEsxQ0ExN3c0eE5NeFQ4RHlLcWZI?=
 =?utf-8?B?cVZGcklCcVBSb2lYK3dmL3VuT2pzdGRWZTBPRnh6Q3JNSUptNmUwRjdoQ0RH?=
 =?utf-8?B?amxSWTEwZnhOZWJMRllqa0FTemRHUUZxNjhlOUhNS0NZL0ZGa2U4dkQ2ckFl?=
 =?utf-8?B?bkdkSG0rVFhtb2lXWnU0WjlIeTZZbXJFZWd5NzFBSXNaWXdrbGZQRDBlSlpT?=
 =?utf-8?B?aHRlUzB1ZGdzcTJjOWxXYjlLUjJMWUFydG8rM05GNjJEdmpuQWJHeWpkb3ZG?=
 =?utf-8?B?WTRtWWlhY1hLN3pobWx3RzZ6aklTTVEyWHFqTTRzVGRJN2dnZUlGQ3ZDRE0x?=
 =?utf-8?Q?Ay5M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1c1V0NoOWxQTlp4RGZpQWJMVTFacE5nNHJHTkhKRUhIY2ZaMWFYbGIwSDM1?=
 =?utf-8?B?NGo1THExRUNlVGd4c3JzSDM4Mm42SFd6bk1Db3d5a3kzajA3ZE1DYW5SRVhD?=
 =?utf-8?B?R2hZWEU0YjhFelE3RFNkNzBYWXBUQlVFU09EWUxFQkt2KzB4eWtJbDFud2dK?=
 =?utf-8?B?dU1YTWVvQkFEUk05ZGJNL3JzUDdlc05LZGU5K1BMNng1SW1GRmVaTTQ4RHdk?=
 =?utf-8?B?dlpzTEdvNXV3S2EzSmhQRGY2NC82YmdmaWdCQkYveWhud0hFSDF1dlBJYnU3?=
 =?utf-8?B?aVI4dkNmY3J3TVhkV0dScERFRm0vNHI0UHpzL2cxdUh5SmJhdllhTnNyT081?=
 =?utf-8?B?aUEvelg3RGFvTEd5T25rRHFQRUd3eHFwcVh5NVRlT2NkcDBsdHNZRmdJc2xR?=
 =?utf-8?B?VUZkbEhjZ1huVkk2K3VWU1JlOFc1bEVKY3RXbm5qV1ZzaW0vK25nc3hwVUhG?=
 =?utf-8?B?QW5SMUdkSGcvUS84MlZVZ0R5TjRlRXh5Njl4MUlHOXlGb080aVhWeFF2ZUZW?=
 =?utf-8?B?SEd1aUpZN3hWcXVBUGhDR3NOM0xQbmgwQlMxZUhGOWtudkZFMC9TeDRNZkhT?=
 =?utf-8?B?UDhrQW9hR2IrRW5yUCtUNXpXdm40cFdGNFU5YkR4eTkxRjkvOUoxUUNOWjBz?=
 =?utf-8?B?YVM0R1M5ZkFDdmxvam1UQkI0Y2xNYU1YMUhlRjN3bjB4QWxhblFUa1d3bWlT?=
 =?utf-8?B?b0ZiRW9STkY1dDhVMVZUY3pUQ0FYZ0dVbnpoKzFudXlGanczKzZkWk9JbUdR?=
 =?utf-8?B?UFQvbTZWTU4xczhaSUJRbkNvVWM4a0t3QnNUMW90YjM5NnIxZWN5ZUozWW0v?=
 =?utf-8?B?d3p3ZWtmQWN2SU5FeU5PdHpxbmdmSC9LM2J0ekthcXg0aEY5UE9xSG0vZFUw?=
 =?utf-8?B?WFJ0SGhHSEk3QmdLWTJZTDRFVVJTL0VuZkFJY3JyT1ZWL3ZYWWp3a3kwTGRq?=
 =?utf-8?B?VGVGeTJ1M2FCZHM0MFFEQ01rVDdOcWpDN1V0a21ibHpMMUR4WVhBYVM4MExt?=
 =?utf-8?B?U0NYQW5mT0EwQ1pPZmViRXBQUmxkbUd2SWRNS3JGdzNTa3J4Y0phQWFyQWIx?=
 =?utf-8?B?NTdQSy9sTloxdUptY1NMNkNGaTFxSzZDS29kbFgwK3FIQlFVQWgrOUZYajYw?=
 =?utf-8?B?aUUxVVNqaDBUYkRIZExlc3h2RkRkWVJXcHcrT3ZrZ3Q5RTV2ZHlqenJvcmVW?=
 =?utf-8?B?YlVWMGloRGJlWWl0K0ZzZ1dlR1NWZWJRNWNlUDlJUnNGaXdsSm83aVFUdlVB?=
 =?utf-8?B?K3FFaGZHSG5OWjJNMkdXdkVlR1VuTHZJWGg0Nno2NFlldHVPZThJVkRHb25D?=
 =?utf-8?B?WFVoRjF1aTgyTzVlT3NYb2FlcnMxMlUvZjhhaWRReGxycGJsSUdIdmg3SlF6?=
 =?utf-8?B?ZDBxK3ZldUJmeS9FVmdNL0NnbXYybm44eno2SGVpU1ZtcXVUZzNidXNlWm5Q?=
 =?utf-8?B?UFVLT0FtZlM5UC9XaEk5L2RFR29UNE1KV3B4RW40VEg3eUxPTHE1eEFJb1JY?=
 =?utf-8?B?RUcydEFZNWR5OW92OW9GbDV1K3BkcExuMzVsV0ZBZG4xQ2x4bTVFakpXWEg0?=
 =?utf-8?B?RUtCdmg0em1XK1g5eHZRYWlZT2dIcHZ4RDV3R05vaXlYQVBMMlN1eWVocG1U?=
 =?utf-8?B?UFM3N1U2dTBNTjBpOEhyam1ON1N4QnpiRnlHaysramg3QU9JUkd5b25ReVJR?=
 =?utf-8?B?SDNRWUVuTnhLQmhNRXh4dCtVcWI4UUZFaDh2L3dPK1J2cDVQMTJHRHRZUno1?=
 =?utf-8?B?VUs5NmcwQ2hESWZMVVFmQVg0UUhsTG1uRnR3NVVsQnpHOVkrc3FZV1lHZnk4?=
 =?utf-8?B?UlljU2NJbDB2bXY2b2VPSExEa2pmNGFONmphbDNHYmxaOXNxQWttK2FuVnha?=
 =?utf-8?B?QXg0Z3NLRUZZUHdNNU9Galpka3BDdUJLUFNjT29rNGRYY3hUSmRzVVhhYTZ3?=
 =?utf-8?B?Q2dablpyNWNHMnY4Tnl0am9IMmJRV2lzaE9YVjlMUlFGM2lCUmNvVWV6blpz?=
 =?utf-8?B?M3dJV2tGRDB0bktIUEJkbWRTTnVHS1dPZy9Yck1lVUhTa1RObXNnSndHelRF?=
 =?utf-8?B?UWZiKy9VQjN2T1VyWlVXMFZmSUo1bGwrWXd5enZyYXRBUVQ0QTNJK0NVUE9q?=
 =?utf-8?B?ejkvRWJSZ3VPL0JDVEhDYXU5aGNpalZVSUp2Qk44QTlaTGh3TDBXOGNCZ0NY?=
 =?utf-8?B?NzhEeDJQZ2gxak44WGQ2M0pHeHUyTHVCelNJZmVnVC9UV2Y1OC9vV3M4a0lz?=
 =?utf-8?B?YnhxYkh1aGlrSWxRbzR4MVdNZUF4eXZPTFFHUHplY1ZXeFg3cm83L0piT1pY?=
 =?utf-8?B?WkRlK01kLzUzeFFlZnQ5eThlNHJyUUVmaitQekJSZzl1Mk1MalZqQWJTNlFE?=
 =?utf-8?Q?jVN8o1l47502srGUtUwm4QNyBfa/uTUmcAQUqtXK2oU+z?=
X-MS-Exchange-AntiSpam-MessageData-1: lxxPoxu1+3WeTQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e007361-f40b-4026-9f36-08de630fd8e0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:34:44.8447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXItAA1Uj//dxcwfYHGGVNKfWfsMqRiWBOp7EKv+suqBTSxhiMuXh8W+5AehStc8IpgXz9Pk3ZSg71N6Su1vrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073

On 1/18/26 23:04, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
> commit: d438d273417055241ebaaf1ba3be23459fc27cba mm: remove devmap related functions and page table bits
> config: s390-randconfig-r071-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152125.McLpiKxS-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601152125.McLpiKxS-lkp@intel.com/
> 
> smatch warnings:
> lib/test_hmm.c:932 dmirror_migrate_to_system() error: uninitialized symbol 'ret'.
> 
> vim +/ret +932 lib/test_hmm.c
> 
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  875  static int dmirror_migrate_to_system(struct dmirror *dmirror,
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  876  				     struct hmm_dmirror_cmd *cmd)
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  877  {
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  878  	unsigned long start, end, addr;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  879  	unsigned long size = cmd->npages << PAGE_SHIFT;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  880  	struct mm_struct *mm = dmirror->notifier.mm;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  881  	struct vm_area_struct *vma;
> 6046a3bed1c2b02 Arnd Bergmann   2025-06-10  882  	unsigned long src_pfns[32] = { 0 };
> 6046a3bed1c2b02 Arnd Bergmann   2025-06-10  883  	unsigned long dst_pfns[32] = { 0 };
> 16ce101db85db69 Alistair Popple 2022-09-28  884  	struct migrate_vma args = { 0 };
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  885  	unsigned long next;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  886  	int ret;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  887  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  888  	start = cmd->addr;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  889  	end = start + size;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  890  	if (end < start)
> 
> If end == start then ret is uninitialized.
> 
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  891  		return -EINVAL;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  892  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  893  	/* Since the mm is for the mirrored process, get a reference first. */
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  894  	if (!mmget_not_zero(mm))
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  895  		return -EINVAL;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  896  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  897  	cmd->cpages = 0;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  898  	mmap_read_lock(mm);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  899  	for (addr = start; addr < end; addr = next) {
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  900  		vma = vma_lookup(mm, addr);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  901  		if (!vma || !(vma->vm_flags & VM_READ)) {
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  902  			ret = -EINVAL;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  903  			goto out;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  904  		}
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  905  		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  906  		if (next > vma->vm_end)
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  907  			next = vma->vm_end;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  908  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  909  		args.vma = vma;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  910  		args.src = src_pfns;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  911  		args.dst = dst_pfns;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  912  		args.start = addr;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  913  		args.end = next;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  914  		args.pgmap_owner = dmirror->mdevice;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  915  		args.flags = dmirror_select_device(dmirror);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  916  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  917  		ret = migrate_vma_setup(&args);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  918  		if (ret)
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  919  			goto out;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  920  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  921  		pr_debug("Migrating from device mem to sys mem\n");
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  922  		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  923  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  924  		migrate_vma_pages(&args);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  925  		cmd->cpages += dmirror_successful_migrated_pages(&args);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  926  		migrate_vma_finalize(&args);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  927  	}
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  928  out:
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  929  	mmap_read_unlock(mm);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  930  	mmput(mm);
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  931  
> 4c2e0f764eb4444 Alex Sierra     2022-07-15 @932  	return ret;
> 4c2e0f764eb4444 Alex Sierra     2022-07-15  933  }
> 

The code looks older than the current top of master? The smatch warning is still valid though. I was wondering
did smatch get new heuristics to catch this?

Balbir

