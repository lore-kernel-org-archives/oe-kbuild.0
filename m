Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0929898B;
	Wed, 17 Sep 2025 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758081668; cv=fail; b=FB+pYwKzpSNrJT8T+vcxcHpr0p5EUO62wwLzx/ASQLb5CIojJ528gfp5IQQivCWsPWu+BR3TD3U9vb1RB8uOhXQF9IhjSeBxq14RE5GkTkDToDsfGETJR+z0Ll0PfOvjoHNs4KB3dhaBQaYXjw5DT99lMS9Ow1zkWIB6xsT3360=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758081668; c=relaxed/simple;
	bh=1yrHLuxKzOCIswN89G552NMvZVaX+TVFgmnuUZe+ObA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TF4bWaArL8sUCrY9SMVhLk3Ua3CS4W/meDEYoPgW/brBFDkZ67SNYOmq0iIsDesc5uI+9D6RyGx2kYOH00M9SfNzeoyk6Y/4Gt956RtScSIfjPIAfMqKypu0JETf+HRRAkPyFh53LG/F+juPS1Lvd55ugignVjG3MTWzhc4XHJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QGDNY3kw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kHDKPxOX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QGDNY3kw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kHDKPxOX"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLYug6021711;
	Wed, 17 Sep 2025 04:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GNtRrtuiqfk3k7JevE2UilhPPu8Zij0x4iAllKDHIQk=; b=
	QGDNY3kwopYa98iEuIAxGiB9laz6XEFnojrXshGuLCSA6QuJDD6v7rktSA7oCW8f
	NpRcB92QcKe8bgQ6IPiGjvZPJMHCVeB04pUYweBas9FjwWp6Np50YzIHbUl1vFNT
	cT773qmKWjsIAM5Xn3odTzfUH4U9EWqEmbarnpR/nh2EfZakhvOVEKWmb9otYwLC
	qy/kkr78QHXHz1bQZRRQiLpHZixHxNqpM0ftPYwU2N5mTqPId66qbXKS+4XPyrlQ
	4wSAhAxxZywwhDSHHst+K44m6FMZ8elFoI407oQJL17nzJ1LBAvqUROPEqOrQd6A
	rPVMJQ4lOZjlpBk5etchpQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx90bdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Sep 2025 04:00:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58H3KZeg027214;
	Wed, 17 Sep 2025 04:00:57 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013012.outbound.protection.outlook.com [40.93.201.12])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2kgp7f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Sep 2025 04:00:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKU3kpYXOXSTNba7YvY0NTw8v2G66pvJvCcLPm7VXAeeBjKE82HUwdDcqu8Ew8ZmF0gxGgvm0/1ViH6wnt4SpH6swRFbh1UaY3OmRpy+F9H1NgFN3hnexZHyoT9MoBLEJvVnb083Sv4R0CT4LaRe90GyyKWq/JqVeZck05UkKBI60wNo3IPpuk3Inv+V04HF3oxNwT7boVUrCE6ecR1UBOuWTvO2l09luxBC/O6cUHV6TpnfMnYJS5Ia9R/zHjj6e19OohkwwIUW3eeOv2hI4B9T5v7bYDlcrQig8153HuW1hpur04vMDlvUKZXhVfBdt1kdqA5WR2S6wOr1oOejog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNtRrtuiqfk3k7JevE2UilhPPu8Zij0x4iAllKDHIQk=;
 b=DpXvD22d/+ammK1mY8cGPbxeuoJ7eEBMOUIC56jaxhUGdP8FRFCDqbWigYWdVP/ZrSwdSusMelWEmWCBq0Bumtjo/McU1lWOG8tepMXCd7IkV4Og/LgcbPAqm4w1iaokplb9/P1LLvgD7fukwswy9Q5IndwxiN7d5CxwL/s0MEgyAtD8Mlk+Nw0M7a9+FZRJh+CnSjVyJPgHKYEqu/sLn5Cx5I8d1VQzH38Rd9/kWt8lARrRwjryIS+8vm5mssbo40E9IlBx1zSpSsdvcfko44LwsA54jF//oGxdCHLpCX6ce9mciM1FGGdm0bXumEbJsrWq106A0CzyRPocujZC2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNtRrtuiqfk3k7JevE2UilhPPu8Zij0x4iAllKDHIQk=;
 b=kHDKPxOXPP6JTZfq7Dp++qEZKLKGneJOREFrApvZz/cMsjjhFX8Q6182H6zRbaWoCBUy3Mj2TGH6y5W67FSlO/Jh/VqzITV6erQHuQKtLk0n6XPoG7brWlu6Ct31OovQoixFkaE7X9RkmMUa8NRB5hNQH+I7atBucCghzraZERg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7693.namprd10.prod.outlook.com (2603:10b6:510:2e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 04:00:54 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 04:00:54 +0000
Message-ID: <b2aba3cd-7d52-40e1-8641-73496c71f689@oracle.com>
Date: Tue, 16 Sep 2025 21:00:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nfsd: move name lookup out of nfsd4_list_rec_dir()
To: NeilBrown <neilb@ownmail.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Jeff Layton <jlayton@kernel.org>
References: <202509131751.4STnDcZg-lkp@intel.com> <>
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name> <>
 <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com> <>
 <175788975119.1696783.10090163184150858167@noble.neil.brown.name> <>
 <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
 <175790491325.1696783.7680474323247431624@noble.neil.brown.name>
 <175796544274.8037.397805260300460361.b4-ty@oracle.com>
 <175807633277.1696783.13245912067571261379@noble.neil.brown.name>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <175807633277.1696783.13245912067571261379@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5fd59c-f65d-4eb2-6914-08ddf59ecc6e
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MlpUM05EQUlTZGpUdlRnVnVLK3NIU0pIWEd2cHY1R1dmUlI5clZHVTF1STVn?=
 =?utf-8?B?d1pBSkVKb040Yld1VXhCYVlCaXV6Mis1dVorU3pZT3hxd0l1TkRyUnhNMEtJ?=
 =?utf-8?B?TXhOd24veld5Uk40bElMMW5WN1Q2ajRwbmp0REVyL0gvL2paQ05tWFpHZThD?=
 =?utf-8?B?em1xdjRncDRYbzZ5UTJnMlNjeFo4QVYzSGpVb083Q0p5cVFOaFZpdjNpVm56?=
 =?utf-8?B?RWozdmJpeTZBVU42Qnpjd3VhRHQ2YU05bnk0aTQ2WTdVMzMzSWFEM051RFpp?=
 =?utf-8?B?V1Nud2NGd0RZaldKbEZkd2hFeWZSZzVZRk8vZDdvRmxoYWZDbEM4bXVvdTIz?=
 =?utf-8?B?UE5WUDl1aDBveUhLeVpIY2F3cXFRb2RTa1IzQ3h5NHV4YUIwRjZtOVMxSkMw?=
 =?utf-8?B?NnUzZ0FKTFNpMkU4T2M2M2cyQWlCUXJjWXBtYVBUSm1hOE5yN0h0ejZNS2dG?=
 =?utf-8?B?NkczVStqbDRvblhNMWlOSDdNeXl2V2lZalNxY1BYTE0veEFJdExGbjF4YmQ1?=
 =?utf-8?B?STdISjRwdE9vYXFGUUF5M1l6UkswMVdJMWxtd2thZXhXNnRzVXQzM211WU0w?=
 =?utf-8?B?eC9FMEdGM05laEluWEN3MzJnSW9UcEo4ckJyc0xaOFU2cHJ3eWVxNkRpamtS?=
 =?utf-8?B?QmRsTnVRbEROZ0RZM1g4NTVJU1pVMlFjV0c2cERrYndNbzNoV1dKOWFuM01H?=
 =?utf-8?B?SW1xcHJYdVB5R2JJNmthS2VQVGNTclRVSERKUmpzLzN6eUFVK2tqVzIzWXdj?=
 =?utf-8?B?dGhKQkYrcXJkMk42RFRYdm9IV0tTZW9oY05hRUZrRTNSN2pGYlhPaHZPcVdB?=
 =?utf-8?B?TCsyaXN6dVMvQnBHUk9ZaWt0U3FtWEt3MU5XNjRYUnMwOUdKcHVlL2RXT3dP?=
 =?utf-8?B?YUZTNk1iWkkzVElHTkNhZFIvZ2hucW5RZmZxQTN6dmFJMHliYjlyRkMwVjFi?=
 =?utf-8?B?MC9ydmowVXdGdDkxZTRvS1RDVWtMcFRXZDV2cVVhcnplM1loYkk2NFgvTGZ1?=
 =?utf-8?B?MDZhVU9PV0Z5Wm5kMFFkQ1BPeG9GYld6RytUZmRmc3ZQdkI1SDVxSVFDL3do?=
 =?utf-8?B?eUV4Wmo1aUN2ZEpxUmh4ZlhhdmhxRENVbVdsZE9QS0R6cVVmN0lWZGoycVMz?=
 =?utf-8?B?UVVmUUxjWTZMZkRuRkpST01wMlphSEpBR2RnY0ZmWUxmcTZZZ1JuOTJqRTlQ?=
 =?utf-8?B?WE9DNzF1M3luYUIrUlkvUEZuVlg0djhMdS9OZG95Q0FaVHprVnlQeVUybXVl?=
 =?utf-8?B?R3pqNS9jMk43VGZqcG53SmFXR1JIVHRsMXZBZWc2N1BCOTN5WXl3TlNtRlU1?=
 =?utf-8?B?SlZ1ck9aenNKUTdraG5OUk1WRE9uQmxvemNvRGdINmFrUkFBVStIQkprdkJY?=
 =?utf-8?B?cWRCeDRoRk16ejA3dVdvUFZsWXNmck5qREN4Vms5Q0dWeWxEeElFcGtYU2U1?=
 =?utf-8?B?MS9ZMFVKdHpZMDNBVVdxaDJ2UXVScHNrSUFLMGIva0FSNXFxdUpNdGlXdXZ0?=
 =?utf-8?B?VnZHSFp6QWlzN2FNdmVBbkRDOHNmZFRYamdxOFIrUTVVcXdycUtTZzVCNFRG?=
 =?utf-8?B?b01FYklXREhaMDl2RzNOYm9oVHN2cFVFRXhyZEZ1N1F0R29xV0tNNmJWeE9w?=
 =?utf-8?B?b1ZVNzFQVCtaT2JtVHBaQTBuRmp0ZStxSEpqb3ZnVHlybVN5RTVKcTZjcmR5?=
 =?utf-8?B?NzlmSkpQL0xjOHJnM0NDRmtyWVJjdnY4TlM5cldIOGpzWDcxVnlIRGxOc3F5?=
 =?utf-8?B?T25rVnF1clIzUmUzSXk4cFUvU21adE9pdEMraU9vOVBPaFBoZkY4b0xRNlN6?=
 =?utf-8?B?dDZ2dS85djZmM0lwSldjYTVYOGJjSDBDcFo2dDY2SkFQMHhOcjhOQ3hscEhj?=
 =?utf-8?B?OHNJWnhGam5IVXJuSExSVmk3MjZtbVB4bFRhbUppbUYzeFFVTzRUTVdsbWFn?=
 =?utf-8?Q?c9kQs9zTjzE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q2U1d0RRckJPQlAwM2R0Y3QxbGYyakVpV1VhRE15eHRaNmZRT25DUmNMR2NO?=
 =?utf-8?B?dXZFTmcyZlFWcHgyNGNDc05WdWdUeC93RFBTL1pnbXl0K1ZycTZ6U2pOUnVw?=
 =?utf-8?B?dW1oZjg0U2p0bnJESDJSQ2ViRnoydi9waVVxYjlwK0xkeVNzeG1mTVdQcExo?=
 =?utf-8?B?S2Y0OVZCR0tGT1J6N0lkS3hHc0FRUW1Dem1jbFFTMDhLVmxmbXNZNEpMNXZK?=
 =?utf-8?B?TFZLNUw2aXV3WkhsU2VtRjg2eFlreEhjd0dXM2NLRUczallsY3dKUGxTLzR1?=
 =?utf-8?B?Ris5ZWNpQlNHdEh4bWdZWmZ3UTBIVUlIK3ZzNnZTRHJYeU9oY3lQZ1o1MmQv?=
 =?utf-8?B?YnRJZVpROWFCSWpadTF1dHpvaUsrQlltVEZJTEZpUVdsUkR2Qld2WkRYQ1U1?=
 =?utf-8?B?OTVoNlkzNTRHYjZISERzV1pKUWJrYis1Y3JXaWZubVZJWG9BVUxLZ2dwK3Fv?=
 =?utf-8?B?b01ram1OV2wwM1NBRkRvSTVjbFBtdHFZVDBkMmRFT0tkR0t3UGw3c0hFNGRU?=
 =?utf-8?B?ZzJuZS8ydGQ0ZFVNeS9nSmtaK1Q1RlVRejAra24zbk10LzdVR2VNbnhDUThy?=
 =?utf-8?B?ZXdndjhiRzZJcy9MQUQvWlFpWXNXQ3JTNFQvblQzclhGLzhZaWVRWVRBS0tM?=
 =?utf-8?B?NE4yOUQyaGErUEhlc2Rha0FYbUZlWHZIcEY4R0czbXo4SzhINS9CYVUrT25Y?=
 =?utf-8?B?VkZ3SUlOc2E2NTltZklyT3phbCtjVE9udXJOZDMrZmNJOEdqYkFyazh6UG94?=
 =?utf-8?B?dFc3UkxVblJSaHhPQkg3N1ZRSXdQcko3cklKRmhiMHNDZmoxclp1VktkcEpT?=
 =?utf-8?B?VExyREZUTUZPSFB2L1Y3NUwxRTVWM3VxbjFQcXBjbkpMSC9zbGZBbjNleFRz?=
 =?utf-8?B?WXpMRXY0VzhyZTJCck8weWk0ZndDeldHczYwQytPMkZNNUNuWnpaTzNQRTQ4?=
 =?utf-8?B?ek5sNU5FNGJKY3VtalZteUJYKzhCMDNZS2Q2aHBHL3dmd0EzYVlJejJLQ1A4?=
 =?utf-8?B?Q0JqVjBXMTlhc1ZSdHN6ZW1wVTM1UDQ4UHByZ1pCSHMzQXYxNVAzUU5iQ0Q5?=
 =?utf-8?B?clRuZk45cnJMVlRXRFJCTHdxRjlIdVkyajhzdy9PT2xHaWZ2RjBvbzBuOXox?=
 =?utf-8?B?VkkyNk5ycUxOY0ZjdWF4Tzh2dkN2eDdudlV0UUtmdStpbHpBNGVleDIyU3NN?=
 =?utf-8?B?RVRQaEJrM3VuTU9UTjRmWVBIM2I1Nm5tZmRaUU1jNzI0aTduWTQrazFLdit1?=
 =?utf-8?B?RnN1NzRtR0c5VXh6cm9DNVhTWjR1amdHMXl4ZkhBUWRFUWdsNkZ6ay9vbklC?=
 =?utf-8?B?SUIySkNhY28wRHdRMDlJTCt5REV5N2VWYVpmdnMybXNVQ3M0aElFb1lCaWVi?=
 =?utf-8?B?UC82SXo2OGczckowQkRKbUYwRndoSUVPNzBSakhrTVp0UHJ3THVFYXdUT0l5?=
 =?utf-8?B?Y0s3dGthOC9JcVp1NnhnQXlWRko3T0NTNWQxNm9haDY2dTQ3anN0Y1hvRGtq?=
 =?utf-8?B?NkdqUEZMUDJNZEZyU2s2K3pKdmFkRGIxSk1velQraGJkZWMyRTZhK2lTRURr?=
 =?utf-8?B?TkFXb0lRMlFjQy84Tmg2ZzZ6NUtqSFBuYjFQeUhtK241ME12em05S3dXSFdw?=
 =?utf-8?B?Q1gxRENhMHlwUXRpNzZYSjhZZkU0TS9UOGVnbVdIZ21NSTVOUUVDUENmaDZl?=
 =?utf-8?B?ZGhZc3hnRUdoc2RXSmhMc3NsS2ZBQUc1RFI0YWJTS2djQzF2ZEpIenhPQWxn?=
 =?utf-8?B?QSttZTNqdzVZeGo0VVhsZVM4NExiaXdiT2dsT2MwWmdCczRSNjlpMGdDTUVW?=
 =?utf-8?B?Zmx2MXBaZExObS9Jd0pGTzVTWm5KQnVyVnlPSDBjcUdLZ3U1STVTbTRkenFy?=
 =?utf-8?B?TUo1REhaeUw5K2UvM2RQYy9PVnExemtqS0x4MDJsZklJd2tPdWpETU9Xbm1w?=
 =?utf-8?B?dTdMb1V2cWtWa0FBdGx2NXV1Y3RMd1ZqRUpNZ2VnWGVYaHE3aWFTZld1YUlK?=
 =?utf-8?B?Qkthb1NCSnNLbmI3RFNIQkl0UHlvbEpHcnB3N1dSYitJUjJPeFRVNnowN0Ri?=
 =?utf-8?B?NDRXSTNFQnh6YVF6WC9jaktQWm9xREx5K1p1d2RtbmpEOVg0dFBYbjZuaTBQ?=
 =?utf-8?Q?7A+Dg0a7S0EEuAVwFmivvu77/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Fcet8X/EUoGKjbCSM82yaUY55kKMdbariyRzR24HQ16EYQXur48tCFEGFR+axnkQTBhvZ3eBQT++gz/x0IXr40kuCGxPI2M+3eUyRJFcIU7Mc5Rh/ZPrOqzL3nzk7sFuXaJbzK2nKgPE/e+i7TyN4YelHDKA4rFwdOcwsnmt3/lIz/xMMD3vjwj0x3i4I7GLJchLJTeoEzdQ/kFSeazjC/hhWLsstva/8rxs+J8ibGLGTOyVcQON0d4iNBNRelV0K2e16XNGjak7ZKl4GvFzPC4cfw2xWHABlOKmtykOv1Dw8AVu5cg/B32bjXILBZcyAQeHXLXzq/4nCTZ3Bfr+iRO9PxlXDNmoYjSyhkvneexuTiASwuYrQGUfHkYirOybi9+UXRhlrRyViIHcuWxZW6A3Rj74WXhgOnhwOhhwHlUBebBU+k+pD9Hsn7VznBDFERx5zvXBAi15LS7lkBa03xA7eVJXKN1f/sJGQlxyhswFUWFCIvWiYtyejvw8PYeawsGJOa42LOfymq+WikKcVaDqqCBiGPi1yTJNRh4cTBKizV4+PzznI6pIJMxAk6pPDx16CM23nzXRZ3GJuSijzwP1k+MLW95Hq07dwe2LHa0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5fd59c-f65d-4eb2-6914-08ddf59ecc6e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 04:00:54.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCqp0jBxW48cToY2Gw8Q4OXNT6v41LG5KjwUatb0EhPUs1tM6sn7QWO9MRtMNv+/Qd0CalQj0zFWhTjgM5/DYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=915 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509170036
X-Proofpoint-ORIG-GUID: SNEcQoaDfGOn4cyxfBApNmQ5P-tihCHA
X-Proofpoint-GUID: SNEcQoaDfGOn4cyxfBApNmQ5P-tihCHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0mTSVploJB2Q
 +CiZBXGPfU+2VasQZi127LzDUFpDFs5HaK1QR8aBMnakKsY0+2eCxtfKDy2JhYmQfsuWwH8nyuM
 OG++Z66rgAq7dR1b3aNxr1HLzX3pirBL8L8daYbfOZc6zdhOclHCDNDulQPrWA1l7DdlLA4ICq2
 i4AqhrYktAL4GvAlts3k9yak5JKEg2sp48B1yoKMY6ug7KoC22HZNB106M+ekAP31AIBcsXj4KZ
 eULe/DOagoXRk5wbtuE+eDEZy+BIyA60pV4rD0wNBidSg9eTVsAur+VL/jE6MoDt+svqHT+9de5
 mOsw1ZZvBdNG3zeQnOqpc2ZCJyERkzL8YpLsycmx8/f3ZCVErYeVj2seWaE0Gpo8Ohwnz/G4f+g
 gtWJPzqikOLKTYUdTqva13kYBtgFgw==
X-Authority-Analysis: v=2.4 cv=N/QpF39B c=1 sm=1 tr=0 ts=68ca3279 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=I-1mG6jRAAAA:8 a=QVhsKHIW9QwRU34Vv7MA:9
 a=QEXdDO2ut3YA:10 a=vAntc5lzOlbkVmf1VcWC:22 cc=ntf awl=host:12083

On 9/16/25 7:32 PM, NeilBrown wrote:
> However ... the email you replied to had "Reply-To: NeilBrown <neil@brown.name>"
> but your reply went to "NeilBrown <neilb@ownmail.net>".
> Any idea why?

No idea. I'm traveling this week, so I'm stuck using some older versions
of git/stgit. That could be it.

-- 
Chuck Lever
