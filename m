Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA93C2779
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452123; cv=fail; b=tqe7GwDjV8lZ2aMJZGZ1R1ZE0q8SlSYYNzrQQW+Nm/ZX+j6zW0oQJGZheICvK3awsBtyu82WfwtYP5RADm6cTbEhlfTzs89wmfhJf1qcAQrGEPCpzbAR+fR4+7sJhJGfLC0Q5mko0WD/lFVos1I1C0OnWBT87zSoy+59ncAPVPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452123; c=relaxed/simple;
	bh=IDhKApKdN/pCqA4a0/2dstd1nSP43n3PSrpJPnY0RRY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PE76RXQqCzz3cTajUmu5b3QFsHKuPggLeJF+56vUHthBPf8n5WWjQz6mejyYscH+vjikmb3fwjI7P/x0OMyuVcd6QJmW7ahCT+aH1+pjqz8LuluoDVmazbmZIC4U59qfhuLtkUu0K9txCtNJvyEBRSRhwVEDVpUBrhA0vhHvU0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o6doZtWm; arc=fail smtp.client-ip=52.101.46.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o6doZtWm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umgrsiFQhIvCqe2HBbdjV5quZujeWF12yQvNI0DeUYaJcOT4goj7rHQzgShqVTbmap2oaN7pkX/KXKeWyLyllflFL5IGGW7q6dJDlDfFoCq8o/no+xZEwBe2KLar5b3sKcjM2m/0XLk2YzCEHqFy2YhoeQw4FMB0R6VMfKZGq1q3ke5emHO2a5pXM6bWLfCdrAeFiKPBypHHea5fXy8aQUVusCfnrx5ZeM2nXucNv5wQchAYc/Qf2q703SHu7BTEMR2Hcq3Jt0em6LJs0vSycqUVn9LsPW7TCqv0YDKVEjQbtULn8neejEDD9PIv0rPFdjaEp6mcQUH7chY24V7fkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td+4Ov/ZwRt7ow9Y78/DLd/LXToCev7n7D/Ij3YU6q8=;
 b=t86e5B+J0wG526Wg3gXprq67K2Vop8BES+Rsam4BiojUBPdaTIBfu+8Xs+dtZa3lGXmFpoucVfG2egmsRIcXIe1K9JhPOqWGLIjqlf/KX3KsRvAjfhm/StmJ30WbHKhD1Ayf7h7ce/9MlUfFA2YR0yAjkiS6KS9YtRv5EzHGPwhwtME2iGl85E372vv6Sd1d3lAbWcRbTrx3y+dZDspdOZ+1Cs6QNQBpvSHojyukKy6iHkmlAkcz4aecyf+U7Mvhx2YRVtLg5BzJTqs2IUyOzMpEIkTCn6jZcVcJh3rJxJyHV1oPYqjQRE+JD5zOVfBl1hvi6NoijYvi4gfy2KJB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td+4Ov/ZwRt7ow9Y78/DLd/LXToCev7n7D/Ij3YU6q8=;
 b=o6doZtWmTKG1pspj2L+J4PXptJqMEe2rltmZMLLh1IQGfltSLnnMdc0FC6QJJAW4w86DL795mLmeNqMdYDrDDriyVc7olTcpzfgw7mnOQ+c5j1CSQYKKvRJ2av8A1QlQJfmlU6hKRrtsqMTpAmAZH2b878tvyvO9hEhNT2WvfyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9821.namprd12.prod.outlook.com (2603:10b6:8:270::13)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:35:16 +0000
Received: from DS2PR12MB9821.namprd12.prod.outlook.com
 ([fe80::f91c:af1b:9bf9:7396]) by DS2PR12MB9821.namprd12.prod.outlook.com
 ([fe80::f91c:af1b:9bf9:7396%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 05:35:16 +0000
Message-ID: <96aa204f-8ad4-4f5b-a7ca-48df8c9eb187@amd.com>
Date: Fri, 26 Jun 2026 11:05:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/edac/versalnet_edac.c:785 init_one_mc() error: buffer
 overflow 'priv->adec' 152 <= s32max
To: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>
References: <202606061200.j14yIFYw-lkp@intel.com>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <202606061200.j14yIFYw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To DS2PR12MB9821.namprd12.prod.outlook.com
 (2603:10b6:8:270::13)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9821:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: d68eae77-6699-4a97-e9f8-08ded344b3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	AaVNz1DCggVzaCasyh81y2rbdLFf88LVqRC8oOAA/w4la0nNkr9CpUgAsW2vZqK1TTibheAUbCdt9AiTT/cPe5EvYARqBcNZ/UUhJumoy3i/0swE7v5gc2Rks3rmthPmaP9Osf9nh84UB3o2/10PRwX3ColoRys94iIDT1gPmKGSANgl+9CkBgh3WhH57FVQ64Uv+yXn2sZFQ9DOR91CWtMn4eFkfIu62OFEKoKjc3TW43plriGlsslkyjjdQje8FyQCb16rZZ1anrsRMRQziYaod4y+p3XRCJJcN5sgDd56k7BFQllsNKYfqYYtc1P+Yjwlptt7uXxEb+FgkZ30J6H0zSCR02H+5CGXU+lMVPz3flRXM9Akutp5xM9XsxrLDbiy6bp/uaHM1xLJ5oCDqaPWoxQvetAtMMU86fp5OAm0HbIPb2sIsRnBIRP5aMxRHKXctzbT2QXRSZdtMMnrz9lB6TtS4fmaJ3XpJHYDL6QO6dZtDZNo4i2Ex3bKtc6ZsZ315rB+CVeVXah+kENpAENdlhaLPjEUXD+v1JfrlU2ayEVMdEdpEodtNJdy8hauZTD9g8ur3LJOXJvibor8yHh1ORbyUZepO/c7uZVw7YRV7BoJIKIt3MC085g1m9VQnWLkxYpxGJbCnw/IUiSeqqaKsFJW5yyCjK9MzhtV+3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9821.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGQ2czFFWnNTankyUS9JbEZLT3pGcnAyQmFhNHVDczlMeEJON0xVb3g0Yk1W?=
 =?utf-8?B?VUdKclAxaG52Z0VYNldXc2diN2FCdzByZCtrczBQek1zUmhZeGd5d2NiQWRh?=
 =?utf-8?B?b2d6bVNVeXhXdHhWdjV1S2lRWWZYZGZPMmRZeFc5MStVSVIyMW1tSEQzc0NF?=
 =?utf-8?B?YkcwN25ZOWpjK1U3bWkvY2l5cVBORUlocGdaR0x3QmI2NGZmSDJhSzNHeEFt?=
 =?utf-8?B?RS82M2RNNVY4V1dUZkZjajlWV1ZqbkpKWTQxSHFKdklJR0R4am1BaVB1cDlW?=
 =?utf-8?B?T1FHbDVTYnk1Wkd0RWRweDhqYjc1OFNmRCtQTmlpRHVhUnBPVURyR1RkYTdN?=
 =?utf-8?B?YlpiNUI5NGpFNXRrQVFLSDJVL2prSmVoQjJiaE9pVzJZQUFDRFIwWmF4Tm5R?=
 =?utf-8?B?SFZjdmJ6Tm1ac1AxcmdIYXRpakNyYVVxY2MxZzZSbi9RandYVy9WeGJzVVdE?=
 =?utf-8?B?dnZPbHVLYUZMaWMvZm9GMW5DQjRBWncxY0pZSTJuSUdxRlpONFErYnE3OXdV?=
 =?utf-8?B?M2hFcHJCaDZrTi9kTmNWQ1loL3JxVDdScW9pdW5NeG8vRmRHSllBajJXaW1N?=
 =?utf-8?B?YmtDN01makZoRlIvK1p3TmJhTXNtNGFkdzgyRjRjQm5aNWVpWkNNbnlOV3Q4?=
 =?utf-8?B?QUF0dEp2cTBNbVRuQXRneHpremdZelNOd2tpVkg5OG1HQmZBaEttMDN2OFR2?=
 =?utf-8?B?Wk5QRTA5M0NBbVQraXdZcFJqdkVDWlRvV3pRRGZ0dG5vR3laa0thYWprWEFm?=
 =?utf-8?B?Zm5mdzBOYWtabXRPa2lMVDI0b1dqVmhCNTh2YjE5dElhL05RankrZmIvY3JX?=
 =?utf-8?B?YzE5c3NQNXU5eU9ZaG01Y1Qwby8ya1libWFXVEZTLzg2ZmFlWG5rd3h3UEgz?=
 =?utf-8?B?RGV0WlNTYldSeEZzTWhwRWw4RGpJai9NU2FXcWZsYy9KR2lKVXd3WXVaaENv?=
 =?utf-8?B?Z1NYTkFkZmt6dEVTWENoRVpqZnZSMWxCTjJ4UHdpK3p6Wi9oV0srY0dZdVd0?=
 =?utf-8?B?S0pvN1BReU8zUVlyQUx0U3ZaWld4Rm9XZG93T2RadWtFeldTeXdNdWRZb2F5?=
 =?utf-8?B?cVBTb21iWFFiVUlSNnYwR3BjN2RZcWtOaHBlaCtneVFCbnJkSmlLTkJHWEFK?=
 =?utf-8?B?RFRpOFZIbGk2N29pLzRZbWVaSko2TE5vL01rNjlTQmtZT1ZjcWE2ekxZRzlS?=
 =?utf-8?B?VXpWclR0V1IvRTcvUGVKcUplUjFJSDIxNHlLcnE4RlZyM1BtQWFmVUtRQ2px?=
 =?utf-8?B?SGFKc0FKZVJuYnNiR0VQMXBzblZDSzB5Rk1HMUJlQjF3aTR5U1M4ZlQzK0JC?=
 =?utf-8?B?bEZRUGNEdG8wSEdEbUNhTXBqbG1qaXQzc3l5dlNlNVpRQkR3MnVIMlpzZzRF?=
 =?utf-8?B?YWgrSlFFZXNzZUt6YzBQQkxoYWJQcXR5UHlZVUg1WURDMVFBZWlMSmdWTW1v?=
 =?utf-8?B?Wi8xUEpOT2plZDJMUklITTFScWVvZHcvdHZpemlNajJOT20xZGs4TjUvaGlZ?=
 =?utf-8?B?OTAyQ2RDdmdleHZzQUdaLzNSV3lTNVVIb09yWDNINEltbis1NkNhV1dHbENm?=
 =?utf-8?B?STJFS3JvNzNyNWV1NkpZdHhYR0xDc1F0UDV2ZDFlbXdmS3RLTVQ0Rmx2T2xF?=
 =?utf-8?B?OU9XVnRqQkNCREQyNnZQdURjR1BTSnMzWFg1NGtGNnV5WlBhSzFiQ0w3V0xQ?=
 =?utf-8?B?UTgvclFRUTFTaEEwdHpWZHlQUWVzVDBSbEt6UXNnclBZV2JJMWlubXU4bGR1?=
 =?utf-8?B?Uktvcy9qUzZ0Y0hNQUxnQjNOWkJrek5Jd3p4THJYTlAyZzNtQW1HS3lWNTVo?=
 =?utf-8?B?YitFQUVkODZQQy9TWG5UL1FwVHB0QmxGbmtKTko3emR5MWpWcEJ5V2NYZkJW?=
 =?utf-8?B?d1RHVzNpaDdYMkhlcFNIUFJKbWlBbmxRWFF1U09zWXN1akROdVBTcWFGZDRx?=
 =?utf-8?B?bDQrME1hMi9xN1VqRGp3S2pYRVpJa3FCanZjYlh2STVxMG90enEvbzlTTkhk?=
 =?utf-8?B?bTNIajZUejhIbDhyTUxnSEdqY2R0UUpqY1B4NGZ6Ni8vS3JKZk5IMzR2WDRG?=
 =?utf-8?B?NUUwcnRTSmIyT09WZWxXcGdTVk9jc09hRkxMaldOK21OUDFtaHdiNGNPaFNL?=
 =?utf-8?B?SSs2SmdyODlOMndhaThOVmdEdVVEbDVNMnNEWXRFUFpBSEhsWWJjRHdrdFNt?=
 =?utf-8?B?U1VPZjN3NFZNeVdrNlp2c21BdzJOVThOQkVOZVdYVUNtVU8wNU80SHJldkRY?=
 =?utf-8?B?ZlNsTy9HaUY2MENWNk16MXFnMFZQNjhoSjVjNS9SeDNJeFNBYjdrTzVpZUth?=
 =?utf-8?B?YUxmOHVRSWczSWZTb0ZnaDA5SmZLMGk2NlpRWkhXNkgrRlBKUGt4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68eae77-6699-4a97-e9f8-08ded344b3f9
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9821.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:35:16.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWgIMS/E+WMG/Ca3Ye1UWXi8Epui0++o7fhRfnSpx//VylbiELnpRfzDlvWLWMAAimBLJ/xOo+zwTIhyOxS8nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429


On 6/6/2026 9:57 AM, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> CC: "Borislav Petkov (AMD)" <bp@alien8.de>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8e65320d91cdc3b241d4b94855c88459b91abf66
> commit: 62a9fc50e8d947601ea3484e732b1a65a0a54b96 EDAC/versalnet: Refactor memory controller initialization and cleanup
> date:   3 months ago
> :::::: branch date: 3 hours ago
> :::::: commit date: 3 months ago
> config: arm64-randconfig-r072-20260606 (https://download.01.org/0day-ci/archive/20260606/202606061200.j14yIFYw-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202606061200.j14yIFYw-lkp@intel.com/
>
> smatch warnings:
> drivers/edac/versalnet_edac.c:785 init_one_mc() error: buffer overflow 'priv->adec' 152 <= s32max
>
> vim +785 drivers/edac/versalnet_edac.c
>
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  774
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  775  static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)

This is a static function called from

865         for (i = 0; i < NUM_CONTROLLERS; i++) {
866                 rc = init_one_mc(priv, pdev, i);
867                 if (rc) {

The NUM_CONTROLLERS is 8 so the value of i at max can be 8.

> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  776  {
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  777  	u32 num_chans, rank, dwidth, config;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  778  	struct edac_mc_layer layers[2];
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  779  	struct mem_ctl_info *mci;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  780  	struct device *dev;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  781  	enum dev_type dt;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  782  	char *name;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  783  	int rc;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  784
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08 @785  	config = priv->adec[CONF + i * ADEC_NUM];
The max offset can be   8*19 =152.
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  786  	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  787  	rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  788  	dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  789
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  790  	switch (dwidth) {
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  791  	case XDDR5_BUS_WIDTH_16:
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  792  		dt = DEV_X16;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  793  		break;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  794  	case XDDR5_BUS_WIDTH_32:
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  795  		dt = DEV_X32;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  796  		break;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  797  	case XDDR5_BUS_WIDTH_64:
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  798  		dt = DEV_X64;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  799  		break;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  800  	default:
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  801  		dt = DEV_UNKNOWN;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  802  	}
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  803
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  804  	if (dt == DEV_UNKNOWN)
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  805  		return 0;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  806
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  807  	/* Find the first enabled device and register that one. */
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  808  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  809  	layers[0].size = rank;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  810  	layers[0].is_virt_csrow = true;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  811  	layers[1].type = EDAC_MC_LAYER_CHANNEL;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  812  	layers[1].size = num_chans;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  813  	layers[1].is_virt_csrow = false;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  814
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  815  	rc = -ENOMEM;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  816  	name = kzalloc(MC_NAME_LEN, GFP_KERNEL);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  817  	if (!name)
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  818  		return rc;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  819
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  820  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  821  	if (!dev)
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  822  		goto err_name_free;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  823
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  824  	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  825  	if (!mci) {
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  826  		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  827  		goto err_dev_free;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  828  	}
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  829
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  830  	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  831
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  832  	dev->init_name = name;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  833  	dev->release = versal_edac_release;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  834
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  835  	rc = device_register(dev);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  836  	if (rc)
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  837  		goto err_mc_free;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  838
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  839  	mci->pdev = dev;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  840  	mc_init(mci, dev);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  841
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  842  	rc = edac_mc_add_mc(mci);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  843  	if (rc) {
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  844  		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  845  		goto err_unreg;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  846  	}
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  847
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  848  	priv->mci[i] = mci;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  849  	priv->dwidth = dt;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  850
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  851  	platform_set_drvdata(pdev, priv);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  852
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  853  	return 0;
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  854
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  855  err_unreg:
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  856  	device_unregister(mci->pdev);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  857  err_mc_free:
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  858  	edac_mc_free(mci);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  859  err_dev_free:
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  860  	kfree(dev);
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  861  err_name_free:
> 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  862  	kfree(name);
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  863
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  864  	return rc;
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  865  }
> d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  866
>
> :::::: The code at line 785 was first introduced by commit
> :::::: d5fe2fec6c40dda03df8cc9b4a97de0b7e39f984 EDAC: Add a driver for the AMD Versal NET DDR controller
>
> :::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> :::::: CC: Borislav Petkov (AMD) <bp@alien8.de>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
