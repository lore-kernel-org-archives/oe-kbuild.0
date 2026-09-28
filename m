Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921684BFE83;
	Mon, 28 Sep 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625026; cv=fail; b=CGrHpQQRucgGspxq2bG8aa2nS8PnIx/ZVrSfP6cWjwZle+AE8kDpT9bIC5Jpsk7NGpyUwceT+slz+zhQ0/trF7tvYkXfp6RZIl08i6FoyMOrt9j63oGdGwChzjj08wleFX4HWN8d85liwICA3pMn+xyns6K/WZ6L1nMQN4Z4oOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625026; c=relaxed/simple;
	bh=DnehGOHkN06AAVRazQdxA3sTe6UXWg5ZQUE5Qh8miN4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CcvemQUJOuSIKtxgcbKVjKMfSzWJXazk48/Y9DrN85wNThVuVBM9UqmbCcWU/fP+7CMJbQkiPphO3WtXEvo4dIHYJjVMEPL1IhE+/ACPuiDQpE6wEJVXrzv7XRTKQp9pYwOj/TbPt2f76/RDepxM4ZrIMQtElwnCaN8Wf1HeeW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t54IhABi; arc=fail smtp.client-ip=52.101.193.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t54IhABi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC2FpFbTYj7qrODaMngNwpVie2twYsnspnxq1zadTuJCiDKno7yxh97SsyXxcwPMof16KR1UBvNRPQSV59ClHODK8iL2wcupA6Dl2A5vkQ+cJcmTXLV0Df54YB6Uq0W/rDHpP/a9o66092tcusRLaLrw1vN3U0sPGGR4LFky5ZnUzuAEgPysr4C83CS8n4kGvyIt3Z7E7CMXdiD61tYRcZ/cjtxBoyIE8l7etGgEI4J0QMYNhbPLRZ0gJZk6d2GKIA9xj1C/E4jbQak1PVxamDJ78FMsW7eRYaJgaGBiOaZ233DjRFWdqZ8U4bHIWLAWonii68iqdH0J+1xIj7/z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40phGd4tLLR7M10vBR6Zljm4/XOWVMwh8Y/DwD9VcOw=;
 b=UtdCkLNEy6jSHyUSLpAQSIQwRFzMd/bwi+EtoMwnvDEWyzKwPj4LON7D44H3djJxxZdrmWToajsbs+ojMLr1YNcgRITHsSmXJzWeSoXCsTsQYbpDWSX+x5KMnW+fzWEYiLx+o6iaOR1lW9m+hUJRn7MHr/x9GDEjWqwRwNrHTB7BxwfQkirGtkxUm+UiYGs4wPrmOegSJSWh6QVMlGccJ6kohhNWtIX1OmcTZ/KJmxoVDwztymOjdk1ffZGS8XafztHL54iYRffXsF9nRchLTN0ZZXzc7oNLOJAdaNgpanRsfhIjEFQBSJnD6HBUQihlxhM1m+N0eHa4hdLQVJIJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40phGd4tLLR7M10vBR6Zljm4/XOWVMwh8Y/DwD9VcOw=;
 b=t54IhABi3rAh6X/eDvB4pufKlS9jNPg53QuwQ1S/vnPTaNmylBYHEy/4+Qf32M9M8lKl8xrD4VGxqm98w3lE/H5fE013E079LnXaEztyvTjbsv+XmZzK+joMa37G2FNQNsz6lL018/t2FdzSckMdcXDTYZokfrqKLggBrBQvpMc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 19:50:19 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:50:18 +0000
Message-ID: <590e390d-3c39-41de-9531-492ec4559220@amd.com>
Date: Tue, 29 Sep 2026 01:19:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6294/10910] sound/soc/sof/amd/acp.c:1469
 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>
References: <202609271355.u0pymQoF-lkp@intel.com>
 <eebb7c55-e999-4aa8-a1ab-5a56f39b2382@amd.com>
 <aroOvlIaaXjiT_Ti@stanley.mountain>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <aroOvlIaaXjiT_Ti@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d5c128-a01e-4f1e-f059-08df1d99b93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|13003099007|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H1fNazODOz8zdb9xoJVDCo7jBBTf6+rIySeEj1JWIh6A1ngpyhI3IY0m1upCkB10NSS/eaHcXDLgOncKpdQLb6KkY8L89eiYmWr0GbMpY56q61vv6ZqFQwnrz/4Kxa5CgxGCHHCahcO76+y3R0hU6ueRh4GecQT9FVMI5SyxQSs3frSD6m9mbjNzKdM82z9bRHzGjuNYSR3YQ/KGot9wrB6DUvADfEkIDUINfxWvM21G7RPzP/qNBoXbhYwjdyTn5uWeIXnhdmTnCLfz+l2r4/Ejva+q03X8ZDnFIM0A50dorpQFOt6Wz3UfZbQHg8i0tivs9KjKHN8HdT/lfJct/wW5lECUFz3qX8hvWXWKrQww8ONhb/ZP59+tCDlmwRUBqy0+nxEX21jp6J2/G45dVjNp7YNOsRmg8eByfENmWTQOJdZL/6AL0oxhoCy1fYRmvKlMvm/izrWl81YrZBoqWvqtCD0a+uC/nSbP3EiDT4OrG1wXmMVefzekV7pduozBRA3dE3zZMDgWQM9POtEVTfLjGXVCDTluila54Hx+wZXGCYdUkgyg3TZt0t46e6fJvkVcMHp1K7NTyB5kqdC/FglK3X36hve29Wr23pZUcN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(13003099007)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qi9YS2hCRjJDQytVODhQcGZvUHJLajZ6RXlyZXovUnhRNTNYS1IwTWg1b2pI?=
 =?utf-8?B?c2IwMklLdVlIbTY0ditJaHhORGJlelV6UjA3c293S2NjeE1tNnJPQ3lBTDZk?=
 =?utf-8?B?WDdVaFE4Rm9hSmlwR0M0dVp2SDRTcENjR2F6cCsreXFBT3NFTmhFOS95ZjRR?=
 =?utf-8?B?VGNHVmhNTElxSHJHMkZOaUplcWY2ejdMcVc0RDRXV3licUU0YzlmN2xmeTB3?=
 =?utf-8?B?bGt5b1RqZ2lqT0VMZGdTL2plL1RZWC9lRTBXWDlFZVVzaTNNVHdxRHNlWmVZ?=
 =?utf-8?B?MGhKMWZqaXJ5eVNKT2pEMUdhaE1hQVdtUVhrWFA5RUhKY3M2T3FBN0JlcHI3?=
 =?utf-8?B?cDZDd1ZUQXNDdE1tNEpwY1FRS2c2c2dGSDZsU3lROHJGdVNQU0o5VmJWMW95?=
 =?utf-8?B?WDlrZzR3aE5FWndVTFEzWFljOS9STTFjRWZJRjVtVWtXOTlQU2E4VnRxYUcr?=
 =?utf-8?B?bnFSMFI4cVp6SmNGSnVjaGRhSTVIQ0tGNnA0YjlqUjdyMWMyNno3RmNDTGln?=
 =?utf-8?B?dXd5UlRUenBrdHdYNkZCMlVZUHF0OWhqa1dJRmszMEdFajArbTdHNmZDWlpx?=
 =?utf-8?B?b1B4NmRyYWpQNkZNWnNGU2ZIUmhzNFBOSkpTQzR0Vm4yQmJVdmhPclp4ejFO?=
 =?utf-8?B?Qm84MzBIMjB5MXJPb2lWb3hKQ2UwSUd5UHB1eXVkdUNKdWxwTXB6U1FsZnN6?=
 =?utf-8?B?SnNtZmFOakJhdnNNeDZXWFh5RTBCVldtc3g1NU51eitJVmZqeFRRRmpHTTZz?=
 =?utf-8?B?enNoTUJzVE5ScmtFWm5MVXNxRG1pbEJ1WnlvR0ZDazhFclFjSHQ5OXpFK3FW?=
 =?utf-8?B?dzJHUFpoZEczZ1p4Q2JkRFNBUjdLaGdLcjhDUHNaRlM0QitqT3dzcCtqUzQ2?=
 =?utf-8?B?VHY3U2IvSE5nQkdRa1lTQk1ONGFGRDRtNVF6U2hyUnhXVTVwcVBJQ0p1RTJk?=
 =?utf-8?B?Vkk4UTZFM0dCN00wTERWdzdVWUFhTTBhdngvVkJXalZ5T0JoNlF3SUVOVTlR?=
 =?utf-8?B?MTR1b2tFZnFDR1hLdWNoa3ArQy9mSUhLQVZqSFNwU2Y4QTMrL1FzbGp1MVhr?=
 =?utf-8?B?TFlrK0JqYmFCQlMzb2ZET1ZqaC85OUpBYmQ4NzJpOUFLdElOUWZKdXBVY05l?=
 =?utf-8?B?V2IwbVhENlo4b2ZKQjEwUkh1eE43RTZ3eHpkNXlHZHlYVkZqOVdvUXVVT0NV?=
 =?utf-8?B?a21rZktiNGtnTkU0L3N4U2E5cVBkZ0poQnpVcTM0dzF3VjZxN3NheHRscjI4?=
 =?utf-8?B?SHJ5NGNPZmVEOEhKc0dHak5Cc3FSMC9mNUhBWENYMFB0U0ZNTTZIcTVpSjBK?=
 =?utf-8?B?YVJUcCtaRXMyUm1TbTRUV0VWOGUzazkzMkdQYmw4V3FrSjNMenhwcjBzZzA3?=
 =?utf-8?B?QnhSaWpNb1Q5RHlHRVZURlBvUXF3ME1QOVRQTkxaTjQxR2g2bFVVRy9GbCt4?=
 =?utf-8?B?VExyWmZ1ZmZuKzRBMmNWVHV5emh0cTNpZDFpVjduNDVCRzkzcnUvRWxOVkRU?=
 =?utf-8?B?bHhock5jaHV2di9WeU83VXdkc1JkTVFMcmxXRlhENHdTRUMvTHR3dzFVazRP?=
 =?utf-8?B?clNqa0h3VlpwODNlVUw1T3ZoZUpocS82ZjR6a3p4czFrRlFqeDlHUlR5ZFpz?=
 =?utf-8?B?aC9JcWV6UG1ZUFIrQkJ5eWtvWXVkdXZVVldaam9SL0xOZVIveFhsM2NXMlJh?=
 =?utf-8?B?dFY0cHllQzhOL2JoN0JBNVVHREFLWmFnT1M3aFg3cHFuVmJUWjZkQlovR05a?=
 =?utf-8?B?bnZEY0dpWFZnT0NwR0JmWHRtN1ZGWVRtNlhLNnYwdUlYUHN5aVhWUzlDVzNi?=
 =?utf-8?B?cVQxMWZoRkZhTDNDN1pBOExTMkdjRTc3UnBEcDF6Y1MyRGRJeVlkY0h5dzRE?=
 =?utf-8?B?c3dHMFR4WWVYMjRiRXkvUDVDUlluZXZ1a25WeU1BTHl1dHZuSHNsdVBsT3BY?=
 =?utf-8?B?NDFmWmhpWXRjc0VlNk5oNWN6TkFEYStpNys2K01BZ25lbnZ0RkUyRDFSeXlK?=
 =?utf-8?B?ODFnQXVsYlptOGxoSGVZdlpURmtFcE14UEg4WVROc29TN1c3SHJyTDJLa1Vw?=
 =?utf-8?B?TVZTYk5QdzlIUndMc2FELzgxaWtuN3NQaER2MDlZK3M0Sm1OcWlsbFRRUzVW?=
 =?utf-8?B?VkxuRldlb3diUHBwTldPam9OVDhmZDl2dVhVSmh4YUkvTVJTcXllMVJYajlQ?=
 =?utf-8?B?d25HQXh5bG1lWFYwM2hrMTNzUWNxRXFjYkUvNjA1UzU2WkhoZTBuSStKZnJK?=
 =?utf-8?B?WlJBRUhhQS9WY1NlWWh6OTlFV3JtVGEvVE1uYWlFL0FBUEJ0UEZvRFlubjNN?=
 =?utf-8?B?eHhRSTB0UFpYRGNHek1rK0xpVVFvbmVYb3FMVmk4aDhMNDRVdXdudz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d5c128-a01e-4f1e-f059-08df1d99b93a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:50:18.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzNDcvcgGtOuX3ETl00co+GF31KoVKK8amIPW+cH9q+Lnt1wmQL/FChownHCBWY3bPBJAz9++iLZ4GLMdevv3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111



On 9/28/26 12:22, Dan Carpenter wrote:
> [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Sun, Sep 27, 2026 at 09:29:09PM +0530, Mukunda,Vijendar wrote:
>>
>> On 9/27/26 20:52, Dan Carpenter wrote:
>>> [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
>>> commit: be2823854e00558f46f5bbb124bb3f3a3bb9a94a [6294/10910] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
>>> config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271355.u0pymQoF-lkp@intel.com/config)
>>> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
>>> smatch: v0.5.0-9187-g5189e3fb
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Reported-by: Dan Carpenter <error27@gmail.com>
>>> | Closes: https://lore.kernel.org/r/202609271355.u0pymQoF-lkp@intel.com/
>>>
>>> New smatch warnings:
>>> sound/soc/sof/amd/acp.c:1469 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
>> ++
>>
>> Thank you for the report. This smatch warning is reported because the
>> ACP7.B/7.F SoundWire specific patches have not yet landed. Those patches add
>> support for 4 SoundWire manager instances and allocate the platform device
>> array based on the maximum instance count, which resolves the buffer
>> overflow concern flagged here. We are currently waiting for the dependent
>> patch series to complete upstream review:
>> https://lkml.org/lkml/2026/9/17/1422 https://lkml.org/lkml/2026/9/17/2552 If
>> the review of the above series takes longer, we will post the ACP7.B/7.F
>> SoundWire patches for upstream review independently and include a note in
>> the cover letter documenting the patch series dependency.
> Just to be clear, it looks like the bug is there in linux-next already.
>
> Btw, it's better to link to lore.kernel.org instead of lkml.org because
> everyone uses b4 these days and we need the email's msg-id and lkml.org
> doesn't give you that.
>
> regards,
> dan carpenter
Below is the dependent patch series.
https://lore.kernel.org/alsa-devel/20260917090407.3828816-1-Vijendar.Mukunda@amd.com/T/#t
https://lore.kernel.org/alsa-devel/305d8770-50f5-4489-a901-f73069a1b964@amd.com/T/#t

Will share the link once the ACP7.B/7.F SoundWire patches are posted for 
upstream
on top of the dependent series.

