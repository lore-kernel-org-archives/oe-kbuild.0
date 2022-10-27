Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B267B;
	Thu, 27 Oct 2022 12:55:36 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RCktXj027607;
	Thu, 27 Oct 2022 12:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=8MJ7hW+0zqtNR5AwoaTtc567E/CNCn9shOIGfEOa6EA=;
 b=QIAPegsEP6Pvy+4Rm0K6482r70kDDZRhnPaVQrIJAJBQCY29XT3dzY8rvJeDU13PrKZF
 BaguW9m1pq7ZEC0n62NYVcGxHOtHxcoJRbnasLFq0vXXCWC/KGmo2jqvIjy6xsW0j7I3
 O8+034PyWuKIJEYr7MW5LBHf04CaA0UxvXVicDBvW4YsIbc1+SnqpIAWvYMbNQqPzExn
 UhpJEV1FBqmcvI+XUqpwAzWYetcsSWKg97SyinjLXauLWlS0Rv0MVBISsoNYSdH807Yr
 i4T0rTKltVpO49qdFJHZDx/DVqLdctvIZ6gTEhwekz0InGvM74GW00CTGb2IK9koIqQG BQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfahea4dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 12:55:15 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29RB1319026683;
	Thu, 27 Oct 2022 12:55:14 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kfagpxh6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Oct 2022 12:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/Lx8Fk1pA5HJ3LnR96OiJt4YfhPzY4dOVniKAsVUSKFF/VMy1wgsF3ygbrez5lHmuWEpYdY61ApgCqLMuew6JUuabnguq4LiXyFtf8ot41OtWBeyltlURD8ez/ugOForvXU1w2O6XU84UIq2FktvWp6tLXVQj1gFOwm3YlhJeLiAHlqOvE2SI8khQl8oXPqJ2RkrTCLwqLABwDcV9U/Q+7cvF0z4PqEv5yyYDyt8HYl5UMhgzVKSkdrkjjN1xvfiFTpm02J8CQcdJlHnXK0/LM64wj3v8tXPRfivsXyjSoqlEJeawrmp1uTdvb6M1lax1UlXGcbhTgc421HVBYntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MJ7hW+0zqtNR5AwoaTtc567E/CNCn9shOIGfEOa6EA=;
 b=PnQW3vQwKJpBBxvGTJIvwvw7FSzksfwreL+3yQORFUddCyhkJeyRYlu2QZ6uput4PaqBUBujDRmg/QvoP624BapqdKIi3uhN2bmrAYoQodIg8WOh52SlYb+Alwv2WYZu2sRHuJI6pC5xCoAKPJ3WSBYCSNz6Oq53WFwQHO3MaJBlJ9gUyQJ3eHx1+oMaqo6W3a3ua8LKg7VHiIgYNdGbAM4R2d9NOHdSNGlxOWn6JFZ5C7zRvGe81FnAleKfWGmrXccR1RVcyH7xrMr9fR3M6ss8pS+bDTV77bNsYG94II0xku3H0HTQyo8A8uOhwZTWdSk1w21hujwat9f8P/iziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MJ7hW+0zqtNR5AwoaTtc567E/CNCn9shOIGfEOa6EA=;
 b=N1SMHih1qsKAWQpbN/OgMChjWmgneBlCeSPKWbk72+650dGiwcGgxtTNPybGJ6rfBgKdRmmcWvGliIVz2AlH5B7pwLo7HNOd+Xijw2RIg761mTkDKZRLt6w4on02KXp6IE83w9XVV1qqceXPOoOnjOv2zBlblHVxpUGzt/QD8Nc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB4994.namprd10.prod.outlook.com
 (2603:10b6:208:30d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 12:55:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3809:e335:4589:331e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3809:e335:4589:331e%7]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 12:55:11 +0000
Date: Thu, 27 Oct 2022 15:55:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: oe-kbuild@lists.linux.dev,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 3598/3827] drivers/hwmon/jc42.c:384 jc42_write()
 warn: inconsistent returns '&data->update_lock'.
Message-ID: <202210271717.Zm6nEJ36-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BLAPR10MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6819dd69-20db-455b-f329-08dab81a7bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GlGJR1eWkjr6AF4ghUSCNR/0+4yy/gEownvJykGvyL1B8Ca7LO0rEQxziNlxMwHhSDnmdRsGF3nfBlkf+jOehOONLUcmQFsrrHMN0h/w4FjgEXEaW8+9SQv9H7rOQw7DDQNzSDpW3c9pdYMgmgRxbhu+4V8hab/wb0Pcv4KP1LJvAo61uf0yaK3cA0DTDfdPObxc8ibF5KaN5SjgAg0jO3fpZbns7/+uOk3i7GP572WXknG/YWY4KLK9KzFeDGRAZphxDFOTShjMg+/LrlRZ5a13ULF4pmrI33ELLTsAyrQAyHXgfA7IKp1V7i6XXoRhJ38ewoLpf7isVJGCPIRTG34YCNKTvLdc9pL13zCIrx/PRY0B/T56zF7HruCEv7QzaAodbEzAQQHw1AvuqwwuWFag2RBlUlb1RSDLSSgf6Pku50pJcs16md34/KqhGGmzukAEbwT8TtW44+7vLOBwWw9xkIWdfSRuIL+WiWuGJZzn24OzIU6chQYGjkQHprUQ+9xYWcBtl0xwbZnpZ505R+o+uzvUaE3FyW7XPwWpSTPIjbh2Qrtg6OMlF+0SnrnW9v7MHCVLknm3wmiZ35cx6d9FdxziT85TRhY1zdItfR24ahpUcl/LcEtNDQztD0dS16fAN9y35LGBfHUAsjQS3pYzStMvasoXe4DvfOcQIYhtPoLNSCQeZHomAL2pzf3bYQasUpuvQzs9v+rhEevvhFMkM9K31Rf5jWAm5joHoaXsdMLYp/YowxXziV5/xM5weyq9KxVdBG1ZEVOUCSvLqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199015)(966005)(478600001)(6916009)(6666004)(316002)(6486002)(1076003)(15650500001)(4001150100001)(2906002)(186003)(8676002)(6506007)(66476007)(5660300002)(66556008)(4326008)(8936002)(36756003)(38100700002)(44832011)(83380400001)(41300700001)(26005)(9686003)(6512007)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ePWnXLygPuMVr/9cUKnuKpjTIQNxeQ8rX57tAqn8azkyp1aT+Zd6f7BNMgPl?=
 =?us-ascii?Q?Q6Klhi5f8Ubd026nbRoYW1XBt4pdJ6lHTjMWXqaot6vA9/BDtF0+NNE3VI49?=
 =?us-ascii?Q?1jPdbnZokF0S3gRUWC9l8LyiI+wbjpAZkCPofm9XowDizOgiYoGqpyt/+wLG?=
 =?us-ascii?Q?cJ6jd0iCn5uju91K5WkCSM+HajOhf7uNjIwNO4CxsMqUoybXjNclTiUdUH8N?=
 =?us-ascii?Q?c/yowCMYYAyDiJbXlzHkVeDBQQdwVxPNMc1XzJwmDA7zcxNQ06whz73UNj/k?=
 =?us-ascii?Q?qaU36uKm+w+9O7mMyFeRqi4xLgFLDPiR+HlLnqDcfXTIIRiivdAhb6/S7MWk?=
 =?us-ascii?Q?4jHICQ0xMNuuFawfrACx5oJO7xmiZ/yWcbJS9ZxSwrYnzEP35RwD+v62zDyZ?=
 =?us-ascii?Q?i5Z3x1q2yWf1+Zy9Hyvc8/xPsjIiQugKVY8C6IUuYIDHV1eYzXp5OKHU0ngO?=
 =?us-ascii?Q?5nX31yYt/zTwRt/4FYg+Rsj/Ga2Vup5nxtOxdNmbYWUXhtR9VOYmqH7LpPNT?=
 =?us-ascii?Q?hUDX1igBVyJqic6azqS73sfS3q5gziBUrNtZho/FXxw6mUN7GjztvnahCSDD?=
 =?us-ascii?Q?oofEG+2q0QLqvhjZMy4yAgUiWaIK3nrZvm+NrFUq48qk60pmLTIWp5T2we0u?=
 =?us-ascii?Q?2b7UZDgcKNuMeX4mj0+m9Al9uLrBYpzaWFwAx2aQG3QN6ILbw2/45G+UUXj0?=
 =?us-ascii?Q?88DONbuWjxsj0j5JrGeLdKX+m5ey85o6L9e01aKoseQ8yqWH+ii7UcOMXe3y?=
 =?us-ascii?Q?VtucgaTBi4ndwodZf5PIqZr1y9VsxmjPsvELgb9LfBJR8CAtBencTd4Mnxvf?=
 =?us-ascii?Q?4YDDM8kmYnb2pkGOePsZDedK7B9A1Djb0rlA94ORlJYdodptTSHnES8nRDD8?=
 =?us-ascii?Q?PCj0dJI/4K92kRy+SAgaZF4dUTmbTsbOlX8dhMQlena+8wcC3i9AC9ylbvq7?=
 =?us-ascii?Q?uAiMT0uR6dT0zwRnvG2bkZrIfs5i5zsxvQvlIEkTHVeeqw8HaXNkDG7DdE/0?=
 =?us-ascii?Q?oZFmvWmXuhrQnjfOzDHfy9fXvTEdiw1MOohDQ2hKCv+LN90x/hLDmmCJXUlY?=
 =?us-ascii?Q?xMA/rynWyVJkbOao/WwvHpqt9fGRlUBALMfmEEjq2x4zb4mjyuryPCOAitRZ?=
 =?us-ascii?Q?f0YGZmhbmRaQCJNnX1CLBPRF3Z42rXWsybmRy/XvPE1yzU6DNAqgmRN0SHNE?=
 =?us-ascii?Q?yFn1YqO+D90URAT+iuD5PnTVesTFlLImBe00PL4JYbwMYetlmWmOm+Fqsohr?=
 =?us-ascii?Q?BXE1dhAhTwDceTL6XErT44aR/qI8oaFiPzez1FJ5Fj0EEAuW/NErAuZPh/Fk?=
 =?us-ascii?Q?XoFOJmhJ6joztLnipB6y0Ztij/y5lhJ3h3l57R+MOlTJoddAuKF/tHMDi9xW?=
 =?us-ascii?Q?nlQ7lHnb5lARqQHXkj0tl9MhYyHq9AMslBziZAEO09Fy0jCm+9DSxz1LUL6Q?=
 =?us-ascii?Q?hRY1zM6Pp/EaEQ3qOBGnhZ36sZitSSdA24YsuLYGa3K8YKApNggW6VTqyrrx?=
 =?us-ascii?Q?l6KWQteoCFNl9T2EAhxsnLFX8g7VbSX3on0/N1sE2ZhlNzyeYTbwPb67uvmY?=
 =?us-ascii?Q?y/2S4AgchRhRfaklqQP10DRQlY0RxiWdRZ8TWvswIXQTkSJ8ooFANN60zt7n?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6819dd69-20db-455b-f329-08dab81a7bd7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 12:55:11.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpwEN9ijMeVEhJhUAvJPcn0ukTCbRctgSIM73oAULXuCpP/64xsf1JwanmcOAoDJjxPzRJ+1g4NmsQXzYgR+1AaDW4+ESHxeRHPN9ao62VY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270070
X-Proofpoint-GUID: LiR2ewKyn85vpq3Ue5avV_oiTbXG5TpY
X-Proofpoint-ORIG-GUID: LiR2ewKyn85vpq3Ue5avV_oiTbXG5TpY
Message-ID: <20221027125500.GAs0vFCqzfoQKZ94FbynQBDNXRt9dUdZmOKEzrwVWqY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc4eeb2208ab537a3f3744984cd7f30ac971db8
commit: 37dedaee8bc652293ea677f8fbf6265636aaf603 [3598/3827] hwmon: (jc42) Convert register access and caching to regmap/regcache
config: loongarch-randconfig-m041-20221026
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/hwmon/jc42.c:384 jc42_write() warn: inconsistent returns '&data->update_lock'.

Old smatch warnings:
drivers/hwmon/jc42.c:477 jc42_readable_reg() warn: always true condition '(reg >= 0) => (0-u32max >= 0)'

vim +384 drivers/hwmon/jc42.c

fcc448cfe48ed7 Guenter Roeck       2016-07-02  326  static int jc42_write(struct device *dev, enum hwmon_sensor_types type,
fcc448cfe48ed7 Guenter Roeck       2016-07-02  327  		      u32 attr, int channel, long val)
10192bc654bdfd Guenter Roeck       2014-04-15  328  {
10192bc654bdfd Guenter Roeck       2014-04-15  329  	struct jc42_data *data = dev_get_drvdata(dev);
37dedaee8bc652 Martin Blumenstingl 2022-10-23  330  	unsigned int regval;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  331  	int diff, hyst;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  332  	int ret;
4453d7364d3b1f Guenter Roeck       2010-08-09  333  
10192bc654bdfd Guenter Roeck       2014-04-15  334  	mutex_lock(&data->update_lock);
4453d7364d3b1f Guenter Roeck       2010-08-09  335  
fcc448cfe48ed7 Guenter Roeck       2016-07-02  336  	switch (attr) {
fcc448cfe48ed7 Guenter Roeck       2016-07-02  337  	case hwmon_temp_min:
37dedaee8bc652 Martin Blumenstingl 2022-10-23  338  		ret = regmap_write(data->regmap, JC42_REG_TEMP_LOWER,
37dedaee8bc652 Martin Blumenstingl 2022-10-23  339  				   jc42_temp_to_reg(val, data->extended));
fcc448cfe48ed7 Guenter Roeck       2016-07-02  340  		break;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  341  	case hwmon_temp_max:
37dedaee8bc652 Martin Blumenstingl 2022-10-23  342  		ret = regmap_write(data->regmap, JC42_REG_TEMP_UPPER,
37dedaee8bc652 Martin Blumenstingl 2022-10-23  343  				   jc42_temp_to_reg(val, data->extended));
fcc448cfe48ed7 Guenter Roeck       2016-07-02  344  		break;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  345  	case hwmon_temp_crit:
37dedaee8bc652 Martin Blumenstingl 2022-10-23  346  		ret = regmap_write(data->regmap, JC42_REG_TEMP_CRITICAL,
37dedaee8bc652 Martin Blumenstingl 2022-10-23  347  				   jc42_temp_to_reg(val, data->extended));
fcc448cfe48ed7 Guenter Roeck       2016-07-02  348  		break;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  349  	case hwmon_temp_crit_hyst:
37dedaee8bc652 Martin Blumenstingl 2022-10-23  350  		ret = regmap_read(data->regmap, JC42_REG_TEMP_CRITICAL,
37dedaee8bc652 Martin Blumenstingl 2022-10-23  351  				  &regval);
37dedaee8bc652 Martin Blumenstingl 2022-10-23  352  		if (ret)
37dedaee8bc652 Martin Blumenstingl 2022-10-23  353  			return ret;

goto unlock;

37dedaee8bc652 Martin Blumenstingl 2022-10-23  354  
5d577dba044363 Guenter Roeck       2012-01-19  355  		/*
5d577dba044363 Guenter Roeck       2012-01-19  356  		 * JC42.4 compliant chips only support four hysteresis values.
5d577dba044363 Guenter Roeck       2012-01-19  357  		 * Pick best choice and go from there.
5d577dba044363 Guenter Roeck       2012-01-19  358  		 */
fcc448cfe48ed7 Guenter Roeck       2016-07-02  359  		val = clamp_val(val, (data->extended ? JC42_TEMP_MIN_EXTENDED
fcc448cfe48ed7 Guenter Roeck       2016-07-02  360  						     : JC42_TEMP_MIN) - 6000,
fcc448cfe48ed7 Guenter Roeck       2016-07-02  361  				JC42_TEMP_MAX);
37dedaee8bc652 Martin Blumenstingl 2022-10-23  362  		diff = jc42_temp_from_reg(regval) - val;
4453d7364d3b1f Guenter Roeck       2010-08-09  363  		hyst = 0;
4453d7364d3b1f Guenter Roeck       2010-08-09  364  		if (diff > 0) {
4453d7364d3b1f Guenter Roeck       2010-08-09  365  			if (diff < 2250)
4453d7364d3b1f Guenter Roeck       2010-08-09  366  				hyst = 1;	/* 1.5 degrees C */
4453d7364d3b1f Guenter Roeck       2010-08-09  367  			else if (diff < 4500)
4453d7364d3b1f Guenter Roeck       2010-08-09  368  				hyst = 2;	/* 3.0 degrees C */
4453d7364d3b1f Guenter Roeck       2010-08-09  369  			else
4453d7364d3b1f Guenter Roeck       2010-08-09  370  				hyst = 3;	/* 6.0 degrees C */
4453d7364d3b1f Guenter Roeck       2010-08-09  371  		}
fcc448cfe48ed7 Guenter Roeck       2016-07-02  372  		data->config = (data->config & ~JC42_CFG_HYST_MASK) |
fcc448cfe48ed7 Guenter Roeck       2016-07-02  373  				(hyst << JC42_CFG_HYST_SHIFT);
37dedaee8bc652 Martin Blumenstingl 2022-10-23  374  		ret = regmap_write(data->regmap, JC42_REG_CONFIG,
90f4102ce59226 Jean Delvare        2011-11-04  375  				   data->config);
fcc448cfe48ed7 Guenter Roeck       2016-07-02  376  		break;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  377  	default:
fcc448cfe48ed7 Guenter Roeck       2016-07-02  378  		ret = -EOPNOTSUPP;
fcc448cfe48ed7 Guenter Roeck       2016-07-02  379  		break;
4453d7364d3b1f Guenter Roeck       2010-08-09  380  	}
4453d7364d3b1f Guenter Roeck       2010-08-09  381  

unlock:

fcc448cfe48ed7 Guenter Roeck       2016-07-02  382  	mutex_unlock(&data->update_lock);
4453d7364d3b1f Guenter Roeck       2010-08-09  383  
fcc448cfe48ed7 Guenter Roeck       2016-07-02 @384  	return ret;
4453d7364d3b1f Guenter Roeck       2010-08-09  385  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

