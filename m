Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22784225791;
	Fri,  7 Mar 2025 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363751; cv=fail; b=dyX7V1eFLP+oT/9TpCEDRVBBKmTfq4M28shrZVLI/nm3q8e00swi8vN1GV+RK8ZhGiKEqUOzy12xm8wMbOAcRNJG1MPEZmkVQxmPJUd4UIALuQBHde/QH4kJCyLSv13Ig3z0ZXP22V9C37g3kaII6RHYt48E8FiP8PA4iafx8vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363751; c=relaxed/simple;
	bh=WsC4O/AKIsdGl3ArY2sdYbo+EQHSKEm0kJe6L5YlXLE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h/C708WDjp+cBYY6HcWWEtIAkyIoCKV9ZcTyPjT3HEI5bN/wYunFxIXDWi3GszxCqXqLVuJTWFIgIE7xQ+Lw3breMegyMhbNCXEH0iXcnc+p5tS6PU4OELJ77Mxy6EeJRF3esy0emsamNd1bVTyvSNd2ZDfHgq8/MvrgXDe/M1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dr9hesOn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N8akbDwX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dr9hesOn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N8akbDwX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527EOGdZ027814;
	Fri, 7 Mar 2025 16:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5AnbMGwXjtwdd4eqKdA8ccMNzBTTnt3btcMBujRGTJU=; b=
	Dr9hesOndF6aC0K3JiWMnl3PgwSFAsUf6jDOnYf3CCLWUqTG/Vn4Q7+trhwStFvg
	A3kEYNdF5Tm3xVnoD37FJ/4UNBDbjZQqGrut8MnodVG3m3nWYL/yGWcM+WQLx0d0
	Dw6hsjHNsxtL/1XJnv5CILPu8Da484/O6c8SFbqRv2MPx9QJNBMPSYY9oDCCSD9V
	eascxcNl3Z3LL3zRRXP/WqDmQYya6HVEi5PyioSpWvN3q20v1zUoUtqBLHbGAQyw
	NGuOfnC2hKyg8yQ26+ukFDMmCr/4VlasrQl1+6BykAEanWvz0ntf9IoBjzMwLdpa
	hUTwK2VGouXEl4xu3ZZZpw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u824nbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Mar 2025 16:09:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527EpL2f015767;
	Fri, 7 Mar 2025 16:08:58 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpesktm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Mar 2025 16:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9akbUOjqOHSXyfijzOpyMiPxh9q1AYlDFf0U1CDddq7HDGv31Pd0DQ6SWH2Pj7TCkVyY53QO5Ho/6oOcV/3/hniCMVSRJC4WLZMfPxd4eBKNX1oIyjyPvL1wWSrPIB93IeLsmw07AcUFXDmqmiCE6jk2EUVF2Sw4rzy1K/OLGYKqoaDy/mucQ3lZ00qQHTbpfBGA9wpBnSyE5QaoniZQCtpBN3dcG0r1J/LPHt+uJ2UhWQ6G1u/K9ElDD8BLGJfiajFZXHSGPz46n4L/TIVt7WaMGxg/shWQsy3fCVKZbvIyehEzCoVumJE3Xa9/nThGbKkg85M7Fsl7TmppFQsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AnbMGwXjtwdd4eqKdA8ccMNzBTTnt3btcMBujRGTJU=;
 b=C4ygjNIiPKS1/vxPrb7vRVqRn02KfbIkjhd3SxUeLpFqTlAZ4d7ptLLZYM9qMtH1Tvfsw98/iBFgL1JnSop3BcuTvnNBO/tB14a0RjVWtVR06KGnCQ6XNIkBOxpQum3/B6SiCdhomGmF5dff5yUmhbOhvRBFXTQilabxA0z3vuC8TMAH233ioxWdYzDIUAifAFrP+B9QlrEQI04dHVhMGHOripOPEW3aXo2o0Z9TB3AwQOASXGqRFJVboazApsW+BZHDE06fsh3/oYB68sX9TMKlwZRqm6ooW2oR+x1R11UvmC98UzVgMmFMGyupuTmO7vd1Pqr96+dVW3a8dYU8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AnbMGwXjtwdd4eqKdA8ccMNzBTTnt3btcMBujRGTJU=;
 b=N8akbDwX1OgAQ6F2zWyFrjhWFn2857G0dnAn83+JcB0wXUSq8OExzVH8BORcpRZ7K/jy7WzrALCRGQTfaVMXuUH2jLIgv6zAtuLa/e87PYdjvhpbfIsvnSkXAcQ3oMAJRmjb4Ot/YRnVWH0WX6oy6irWFsfYNHEtKKv4clbgPoE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH0PR10MB4807.namprd10.prod.outlook.com (2603:10b6:510:3f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 16:08:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 16:08:55 +0000
Message-ID: <57bb1f03-3d64-4e74-b4c0-bf5fe58622ea@oracle.com>
Date: Fri, 7 Mar 2025 11:08:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [cel:nfsd-testing 35/53] fs/nfsd/state.h:788 nfsd4_try_run_cb()
 warn: test_and_set_bit() takes a bit number
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        Jeff Layton <jlayton@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <e223e751-072a-43b7-ab21-485f94fe3f2f@stanley.mountain>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <e223e751-072a-43b7-ab21-485f94fe3f2f@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0052.namprd14.prod.outlook.com
 (2603:10b6:610:56::32) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH0PR10MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 3091f2ac-e493-4823-95fd-08dd5d925c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1NPM0lYQ1k1NTloUG9ZSU9DUEp3bGN5TTRKakV4QTVDSlVGQktxWGs0YWhN?=
 =?utf-8?B?NWNlTmsweTZ1THdwdmFtVDZJdUxUaTZueUwyaWplNi92bWswUmNxeVRxSjVh?=
 =?utf-8?B?YjFURklYNkRVdjlaZG04eEtQRS8vRWZaYjliMENPN08rNHM2aDBoZFJySktK?=
 =?utf-8?B?UWxlOWFyenIzN1gxK2tmTDBuNStmeWMyN2hhOFZDdFk0ZDcwQVBzM1B1OFNz?=
 =?utf-8?B?L2dOUlJFUkdJd3o1cDJIT0p2SERvZ21qeWtPMUdhNlZnKytPemI3cjdPek8z?=
 =?utf-8?B?ZVdDUjZnQnpBZzFNNE5lUTBlSGpGNlFmWlp4QVFFdUZwVkV1NTk4emNRNXo0?=
 =?utf-8?B?aDgvSk4xVzlkOXhnTlNrL3FTRDBqcW1KZHpLR1c3NG1ENkk1R3pWTWJCcUVT?=
 =?utf-8?B?cmJVTjBlWnA0RUtMbGJDWTJYNm1oWUVjVjJFYWdBSy9BV1ZiL2hUYUFUYlBi?=
 =?utf-8?B?OWE4MzZlWkI3RlA0Ky9IaDh5b3FjbHJ0UC9ld3hwODJNL1d6VWRmbjFNbkRM?=
 =?utf-8?B?NTBueFNzZkYwRHVEWVpRWHplb0x3YUhXMUZHalVzMGk2V01OeHJ2SzZiOFQ4?=
 =?utf-8?B?bDg0b09mcVBsckpXYmhveWxKTUVjbVRTY3c3T2htSzdyM3VueWk1T2I0bHVk?=
 =?utf-8?B?N0xGRi9hY0JTc2s3bXFFUm1PVDdSdjBOUFI1QVNiaTljTHBmdEphUnFSeklU?=
 =?utf-8?B?aFJPUFZpTm5JYlZxbE81VE45L2R5MVd4YkxsRHRJaFU1SkZqTjkwK3JLQ0oz?=
 =?utf-8?B?NnVHRzZ4a2djUEc0bVdjL0JxUHUwYW1JOHBNNU00N1hxSm42SjNMbFhuSDhy?=
 =?utf-8?B?S3Y3a1d4KzRsTGVHWWF5S3h1Q05wdld4K1RnUXlWMzBRbXVFMUFtQUdlWFJQ?=
 =?utf-8?B?dmlkcjNaMmlqSnR3ZnBDWlhQMzR2cjEwNEZLaHFwbzcvK3dxbXdibFhSNkRZ?=
 =?utf-8?B?OUJhaWI3N25pbHJnandtUzN2Mm5HTkFJa0dTUFRxVkVwVU9vMWU5K0ZqN1BZ?=
 =?utf-8?B?bjZHcEt5UVFTdmQwTm81RERFc0FDMjNWTE0wR1hOYnU4dFBZT1ViL3FrK2JF?=
 =?utf-8?B?WS9DYUpabmVqZEx2ek5PRjh1elBnMG9JOUk2dC9tODk4Q01UekphSlhocUdE?=
 =?utf-8?B?SUIvUnlQT2hDZk9KQ2R1S0VJanlVU1N2RzcyVHVvMmNhc2haM2Mwa2Q1L1Nq?=
 =?utf-8?B?a3hqMkl6Y0E2TU9VcUJRNEpoSGVWaFI2QUxxVzY0RTBqQk13bmpYRUEyS2E2?=
 =?utf-8?B?andJWlNMbE1UdGpmVjNqUEZ5Tk1BRjNlYUxqeDhTSEU5OERaNkFZUWlTcHBU?=
 =?utf-8?B?cFV4VkRaaGdvZWpvTEljTmtIWm9JZy95aSt4WGh6ZFBHb0wrbWFLMTdTSmZL?=
 =?utf-8?B?bDdmb2NYaUI5YzduNjJhaTBFdVMrS3N6d2RHZHhHVXRrM042VWxHY0J3R01k?=
 =?utf-8?B?cHltTDV6Znd4RTNoYkd0aXVUcXJXa05XTEFNSENVRUk4aEtOZDBEdHFESk1K?=
 =?utf-8?B?ZDNYNSs4dkRGclp3UGQ2WS8xMTluZFd1ZlA0bVBMMS9MbFB0VU1PN2lDc3dn?=
 =?utf-8?B?bzVjdWpHSjVXd0gyQ1FqWlZMOXZ0QTJrejJ5MTV2UndUR0V0WWtRYUdma1Uz?=
 =?utf-8?B?akFsZmRhbzZtRHFsRk81OGpYRU80a2pjdk4rVjNzT1RBZEFocm5mZlZjR0Uz?=
 =?utf-8?B?OFZTRmdiWi96NlZIMTdIMjlucnhEWWRndmdnb01naGRBTGVSYWF5MTl2d1RC?=
 =?utf-8?B?bUJEOUpkTU9aOWNkdkgranNucW1zUjZzcVJjRmZTbWJCME5HTjVzM2FyanQ3?=
 =?utf-8?B?NUJhcmJpTEZIUzZVY29DZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0Q0RW5XOUtGY0lWbllGY1pESVlsRmFDR2U4RkQ0LzVhWjlLcTAzUGpWZ1gz?=
 =?utf-8?B?YW9vczFEMS9yL3drMEt3UDhjNXJXeVJSa2FSYzVzUFNqYTV0Z245UXZpRGRo?=
 =?utf-8?B?Qy93ZzBvQ3hkQW94N3ZwZ2c3OURSc2g3V3NpZlhuZys2S29RVi9lWHNweXJU?=
 =?utf-8?B?QUpkUjQ4b0dKM2VKRnZxNXRoMWRkL1dUZ2t6NkpUa1FkaHpJdElkQkJGRnlI?=
 =?utf-8?B?L0RnRWlUZlBZeVJmWXVqZFZiTUppZXI5L2k3MFR4Mjk2cTR5TnJyQUt3QkQ1?=
 =?utf-8?B?bFRIdXF2aE85M1YxRkNEUGxXanBUSWU5ZllReWdkSENKTFQ0eDYxUHlrUkZM?=
 =?utf-8?B?TWtaZVhSaWpDSlg5OHNsSkNxVjRQTzVJSEZ3eExsaW1EV1JUZUhrWUlhS2NN?=
 =?utf-8?B?T3VnMHNEUUNrcXdmQXRZdkI0WWRkazdmQ2xtdFd4MlZaRHBlT3FrTnQ0cWds?=
 =?utf-8?B?aVZIZDEwSW9VcmZxaUYvNzFHdWowMXl2TkZPcUxLaW4zWWlSRmpyWDByaUVE?=
 =?utf-8?B?b2NTZzB0eVRJQmVPcFVTU1YySGNlYUxzaDJxN1V3bDAvUDZEUkFyY3kyLzVQ?=
 =?utf-8?B?NTQ2V3JEUUJ1Mk0wK0QwLzNzL0pHbDRob1lVRHE3b2p6NEpmRy94UDYydHEz?=
 =?utf-8?B?czFZbTl6b2tURlQwOFZ0ek5pMmswTGpoNGdHUFBPY2hEcmN5cVh4MGN1Vmxp?=
 =?utf-8?B?dEFRbGVNMzQ1ZDUxc1ZhUm56WGIyYm0zYk1DK1FLWlhUVkRDTSthTTVENlUv?=
 =?utf-8?B?Y0NhY2hVZ1UzSVdISGhWZHd5VVdwTmdpQk1pOTlNVE5EYjdJUjdkYUpKemwv?=
 =?utf-8?B?UXJYaXFZRjY0WktEcm9jUElPcEFXanZ3TVV2WlVYZVFGT3R2RjRXa2svRVEx?=
 =?utf-8?B?WDBRb2QzSFpXSGYxVktCV1V3TEtYMm1GQ1owVC8waXpWeGwzcHJBRlBsa0xX?=
 =?utf-8?B?Wm9iOU5FZFpmK3UyUkg1cWhsdzNXdzNkNlVrT2NGMkh2RTVJa3BjVS9jQjND?=
 =?utf-8?B?dnFkbGtpZWhFSnJGZjJTQzRyMmRCN3REamE1TEhyYitvNnlPNVZFRmY3RGpK?=
 =?utf-8?B?N1VDZ3NFb0pDM3kzaEIyWmtVdHZrUUdSS3Vwd1dxdDU0RXN6K0FzUHVRemFI?=
 =?utf-8?B?UkswNkIrSEdzRURhVGU0cHU4YWJWQjlvRTNxemdXajNLRTQrVzdNMUwwME11?=
 =?utf-8?B?N1F3L1U5RUg5YUdacGVEWHdRTE53RFBmaFlFcVVsdmtBNThsenRWeEJlakpY?=
 =?utf-8?B?M3doZGRGOXhCOHFjc2lRZG5FMlJ6QW1WVEVzaGZlQ3BDa2d3SGNGcDM2T3RB?=
 =?utf-8?B?aWlLUC9aY0crbkM4MjhMem5DTVkzUHFIUGxaZlFEaXJ1YmVKLzFVVjMxR2tX?=
 =?utf-8?B?d1dKSHdZb2VEaFFhQ2VxWm9paUJNOVNFZVJNSzBndHNiR09Ba3pzcStQZFNP?=
 =?utf-8?B?ZDRsOFVCVU5OTzV2K0orclpWTjdOTlcwYzVpMllJbExkc29wRXMzQUhuc212?=
 =?utf-8?B?Q01rRzErbVJSTEtXUW1PZ1RwWXBLUlZqb1dmOVBJcnMrMVJ6TWZxdzl5ZHlm?=
 =?utf-8?B?b1kxWDZnRmx0TGlreGswQXdGTTJHUmZ3Y1Z1QjNwUjhBV2laaHZkMGRKWUxq?=
 =?utf-8?B?NmN1VzhsYkpIQU9YanNBSGtBalpibk0yNHYyRjJVcUdaWjdGLzZzYjNMNkJC?=
 =?utf-8?B?dmJNTVYyMzdLalBIWEtQcWhxbHFWZEpsWlExbDJxNGFia08yL2tQRC84NGxM?=
 =?utf-8?B?ZDgxamVlVlpSM2VJN1VMdWRKS3hRNFBrS2Q0WUhyait6V0g1ZFN6T2NVLy9K?=
 =?utf-8?B?MWVsNEsrU2xLdzJFYzVVSldJYzNubUpNbnpIcXBUTkhuUWltY2tuWnZFWk5W?=
 =?utf-8?B?QmdBbGs3SVZNVmxXa0R1MjBTQTV3U09YMnZuYWp3U3RVN01TYW0wNnpEbHEv?=
 =?utf-8?B?RW9pK2c3S2IzTjY4WU92clNRTmtzMk5OOUVqT09xaVBzbitURmhMaGcveGFN?=
 =?utf-8?B?S0xLSE4wQnVTS2ZYQ2VHajBVL2JmNWV1bUdhVkFDNEFhNGM3NHFQMGFTVDFK?=
 =?utf-8?B?T3VXZTRkRExKdkhOWXg0QkJkZXgwLys0Mks5aktoMkhTNEYvdHcxN0x2eFBW?=
 =?utf-8?B?T0E1UHBNalFoWDh1c2hKeTRtbXdtYmFadEpGU2xLenhnYlJ5cHppQlJuM1h5?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v24LJL6TywSKXNXyVRwd7ehS01LxG1reNJUOG6gLJ2XxKDP/Dq6+LSmCGCJIpIVbnhfQDrArzlkd/q4KM/pnzOEP7gt6R3S986LaPDub86xiacKnUzH739xD1+k2LrwQhHbyhAbl/fdiFgZoZuVleKtFg8I+6FSmhyVrfY9/za73tF9Wl34tcw3qW7NJrNNCfTmeUKfIQtmDdS60u+7XNeDWF986p2hjdn32oTLVTWLiU+me8L30zwA4JaaAa/hGWQ6RXHCjrsp1XzerU7Y1bBPCmmsOmge0K39wTKWDWfbvXLlneBNxlXtMxukfN+/NkrhH4NmcAPSd3ervKy4Y6yt1JvgZiKd89qPHZMXJVWxP1pRGdIZpB0tu7q8+U+JI/YszkrRUWxUosR08IJO9n4Pc3/CUFTZGZmbynOdKSSNO8lyTIvcpkzhIYvBx6Mj1peRgyZXztlIzO3bliyxZd1W57iRhu1GqHxZL6OccfSpRd1GaaW/mUd12UgSPIOFw0pRmyGEPwjkNAPctuFRk64U2eF2qNxDpe/5zZqphi+aJmT94z1bEVR3R5rGJ5z8A+fQ80dCj5SXFe8NCuEI5/ftTwVsJnZmZn/6s1LtRP0k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3091f2ac-e493-4823-95fd-08dd5d925c74
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:08:55.6255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtWq6tzJxO8gSmmPSuZdcD03VQ0xlkIz12Att8daa73nILEkEESS1LYnEDAFqnUACZTks0QcwIfaDovPk4UnUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4807
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070120
X-Proofpoint-GUID: Kuek1n9AoayzWn40VhHsZumSqS0Vb20J
X-Proofpoint-ORIG-GUID: Kuek1n9AoayzWn40VhHsZumSqS0Vb20J

On 3/7/25 2:42 AM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
> head:   312e8dc9f5f591a4927b4786a25840ef381c97d9
> commit: f94ac2bc823ffbabc5c88c38e63a1e6635f8a6cd [35/53] nfsd: prevent callback tasks running concurrently
> config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071428.Y4kljIky-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503071428.Y4kljIky-lkp@intel.com/
> 
> New smatch warnings:
> fs/nfsd/state.h:788 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
> fs/nfsd/nfs4state.c:3235 nfs4_cb_getattr() warn: test_and_set_bit() takes a bit number
> fs/nfsd/nfs4state.c:5428 nfsd_break_one_deleg() warn: test_and_set_bit() takes a bit number
> fs/nfsd/state.h:788 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
> fs/nfsd/nfs4callback.c:1315 nfsd41_destroy_cb() warn: clear_bit() takes a bit number
> fs/nfsd/nfs4layouts.c:347 nfsd4_recall_file_layout() warn: test_and_set_bit() takes a bit number
> 
> vim +788 fs/nfsd/state.h
> 
> f94ac2bc823ffb Jeff Layton 2025-02-20  786  static inline void nfsd4_try_run_cb(struct nfsd4_callback *cb)
> f94ac2bc823ffb Jeff Layton 2025-02-20  787  {
> f94ac2bc823ffb Jeff Layton 2025-02-20 @788  	if (!test_and_set_bit(NFSD4_CALLBACK_RUNNING, &cb->cb_flags))
> 
> 
> NFSD4_CALLBACK_RUNNING is BIT(0) so this actually tests BIT(1).  It's
> a double shift bug.  Which works out fine so long as it's done
> consistently and the BITs never go above 5.
> 
> f94ac2bc823ffb Jeff Layton 2025-02-20  789  		WARN_ON_ONCE(!nfsd4_run_cb(cb));
> f94ac2bc823ffb Jeff Layton 2025-02-20  790  }
> 

Thank you, Dan. Fixed in this patch and the two following, and pushed
to nfsd-next / nfsd-testing.


-- 
Chuck Lever
