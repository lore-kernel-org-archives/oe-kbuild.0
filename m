Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42F06FA1
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679670574; x=1711206574;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=u8t4e8ux7bUwm1XJUYG25pzZK6rY6TxgqcGGIAx/k/U=;
  b=GRtQLndRSHyjrMoUKW+QqGK/mR/IfJfgR1olRhs2L2qdd/eLz2c/pdrE
   +gXRijc4F3C+Oi4DzENgak4NaXXKqwPhd6fzZ1MUc8e4jfzOIGj9tRsiA
   77D/L1+IDUErfHi/5K4oazWqgRcGaLm0kZVmy6bisc4aFWuMlNP3/Azdg
   /KaN7UERLQZN6AAP5krITCVyfHhuBzH6iVl2eV9pkmQYhb5R5XEu+Qtun
   R5JAIDeOZFxJrx5Gg+bVlfQp3xr4vpsGiTq5gphP8p/byx7fDVx9sd75V
   IoqYTEOIYkZFkhrqq5kZSbhnQUsJrYUQxutE1siHvxllpW+S6Y9mi4cEg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="367532067"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="367532067"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="856883111"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="856883111"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 24 Mar 2023 08:09:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:09:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:09:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:09:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8UCpyaHb6IqvCs9Mk80qQ8sdgjXTwuY11ez3yc7taoy7sdYzjdprowCBckHGBYSAiF8jvq1C7os5bMwHwyetpPiYrwvAzjkDFJT+NduONw+37dSyysGu2ATsNQ3H/HtRRO7DGRpFg3RX2+A0nQkokl36qaEx5x7H26ToNVSHtSHf/0RDQeegZiZa5vdi2Om2U2Hz8NmGxV+qrqqBvrRUQus0mTzcmGST8FTWiXRyAUQRXDQvhq1vOrLPPPows08h39gZvAdkkE5jaCJyMGPFhv4OaaRfQkb3vFbrNE7BgQlMayNeXKGGjYkeAtGpOQdNJnVxVif1TiICZTGEkC2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41v4kNE8JLSdHWGa/IwxFn0vQ4+bdtJJlTgXN4+rMBI=;
 b=gj1ZkDL5XLS4Zzx1RQCCaheVowuVp5gpTvrBPs9nIJ4TrZNQxLs3ADd/jYOnFBAx3kpsDOO0PWP5A+WW5CwKuTZUjpmJ8nnj84Ky+zSG6VMshv1RzSRVmY8Hp54nqbTXlLMut3kGR4rm670AYXMwjw+lbqsj+5fvfbxqZXpdt4PtAIrB+poCveHd77fCM/YuxzdfNNdP7t0oEkP3F9vth7Y76Mz/IIQoyXzldxN5RfJyCtujGygdR/5+jJ+A1dDLvGiZgMjvWqWtyovlq/HbVnJ55No2c0oNH6Fc9fQTRvf8QjvFRHQjt5azI/xCb+4dSDhLq6HFAe5ubqdPH7qtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 15:09:03 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::93fd:14c:bf9f:6d03]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::93fd:14c:bf9f:6d03%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 15:09:03 +0000
Date: Fri, 24 Mar 2023 23:08:53 +0800
From: Philip Li <philip.li@intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>
Subject: Re: [akpm-mm:mm-unstable 220/293] mm/vmstat.c:1556:53: sparse:
 sparse: shift too big (4294967295) for type unsigned long
Message-ID: <ZB29BeQ0zfhqkhRX@rli9-mobl>
References: <202303240107.qf5g0qKq-lkp@intel.com>
 <20230324130839.nyk4q5o6fjf272xr@box.shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230324130839.nyk4q5o6fjf272xr@box.shutemov.name>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|IA1PR11MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d73251-6f5e-466d-c349-08db2c79b400
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SgPGtqHFm4h36FBj2h9o21KTdy0NAiY56GNyAC9pzqW5GiJgMcl29OYk5jcKGmHbnoiJlPhke0OYfzMTR3kqKIRyo1wKrvH6f3a+YgYqJWCD0cCOE4Oultlhdk0q7UgtKerbCPXa3qJof4epd6gRicNIagasY8wwSUf+ylnTf0HX8WZmal2p0+fVr8FDPWC4OQuVBbjvujOfYWbFqlcBUCsY/vMVFEoS0/rhFHSwXZ9+y2YBPcEMa9Sxm8BzsFDCgxyJ9Aat8WfFuSpg5kxykD8DErtOeOoAX5Kj7hJkUgz9Be7enEQzXiWyZD0cZxqBApscMz2K+W5cP97xVlsfHa7DDbOm1bk/M569r4/R/37A94AYW4TkkO4LN1cD5zkB10gBipr2RmPDDT/5VvwfCH+DwLGb8HO/T5Eq5nWLG0AgZW48KUGqDN4igCcvZz2rkdSEMGhYD958e8L4bqApJ3J8L0+Id6BV5Mhp3BgXU78nDKIPH/ghfprwpVm/imF8xMrJfMvbHzAUluKuI4ho/q33PwwgLi2v13Xnu8WLydO53w39q6PT+npMtV2U+9mXEU+b7S1BZAZ0BJyWML3Y48/s9PgBcrzgkizHv2D7N88Q6m/c0GZYbpJrZPqdJVnJjwS5hV6Vpw8H0531tZ8WxA78LkqcWEFv5aIV2U2Z/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199018)(66556008)(6916009)(66476007)(4326008)(66946007)(8676002)(8936002)(41300700001)(38100700002)(6512007)(83380400001)(186003)(86362001)(9686003)(6666004)(6506007)(26005)(33716001)(316002)(966005)(478600001)(6486002)(82960400001)(5660300002)(44832011)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1xX+0Fz4dMXCGr6xZ/y7AwSj60+rhgjyS3QuDOG9+LiPlPaP+hpR3VqFTPTz?=
 =?us-ascii?Q?ir8kuX7rfBNs5GucifnCoo5QojY5C/BXLlcpWjSb0SdwiRO06pWAL+eczzGr?=
 =?us-ascii?Q?VoP9dAvGEDr+SUE8g9SVva+v1Z9PiGHJnCpDgLpzlHLA7mwZ/4Y4ego0DU/J?=
 =?us-ascii?Q?w6lT+Fkrh3WwvevsITbY4ZAuRYFk6JdMIHH8xmND0kLlpKeoWs+wIwrD+8d+?=
 =?us-ascii?Q?XMhI0lT9diu6uMRjE/VIqmMuVl7ylJ2NdfmvuZvMsbX0cgIOzo/WpG95c8HZ?=
 =?us-ascii?Q?a0+WJgdLn3Xwj7OfQC5AUcqFiKrIzDP/dwE5JDS5qeCyH5nPr8XM/jArS5yq?=
 =?us-ascii?Q?2Jq9K2D+0bOmSgsFv/FtlPeUWX2EZhhZPbrzb+ZgFn3VxSzaWHdYU3cOTRNt?=
 =?us-ascii?Q?Kja/0fTvgIhI3OyLsXOTP1cgccLAe6yrJ5RqZFjG5SrP1D0o0/HeEQcgYz8T?=
 =?us-ascii?Q?ilAENHorpsHkM1iCt8gGsS2PKpammg6T8JKFZ6y/LGICn1YfZexkTK9q85ly?=
 =?us-ascii?Q?6Ha1trlU9TXRZRc73yh6RcVzrsjVluUbqfCyPzDmuJPr5AhHOibkOWZf1Pl+?=
 =?us-ascii?Q?fxMHwfvYdd9u07l1mGABpraIGKq7RUQ3ZH/LBm/jnGJjRXfoTtRl5JFamTX+?=
 =?us-ascii?Q?Xa5aR8YSYujNhLixxhDWFQ9mCBFB4OMVCszR6nMYpXNpIlD9v1uyJIoGN++Y?=
 =?us-ascii?Q?KVmqkGDsHU71ZOOC56syeFANl2ogUStwwnz8h4lWUKzrU66l3uGPPg86kCt0?=
 =?us-ascii?Q?hJC0nPdtzp5c8SXQD6t30zPJS4JU5a+Wvg7fdGUCyaZEtCJ0Ul2e5An4385e?=
 =?us-ascii?Q?GAyeveF/Yg9HJkBknjwzTLG/L2tz++7q7YUXJ3se0p60TZEtEoLwTKCxW5+1?=
 =?us-ascii?Q?dtsoAVT0zJxe35hni7SwZ9+W4COVG5Fty4JT8wQI5vhLWPL4rlgF/MRhVBGq?=
 =?us-ascii?Q?rm5+tMDS+/n66AB9qCV7VZ3b38idaS9XUiwXsYcNIzxuLePKsNOKa6gmQJ6C?=
 =?us-ascii?Q?3ReNTWn/cYqAnyTbXtC3gch0vgmM+TlVWK7j1JNcF8n9c/Y+8/F1jRIO+smy?=
 =?us-ascii?Q?UCfK7GWCeP100gt9sTVizHKrfr9Srq2nxPXVli5Nj7eEDI9ASNJ9ClSJkeBG?=
 =?us-ascii?Q?upMrto+lXz+wdTVd/ASUFu1XTTiuHaNBxZ9ZSy6Ul8l8RTODI2Op1ybSyy75?=
 =?us-ascii?Q?P7uNpof20iX2FR25/4iY84KOsh4J3B354sf+dyrIxXiTTfyGxhb8Gf3pGVPS?=
 =?us-ascii?Q?1mrQUAuFuDk2x7l3f5IZybcNgEXAfW/3jzbfA0J6U6PYrU4r3EQ0zk9y04LL?=
 =?us-ascii?Q?YT3/P3wp7Rt+jUlkDUCg6vk54s3nLzg1eiHqpfG4/Cc9P9CvOQn1NIbH0Sor?=
 =?us-ascii?Q?8TevzzNQOygKp+ZWON9tzyXP/qlFU7lMvMEjtgcGSzjrG+TB3Az2RauGrf8o?=
 =?us-ascii?Q?I/HW0KTX+xVLS7xy6dmtj9sRf8YWuA7Is/NlZ8lzPGjp3FxCmco2ArcUIp1X?=
 =?us-ascii?Q?NECFY+Jqp69B8jx2kFTHPZ7WY4X0wPypLACKiZw1JqEqsNeTo9bMV8y9FGlM?=
 =?us-ascii?Q?b9Sc05Cyo39eV0w26w9G4MeFtMmQ00EW8VprMWVe3Hor06uQ1FquXRGE2GYD?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d73251-6f5e-466d-c349-08db2c79b400
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 15:09:02.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh02e9ZFj61YM91JmcVk7djhj76oZYDsgJ9Ac34Uq2g0PVaaPQ+HigWMhPS0cHOQP9LCxQ5w4meAC4YFhy1PKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
X-OriginatorOrg: intel.com

On Fri, Mar 24, 2023 at 04:08:39PM +0300, Kirill A. Shutemov wrote:
> On Fri, Mar 24, 2023 at 01:11:38AM +0800, kernel test robot wrote:
> > :::::: 
> > :::::: Manual check reason: "low confidence static check warning: mm/vmstat.c:1556:53: sparse: sparse: shift too big (4294967295) for type unsigned long"
> > :::::: 
> > 
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > CC: Andrew Morton <akpm@linux-foundation.org>
> > CC: Linux Memory Management List <linux-mm@kvack.org>
> > CC: Michael Ellerman <mpe@ellerman.id.au>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   51551d71edbc998fd8c8afa7312db3d270f5998e
> > commit: 98d56389a5e38b3801f2762d6db67dab6536032a [220/293] mm, treewide: redefine MAX_ORDER sanely
> > :::::: branch date: 17 hours ago
> > :::::: commit date: 17 hours ago
> > config: sparc-randconfig-s052-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240107.qf5g0qKq-lkp@intel.com/config)
> 
> CONFIG_ARCH_FORCE_MAX_ORDER=-1

Sorry, this is another buggy report related to ARCH_FORCE_MAX_ORDER. We
are working on the fix to avoid the wrong -1 value.

BTW: the mail to oe-kbuild@lists.linux.dev is tentative one that we
need manual check before formally reporting it out.

> 
> WAT?
> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov
> 
