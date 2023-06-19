Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21306D53B;
	Mon, 19 Jun 2023 18:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnVpyZcjci5MbZ5a0y9SPFdETIAIiEAA03L83DsXRsOnYJS/MPSHvXpQbEMLWip4HdUn3BO1tSUF35HaGGRfEQ/b7M03ewK04zz+LCzBd3y6jVh/H8Q0c2DpQh/y6olGZLlPh/V74btjahobeOvuV8h5I7oo+OoN/gL9x4IJ7lQIofj5PDQY4s4Yq8lMnn60rSJ1D15D+ysL8FH7JZvVlfh9BcFp+AA9irb2HP1Icnz1l7HOpMExFRkN9V5+A6gbomZImW3k9oV1cYo2bUFhRnlhX5COXPFE63SZZ0VqtxwgrAMGXeY+TIQi2/bv9JnSqkScgG/eoUqhKwtEoh3mCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK5sStgyGjXeImaYsgXEU6WiFBHflwViSfiyrvKwRws=;
 b=dS4fjjdeDulrhiCEHLtFTfObvMvEqhT8XngVpBrHLTUjyTQvH+L3FdkYWeKashRSGIMh5ENnoClSyJkPQFQY8OO7Ayr6qUnmeC2ja2cxqoYjtHs6HWRiN/MTuExsrk+hHkEZPX1UpE8f8Q98A/2xSQOWysikojv1a8oHPmgNeZXr+X2SzxnhagGrFOLjyOhpFs6q16jutv0IXwRYJhYVDmMKZZRpHwwuyXLurdlvcu5mxU3nxY1E1+wqfE3ofnXumZIH8MU9zFwzlrfY1t/lmLKbGXhqsIPkvdYwQGpOz94b/md2XZm9gzvcHeRAcD+klXVHecyQ5keoQ4yK/F/VOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK5sStgyGjXeImaYsgXEU6WiFBHflwViSfiyrvKwRws=;
 b=A4JPccxeontsArZFEsce/OjivrY8ucdcBKIeO6l9xMHha3tq1rXKoFUNYLErmHqvJhgWl9aIxsENDgkJjXy/qHMhaOsFxcj6QHKHh/IMUcR16pHaOBWm2enAI7rBBU7LtYq05ipeFjGQyQ5qZClaar2AUZxIII7/+tcP3OnzKoGgAKkm+5TXf4WBMQdc2ktpdXpOuyoaNjlDql5nGw4qZNae4GoWYhvjs6+JGSUqou40Jm6LGx1dY1AZOg2rjQpdhFxzI2aL4xt+PP1CEfVXUfhVihvZwURB+BoOvzyMp/wo8D3EU3MLSodKnccEx/gtnQPVWGpJRVItbV9qy4D4aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 19 Jun
 2023 18:48:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 18:48:41 +0000
Date: Mon, 19 Jun 2023 15:48:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 09/25] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <ZJCjBfG9wkTfSCq+@nvidia.com>
References: <9-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
 <f5719ba8-0beb-4eea-8d67-7624c1b62c79@kadam.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5719ba8-0beb-4eea-8d67-7624c1b62c79@kadam.mountain>
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c05fc1-eb90-4362-a72e-08db70f5cd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1AwipwlEGR15qHmiYpN+FJuKQ+f4DBASEPGsy5dqkTNUp8NHbVIwJrdqCjLoLou6LZXLOzeK9AmaWPPqx5uJ+ZOcSQPGBTnc75TI0GfuGFWmed3sn6yem9zg63LAJ1mRNT5vWOSRlvrrMWGcZGtmn5OQ/gw9T/jsyshmwt1Rqhy/8zDIYsvHOaDzW3MVQ/rJPBGIFQK7EdXwvDa4AIHdi4l+gw/fRaaibHH02mm0soBLcDXWyBWVA1uy6vaYp4yiyB99F2ztLxrHslYKiIQYJUjSajCCErjERyBlGUSgt2LGJR6sLGSO3NaV9Z6sztTjkClkw77saY8KEhpJ5qrNYNpcHpkxHdHA+XenzNVn1Qx9PHKV6hGpUsluD06om7hrIwb0U5kO2j4wKAFmB+SpM+EZy3qsqJJUxLKM8z2DCAkxAG5gIP/2X4gFmweISvl7V+NYHVFOEmPhK8bOQyLYeFQulYMaurxibvCFX9wnysCEP0P2O4TFZuPIB0RVi+KRyh4oLGp0Brrx6mFt48nnFClRcuHnApkO4NyvmwTj4YNcF0HDHcec4p06VutKCaKQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199021)(186003)(8936002)(66946007)(8676002)(66556008)(66476007)(5660300002)(4326008)(6666004)(6486002)(316002)(38100700002)(478600001)(41300700001)(36756003)(26005)(6506007)(6512007)(6916009)(86362001)(83380400001)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i5utzHzaU5Scw7GMHC7nsLxov88+WhnCeDQwrdAFZRl0cH6ET7XH65NsLbhE?=
 =?us-ascii?Q?TW1ef0sDJVWJTsCwAc44ls2dKOeNP9tWQLD2u8AEr1wSELn0u1zvyCSTxqrw?=
 =?us-ascii?Q?JMKQ82c9l6/Dy0VtnxtzxMp5JvH5ycIT2Pn6zBhWYuMXh/kzxLRdaSdeMqCa?=
 =?us-ascii?Q?5FEE5hwZ9418m7aIlRbhs0JwqjQNEfYjR7Ne38nvmy4c1GetktAObR4Bmc4W?=
 =?us-ascii?Q?4wvsqUCjg/vrFtpgYgJ+ZyFr+N1WH6fMlJPlxXf4Hw2U2QghjGPlPmCZq2Y8?=
 =?us-ascii?Q?lkKDzslA10vH2KqpN5ihBBVKZt2RcIMxzM4U8eLL0NxlDbSmgz2iapYHC8V5?=
 =?us-ascii?Q?eTNha/vMApeC9+k9uhQ+NtS9fNIzhEgTX/7tt0M8vWPVlgGTOLL0w7gJcXY+?=
 =?us-ascii?Q?elUq+mKa6jE5ysfhB3xNo0kHp0OMKLPhnVpllZ7n65tPKjvUd8WDD/Y/61+X?=
 =?us-ascii?Q?Siuxf33X8uj+IOnpQW9Q/Vyry4BQql2dzfeQMoA/HXLtW5dfju6U2EDHKpbt?=
 =?us-ascii?Q?0BYmZWpymCzyzNBoIZdeLZGDGH/g76VvOwIhuQYAToPv39c9HywAUyfazp7w?=
 =?us-ascii?Q?2mrRTrynJfDtQRNKgOEfztxTjc0yCUAUwQ1g4tk3ALCR8Z/CzvvCeqnyzbbG?=
 =?us-ascii?Q?iGAaUl1zYbssoBpCZt41DNskC+WKisrMko5FKzEXmscqJpSLBy4wpA0M2Ocl?=
 =?us-ascii?Q?JKLlxjI+TlKRNeCRXmG5jk6sufHNGfkPXmAJcuTtzcy7s/LLa2jfvN+O1X/b?=
 =?us-ascii?Q?frUcobhvIx+aZzqGMgwj/XgagdLwcxNOxxDoMRndRMMUPmJsfZqwFM5T2agD?=
 =?us-ascii?Q?WjsG97NSkjVUuT6bDk0/k1YoadAhDc45mDEXP+h+IXZ7wQlixGHoY+cGD5Ji?=
 =?us-ascii?Q?/q4sw1cnoeJGafUAji7XXKipB8nBfyyWK0TuHSUjYc1PjwsqccorzzY5uGST?=
 =?us-ascii?Q?8MnPvyb4Pgwe5KVSXYPBc1CGqqIE5x3KHaAS2fv5Igo/3jR1IgkjFyhut6vS?=
 =?us-ascii?Q?6ipq2zhDQ76qIMGHPDeEMrOoG7M2HE/iGySG72lg7Az14kVkgR1Fud2ygJQm?=
 =?us-ascii?Q?ySyGqDOkFk1577z9aX0aKijQaGAfRJ9ioQLMDyDz/XtBC074pEyNg7sj5Hlx?=
 =?us-ascii?Q?sYMqtMWRcsg9g4OsF0KIG9V6slAFWLg14H3CF/dogRG5x6Hi5xp1CcZkBFM4?=
 =?us-ascii?Q?NsyhUFpOEP3SuugfeGmlsMzSia5koUIq8QHO+MGX/Y8D8iKLA4QRkxa0yshP?=
 =?us-ascii?Q?tjhv5JN1wDpRdsH6gNf5PWb/W1EjHjtA8a8qY9qjdyXpZFvIPl5+d79pBE20?=
 =?us-ascii?Q?7+IxKAtV5EhFbR5vWEj/AGK6Y6he6O9UIKK+RZ961yoEIVyh5F66dzOejRue?=
 =?us-ascii?Q?NdjCv1M58cFg0Ws8z+Zpe8StGKnEz5OSy942yeptTn2rcC4ofw2HAgSuhxjU?=
 =?us-ascii?Q?fbMchFx4edro7VRvD9d9JKE1RDCTocL6jhut6XTNbhzVLbl8uf3w21LUg5yd?=
 =?us-ascii?Q?NQon455HQp+ufEZUQsmqjRHRhaDJSc1tBFfHVLYcJlEX7M/0MHHzfQfCOZ1V?=
 =?us-ascii?Q?k0ffyofBTXxZUYUBHhNwImyFjIABwny0cVCE3zT8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c05fc1-eb90-4362-a72e-08db70f5cd04
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 18:48:41.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itg+aXZfcd9ECEf6cKmp2hEUigqWQzoWOhGxoeHwmFxhWyVES4ksNm2cLKeT0RSr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130

On Sat, Jun 17, 2023 at 02:38:04PM +0300, Dan Carpenter wrote:

> 8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1748  static int iommu_get_default_domain_type(struct iommu_group *group,
> 8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1749  					 int target_type)
> deac0b3bed26bb Joerg Roedel    2020-04-29  1750  {
> ddaf433cac2995 Jason Gunthorpe 2023-06-16  1751  	const struct iommu_ops *ops = dev_iommu_ops(
> ddaf433cac2995 Jason Gunthorpe 2023-06-16  1752  		list_first_entry(&group->devices, struct group_device, list)
> ddaf433cac2995 Jason Gunthorpe 2023-06-16  1753  			->dev);
> 8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1754  	int best_type = target_type;
> 8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1755  	struct group_device *gdev;
> 8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1756  	struct device *last_dev;
> ddaf433cac2995 Jason Gunthorpe 2023-06-16  1757  	int type;
> deac0b3bed26bb Joerg Roedel    2020-04-29  1758  
> 8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1759  	lockdep_assert_held(&group->mutex);
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1760  
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1761  	/*
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1762  	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1763  	 * identity_domain and it will automatically become their default
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1764  	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1765  	 * Override the selection to IDENTITY if we are sure the driver supports
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1766  	 * it.
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1767  	 */
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1768  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1769  		type = IOMMU_DOMAIN_IDENTITY;
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1770  		if (best_type && type && best_type != type)
> 03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1771  			goto err;
> 
> gdev is uninitialized.

Should be 'return -1;' here, I fixed it up

Thanks,
Jason
