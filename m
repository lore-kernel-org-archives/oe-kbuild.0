Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B515B658
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9RohK7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700716779; x=1732252779;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=p22S/DFIB9TpZ6wXY/ukoohwHT2xQKPWT/774FfklLU=;
  b=V9RohK7DBrDLUx3V/Z77ZxIxzO+l4FDYS8YqzFOnmBeSCtO+5lZCVbII
   U7CSyyQiGEorsm04l9k2f2KCWfJGKdpXFK4eYmzAG8A/2kC5Ykzk4fpKm
   PA9iSkagTJZpFao1ahIdVS+BKGGJ37gE4ulHGDCX1aURxsHLSJAMzbx1Y
   QikDoyNHLQIB6/RIjJZsK6zlPfjjhpmP7cSHpivLzBhxnQzBV1f7JVTjZ
   rQFF0mMjkDXw9ik5PdHhyXvu2+Ngorabv2an9vAMc3UO/fFI1zoUKGY8x
   l9OEvHfJ4KbEn45PFeh31Tviy74ZWx4Rluq4XCH4aOBKQe/y7PzCH6BfR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423334881"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="423334881"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 21:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014506576"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="1014506576"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 21:19:37 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 21:19:36 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 21:19:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 21:19:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 21:19:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM6pr6rIzwiL4Rj73dYaY59Ci2qRA65SNhK8WdOg48b9u0QgUiOIynBTuXVtSL5kSYKnpqUfYDPKgxHRPEnEs87pnklHNc1FW56PinPaFuxsg180bUnMUcdrcSg+kSAZG57yy2FzUl1l7Se70DH6QDNR+EMsM8addFhLl5gZztDjgYUJxqovmGDYwK3K0AC4bSdwOeF2uhLpFWrRxZ6oWrse+uY+UmGhEY1VUvg6ZNIx1bjYpn36nlkk9p6HGftWnGx8JiiFAkzDhSmDr5ZD4oIPrsHjmJWaA4fmgnYEuyfObtIpr/uxpheloLYExEHlqCLhgdHekaRa0xjHJQD12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTUqBP9tFRuRfTIbh6O49dbbozofkKmjOXcAsKf1f/s=;
 b=ZyVQKYhElkt8FpsUNViMWAvNE4nblGrjPuIyi5xsGUNqx8MyyXlFo/8b2T4M99jCsl6iGhys5mORpcRBhjHdKg/nJSB24TiaYO1fbkIB6/3Xr+WJAQRRSgtWlBiwHBmbJzyE34w+u7NVL9rco6FjxQO1dDDN72tT8rA5j2MGE9LyuTX2wEXcjA7esgO+/uK+7QPNvWPBqStdJaE87PpB5bzMF/4QXYmOgHa6gFirFh213+HTs3oy+ELTUKck0nhwdy8Kn60YOlV80qbhlmhfbV99/PA85GN2bMKIH29phh4eGmEcA25OjDZfKlj1fxXEr8GUcLAmUiXa9015q6R+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB7099.namprd11.prod.outlook.com (2603:10b6:510:20e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 05:19:33 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 05:19:32 +0000
Date: Thu, 23 Nov 2023 13:14:55 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, kernel test robot <lkp@intel.com>
CC: <oe-kbuild@lists.linux.dev>
Subject: Re: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Message-ID: <ZV7fz/Ly6RnZ5Nf4@yujie-X299>
References: <202311212250.lTDgKUwk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202311212250.lTDgKUwk-lkp@intel.com>
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ae1a8a-3a2f-4ab1-f8ee-08dbebe3c6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRRehseQWGo8hI5ywfxhx413aEAFAEVzG0rsH0dNIeULLoq7eF13YsJOO7djVpSMyoL9KyWy/gPH4CGpHCt+P0RB/3XxffV1B+qnqppOC3bvlmjqXKg8KEWgsJ8PENwrNjQ+ThP1L+HoKgeEgOlNegJhS107YXxoLQcaCjsmzd+TboAM/z006xYtt4SXdYKqxclfvmj0CnEFCJGcB0lHQNWgTZ2h+hXw7GTt4VSt2A+o4xsNpw241sJgCO+wZWJCJqdRyy6667TIJ0Go7aKy2krkltpSuHZqe/6hPmla9F2LvBpc0NWScUCvaKfHHgP22qSZ8OxiUpPGpj/8b7tu6mO+5HtxMCaiZYCuowgS4vTW2sRNC7rbgStgDwhoKEnBmX5KV8hfm42hkd8vFt8Cfh4RGzf7INhkJsDkRPT7u/f5nc8f+10g9RGivtxk5FScZ01jyzc3JnJiAwVcBI65teA1ZVFdaNHW3mQUdeCfyQpSi+MK5ZdYcq2Hm1ByyMo+D3WEB3/wivleQ1tBsueE+PxEPle4FpdP10q6jkoSm9ds7l9tZRZGwRaurbgLL8NnX9vnhJ0cj6EYR52xBEyoOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(38100700002)(33716001)(86362001)(82960400001)(8936002)(8676002)(4326008)(6636002)(316002)(66946007)(66556008)(66476007)(41300700001)(110136005)(5660300002)(2906002)(44832011)(9686003)(6512007)(26005)(6666004)(478600001)(6506007)(6486002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AccVkgHvdtp6j5NjvldqvBP+KoTmgIJAhAWX05FfK2xfLCQ0M+RPCGClb7+H?=
 =?us-ascii?Q?0T0pDZEE6Ut0nJ/pYSGDTKMUdL8JxNY4kdXTLUgaAlOddSN1UnW7VxOjMvuT?=
 =?us-ascii?Q?rfrfOXRaIj9r1dvpm/6nc847qyraXa2lIj2OAfyvLf5SKqMw/Q0AD8eF+DZc?=
 =?us-ascii?Q?aknVMyCs4pGjVc4J+psfmyyXWhTnnJICgTKR/j3hR5eDWJNTwgBBmxq1EoON?=
 =?us-ascii?Q?dSQZqAKbHzKA74ephXclr4mj92EDO7aI+ms3N9DKFvcRktFYD2TQpGfKweWP?=
 =?us-ascii?Q?kuDbbsoRhEphbKRhfPTbY83phiPtKfFquB+BtVoBkeFdhWdAqjoLAOH/Iw05?=
 =?us-ascii?Q?hJWguBzrP9B3E9Q+TtvcIersKPn3o0iX4pewnCNsIK+C+m1JhsvAE5g8bHDW?=
 =?us-ascii?Q?vAPjSuv9T+VG858hIeaL/NhPlcvEH56uuGSQndeIKNtuBaToimdFjyJ8L5yr?=
 =?us-ascii?Q?LL2EYeMUTFdsbbRC9+DsGesvnqj2xCqCKWgezmKJaFSgJrDbLzEuYtuXPVQb?=
 =?us-ascii?Q?Bu4+1qDsrsxluVTA5tMIQsIZLwX46+y0+EQc+lAD/TXqbiLUeG2pDDRmLIXi?=
 =?us-ascii?Q?w4BMfdCJpgDeXfL5245sU9izdOD5fIbdRVgBGqNsNFdqhGWRfK6mxIGIRVmo?=
 =?us-ascii?Q?L2aZSOuvtdCVJvVsLn8rfBdnC32MHizNV9yrL7KY+8HTT5y6+JsVHBaym2P1?=
 =?us-ascii?Q?49MVLkZiFSDFSVziwmlMUQ54TRbzTm3A2BNDahO4h8o92DZffYOdwk1QEGCh?=
 =?us-ascii?Q?rmHW3Y9Sjfolzd1m2xAYzJ58ikmZKB9017XvtWWLs/ZcXBdPZw49MtrjmQnm?=
 =?us-ascii?Q?+uvw4N5xlNcMzV5sASdEGHnhe9YK3Z4x/HCciZnlMFs2mSG4FIQoaMJ97hZs?=
 =?us-ascii?Q?8/lLO+wPeEsr5UNsMLcu02Z4Uxt/5qpA2dNP0gvVc8pFSnEK6eJvkMN4YIFY?=
 =?us-ascii?Q?2chmRB0uFnOFoiKPl2vMvXpKiZ2dEN019BZjKfHlILSW/XUJvk7gSmZYz2nB?=
 =?us-ascii?Q?JZ4cIr1/9X4JkAQXd914Lec9ymmvR3hpEz9MAY+jAw1u3OF2c6n3PtoWqEcn?=
 =?us-ascii?Q?/ftD0e8t8dbwYxAdIpPj2w4KUChnlNszU14nxQWg7uOMPY91hUYMATdf52sQ?=
 =?us-ascii?Q?AT/8n1jr8kcXV4NEW0P/L6VCrSVatSfqtdgbNvJoAhpv3YBtu94yxUHtyc5Q?=
 =?us-ascii?Q?9s043joYVS9RClw0UDuSujQYj1U2OPCCQg/hORsc06ZhLcCEdDuC9hegI4hR?=
 =?us-ascii?Q?kA6y+UhaFnyoX6Q2TF4hX6XNfG97xot13B0wUBieZ160g+3Gwg4fKPOymMJ4?=
 =?us-ascii?Q?fmyvGP/SLVLr1HiZHOsBaIwuFWKtCn+AhWRhElSnjrjMpRr4SM12g4ezooRk?=
 =?us-ascii?Q?KMCYQlPc039vM7yIN/H+qo9Znc0jAvS6gq8ar+CHB+MgOc4WTo00+Z6aWPNv?=
 =?us-ascii?Q?qOVfF7ZVPJ2nyqt7DoDyh4TUl4oHVUXOFZd6PUdxf1XYV60Sem5c5pefz+hq?=
 =?us-ascii?Q?bgRumjI1vFHpXj+v7VXbrhOwRBdiGjiCrQVLspZKj2Xd70wRrwvCkLk8voFt?=
 =?us-ascii?Q?Auc91CxNAWg2rRDBCZb6fc/IYJP1gxw4OcnqPv9I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ae1a8a-3a2f-4ab1-f8ee-08dbebe3c6a2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 05:19:32.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ffYLKRct52+fkP9Brxcrpb1gP2kFBTwTxrGkejzycDzFw/4s5z4onmSEztJrbsP2eCqBqC7M5proWGOjB48yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7099
X-OriginatorOrg: intel.com

Hi Yi,

The kernel test robot caught several build issues on in this
"wip/iommufd_nesting+pasid-11142023-yi" branch, but we are not sure
if it would be helpful to send the report to you since we notice that
there are quite some wip branches in this tree that are updated
frequently. Could you please share your preference about which branches
should be tested (or ignored) by the robot? It is ok to use wildcard or
regex pattern such as:

iommufd_alloc_user_v*, tmp/*, wip/*, etc.

Thanks,
Yujie

On Tue, Nov 21, 2023 at 10:38:24PM +0800, kernel test robot wrote:
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Yi Liu <yi.l.liu@intel.com>
> TO: Kevin Tian <kevin.tian@intel.com>
> 
> tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11142023-yi
> head:   92f313909ee3753f73c9b3341a34aa28116edb62
> commit: 731261dcd9270387e7ed95813ad05a02c01006d8 [7/20] iommufd/selftest: Add coverage for iommufd pasid attach/detach
> :::::: branch date: 7 days ago
> :::::: commit date: 7 days ago
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212250.lTDgKUwk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202311212250.lTDgKUwk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from iommufd_utils.h:13,
>                     from iommufd.c:10:
>    iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
> >> iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (first use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
>     2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
>          |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
>      707 |         __typeof__(_seen) __seen = (_seen); \
>          |                    ^~~~~
>    iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
>      190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
>          |         ^~~~~~~~~
>    iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
>     2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    iommufd.c:2266:44: note: each undeclared identifier is reported only once for each function it appears in
>     2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
>          |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
>      707 |         __typeof__(_seen) __seen = (_seen); \
>          |                    ^~~~~
>    iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
>      190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
>          |         ^~~~~~~~~
>    iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
>     2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
