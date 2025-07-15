Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1129428D836;
	Tue, 15 Jul 2025 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752551595; cv=fail; b=X2JGta8ToCxBCkaGWYnEwLRytB3WkQeDhb5BVLL3hg8G4SXzCzo5+WOpUPeg/ToD0Y769omtT4kgu5yYeJ7X4AbRPXf28RqQvoqcSg7f7h1xrju4NbsBQtj8msxU1L5OO8goQq3vUsqzp7lxhQv0adk3Qd80IlqnbHAM0WIgrDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752551595; c=relaxed/simple;
	bh=o0rp+rCRvYF2M8lxGkxlnVAnC/R0v1lnaw6ShfkPxaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KHFyFFGnpOect6R83tZLVcKTtmzzEaCp4GY7dMMqqFDdKr+gunv8Yg5Gf5oSdDGpHwrCD0feWeZmyxwpt+qIKJ1ZMkG7h9uo/9WdkMaqnvbnf7O7+wSgySCeHLjpeqbB0dsxRpulAnsT+VjrdGESq3DXta3GeU2OnJVzylgOP+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qy+AgK3Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d/XTrW1Y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qy+AgK3Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d/XTrW1Y"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1YoqY027909;
	Tue, 15 Jul 2025 03:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=zo/HGqU27/zwcKFcQr
	UBDOnhTm39f74OJdbVVJ2I4NA=; b=Qy+AgK3ZuGKeasmcnpJ4B7DhFpH09TICip
	22U8X5XeGtan+pSEN0ueJZvYmXddTg8Mu4YxEQe4keQ4yQpZjrUWoNWVe0fipbcY
	NI6xbt8RRnogbadF8ltzTRnWACwNxz/zh03uog7jR3QlyYxL6wRkdQf4KTIJ5GNU
	IQzEGCXCvpIeC93NEk+k37UPBRZyg+HPyLkN9SYK0qusvUUhoTwRMH7ntiXRNlU7
	AaAKRa9stWSI7XFEPgNKiBndwzhM4kFHJaPDxOWm26XKCZGQFS+6kOcLbrFo6inn
	AJfuiFfkrUwY9RNzXmWw9n8KveJ5FZjiVIRP8//NO8FdwlM0g8nA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhjf656v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Jul 2025 03:53:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F0XK94011593;
	Tue, 15 Jul 2025 03:53:04 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010013.outbound.protection.outlook.com [40.93.198.13])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59cxtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Jul 2025 03:53:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecSR6TFX30bsP68pOBjY2yqD6lcdBMS0TOQVZGtCRXgL8NXzJvqb518D2IuWh+pWjhMJ1TgrLfP/BXqCCA/zXdHFHVxnSY6+tELg1rtXo4NMi598JeSa4nGlUJQLJTeQV0pI7r9iVMkJaVxRv0Alsrz8P6kZNUYPhb2Ol7+Qy7XYeenhnZ3gMcH1sEBqvHw2mIVsqQLCh7VrZuzH/TROaMNfn8FbyPTa7yZfwvO/GcOaeGqg4n1OUfSqlaDfD9e/zHBYDy4p64c/ucp2D+8eIZvt0OatT3giMxFikhwj/S5FvxBTT+d1do8jWe64S5BhP6zfXsfpm2Ylka956qvDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo/HGqU27/zwcKFcQrUBDOnhTm39f74OJdbVVJ2I4NA=;
 b=kSgK3UmQgooQ2jSBmdy0APQ4ptMWA+dKbaJyJiPx3SUnQEmM/CfnmX2ur+iIZTVW+WPt6CNEuCGjj1aiwz88VM064kOwsAn2V2IdWeb4CFuN+wWSwkW3obmft1Vn4B/iMaM3+X4jAYW7+fRGIvjQ2roeQFmX5HLoPwyPs1E89pemep2q3ijO5p5igHDXojq1vrfg9pmr2bYbdCcbvJFfYYptHaMoCAzhTA2wWUgW3kMhyMEr6VeR0ena0aTm1R+kWFw78Hmtjr8puKInM7v5HtGlMaqFxs52AWzRY5w3Wio/Naq0Lb9lUqDQyDHbiErtziyc55JUSSmJGpdlqPTO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zo/HGqU27/zwcKFcQrUBDOnhTm39f74OJdbVVJ2I4NA=;
 b=d/XTrW1YUTAr8uAUUn6JAo+ZqA2wQP4P/tmeB4McPzbwc93vdrDmQczotSJLFyFTv8u9Ws0UpJXkUIpSWjIsoyeTzTSAegzpiRuDKVNUJTEt9vEBlPoeBeykYYIcwverBMRHIwHKjwQmM8ur2AZsNm+QYeWoRvyoC9URLt5xios=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4790.namprd10.prod.outlook.com (2603:10b6:510:3f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 03:53:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 03:53:01 +0000
Date: Tue, 15 Jul 2025 04:52:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 203/214] mm/mremap.c:1829 remap_move() error:
 uninitialized symbol 'last_end'.
Message-ID: <404e240c-cba4-4d55-bcb1-dd49eab09bbb@lucifer.local>
References: <9c8287d3-59e9-48c7-8504-bf51eb3d5a50@suswa.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c8287d3-59e9-48c7-8504-bf51eb3d5a50@suswa.mountain>
X-ClientProxiedBy: LO4P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bfb1bb-96b1-4e02-8dfb-08ddc3531840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g3XyBWOmPxoQoUJjtjs2Ug4uGt7NGb922mEwQWfbEGDtZLX9R7a6mONnYdca?=
 =?us-ascii?Q?SP4I0PXU5bbJj/aSTEiw26Z/3VfUyEcBA8knQXNaVveuVlYLab/I8QCdZVeB?=
 =?us-ascii?Q?HdgsWRyIQ40pmVD2l/D6rjWn4WtfPQ+7Ga7DkvvED16Xhnv0F4rwDAWbTrFU?=
 =?us-ascii?Q?eck+hgxySQ68LFk2E/i1vt3RnCsOkAY/qmJIyDBxbOweFN7sBjxd9vm0xhYM?=
 =?us-ascii?Q?F8d/aa8UXwcV0z0ovPCSM9Qmhr4dfxdNV3xdUvWtuwN1w3mXcVTB44oa7Bhv?=
 =?us-ascii?Q?MQHQwa1xJUprP/B8wTnJtZGNOYmIT/HneSLy285nSKHFZumCvgJqfjvaoAH4?=
 =?us-ascii?Q?QF+izugkXFHdxY/4PpfDXk9AFOHRrg08uBVkJXFW6zf1HAQ5NjS60JZXyaUb?=
 =?us-ascii?Q?CoigRxp+5Ngg3/mTwHcN8GZGJONvnr0CmmSYFy/qTMUbKy+ptzQr1J73hgeN?=
 =?us-ascii?Q?KP7FTnpJ6Jw8vy6JOYpo5FbkPG+s4VSCC7c/KEP3MiwCBXg/W+VUsumvYXKl?=
 =?us-ascii?Q?jCrhjXPIW75N0naumXH42FlW/xHqLDE9S6wCtYoJWlUr7TUEo55L/3AJcuMW?=
 =?us-ascii?Q?H0+UC0c4dN5CNP25vl/SdX5556JGptWXK2RywPvZPIqkjEnvFNu7MKUTx+Nv?=
 =?us-ascii?Q?P5dAQBt6DRvF1uCo1T8mSC4tEiTjwR9owUpW//edMe1izDkSkuZmtXe+E3Rt?=
 =?us-ascii?Q?K0s5KV223LXctOrffYMFnTBWZ/tNrNJHIhOf8i0m4Uc6bHSAtbOMSD0ZlHt8?=
 =?us-ascii?Q?KdeaV/nYMntyzJ4r0A7JkqF4C2UnDLsfgWObY9NOyOHOLwdTcl5Ng/q0FfjJ?=
 =?us-ascii?Q?8HLd/kMLONwLSjpQ6azVFzX1FXTDPprq9xDw2K0cyoEk/izVrXiiJWUdyWTO?=
 =?us-ascii?Q?9tFW/w8B5Uiu5g9VdBM6drxlaDuUFbaMSpfujNce9wxIa0HP9cTtiJ5GjN0F?=
 =?us-ascii?Q?e6HY+GU+j4h5hRb42epyxJwTirrGcmAGJ/u+cCeCQx+dnlV99rALOWzOPU8o?=
 =?us-ascii?Q?XZKpTlcLwk0IKHuxnnLLdTJQrwYBgfTcwiKZmw0hqDtKVrQw1R1KW9g9kk9u?=
 =?us-ascii?Q?0JhSRT0+AimoYYbY0LPsjQwQCgPcMMwDe1hOgK0wIB5tqXLrKvDpiL5tqUL8?=
 =?us-ascii?Q?/TuaEANhrQHh6M5cjqYQmVQSrqjRu9cNDlEZT9RLxNQOXDh2Pmmnmb/7P32X?=
 =?us-ascii?Q?8xxpA7iO2Cd4yhFMHh4nBm7PDNdH+mn10GcFTzmuR6NTdO4v6o0jyN9/qABg?=
 =?us-ascii?Q?L3+y8OwyNzumv2Vf8YC5zB5xdeB5Af/4TfqzvfbRCEOupwBUNazS9zzPLQ23?=
 =?us-ascii?Q?6qqDFrHrDGN1TOOVEv4acm3WrU03T+oPcig5HaI5Ebzj5cQhwFDjv58droAc?=
 =?us-ascii?Q?sn/RP4oYTKLEzmdR47naUht+oMT+/TGxREwIAqjNcBnPMIRYAtpNb48O17rQ?=
 =?us-ascii?Q?+aaeRdBloEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?POxYnjgL5REpKyTndFNtZSWskH5UifjciTo5piXkXeM7Klww3Hjyv0w9GVJK?=
 =?us-ascii?Q?DWglKMEHxNAbyBKLDdUVrIoARoG4fnjxGMIUgdmgYm1Z0Qo+7lP2Rv32wKkj?=
 =?us-ascii?Q?8DAu9s3CFQcMWflYuA/lc+7foUA+1mXUeD/BG5y+JAeGeKSaWGHJcDgMFc3o?=
 =?us-ascii?Q?fcdTJadewke//QFpR6YxBX7AcAf3FtmWfa3zBvt7pedvy2WfC1AuEB0tW+UM?=
 =?us-ascii?Q?1hIah2+5uyzHai3OohnuiFLpFTdSSqQlHN6mj75mowpZcqtV1ZxBz4Q+mWzn?=
 =?us-ascii?Q?iQZA3SDI4BAZi87n/My6WqYRSk0mpfkOKiRkORkIx9DUyQSIuhzlvIocp285?=
 =?us-ascii?Q?7VmETQmHNewHrDJ4kLPhgLzE6IoQHNYrQOcvIKN/yamhMjDjAtz1MPIyhimJ?=
 =?us-ascii?Q?udIFmRepAkH/FAUxIj75p7HIXRtDtNxUYfPaywy1dUjlfozhECZauM9UunT8?=
 =?us-ascii?Q?bIl7xv4Sl9X/B48IgiOdZ0Bsb/ks0qbtiY0FPJYjijmRGCqg2Z19DuyJomlA?=
 =?us-ascii?Q?USPWaWrYQYUHkgDkkHcXpZL097ozcQ8F9k8EKkAho9KTzcUR9p2jT4R2M2WU?=
 =?us-ascii?Q?euEiuYtKBMK2UWb+7HfTZCj+GpgqePlo30rCQeCElqr+5eGG/RcoWUY/S2iL?=
 =?us-ascii?Q?wFplA+IrOofY1guVvJIPDptINagiq+wMqB/Wjr3tELyS45jaBCjT9/D+sT/J?=
 =?us-ascii?Q?RkLNnYn6H0VNzDYSXELsDPwSY353QTbwrSWCXWQuPUU3VsoDZ2d7hzWpamO8?=
 =?us-ascii?Q?94wQnIK52ptsBVnzm1Df3pc1xvp+iYBN1uULo77YJS2WR464LmfYeoAumwF3?=
 =?us-ascii?Q?KodeqEkJynlfcEthsezKsPviv38F9KkswYMVobwKwtBUgfXgJ6Frtukqfgfh?=
 =?us-ascii?Q?9JoU4CnH99WHz9sAN3WkUaL2e6uRZ8ZBBt6oAIkJtnzzZccWyXnCr4+JpxXn?=
 =?us-ascii?Q?qx1gq+nMgOS0g7+1gVmK+/vMJwu3CsGixOPjlb9t79lAw1zM0Oi0KuaVATaO?=
 =?us-ascii?Q?5oPCPpO6yPqN8S84bAOyKr2I+wtQOzdGuiXCi62Lv+H+7ZCgOr6f5vgXXjYw?=
 =?us-ascii?Q?g07DK5sukfKDWRepJd2aIniSqwFOGjJNSD+2do0rupwAlhpYnSIA/bjZWVit?=
 =?us-ascii?Q?H39gDT6izLExiz49L4BO7ob+UXXsziDRKFnepq0JQqQJlJOmcFpMEnDuMJji?=
 =?us-ascii?Q?YMf4fg3V9ObbeTmDmeu1lMUu1xc8qCSXzAkfByvaQzN2g3piJULzIjUtX536?=
 =?us-ascii?Q?6qrHjCvnxwvc5aCcYRc76+7AwcQnkJgYngs/BWfNsvnacUQBgBqt+xriNPGm?=
 =?us-ascii?Q?GwHyTnXOHuDieMcEJO66wDNlEaxQ54WGKFI0FC8wV6y0yne9YqUcf9OVgcL6?=
 =?us-ascii?Q?9do2A0pDCCKOmQq9XCs4HeHrL6hb+gwKCIawA967X+fVMx5rNTCXDnCnYbmT?=
 =?us-ascii?Q?UflOBkE5FXLIeaWvSj3gtH87egEKGYO52hcPb6YseZ9iMs0i/iJHrNISOy3E?=
 =?us-ascii?Q?ahgQgRoZ/z5mYTnAwrs5a5UU6mY7tAmnEF7AmuD0XeMuxf1uMCI5/6kjaU9+?=
 =?us-ascii?Q?8dJ3UPpq9X0B4yPGmyzKu5WlLXq1cRkkjnlfvknAdQYn1nUdKjWROPRirh0U?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QV2vMeMta9FmA0pbUpeOy14BYvIvZcjhJezjis7E55giOfxqFgBQhtA9rFE8g1ARqBHRks9Ln3UzdbTaOIAlg+CshNykSMH+CBfd8Xpc7CL4bmDBqRDBkrwqa4z0Ybvfh89ymgiFNt8V3+i77G3f49wmcmmjt+F473cVUwgOqaREFGWtCh4vVi0KNzZ70Q77jCxbyidpdd8ZrAa4+dRBxXQt7SbBEL5FcjJPEb5v1dtZyZnUsPGVRMAK69t64/abNFB7AnT+L1oi5ntlQ9ZwRUYF1rP0+kirQiYYqQoKPilUEtM6WZQmZNIu+qIQ9iN8bWOGQ/bqjAvw3ArRF11VFhA0vk/tLiJk/WFLkPI06GlmPH0qseKHtE7ppoLRtLWH0H57evZdM9t2ad0hxrLzRbMzLtg+/eb1Xe95mGA6ynNkiC3TsMZ1aRrg5supYemZTu1JjxW9fF2IPpEkXhKmJc73BXWVRm63tkSczo6vHlcuqDODiXZm7Q4HHvtv3bDMCQhTpaVJEdpnO14EcV9c2QuwKpV/IYDRCt1f4/d6sOam54/6kDob6uhfBdOC4zRQiNNsaNtv0gqUWiuSPqLwms/zM11ehi4G8XaUI7tAQE4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bfb1bb-96b1-4e02-8dfb-08ddc3531840
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 03:53:01.4078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z60R2WngedtzkAOoFlbuZcr3kaRlTrmZJxXeFE/Et0MJb3ptSyisL0dBUy6djCJfRzogeWRQAw5CpL1jrgOpnigL5EE5Qh4AqWxYrSgwUzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4790
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150033
X-Proofpoint-GUID: wIahrZxbsc288XxXv0szQ4Wt8wqbn2Oj
X-Authority-Analysis: v=2.4 cv=O6g5vA9W c=1 sm=1 tr=0 ts=6875d0a0 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=Xa9X1SJDcmSLrZbSplUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: wIahrZxbsc288XxXv0szQ4Wt8wqbn2Oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAzMyBTYWx0ZWRfX0Uqcim63BAke YlMl5kkPGzrSPh07yUNtWuAVm+0Ubc3ZwOJGJekH1Bi+ufVg/M5KBGxYbjcb4WGk12fUJ90nUbO WIATDrZdjcKYIFfxEw7QElVYO3+CGIiG0KilyKfXwfdku9kNByl4cTCYOXqvtLputdDj66Ed+e6
 1pdwrgNpFQLe60UD0ZrHwra4af/0ltogoO3Aub0prH7rbI8Z8lJGFxqJDNX5zIkxFLlGtsCOHpF WVAYK+E4FOqWG6zu4ayAzi+9MOy/rX8qhg8bfWE1hW8RvHSJDts67NnICw5aS+s0mZO5I5NTxhk kWGFyrbiGXKwXYgTzlQsU/lXAEKY0JWsc305KcFHYxM5uWWgUUs0HRj1g4pIacjue3lwsxWj1IH
 fZfJbvoDlmGvQhOAQelko6bfgscH4OvikhwcuQfJmAo59WWTVtO48gUySvRQNoAwFaq3kJUx

On Mon, Jul 14, 2025 at 10:35:12PM +0300, Dan Carpenter wrote:
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1785  static unsigned long remap_move(struct vma_remap_struct *vrm)
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1786  {
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1787  	struct vm_area_struct *vma;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1788  	unsigned long start = vrm->addr;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1789  	unsigned long end = vrm->addr + vrm->old_len;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1790  	unsigned long new_addr = vrm->new_addr;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1791  	unsigned long prev_addr = start;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1792  	VMA_ITERATOR(vmi, current->mm, start);
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1793  	unsigned long res = -EFAULT;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1794  	unsigned long last_end;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1795
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1796  	/*
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1797  	 * When moving VMAs we allow for batched moves across multiple VMAs,
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1798  	 * with all VMAs in the input range [addr, addr + old_len) being moved
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1799  	 * (and split as necessary).
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1800  	 */
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1801  	for_each_vma_range(vmi, vma, end) {
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1802  		/* Account for start, end not aligned with VMA start, end. */
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1803  		unsigned long addr = max(vma->vm_start, start);
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1804  		unsigned long len = min(end, vma->vm_end) - addr;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1805  		unsigned long offset, res_vma;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1806
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1807  		/* Merged with self, move on. */
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1808  		if (vrm->multi_vma && prev_addr == addr)
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1809  			continue;
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1810
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1811  		/*
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1812  		 * To sensibly move multiple VMAs, accounting for the fact that
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1813  		 * get_unmapped_area() may align even MAP_FIXED moves, we simply
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1814  		 * attempt to move such that the gaps between source VMAs remain
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1815  		 * consistent in destination VMAs, e.g.:
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1816  		 *
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1817  		 *           X        Y                       X        Y
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1818  		 *         <--->     <->                    <--->     <->
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1819  		 * |-------|   |-----| |-----|      |-------|   |-----| |-----|
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1820  		 * |   A   |   |  B  | |  C  | ---> |   A'  |   |  B' | |  C' |
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1821  		 * |-------|   |-----| |-----|      |-------|   |-----| |-----|
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1822  		 *                               new_addr
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1823  		 *
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1824  		 * Now, new_addr may be altered even with MREMAP_FIXED set, due
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1825  		 * to e.g. alignment changes from get_unmapped_area().
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1826  		 *
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1827  		 * So we map B' at A'->vm_end + X, and C' at B'->vm_end + Y.
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1828  		 */
> f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10 @1829  		offset = vrm->multi_vma ? vma->vm_start - last_end : 0;
>                                                                                                           ^^^^^^^^
> The "last_end" variable is set on the next line.  I don't know the
> starting value of vrm->multi_vma so it's possible that this is a false
> positive but it seems like a legit issue at first glance.

It's a false positive.

vrm->multi_vma starts off false, and is only set to true at a point last_end is
assigned to.

The new version of this series which presumably hasn't wound its way to -next
yet uses a local variable instead of vrm->multi_vma which makes this clearer.
