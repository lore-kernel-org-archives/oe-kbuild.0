Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1521860;
	Thu, 27 Oct 2022 07:59:43 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R5USRI014699;
	Thu, 27 Oct 2022 07:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=ZfXfeBQ0IaSDSvOdZVMC4zA3MAzjGQ9frit+iu9mjaM=;
 b=hdbEaLTgpVaenAhbfdR9EzeyD++UzyOer3HMyzdKNHJnLnZXtRnFk2m8urEboLvJLrcI
 uhDNdvUj9AFrwntNWCObuohMHLPJiwikk4QaAbjKx4aQzTwpgRLnzA4e8IF2c8Os5dbs
 g6NtsZM09oYVo2o7f0PcUPHx45sb49E7senV4QeW9NnJQHnDvLymwTtGWBVqrnNnsK4B
 IB29raSItAEw9JTRnfCVbF9BKmVCazfSiLSWZUnkxkY4Jin8Fef8+Y+CHqvoblHj9q6s
 88vZvkkRQn0qTwERsjCSF+DG6Zu8V3wLrYeqdW54ehKxIFJ3qx+813TG8z1lzI1ZQLJA xA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfays197t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 07:59:39 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29R6rHkU033326;
	Thu, 27 Oct 2022 07:59:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kfagmqhvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 07:59:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgWSlU3/PGWwJ3C6dXgOnp8DRFy8MdO6s2cWY4Hr2lqB5N+u24gVMS3AbPxBNpS792ew+XjlEng3MoWhXK+GTZmcYnElV8pQUoujkBaLj8kwuRuUPqdfgixqnB8dWvGOzKXaxbC24TPTdW5g8WW1wZGj2eIlrSR4PmynPIJ6K341eWbi/EsOlyQErCzxljhu8NEjWBp77guuhxHFFF3MR91Sckvpavdym8YP0a3O/PrREst5rDphvZHu0lgQJxOmdnJqQ1DxOfIJB1CaJpgktAUTT3IX8oWvAkamSY5mtqzn7xsgBS//qgthS/IQUQ1xoOj7mvCxt/QAjuinqEcfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfXfeBQ0IaSDSvOdZVMC4zA3MAzjGQ9frit+iu9mjaM=;
 b=K/XCYw/DOqzePDpo+NsERC4XHpTU6x7TAT9z4Qsynnk7DY8AikJOl0a3io657/WtxOWxr6P5lsIha2Q0gUKAliFzbJJ8ZNM2E/AFE5RZaROQKyGrjShlPs5bXcqirmnkhJMRPTrnv+c7BpVoNyHpMwL4rJgll/etF1rVzDnnRC8nPy3D85tsXWU+cmPzH7gpfGDHv+I1fG68zUdBOUFyXvIiI2ViKOjoF9sSC5vKrSn2uy1AaE72oVGL90PbrHuEBw3dhnprcw7nbt0aXbpXkmgDQrpeBNKpeR9OD4cZvz9C9F343aS2Rm6/RDj9zXS8N1S96iGWZFezYnGhd/cp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfXfeBQ0IaSDSvOdZVMC4zA3MAzjGQ9frit+iu9mjaM=;
 b=zuLd2A1MKDFsICjh9SznwAC/GxlDwpyOlfsSRQIaByMfrXCSZM5YvjHV/0eHVcwYvHdtI1uVV0sDGaDscl8uMBh/sI1Dgo+59Eve7C2n3JwGjCeJ0xCa3OfnFINSQUhGn5jHLEUNmFr4ECf+vhdPssduIYmJUCLqQBDsJp/bZDY=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by SJ0PR10MB5785.namprd10.prod.outlook.com
 (2603:10b6:a03:3d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 07:59:27 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::7dee:dce8:921f:d623]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::7dee:dce8:921f:d623%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 07:59:27 +0000
Date: Thu, 27 Oct 2022 10:59:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: oe-kbuild@lists.linux.dev, Nick Terrell <terrelln@fb.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2780/3509] lib/zstd/compress/huf_compress.c:460
 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need
 parens
Message-ID: <202210262313.LLXfFkhS-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: JNAP275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::21)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2358:EE_|SJ0PR10MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 086356ec-b01a-4e17-ea35-08dab7f12bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EGmj5XbmqeGAM2WX88DXTkP9Xa+SYtTpRqADLhT9al5mN1aZRx657iGFU+5wSyQqfHCYKvFKSI8mGtsNyJygQNRUKf1IxSFmaNYwmzb0gfP2siSsgVNFAqog5sPWnA72qdZ6rOp5I3+2VJeRY7YnnBjjEB8soOUkcjEZkEp5Zgv2rbWUPvMEqCxJC2FHQw8/GOwZXVU9FHzF7/7HcPerzRLeEWSiPXJDBDMgXO8Fju9lZzzOLKSqDbsKPuvjltkJFcwBg9UxxuL6LvnyEkSb5L8x33dK08FNNr0NVTUUQ2aoHs41iyTlDuZJbTsV1+fTKqw9iUzyD0NYnThT0yjgxVm405HH3jN2ENz/8p8C3GfCzz0UMUlOAWQq7kF/SxT2gpg7KQfXvqze938wGuHKrDebIlYHQdpTBzDUVBAA1vwH3JFCV3/csrjJaKhyBIUGeJjc5xd1OuauNz5P6WGGDAJVTrXFEu0zS46NphsAgFjo5yuF4dwKZkT3EV4UVsnab3ZQ0HYnylqUdOq364rGwSohGNizhZfyeP7V13Jo71zI1TWQ1oOdZz/NkSvmEkFIhJ+E7FG++w55K0GbjJS/jDpTNTgWxjcc2jVgkYmF4p9sT18G4OWpPpbSPBzS93DfQrFjELN3HS8k/yJACDPZVaMGD+Xws7+2ZgI6lAfZMl8AN92XSa6RfZRHbDbdYLGBwDu2hvmvYDhOKqLGv7EzbwTIdepkbRf+zh/JK9TfCeVRehWDc0qTGS0cCsQhGRMmQ87g0SNpw5R0YtgYRw7r8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(83380400001)(86362001)(8936002)(38100700002)(5660300002)(66946007)(66476007)(66556008)(44832011)(4326008)(6916009)(6486002)(6666004)(8676002)(6506007)(26005)(2906002)(41300700001)(186003)(966005)(316002)(9686003)(4001150100001)(6512007)(478600001)(36756003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J9tQA3cQxYtcyxKALZfGoxobpAKfqcTKDhiSgkXjj1sMhVJ2wm7EzNPnSKXv?=
 =?us-ascii?Q?6qfAEIAaAypxPJiYQbr2Z9+DKyueeaYsAYxZkv+rZBxptPscn/hEm3Xr/7T+?=
 =?us-ascii?Q?o9+phQx9mcPfSBCipeC5EckGHV/j9+FdqKHL7gM0EZQ2uxJ+B3B3qNk/SszY?=
 =?us-ascii?Q?IlpLdkigHf8vwNEBXB35tEsnU2mkUdmAKMkmPYHDIfkL6EvDVixN7CWBc/AS?=
 =?us-ascii?Q?truSPBqxM6NUKfuTlFgB/G7OnplJ4nPRnsDUTLXklp5WKwDEXiLy3jRXdDRc?=
 =?us-ascii?Q?jqMRAC4e14fKWP46y9IHKfSMR2Py2NrAKR1dYKHGyxUqs15bK3Jgv0T4xfVr?=
 =?us-ascii?Q?aIwcyf4ZNePibZQXhRW8jATDJfeLPXC6Wnx9usUcxjlbRh2ZXBcv4B2xWt7p?=
 =?us-ascii?Q?P/PHKJIMtGaEbtGFkXqn1VJSZUzw4eATthDVaRP1RcscBt0heTidsSnS0W4g?=
 =?us-ascii?Q?Vo19He6qN6UhHttK9dJERp7cCxEYIKqbL8We6OAHUlPc1yvAKiH+wtnHo1fT?=
 =?us-ascii?Q?pj9a0YUEyoV043JrAS0pARb161bOiofMwi0edhVTMr5hn3jVujJZfSfwspmd?=
 =?us-ascii?Q?X9V28MIwb+R+zdlZpWcw+O+RYgMcUHZS7T1ITHnsiFIUdi66SkRJIYS4cpMD?=
 =?us-ascii?Q?kBllCCVAFGJds9EEJJNX9UTtK214mnEW+adh9vja5tfZtFqno4ID/JdrzwKT?=
 =?us-ascii?Q?W+49Fth+sc2hIxjp2Rb20Y3cpxjhj3aAqncjbJ6Fh7cLdnX61o3FFFby/iP9?=
 =?us-ascii?Q?ZBqD+35pPc3604KUnq8zDYjgwPCT/xuE5TpEMIAfRUTgokp+Saxtbr5jv17I?=
 =?us-ascii?Q?vCJGiHhhaqsogiSPEnNWGYh43pJX31kvfBJddhfiC1vR6gc4/SR1WWu9/YXY?=
 =?us-ascii?Q?SPvhy5FVTZhw4qIqJ48U4ZLDb1omoax1WRLml6VHUw5vGlTpbo+cD0gwCr5x?=
 =?us-ascii?Q?alqN/dgQebP9oNO0GrlHpEeEHCIxao/922jXA2vxhzfQNLJL91sNIUzwaAvu?=
 =?us-ascii?Q?LA5MXo9IC8HAZhb5hcxc86/hd8Iuy3B73Vda13Rw4129mo4hM0mzhIL/R+ht?=
 =?us-ascii?Q?l7Q5Q4KkO1DpAEGxvE3UPNS/qzC1BcvglbvdZlvUdMT6TItyxasFNsoufmGd?=
 =?us-ascii?Q?KzVqmVpSAVFyAlkMiKgDigbODqbtVV4e7QCAoHXQgk814deN5SQjacydMFE1?=
 =?us-ascii?Q?/sxuMjzIeva4oO9dRtq1CDGO8eXtGOrwJigkRh3T4lkWOLyW5AqVUE5Avrjf?=
 =?us-ascii?Q?IPlwlW+aTO87Ks1DIPUtBRDgiyHcJXhPe8DLGBW0bC369jbBMXzENt4IIfjU?=
 =?us-ascii?Q?uXwZvC+htGYHlbImlCs5u9J9lGIic1xwVzUbX0QND9VcaW+zanncxE1F2qsg?=
 =?us-ascii?Q?9r4IRxh//KUN+CxIPNmNC4Mc6btQk56svyaCm1GDarGVp/jocXrlYg1AzOQ9?=
 =?us-ascii?Q?anz3bn4cbVWC3kMoMw6zXEAk42X0fKDrjAz/yd38TpW1Skykte5rqd5GyUYB?=
 =?us-ascii?Q?pyHW6JzY8F5rp9cT7Rl7mYLC2bFRfpwibt5kPt8atOhsIPsiRJa+m0mkHPzr?=
 =?us-ascii?Q?KZq/29WVqVah7nNM8KZH7s+wDtNLYGzn9aIA/AFGJ375x9WGY2cndZMJ03Yw?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086356ec-b01a-4e17-ea35-08dab7f12bb6
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:59:27.5849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOyY7RFsd4L6u4pjmjyTwA/Kio+d9fFB7fF07xf22IqKbiMMupJ0ZOWliA4oFNyrfck7KLflom9X3TyDNpawPcYa7f71dtdDMPVNeOGEaNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5785
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_03,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270044
X-Proofpoint-ORIG-GUID: HhdMHgh7k3rQa4bEh48dJ6wzvaeqW5RN
X-Proofpoint-GUID: HhdMHgh7k3rQa4bEh48dJ6wzvaeqW5RN
Message-ID: <20221027075910._PbWJp-5TkY_Ws8XnTmi6N1OnHCeRmO-lRyZj3XRJBk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   60eac8672b5b6061ec07499c0f1b79f6d94311ce
commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f [2780/3509] zstd: import usptream v1.5.2
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting

vim +/RANK_POSITION_LOG_BUCKETS_BEGIN +460 lib/zstd/compress/huf_compress.c

2aa14b1ab2c41a Nick Terrell 2022-10-17  457  static U32 HUF_getIndex(U32 const count) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  458      return (count < RANK_POSITION_DISTINCT_COUNT_CUTOFF)
2aa14b1ab2c41a Nick Terrell 2022-10-17  459          ? count
2aa14b1ab2c41a Nick Terrell 2022-10-17 @460          : BIT_highbit32(count) + RANK_POSITION_LOG_BUCKETS_BEGIN;

These sorts of bugs where we're missing a () around a macro are very
rare in the kernel so it's a real treat to find one.  :)  It's harmless
in this case because the math works out the same either way.

2aa14b1ab2c41a Nick Terrell 2022-10-17  461  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


