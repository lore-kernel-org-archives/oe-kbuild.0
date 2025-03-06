Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A818DB34;
	Thu,  6 Mar 2025 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741247991; cv=fail; b=WsGfrGViRzINTroonBG1sV0h8WOL3uhm82ljwYRId6Yi4c/q7SZBaSCQ53NF11XgOnye4ZYPR1csA9sX8NWDMGu0BDEOD1+jZz4fe6ngeaG33aqzH15FWfkgWfvu/hw+0SYrLUlIc5/oTNcfYqjojXoGXTUToAt7Bq6d8pbSjZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741247991; c=relaxed/simple;
	bh=E86qCxH+K8Y0ysC9PI+H04iBI0Lx4lU7TYQWjq6Sv1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hk2JS8z/TjwsZ3hNcwfGrcaLuYu/qXfUg6WpWIMqroy5s4cCXe898MClBXJpaPX+hfgrWCUMY1ZDeWpSimveWjrqAV5+wpHfWIhFzlSLfjkGWUKJBztB8NFLK0sp18yukDTXh7BkxkpgYqNlRPgENEDDYJXGJUs8VEDu4RBAFy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ld2i/Zw7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VoH8Ha9Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ld2i/Zw7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VoH8Ha9Q"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5261twhM007533;
	Thu, 6 Mar 2025 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=0far2uuG+URE14Ba60
	SGIQsMhqBXsjp8hH89CLJG4xw=; b=ld2i/Zw7K4pm4PhMTUJSQjUUX9sjOVjGJp
	+4MjDRQXGgSv/23yBXo04KzhTVqu+v8Z3WzsXfcHqNSacuQh/qVqU7SCYvoLMvlD
	tIr9uNWj4MKadaFHZaqmU3yHDNiqXNx/6brLHVZRA9tMILmMC+p6k1EQXF8s+IPE
	uvlqlnqnwRYQheLBE2zLk3M8shDi24Xx3FvXFXXexukDIaFmRJY7UFlWapAsUHDV
	jN0bwkIlRSd8H0DbtZi1FVRjTPqV+Tp+mIT2s0wLgXcrBV+WCDb1Me8nNUhw6bPt
	7kGajErV0qD9by8KToozYN7rHuCQbYAfQkPbJLiqLz4Q3bN/pECA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u9qhn8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Mar 2025 07:59:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5266H3K6039763;
	Thu, 6 Mar 2025 07:59:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpcf158-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Mar 2025 07:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzjE01Pe0OKXgbwvimYICe3+gatNBT4WmCsPrgcnZ070FHUhHZVIUpojbaW1RlLposSOBLwWI2IASiOl3XKh0RCetpErLdOLHQQqia3oY1IkqRFwlt6B5K6vo3s6wHVWPSEoBK8wuh8PSzJUk2mQ54y8oZhb2Qauqcq1mZhzEX8D03Ep6UNyI4QoR0R4NnAZSE+q2mU5xN8S0B2zCB6TlHE9GdsRSYciEH+yQyW7MJUSPgpBwcNNxRS0xxdhWKl2UiSFwPoKbJGkP38H9rCr+rXeRHBYurUzxOxFRIrS8EAtBZRczkItTuX/FYrawJyFRctdkd96jIMRM8SrXw8y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0far2uuG+URE14Ba60SGIQsMhqBXsjp8hH89CLJG4xw=;
 b=HfR0w0uMd2qCThdd58ZdYM8k7xYt1a/mQ54s07u+fvgIORoCHBF0I2JsJjxm2aWHmt4nI+Fz2cSZbB0oejpPQJnBpA7GgifWc02Oq1HNvJ6zQnw0SxWJrAJq8tV9d9U5xO99hiXoeWuyKYY5avtyXRgI/ZEji1Cfc8tx4iWd9QDAPy6k5jdvhjhmD5j1QDg/+KoOHchRq+gP3tNSDreznxUChanTTMmZB+PUaeQRNsAhqRYWEuLZuclwjf51gD2JD1SQQwTFJT1lteBcwtZ+WSusW1mjguxyswyA2ks50f2K/rQSUPs5do5NZplDjOgP3mtxcMwbA3kZFTH4iCC53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0far2uuG+URE14Ba60SGIQsMhqBXsjp8hH89CLJG4xw=;
 b=VoH8Ha9QmF+4Tx3AmG/MHlCe2dEO6C/n6lOOgm4K4vA4cNzJRp6n4X6E4tTuFCN+ADAhInEwcExbqQwPWtWMYNa2pGLdKcMkcqQ/hegw0ElmL5jUDeKdQX+h+8+nRhbYMW0UtI77S0gMWvC0EGxRteh/HvPgt6rqhbd4EPVpvac=
Received: from MN2PR10MB4112.namprd10.prod.outlook.com (2603:10b6:208:11e::33)
 by LV3PR10MB8154.namprd10.prod.outlook.com (2603:10b6:408:290::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 07:59:32 +0000
Received: from MN2PR10MB4112.namprd10.prod.outlook.com
 ([fe80::3256:3c8c:73a9:5b9c]) by MN2PR10MB4112.namprd10.prod.outlook.com
 ([fe80::3256:3c8c:73a9:5b9c%7]) with mapi id 15.20.8489.025; Thu, 6 Mar 2025
 07:59:32 +0000
Date: Thu, 6 Mar 2025 07:59:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7960/8790] mm/mremap.c:910 prep_move_vma()
 error: uninitialized symbol 'err'.
Message-ID: <2d3dd490-8daf-4729-ada0-8a190a79af15@lucifer.local>
References: <701a7c3d-345a-4ed4-84bc-f34c5164f9ea@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701a7c3d-345a-4ed4-84bc-f34c5164f9ea@stanley.mountain>
X-ClientProxiedBy: LO4P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::13) To MN2PR10MB4112.namprd10.prod.outlook.com
 (2603:10b6:208:11e::33)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4112:EE_|LV3PR10MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 588df865-0a6b-4e26-8425-08dd5c84d412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ra9bAG5qmYTVqwoHQ/xPvF1mJ/lnhuk8CJZEojFVLjXUthHxtNZTLOcjD6/L?=
 =?us-ascii?Q?EFs4jUhtCYdLjSPn2vcFAQbg2U/TeuxZ7bK55Kff1sI/AGb6ivi3DxA4anpe?=
 =?us-ascii?Q?MOz/AM/CxlCs7p/0d6UzVlHy8kCs8MGU2oRoDiBWC4nZD1q4Zwuoo6kmVOXU?=
 =?us-ascii?Q?OKoyENJMpZYQXgQesCKIlqXJQemmBB1jVe/h6YtEUAN5icmGXAutlXXYBQ04?=
 =?us-ascii?Q?Q/2vYu9frbZV3sUeDinY1/wZlgv50aONlCqWj7KsbqeuirEy+kfZ6VzMbeoU?=
 =?us-ascii?Q?EDbu7pWLBey4ZaGFakq39crTY4QrjN2xXvXDk2oGW3l01ZS7rJGWZ4UbYI7M?=
 =?us-ascii?Q?ZwUW+xaWACvARfiM3Q8xNt79TmK96At0yeh9xIkW9K5fBYkXXn3sQ1NmTPA5?=
 =?us-ascii?Q?WPGpx9/rwURAPqPld8C3a3llJWCKWwqQqfOtK2x5sxHXTdete1O8jteAn6VE?=
 =?us-ascii?Q?alzPTopgurmRkpZbd9W/6swD0UpK8jC4VHaZ674mS5NSKDYWaijY1G6cHLAx?=
 =?us-ascii?Q?aAikr52fURBpKvNhTNUxhmWYUxuKysTEeMYO5MXQ62h32pOlFLkPf1cOLf6a?=
 =?us-ascii?Q?Hqxq3x3dEJ5KGym17SIZaFcrZ11UiUr8ekMY2cVhDalMvaccggTzCz3P8o08?=
 =?us-ascii?Q?va2rs6j0E5OBIQVTAzYn/vxIQafP5ZncyAmUb7hyuJODJwoTsIJlqexv3wgb?=
 =?us-ascii?Q?Y2CO8V7GtTpx0dBS/h7UXJeb9yPZ1oUgLa+k7/kG3E81/iy1jb70cJm42Wtp?=
 =?us-ascii?Q?x7oDL89MA4Td24bvGI9OjHzcru9mBxeWTYbo/BUSxJovl3hCJb9mLkW32QqP?=
 =?us-ascii?Q?zv0t52zlAZHxp8gBTJw7n5hT9M4zNHeGk7mWfnsFjajrxuZCRV80Z27eN6vJ?=
 =?us-ascii?Q?qx0YiVKCSFob57k2eDDUMp6iNfr0hlcFCAJajwTbRHqdy62eSFuKJ5EAfiPJ?=
 =?us-ascii?Q?c9o3a+xcoWE4LCvWUjce8fAxn+5x0vpKoTKHckyToX4EoOG9c7UYBWc+37Va?=
 =?us-ascii?Q?/P0woPjnyGynNTXVMqx2NyBMd2szIppb7AXdayY27lNUP4gzrvzXyBclZIY+?=
 =?us-ascii?Q?pEbb/xqK6HvlHR0exM8TF58w8WzxXnzorfRFjcsHSWVYOJZWu+tn961bBK/b?=
 =?us-ascii?Q?MtTb4ObBJa1Hm7ReUSLIVrtFvGGUJYw+jBmhAaYxPHbe23M3ru8fX5zd9ueV?=
 =?us-ascii?Q?U/9Fb2yAGdo66H+nI+ilxDv40d5WfWKmPNMU3akayS2tVxv1zqWWj7qFs5sI?=
 =?us-ascii?Q?tcSwWLBiJriyNgj98izLglBcomH9gn3DgB0JFCIqgk/bwg87puPECz69FVsz?=
 =?us-ascii?Q?PRkUyQDhxwDfFocy7ugurX/U7sk8Zacp+AGPNB5hiBLWBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4112.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aYdrppoX6+W79p/sW6W5k77pTJB28seESvzaDUqAfEj3Ij1XKm1+t/MbYCvf?=
 =?us-ascii?Q?vux/X2B5tPEPwUmUkOywGweAcNTj2/OQhVc87uo5msUpJ+Q5CB08DS/MHEa3?=
 =?us-ascii?Q?HnujzRLxKh8VDS2ayczCLHcz11cGxYyQ/h3/U/RYIUdWj2fBJAv3IjvbmZFw?=
 =?us-ascii?Q?rNP1klvVa9d7IQfyq+E8tOof+L6rb/23YAYB8fXq6zlOnS/DhkU1T8zXoxJQ?=
 =?us-ascii?Q?ELIlZKXYooqhVDnsc3E7+mwFgf/A0yUTvTDYu/MQTk8Wazap0bzWhLTs+qcU?=
 =?us-ascii?Q?RYG1RWJPIOYMzdNdjgTXpMHwRk4QVTeZPqqrOwv5hVHCeneLQFVpGjpUGtWv?=
 =?us-ascii?Q?dQcr19ALFtafTMRDa+HV3DfrWBRT2iHI2WHZUdt7pzJRGKt7gp0GmRBETEGb?=
 =?us-ascii?Q?Pz7H2MLMUccDXGvlGOuHk+jqeKYN9cn0IOO5GewxDIToL2eO3Pdau4FRIbhg?=
 =?us-ascii?Q?SybSKBD2GHk6BO9FDdGuhhIbxTupLOToKrzQX4m0Mr9FgMfN/D/oj9JxLg3+?=
 =?us-ascii?Q?fdSKHosd7ZCVh1Pu9ZYQ/xqd1UXPUWTxPcK+t4zlNHCPo3BPX0SYy9qPRGxT?=
 =?us-ascii?Q?LQ0gGhQN7LxM/Vfy6z1kwemHmY7Zhk+ttmQG3CnHfTakxB8SbqbCHc+lKrdz?=
 =?us-ascii?Q?4nHaXA+vIR8hUWE71XacTZEuG/EKPucUR/PGj5M/xzeY2jvRBI/zJz7Ye7Y6?=
 =?us-ascii?Q?Zt19Mb9CJ7+GGmGO4jWOObTIIJPQF8xiXWsULJwzmw5R+GLN78sfgYx2LBcG?=
 =?us-ascii?Q?ELZ26/tB/ohAF/oTqAJR6nJEFLxVvt2278YsiuJHWoGyQX3g6Kec/+FGhLsM?=
 =?us-ascii?Q?OujdnG7ElP6pQXZwqqx8nyGdA0nlV+ke7mFTyz4fW6oNuYBULDtJeMcDs3bU?=
 =?us-ascii?Q?0ct/3tboFHx3Mqco3LhEwNoTi2SVj7Rl2NlirIyg9Iwzohx/TlJmdpCnePrk?=
 =?us-ascii?Q?F2gVY+Fuc93vP/qtV88i+BAPCuBDyCSY9GXgMYGqqKMGel/KW8Ur29+Z8yaR?=
 =?us-ascii?Q?6KpVlkNrAW3t+KxDInntsfBHV6J/9Yq6nj5UroBqBoUnWyZkLVLBYSUJukRw?=
 =?us-ascii?Q?wFZ4wjRKISBkEi/bhLkvlPA8tq+vxqJq05mV5mMgQDar0CTjD+2UMPCmJ8Ni?=
 =?us-ascii?Q?rTZyGjGKgNt0ZW0SfCdvpHEhVXZf/WaUz+xNap9jUmg0gIiq4zv5CNLOx0Hg?=
 =?us-ascii?Q?Zedcsv6RbF3Ud7/kKXXD4pTYuS+U5KAhROZXJA+6v+v6dQNmw5Crov19ZtaF?=
 =?us-ascii?Q?ZVDDt8bUPgWu1JMB9fNkXujROXodYuFREB92u21vrX3PFfV+lXr+mk2U7pTY?=
 =?us-ascii?Q?nCVdzvwhREceZPWnqTVjo7iXUB1xV9bLfrfQdWeg40qKTPw3Fm2deZWk93uY?=
 =?us-ascii?Q?Kag9kqasJLCj+lpJ7QIRBpSInvhbbVNX/MPQyyMks5Vi9kc5WuV8OD2nwnSL?=
 =?us-ascii?Q?1hZjXIncs8sZDuDfghSMwXRMLoYCYQUnasP4/6HQ6MAJtwHiqr/CMaSNlEzy?=
 =?us-ascii?Q?VJ+yXOt+l2bwQUf//rBFFaRCZHFRcxyzItCvJbUZ2xYNvcVirldPzTOq/bBX?=
 =?us-ascii?Q?o09lmBi01MDIwPLkavBFZXBD04xUM/jfC7msp58a5PPEfK0LtWrJ8Jbnmp/D?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OJgJnpwhL0eItiKWMZk701DXaDt2o6K8oC9jcdGlr2GHGfLORnY2/hfnpWhY6RJcKEtPUJIHE2wX+f2wo/xW8mmELlvTiTiSojnsZMPuVllYrFQ8vO6YaPTO1Ue6S3T6CWjPu/WhW+ZfASarrHQRZCUsZ8ritde6g6stb+zzUZX747XmXWgKsnE+G1fRCvAYMIVL+UVhv5fh78YeuaoHWxl2eHouVspRN8ogcEqtA2G+xeitMApcE2xjjuJaGcgerK+W+PLLKTF0HZfOFfabgKHfw7Z3qUonOxDdV13dIvxtQaCe/2KcyvI2epQjLKJ+iYoKoDzc35jvR1chDOYydcL70BBTkHOj+mvbI0Kaa04utlhaBcQgkAZAq/LA1fkTTkzjJUaApSPAtXdEnik8n9WfXr9DNRLu/csET4LsZN1KOH0nOcHSHtQEQY+ZL6ebis5LtA6iI/6UOrvkhJuzxe92gqL0OertjbhkYOxl8Ms9V/Es1Da+aqeRuua1BOG3I5sKMBRDQHrrWqMtqj8PU7qI/A+a1I6cdvjsk5Qrqv2V6oU1wSNUAE0XaRQOXPwVnPiBYcBm9OnxvksXUYpRSCaJTTbGccA2Snx++EqjkwA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588df865-0a6b-4e26-8425-08dd5c84d412
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4112.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 07:59:32.2480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSlEw7nGIlWYlFblAU8A+XN47Jnvwg7laXN9VYiSsmjjnZDMrpz5SdznG0BS1bo3A0fkyneORcVIg/6GTargqxzVxcAjedNtU3WpXM0BmaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8154
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503060059
X-Proofpoint-ORIG-GUID: V2cyaL3wGuzBDpMx0BqmgvP-pa4KnWic
X-Proofpoint-GUID: V2cyaL3wGuzBDpMx0BqmgvP-pa4KnWic

On Thu, Mar 06, 2025 at 09:27:54AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7ec162622e66a4ff886f8f28712ea1b13069e1aa
> commit: 3129f7896afb86e411c0b59a553fbb4053db4012 [7960/8790] mm/mremap: initial refactor of move_vma()
> config: i386-randconfig-141-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060404.ugZVU72k-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503060404.ugZVU72k-lkp@intel.com/
>
> smatch warnings:
> mm/mremap.c:910 prep_move_vma() error: uninitialized symbol 'err'.

Thanks, this has already been addressed and will land in -next soon.

>
> vim +/err +910 mm/mremap.c
>
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  892  static unsigned long prep_move_vma(struct vma_remap_struct *vrm,
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  893  				   unsigned long *vm_flags_ptr)
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  894  {
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  895  	unsigned long err;
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  896  	struct vm_area_struct *vma = vrm->vma;
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  897  	unsigned long old_addr = vrm->addr;
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  898  	unsigned long old_len = vrm->old_len;
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  899
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  900  	/*
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  901  	 * We'd prefer to avoid failure later on in do_munmap:
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  902  	 * which may split one vma into three before unmapping.
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  903  	 */
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  904  	if (current->mm->map_count >= sysctl_max_map_count - 3)
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  905  		return -ENOMEM;
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  906
> 73d5e06299195f Dmitry Safonov  2020-12-14  907  	if (vma->vm_ops && vma->vm_ops->may_split) {
> 73d5e06299195f Dmitry Safonov  2020-12-14  908  		if (vma->vm_start != old_addr)
> 73d5e06299195f Dmitry Safonov  2020-12-14  909  			err = vma->vm_ops->may_split(vma, old_addr);
>
> Uninitialized on else path.
>
> 73d5e06299195f Dmitry Safonov  2020-12-14 @910  		if (!err && vma->vm_end != old_addr + old_len)
> 73d5e06299195f Dmitry Safonov  2020-12-14  911  			err = vma->vm_ops->may_split(vma, old_addr + old_len);
> 73d5e06299195f Dmitry Safonov  2020-12-14  912  		if (err)
> 73d5e06299195f Dmitry Safonov  2020-12-14  913  			return err;
> 73d5e06299195f Dmitry Safonov  2020-12-14  914  	}
> 73d5e06299195f Dmitry Safonov  2020-12-14  915
> 1ff82995731667 Hugh Dickins    2009-09-21  916  	/*
> 1ff82995731667 Hugh Dickins    2009-09-21  917  	 * Advise KSM to break any KSM pages in the area to be moved:
> 1ff82995731667 Hugh Dickins    2009-09-21  918  	 * it would be confusing if they were to turn up at the new
> 1ff82995731667 Hugh Dickins    2009-09-21  919  	 * location, where they happen to coincide with different KSM
> 1ff82995731667 Hugh Dickins    2009-09-21  920  	 * pages recently unmapped.  But leave vma->vm_flags as it was,
> 1ff82995731667 Hugh Dickins    2009-09-21  921  	 * so KSM can come around to merge on vma and new_vma afterwards.
> 1ff82995731667 Hugh Dickins    2009-09-21  922  	 */
> 7103ad323b1ae3 Hugh Dickins    2009-09-21  923  	err = ksm_madvise(vma, old_addr, old_addr + old_len,
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  924  			  MADV_UNMERGEABLE, vm_flags_ptr);
> 7103ad323b1ae3 Hugh Dickins    2009-09-21  925  	if (err)
> 7103ad323b1ae3 Hugh Dickins    2009-09-21  926  		return err;
> 1ff82995731667 Hugh Dickins    2009-09-21  927
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  928  	return 0;
> ad8ee77ea9db1f Dmitry Safonov  2020-12-14  929  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
