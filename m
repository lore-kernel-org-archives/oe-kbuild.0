Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021086.outbound.protection.outlook.com [52.101.57.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875A2DECBA;
	Tue, 23 Sep 2025 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662202; cv=fail; b=clWPVdO/Pmmg3+/5kFxdguGpRWvbldfDHnG0//f5H4KMqRl7yjppmJjfZKRAfz6C+PSofnyLfy3h6KZckQAAITUJjIWJNMqL28qvuzfAWd3MrU5+lbo0EsB5rMz/2Ou/h1JLX41gcXK/HDWxa129252ADbE+f3PxTjGHwpQ7adc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662202; c=relaxed/simple;
	bh=BB93eBvLwS/tdtMyxAt6m6CmgoFuIl87zH656jE4ANA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=feYH1nUISA0RBGzUlVMcgbKOUTs7lDUIyTj7ic0urmWq0TlF/JufFUlyXWuNYxBg/zTicz81vIJViHpSHgq/f+eo6NYk4rtWK+8iKkBqMNTp7vJ+Nv1hKRxbROOOGgD7WdKsm3Q6qsforiN6c7K7SqIeIY8xQAlMPztguch892E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=mn9/lnH2; arc=fail smtp.client-ip=52.101.57.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="mn9/lnH2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2RCi0rrFn671AL2b7qiT+JCLsoYo1LWO4uCU2EVUxs4YiSGQMrC98MgCNxn80X5ueL8DhyMyXzkl5olRprCoPGk86bGpk8Ullm6Uayulqz0lDRbuH0VQWHsc31Djxqlm+A5CAhQFGh84/F7WqiIiGiLT41O7jKB5IZumGdJwRH6Yh4aW+DiEYylxxF22WR4W4YuVnir63PI8Ptpidk2W7k0vyIS5p/ZIgaHVS2ipxCB+ziubvwngb3fzF0oWkIo7C+jjn0rm2kP3rjIrsQKDCJ41KRASVa5ry/WXxZVzoJYnHqLOiXKc+IBbgqUulkNQDhMUqeb7x6rsZ03nEuQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oliUaHxNgyXCX1ylI2oIXlqzOdO9nCc+JcRwOZbPWtY=;
 b=bhsfMNCQcpmoOktIV4a/97Xveh1PDbbBwhE4SEUPSqpbMbvfl6CEQCzOxwr6gAR7Vt8aVzsxmnDCAjnVmXWNyr/H1qpJCcj3UGn9apL9iCP2jqnVUVLRnEPfi2F7LPwXJ3DTWgNdQENXzM1qwakAEygM+Ti6FH2D3pZzqELayVT9aOyH3b8xzadE5S5F/PQ2MRXzanlURpNVzH2FvdpWApGk7PFhVQ0im65f66J9TcQrpjrauxFG8spRpYJrMzixiuVN15nUgy0oJN3LASyh8Prwhbja9i3hliVDemUb/9TsdavALOGsLvqIbUQ7EaFetKf6w/D1J7Q5MuX8kddjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oliUaHxNgyXCX1ylI2oIXlqzOdO9nCc+JcRwOZbPWtY=;
 b=mn9/lnH2PFgodOTxfxTqonqVUFoEPP6AIDl7mYZ02Cdrkw+zG2RyJE63v3Ga9YSQZXJ61Cl5V2FliEbC4IAoPbHj1QqdDZan3YYmsBOJv4iMMb91s8gBHyXx/GMQqvpC9UQwCuZFagYmvHcI5aRjn+r08ZvHlGaxz2Jn/EnK3vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 CO1PR01MB6743.prod.exchangelabs.com (2603:10b6:303:d5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Tue, 23 Sep 2025 21:16:36 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 21:16:36 +0000
Date: Tue, 23 Sep 2025 14:16:27 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Ilkka Koskinen <ilkka@os.amperecomputing.com>, oe-kbuild@lists.linux.dev, 
    lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
In-Reply-To: <aNJjQkj70kCArFf1@willie-the-truck>
Message-ID: <5c1ca3a3-6de-6631-a18-abc55a702862@os.amperecomputing.com>
References: <202509231223.gZsX6Eio-lkp@intel.com> <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com> <aNJZ6SqYvBfjZlrZ@stanley.mountain> <aNJbxj55fEgutUPn@willie-the-truck> <aNJjQkj70kCArFf1@willie-the-truck>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: CY5PR15CA0086.namprd15.prod.outlook.com
 (2603:10b6:930:18::19) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|CO1PR01MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: bb732787-54fc-49f7-ac10-08ddfae67a84
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A5ti3mv1eZJxv4h5qN5IMlIWp/ofTzR0Ti3jWRQbnKQi2AhCEHECUDJcm9KT?=
 =?us-ascii?Q?xHHhuya1WjzZghdQvYIT2rc64taVg7tIbplIr/rLzQgVsMpC1WGwlnY/r9lK?=
 =?us-ascii?Q?yBK4xRUdp6OXAHj73yRS639nHNydhkKRTxIIgbfm8e4PApgCsw32EftF/VsF?=
 =?us-ascii?Q?ZvA2v4Z8q6fK4yV0w4AdZZ5XXyV0pU9U0EGqqYRWfnTshKcIn3sBzo81oL3J?=
 =?us-ascii?Q?ecSxiilIuqTzu8u2BNdq3e3KWxfoYcubclmppXh0m4mFShMaPsCD7a23VZNc?=
 =?us-ascii?Q?o2XF3rG5bHMPo+zAR2iu9YzVPARQHVE6eG3P/g1xazL6wh17dLGEwPdD6aj+?=
 =?us-ascii?Q?N1OOhxidDPlR6SzjK9HYge2xRbKPgoj+NuBsxfEvl48vhdhdt7gIZPuQy2ff?=
 =?us-ascii?Q?6DAbTpIjnrirhzkPT2siKHJuTVx4yWuypceRQYAkstTKz0mzqsarZ134i9Lu?=
 =?us-ascii?Q?QzghAxtKGl4tRhng3zWEx9UIaFaWtU6iF1NHWmIhpRfREhimbZf38AQnAat7?=
 =?us-ascii?Q?6JHFb0VIbg74UZXb66bJ60hI04mtLZYBeOE21p5WnvJ2kuKxKEucJdqf9Yoa?=
 =?us-ascii?Q?h59/Dct+L0Rj/3LjAjX/atU5qZ3CTEvd7GyDTf1Oxw82FVWb3TQ1EKS2F8hT?=
 =?us-ascii?Q?0cOcOBIS7yd6HpuF3D+Tddehe9v5Gsi/JSGD78WepwMHG0NjMuymp7KonVIP?=
 =?us-ascii?Q?lVwZI5rojDf6JQ10BE7UPC4k6RuwUWN6bauKSEJsmAYLS5ctNMy/CntRc1fy?=
 =?us-ascii?Q?qfwEuLpE1N8hOBz1mDPyqWgfTSRgySEPxbM4uth4b8HDIt1/NSxLY4WbXT1i?=
 =?us-ascii?Q?Rs8EObMeGNrqb2WNCw9+HFPMcWIrGJ2dHsSn8rBjX8szOfasdewrVWjDohD0?=
 =?us-ascii?Q?3YCXrCgXsvuroZE83wpDCTL7+fVs8CxBTi87A0frZY/s4CeQcbeVMqdbokjp?=
 =?us-ascii?Q?CxfjwMmABDgeHrVO0FWddbkKFa9OsUXSa3HROkwHAkwzP6+m7lPG6D0JG96A?=
 =?us-ascii?Q?/jOZW1Ffg8VKRkx1Te+7msGNb2jXcBroj0CoJRwL7W3oZrjDwZr6juNHrQu5?=
 =?us-ascii?Q?KtWmAF6VVYh43bxE3vwS3bbYnTyo9IfoE8cywikW7xVv8eG+PNmJWJKxPT9u?=
 =?us-ascii?Q?STyXjMKJEmEybN0eWKsPymZYIbhhAPtF5ozMuM0b58ZkSV4lu0Sw/pxJ8kaa?=
 =?us-ascii?Q?haMIH5QALthZacwep/tYMdx9E2tZeGI3i5htyI8es31HNTGIFdKiaSkT8Qg8?=
 =?us-ascii?Q?0ql0IiYax13EsmMT6e1WP5gRkGRlkbjBg+sqw4BcSWKkFhlCA81fvqdVlRgE?=
 =?us-ascii?Q?HGLSVdQPsUdZxHjlZNtfXAoPypqyRgaWbrCvGFS+0T9PZJbzYumJy+tyqPjD?=
 =?us-ascii?Q?ncc9S1o48rv52WVuuZ18c+sPp5EAg6HUo2amkosqDzpud7C10HRl52nxcTmj?=
 =?us-ascii?Q?iaiC2EedrUNzSmWosyPDgdUek2NtR03PwvrPLhjbcb3U4/FmiBdMhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMP0xbKe+wIlFyv2fDxMCP5QljCmbLPnjNxL1p+uWrDm0YJC46Xfglnqko20?=
 =?us-ascii?Q?sNnt5kWNPt8G+QWwby51z5119yhvmF0MW6kAy8PKk69q9T35tB4UdO64drXn?=
 =?us-ascii?Q?Z0TfGp17lcVQQ4/eV8hPPwnIF2i2vzV1+1mGvXX/AQ2chAH2m4yXz3Gu0moR?=
 =?us-ascii?Q?eFBU9SnqN+H1TVVprVxt+y2SGx998RN8wdX+OeHXNhe3jrNRbvzU2vSJa61k?=
 =?us-ascii?Q?HFv3XmuP2826i2JxtpPRE3zYVHG9AyEoUZlQZap7Gz3P5nE2+BVXoVHDocNv?=
 =?us-ascii?Q?FGwsjZjJylQ59Od98Xl4D2n/Klv9pZNXsyETfZCm99UD8UWiHwEPdnkbm6AE?=
 =?us-ascii?Q?28Fhz0opK3hckWkUxp3Z/Z+zMz6jBOiYjiElTG2MkvhUEF2o/iGX5ENL0YYu?=
 =?us-ascii?Q?tnFVtxjuK1o29UDVoDX9BiltkZjSRM/Q4BJfGnhs3FNzmlL7GStI7TsTibd0?=
 =?us-ascii?Q?0+TJixDP6aCKOFN2Y5l4ZDZOqfGo/lD52SWo8bfV0GzGHlv998v6lo7BxlId?=
 =?us-ascii?Q?98cSKD6CkM1DUPrjNsyeSgbFqqsSqXoS8MNvY0oFwEhikXTaF9NSDRTi7KTc?=
 =?us-ascii?Q?EwLVkUT51dEoTmHOT5qSiEvYRlkPVKVy3PB5CLfSfNHavVJzlf3G86/HI/Fg?=
 =?us-ascii?Q?VNSzW2KkWl6Rzt+xgXo5mWMDG8hapAmuuH8Xod6+YJiPHbcp6oHKYjKbVR5J?=
 =?us-ascii?Q?Ip9bs1ESmAmiy+tOODOhKQhJ9AW64vnoa66nB3ylAQdgOGcYQn7q/wBRKejg?=
 =?us-ascii?Q?IuHD6bQNNzuNc16QnMS4vsA2OOxUNGHAFd440pXXLGdns3RpRiGi+zwyk1k5?=
 =?us-ascii?Q?XlrFoOGZijZ3mnGTTP/kqnxsCSsDesDinm8Z9Kfm7Q0scjFrD+ElJ26i7GYG?=
 =?us-ascii?Q?6XifEL3yCQHoDPkSvFToJo5slVAi2diSnvlEOg4bv4ncTKR59oJiRP8KZa3t?=
 =?us-ascii?Q?YmcXcKT/dKDKZAsdnzh5ShTwEgRWj1Pd7HHPSduDs9DVLIwEkHr9aU0cdkqA?=
 =?us-ascii?Q?B90bEQFGiov+WWKWZHJ4/rsbTzZX6IFA7gYxl2zHXQJkgCOpbUrO9RGhB4Ll?=
 =?us-ascii?Q?3zFmWJRlRqRGib7M3AsSllne0O0bh6R/gC+JnsEqfRbEwxkTGqklj94Pqf8i?=
 =?us-ascii?Q?5X/32b20RJxeUXZZnPD+HRmOSiKMxito//QrO4/wsPlXbrdU2dc1olOCCjyi?=
 =?us-ascii?Q?38OeyGYUeCFNjb8HQxfYWUTJ2oKhuMhRFz7xNzOjArG5ZhSfV4PHDI6ED8gh?=
 =?us-ascii?Q?DMqTiYqHbXGKEqt/EG9ew7HPBlBMzPzoQSz2pJexcwvycRwOvvdakWEtrDpx?=
 =?us-ascii?Q?EXKVAe8nrGQJ1Fl4HCPdExbl9vVER5N7fzVeRcZvYV7XK9ukFSYb5dmVsV51?=
 =?us-ascii?Q?p4yHOVKzm8kNdZnJgRmumjBoJQ8qDhTACH+0zwpnJZYUpgVnUpU8LHxht9sJ?=
 =?us-ascii?Q?2XVWz5flYdeR0EIvXW+XQDahN4iXeltt/oe4ZMMxpYkTTYWj3+FdHhf/Poq4?=
 =?us-ascii?Q?mwtRRtD72VJXEf18PrrroBJura3VjcGpvSq6e9we42TUEYQ3eCUy66W6mfA5?=
 =?us-ascii?Q?Gjke07TDx0I9PBBKIU6ose9ifWJ5liESV5xeFipMBUwkz3pggHqgUB8+9kOo?=
 =?us-ascii?Q?DBhTEIvnq3MaL8mczy0VDNA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb732787-54fc-49f7-ac10-08ddfae67a84
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 21:16:36.4654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VIjkHBz902AHpeXgfZlT3gh+f/ryNrcIy2R7DWys82pjodKYMqvcng16KN8NoBtMm0QXe7XuCx5kT1lPwTDP+dFqRJHD2GyOatO+eBhb53cJXaxCjZjq7mY2PnANIsr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6743


On Tue, 23 Sep 2025, Will Deacon wrote:
> On Tue, Sep 23, 2025 at 09:35:18AM +0100, Will Deacon wrote:
>> On Tue, Sep 23, 2025 at 11:27:21AM +0300, Dan Carpenter wrote:
>>> On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
>>>> That's cleary a bug and I don't know how I missed it.
>>>
>>> Because we disabled uninitialized variable warnings for GCC and because
>>> everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
>>> testing either.
>>
>> The more annoying thing is that I run smatch on my tree before pushing
>> but somehow I didn't notice this. I'll run it again to see whether it
>> detected it in the first place...
>
> bah, there it is:
>
> +drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'. [smatch]
>
> so not sure why I missed this. Maybe I used the wrong .config (this
> driver isn't enabled in defconfig).
>
> Will

Interestingly, the gcc version I was using to doesn't raise a warning even 
if I have -Wmaybe-initialized set. It does warn though if I move the if 
line outside the loop.

Anyways, I'm glad Dan and the test bot caught the bug.

Cheers, Ilkka
