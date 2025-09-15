Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AB1AF0A4;
	Mon, 15 Sep 2025 02:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757902484; cv=fail; b=HcSl+y0sPGUtlQ6agG4/C4qLrul+Uj5AXwH6oNOKs4ehWUF/VtPIPlRuIT1bV+Ei+xZe2UIrgh/Vdiyni/sdZuhuCHKyep4fP/UxOwYa8RX+4ryjPIsDqNxDtY9pgu7DUl7DD9njXMtEsl2lNMwJRvFNGBR8kiBl6ZfCdb/3nWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757902484; c=relaxed/simple;
	bh=6yWd/8KSzUP/ctbowVRcOtPmsdQxeWExnchyjUWXfak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h6CgVVn/rq7O0aCRnPAGS887Cp5MsuCAktJGYds+VakNFS94P944r346KZFusu5zBsB6wlAR3ctWSxV3S17P0cEANNXSCoOXB35DcOjv1lCYrh6Q83NW3bL9tNfb9m3+Oa0xxZVC2eH73NBqJnnEt3yYsnv0xjKCYgXXzyy4/Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b9jylco5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TJV+uOrm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b9jylco5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TJV+uOrm"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F1XMh4025349;
	Mon, 15 Sep 2025 02:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=olGMjQ3COM/S4FgnAWzbEhvoVQ2XTyR+2lD1HOLKoCw=; b=
	b9jylco5lY38zFkIxlaBWbiS6uFrfA9SccVGXq/XHZ4Jva1h1HCXwZxxwmZMu2m1
	Rtbs3JqTwM7LyaCzk2ReOgsCrwt8V+MjNb3FG/viHqqsgwpw/mP6KmFru730Appj
	s9rbTPxnuESoyd0S4dOFZoB9TyrvWRdbTJMAkVz2Fxr9ewVUst+pxPISqnTUN33n
	x2Z3nPGh7h55bfw/bvfoPUlLR4JU06IEpC9DBPhf2OWnYYAJPdgd31m458C9Jy9x
	fEkMeSfEI4ss175J0DKujqWasraAt/3qQfxiRGWIImh9TY5RMa87itlSLiQOCIzW
	55VmHFYfsQm5HdTayooyWg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yhd1c2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 02:14:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58EKg2uB010538;
	Mon, 15 Sep 2025 02:14:32 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2ae4fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 02:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rfg+bVcC2p9Js3h6vkfA6qWo2ZynTx3HrbWYQFoI7x9Zmkzu5GDA7HPvMTmSoYVV4uedCv9JqE4RzRCBiH5P7acG1nP9oc2HMrd8rv9N+YV3krISCFht3PZ+uHZOSLPzisDasumURMd1BJcVyMTRbRfPWwTwl87XZRffKPPDpiXx8vT0xJULv2jrZDQE8YWTFyM9pcaSEyjpnYEDfbPXYa/sa0qbCnbUVwRbsgTv80l86QAvfb/tZt9W6+E2R1HsSmWjYF6hHZAbIoh7D5kQPm7lX/6Ko4iVlEY+w0pmFPG6VkGNGCyBkiVFlRyKs0qNmCWcyPv/qWnm1dQjaagXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olGMjQ3COM/S4FgnAWzbEhvoVQ2XTyR+2lD1HOLKoCw=;
 b=jc0Y82+Lzc9T1srDXRonzRtcbL3yMHuRe5Q5BEmvonobz6Ll41ueY/6rCQTFDCvMSCTqyR4ciFV30AKdzyIgUJBwnxInYibCH1gN+0LO5dymQ9TX9jL8H8T8DwziiUlX3b8+xcrRJNUlseb0ZetfmxslYQxEhK7enzxzNJumlfsVawQriAHYhjDyJ0z97JYBvXiZl3BuouqWipRtdt/yIaRZ//gezBwu8YW94m7Ffq67TbUQnmesahTEK8B+c37ZF0RwpZn9LK8uOHLTFpC4hCzTkpX0ecAbL6L6QAUKPaJQ6VCvlkzdWCg6vtmQhomifJG/v5z23hxTVUzIeBNkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olGMjQ3COM/S4FgnAWzbEhvoVQ2XTyR+2lD1HOLKoCw=;
 b=TJV+uOrmRKH/of3/HgDmWQN00bozdECgeLfy39qMu2plxrpItMFqBtV/ZjS74DkHFCynsK2sBauyyDVo6kPuMuuDmTjFjA17u2LLvuIwXLBf5INOGNxJPrCic7olV+5Z84xlU/KqYFnT9ORt7jlFfeegJCIRASPxil4LhsXvxM4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH0PR10MB4677.namprd10.prod.outlook.com (2603:10b6:510:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 02:14:30 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 02:14:29 +0000
Message-ID: <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
Date: Sun, 14 Sep 2025 19:14:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nfsd: change nfs4_client_to_reclaim() to allocate data
To: NeilBrown <neil@brown.name>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Jeff Layton <jlayton@kernel.org>
References: <202509131751.4STnDcZg-lkp@intel.com>
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name>
 <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>
 <175788975119.1696783.10090163184150858167@noble.neil.brown.name>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <175788975119.1696783.10090163184150858167@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH0PR10MB4677:EE_
X-MS-Office365-Filtering-Correlation-Id: a4aec14a-5f86-4be4-5a46-08ddf3fd99f8
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S2tOSkpGcUtNOWVGRDd3NDR2aGhrQUg3TklqYjBLSG9lQTV6MUZ6UVhRQ3dp?=
 =?utf-8?B?OEcydUkrUElZV3FtSmp1R2doRnBnSGU3VHRCNGxIUmduWHh3TGpvaExFRHow?=
 =?utf-8?B?akdlMStNSGRHUi80bVJ4MXNvYkx6NXp5TmdmM05QempsOFgxUkdLM0dJblRo?=
 =?utf-8?B?N0ZzUmxRNDhlbHFmb0ZJb0E2T0t1akJSN0drYWE4QVVJOE11MndwNGdFKy9Q?=
 =?utf-8?B?bVEvdHkvQWdQOUY0ZldkaXF0VjhqUkMzdzROZERjQVY1TXM2RUcrbjBRaDhB?=
 =?utf-8?B?c2tFTWgzV3RXczBRenYvNjZYdmt4Z0JXOGpQVHM3SE42bURZcG9oWGZMWTQ4?=
 =?utf-8?B?Zm5IL0s3RlE1ZDVFOGg0aGZSQk5JMXJwR1ZodTJpbHlsVlVyRGRUV2RpWGNW?=
 =?utf-8?B?NURWZ3VRMllYYyt5M1NzSlJJN29NSWZSMmQ1WTdoVk1XRVk3RzJYTy96YnE2?=
 =?utf-8?B?Mzc0bG5OdmEwRnAvemNHcDFmSmt1Yk5aR1lLbWZKODBpOWFtQlhyOTFZdXA4?=
 =?utf-8?B?M0VwdzJEVHZLbnk5KzJNSFNPSTVuSC9lV0ozZ29IdXRNVjZPRElaQS9ZcTZw?=
 =?utf-8?B?a01WM1pmOVhsZlFCMEU0MFp0NVd4TXRLOEdhQnliVlBUYng0bkZtS2c3OHlC?=
 =?utf-8?B?ODFKeVk0cCt5SFFBQldNTHp5UGphaTJpai9TOERqSjM4bitqR1lwVW9wN0JD?=
 =?utf-8?B?ai9uV29QZlBvcTRMaDYwNGIxUzl5SlNYVXY0ZElBcjdLdEN3WURaUnJud2lR?=
 =?utf-8?B?THNWdnRZVGs0RHZ6K1I0dUNDQjJoeHVqVVVobW5leVNQNXF3cllMOGU0K2lD?=
 =?utf-8?B?MEI0WFFld05hc2laY1gwYmdRUklKOHlqNENEKzExaCtIMzl5YW9xaDhzbEQ0?=
 =?utf-8?B?Njd3TVlvWDZ6K3F1YUV3Sm95bUlRS1NiQldIcDFPdFVGd2lERUMvSmJwRy9S?=
 =?utf-8?B?RHZ6U0lhZ2l6NC95QmE2M3BXazBWUE1Bakg1M0JoZWNYLzQ2QVgwZXVSOUF2?=
 =?utf-8?B?aWhmT1NCU2YzWHh4R1hFd0s4cTlFcWQ1MWM2N0ZnTk5qL2lWTnFYWnNxSHVw?=
 =?utf-8?B?alF3ek5CUEZlTHZHWlRyTkt4TWxYdk9yalhNQ3VxZnpHVWdHSkdLS1hta0V2?=
 =?utf-8?B?d2kvc0k2bzd1b1dRb3dEQzRiNUtLc1RBWlZ6ZFJHRC9oU3o2Nmk0TXZqRXI0?=
 =?utf-8?B?UmZTcjhvbElEOG51ZlVtT2VjS09hRk9obWFvdnJJQ1R1QkJJMllnbzV3Vjl3?=
 =?utf-8?B?Qi9nK2xONXEwbVdTek9HUTZaY3cxV3hMS2FTRk1wYjY0U0Uzb0tZOXRCSTl0?=
 =?utf-8?B?RHE2cERZdkRVYTg0K01QUXd2cVhLZUhYUlZCdXVFRHYxZG8xSmFzcEZEcllP?=
 =?utf-8?B?RFFUZzVjcWZucW9zZVhRRFVTeEVnM202a3hjRkpYQ2ZZRHJtMkgvNW1BL2ZW?=
 =?utf-8?B?ZmRtM3BjdGljYWZTdTlGSXgrN2x3OEs3bHBOMC84WTE5L1VvN0FyN1NiSGlW?=
 =?utf-8?B?UjlHcjNiVnJsaDVzMTFMWFhwcEczQXJLQXE4U0JWK0haM2NraXladk12N051?=
 =?utf-8?B?L2ZYVzJsck9SQXhCMFQ0UVhnVDA1Uzh5VkM3UHRnS3NkRTg0QVN2Tlh6K21X?=
 =?utf-8?B?NWRyMEplUDhYUXdyRHl5b3IzdU1EU1duZTZiWkpCN2hrVjY5TXo4RmlvOHV2?=
 =?utf-8?B?N2UvQXkycDVwSFp6QjdaRlRtb01qaXZFanZuR0c2UW5qeHNqRmdkOE56V3oy?=
 =?utf-8?B?RHFXNTd5ZE9PM3BNNFpTR2o2ZXVzY2NVOTE3NWdnamkrV2N6THhGQWg2ZGdR?=
 =?utf-8?B?T1QzNXp6WVZzQm5yYUowUGk0dUlHU3NTaFFHNHc1ZDNjRldsN1hyaC8xY3ZC?=
 =?utf-8?B?NmJ3YjJKSjZ3UG15bm16eHRTcWx5cVF6YVIzK012ZXFpWFRIVmhFRkRsT1B5?=
 =?utf-8?Q?Q4WMPzYCgJ4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NjFiYUJCcm1JZGg3TmFid0J4eUNpVEJoOWY0YnhlQUtsZjlIWkxtREdZeW5w?=
 =?utf-8?B?Q3ZJTmpEWkZzeGxudU1kYjFUR0tsa1Z0OU53cDI3WTFHM2dRcDdhbW1pbWxu?=
 =?utf-8?B?RUFDdHNLcWlXS25rc2tNZGExRFUxTFJsRUs0QmtuK0Y4Z3k5K1ZwdGhkeFZH?=
 =?utf-8?B?TmNXN0FEbXk0cTJQNFVVY3Bxb2xKWUQzMmhGZ3ZUSjBFR2NUQmJTRnh3Tyt3?=
 =?utf-8?B?T3NkR0FDeWY3cXNmMk9NT051aUZhMHNqaXIrV2tCaVJxTVJUTi91VG5xaXUv?=
 =?utf-8?B?WlR3bW5XNGJDem5KeGpTWDlWUTNycExoZVFTR0MrNWN5K3prTkV3QnJ5QlB4?=
 =?utf-8?B?Y3VRQW42YWlyOGh4bENQRXBoNUpxY0hwOXllVU5aS0V6a3dmRXU4ajA1R0JU?=
 =?utf-8?B?TndqMDhXeEozekE2VHVyU1g2YjVtN3ptbUVvcGlZcEhnMkFueGNTYVVwSHVm?=
 =?utf-8?B?Y2VVZ3M3cklFM2U2NkowMDNYMURvQjZJSUN6OFpDN2NWM2lyQ3BqZlBhRmR4?=
 =?utf-8?B?aWFKVnA3UXo2Q2gvbnNDdEF3VU0vV3VhZXRoVk9hdFQ3OGhnR2xWWXRROVhS?=
 =?utf-8?B?blhOTGwzcno1VzAwclRJQXhnVU5nbFFXVm9CMnZhUzBJTGpqL0g3ZHA2Zm80?=
 =?utf-8?B?RVVKdis1ZnpNM2R1SmdzWE5wOEZiQ2gzQVJXQ3N1MVQxUW9NcWJyZDYyYzlM?=
 =?utf-8?B?TTlCN09oWU1qS3RYVDh1QTFITCsvZFVYWDVmcFpoOGRJQnJhZHMwY2ZadjM2?=
 =?utf-8?B?TWNtQzJOSW9EaDl4M2dNSDBCa0s2Q3JkdUlIWlc0QmhiUTdZb1FEKzFCZ3c3?=
 =?utf-8?B?SFNZNkpoUkVjajNHcXBreDNkcmZKM2RSR3JLYnpXUVBrbDNiRFBWSzJTcG5U?=
 =?utf-8?B?K1NoUzM2dDZHbkhGekJjWlU3dFQxV3F4cUdtV2t1ZkJ6REhnTjkzNEloMisz?=
 =?utf-8?B?eUpZYk84NjBEanlHaHlBZ0pqZ1JWanJmWGN3L1VLVitSS3U5Mm9Fa1Z3dS9W?=
 =?utf-8?B?RDZtenhxdXZqaXdqWTR5eWFHRmMrTlJzS29rWUhOOTVpeVpCY2xKb1lQeTZs?=
 =?utf-8?B?b29iYkNRSHNjb2U4alpSVDdESm5RZEdhRGNBZ095VlJVQ0F2UkxpK2pSRUgy?=
 =?utf-8?B?ODFQU3pKamJQT1J5T3N5N3VhMFowbysrS0NUc1pGOCttdzhiMVZKMGpXaEFv?=
 =?utf-8?B?U1lpR3dEZUtOUGxMdzhNcmlCTVpzQU8ydHZRdUIxM1hTS2JkVHdhTlFHK2tQ?=
 =?utf-8?B?VzVzQ3o3UEFWRUlLMmlLdWU2OUt4Q1hKNmpSYzZOd0FkZFAvV1RkTVkvRzVG?=
 =?utf-8?B?allLbGZsanNvVlNMUHFLdExLSzFmT1JsVEVURFR2U3ZjZnN3LyszTzZkMnh6?=
 =?utf-8?B?VlEraGpESGVHTmJhcmJ2d05ka0plVjdXUWI0R0ZBVzRFaEJ2RS9zN0xkZ1FL?=
 =?utf-8?B?YzNRUWVxdkJwVGptekRlemRBZ3dnUFlINnBEdHZlbXVJUC9rUmdpU3Fad1pX?=
 =?utf-8?B?UEVtNnhIT3pyajBBYUZ4SHpRckpUc3M3dHUzbkQycG9RY0IzL3Q0NmhPRTlC?=
 =?utf-8?B?czJBVmh5UWZsbVNqTHExSUIxN2hNWVpHSDh2ZGFlOWpNQ1UxQ21vUCtqeU5X?=
 =?utf-8?B?RTkvMDZza213cm1ZVVN0UXFqbGJDams5UVN2RzhDbUVId0xVYU81Uk56UkpG?=
 =?utf-8?B?WmcrSFo0dkRnZ0lzenBnNC9UY2svQUZmMmN6ODNBcjdVNExzalBwN0lOWStF?=
 =?utf-8?B?UFVEN2J2RmxiTWc0eXBPNEhDK3NuZCtiZklCZ3FjaUJZRHZ0WWVDVk52R0py?=
 =?utf-8?B?bGp0bXpZTy93UHZ3YVorYmh6ekxTU0FZa0xaOEIyQzUzRWg2M2NyUFVib3F4?=
 =?utf-8?B?cXNBbDJpV0xMeVpXSHd6Vy9nOU9xVWlHOVFmT1I4dy9icEZ6N3oyUVFENEZE?=
 =?utf-8?B?TFhXck9qbkcxSVh4elg4TzY3KzdaU3BXVi9iU0JGY3FOOENOaEFmcVNyM3ZZ?=
 =?utf-8?B?ODNCQkZtc0l0d2FCSzNSZzlWR1ZydzR3WW9NVFlYR3hubVNmcXR4a3VzZmkw?=
 =?utf-8?B?Ylo5d0o4NnhRUXVReFE3VC9MeHpPcFF6aXBhUlpRUFY5YVcvd2pMSWZKVnB3?=
 =?utf-8?B?U3plT21ySHdhMWhkUDdHcE9LZ29wSWNuMTlUZWl4bCtidlc0N3RiZHF4WXdi?=
 =?utf-8?B?NkdkMmpEU3QrS2xlQW9oTWRoMFVtOWo4LzlPSVdTQ2JMMFQ3aHhkYXV6aEZM?=
 =?utf-8?B?MW5LQ2ZCK1QyeFFqVGpQb0ozZXpBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Yfzkop0wFy6NvAyWMWHzs0r5m5d1vUuhvg07BJZg7jzoGxSsFYzils9pxkStVPY2Lpn6CzDI0cTD1RnCku5pFxLzIiSJvjNFcEWUUI2nt8jO4E9Cooes8gRrbVLmgCvj3Nno3xYdQp6fiC2E4UiYF3rUqrAXF/OIsSU6P4WGuoxlb+lRiajczIsDlQ2I1iwY6AFf2aOs7xUbo1yXrOInPj535P6yHc6ZgT9LTzK+rthX5INVzJvHy7VTiTe4sQvtwEEutP1uFRZL7XhKQ1Rq8bkeqd9IlSSDJMfWp4w7FV4nB4o58ydZDLMnPdA7lTs83i+hmO8J0RPE8FxKa03x8hQTzZWANI9iuSP77PSNJCMuvFc3zMtJPYdS+t3WTHJGjPHEuqhwMuR0oRINwvGGQYDgK30q9pIDlY36sWRcYdE8BOIPd6RSZ34L4aVGDLVOcQPbwaRtHChZW3l5qeeG/C0aNKiOlkEh/21IWq2A4SZp1UxJtn8QtP3si3JSYS3PBXAxZZnHqmWUGUfIdxejRvfW98w/RecS/VC0U6oP4d3zXXSU2ucbFFNLQxZ0XrAkTc9rTtQ2qugBwKGOXjjfTBewHw6frk6pvJeqWFF07k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aec14a-5f86-4be4-5a46-08ddf3fd99f8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 02:14:29.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfSJ+aSIvFY/GgTKqQFLKFR1GZqTYLQ3jQGmu5AuseO7V3GU7rq+Q/tscIXQ5sRUauW8HcEbgQGjbcudh8Nlrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509150019
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOCBTYWx0ZWRfX2T+U0VEl8cGU
 ehVYJr58UtBKY4Ll9QnBpFJWA/eIhsgQnq/Pi1OIaLXrTQnhczsiJkDwAwrEeWhmUKPm8cwpGBT
 RWnXG4SC2FhrbVE+oLNI8PJiwekmdqRaKn5QNlJfMU8dka1oNO5Y4LahlGjhQ9YHbFqcbDzi8qV
 or1XXTID6RzPY6HJw9PyOb0gwd/z3kqGRV+qjzHWNFVMoN2gszsfO8gMjPPyG91c4KB/CPpnD1F
 0kEwFZ0VbNXU0B3+nL2IVuw17QL9n4jNG/Ui4aBMx2bNXCSPPCec2Rjm2ZXOgSJuu3fESgNWEf2
 wgaQ1bMiNN+8CRmH5c92jbAy3W7AX3tEXglUfjXjYE7/ujfvWWqVcp+Am6TfzB/tuyQusYOZ4pJ
 E15c3viE
X-Proofpoint-ORIG-GUID: Ma0k32WvwmMHWEHuZPu7lyRXqy5vobAS
X-Authority-Analysis: v=2.4 cv=YKafyQGx c=1 sm=1 tr=0 ts=68c77689 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=oaZjth0VYL5L97f4HBkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ma0k32WvwmMHWEHuZPu7lyRXqy5vobAS

On 9/14/25 3:42 PM, NeilBrown wrote:
> The calling convention for nfs4_client_to_reclaim() is clumsy in that
> the caller need to free memory if the function fails.  It is much
> cleaner if the function frees its own memory.
> 
> This patch changes nfs4_client_to_reclaim() to re-allocate the .data
> fields to be stored in the newly allocated struct nfs4_client_reclaim,
> and to free everything on failure.
> 
> __cld_pipe_inprogress_downcall() needs to allocate the data anyway to
> copy it from user-space, so now that data is allocated twice.  I think
> that is a small price to pay for a cleaner interface.
> 
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
> 
> This version fixes the problem Dan found with "child" being used
> uninitialised in "purge_old()".
> 
>  fs/nfsd/nfs4recover.c | 71 +++++++++++++++----------------------------
>  fs/nfsd/nfs4state.c   | 22 ++++++++++++--
>  2 files changed, 44 insertions(+), 49 deletions(-)
> 
> diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
> index 990fe3d958ed..b1005abcb903 100644
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@ -147,24 +147,13 @@ legacy_recdir_name_error(struct nfs4_client *clp, int error)
>  
>  static void
>  __nfsd4_create_reclaim_record_grace(struct nfs4_client *clp,
> -		const char *dname, int len, struct nfsd_net *nn)
> +				    char *dname, struct nfsd_net *nn)
>  {
> -	struct xdr_netobj name;
> +	struct xdr_netobj name = { .len = strlen(dname), .data = dname };
>  	struct xdr_netobj princhash = { .len = 0, .data = NULL };
>  	struct nfs4_client_reclaim *crp;
>  
> -	name.data = kmemdup(dname, len, GFP_KERNEL);
> -	if (!name.data) {
> -		dprintk("%s: failed to allocate memory for name.data!\n",
> -			__func__);
> -		return;
> -	}
> -	name.len = len;
>  	crp = nfs4_client_to_reclaim(name, princhash, nn);
> -	if (!crp) {
> -		kfree(name.data);
> -		return;
> -	}
>  	crp->cr_clp = clp;
>  }
>  
> @@ -223,8 +212,7 @@ nfsd4_create_clid_dir(struct nfs4_client *clp)
>  	inode_unlock(d_inode(dir));
>  	if (status == 0) {
>  		if (nn->in_grace)
> -			__nfsd4_create_reclaim_record_grace(clp, dname,
> -					HEXDIR_LEN, nn);
> +			__nfsd4_create_reclaim_record_grace(clp, dname, nn);
>  		vfs_fsync(nn->rec_file, 0);
>  	} else {
>  		printk(KERN_ERR "NFSD: failed to write recovery record"
> @@ -403,8 +391,8 @@ purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
>  	struct xdr_netobj name;
>  
>  	if (strlen(cname) != HEXDIR_LEN - 1) {
> -		printk("%s: illegal name %pd in recovery directory\n",
> -				__func__, child);
> +		printk("%s: illegal name %s in recovery directory\n",
> +				__func__, cname);
>  		/* Keep trying; maybe the others are OK: */
>  		return 0;
>  	}

Hi Neil,

It's the previous patch ("nfsd: move name lookup out of
nfsd4_list_rec_dir()" that introduced this bug. Can you resend
that one?


-- 
Chuck Lever
