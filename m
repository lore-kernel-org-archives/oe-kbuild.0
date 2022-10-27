Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF7F7B;
	Thu, 27 Oct 2022 13:44:09 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RCp8Iq024075;
	Thu, 27 Oct 2022 13:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2022-7-12; bh=hQiY38r2dnQjdPm05Zo47JlsnD5eb+iKhB1VWMf90oM=;
 b=gl8+3uHTIeLljAm+NHi1ktixKe9bHTtoitMAWS4N1+AXBFgfef2dTWGKNx+gNmrrDaHD
 Rofwf/VGDoiILM36zeNrhomDNZ7fxPijXWGcw9fxkMoS18VC9grLNKTTn6gbAgBju+wu
 WjMRPan1ekqn/oVZEW+C9+GYK5BucvF6pbs/h72MLl3HvOh3OQ8Y13bx8oPsxqXjfmPF
 8XAN2z2+OfU0AA6O4wZAmELN9SdhHIGQyT6DIUCrRTRnPHUBZ3iBAjAbdS1d2eOtQJB1
 Izxn+uCuWbC3qhewDvsOtg8D3Xbf22CgS7o7CSJRHbZOEkeUCNPzthPPIe8/Y0EYtZse Mw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfays25w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 13:43:54 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29RAZY8k009475;
	Thu, 27 Oct 2022 13:43:53 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kfageytws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 13:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFAabKX2U4MNr84eNM/G0m2WQK6xFJSRd3//sgWqPnhtboRdpUPMv81VMYlhzfztEnlBUia4tu9lSDfeB2x3lja0K6O4AeeeLPrDoHOrIeUaiCdCmwfDYmcpRF7njrxqBanoyyvQdDi7tAbVl5OIHrFbcDZYcTCwa7JNMAi7H2BOSrQihPyEzB2CHknxNieELeDYy0CnAS2v8RC1ZLsXHJEZdOpamMjCkAVTWdog48IVtQR20aDvAj92nmc/rJZsMAo4EoZlZr9M+XTWbnt6T5oHlIb0szA+VnZxwT0pDQw5cwTD2HCgLw/r2KgNLsIsyZBYHHhyO+Ohg52Inr7Ppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQiY38r2dnQjdPm05Zo47JlsnD5eb+iKhB1VWMf90oM=;
 b=oS7gfIAMWQYQCKFb6bmIE6nWCunP2iH2Wq30LkwAt4c3BS3JFCKiGBgni1YhCPxKEmbsMhA7RyKE2FrSNRFH+17HWm23KrGrU4godzmO8Qp/eOhZmUgrXOBmJtOhgGoNqPiGRPDiEc9ATDAr9djHw5ADclARusE2xEIEFdwfPsUrHs87ETtsgNf5pLlkutZBAR+DrMYhtxkZg607EHUpPbUawOAM/8BdQLvxiWuksvTkEOKnThqFc5JW/y4OgGk3hZGFxBuHrjAcO/PFdYYzhUGcplUrpTEglzS7ecoJXwBtx9YDKNyypiDH492tWeRiKURVcuMrMX3w6B34a1H8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQiY38r2dnQjdPm05Zo47JlsnD5eb+iKhB1VWMf90oM=;
 b=nNNmnyHBOSr+3/eInCFslrYUBlI0IunE31avatQsHDjsAgFE4cUiwjYrADF001uU7F5xy6s2atzLdAx1CjdO3La+tSvLeoI8nHmkDhvMx+TvTsB9j2OKuclAWKgKf3lJT4jYtB7zb2BuD0oz/t2NhShSO4Kg1R8e84Sh8OvZQzg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB5036.namprd10.prod.outlook.com
 (2603:10b6:610:dd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 13:43:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3809:e335:4589:331e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3809:e335:4589:331e%7]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 13:43:50 +0000
Date: Thu, 27 Oct 2022 16:43:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: oe-kbuild@lists.linux.dev, Yu Liao <liaoyu15@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] rtc: fix race condition in rtc_set_time()
Message-ID: <202210272124.80CQQRZ8-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026033348.1660732-3-liaoyu15@huawei.com>
X-ClientProxiedBy: JNXP275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH0PR10MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbc7f91-6656-4127-5c50-08dab8214714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MCQHzYoTwEIPPqp6OWjgvyluze43zYXqnVqP8ZWCSC92Cu5MsSOAazHRIMzo/S9r8ba+mwUPhrxFjkBPUvhqsG8kMklN0ANviGugET3qAa3sayGYV2irZATx8NISFSh0A7pajW6dPy7snzlC6iGbY3tWCI2WbDGY3jaKduPECUp2LyAeL8eI5t9q8fhfGSrIl8DeWLDNX9wSZmnob3YGKRMtqzzfjjW2TESfgbphJfAx8HKM8JrgSqQMNa1l34f1/j9wGf8rCoWcqUmP9SA3lEkcZZhhBTsc0m4GzviQ6jyri7Ow5MuDMocXxm6fE7GayzkJOwBdutBQC8LnadM8APAYusCW0b4ScK8X7BmmYfImfOt/ZGnuh0uf0CKe9zaA8UBHfEOxNjXM+bJwvivu6pm6p9MQ5X9PZfKwbCrmdH2rjS5MOm1PsvZWolNKb5fetGs+ajCeK2TVSJxMC6KKAQd4MmxOkSk+PILhT32EruuvdcImcVAeP/n4IpItpFxrMbvsf+h+KDhgLfgTsSr16p4O7fkjAITZN8Tjjz8eDR8vvQ1WikuJOurJJ1eAZhiEaonVUw6SdCUTmDlAuO5K3FRRDuNpPkMqEBUlQOMEObMPx9rzv5gCd56z1CWU3UYmxOuUyCi+h/o5VXKFGOFMpHTScmwfC+LN/gUxzW+0Lx+RRrUgUpPPqXkOVHWmEBnGXyV/AuIpqjCi79lwR9IF9Q8GNJykIzTEtV+3KR6XSTOG2exMbse2jaW+6IzgXzI0ePSRRc8IUbGhXWG6k6I/Pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36756003)(86362001)(38100700002)(26005)(4001150100001)(1076003)(2906002)(6666004)(186003)(6512007)(9686003)(478600001)(6506007)(44832011)(66476007)(966005)(6916009)(4326008)(8676002)(83380400001)(8936002)(66556008)(66946007)(316002)(6486002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w+l8j/7K0NR3No99QK92HoDR+Fomt4PqGTpKM99ZBRksOcjNZxV3BH2ek/dI?=
 =?us-ascii?Q?6+z1GNG0MV9SsmQ2ltrOIPomzE3ksLerOZYPIooYU2uasYQxYTwUkEYiIHDM?=
 =?us-ascii?Q?WBizT4/wnlI5yZoQUNnjm3KZuW/D2ISpXBJfp1UOFyCCn2AF0ZIqvELRCiCz?=
 =?us-ascii?Q?H2fg+BJGNpGWaUVjRujNDJ5hVB/KFzAVkYhBIOnvIYNYpaFAPUG9GmiLZ/Du?=
 =?us-ascii?Q?yuOlN0dQkCoqhTG7Ks8hY25pCG8E7uxG1CjLpN4HbZoOBxvf/nRunY7A/HIX?=
 =?us-ascii?Q?tbcBDdlYEVsVXOFS2ARl++Gqgd9VEOsc5rNCT4yihVsi+khkuKr9Xo4/w981?=
 =?us-ascii?Q?f3j6HzjjeSpAUPemOzFs4v/V9ubDGKAos2TxgaNCCFSEUvQvCEDLJr0mJ8vJ?=
 =?us-ascii?Q?DCOMFIevxVkx4MFgwIPYjMsJC3daNK4g+PGgqdb6BA6V8zlc44zCdP3ax20i?=
 =?us-ascii?Q?wzE6SNOYYZZutuAo/zRcpSkKzIUCHsHKxU61Q0PUTHa3BUUljZhQldOiEmhC?=
 =?us-ascii?Q?BGXvqk/A7SKUMHtoYcMwYtBtaxjbJgIIWS8dQO094hfxHez39gY3xkymL9IJ?=
 =?us-ascii?Q?LY8IJ/QwFbP30bqkzfo7rCPZ9WaueXhJ9MSVo63+SeIBXNJg8rAnlzUJW5Uk?=
 =?us-ascii?Q?psSZZuD5HE+AF/ywiDSs1XGjLaXjP8Xm/x1hYcNM8MQq+0vOFVP6GZHLeSB1?=
 =?us-ascii?Q?slP/9UaYszdM9iOk3it/bUoYoU3GNVd81ItvlpChIZEhMbqnHn5noz6pmMJx?=
 =?us-ascii?Q?3zYcDjg4xJnCS+BOj18X4TUMbxT6Fh//m8RdrBu9gk5DEz17GZAWBb2c3cKm?=
 =?us-ascii?Q?PHvysWfyQkuuEQf1habfo5m/DCCEk1jGmVHd5apTNiOCjiNOl2/q5knZGvOz?=
 =?us-ascii?Q?/EJjrOXFvFOc61yYPUMcDw6PmH9PllioRsGE9SL/oQiDIMFUZvzhIov7+Bng?=
 =?us-ascii?Q?rzEUKDG6IZ0UC86hyqFlY1pYqm+JCR+eQoZTq2pLFphj2RuENmmwxmSoGFvj?=
 =?us-ascii?Q?ZumMCDJDRSZs/hcxW2DR8OZiH5YoWKNciy9W+hrsZuDNK5XiRpff8ch4Li/g?=
 =?us-ascii?Q?jsYSnM10pNnsD2AI2csqWtprQUepcJGe4xs8lDhsAnibJguHLYrCTyHeSHJE?=
 =?us-ascii?Q?owufKvZg/RrykLSYTuYYx5Ap/WHt00aVfALu7JYZHWwbYEdh0m/E0HmLYTY3?=
 =?us-ascii?Q?YVTRD6UUmUzCZtOtGBs34kIwCBi7AeFQ0gs6yw+v6YlroETRCWyChajeUDho?=
 =?us-ascii?Q?5cRgWDtSXAXNaqCfi+w1m+SZbhyqMKsTMcXIwZhWTNc/xSJ8CV8ymBE7eSj3?=
 =?us-ascii?Q?LKg5iMn5DtavoFPT3EBumURkyRSFqSQjLFqsWe6i4wDlEsvEI34hoJP6GLHt?=
 =?us-ascii?Q?w69jexFAyYPNk2269R45aV+lWjd24Z41UppdUtdMCHacghabvU9OFa60kQf5?=
 =?us-ascii?Q?0KVOFma0QM5hZ0aPt61lHN0XbHl4fnMuouOeaGjJWNVJxXSFJomVxB6QgoeE?=
 =?us-ascii?Q?jzVWok60UqX5uc6aAJqo5oSeiI0oyYrUxUyFBlE2MURYJ2NTq5SXmLG6g1SM?=
 =?us-ascii?Q?cqK8eTkWCbC/mOuOzsiQcv/0lGSMnr7z6CbstcZOqRnSbO/BPcuw1pYlQb2/?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbc7f91-6656-4127-5c50-08dab8214714
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:43:50.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLba8v7N0qeFl4z5LCHLVkzrsi+L4/ew7prcvcrnNA2hef0OveEbFXLL7EVfBxOb9H7Y2TyDI0POPnV1mY1YExjtAYRuOe6PFztlImE/sss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270074
X-Proofpoint-ORIG-GUID: ifcMSNlMyQcs9acQONcL9tWIHaeeBQzh
X-Proofpoint-GUID: ifcMSNlMyQcs9acQONcL9tWIHaeeBQzh
Message-ID: <20221027134325.m8NtM7yxNvUHf4mSL-ZG7Hq1E5XCQ24ffbwpdeV35CI@z>

Hi Yu,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Liao/rtc-fix-race-condition-between-uie-enable-and-rtc-set-time/20221026-113739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20221026033348.1660732-3-liaoyu15%40huawei.com
patch subject: [RFC PATCH 2/2] rtc: fix race condition in rtc_set_time()
config: loongarch-randconfig-m041-20221026
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/interface.c:176 rtc_set_time() warn: inconsistent returns '&rtc->ops_lock'.

vim +176 drivers/rtc/interface.c

ab6a2d70d18edc David Brownell    2007-05-08  128  int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
0c86edc0d49706 Alessandro Zummo  2006-03-27  129  {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  130  	int err, uie;
0c86edc0d49706 Alessandro Zummo  2006-03-27  131  
0c86edc0d49706 Alessandro Zummo  2006-03-27  132  	err = rtc_valid_tm(tm);
0c86edc0d49706 Alessandro Zummo  2006-03-27  133  	if (err != 0)
0c86edc0d49706 Alessandro Zummo  2006-03-27  134  		return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  135  
4c4e5df1f346f7 Baolin Wang       2018-01-08  136  	err = rtc_valid_range(rtc, tm);
4c4e5df1f346f7 Baolin Wang       2018-01-08  137  	if (err)
4c4e5df1f346f7 Baolin Wang       2018-01-08  138  		return err;
71db049e7355f3 Alexandre Belloni 2018-02-17  139  
989515647e7832 Baolin Wang       2018-01-08  140  	rtc_subtract_offset(rtc, tm);
989515647e7832 Baolin Wang       2018-01-08  141  
dfadcce7a196d5 Yu Liao           2022-10-26  142  	err = mutex_lock_interruptible(&rtc->ops_lock);
dfadcce7a196d5 Yu Liao           2022-10-26  143  	if (err)
dfadcce7a196d5 Yu Liao           2022-10-26  144  		return err;
dfadcce7a196d5 Yu Liao           2022-10-26  145  
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  146  #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  147  	uie = rtc->uie_rtctimer.enabled || rtc->uie_irq_active;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  148  #else
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  149  	uie = rtc->uie_rtctimer.enabled;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  150  #endif
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  151  	if (uie) {
dfadcce7a196d5 Yu Liao           2022-10-26  152  		err = __rtc_update_irq_enable(rtc, 0);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  153  		if (err)
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  154  			return err;

Unlock before returning.

7e7c005b4b1f1f Alexandre Belloni 2019-10-21  155  	}
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  156  
0c86edc0d49706 Alessandro Zummo  2006-03-27  157  	if (!rtc->ops)
0c86edc0d49706 Alessandro Zummo  2006-03-27  158  		err = -ENODEV;
bbccf83f6c4e1a Alessandro Zummo  2009-01-06  159  	else if (rtc->ops->set_time)
cd9662094edf41 David Brownell    2007-05-08  160  		err = rtc->ops->set_time(rtc->dev.parent, tm);
606cc43c720bde Alexandre Belloni 2019-03-20  161  	else
bbccf83f6c4e1a Alessandro Zummo  2009-01-06  162  		err = -EINVAL;
0c86edc0d49706 Alessandro Zummo  2006-03-27  163  
14d0e347ea2db5 Zoran Markovic    2013-06-26  164  	pm_stay_awake(rtc->dev.parent);
5f9679d29c7959 NeilBrown         2011-12-09  165  	/* A timer might have just expired */
5f9679d29c7959 NeilBrown         2011-12-09  166  	schedule_work(&rtc->irqwork);
29a1f599c0cc37 Baolin Wang       2017-12-14  167  
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  168  	if (uie) {
dfadcce7a196d5 Yu Liao           2022-10-26  169  		err = __rtc_update_irq_enable(rtc, 1);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  170  		if (err)
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  171  			return err;

Unlock.

7e7c005b4b1f1f Alexandre Belloni 2019-10-21  172  	}
dfadcce7a196d5 Yu Liao           2022-10-26  173  	mutex_unlock(&rtc->ops_lock);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  174  
29a1f599c0cc37 Baolin Wang       2017-12-14  175  	trace_rtc_set_time(rtc_tm_to_time64(tm), err);
0c86edc0d49706 Alessandro Zummo  2006-03-27 @176  	return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  177  }
0c86edc0d49706 Alessandro Zummo  2006-03-27  178  EXPORT_SYMBOL_GPL(rtc_set_time);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

