Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F81E517
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725929915; cv=fail; b=OtO2FGSDFio2DMnshwxrJDionlQ6nGbREtHdlZWWyTkIUZc9djCpKORM6GEcxNFU/vXsEfQN8cz1QdgfRa5zlIh4tE5GwGD1vUlUPEx/Fr/ewYxAnVzc74AmKwFk4js4lYZ3/A4QetxI7wowPsCYVSVloYlROoToGXhWh1Q1IPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725929915; c=relaxed/simple;
	bh=EmiVX82YYWNRC8L7cCikteOZQLt0iAJ+1fHaOTxNKOM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KJoPjGB4Mapee1QTN4k2O/czY/Lf+ImescF8bq2aF3BQ5yEjWgSrNO7dKB+YKjn4oUY98zwb000ofBwihhoRlqaAkoNRq2LYAkD3qvNVPwKLrkzJlIpl0Wmp1oCkKaSa92PMsDE8fcbWykdipZC9qWh/PPq6QYXVWRZ68Z1ae1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrZDbIWK; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrZDbIWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725929913; x=1757465913;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EmiVX82YYWNRC8L7cCikteOZQLt0iAJ+1fHaOTxNKOM=;
  b=nrZDbIWKu0+94u0VgSbIOjcIfCFyN3eXEV5WpZd65yuwqKDUI0DDe/TB
   GPvjm4g7xWhCeeO6XSRwQBQMV9FcHAvb8i9FLyLOn5YB1biBZDXFcXXKX
   /jsMnclz2oBgJIwjTIhicDfrP60N+Tr46LchjCM+vGbWfoDJcLgLOfwG5
   /GumY6Xo5viOQoI6u76PrNTJa9mWSAhMog5PG3BzLuRne2YFYZQ0OE0qv
   dQ/G1FJv6yKKv42rHhksH69ryEMuGRvTXJCMhtBVLvCJF7nASnzBM3Fp0
   W4+YyZwQmgQMf2hjBO+Gz5M0EJP3XktGcK+PnuNSy8FKwBo+whKBg2N+k
   g==;
X-CSE-ConnectionGUID: On+KJEcIToqEtziDUi7QxA==
X-CSE-MsgGUID: Kulmt5Y/RDC6nMq35ymqJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42171961"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="42171961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:58:32 -0700
X-CSE-ConnectionGUID: XQ/X7oGATDSqg/4ymjl5XQ==
X-CSE-MsgGUID: 3Xt2SyNNS2iq5hutNONZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="71635854"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Sep 2024 17:58:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 17:58:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 17:58:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 17:58:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 17:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6KV6EkF0mt7IDJ5/O+uS8Y9oCd9qSjL4wVWeDS5itQsae6iJrTYVp+SLO3aCMeTpIY3tAosS7hix2I2d80H1NYVHLhKYq4HLNeBUaG6yItVkFW1fwAsQjHI0f8HmjGhGf6IOKQovfICOxsNA6oW3oNJsJGwnrqPmPhisPQRw9H9CHVJs61XZcntmIBCIAdL1Pm4mQzARX09NXtaS7p0YASrX2l+YQHezUQQToswstK9Ra1S5bIGi1Ry0KKTSfvPCCPqeA+uDvHAKrUNhvk3qQiruY3XiCZShRRjyS0BVujYoUax0DirrkRAkNTEQfg4lypa3OhSVHqTBoi68rVXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ERKMbVBimzDzVSktFsGtpJoCK1dHhTF7yEbIAFx+CE=;
 b=wLJx7JrKJcB2jr/l/zhYunD50LvvXCFhrqYTWTAWRZm25w2a0VTMAL8I61OFBxMn6H0tPA/l85Wm2Xnda3JdxeMVNXOEI8whxhzcNSH30uTpIsDynBv9tUnvjiubk0RiIyALYe0Oy3wk+BsLk6YQiqpl4OjbZpdREZjff4LP58EFfV7wEu3UmMZ5LMJeq31Id1MaiFIjCUyU6UfDRCzT8aaVCZWf2B8jRmt+/vwvglqcLjHlnp3TyuZk9yhBoIKjp8qeSXIVi/LczBc6MqVwuuq9C+rDeXlsmCHJPyQVmx04F9pP0lNiGwi5sHolqlBJtmgDZ0GDU5bw7lKPSBWZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 00:58:28 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 00:58:28 +0000
Date: Tue, 10 Sep 2024 08:58:20 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild@lists.linux.dev>, Dan Carpenter <error27@gmail.com>
Subject: Re: [koverstreet-bcachefs:bcachefs-garbage 192/258]
 kernel/rcu/pending.c:496 __rcu_pending_enqueue() error: we previously
 assumed 'head' could be null (see line 449)
Message-ID: <Zt+ZrJl04TtO6H4y@rli9-mobl>
References: <202409100524.JAAMZEmA-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202409100524.JAAMZEmA-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df9007e-07eb-4b22-bf27-08dcd133ae87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5wxJx1baZyoTEyXWafw/p3zmhOuRsWR5kSxKcQuID1osOkcvJ8ise8cP2r/u?=
 =?us-ascii?Q?fvi6B/cw07dOWKzzuhgn1VlUlhlM8nbRvdK/zaC68gAtSFQkjVo0z2ffyVCC?=
 =?us-ascii?Q?urYIW8DEwYVyh1Awb+G0AvO5ewA8yOKnXix0HZ4iW40umXifuH2+E10h6ljn?=
 =?us-ascii?Q?ZWMQCiM2Aqw+n2yjemK38nNjhf6j1fOnLvnWPXGV9vMVplLCL6dBWYDcFFim?=
 =?us-ascii?Q?YzD+zJMdVV8NWtPSbK3asQ5aR0KR3zCOVUoSC7wsZy79skTBzIoTS+d4cojZ?=
 =?us-ascii?Q?nImtuy+a/k3NFq2FhnlT5l1vUMCvnc2b761dCUzB+bp6qxCL4yskGzRbwHBu?=
 =?us-ascii?Q?XnpRDlQ3HmcbcZcOnuCG2CvU0THWRrlsqqk0MyEoO4Et1PJUIa71I7CSIq4z?=
 =?us-ascii?Q?ecS5K1i+2r0bjGALCvoAESLr4WFFuVQuFNUnMnF5l6o46isQbZIkVa5V1eS3?=
 =?us-ascii?Q?q/JeKsCiAv0wM241yWdq+9I1eRZlSb005j3NU/64O8LbmG5uJkAE2CJKkHRR?=
 =?us-ascii?Q?xhUwC1MIi2FcnandT8y+pfFb3pA2dsipCbCwtwUnme7L50eCEAoF+jlH/Q+4?=
 =?us-ascii?Q?r6jxlrR69YX0Qx4poxrZTfyiMOgjL4GBIQlXr2a+WuWeyyrUynfZ2OfGGo0O?=
 =?us-ascii?Q?VKV57q9zibpZx+EV4MsEE8rVkCTxHawxnH1NowyIpCS5LNBpQelUlcOQhq3o?=
 =?us-ascii?Q?nk9ZeUxYr+f9CjQ1lCkMQaojJdhkvAsOH2h1KcejnUlCZR9od4KWQBSIgByB?=
 =?us-ascii?Q?XjCfixtzBcnvzHahfcOqDjxL9seJ+j6ROhd0svR1iAjRQYtOKZMPClzZUacm?=
 =?us-ascii?Q?77nXKSK3rlSDQqyoIwhxkcwPCKz8lAP/bBs0Ens1QHxpBck+JkH+tG060YNT?=
 =?us-ascii?Q?muzJFBvM7MB1HLmB1zjYfEt+MX7N+RT0MvrA5z3j0egeJvids9eTa6q1KvBL?=
 =?us-ascii?Q?zPKBHGN3r7SO78IWU+Kt8LvYLpDQJB2Wfj8Jad8XB0qajC1IColPC2TqQSR7?=
 =?us-ascii?Q?/6v+aW/Zk0AvrDpOe/qkMAvZYarDYoMM0qH+c19xnVeDmYjGQo8CiifauQXb?=
 =?us-ascii?Q?F00RtigOm1ySNoD5dR5hoLUze8FJrL1HoN6/lsY4LA2RqkBM21x5yzzf51cE?=
 =?us-ascii?Q?ynWnDjyZXaIpChq8+rKASY845whSH6qADDmvolPNhzMp+Ag31xaRIQjrfzOh?=
 =?us-ascii?Q?rXL50Z8v6ork2h6y6Uzdjg78P5K+LlIn49OXUc8iuYRiff7kt/axYJPzbNg+?=
 =?us-ascii?Q?t06Pw3KQRcsN36Y7Mv7QFTDSXDzIC31GMOaLgf9ObcppyeEdh+l77r6atuno?=
 =?us-ascii?Q?oTFlCNRCElderwL6OliDX394liQH+pIfx+PLK6zXAXHvdJH7ER/b2XTvp2Ay?=
 =?us-ascii?Q?thhx5F0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0omEbjEPk6TiwREDx8DB8cUU34y2lvNEsigGy/onZzw9SgCdhxmGtgZ6c0Xv?=
 =?us-ascii?Q?OeziffTPxMtOunC9Glo98dza2y1Nfovcojqb8xvYqQ9g+SaIU4GSxDUnW1nJ?=
 =?us-ascii?Q?IQjZm0TiHRrDLhy3WxM4l7tdMcTZNE6wkJlp5EzybqeW0XDTe9V79H5nojjs?=
 =?us-ascii?Q?wz+JHTpzfD21OgrfUGD7CZnWP4ULzGwgZq65/+npS5Qo//01hHCb8EUIWiAA?=
 =?us-ascii?Q?OgCIigkZ6CUhm8zQAunXhlqC50+xoPEzvY6JhWwOA/tEHeraPX223UWUj5ex?=
 =?us-ascii?Q?CHmw3PuApthhhIHn9A28CgAmi15CJLQ4ShXyTzy6kbN4Xi/zNrq8ax/7ghLA?=
 =?us-ascii?Q?LU1WQLHrJcRutILE7vnOi1G+UbR5yC+1adxhvsxdIKWGmJRDgdvWXUGv25UY?=
 =?us-ascii?Q?Jnizlmki35/4b+df+IB3KcOiq9a9umVDysZ1TYK4CJKw1AcQVOBYeWI3xYDJ?=
 =?us-ascii?Q?kaS+E9/ZSPBL39f7tPejsQpIWWvQXciJFg1/O93yJpNWSwlbXLeu/h9b5v5A?=
 =?us-ascii?Q?EGfcZPBVIVqu7wU0PuPWXYjvwwa/vSyBT/UawWyr+m6rxvhjKrmcw/rctBAi?=
 =?us-ascii?Q?HafoXlZPlCGCtJ6gdDwHy28ey6GfViDviRLbqWYe99CbF18rAfEFsNOyEYnY?=
 =?us-ascii?Q?jHuMaxeSJtb0UhM0nnXOVfFNdzxem+ZzGCaD44W90GWaVKjv/ToBtwrPcuA4?=
 =?us-ascii?Q?cZNa+SUBro80/UZrDmUDQkwuInrliF7GnXw1tA11bkY7YWzEpzuhmUU3kxRx?=
 =?us-ascii?Q?W4+vvmvWSdvA7plX6rlPM8DYRCqSlh19YtuWGA951Mr95BFsTsyyCG4XLqZq?=
 =?us-ascii?Q?gd4BQ0gJ9QOartpmhBRsuW8A+5NAi7jVTLCl/hb4ROBrsQfNmrC0BPRjUtKv?=
 =?us-ascii?Q?SmaaqalNZ2wP7LVldS77LdboCIGCPmN83MRg8klr+DaoxMX7ATUAWQXWIR6B?=
 =?us-ascii?Q?8Zog+FfRVbNNATUeJLNMfqR7dWXi2Jm0Tnxeni1usr8JlHjb0KAQsgd0p+Sv?=
 =?us-ascii?Q?hVIf/3M/Cgbi4yisVPL4DLpSivQbRlgnr4l3ar6ri2MCD9/xsTw9qo8JW4OJ?=
 =?us-ascii?Q?yzo2Aao2LxkZ6yxIWbfWERtKj9mE4qdUHbHa14JHE/T1XwrCIGVxh4nhh3Db?=
 =?us-ascii?Q?CFXEJMR92cAMxCzaS8g2ZwcC+fS6f+i8b2TaAvpXDg9acnfUTibmLdz+OybZ?=
 =?us-ascii?Q?orpT6CPKVB0TJBE7VcxiC8E0/NJyTmgXlU7u7AJGOrzRdj8ukhKIeicdFqJI?=
 =?us-ascii?Q?DFy7t5kkKGUsr8eo/hdh+cjo7Z4BCiFJ6SB03NjGN4v69X/ZjCzpCF1U7na4?=
 =?us-ascii?Q?iykAn107iJg//9eN3Xi9Bliq9Af22oApeMhQ0EX1oa9kDY+tLHG4s94RwmOD?=
 =?us-ascii?Q?5YHjctdin1Hz9DWmX1/Gx8zj7HT34HSlCBoW+ANCKnh3qqi4Q2Y1Yo3cXhUq?=
 =?us-ascii?Q?Cwkv4ypWCFuEtgk5Y8PFo4X7tT9nicyl+dfNr96xKq7FWBsp3OauvLD7OQdf?=
 =?us-ascii?Q?I4fLi0L8DBcVAc5eBz21zY3dtmA1J0RJ3pKAVdn5rJNtG4NB9wRy74vV7sMK?=
 =?us-ascii?Q?Ahx8yn6pllpEUOWlkG3zXa7rqnx1Euj6MxtXAaW5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df9007e-07eb-4b22-bf27-08dcd133ae87
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:58:28.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7oYtN3lvg8AYmA75c9Vk/VaRi/wDd5HlhY/lNXluP3ln2anZ134B1CSpjfJOnfZEuT/qOPobOyz0tM31hXa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-OriginatorOrg: intel.com

On Tue, Sep 10, 2024 at 06:02:53AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Kent Overstreet <kent.overstreet@linux.dev>
> 
> tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage

kindly ignore this report, as the branch is asked to be ignored by Kent.

> head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
> commit: b2025b96fdff5877c7c3de511ff5e0456cc3142a [192/258] rcu: lift rcu_pending from bcachefs
> :::::: branch date: 2 days ago
> :::::: commit date: 2 days ago
> config: microblaze-randconfig-r073-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100524.JAAMZEmA-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202409100524.JAAMZEmA-lkp@intel.com/
> 
> smatch warnings:
> kernel/rcu/pending.c:496 __rcu_pending_enqueue() error: we previously assumed 'head' could be null (see line 449)
> 
> vim +/head +496 kernel/rcu/pending.c
> 
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  405  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  406  	struct rcu_pending_pcpu *p;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  407  	struct rcu_pending_seq *objs;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  408  	struct genradix_node *new_node = NULL;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  409  	unsigned long seq, flags;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  410  	bool start_gp = false;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  411  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  412  	BUG_ON((ptr != NULL) != (pending->process == RCU_PENDING_KVFREE_FN));
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  413  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  414  	local_irq_save(flags);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  415  	p = this_cpu_ptr(pending->p);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  416  	spin_lock(&p->lock);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  417  	seq = __get_state_synchronize_rcu(pending->srcu);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  418  restart:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  419  	if (may_sleep &&
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  420  	    unlikely(process_finished_items(pending, p, flags)))
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  421  		goto check_expired;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  422  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  423  	/*
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  424  	 * In kvfree_rcu() mode, the radix tree is only for slab pointers so
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  425  	 * that we can do kfree_bulk() - vmalloc pointers always use the linked
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  426  	 * list:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  427  	 */
> a2a5fdffbb42082 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-17  428  	if (ptr && unlikely(is_vmalloc_addr_inlined(ptr)))
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  429  		goto list_add;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  430  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  431  	objs = get_object_radix(p, seq);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  432  	if (unlikely(!objs))
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  433  		goto list_add;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  434  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  435  	if (unlikely(!objs->cursor)) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  436  		/*
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  437  		 * New radix tree nodes must be added under @p->lock because the
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  438  		 * tree root is in a darray that can be resized (typically,
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  439  		 * genradix supports concurrent unlocked allocation of new
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  440  		 * nodes) - hence preallocation and the retry loop:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  441  		 */
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  442  		objs->cursor = genradix_ptr_alloc_preallocated_inlined(&objs->objs,
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  443  						objs->nr, &new_node, GFP_ATOMIC|__GFP_NOWARN);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  444  		if (unlikely(!objs->cursor)) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  445  			if (may_sleep) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  446  				spin_unlock_irqrestore(&p->lock, flags);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  447  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  448  				gfp_t gfp = GFP_KERNEL;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10 @449  				if (!head)
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  450  					gfp |= __GFP_NOFAIL;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  451  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  452  				new_node = genradix_alloc_node(gfp);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  453  				if (!new_node)
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  454  					may_sleep = false;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  455  				goto check_expired;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  456  			}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  457  list_add:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  458  			start_gp = rcu_pending_enqueue_list(p, seq, head, ptr, &flags);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  459  			goto start_gp;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  460  		}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  461  	}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  462  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  463  	*objs->cursor++ = ptr ?: head;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  464  	/* zero cursor if we hit the end of a radix tree node: */
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  465  	if (!(((ulong) objs->cursor) & (GENRADIX_NODE_SIZE - 1)))
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  466  		objs->cursor = NULL;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  467  	start_gp = !objs->nr;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  468  	objs->nr++;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  469  start_gp:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  470  	if (unlikely(start_gp)) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  471  		/*
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  472  		 * We only have one callback (ideally, we would have one for
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  473  		 * every outstanding graceperiod) - so if our callback is
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  474  		 * already in flight, we may still have to start a grace period
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  475  		 * (since we used get_state() above, not start_poll())
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  476  		 */
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  477  		if (!p->cb_armed) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  478  			p->cb_armed = true;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  479  			__call_rcu(pending->srcu, &p->cb, rcu_pending_rcu_cb);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  480  		} else {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  481  			__start_poll_synchronize_rcu(pending->srcu);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  482  		}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  483  	}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  484  	spin_unlock_irqrestore(&p->lock, flags);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  485  free_node:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  486  	if (new_node)
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  487  		genradix_free_node(new_node);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  488  	return;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  489  check_expired:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  490  	if (unlikely(__poll_state_synchronize_rcu(pending->srcu, seq))) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  491  		switch ((ulong) pending->process) {
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  492  		case RCU_PENDING_KVFREE:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  493  			kvfree(ptr);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  494  			break;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  495  		case RCU_PENDING_CALL_RCU:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10 @496  			head->func(head);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  497  			break;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  498  		default:
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  499  			pending->process(pending, head);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  500  			break;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  501  		}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  502  		goto free_node;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  503  	}
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  504  
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  505  	local_irq_save(flags);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  506  	p = this_cpu_ptr(pending->p);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  507  	spin_lock(&p->lock);
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  508  	goto restart;
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  509  }
> b76e32ceb9c00d4 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  510  
> 
> :::::: The code at line 496 was first introduced by commit
> :::::: b76e32ceb9c00d47574740c5db96ab34893ddb6c bcachefs: rcu_pending
> 
> :::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
> :::::: CC: Kent Overstreet <kent.overstreet@linux.dev>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
