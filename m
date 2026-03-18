Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348B2135D7;
	Wed, 18 Mar 2026 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773840172; cv=fail; b=catPCN/G7C7wwUf9xRh5gWV8zWi8hR1ehL9iiO4Oo2tg0Sv5mYBUoqs21nHcs7HCHkVqnp1KMMIc8ceKmtC2co9jH+AqHoAOTbTIrmMA8I9xtE/Io6fiXXxYiFfzwR+UnBVxgnxpPUHg1jtZ8MbRZyit5lyoq/56XvoF+Ewj314=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773840172; c=relaxed/simple;
	bh=JB36LuhPTcFbdlwvwXY/sNZSyUNLkfiGqxrocFaQ4Iw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BhDe0vyW5XeNY5QxL9x2hcdW9JFzcrdWED7xYcthgLwWimuY/+40GUbWH/tO3M6A/I1BCT3bcz316K57JGFYodq9vZ1uiBrmW2wWD+LL1DkG8RnbnLJWkQ5zKgRB/37tzKEsJ7OfZMyC4v4PJWOZtzg6RrwUUiruTHS7xsnXJww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f9RZ5yGz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0SrkKHPI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f9RZ5yGz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0SrkKHPI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2NJ1a974947;
	Wed, 18 Mar 2026 13:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WOmAXaEyWqWh3nPcoELg2C7FaVkbkydE19fjlWUoFmg=; b=
	f9RZ5yGz3g8rzwgCvdFsYTmXpuWGw9tSFP85Pu5oi3rwL0Vc9vm7j7bazJxim/KL
	NDJw+M4uhMCiLYf0/uiUx2W1mE/mztLv0wp3aewxPNhAD34XBT/ZApJK+EVfhgGD
	IpOq8DKo207+Avs0p5MMnRKfUyFKnShHp1K8/8+MBC7LohlfMQJc8naUtk5Gozqj
	dj9v5QnM2LOv7HgC4d9eb3zQLRdvgRH2JwH0g6mz7jo8FlWBaTbAer0ztgx3W8KT
	6+kk1kC6gLW5E1LETE5WONBrcDlVOxXgsJ9vTTrOkQQidOGmefHYiHxA5DpKhZmk
	Jxqxfv43iftuZsyYzYs4Sg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cw07re30g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 13:22:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62ICFotV014004;
	Wed, 18 Mar 2026 13:22:39 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4bkn4g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 13:22:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpadECA71bcmaGac4jLcZbl75Slg1o/dSX74X55hk7B7l7/6XGt38uYkp/wnemwh/cUs22w9tijPVyToyS01ONaPAsUD1Q89SbS/ABEWG2N1YFXTXIrt6N2fwZFpdJiuff1gEK1XmEQsqqJv04Ge27Zx7h7wYbLJoVKoRkNx6/5wbtb96tEDcCCyJsOfOHRWE6IiYouByEaPQU4jJt7StO7a7G6/gRLKidCRAs1naAx4vRX9bOdJ7cK5IR98wxQgnRVxyUyNHRQ5dp0cl+WWXVYYA3nnvszGJl4LfcN7wGY9KBOE/gZooy/wnIGBGUdnerXGWFm65pr5Gg0/fqDG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOmAXaEyWqWh3nPcoELg2C7FaVkbkydE19fjlWUoFmg=;
 b=eMD4I9oAepCg0KfPuf3L1B2JrwbCqPt0KijDFqKSus+mhx2lmOjN+FeoYAmgLXkWg+3Ai+fhU25DW356ur4xtvJd79xl2pagnf6vIQ+vLeYBRymPdXk5xd9QW+J5dJ9HrV4SXcnU0/uazyzRSP++6+wfQn/cfm50WznFQSo6HgMvAozWIz6xR7odZXBr2U7cjFFSCT+htYu+501lLPR2yBjHLfcnyBMm9uSzgADMv9F5J6D+sEypw0yXNXTTeaGlMqqTlhUqFLQugKYRBcSN/GxxpaqY1raIBtUWlM3F5u9Nae/X+C8jiZhT2IN64ZcETw76lzKMXlcFwtreNvk/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOmAXaEyWqWh3nPcoELg2C7FaVkbkydE19fjlWUoFmg=;
 b=0SrkKHPIzO++GZp48qmOb+4FTl1aylz5C+6+3zBrD7uD0mB9A2mVXZruZy6sZb4ReOPXuUVueEApOLaXD10pNG2r/LSr0/6+oCeLDhod+u43ngjodj5r22girmCm7QcH5uiYuqhzGCZ+L4MJdLnY9uQHLQLFH61X8HGphZFIiYA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB7431.namprd10.prod.outlook.com (2603:10b6:8:15a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 13:22:34 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:22:34 +0000
Message-ID: <13cd936f-0e00-4d7b-bc41-129a21cc5cad@oracle.com>
Date: Wed, 18 Mar 2026 09:22:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [jlayton:exportd-netlink 3/18] net/sunrpc/cache.c:1074
 cache_release() error: dereferencing freed memory 'rq' (line 1070)
To: Jeff Layton <jlayton@kernel.org>,
        Dan Carpenter
 <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202603180258.r8Bt94T2-lkp@intel.com>
 <03d95fada335610f65f8590e02e1ff724e854b68.camel@kernel.org>
From: Chuck Lever <chuck.lever@oracle.com>
Content-Language: en-US
In-Reply-To: <03d95fada335610f65f8590e02e1ff724e854b68.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1f2::21) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS0PR10MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 092473df-ace4-4a3b-ad41-08de84f16a49
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 OaIcBYj4HDWPMfEZ8pUCASA3xdxT3AFEW0Gzipq0jhRoEeWpaHS2zgyxA8hIryQhvSdd4u7ybDnQx3CcMZawWsunHJC3BRgX1Ggd4Z1/1V+gx/0ofXGA84yxzEc1AtX493Nif1aJZmK2jSGpTMisdYD8MVhetYmkAJBPzVTJDCSXteVvABq3LClXzbhKnBM4EKVVYUwgFbcMibds34ggnzFhcGLWbwaBmJrdIP3D6zdaxjFNPTHF3iorefnvu0iRCBoGuKWqJMylnyXMewff9DTIxGF7Lfte15iLV87EzftNpwygaA8aaXCi+xg1deyEvCv5YuClV7RH/QxrZCerRWL4PPzrETCY30uvL3Y+7XgLpTagnaCIZZmkzcNFWE53+BRtOhFPSWmkiXecgkS+zm3yPL3pAfluiYF7dqY9ITQ1Td0SYtQCRXAmmeZYZBU/juXJBUtxVP6k8FM4exFESNHyY30PV4zZdQbWGd3B17x/gi5aK9bQ2ysfj01mnIlVCnqzo/uwuvhLidiTYSTHZfe9z8YxUnNQcgbEsc41zIcCcI+K/h1kuuYPsy1HfIJX9tEusoCOq8f+qHBax4cq4/5NVQealfyc8sMedpkdiQC8dSsC5vwpZeQJULOqXJfNYwKtKL5s3buOwR3/vBoWh9fhJwoqilqWkWtlI199vpo3CiC63KqeJdkEkso9UzpT+DFKQCAkBJKeRtXS3BuXZQLkGA1rZ63oUiFWNvHtUJI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aE10OW5vME92THUrTjBmcndHOHdlSHRmTE1NcDB4QVh0QWZ6UkFDRHpaeWpF?=
 =?utf-8?B?TlkzYUxqRk51QVlnRzdrSXE4TGcvRngvSlErRkF4RW8wY1VRcUgrZFN5UnBR?=
 =?utf-8?B?M1djMUlaRVZIK29mbzN0TkdHQVJPOGtMMVo4YlBoQWgyYU5RNjlXY2JGSGVr?=
 =?utf-8?B?QWJjT1VvRjFFaG1UK2EreGxPaHRLVGNHTUhKUloyOGJKWHpray9TMVd4RUpZ?=
 =?utf-8?B?VGRlR3RmMmRub2NnUFVYQmQrZWVUYWdmeG5SODZsbHpnNTRCQlFoVWhTek94?=
 =?utf-8?B?c1ZFYVl5VHR4NDFzcU50a1ZxYlBQbVJPVkIydGZMSlgzYUtMTzYvam5COEVv?=
 =?utf-8?B?ZlM2bGJzOVQzbzM1L1F3dHRtQnVjbTFnNk02UDJWQThPRFlXRHF3MXB2YkVX?=
 =?utf-8?B?NmR4RUZSV29mOXlJeVZDa1FkMkg2eFFMa2lCV3hLV1NpWWh6QmtNQU1LQS93?=
 =?utf-8?B?UWFzLzl1djAzNC9vbXpzS1FVcm94b2t3enNJNEFBUWZNLzdOcVYwektyRndw?=
 =?utf-8?B?WGNXZFJGcTlIUnMwcGY5RG9XSzBXanpQTVNKL1FLdlZJdzZCT08vanlUcVZ4?=
 =?utf-8?B?QWRkMTdEWGpJQTZrNWtCek9WV1BiRUF2ZkJHQWJSWVNwMnFTMFcwcXBQUlZY?=
 =?utf-8?B?SEJzbmxEQ082a29rYTJHMitjTDZ6QmVVSzFsZ25LbWp3WXQzaW1QOWxjR3NF?=
 =?utf-8?B?Ui9pa0FlbDk5d1B0eGY2TXJ2eExreDMwMmYzWWxYc2pqSFpMRjlIbmcyUUU1?=
 =?utf-8?B?VWZyNmptb0I2blZtY3MyTnoyUFRVaGpDL2VtNHFTaWFIT3RIVStFaXpXcC9B?=
 =?utf-8?B?RlpOL0cweFJUa1FhcFl5bGpqeWNNZFNya3FVME1JeUY3OHhLWTg3dVRLUkpF?=
 =?utf-8?B?SjYzTlIxQ3J0THdETXRsdXlCdWFYVTBobEtMUVRlWjFWUFM0aitvVVNMb3c5?=
 =?utf-8?B?eWdvSlhhaEttNmVrN2xabURoa0dtYWg3T2x1dTk5RkhLTUdiVXFkbGNlUGNB?=
 =?utf-8?B?NHdJM05LMlVtd0hsV1hEVHZrUXJtaWVZTWd3R2dDS3IxNmhvTmxGY0N3ei92?=
 =?utf-8?B?c3RhMllwL1ZrWTcvd05KNThKbmxkdkM3UHptdXQzYVRCWklSYTd4NW1ESGlu?=
 =?utf-8?B?ME9xdTdhV2F4ek91aUFyallzWVlkZFFpMTQ3OGxYZndIQmxxOExCVDU5SVBj?=
 =?utf-8?B?bFViZnBpSTc1WUI0cXIzTU90a2tUNGRhK1hYQ3VjSkh6UjJkS0s2dDVZUitw?=
 =?utf-8?B?MjB5a0VnNXI4b1Voc1huSzRDRDVtcExHVVllMk5GY1lTZmJCb1ozWm1qa3BV?=
 =?utf-8?B?b3B4c0t3NXJxM3RXUUpUQUJFNDhGT0FrUlh6d3liNU5QYzNQTFREdG1aUE5G?=
 =?utf-8?B?TmVVajkyQndHNFQ3OUVQTzFBejlRRmhUaEFyOHNMbHhPcHJrbHl4OFRyMEJv?=
 =?utf-8?B?aityVmg2ck41SkhRdTdjNkprY2VRd2xvWW5hdGhxYTVpd00zenpvNldBQTFo?=
 =?utf-8?B?djBxd0ZPS2M3ZHFZUWlhYkhDL2htM0dOeWVweFhMSDUvbE1FV2dETnI4emJi?=
 =?utf-8?B?cTQ2S0ZYWWlqNFdWeUo4VmgyeFRLNXc1MnRrY2c1dDB0anRrZS9mVVpObGM1?=
 =?utf-8?B?VjY0aFptY2xyYXdTeGlDVU01RGhJaWpwdVFRU2ROR2NwcG1hWlNXbnZKYUhE?=
 =?utf-8?B?N1VuNzRRVFd4TitRbHppaUpjb1dwM1lHVDBKRVNqWFJxM2pndk9SY3dsdExz?=
 =?utf-8?B?MEZWRHgxM3lPS0IwdkhWVGZnWC9xdDIxdjdMUE1VeldQaStFRzJybmtqK2Jj?=
 =?utf-8?B?UUQ1REl4STlaL0JTVy9TaEtFc1FLZCtSVkx2eFJ2UUlCS0phdFprblJkbDB6?=
 =?utf-8?B?NG9OVUxpUDdDWnZNVkVFM0d1Rmw1Tko0MzZwSXcvNzVrYVRhM09yMmoxdG5W?=
 =?utf-8?B?NWt4eFJCVkxZakZyZTBucUs3ZEgwWndLVXdQQWlpdWNHUGdjalFNaEdjczhv?=
 =?utf-8?B?ZjRkN216SkdtL25DamRTZTJhSEl3YTU0a2UzYXpndWZIV1hBQVMvSDB4aVVU?=
 =?utf-8?B?czRtM2RJaHd2V1g3MmZvUWZnWjY1NkdkM0MwZzdzY2w5ejdROCsycU5iM1Yr?=
 =?utf-8?B?K1FiVXpOU3BtWmduamdaK29ybUc1SlN0c1RpSFpISHJ1cmsxMkJPWXlmSzcx?=
 =?utf-8?B?eng3M3NrdFFmckxjclZNN1NTNzNjQ0ZQMnpHd3VtbTVQaTNzWi9GN1MwWXRO?=
 =?utf-8?B?OVVyVlBqMHdjS2FQSXdLa0lVODRGSnlCL2I0QmhzMkF3dzZEQjIxTTMwUXQ4?=
 =?utf-8?B?THdQSVRSR2hvZUVGT0pCWENOdVJ6bkZ2aS9ibjVNcWRuZ2xmV3krUT09?=
X-Exchange-RoutingPolicyChecked:
	DGBzjv+ZstoA1g+4b60F4zsDYSnt7InzdmJew8d/nAVwogY3xfRiol7B93QHfZo91B8spxHV52ovYDBpLsa1ypqcaRzFsxEI177Ag4iNXRVVfqf6bkB2X+AALPPxBmIwZJXOqLnu5D+Kq2+crCkI/3bQMg5S3RLOqZ9zFJET8jAt9QVOcOxr06net/u0ParL/+hxsinPrUWTFOQo0eH4oOQ7TNHOheZ9OIlcYw89UZyuxAfLkUV9tkR5nHKxAznY0us58K9X588umSohPPW1fCP/WeiyVi92dGqpDAvJW0tFVZCCEqD4z1xAbUkouMz1PspoUCMcIm8iNtGKG0D0kA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gCQ/A9/9NM8BYmWnwaEb1oM7v1fbtlo1JHPOGbDnM7kW0j7EmtbHIMOYpd9PGLqODcMbFxtQmdN1lxmlCRAb68GxIhjza6tAl0Gjdqhmu/gHfpF+1we3Lj06EkJkhvf0WeSKZJLraJzmi5yOEUwIJXOif4UhOsBA10CjFUZwYHMj1MpEgbFLUoTr2U02dPfj4vIngPF+O1jZRaKKIGowtLdrTuL/l96ESx4A1fAqiZiQvo78ZLe1d1aNwVyosSs3+DU3VtY/1OUjxAAp5QMfxaFnv0GHyKAabEQskPNPh5lICuVShBhw8I5cbKPuTMNFPXWbCXKMc1p6tvrxGnct4maRFuyByBuncnst8/dFUlM8DlTtJoay7F9m3q7OmMIsLjVQ2VwQ1GvdjBncmbWWMsGbKo5ipljeskfaNRkXuougkIY+o2aWiNdQjZXC0wFwETs2T6RvUfSk4pUN0FvNDK4bg+O66CUWSwltXCEY74wtpmTXVKKz6HGfS+oLtEo8p1raOKZWb4oBCKw7iivgVB+b6z0ICFialzLmxbX9KqN2GifPf1RujatoLsF5/wsGYEZSo+pmsmtWAq41K83iRWjkAXdul8sfqFqYZkM0+sY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092473df-ace4-4a3b-ad41-08de84f16a49
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:22:34.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3zvBa7/ju2ihml79wgeyMJfobz/7DDmGSpAUy8awt6+GKZsFH+C4Rjhv0q33ezf2rGUcuYzSsJX2isnbSOmqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7431
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603180113
X-Authority-Analysis: v=2.4 cv=HcsZjyE8 c=1 sm=1 tr=0 ts=69baa720 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=_Byt-cMoy3atJbuEfUMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mSr2EENI9ytJymsokvIioHnbo7V8_DXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMyBTYWx0ZWRfX/WJbjhimHdv+
 kCKyZOc/G9sN7BqvNuPEaM5N+DyhtvwUq1b+RwzztZLWN6vtjUbCAZGH8WsJ9+BkPRe1/twCxrL
 CnCO4F8MivmzuYHYwqyhKyWD3qFRlc+itWWcSgPt37fmF1khWQoZzsgD+xDQ4ooEJpV2iZSEC/T
 zK08fgiIm6Kd8XIakqTk1CExQlSvhDx9A8IYTMWSEkBVpSEr70EZMQSQGhYl4ks13EhVYf+kRef
 h0necWc60Hr46akgAkmarrr89v6bo+HIlBGfZ7VxMPjRPT8V5uIfIEru2bf1KcAS2YWUrWeO3/g
 +RPVJwy32EezPAiOiEgf9nGAaTruFBLQ98qJ+2y6KMcJ52tro/XekkgEx1n0JO2XP2X4UfvpLSG
 UbPawtXL8ZrPxEE1svHb2/WHLauTyMjlAvGiQgw1PkRFd9l+qMfQ3Yhn8BGGa/etD9D/pnYtPsG
 OSoPCfBTtS35metq15A==
X-Proofpoint-GUID: mSr2EENI9ytJymsokvIioHnbo7V8_DXf

On 3/18/26 6:56 AM, Jeff Layton wrote:
> On Wed, 2026-03-18 at 10:42 +0300, Dan Carpenter wrote:

>> Looks like a bad merge.
>>
> 
> Thanks Dan,
> 
> Yes it does. I based this series on top of Linus' master, and then
> merged in Chuck's nfsd-fixes, nfsd-next and nfsd-testing branches
> before layering these patches on top.
> 
> It looks like the problem occurred when the nfsd-next branch was
> merged. Both it and -fixes have the same patch.
> 
> I'll rebase the series on top of a sane merge later today.

Can you identify the patch that is the same in both branches?
Typically, the linux-next merge will catch that kind of thing.


-- 
Chuck Lever
