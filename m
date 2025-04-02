Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207EA205AD7
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592810; cv=fail; b=hQcXtIMQ07TXGOrycDaV2krZhyHZpAIVEH3BcQHwlaie0Ll/G33EtpbSJqMHQoA2qvYxpiLjjcTDcWN7z8P9ab31mjmt2OetdNjv/Tg7PgUxWSzTrvPXiUIfe6ILY6T83s6f+b6/eiet60CIhtv0k/X9n2B9YWe7xXfj8D+a3/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592810; c=relaxed/simple;
	bh=DVbjJEHYGhyXACFtJm2U5oSFwwEPjO1Rpq+GJHxtAko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V+/xOjpmv+Bo+WAHtBdLYwy1JvOh7TsM6OZ/+5UPkwM0iPVO7HA6P4wmyYDcKlLUCDVy7Ldz07biSVcgRED6rIg6ZBW7YXWee+kdwL65MpAS4ikyJr6Q1by/kx3tEZVVOGpwQuHJnoJdVl1XQFI7kGVDjAVW0n9a/l/LmHSEAvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DB9jO5NN; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AJHBEBho reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DB9jO5NN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AJHBEBho"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326fvZe019363;
	Wed, 2 Apr 2025 11:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jqwb5yov+fgTmVUJXl1qD8nLrwRGJvz4PzGUkd9Vpr4=; b=
	DB9jO5NNiZ7XiHsaAAvP/W+9uFT8lrZFbRhLqHwbTZqqWz4DM9dQYCVhw6DIr3ZH
	rDBtIv+pMgVg736ZG4Htp02Hjni2yVUlqXT+iWRMHTYX7mXbr89/THb5nDgZb+jm
	pr1dLY2gBpUVh8fB1S2fXUfe1suJQNOkcN1VkEKbPa0WKKJiUCu3QZs2ZIw4vb5s
	0DSjG2czfuf5PLYU56+WOXf80AiwnaKbe1iLZZXcA6AP1NdbbbndzbBCFx2RNzd1
	a7aNqxLLl5R7gQW7DcnKuUDydu1w2atjZ3m+/zUJ62A/UqNLlrBu0yhOted7D5BE
	8zLO54F2b6/t2IReMmK2EA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2agbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:20:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532AuObV017878;
	Wed, 2 Apr 2025 11:20:03 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aahx10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nChnOYGTuxueA7wPAmeCsHoSN3yKbEXg/gTHWQmyZwerBluGV7NYHJtkvzqj7lqUpwhz1XMcw26CJH2AKPs74al7c2b2P8yq99iwd0TfxjQA5y8JP8eipO0p/qduOMeM/o3DDVgg6+7kO35ukTgehQsLAAzGioty2WVQLuaE9uGffq8QE6cs5EGsAZDdkXBl7rjtTgOnbXHexLH0j2c/w8bUVG4HnE45sIFVHKWD2WJeBZgp/6bRgd1lbXX0uKLvlQscZAHJ4xBg1nF0X6FagaYIRpjOyMyZA9Hj+Ud1nEkOZQw6+XxqHhWN4wr29L/22gyX9T0M7gd2wnh6Su8mzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TW5ommdXmozM2Hey6UfPVXlORtk/zFUuX6A1NOdLn4=;
 b=mQp+zxmiQCDshxEgmNNyUp90RkLCJJ3Yfh9nazI0/E/cbgSdZorVr6hKz4CxZtz5yoex10LCrjYvzo2E7uigtdrm8du+XuzkCJV2+O2+ldRE2A1OKMxsVnSYepJgL2hT4EHyy8OCHzOLQHmUY/DzkYXHX/SXWXtz6pojSFft+3hSQ13BETJGofveSCpoK4/UzoZzlbhIH/BuArKC3RyV3gL0RkbOOa9K/buo9J8wU0UaXzvpRi5CQZzo3GDTSHMYoTu5K7DpQBakNOT/C7isD14E4h+7ot9ADxfEqGpmIb01tC6VXWiIrZRarRr+6xLA6g6UHzLi76jpo4JZlltVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TW5ommdXmozM2Hey6UfPVXlORtk/zFUuX6A1NOdLn4=;
 b=AJHBEBhoTOaHR0d4KMTOhooCbhkqF8ple9jSdzXl5tYbqYRuZwnoLC6Bh00kjpZTUAB8pRJePOfXaqvaudP6sS3EmtRjVlROJ1wMDrLbLEfqQXZNQP1CSamo5glUfhq9BQswtrezKWRL+YBBTYKRpAC+aLcnUbN7hhM2cXD2txw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB5913.namprd10.prod.outlook.com (2603:10b6:930:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 11:20:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 11:20:00 +0000
Date: Wed, 2 Apr 2025 12:19:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local>
References: <202503270941.IFILyNCX-lkp@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202503270941.IFILyNCX-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0100.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 00665629-44c7-436a-1486-08dd71d84e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?46n5jpBUcXxduoVjD+FQ0U7vJMNXNc8SfPq/yrbYAcasNSON0I39nStQDB?=
 =?iso-8859-1?Q?ZZj8cOjo9CNbxdslGoxLZQzry8nbf1KDsIe55g7THXIoVh+gvbfXNBC9fr?=
 =?iso-8859-1?Q?3BSg4qHIza1QsYeNUyXM6UWiwG4qzOO+/y66bat2DBAXsWYdi7eRJfUATy?=
 =?iso-8859-1?Q?0XnEmaVztAFJc4jHxVjQ7V875HMFqFfhckc+hDhoccpDx88B9YgF1Q1igm?=
 =?iso-8859-1?Q?XE0cmcmgxHBvEw9TDTd38oWdrJhnOYj8yEev1If1FlX2GbbvwoDcihO1RX?=
 =?iso-8859-1?Q?76ezOjScNy1RNy0PlNeFkqBOPXIEiRv9O3FgZP3ib0ERT07ZF2TzO+EC7q?=
 =?iso-8859-1?Q?IuFGGOKfdcffoRLMCZ97t7H7Ckn/TIjzt9hje4iWVLLYTx7I1Uq2m/ks4u?=
 =?iso-8859-1?Q?utWOfu9/+2sgZ5v9EEl2hd4dEWe0CVxxoYtakIePuy5EjRQXuUmwixMPsp?=
 =?iso-8859-1?Q?QMgqjbME0mC+zZjYz0NXqqDBCHDFH4l5F4fR3HucqOGHIPYTpvDTMjJyMS?=
 =?iso-8859-1?Q?1M/ezKQLSfmOiUWWSI9EasJp0C/o7Be1frDqri3jDw8V+/7rukuyaBTjqf?=
 =?iso-8859-1?Q?XNshw9kfWAAAAMRmjZy4rF/ivF/GV0gSfDB5ojZZm1JgxQyb733jcO5jgN?=
 =?iso-8859-1?Q?1R1fNPe7490p6CEou7AlFRHLm1ufErMOr7WsTGl7QauZCpKADAfjzgNVRg?=
 =?iso-8859-1?Q?n8cSJ0ar0hr4D5hVvFU95D8GZti/+0QXzzPto85dqAmgxDj2Wil8tCCmVg?=
 =?iso-8859-1?Q?fYpbzDLLFZaQeXRXeQj9H2rc6Tz5lL8+xDA4kLOSQR6wp2RpwZ2zRalQKC?=
 =?iso-8859-1?Q?rESYmyptyDTUzmKOBMcNmUW2ew0crZzJ3uq3fiDesDh3gYP5Z0gEwQpsbx?=
 =?iso-8859-1?Q?SwXlhFPMmFnEg8gNSmJQCrWCs+v7cFl8DCnEdgIUnBFn8ooJBbUJ5gt5zH?=
 =?iso-8859-1?Q?K837QP/PCKESCFhd4DLCC8vOpQFogOKwjdnMLgGnrQTBWFuqv0otySgbbX?=
 =?iso-8859-1?Q?O22I/52e0VDPVmUgwtmFzdJFyIUFs3r5IMB0h0EjuXhFrEvsKBzSpj6qcf?=
 =?iso-8859-1?Q?Gh3BYbxgRYWU+neUTr4uK/rC99cTiQdh1X7wPpY4QJAuUGEUJzio5GPS71?=
 =?iso-8859-1?Q?JpORvz139IVYDTKqIgXDScOmRadL1Nw8uUAgmla2AVIANUjALG5Hd/BHSX?=
 =?iso-8859-1?Q?K8J89Dzvbz2XZ4hPbAHYMUv9kp8T5LZR3MSMxrFZ9adIphqhF1tYjMEwSR?=
 =?iso-8859-1?Q?g3qcB/KaHM7u2yICi7Mszc6wQInVzxfAJ8dHN3yzBmM0Kkls6q/n/gFMSP?=
 =?iso-8859-1?Q?lLuEYKIc2g/0ro/K5KPB95UC1ZVplns8sLembklqKF9tNovMDia/CQTF4H?=
 =?iso-8859-1?Q?Cr1cOZtZd1F1RQFec+XEQ11nsfSQ0mGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?PzZUnXHBF7XzFAxpjQpZTMsQx5W4GTsMNKs+eeapuSxprZLLSZMUO/mQZq?=
 =?iso-8859-1?Q?017BS7gJ36YgDscLvRYOCf8v/NFRNIR32E7NAcy6+XoXCJyzkx2U8H2gpy?=
 =?iso-8859-1?Q?Z4K5r6x92ZeeL0enVA1BLNiDI8xKrApuEv7LH5CHdG7wietc8s/mNrLes0?=
 =?iso-8859-1?Q?pykNM1LZa6ySv4B42DGQrjP/K2fDtzQaWojn6rgF6zCyOdQOuViSZvxeRl?=
 =?iso-8859-1?Q?8yJz3kIAvJKKGG6GfJyjJw/CFrKj0W1X44YdLcPGJoeKmopyW+9vu3Ig9X?=
 =?iso-8859-1?Q?CkN/XuIgq5FOYhG4v0U4Ewcc+idVf8x1SOo4AJfl54swHqpF34yBM2AY7L?=
 =?iso-8859-1?Q?kFiRjNb/bZU/vxXM5IzBnsYbPOY3UbwFyWD2agmnpHobB7mEpSiUtSUADQ?=
 =?iso-8859-1?Q?gfwKKDSDQNia1/pZk+G2pnYJ/cDtXIxF+M4QbT8QMsCdBJ1BjjVWpOXyrT?=
 =?iso-8859-1?Q?d5E5bTqnahsoG5QR5LQOEMN+ai88YyV1ZiAUtmNxUuw+92O+9KGc8HtgOf?=
 =?iso-8859-1?Q?0djvv47sxDIf4gCBclhSOJka5vfA6a1EXzBWlCdzUeGj/2GI0D8gVZTJsE?=
 =?iso-8859-1?Q?bfCsC7SwUQ0P1iRAxuS4A+qGqs1xURxhjZ69H3BqlD74TXevMtSEYZqF94?=
 =?iso-8859-1?Q?2h2bqLB6DQ49lbU80r9KPyeZDPJfBiENMHzZ8d7qNd0wTrHKugBc4sdrJD?=
 =?iso-8859-1?Q?2IIJgBuhjrYrn5d6ZgwjQOsoLcWu7P520W5JbUBeyU3odfWF7UMgxO2xDx?=
 =?iso-8859-1?Q?jShiVagMREWzwsDICaodIJih47HTc4xlIJ8OAMAqOkwz/6hSM2MIEYDXEG?=
 =?iso-8859-1?Q?g5ndauRu+KG7J/n2s/ffN6MT12monVC0T20gUFEayxpWrV354VZTaLY/pL?=
 =?iso-8859-1?Q?bY28talT2ADQnCZCeTfjMCOn6w19kHr/we/fsXrZnBXp0U1sn1XWBaUiA0?=
 =?iso-8859-1?Q?fR0UrU5IQVJ8I4VAsUPb5yUAOefZpXQca0HVAuU2EF9YLudkWCyBsLtWCp?=
 =?iso-8859-1?Q?On6/NRZoKbEHDv0fcdd4ChscoX1tB9n/uRz+H+gxZNnhRzkxcs4JXlpP8C?=
 =?iso-8859-1?Q?6De7Tz9A/6OsHPt16VKBX24ZhlRccUMf7oOFG4BHHCZ+oCroqcMPh1gXjC?=
 =?iso-8859-1?Q?ZEK5EWdECSoOOlFZ9D9nmjtgq7Df9WwvhbVU7Gu0AgpZbJZeGqgIyRji54?=
 =?iso-8859-1?Q?vawLnvWFpAiCx2+1gc5Gxfp+n2a3RQLWn7lTwgCaaBVTg6u1gRmjo236ct?=
 =?iso-8859-1?Q?yC2M+/25JizSpeUpDRyZ1Js+O4o99T6+BbWeYpTuB7OuusLphCfar6x8wQ?=
 =?iso-8859-1?Q?nRPMhaWPt1dch/cQHTdcaqY4dXNkWwytsWkVqSVxdHZkfVBS9wJbBtA/G4?=
 =?iso-8859-1?Q?UcDqNOjuMyOf2uldYVxX6x5EnhTwNtrizNNzi4D76R3zqpsi6OMcz6m9MY?=
 =?iso-8859-1?Q?csRRYIDlgNGITiaUlQWVFb/CwurxVd+7ccm+zik7KEH4yH/VT/mGVeOBQt?=
 =?iso-8859-1?Q?czGw9qt8tJxDPN2/9XINUr3y20z+3cKS1rIuyfk0B7n8G/Gg41+rZ51OMq?=
 =?iso-8859-1?Q?fpZ0OiiFBjmhQ4K9uwRY52cmXXLPi9cvDp8e5yXd3aXDhomH4+5TkdnuVT?=
 =?iso-8859-1?Q?yf8KW3nL9+38fi99XD6Y3TgugLbHO/3+gHMTKLQ2mjv0YwwUpApTmY0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+NZbMzKZGYgqRuuGRv/vShh2MbhRw4vi1aduvvSiR2eP7tqRFBmiepZlTsYl2+GtT8vpJElFW0mJ5DVZsaEzISOR8aGG+KBuipfAYhcKwNHfWfj3GzVbOr51qx1dYFCtboQC/WCDBFUN9/0TMmizV4eB60qpM0MYrAsu/rk3RMVc6gv56ah3x+t43UvwZg+3AK0/QEJVM3GQEfUK3LvDWViH6il02vvR1D8DdXQmLL8gic/G/VuWsQ6HWWnrOdqnKawOogdZFcrGLNzR483GtYcCq+NkkVLyIhecpr2RACpQgN/FQ8bwecFlRIo+UF7ool8+A5Vn7RbPXKLZseRNjNoS+1gp/aN/1/FV+Zx/ceP8N8XJSPClpPUbGrkVVVDQQ1t4ZtMG2qxQD4EbMtXRqW4HNxwykgQrf5UDD603NKSzas/hNYBn7AKe7ytdscLVKS7aOZ/g+DObRgRA417NYlgYn4pRhDsjgq1ub9sm3Xj5wSmgoxVNXbxgqrjei6+KUr7Dndq1zFM5KYHJcom3jr1gvsxgSRWsFhd5+QYIFu0eN6TIquMlyUBV9FS8BwrQx7kGVIMLKkUzgK8Hbn73iCij2IazuivRph8vxFfdLZM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00665629-44c7-436a-1486-08dd71d84e94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:20:00.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT8nHfBA/PiIW4RLihl6OR/nDPdM7G2u2OltZvPslEnKgAryEfJcLV/LkSpXpkAFTDn904Lcd6MS9UpqWAM2lfw/bWiywXOInxhjExsZMIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020071
X-Proofpoint-ORIG-GUID: HJ71KSevAPvDekFGXTk3bxn3kRX9MHDI
X-Proofpoint-GUID: HJ71KSevAPvDekFGXTk3bxn3kRX9MHDI

On Thu, Mar 27, 2025 at 09:59:02AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20250325191951.471185-1-david@redhat.com>
> References: <20250325191951.471185-1-david@redhat.com>
> TO: David Hildenbrand <david@redhat.com>
>
> Hi David,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
> base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
> patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> :::::: branch date: 31 hours ago
> :::::: commit date: 31 hours ago
> config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
>
> smatch warnings:
> mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.

I have a feeling this is because if ndef __HAVE_PFNMAP_TRACKING you just
don't touch pfn at all, but also I see in the new track_pfn_copy() there
are code paths where pfn doesn't get set, but you still pass the
uninitialised pfn to untrack_pfn_copy()...

I mean it could also be in the case of !(src_vma->vm_flags & VM_PAT) (but &
VM_PFNMAP), where we return 0 but still pass pfn to untrack_pfn_copy()...

This is all super icky, we probably want to actually have track_pfn_copy()
indicate whether we want to later untrack, not only if there's an error.

Will comment accordingly on patch, but I mean I don't like the idea of us
just initialising the pfn here, because... what to?... :)


>
> vim +/pfn +1428 mm/memory.c
>
> c56d1b62cce836 Peter Xu                      2022-05-12  1360
> c78f463649d60f Peter Xu                      2020-10-13  1361  int
> c78f463649d60f Peter Xu                      2020-10-13  1362  copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1363  {
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1364  	pgd_t *src_pgd, *dst_pgd;
> c78f463649d60f Peter Xu                      2020-10-13  1365  	unsigned long addr = src_vma->vm_start;
> c78f463649d60f Peter Xu                      2020-10-13  1366  	unsigned long end = src_vma->vm_end;
> c78f463649d60f Peter Xu                      2020-10-13  1367  	struct mm_struct *dst_mm = dst_vma->vm_mm;
> c78f463649d60f Peter Xu                      2020-10-13  1368  	struct mm_struct *src_mm = src_vma->vm_mm;
> ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1369  	struct mmu_notifier_range range;
> ebd5c0670e88d9 David Hildenbrand             2025-03-25  1370  	unsigned long next, pfn;
> 2ec74c3ef2d8c5 Sagi Grimberg                 2012-10-08  1371  	bool is_cow;
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1372  	int ret;
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1373
> c56d1b62cce836 Peter Xu                      2022-05-12  1374  	if (!vma_needs_copy(dst_vma, src_vma))
> d992895ba2b27c Nicholas Piggin               2005-08-28  1375  		return 0;
> d992895ba2b27c Nicholas Piggin               2005-08-28  1376
> c78f463649d60f Peter Xu                      2020-10-13  1377  	if (is_vm_hugetlb_page(src_vma))
> bc70fbf269fdff Peter Xu                      2022-05-12  1378  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1379
> c78f463649d60f Peter Xu                      2020-10-13  1380  	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> ebd5c0670e88d9 David Hildenbrand             2025-03-25  1381  		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
> 2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1382  		if (ret)
> 2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1383  			return ret;
> 2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1384  	}
> 2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1385
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1386  	/*
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1387  	 * We need to invalidate the secondary MMU mappings only when
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1388  	 * there could be a permission downgrade on the ptes of the
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1389  	 * parent mm. And a permission downgrade will only happen if
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1390  	 * is_cow_mapping() returns true.
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1391  	 */
> c78f463649d60f Peter Xu                      2020-10-13  1392  	is_cow = is_cow_mapping(src_vma->vm_flags);
> ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1393
> ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1394  	if (is_cow) {
> 7269f999934b28 Jérôme Glisse                 2019-05-13  1395  		mmu_notifier_range_init(&range, MMU_NOTIFY_PROTECTION_PAGE,
> 7d4a8be0c4b2b7 Alistair Popple               2023-01-10  1396  					0, src_mm, addr, end);
> ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1397  		mmu_notifier_invalidate_range_start(&range);
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1398  		/*
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1399  		 * Disabling preemption is not needed for the write side, as
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1400  		 * the read side doesn't spin, but goes to the mmap_lock.
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1401  		 *
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1402  		 * Use the raw variant of the seqcount_t write API to avoid
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1403  		 * lockdep complaining about preemptibility.
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1404  		 */
> e727bfd5e73a35 Suren Baghdasaryan            2023-08-04  1405  		vma_assert_write_locked(src_vma);
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1406  		raw_write_seqcount_begin(&src_mm->write_protect_seq);
> ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1407  	}
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1408
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1409  	ret = 0;
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1410  	dst_pgd = pgd_offset(dst_mm, addr);
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1411  	src_pgd = pgd_offset(src_mm, addr);
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1412  	do {
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1413  		next = pgd_addr_end(addr, end);
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1414  		if (pgd_none_or_clear_bad(src_pgd))
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1415  			continue;
> c78f463649d60f Peter Xu                      2020-10-13  1416  		if (unlikely(copy_p4d_range(dst_vma, src_vma, dst_pgd, src_pgd,
> c78f463649d60f Peter Xu                      2020-10-13  1417  					    addr, next))) {
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1418  			ret = -ENOMEM;
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1419  			break;
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1420  		}
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1421  	} while (dst_pgd++, src_pgd++, addr = next, addr != end);
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1422
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1423  	if (is_cow) {
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1424  		raw_write_seqcount_end(&src_mm->write_protect_seq);
> ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1425  		mmu_notifier_invalidate_range_end(&range);
> 57efa1fe595769 Jason Gunthorpe               2020-12-14  1426  	}
> ebd5c0670e88d9 David Hildenbrand             2025-03-25  1427  	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> ebd5c0670e88d9 David Hildenbrand             2025-03-25 @1428  		untrack_pfn_copy(dst_vma, pfn);
> cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1429  	return ret;
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1430  }
> ^1da177e4c3f41 Linus Torvalds                2005-04-16  1431
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
