Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0649A4A07;
	Fri, 13 Sep 2024 01:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726190691; cv=fail; b=qIPNHujmKd2gH5eu/++vvKolZoaSSkXRdtbDT610Kjuu/7VU0XLz/7qpGUonOFZ+zx+RhUOYaenMBgvT5SEeN42XLR4pde9oYEaeCXYJlaGbDFqBeUH84JHuN/7MAw2XLPN5j4ryYJLonQa8nOgqFao9Xbo982frNdT2MwtzLZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726190691; c=relaxed/simple;
	bh=9aJWFf/we+uLvfPqwz39IBUOSMc7Do3bp73h/pzTkRI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AMPi6fnpESmWtTdWMd6ISMrc5v9g8NMPmEAF9xozmQyrPuxFRe7FjAcAVSP4t1j9po904wUKzYBTtLFQiPFwFvTUhR+qjk6FfiZuEBD52+JsdnyrV7+TI+Nvn9+qBUw5A4m21fFlmIbBT+nkq/Egt36ZY+vNixrPvi0sRgvDjnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgUxQ6br; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgUxQ6br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726190689; x=1757726689;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9aJWFf/we+uLvfPqwz39IBUOSMc7Do3bp73h/pzTkRI=;
  b=fgUxQ6brWtwRtpYZOCDrtgbja1rYkgT22Pg687Ldl/UcU0IJZSsu56Ms
   Bh9X23TvzVAHCdjKDtNFCGNAITs0zVC7881ExPEIOlt+Ar1fCx0vwgGoi
   s/JMuhHQKykncq0aYms/ywflKu3f6Ed/s/3lBMXqw0qM9UBDXPigyUgMB
   k8BwCGa4oJhYLRU6C5iupKsNB4YDmCXuV1KtHhpLb6FBQPBZISHHbtKfx
   ABpqVkTJ7p/kFi409u4icyzo4oFT8NJokr+o0rRcllGBQ813SQClQAiCc
   SwYkvzkncNg5wjeHSDngBdNpKxcuhjDAS3ZC0K5mft7NZ18OOodXC9zBb
   Q==;
X-CSE-ConnectionGUID: IRGZSk/2R8e4qa62YtOhYA==
X-CSE-MsgGUID: tUAn3FB7SSGMDHMEcB+joQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="42554683"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="42554683"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 18:24:44 -0700
X-CSE-ConnectionGUID: eqKbiVddQjeVQhFSzDB5HA==
X-CSE-MsgGUID: 2tFLNr8YSuiTwOsvfd2DMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="68668081"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Sep 2024 18:24:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 18:24:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 18:24:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 18:24:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 18:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4B8ZJTaXlPoA2dtv/lSHXI6klCXnX0NpHhwn18k5r2OpRj67Dm1xRQr3Ccjaf8nw/T1MW8FWQ8rjjiDfDPmB+duXKEnJJcIAfo8IIhAPL7zwECKsDTbWKNtm0aqJzZucf98LQMUfs/ZBlYnQVfro60FY4m/qlF5or175sKnEGWc67ytsK+AnJLcA490ApGesF3Jkqr+M8qFZ42HPiYp5rD0Gl6A7caS/7WaW2LHIVpW3EGvbhSIdHYfgxnJyA4GaYBzO+hH6Jk9ORtiCku8l3OWVpDBQmeNSGrHCunAOfH/eFehMPjcj/a9GBBk2EvyejFLPJM7MErLobA5hGfGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9HbcfZWstKlN7pKsT5Et0kE0e5jGtM7lggeyVrM3wA=;
 b=zJP8boRuiZtjQQ0099YoDyHk7Ii3+p15jAe63qkd2H/HOSznmDCUQtekGEF20MoWYXJe/ePm1PQHLzdlSqDcPWdOLqYXLqIMIUg+chnWLpcbhB1hj7efannEO6dpEKuj+O+AqYbJw8s8DBzclI3op1lolBX6eZhoRAMxw4dcA22rjqAvxgqwABYUVg/CwrNrJzkg2imKSNH6yAomslEbE7uRYHG3Xarfz10wIOd16Obsy+ciE50QUbpS3ACfIVOVDd6QfIlaIViFkRwU7TzRtSJ31d9bMCiAm9XHKE8c0DpF9sco0sH/yUmSajMWvxJ6QSQdoptAIq/LRJx2xAGhFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16; Fri, 13 Sep
 2024 01:24:34 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508%5]) with mapi id 15.20.7939.017; Fri, 13 Sep 2024
 01:24:32 +0000
Date: Fri, 13 Sep 2024 09:24:24 +0800
From: Feng Tang <feng.tang@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v2 4/5] mm/slub: Improve redzone check and zeroing for
 krealloc()
Message-ID: <ZuOUSNOZOAenvc2E@feng-clx.sh.intel.com>
References: <20240911064535.557650-5-feng.tang@intel.com>
 <956a59be-4153-4ec0-8b26-ea3dc1700e75@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <956a59be-4153-4ec0-8b26-ea3dc1700e75@stanley.mountain>
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f99667-2b94-4198-7404-08dcd392d21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z2kNNOU5I+zylBQPWoKNVUGxXy1CRRplSQTJpi8ObQ2EO4JHdfO3GJoT3lfs?=
 =?us-ascii?Q?dg0otsy3tv6m/nSfZAktUOxpXZV8tc1BGFyKHeVgO8Hu7zjpYihdJVC3v/ZR?=
 =?us-ascii?Q?HOerDOhjUVGMRQ4Cv6u89orc/CHnXRXT+gCQ9Bi+A9I9dqD2RGKU6qcthO2K?=
 =?us-ascii?Q?mwH4sumLgPduDN1N9nTj/gUUJuZvKatYuq6ws7vAPWO9ynj4AUMLsaNeTwaE?=
 =?us-ascii?Q?REJKX2q6cgrpRUtuZko4UFg2sz0GerfZl43IDVZENiRnZNKx/+TVI+Vou43d?=
 =?us-ascii?Q?G6Noes6EJknzQjZv61DsaZuF5TJ0+FPPCDN5u0lVvHN5bcs0TWjAoUV07ejs?=
 =?us-ascii?Q?W/s9qfofnH0VzzZWk0rWkr9U614kiaiM5Aqjg4K6wCbwSCg7AIIjkVHSw/QQ?=
 =?us-ascii?Q?NSXgdluLKmoZqKugL7rUPVhAk8di+39bMQElAvHxhrN0kWlTU+GiL9ND3pR0?=
 =?us-ascii?Q?ihXEtzo7+qtKGY4UQ/TSCZVOq5gmwgk01QH3CTxkDZxPb5S4RnNolFh+txJa?=
 =?us-ascii?Q?VojPK9DfQop3gdbwsvEP142hwE0339m7vrW0KK7T6MX4t4BapAJWs01uZbGZ?=
 =?us-ascii?Q?ga//EcCW/A+moDn8BzRLbgdCL9+t4qOBXKg2UfdVPvt/YDJ8keSOwvMlf5aJ?=
 =?us-ascii?Q?EKsEZ4KGOXUntehpKublreodAO7XyhMRtfhYjI95buboliGBjPsDffDmfC2j?=
 =?us-ascii?Q?JMSg/aPzgy+uWDVX0OwmjfZf7ypWr+i83LVte22kjd1iovVFC7LVCy0VH4wG?=
 =?us-ascii?Q?+vWECjty4+feNN1ORuVEtv3+poj/IXq74G7R7GY0cgdaGvIS6mzDeEmzidOh?=
 =?us-ascii?Q?qwDVjidGZHIyF06yJRskhd+4XKkZARY8eLlfUst9AdSR732ZSgwbicD95HNC?=
 =?us-ascii?Q?BDvfLHX8avNCHFgM5x5CMVMExLicBZCmYpiPfjkidSU9MobXGNCM6yT4En4s?=
 =?us-ascii?Q?d8mLg/V3cyhSpSIfODmhuXltbD+O+T3kEwkSTTwJcdLPFVhA0/G3X9/8lPS+?=
 =?us-ascii?Q?wKeQ6mgdrS+m29iI3G5eHbuM55bIeZe5Sbw1kXi4gnWVEEkCJgFzYO7Ama4E?=
 =?us-ascii?Q?lhbRutjAi6nUryTh9Qcdtkh1NNj0edsW2Br1Mu3Xm6/HQ+32QxImGJvs4/V2?=
 =?us-ascii?Q?8eFj77P5ar4nUzjGLiecr00v+pWCd9XSjmsSbc3Vf4q4r/Fz3p07rzsbV6Py?=
 =?us-ascii?Q?Gm5UDREal04wN46UDJn6OSbjoDPBA7BVJc73qqfQVfQnkZ6zfzeVy64gZ5l2?=
 =?us-ascii?Q?P9NDTkuejL/YrBM7Pqpr1sFPx0H+HO+/rIpmtl+EWrSuIXEVxLfPJ3lhMMpb?=
 =?us-ascii?Q?LGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pXW15pRExAuJuwEAeRkI5tpv7AAtL86QiBSdc5fyZnSFD/HaXqm8sJbEqbua?=
 =?us-ascii?Q?B+to/5oV8H3uYQ3DhVxtZY3wWz0WsLg47seh0TLHA7CTe/G8U7alo4s/4YEM?=
 =?us-ascii?Q?K7WcSi1D4eZzf5Vfzrj9rl5YSpMPEEM1mS0/GZYNvGLijj7c5KdClabR0cAZ?=
 =?us-ascii?Q?oBXQVIzSm/W1NXPKVr2NTZQ6txI98EgL+RauYhsvcf40rDKbq7bY8eu2mICi?=
 =?us-ascii?Q?gaJ+o6cX/I34QVIOYqjgZLdYobtbr9/uM7EbH+vD5Be9Wi8+tFmvPyo8+GJz?=
 =?us-ascii?Q?6mgllz8ZJlH+xNnosvabHQLINUqpg59Xrsy+LQGzgA9CpvPz/5k27wJdH8N8?=
 =?us-ascii?Q?3cCwva4xReTFXTFB6R6TDEVUaDzJh38pd9Sp32MyF7KSTA8tXISCxI7tzMVM?=
 =?us-ascii?Q?M9exOufjyOaDx2Lsj4d39XXpPr4n36rKGYcs9c6KtvLce5GwPBCHn9FPiAUW?=
 =?us-ascii?Q?qvRADtH40JNRSYCvKx0yWfj/lRtdJKeqp9gDwzTMfWL+4L4+a15eMWhOqcSx?=
 =?us-ascii?Q?ps8vMinX0NG547sH96mw7Mpu5Y25NrJrQ8WKNX8/psVkmWVI3VmWoTfGFo5N?=
 =?us-ascii?Q?tMouFHi2JK9y7vaHzlb+JJ6tKCNtNK0jp4kT4wJKViTlgv/O3X616juKVdZG?=
 =?us-ascii?Q?6FWdaE/fYcZC83E63ERejpzRWQG2asSBLkq7k/0CSSzFugmjKdnaUvPMg5cS?=
 =?us-ascii?Q?LI5evdYjyVCRGOmc1SPdjo5hzXlrhaJPq3gWSg7SLxkFwBJSXkFQmfjeo1MB?=
 =?us-ascii?Q?0zfBaCbmNaG0MfU8Vx4FifOtstpCyBUDtbHi7wRbBy8mprI2P3QARuVSFpYf?=
 =?us-ascii?Q?tPCeekjfQOP1+Q808W7Lwn0ZqRPvOg1xt2yzt6Ay6gt7Aa1JDRcBrYyzo23d?=
 =?us-ascii?Q?dqLwI1BPM/ucNWaY+2yD75EUDBMGCmES8Jxpuw9svwR7T5l0CIaHdkc9V1Fn?=
 =?us-ascii?Q?fzpEO66XE0zk356TWp+Q8jbpWg04146GsTXffPF7SUp0PSJlSoDinwtsQI6B?=
 =?us-ascii?Q?PDCQMXehdQzimMJUi8H+tuodnwcHzuEuX/tPe96lpyFDCjAono2qz6B1ZlIw?=
 =?us-ascii?Q?pkeFi3U+DShzBzjigjbpUoFSE6dWbWqou+7jvE0d1BJnWD5Ow/md8lyNTyh+?=
 =?us-ascii?Q?NzZXZB8TT6xTaXNU2h898JJkVo8pS2FRfQ8RXsreG0ebDkcns541jXnbtnWp?=
 =?us-ascii?Q?WQyNzEiHbTvHyc7XDCZsi0TUoOkDofi3mGrTPSs6wuW8OTsI0jasvHhGcNTd?=
 =?us-ascii?Q?y5EaQBPRQue3fWUVhATXJzoAIfpRksJnHvFDn2njUI1fvlnwdApYJa4O5fcB?=
 =?us-ascii?Q?s4sxmvHOuVYRLK1IKI1QTyG0/kHInONI/2NCL1Ol7gXh/UiHTsLo/8l3bfz7?=
 =?us-ascii?Q?IG7H6o9JtTI+n6x3r3DpdtRcTsvha2zmrCTuuxentiVNbltASMOn2ena7Vpm?=
 =?us-ascii?Q?qh+V78Gc43WnD6GjEfDFwsnSvy4k++9wvccecv0ra5Af5QrYb/pN3V754Bac?=
 =?us-ascii?Q?8sCQWTztZSLuaiZF+vwT5oyDY8tFVGtYsd/lEet2eFTmJTvVbEjbFPTUWQfs?=
 =?us-ascii?Q?R5twM2q/EBjzr6/khuOYcF8JhlPnJBYH9uZkl45r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f99667-2b94-4198-7404-08dcd392d21e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 01:24:32.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqO0ibIHXTMKxBl1ggLbxqsUNKvpOeeG7Cezl+x0s02bZztb/TH826m4xPRg08SUzIMwAAXqGXgi3AawwNT+Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
X-OriginatorOrg: intel.com

Hi Dan,

Thanks for the report!

On Thu, Sep 12, 2024 at 06:21:15PM +0300, Dan Carpenter wrote:
> Hi Feng,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/mm-kasan-Don-t-store-metadata-inside-kmalloc-object-when-slub_debug_orig_size-is-on/20240911-144724
> base:   next-20240910
> patch link:    https://lore.kernel.org/r/20240911064535.557650-5-feng.tang%40intel.com
> patch subject: [PATCH v2 4/5] mm/slub: Improve redzone check and zeroing for krealloc()
> config: i386-randconfig-141-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122122.U5RpHfCY-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409122122.U5RpHfCY-lkp@intel.com/
> 
> smatch warnings:
> mm/slub.c:4748 __do_krealloc() error: uninitialized symbol 's'.
> 
> vim +/s +4748 mm/slub.c
> 
> 474fff8e68012d Feng Tang       2024-09-11  4715  static __always_inline __realloc_size(2) void *
> 474fff8e68012d Feng Tang       2024-09-11  4716  __do_krealloc(const void *p, size_t new_size, gfp_t flags)
> 474fff8e68012d Feng Tang       2024-09-11  4717  {
> 474fff8e68012d Feng Tang       2024-09-11  4718  	void *ret;
> 474fff8e68012d Feng Tang       2024-09-11  4719  	size_t ks;
> 89a7731cc91033 Feng Tang       2024-09-11  4720  	int orig_size = 0;
> 89a7731cc91033 Feng Tang       2024-09-11  4721  	struct kmem_cache *s;
> 474fff8e68012d Feng Tang       2024-09-11  4722  
> 89a7731cc91033 Feng Tang       2024-09-11  4723  	/* Check for double-free. */
> 474fff8e68012d Feng Tang       2024-09-11  4724  	if (likely(!ZERO_OR_NULL_PTR(p))) {
> 474fff8e68012d Feng Tang       2024-09-11  4725  		if (!kasan_check_byte(p))
> 474fff8e68012d Feng Tang       2024-09-11  4726  			return NULL;
> 89a7731cc91033 Feng Tang       2024-09-11  4727  
> 89a7731cc91033 Feng Tang       2024-09-11  4728  		s = virt_to_cache(p);
> 89a7731cc91033 Feng Tang       2024-09-11  4729  		orig_size = get_orig_size(s, (void *)p);
> 89a7731cc91033 Feng Tang       2024-09-11  4730  		ks = s->object_size;
> 474fff8e68012d Feng Tang       2024-09-11  4731  	} else
> 474fff8e68012d Feng Tang       2024-09-11  4732  		ks = 0;
> 
> ks is zero
> 
> 474fff8e68012d Feng Tang       2024-09-11  4733  
> 89a7731cc91033 Feng Tang       2024-09-11  4734  	/* If the object doesn't fit, allocate a bigger one */
> 89a7731cc91033 Feng Tang       2024-09-11  4735  	if (new_size > ks)
> 
> Assume new_size is also zero so this is false

Yes, this is possible, though unlikely :)

Below patch should fix it:
---
diff --git a/mm/slub.c b/mm/slub.c
index e0fb0a26c796..d5219634e96a 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4728,8 +4728,9 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 		s = virt_to_cache(p);
 		orig_size = get_orig_size(s, (void *)p);
 		ks = s->object_size;
-	} else
-		ks = 0;
+	} else {
+		goto alloc_new;
+	}
 
 	/* If the object doesn't fit, allocate a bigger one */
 	if (new_size > ks)


Thanks,
Feng

> 
> 89a7731cc91033 Feng Tang       2024-09-11  4736  		goto alloc_new;
> 89a7731cc91033 Feng Tang       2024-09-11  4737  
> 474fff8e68012d Feng Tang       2024-09-11  4738  	/* Zero out spare memory. */
> 474fff8e68012d Feng Tang       2024-09-11  4739  	if (want_init_on_alloc(flags)) {
> 474fff8e68012d Feng Tang       2024-09-11  4740  		kasan_disable_current();
> 89a7731cc91033 Feng Tang       2024-09-11  4741  		if (orig_size < new_size)
> 89a7731cc91033 Feng Tang       2024-09-11  4742  			memset((void *)p + orig_size, 0, new_size - orig_size);
> 89a7731cc91033 Feng Tang       2024-09-11  4743  		else
> 474fff8e68012d Feng Tang       2024-09-11  4744  			memset((void *)p + new_size, 0, ks - new_size);
> 474fff8e68012d Feng Tang       2024-09-11  4745  		kasan_enable_current();
> 474fff8e68012d Feng Tang       2024-09-11  4746  	}
> 474fff8e68012d Feng Tang       2024-09-11  4747  
> 89a7731cc91033 Feng Tang       2024-09-11 @4748  	if (slub_debug_orig_size(s) && !is_kfence_address(p)) {
>                                                                                  ^
> Uninitialized in that case
> 
> 89a7731cc91033 Feng Tang       2024-09-11  4749  		set_orig_size(s, (void *)p, new_size);
> 89a7731cc91033 Feng Tang       2024-09-11  4750  		if (s->flags & SLAB_RED_ZONE && new_size < ks)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
