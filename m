Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B629CE1;
	Sun, 14 Sep 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757862531; cv=fail; b=P0FYXdap7jn5LzTWEhzQhqBEDwkPU5VejW/a2YN2u7392UGZN/YJfxRDbeXTc7gdOkIIMH035oxM8uJPHjGWEWZEnMsYbiItl2W86jox1R/EUkJOKyR/KJ3n7B+QnLBHM3UfW66alsM8b2FOpvXOkrdKCGLt2FvpoHCEVKUGD+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757862531; c=relaxed/simple;
	bh=Q28dzl0oKzn93Y0dd5imwiA+vA8XUT+6wqVcjltW6QY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RHqNEVImWH4Alsp6WT9HfSuxiKGoAUSwfsJhL1W1pAx6II50YYBL4k+vZENORddQj/oDMS/Cg7u8QwNSlh3YLRmqZ2zAmNVEesUwoTbWBO/wrcBeMNwGlipjXSVJj1obItb7H5AmObDmBh8JA9ZWBBAHiB7exTkzQl29EfGdp7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ik9rGrRe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tfBfdTnZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ik9rGrRe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tfBfdTnZ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E3RFj7008157;
	Sun, 14 Sep 2025 15:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=EKCIhHoxllSZGFBTSiHjVBTp30L0YFmPS3IlkhCDm2k=; b=
	Ik9rGrReLWjUOYrLEjA82CQnyWCXl1v8RfuaUM2Q4YXmQ+7KwjkBpZ0NaznYYNkV
	jjrMNUpLmTfWeRY/okNYgsAu59G3Qt7d8bnHYTXGh9uAIzSc9VSlGdEg5I5ooCy1
	ZUtKfCKAwUKiCYKtPSbpq6GQWTQqGV+l4/ux+wHQDWzcQ91u6LjhYQsSQXwqsOBA
	p9Xh2cEzDesA+ioenWyqEaxqNcffkucFRMgS3hVp16drN6dnH5D0FcRa356UXlAj
	7Xk+wuufF+Y8TEV7QGj0ZJen+mjT3+PTm92rAoKcX4Q6Mj/YQ6UTYPzJiX7AgLdA
	DrT+rwOH4ahRpxX8CqiodQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49507w11n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Sep 2025 15:08:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58EF0ifR010552;
	Sun, 14 Sep 2025 15:08:43 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2a5bhp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Sep 2025 15:08:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/mC3JMN6lt+X5YFtsgSNKobZ8zgp5ooo1XmQZzHuqtjPxLslx9sVfBkSU7Wjb4Svaoku1g4S4YvgQTADd0ccs7l/S0LVOZjvuAiITZp2WbZTMmhlmuIjmBOXeo0ovVV2wLVVHstIHJscS7CkgbOZ+oVT07CLDBvbHsUo6Q4m8XuRG4com5PCn7zA/tc0AcClhVJ+NOchdojla1/jkMDo7rZc/FeRxZlNZgl5aVz/E5/YnzxCSQShkN3uFfQSyISgA9+Is/HXtZ5iR8VqBxKHCbKoiOZrvqpZAZfmL4cTnnI7fBEa4X5XPdS679hPzEB/qvv1j6YJmk+ePUWlMkSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKCIhHoxllSZGFBTSiHjVBTp30L0YFmPS3IlkhCDm2k=;
 b=uLx6GBkpGFkN/r794zcRich3i1b2DLaNXmjSGMq1nQnp/lf8UPZQOlX/AX7ZDM+MtkOP4FhEspJBbfJhSH0sL/WnuaUVjp3oUfe6QdvackFOOrmNH7po+6jkdgZ4jXjjGAXiH6pfNxj9Kz6eFRDCSJDVm2UtBqdkjt6SnrpkEOCGZC5x3c47ZG/Xt1vMrM3j22jDMQnP6HPihCco4FPLVzcc5hcfUVmowIGAqAKEOaMGh57bikaQ+pJpd5AxsaGLHl1VjD/d8kSDeTx3ljU5j32m1a+kq6drc/DPMQwIUxcVhR4XWLjSTe2umq5DlPgu7gyBT0GMGH2i9U7ywXyTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKCIhHoxllSZGFBTSiHjVBTp30L0YFmPS3IlkhCDm2k=;
 b=tfBfdTnZD5vl/d9qY56C7mQ//+lVGQXunCAdc6E5lM34b73DFmXYI3EkBGEj+6hcw0K2mnUQyTXfQ2zKQ2tly0LHnjKMycOoFywePNQJ0OK7V4dExE3qzOD0EN6HF4ffet4aIPQbYybUweCBt23F+pbdF7MIFiGNrWBbL6fd/H8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB4924.namprd10.prod.outlook.com (2603:10b6:610:ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Sun, 14 Sep
 2025 15:08:40 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9115.020; Sun, 14 Sep 2025
 15:08:40 +0000
Message-ID: <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>
Date: Sun, 14 Sep 2025 11:08:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [cel:nfsd-testing 45/50] fs/nfsd/nfs4recover.c:406 purge_old()
 error: uninitialized symbol 'child'.
To: NeilBrown <neil@brown.name>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Jeff Layton <jlayton@kernel.org>
References: <202509131751.4STnDcZg-lkp@intel.com>
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <175781199938.1696783.3669146136396360246@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:610:4c::16) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CH0PR10MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f4ecbd-9fa8-49fc-f0c4-08ddf3a0968b
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R1pFQStMdmlZQWtNdkg3UmM3aTBDMlVpUm1VV0ZaTjJvOHI4MTBZZ3REU3pm?=
 =?utf-8?B?Ynk0Z0Rja3d5Z0hYWElFb1pGZXRuQkNFVHB0ZXo1ZnJ0a2xaZzY4R0lXQVpT?=
 =?utf-8?B?QTZYTGRLYVBvUHZ1WDdudGxJNlYxS051eDZEbWFXblRMc2F4Zm01Yk9ucGsy?=
 =?utf-8?B?b2M3Sk12eUFqK1Y5akl1empHQjFyN1g0NXZOVGphcDY4Tnp0MUhwZDYvdmgr?=
 =?utf-8?B?V0lQMHlqR0xLb3dreEdYQ0dPL0E2RWszMG5rNkZBNmJUbzZ5UFFqM1lMVWNz?=
 =?utf-8?B?SXgxdVE1WnFZaWpoZEZPOEp4NGN3L1I1ZTZMcC92U2xWTmFIRHdzNlBrVGJZ?=
 =?utf-8?B?dFFWTUVBSlBMclM2RnJkR1c0cmwrTXA4dnR3cExJelJIclV1QmttUGtuUmxF?=
 =?utf-8?B?SDk3SmZMR2QyTm40U29ueFRxMkQ3czljNHFhWkU1aEV5dlRwZmx5SEcrczF6?=
 =?utf-8?B?d1RWckRLcWxJL210UllLM0FYZzA1cUliQ2pWeVVIdzFUUlE5QXVwdE82Z0pQ?=
 =?utf-8?B?bjNpQy8zaVVVL1NzcFJvY1NtOWRRc3F4TytEMkZwZDNQOFd0MXBiTWRORjZ5?=
 =?utf-8?B?UWN6SWxqOGJkK1phYXpueHRBN1lDTU4xSFZ1STVFTjlURGpWcHZuL2c0ZVVj?=
 =?utf-8?B?NEMzdkx2YkVoSlhpTTZGRmhGeTlWbXFGdmg2WmxzbmM2Q3IrVGZNek9zeWhl?=
 =?utf-8?B?ZlJPUk16SnN4YWc4RDFNVWhUbHNoeXB5cVRZM01VN0crL0JTN2tQOXh6eEd1?=
 =?utf-8?B?Ti85WGZmbEdCazdjcTMxUWh5NTU4NC9IbHpkRmJ2T1Rvd0gxbEY2dnR6UXdq?=
 =?utf-8?B?TFpGYnVFNGlXUDlWUmsxQWJBQVE2UjVmSzRoNnBKOVU1cnhVdDhaK1F1ak9j?=
 =?utf-8?B?dVNPaEFSSkRTOTExYXZMNTlLWENsS2VnbXNDbkQwNGY0VTB5dlhUR250d0lm?=
 =?utf-8?B?Y1dBKzNneXBGdlNOdFdWbjkyUk04RWJCek5kTkpEMHhBdTFkZWZES2I2UU9Y?=
 =?utf-8?B?eHI5ajBNUzFORENiUFBIWjZXMEw5V1l5MnkrYmVPNjcwZEdaQXNWSFhNZlpl?=
 =?utf-8?B?M0oyNWZWak55TCt0U3FJUWhZckptTEl3OHIrMGdBUk0waTFpVFhoSXdJKzBq?=
 =?utf-8?B?V1JwL1EzVlM1d1l1bFN5QlQxZ0IyNzNOVjhvTklpaVNkMERuZ3FqaUdxallL?=
 =?utf-8?B?YzFPM0lxQ0dIUWUzNXI1Zk1YbDg2ZytKZmJyMm9Sd0ZVeUNFZCtjTVZKUzdH?=
 =?utf-8?B?b3A2elEwa3BENW10TE5SRmdrMVdXaVB2MG5YaWt1Y2NBbjA1ay9kUmorazQ1?=
 =?utf-8?B?cXFoUW5DdjZ3Y044M29mUy9wcFh5dXowUDVoVUlzNCtUaWJ4dG91b0lETGNV?=
 =?utf-8?B?eUx6aWZ1TjRoaTNuMWw2OTExQUd2ZDlXY2VPNkQxRmxsMDQyOGtGOHhjd0tu?=
 =?utf-8?B?aVRPR1RhRERKRjhYWlpCclk5R21aZmQzblFwdGNqcEZDR2Rzb2dZVWpKVUsv?=
 =?utf-8?B?aFJlMEVqbndySGREOGI0YzdTWjVXakN3SmM2bXFjQVZnNHZtazlQaUFZK3RY?=
 =?utf-8?B?MEp0ajVUaVlSNFdKZFZZSlVIZ0lBNnhmSE5NazdJWHJlOVp0bFE5TWE1Skd6?=
 =?utf-8?B?Y3VHSjMvTWxkTVNjSkwzOTdDeXFXQ2Y5YmV2blIwLzZrdXc1Tlc3bmY4Sjcv?=
 =?utf-8?B?TkpmY2FjZUJaR0xBYmErRkFqdXJDbDF0NXJpU3VyRGJWM0RkN1JTOTFrTUti?=
 =?utf-8?B?UU93RjBpMXMzbFAydldrdjhFSFhxUnJmWnk2ck5QemxHck5pcmd6Q0dXSWds?=
 =?utf-8?B?QWtaSzVFd2JRN2dseVFsRFhJdVhxTDN0VXB5TTJ2QXRZdEVibTQyVHNuRFAy?=
 =?utf-8?Q?2nSx0uBRS6D9h?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZVdPbCt2ajVPbXUyRWFpNSt4TkRTNStSQnkvZUhPekxWVXY1cXdCcmMwdkFN?=
 =?utf-8?B?dlJqalRzWFF6QllvSDFDRTZyWDRkMDlnSjVSUTRsNFhENEtUWDJzNWZaR2hi?=
 =?utf-8?B?dnVJMlhYcExnSkoyY3JVYjNvd1lPa2NrQXV5RDQwcUp2aHRhTXNQeVlWRk02?=
 =?utf-8?B?RDgyR0hUMXdXZjQwOFVrMWR0azdtUmJ0aXRPR3ZGWm1uV05YRUxIam4zOHND?=
 =?utf-8?B?Nml4dDgzMnhGNXo4aVl1SjVnZ2lOSnZrZkRBWkNGWHBKNzk3cEdMdE1ManVu?=
 =?utf-8?B?SFRDc2dFMzdXaGZDWFFVNy9qUmtuWmNBVWczZDlXb0Zha0JGZU15bHZTaUlU?=
 =?utf-8?B?Q0JRUUZuKzNvcmR4Y0c5R0UwTXFPckhnOFhBcm1IWERCaElDTGJMRXlBVXRq?=
 =?utf-8?B?eXNXMHVsUG1SamRtWFh0em5JQTdxaTc3V0pHU2dnbEh4cHZXNHF1dnVjZWtV?=
 =?utf-8?B?VWZka3NnT2tjTEdxR0YwbStTQk1LWjRWT3pnWjkwMHc3ZG5KelNYQ2xDMGlD?=
 =?utf-8?B?OTRWbFc1MUdFcXgyY1hwcThieGFjTi9maDhzUUIxYmxKV0xWWE5YcUtLZnkz?=
 =?utf-8?B?cm9tVERUc09xcDI4ZVE0bFJJeGkrNEw4d1drU2psU0tQektvOTkvL0Q4MWs0?=
 =?utf-8?B?bnlqN1pxVVdzcG9kUlFDUXdaWHFwY29HaTNSQ2xqNjhrclljTDMrZ29TY3Na?=
 =?utf-8?B?YUltVkNaNnF1SHVhM05QdStIcTJoNlR1MzRKZlZmeEhpamhId0xSNzhCSVhD?=
 =?utf-8?B?L0ZkTTR4SWlVSHlXYUJId2RlbTVRVXpNclJ3VXdoSm5pZmFCSmFRcmt6WHFs?=
 =?utf-8?B?ekNsTS9GeVoxWTBSWlJ5cXdYcFpWZVFLRWdXaStXMEtMRWJhNEtNU2JZTUFS?=
 =?utf-8?B?U2JidTQrdDFleEp0akFsRFNkaXpleEpQNTNaaEhCQ3F1MFB1S2FPK1NFVWs1?=
 =?utf-8?B?dnYzMW5ObEYzbUI2c2FHbldlZ3NrQ2JiZkl5cXlGdUc3VWZ1UEhBV0tFNW02?=
 =?utf-8?B?elJoYnVyTUE5TGtjczlJTy9qcVd0UHVjSFM1dllhUk1saGtSTnc1VjMxYjlV?=
 =?utf-8?B?anhtNGhhdGNYMWwxTFliNTBORlR4enRqYVNVQVI5ZVdFYmpoNHFHZU40L3pi?=
 =?utf-8?B?TWQ1Z1JzRm9rdFdHU2RVUHZvWVpsNU1RZjR5NDRYQitZNTlwNXY4SzlycjhM?=
 =?utf-8?B?UVNiNkFsRmtUcEhqODBTSHUySkNNSld5V0ttWXF4TzdiTGZtT0c1bXVVcXY5?=
 =?utf-8?B?OHlyUG0ydkxtNncrbFlCV1c4UTZ2NUNwTTlhRGhnQU9hc3VuSURjNXRicWIv?=
 =?utf-8?B?cmk4UTNlNkJidjA5S2ZXTUQ4cVMxU05FeUxtQmtrSFZsZDFTOWJ5b1hVbURZ?=
 =?utf-8?B?MDJIaVkvSjhWNEpYQjU2cmw0RWFWdDh5TWFpenRSaE5RK0t0Rk1GZ0p6eWxy?=
 =?utf-8?B?ZWZ0SVAwcGNLbTJOYWdQdTBlQSsxaVVzaGMwL0NsUTZVKzhmM2ZobXdDdEtQ?=
 =?utf-8?B?K25tK1IxTVhpU0l3ZC9pUC9YM3FUdjZidTFqWGNBTW4yOUw1b0c1Y3JmdVdB?=
 =?utf-8?B?d2wxQm5GZlRlc0c5c1dyZjRHSWxtMVQwRlgyTE1GTmI2STMyWXFNT0hLTGZh?=
 =?utf-8?B?a0JpejNOL1ljL1RHaEUvTGpDVlQrLzVJK0plQlRiMUFNRE9aZU9Ta1huQmNL?=
 =?utf-8?B?dERrTzE4VWlqSFZhZlF4UnlsRUJNV3RIUE5PREdkYi9zdVMyNWhOZDgyenU1?=
 =?utf-8?B?QkQ5bEYwQ3VoNURHRngrUVArQ21ZaEszODR6SVY5bXU4NEsyTHlMOGE0YnNn?=
 =?utf-8?B?dTZJZHAxZWFNTEx3Mm1kWjRNNHRpT2EzcjkwME9HSjFsRi9Ub3d3RSs2SXRk?=
 =?utf-8?B?NmF3U2FSVWc3SS9PTnBsLzJBdTUzb1IzeEs0R0kxWUFrU2V1cWs5M3dqckRa?=
 =?utf-8?B?ODlXeHQreUhlZFU4QXU4aHpxbVNwUW9EemFERnhIRm54ektNVGgxdzNIYUJq?=
 =?utf-8?B?SGYvRnNqNDk0ZnhnNlBhWFp6aFB2RnQxYTcvRXZ2Y0lsSjJMak40c3VaYlRu?=
 =?utf-8?B?Y1RkdXhVbXB2dDNUbjExVWwzc3Zad2pLR2VIZUo0WEVzNFlLNTVhY2o3dnBq?=
 =?utf-8?Q?dE1hEIwSRotW5EByqAN7bi4WJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1Gnd5ZSvvzoFijMgc/DJqJ1dyllNjj+/lvOuwEC+Wsu5KPEQt49jyN8iR1JBwCHFvTR1Q+cUjl4XhUy20l1l7v5dhXk2D1BiEgc/bbsfgyYJyOg5aQQPDdj9VJM8PqLwNfzZgH+lopjHmYcqYwpy7q18oZ2FSA2ZjYJvdML5e2QfSkMYcGLgsrMpYMl9aUf/r+HnM5Yi8WlxU7Rm4ypgtF9WfpBlEJX6kYna6DD/FdDpG1VsGq6tvBAUhyhjjVHQe1OV3Am++VBZvIBTo2fAVVpJuuBek+aM64VnTsEISKvT9SAN//6rBL0G1z/uXmlgoVPRhaL3LY8QqudyuzfVBbVdioTQg09bbYi3l3+1PgGE4Ei+l68m+Kb/BsP479BTXKYFZ83iHlaDKlZBL5/t+5Lz44FysroQuGkev2Gw+j4q7dC3VFh9e3cA7eF6mMgoQ6lVavb6EU8voJoHc0i4PQ/JiL43iJBK/E2D7LUssoP8MCnmvwKkSChR/Kkl4YH2TgcS09ueHSVAuNpu4RR41XzCB7YfSmxTcInhk/GhENQb8PwO/aqVYOaU016YvxgdsJq/YU2MQrUCynZjDSivvJmk1fHMAlok0Wz/OBF9ZbI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f4ecbd-9fa8-49fc-f0c4-08ddf3a0968b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 15:08:40.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxVju7vtW4msVMZjoh9PIayBK2Es/NwnlhUZhdymOANJIHf2CR+4ddtnHWTT+vmlCuT0D7mFsKT/SSeEX706bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4924
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509140145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX8ZfF/t3JQ0jG
 PTdLBvPi0KmG94jdO42BUS0XnYiznX3qYgxMSX1k5iXOtwhIFfUw3j9aGqn20qxxfw5vr5mJkr4
 ZeKQRPCgeB5Y0QgW9Jc+M6/bV0coF8HPCuO76HJiobvd8Xi8tWHMyIGdMlevP87ibtzilx7wMXK
 8V49YllURMPcFS1c89mHyjN7X4QjlMte3dcPi0AJVPex7RH3EYAy9IJ0DxeqsSuLuN3Q1yJhAbh
 oB8OQ+XDNYOPZcxGfBXBfaR+RAY9NCkb16assBkgo93HcNhtF1GkpZi3/Oc3Ki7+F4sfOiPfw4d
 BQLNiN1kZaar00G/7ChbTdJjHmJKpyPgavxv6PqDBiUFGlafFcq+Zv4FMlnUv9cx1dHuSt0dJ0l
 LSb5FkW9
X-Proofpoint-ORIG-GUID: VIY-Z-YPbGZ4uF0Q3iZPEsJpjcwYaXmV
X-Authority-Analysis: v=2.4 cv=RtPFLDmK c=1 sm=1 tr=0 ts=68c6da7c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=VvRALlXEuKyC3X4Jl_EA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VIY-Z-YPbGZ4uF0Q3iZPEsJpjcwYaXmV

On 9/13/25 9:06 PM, NeilBrown wrote:
> On Sat, 13 Sep 2025, Dan Carpenter wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
>> head:   454e99ac23dc63c1472eb5df8f97c961c0f178c9
>> commit: 30424fb94b7bea14e27922669924948d6320e991 [45/50] nfsd: move name lookup out of nfsd4_list_rec_dir()
>> config: sparc64-randconfig-r072-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131751.4STnDcZg-lkp@intel.com/config)
>> compiler: sparc64-linux-gcc (GCC) 15.1.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> | Closes: https://lore.kernel.org/r/202509131751.4STnDcZg-lkp@intel.com/
>>
>> smatch warnings:
>> fs/nfsd/nfs4recover.c:406 purge_old() error: uninitialized symbol 'child'.
>>
>> vim +/child +406 fs/nfsd/nfs4recover.c
>>
>> c7b9a45927e74c8 NeilBrown         2005-06-23  398  static int
>> 30424fb94b7bea1 NeilBrown         2025-09-08  399  purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
>> c7b9a45927e74c8 NeilBrown         2005-06-23  400  {
>> c7b9a45927e74c8 NeilBrown         2005-06-23  401  	int status;
>> 30424fb94b7bea1 NeilBrown         2025-09-08  402  	struct dentry *child;
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  403  	struct xdr_netobj name;
>> c7b9a45927e74c8 NeilBrown         2005-06-23  404  
>> 30424fb94b7bea1 NeilBrown         2025-09-08  405  	if (strlen(cname) != HEXDIR_LEN - 1) {
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26 @406  		printk("%s: illegal name %pd in recovery directory\n",
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  407  				__func__, child);
>>                                                                                           ^^^^^
>> s/child/cname/
> 
> Also s/%pd/%s/

Indeed.


> Chuck: do you want to just edit the patch, or should I recend?

Yeah, let's get the corrected patch archived on lore. Please resend.


> Thanks Dan.
> 
> NeilBrown
> 
> 
>>
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  408  		/* Keep trying; maybe the others are OK: */
>> b37ad28bcaa7c48 Al Viro           2006-10-19  409  		return 0;
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  410  	}
>> 30424fb94b7bea1 NeilBrown         2025-09-08  411  	name.data = kstrdup(cname, GFP_KERNEL);
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  412  	if (!name.data) {
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  413  		dprintk("%s: failed to allocate memory for name.data!\n",
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  414  			__func__);
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  415  		goto out;
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  416  	}
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  417  	name.len = HEXDIR_LEN;
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  418  	if (nfs4_has_reclaimed_state(name, nn))
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  419  		goto out_free;
>> c7b9a45927e74c8 NeilBrown         2005-06-23  420  
>> 30424fb94b7bea1 NeilBrown         2025-09-08  421  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
>> 30424fb94b7bea1 NeilBrown         2025-09-08  422  	child = lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
>> 30424fb94b7bea1 NeilBrown         2025-09-08  423  	if (!IS_ERR(child)) {
>> abf08576afe3150 Christian Brauner 2023-01-13  424  		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
>> c7b9a45927e74c8 NeilBrown         2005-06-23  425  		if (status)
>> a6a9f18f0a9f943 Al Viro           2013-09-16  426  			printk("failed to remove client recovery directory %pd\n",
>> a6a9f18f0a9f943 Al Viro           2013-09-16  427  			       child);
>> 30424fb94b7bea1 NeilBrown         2025-09-08  428  		dput(child);
>> 30424fb94b7bea1 NeilBrown         2025-09-08  429  	}
>> 30424fb94b7bea1 NeilBrown         2025-09-08  430  	inode_unlock(d_inode(parent));
>> 30424fb94b7bea1 NeilBrown         2025-09-08  431  
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  432  out_free:
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  433  	kfree(name.data);
>> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  434  out:
>> c7b9a45927e74c8 NeilBrown         2005-06-23  435  	/* Keep trying, success or failure: */
>> b37ad28bcaa7c48 Al Viro           2006-10-19  436  	return 0;
>> c7b9a45927e74c8 NeilBrown         2005-06-23  437  }
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>>
>>
> 


-- 
Chuck Lever
