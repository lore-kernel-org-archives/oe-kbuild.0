Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42A1944A
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWwPyq8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700727971; x=1732263971;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nJ+hmu35W1Aopt0yiZN/pihrJBuROZ+ct+uJRXwVPgs=;
  b=dWwPyq8ebEEePCAUNVJHidVXa/ze5ouSzRGATGLRuabOkt9TM+vr/1QV
   EOpSxl32cGcEmXMN2INBK7edGR6bhepbwD6z3aJ4T/GbJa57hnsg2fFv1
   Igf/t83iu9ainr2Wi26pJ+D5xKEpeQp2wE/065ahUTdi6SsURqXx5f7pW
   RG/FVEpempraR3Af6FAP5d93eKNToPkfZb3ofCuRMbAywNk28nf2M83Sr
   fGkY9zFHa3Moby3Qfq8nkuMXsHMohsVh/dsEYT+SJDQ7KWRZKcK94yz8w
   wKUHSUhYdXtRI42EUT0gAEHWGU+L2/Wh0KQt+PncKqCa8j/rTx4ZTGRcU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372381113"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="372381113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 00:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="15262015"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 00:26:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:26:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:26:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 00:26:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 00:26:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG7DhX6ot0ayOyfNvM78nA5Ydc0miw1uWZTe1qCLpcMgXj+N0OEHsHUNk3oLkeuLATQVD1o3SxVHdwmWx4xxpC9vk/MsHQFGuMFNlNeCYAfZuq0PCvu3oK0Ka/NByjuQvTeiA1z8y1+ZVxXgp+iZ5psLVCNKT/bexkF8TMV+0N0LvoE2zCMDRQk/inpRleqztUvuJrGQfGhZr4MMQXD6qbksq61xVgTIzxFf4M4FQX+TDfGv6NoFfqElVncE+HI11kN567NRQxJWnLTkw1LxX8hwUrLZXD+ySZQlj5K5UGDfeypAkaSF4Ib25IveV6Yga1jT7JzEKZplfggqwukJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqb5LGSxqKWvuton1s/cQKpnVonmbY81wqZl+tA8D2g=;
 b=eEgARjF+JNqYSuZuHoyEGOqlkpNPN+Az9Z2Sn6A4V7hGHvfulOCTzIw4XpYoASVRiksWqWyuA63/uJfgzrXCKT+RB1hNAPw7EqL3kL1GwPe02QZpOJccX99QhQl7G0I2/fkEDNMVbo6iK/rdoxdU+21hK4bcX2z3ejhTAI5X4FCNJGrca3g9oJAbB9v8UO+4RGaoMT123ojhiS1egSFdmmkb0KhAqrzjam0COVr3y9tzs+rf82HBVPxBBodp3YUdffCJszcCc6fkahjLOGsxnMyUX2zLU14CIb0bKbI2PeAat/z9jBhb1fFo3IPAciWfScMpzBWmJmzgabdiTG/AQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 08:26:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 08:26:06 +0000
Date: Thu, 23 Nov 2023 16:21:29 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
CC: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: Re: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Message-ID: <ZV8LiSOBAPanhkr/@yujie-X299>
References: <202311212250.lTDgKUwk-lkp@intel.com>
 <ZV7fz/Ly6RnZ5Nf4@yujie-X299>
 <DS0PR11MB7529E111B3E16BA49B9363F8C3B9A@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB7529E111B3E16BA49B9363F8C3B9A@DS0PR11MB7529.namprd11.prod.outlook.com>
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: bfca8af5-6efe-4406-d722-08dbebfdd657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kGfdw+trN1xiRc/4Rb6RlERFT+580SwEMs1yOaY0/OkWivrafeg8ww3Jlp46bmkyRQhgKRDsD8tTdnyfDF6Ek2uaSKMmiRC9R81u6cP8fSZBw95i5mFhVJXOnWn0u/O07jAGmE7zX/bA4W93q6hK5Pq4ef1teim2MTRVc6e9x5soJYbwE2TRfaWBrHtZqHSKDUX8E/6XsznqJzxE7qsNy3+Q5aYbectwAtbWs67iQYhsCXR2maUbkSIVFqnqMdK5/2WwUy8MYQY1qw0XOAR3i7muwIKd/fYbga7x6EVKwcfhUm1Dh4PkL1r3nF2hJ03SxGup5tdquSAkanzB7e1vZsqbhxSLpNTBZXd//OyohslOakP25kpX2TdCIVKXhSnjLyt5rcWhGbaX9mWocQok2klgKCkBbRgP8Mg4lxFmrVdS/dmFlnykd/RzmM1v/BZluqgcA8Po65Cuix9GR3CDxo2/nDlpu4sHLvcOavGzX/fA6jwl+lOpVOt9kB1T95YEtlTcm/GqWWFUOcy3hZpA6zGDzzOTErMObGg9QuJqlOEvCQU+JneNk57ZDECS/oK0YB27RsJBGtW2jIMdDjj3Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(6512007)(6506007)(6666004)(478600001)(9686003)(38100700002)(82960400001)(86362001)(5660300002)(2906002)(8936002)(8676002)(6862004)(4326008)(66946007)(41300700001)(66556008)(66476007)(33716001)(83380400001)(54906003)(44832011)(6486002)(966005)(316002)(6636002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFdCMW1MczBiYTk1T1pnSjIxdVNxQU1ZZkJzU2pMV3B2L2VIVWFsWmFsYU52?=
 =?utf-8?B?dG4wTnhEbVBrVlEwZzN5Ylcvc1hKUTRlMk5CT3RxRnNIRUZFUWFybWxDRTdC?=
 =?utf-8?B?Wjk0NnFUYWZBeitOSVY0ZUYrb3Q2MWo3aGVTZkg0NWQ2eGZZeS9qbHZlSnlv?=
 =?utf-8?B?U25adWxSbE1hemxhMzlZSTJyVnpjckhUK0xtMHEyTTFLaGdVcGRXbDZmRmtv?=
 =?utf-8?B?cjNKN00rczZjYVBvamd5R1ZTNnNFNC9zNFhKanNUcFpvb1lWeHdiR1grazlT?=
 =?utf-8?B?bTVWa1J1RmcyUUYvOHpxWkVhS0dRQmg4ZGlXR2ZpWXVFd1BHZmpWdVd5clBv?=
 =?utf-8?B?cnNmMVYyNFVMWE96VHNwV3M4a2JnQkFib3lrakZxdWlWbjlrcTBoYzNTQ0VM?=
 =?utf-8?B?amZpdlVFUk1qOG1wQzNpMFRWeEM0cG1BaWx0TS9BeU1xQ2JkSEFIclprektx?=
 =?utf-8?B?T3RpWnlrNlNIdE0zTW9KaE53UXBFSDhsVkN2WERRV1JIZXQxQ0tmZDBzVzN4?=
 =?utf-8?B?T0VOSEcycSs3R1RzOW5OcFpFQ1lFc2trampMcUdRaHJXVWJibG1Hb1ltRjdV?=
 =?utf-8?B?U1pUR0hIVTJkcndkallUblJrcEtWUGEvRm9kOEZZanVEd3pSdUJSdTFueFZK?=
 =?utf-8?B?N2U2cVZodzNHQzIxTUxha1NPTldHSzR0MGJRT3k5UlFIMTM2K2lHSXJiaGFK?=
 =?utf-8?B?WnV6VTF3VXRLRVdPMnhVS1Ztdmk2RkdJNFZBYW9lVTVuN1BYdlk0OW1jeGho?=
 =?utf-8?B?UGRudjE5a0RqTkc4UnJjTlhqdllvaWFhOG1EN1AwZTl4OTd1enUxbUFybk5M?=
 =?utf-8?B?V0ZLbmFueTYvYzFrQjNwK2U0SHFlMTl0WGJUdTBuTHo2ckE0cmJHUng3c3Rp?=
 =?utf-8?B?Q1ZmMURYTUorcm41SHFweWRVc3dWb2xab0NLT09pYnRieG1YeDRwYlh0R09q?=
 =?utf-8?B?MGtvWGFxUXBVWThGV1FzLzVLTTdiYk9DNXFZUVhKQjZXQzBIZ2t0cGtjdlg0?=
 =?utf-8?B?Q2Zwb2hQeEllMEU4YlJ3NHc1TFZGWG0zTUcxKzZMUTJ6SENDSHMwUHVlK1F3?=
 =?utf-8?B?RjBraVVRbHJ4b1ptTk5kaitucEl5UEhMdlpKcFhEdUF5bEkycDBWb2lxbSto?=
 =?utf-8?B?aElLOEJ6S1VjK0g1VkloMlhwRTRDY25HTHB6T2hBL2JSZ0RpTzBFL1JSdUdS?=
 =?utf-8?B?L1h6MHRnNkZRNFA1V3htN1hYTXJCVjJtV1dabnJqdDM2TjR1aThNeGg3Q1dG?=
 =?utf-8?B?WnpUd0hqY3p0Vzg0Z05Fbm9HLzcwQ2tVK1lnUnAxRUk0cTQxTDAvK1h6VXNG?=
 =?utf-8?B?ODg5andObWtuWTNYN2w2anVTWUtUZE8vYnhTKzBYcVl4R3VqNEVNRDhhbEFu?=
 =?utf-8?B?aFdzMlNsS0pEM1cwZTRyU1ZWRlpScC9pcU1uYnRranpjaXI4K3Njd0F5bjlW?=
 =?utf-8?B?aHRsUFBNWWl6dExsMDZrb253Zi9EdncvUmJhNTAwVmtUSFhmVlBXbW5SWHI2?=
 =?utf-8?B?SDF6blR5S3VwN0h4ZzN1MytTeEl2OThyZEJvdGRSdE5IK3gyRTRXM2Q1bm0x?=
 =?utf-8?B?RitwK2VlVTJVclpxSlp1SFdjUDJSajU1RmYwMTNpV3NpNEZ4ZVRKY3NTQWhI?=
 =?utf-8?B?bnJvdmVjSnlRd2tDNVArT1dNVFJOUXpsRFRTaHg5OWN0MGQ4RnI5bE1PZXVM?=
 =?utf-8?B?MmRqTksxUXVqOHJ6MDF5WWJrampRRURBUXNwOFh2TW13dnNTQmlmOExQeFY2?=
 =?utf-8?B?YTFhbXRXQ0lRNTA2S3dMR2ZXRUZYRHZPdU14S3BlMC9STzVhUUFsRnlQdWJF?=
 =?utf-8?B?ZS8zRlJNZVhBU1dtWlU2QjU5UE1MUG5sZm9EN1pNanFyQWlQSWRmZ0hPcC9B?=
 =?utf-8?B?bWVWeVJNT3ZVcUVEand1bzNLYk42TUt4S1dtSU1QMkw5Qm5qWXJSUzhyTURi?=
 =?utf-8?B?WXVSdFlZZmc2aWd3czMwUTQ1Tkpsdy9WSGV4UGRZZU9ZN2kwSklKQlJsOXR2?=
 =?utf-8?B?NG10YjhmU2RKTlptUnNENVp2Y3BXQ3VGQmpraDFlV2NhRXZJM2p3bjhNOW1D?=
 =?utf-8?B?THBKQUNHM3ovdERsRjNraE9YR0FVUnhSQzNFSzB0QlpmVWl4UW5BWDF2aWVE?=
 =?utf-8?Q?SlA7/wk6Bqo+812dB1jzQK4Wh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfca8af5-6efe-4406-d722-08dbebfdd657
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:26:06.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Skzh3FpYXD+5fX+ZJEhhvtGcaRjP3Gx9JgA6ggcAlNsqDCZYLeOPqfUN4q0y0cDqBaEfp8fyhiuai6c7cHyU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
X-OriginatorOrg: intel.com

On Thu, Nov 23, 2023 at 03:38:32PM +0800, Liu, Yi L wrote:
> Hi Yujie,
> 
> > From: Liu, Yujie <yujie.liu@intel.com>
> > Sent: Thursday, November 23, 2023 1:15 PM
> > 
> > Hi Yi,
> > 
> > The kernel test robot caught several build issues on in this
> > "wip/iommufd_nesting+pasid-11142023-yi" branch, but we are not sure
> > if it would be helpful to send the report to you since we notice that
> > there are quite some wip branches in this tree that are updated
> > frequently. Could you please share your preference about which branches
> > should be tested (or ignored) by the robot? It is ok to use wildcard or
> > regex pattern such as:
> > 
> > iommufd_alloc_user_v*, tmp/*, wip/*, etc.
> 
> The branches begin with tmp/ is not supposed to be tested. Others are
> expected to run compiling tests to catch possible mistakes. 😊

Thanks for the clarification. Two reports for
"wip/iommufd_nesting+pasid-11142023-yi" branch has been sent just now.
Please kindly check them.

Regards,
Yujie

> Regards,
> Yi Liu
> 
> > Thanks,
> > Yujie
> > 
> > On Tue, Nov 21, 2023 at 10:38:24PM +0800, kernel test robot wrote:
> > >
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > TO: Yi Liu <yi.l.liu@intel.com>
> > > TO: Kevin Tian <kevin.tian@intel.com>
> > >
> > > tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-
> > 11142023-yi
> > > head:   92f313909ee3753f73c9b3341a34aa28116edb62
> > > commit: 731261dcd9270387e7ed95813ad05a02c01006d8 [7/20] iommufd/selftest:
> > Add coverage for iommufd pasid attach/detach
> > > :::::: branch date: 7 days ago
> > > :::::: commit date: 7 days ago
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-
> > ci/archive/20231121/202311212250.lTDgKUwk-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/r/202311212250.lTDgKUwk-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from iommufd_utils.h:13,
> > >                     from iommufd.c:10:
> > >    iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
> > > >> iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared
> > (first use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
> > >     2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
> > >          |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
> > >      707 |         __typeof__(_seen) __seen = (_seen); \
> > >          |                    ^~~~~
> > >    iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
> > >      190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
> > >          |         ^~~~~~~~~
> > >    iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
> > >     2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
> > >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    iommufd.c:2266:44: note: each undeclared identifier is reported only once for each
> > function it appears in
> > >     2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
> > >          |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
> > >      707 |         __typeof__(_seen) __seen = (_seen); \
> > >          |                    ^~~~~
> > >    iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
> > >      190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
> > >          |         ^~~~~~~~~
> > >    iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
> > >     2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
> > >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
