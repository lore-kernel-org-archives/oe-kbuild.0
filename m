Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E32038C6;
	Wed,  6 Nov 2024 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908198; cv=fail; b=HTrpBqfCuS286z2sBC0Wwlnmt47+xL+B9988E8sOfMBf0mYXChBAUDTW0o5raySk9TqFqONQ/sAguSNY9u9+JZZfzCw9qu316tj6Nhqq8/aBeluEMTpHmoHMRZq4DeR/qWOAM2S2eRzlce+APbXDPruIbufddY7rcZPITnVzupc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908198; c=relaxed/simple;
	bh=HpwkENKHbR+DFhYXGVVy8Qbn5CQegjRfR861LjKwxGw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sGh2SNp2ypo8Et7Gcoc9hyLIfAvJUlt6Od0araWEDCEispShmc6EtkPDaxUszH9DROIBBUL7gTRqI2wsCPykMRoZYYbZKnNrVtLPKyRt3OkCFZLpOc2ftg6MGtBXDj9ea65ercthd7WccbRuTvk8gFCM8PmGRYDYp6Ifrt4uOBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+34Gz7P; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+34Gz7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730908197; x=1762444197;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HpwkENKHbR+DFhYXGVVy8Qbn5CQegjRfR861LjKwxGw=;
  b=F+34Gz7PelkZNy2+VIQzPFfKDAwBD38S55jZU0pBhyIc6VahPbn3HrjF
   xC3D+vkJxvoyFHJHV6Dv3sNll6COkGeqjHrj/KvnRjtRYKcOMGiMSE7+k
   4qwh0lEr1tNxpsWlhx59kh4LgVCRAGI3tb1ED2QdYw8lCzvRZTsqhLEsr
   hXvNaUezK45ETG7J4suflkx+kgFwcqSkEWFtazS68bmC/cZKApaAFbOw9
   MC3BeSTubXqzqw0E+G1QSXJaO1KgtCSC/TpxUgZzQWToPIkMwRvGnsiYz
   lMp6vGdX/ogU8ryWcauLpkJe5jfTVdIV6jw8k0dbUWdORtla8QXlyeSpN
   w==;
X-CSE-ConnectionGUID: M9HbQzPrQCOOB/znqwTFww==
X-CSE-MsgGUID: oWMz1nRoR5WB10QXlcVenw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41306409"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="41306409"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 07:49:56 -0800
X-CSE-ConnectionGUID: QeEHMrI7TjyHSlFa5fCDwA==
X-CSE-MsgGUID: 2facKIkORbS6Yem18GnO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84957816"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 07:49:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 07:49:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 07:49:56 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 07:49:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pa3LZdZbBIMvqd+AfR1//CG1dENWTpIIQb+P3rgN7d1nyWtx4DsyUaTTbQyT8RvzJpAD7mlXoa8Ob3+RQHyshvdyChbCQuvqkj+qGtMAd6VK6kN2pL3RW6AIq2yy/5JyXPsFMlsGXmmZWjD4uHQaMn0cNPVYILd5v+aSrgDJjWoPnMY80n2ewU02TyIIteDTxg6VA+utoBGNKPlWJYLlltLQIuHqs+AUOMzS89/qgzC+y1E0NQgv6wErmvp9vyx/dX1nfHZ+Y6looyFpl5iepcrgX0Vi2CnQkRVmagRUw1H+37AsgA+chmxxI55HEs1lldHBfExbPHqlTq5u6bBY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvI0XNGY+A3gt2WdkOLFftBdHG3SDt3OF7EqqB47W4E=;
 b=at0/68zoMo9ttP+AP+H+TPXBtK/O+eCEm3vdjbtkZ7HS+87WXY+lIYiK0vGD6E61mRfyVq4BcNOvpqnHa+XzHUH+BbrxsSxYXdtHARZ/65CGYH1sJvJmRD+cKBSt4rbfIdZIlO1yamqmyELIfgKA5ZFfaSan2Wer2u/c0kQaut3qOzxypBsWooLi7STgSoCvkdEeHIqtSSkBSpamRp1FflwIf/LJeWXe5SIgvnSKIn7/Q6Dr1AgthP+TpI8mLxOklShGqyetmsKYxN1LvQC6KD++Sc0NggjZICyj24rjnqcGd8RGbVv5PVMgMkoOqpxuA/spjdAcQrfjeV4fNP+wBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 15:49:46 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%3]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 15:49:46 +0000
Date: Wed, 6 Nov 2024 09:49:42 -0600
From: Ira Weiny <ira.weiny@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
	Navneet Singh <navneet.singh@intel.com>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Ira Weiny
	<ira.weiny@intel.com>, Dave Jiang <dave.jiang@intel.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>
Subject: Re: [weiny2:dcd-v4-2024-11-05 15/28] drivers/cxl/core/port.c:209
 mode_store() error: buffer overflow 'cxl_decoder_mode_names' 12 <= 12
Message-ID: <672b901656fe4_17623d294b8@iweiny-mobl.notmuch>
References: <630a7899-b4ac-409b-81ad-a2936e0400a6@suswa.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <630a7899-b4ac-409b-81ad-a2936e0400a6@suswa.mountain>
X-ClientProxiedBy: MW4PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:303:8e::12) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SN7PR11MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: ed058377-b270-4279-7fa3-08dcfe7aa37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WvMrc/a01yU9c/OuZa34mDBEZ/F4dyN7ZtvxUXhUkvkNGqvP9xpIS6o6PwWR?=
 =?us-ascii?Q?Kwl4pqRVO/gk12c74D+Kh6uTJlF8UplBWACybM9BQhi+EgQ8OvAvNKpAUsTT?=
 =?us-ascii?Q?LG/eTvmfr97M8Mb0kc3J5oOab+v/RaNaXjVr32EJ9xf78Gg0wlGjzCNpkHOI?=
 =?us-ascii?Q?qhxemieNaK0kdQgVTFiPmlUMOC/qQ0st+Sex3HVoeOwsCvKCyJLdZx5RTOu1?=
 =?us-ascii?Q?Lm9ldA9CRDDizVsigH6W0ps/QU+P0D0YODunsfvVZrSfISkMuoetjbP0br2s?=
 =?us-ascii?Q?22t2VKrewyDQnTnBcL5u+76nd2x6vbXrEZkKq5sjSogntmjYRir7Vf56kirj?=
 =?us-ascii?Q?z7PB+7e2jzfqbXuxwLMOGQTvIOcqQWW4wTFizLmROKQhV+nFitinqZJD6eJq?=
 =?us-ascii?Q?6bTFTXgEsjp0TO4DYEdbgYjT4hDB/ESBcAUdAAkj6wlEkkl3j4nzb2eevmzC?=
 =?us-ascii?Q?o05G70MmCP+/8h1Th8+unKoo2KJLUlNrmuBPQo/DnORdHD9tHAZms4F2qv6k?=
 =?us-ascii?Q?kqnyWv7Ecc23ELjm8TLidHw0hCh2VHlwjgRCBnFrx6MTbKpn7tQtN25kNuBE?=
 =?us-ascii?Q?19icTBcMLJLgdTNQC8rmJNCHRMdKUclqrjFXC5WDvND3jYT3vojEDoROmJ/U?=
 =?us-ascii?Q?Kr9H0PEnX5mr/GTJ/RGh0akzOvfXa7uFB2+J4aND9O28iCixBHwfsSnCA4+F?=
 =?us-ascii?Q?XWSFRqUX19ourWXhVgXJvWD1+4FYFxTGsYdQsvFccAvO+cjoIZxF1eO9d8gu?=
 =?us-ascii?Q?QTfBAylhg2UNTCUuSF/daX5l+/ufpySHrGSuEYsj0C4lIhWiaSfMb+x/KbF5?=
 =?us-ascii?Q?NSdMO2n73aprh4z8ez/W71QvPnQ3oK+xiD1daco4tC7Qv93R2NGYjf/rJ7rf?=
 =?us-ascii?Q?MfyRrxNKXaqQ7bknG/VGKFyQtToF9dmNpSoHDHNuWSYC4Nl1BaggqGdJyz53?=
 =?us-ascii?Q?MbshYdNDmWqzmxfDTkZQ9/tRoGPE80DmjI+G72deN0/Lg905FaHdp5UfSwPX?=
 =?us-ascii?Q?bbW9v9EED9WDKo8wku5PUdp23h6Bh8gj8NO3LKw1+N7ji9t1rWG0XPrTChPW?=
 =?us-ascii?Q?nXa2qQaF+a2ieifDU1hjrYZ/uGKGxuYkqm5Vx/GecS7suDEboXWmsukoQy3W?=
 =?us-ascii?Q?msBQ4kRfMZT1gDlZm4bHYPWO4FPneAUAlKWGRxMs7hAYhWvcYUnWsNsapCyc?=
 =?us-ascii?Q?J0COVu6WMyVcQVq/e5xo3enHwP2I0wc7m6gzmc8MQrY7n2+PQD/bDXRsS84w?=
 =?us-ascii?Q?fyM5IdvhVxpWvLgbSrXDOaIo3wMjhfyr5PLZYy8YEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oO2k4GRz/MFPyGhJjVvJx4svqqjWcy42E1weaOUw0Vtr8cSi0PGzzI4PGA3t?=
 =?us-ascii?Q?JVLMFcSPF/xtz9fuylupYi8Qd6w07/AUwKqk3eBWaflG1qWMj2FTKvMM3ejY?=
 =?us-ascii?Q?T3If8Sn1TUPEzOz1ptD+u3pKIFo2JCKpAyaj3EbXseEjHDes3mKG4DsLum1J?=
 =?us-ascii?Q?9KeKz/YG1oaaLfmcScP1KVKMPgCsk+2RNv64Me01IYpMln29c0FQjUhl3qpZ?=
 =?us-ascii?Q?mM6PrA8w5nQuTl2IjErX9lIOIpYYegM2vbtKsQBM0gKpb9uFNfV9GA9wigxY?=
 =?us-ascii?Q?Y9lduVO/kSd3JxP1Mm2z8uKwSlTfX6YCRUa0//wPmil48X2qv2k9nquEVR8D?=
 =?us-ascii?Q?ieewUc11kR9LayNDS3n+nS6yWMQv3jU4gf9sr4RmjBVnxrSTXeLDyvMRwq4f?=
 =?us-ascii?Q?yrGEML8D2f+XoHcRBoOKT+uIkaRpWNxvqih8enX9aIf+7C6qRsfG20ugsQj/?=
 =?us-ascii?Q?lYGs4m3yt6cvEC1e63AEcdiEwBcOJtz+kX6KxdIKU6yAfQD3ezMwQhMuN8Pz?=
 =?us-ascii?Q?sB8voOj6PLtGf7YM+uRSffhgQsd9C/IAZypLFFoW13KX68KQ26XQ4UTEh454?=
 =?us-ascii?Q?n7skWFEeRD+iu9LoSuGFL9hYIKyRaLPis+l+H3tP4QTRW+/SFRgNSfNqxRkM?=
 =?us-ascii?Q?FpQKHFeSA6ru+WRP2yMe3cWyLV0L6zoOLRKocS2h4LdF/3TAwtEVVLVQtuee?=
 =?us-ascii?Q?zmb03UM/RBJaJpSZhPuxmhhZDzzb+jT0MKEeqLBB0p/2UOwyIt8F8COwC4VL?=
 =?us-ascii?Q?BKlgTmmWwoCL3Ty8vNEcY65FjrWW/v26C+uuZ0PO4wSH4LlujnqxrY1hTenw?=
 =?us-ascii?Q?WEo4VGqTrPcbhkIGJsijPW+kZYOyxpha73KjuDVJP/mhC9d6umwcc0alxPCw?=
 =?us-ascii?Q?pyKLpko2i3ecnLD4s5tJUfHDnmMkvE3IEgzRb8vodIW3BnPl+K0/I1LIaI6k?=
 =?us-ascii?Q?d4uC11g2mp5hpMdGXv2jKtj4se3cbRYRVfc59kV3K+h9v5sRS7haYfy/dA8G?=
 =?us-ascii?Q?HaI2pWkAelFtUPdeeSvrwD2sMjTc6M4I8ph+dKX3D5xSbFU8IX9efTW0Yn+k?=
 =?us-ascii?Q?bAEykrpqimuHG3X+2YtLk27JW7p2kwu57BOn9US5W3naf4FFg1FNrd+4JqEZ?=
 =?us-ascii?Q?oBFRkbuhcie/jUaDjrP2RcXtOd6/uEJSXAx3QtbTMPTgorwYgmCvaW67Q2/N?=
 =?us-ascii?Q?+UItZ590PjLXEt5HcjCg9YW7D2lq/2v9sTT6w5yPqbKsU1a102eiwuGfeDH8?=
 =?us-ascii?Q?qYh5Nea3gfXbFbEOwDuO/jkXbWNnzmMLmM+0dLD/qRqodQHtEey0a538GBCn?=
 =?us-ascii?Q?UU6DgUBOfGfv5JTHPfU7O3xZfD/eFOHCJyXa0yuAS5RUOvyCV1PLMTQXh4Ev?=
 =?us-ascii?Q?/UXa2O0AUkyz/PxNZf5RywITz+2dTc6NepcXErdS37GNBM4V55JP7zP2hXmW?=
 =?us-ascii?Q?E9n3Tn3ir7MQrNxzNMGoplVzvzHs49B5t6fQaDDpEAUSlaq12NIznGLYJzri?=
 =?us-ascii?Q?xd6m9nFj695qZcMeolo6feVb6HeOkZn5mH8C3Mmg0Doc2fUIW/30IsNqXWwO?=
 =?us-ascii?Q?SIcCvdXtULNrX9LetxI6p0gsBqM3Klj5pUBCo/nb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed058377-b270-4279-7fa3-08dcfe7aa37c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:49:46.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lYNOXrmMQ1nSYCoACJsTQGQEDjENslTSkw0Fl1WbAOutyZWtbJt9b+za8sE3b6tINKHpvDyHixk954gWjKItA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
X-OriginatorOrg: intel.com

Dan Carpenter wrote:
> tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-11-05
> head:   dba3b28deacf7cfa58557386a37dc0aceb7dcb64
> commit: d3250f65fdd004a774008ed2c989cda1053fb738 [15/28] cxl/port: Add endpoint decoder DC mode support to sysfs
> config: i386-randconfig-141-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061211.ULVM47Ie-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202411061211.ULVM47Ie-lkp@intel.com/
> 
> New smatch warnings:
> drivers/cxl/core/port.c:209 mode_store() error: buffer overflow 'cxl_decoder_mode_names' 12 <= 12
> drivers/cxl/core/port.c:213 mode_store() error: testing array offset 'mode' after use.
> 
> vim +/cxl_decoder_mode_names +209 drivers/cxl/core/port.c
> 
> cf880423b6a059 Dan Williams  2022-05-23  201  static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
> cf880423b6a059 Dan Williams  2022-05-23  202  			  const char *buf, size_t len)
> cf880423b6a059 Dan Williams  2022-05-23  203  {
> cf880423b6a059 Dan Williams  2022-05-23  204  	struct cxl_endpoint_decoder *cxled = to_cxl_endpoint_decoder(dev);
> cf880423b6a059 Dan Williams  2022-05-23  205  	enum cxl_decoder_mode mode;
> cf880423b6a059 Dan Williams  2022-05-23  206  	ssize_t rc;
> cf880423b6a059 Dan Williams  2022-05-23  207  
> d3250f65fdd004 Navneet Singh 2023-07-05  208  	for (mode = 0; mode < CXL_DECODER_MODE_MAX; mode++)
> d3250f65fdd004 Navneet Singh 2023-07-05 @209  		if (sysfs_streq(buf, cxl_decoder_mode_names[mode]))
>                                                                              ^^^^^^^^^^^^^^^^^^^^^^
> I don't have any context outside this email but presumably
> CXL_DECODER_MODE_MAX increased and the array didn't get larger.

Yep.  Thanks!
Ira

> 
> d3250f65fdd004 Navneet Singh 2023-07-05  210  			break;
> d3250f65fdd004 Navneet Singh 2023-07-05  211  
> d3250f65fdd004 Navneet Singh 2023-07-05  212  	if (mode == CXL_DECODER_NONE ||
> d3250f65fdd004 Navneet Singh 2023-07-05 @213  	    mode == CXL_DECODER_DEAD ||
> d3250f65fdd004 Navneet Singh 2023-07-05  214  	    mode == CXL_DECODER_MODE_MAX)
> d3250f65fdd004 Navneet Singh 2023-07-05  215  		return -EINVAL;
> d3250f65fdd004 Navneet Singh 2023-07-05  216  
> d3250f65fdd004 Navneet Singh 2023-07-05  217  	/* Not yet supported */
> d3250f65fdd004 Navneet Singh 2023-07-05  218  	if (mode >= CXL_DECODER_MIXED)
> cf880423b6a059 Dan Williams  2022-05-23  219  		return -EINVAL;
> cf880423b6a059 Dan Williams  2022-05-23  220  
> cf880423b6a059 Dan Williams  2022-05-23  221  	rc = cxl_dpa_set_mode(cxled, mode);
> cf880423b6a059 Dan Williams  2022-05-23  222  	if (rc)
> cf880423b6a059 Dan Williams  2022-05-23  223  		return rc;
> cf880423b6a059 Dan Williams  2022-05-23  224  
> cf880423b6a059 Dan Williams  2022-05-23  225  	return len;
> cf880423b6a059 Dan Williams  2022-05-23  226  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 


