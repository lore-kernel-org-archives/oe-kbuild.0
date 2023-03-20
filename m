Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC81C32;
	Mon, 20 Mar 2023 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679327661; x=1710863661;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1QQtvAeTM9j/+Tx7gMwDfl/kEyrL7ObcydT0LJn8Fps=;
  b=nLPw4M6mdPwnXtIK3N1QO7xOtSWtojfjswAmIRvIzkXsmJ8/Gn9gb8qZ
   pnDz9dcH5HuPf2M58W/zkOpHJnxDK5bEsPt+30egh2a/t1AipuhTeJn3U
   rZNGyeUYTFnS6HsZMdO7w9IUtNEdwB1S/hAcHWlgT8eCSJ3fm8nbx8XQL
   1y4/YGC4RMik2SZ6LBMdQsaGzLNKAR6Esuyo3aMyph/R/XU2q8hGYSAV+
   kjQzD7FiQ0jkm2RQddJZgJFEo5iCTj1ygc1Ste2jAkwcgFGo2Sd4XX9wx
   RqQVbW1imtvxBo2dZ2Fex9yQtcYrN2uwoBnoMwZ/iIi2TpZVHsD/1Q0Tf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318348836"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="318348836"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 08:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855317217"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="855317217"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2023 08:54:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 08:53:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 08:53:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 08:53:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 08:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/UQ3N+Lk0NTCD8jq1YDtGT6dh/rY0tXw71Qzdfef//ZqlEzEVxjkutkNN9C7Y2q/8ILk5NPNGP9xMbsGzTQqlbsV7EiYerQdFsOyiVwUi8l0GipmbWxkAQpLT0Q1yINUvKHCWD/Zyo19CpkQZSTnxt0uFonrZmzI9J9YGs+siL5PfySbTe4OgpUqyW2q1+DdWH0cvKu2iIx58mEg0X6liw3LLFfWunKl8wpSYbqh+T2UW820dbDZU6KPjFLvBVSZweSME7hS8PxrognsN2/F2zT5Ofot6M5PU3WUn481gR1LImKMdCIcHOW9DtgmxKG7oqjDFQaBVnNpdo6KQ7hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV763nqBWsORUrfluLDY5P47599CBrmznFO9o9/2vnE=;
 b=Q+i/sefwbarbmaZGA7BdhgFFpF1FCe0/QssEL59aH9bQqYpq5RDHNzhJMeCw9I0zA5Dh5uno1Ojh3Mzc5yNyrQ3cMaDcNwS88v+e7F/fsnovtr9KYJqbY2Zu37oT4Z0kppLVFBg/pg2NRNMReYOB5+VvoewlkbfLc6S7jVIKxCooBzcAgq5mD3G5lH/CjNYR/eLMznSrOkoU1G748fWEnVTlsL5pw129CYkWXjgLzHF1ujmtQlxzDeK06rW2ntJm8eoVFsNbKgSmq1ymIiTX/eKSTY2hBTYZEJBQDng6xsFeAvAAgzENNLK5TCzdkz57daoXKoY9x/LqVp0U9OSRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY4PR11MB1862.namprd11.prod.outlook.com (2603:10b6:903:124::18)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:53:25 +0000
Received: from CY4PR11MB1862.namprd11.prod.outlook.com
 ([fe80::d651:ac39:526d:604f]) by CY4PR11MB1862.namprd11.prod.outlook.com
 ([fe80::d651:ac39:526d:604f%12]) with mapi id 15.20.6178.037; Mon, 20 Mar
 2023 15:53:25 +0000
Message-ID: <ea6b0739-61a7-0267-bc3b-b9218dc9c89f@intel.com>
Date: Mon, 20 Mar 2023 08:53:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 7/8] vfio/pci: Support dynamic MSI-x
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
References: <13a125f5-4481-46f4-b809-a90e35e1a561@kili.mountain>
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <13a125f5-4481-46f4-b809-a90e35e1a561@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To CY4PR11MB1862.namprd11.prod.outlook.com
 (2603:10b6:903:124::18)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR11MB1862:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c68a236-4b12-4a60-d055-08db295b3d2c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbLG+Th16A5ktOxsv7ZWxU7NV3H/EvwHtqEt62vgwsp7bvRxGD2XhpQNCWSPN2BNF+6QsXTkafEZVjVMu6Osy1cG8X247aykQ+rrMrLIp+SXOz6SecXjVPGGuiILOlzGy4bzXteJMyj+mWaEbAlPAy8vCRI0cO84EoumTx8Pbbc/iSZO/PCTrlR0IPsJc7R0egLLQ+cJDIZsjVn1YjTTXpu82UeHnHUZL/e7G4BKK6ZCKeEBU6/2zAIM7QtWuy12uCG92UVZgujfsVueOH32xHmkZkRdvfYApJg7l+KLnboEs9pVmaIst31SozhowrTXsYqkv7Wwv3pn1RZxhL+d3fgfcGNEAHYEpeHQTXUqe/CSJx0iKs9VPsHcs9wd7Nx2I8YJG0D0iYaqzJzjryZsaJ9ql3YX8nf27hp5NwW5caaTMkaxPGC320dF2sq6m/03ycBx/BeepQnNne2DiYLJggLVxywNYRtJv+wgwo948MZcygK4NUsp8AOjdWxauU1AFG3515BrNkhdn7xEDtbG2PtQfr+XqSiP3zUyV3UvfElWpom9FcMTGnLiRgCqoEa5KH9ZTeI1CBP8iVdWReM3xWQh/w+Ma1Ynjq0a11w4rdQZ5mchtGH+ThYAVnwzHEMkc3Jp4z+Pt3sMYUAIYeuqMxetakJQH3PVU+HfHsS3GzPX00DVI8jVr3iDE+y47HkahsnKW9JLTfadBu0tX05D5I6R/cF65IaAKaLWeO+3W0fJUhvrmaCibbngLtxPTjzJEYMYrl8jMaLhR0ctLvNyeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1862.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(6506007)(186003)(6512007)(53546011)(26005)(6486002)(31686004)(966005)(2616005)(83380400001)(316002)(478600001)(6666004)(4326008)(8676002)(66556008)(66476007)(66946007)(41300700001)(8936002)(36756003)(44832011)(82960400001)(5660300002)(2906002)(38100700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXdaWEtBVnRncmRHcGNiTnJUT2p1MmRCV3VRY3h2azE1cmoxMnFVQWM4T09k?=
 =?utf-8?B?STNhMWZuOE52WHRVS2dsRGRKd2I5YWpSUjRpNSthaU1UKytwWkxOUG96c0ox?=
 =?utf-8?B?LzloaHJHZ1lYdkQyWmdNaGd3Q2R0eGovUlpzY0JLeDBySHNsa3pXeXM0UWJQ?=
 =?utf-8?B?WGdXVVJIRGUyQWJ5N1dzQlp2bVVsSWk5NkViMXliekF5RVNxQkZxN05lVmVX?=
 =?utf-8?B?bE1QdGRub1dhZDVsS2NVOVdoeGtuNEdaWXlRZ0lkRUNmZEZTY015c09JdUdE?=
 =?utf-8?B?UTZ4RnZjV3RKL2IxYmZUa3RVN1h2ZzUxVDhzUlBYdkVaclI4S1QrV1FWZ2Zh?=
 =?utf-8?B?bWJkVFc0YVQ0WWZFbmFnNGJsVGcwb3VjRVdqUmZwUjdlL1NVVjZiZmVscE5l?=
 =?utf-8?B?Z29aaW1COFJjeXRDZDE3VU0wc0RIZVMwUHpPdTcvRXo2UGVtZ3B0ZU5iTFpo?=
 =?utf-8?B?ZHRwUjdvcmdUNGxENU5KdG9IZGlWQzdHK1MzVXF2Y1Yzd09oR21vTHdoNGEy?=
 =?utf-8?B?OHg2QkpFS29sK2owWTFucytCdWppQ2lXZVczTHpVTXFZYk85UlVENS9Icjla?=
 =?utf-8?B?SGdrVFlEckdVcFJ5NzNxSDVUelFFcW5JMzhZMWlVY2dtd0ZIT2RBQmpNQVh2?=
 =?utf-8?B?YXh6Qjc4ZCtEd3J3NEl1TGdKSklzeEdDaXNqb1ZaY2t3Q3lYSUQxbklydnJa?=
 =?utf-8?B?cWNoRlQ0SHk2R3hmYkpndUo3aExkZ1VEakZBNHdLVnpBYkFPWVZqQUJUZVlN?=
 =?utf-8?B?Mi9YVVN5ajJZQlA3TVVXVGw0bEVJMlRCYmU1L2VNdTYwem1kVldtclBvTmlN?=
 =?utf-8?B?UFFOMWJjYUJPU0dHME5RNnlyMFcxRXYyZ2xNc00zc0ZPZXlFdVRPaDQ0Uk1Q?=
 =?utf-8?B?cVpqK2wwQWlhWWlQV1RQQWdWdU9UQVkyU0xsakM1bTBWY2x6UHVpenFFQ2hD?=
 =?utf-8?B?RSszV1NkQjR5RTFTdjkyMDlqUlNFQ0ZCMmhJbmJwZE5jbkJBV3c2cGliYlVV?=
 =?utf-8?B?MWc0bGJNWUNjeDRUc2U5KzhBcE5JMUhzTXNQVDRwM3FGdU9KT1lIbXJSRGdk?=
 =?utf-8?B?YVV5VnRwRHhaODhpNHdSb2ZIVUxJT054OUEyNTRpbVpKT0FmYzlaRnRkMkVO?=
 =?utf-8?B?VjhoMlV5MUZTZDcvM25zaUc4aHRIdXRvS1lDeGE0aStLbVBjclcyVHkrM21x?=
 =?utf-8?B?OWVYN1hDcFNKRlcwNUVLdHdySXJyVk9VN1ZEQ0tNekJRNDJqZEMvR0hKR3VR?=
 =?utf-8?B?SmNpRm1GMTB0U2VzVHBuczVZYmUwNHBDL1JBN3Q4bFNpWjd2ZlJOb0pJWitG?=
 =?utf-8?B?c0F3QnhiNDB4c1Q5WjhqV0R0RDlzUVRaUG5NOGZyZ2xGeFJGVmNmYlBzZlEr?=
 =?utf-8?B?a3hnR2c1TEhobjB4d3RYdnp2OWFTU2VaZzR5UW9xZVJpUnNxazVINDBZbk9K?=
 =?utf-8?B?QUFKc2hjaGs2TFhhUi8vMzFVb3NIZmNJdFU4S2MvSUJ3Q1BSRE9hSVhHR0Jr?=
 =?utf-8?B?UEVFZjA0TmdZVkdXcU1NSjMvaUh5ZmpZcGlQZU9qWU1ITEJ5MTZFeGR4cEtQ?=
 =?utf-8?B?cWJtWjQrS0ZoWmpmSC95THBybTNpL0JETExEVVBIR1EzTmhvOEVJRTZubkZH?=
 =?utf-8?B?eTdJYys0MXZSNXl5RUl0N1lMOE1nMHo0NUNjNEhMTXpMUzQzRjFYVVRtTUkv?=
 =?utf-8?B?dUlRa1ZhbU81VzBaTnB2bUpHOVFMdUJPbFVDb2tidEVSS1YzNXpVQXR2bzZ1?=
 =?utf-8?B?SFRCWjhQRE1NWVZKSkxkbUdyUVFtMm0wTzVLZWd2L0VBTlEwemRyaU9kQmFu?=
 =?utf-8?B?Zkkzb3pxMzliUUdKYlozWUdpK3Z5bEdGWm9nMjFFTlJPaXFDS2FZN2grd0RG?=
 =?utf-8?B?dFRodS9BUDJqM1FMRnpGc0h3RnN2Y3hRam5oMWVxZG1Rd3lkSnlVVFYwYU0w?=
 =?utf-8?B?cHl2QnBKdFRsQjM3REUrcUZ5Y1paVi96MWtsMFRJVVo2ZUZrbGNLNzllb2V5?=
 =?utf-8?B?eG5zN2RFUy9WR3BhRUgxUndFVm81NWpZMFgrNUg3K1BmcE5YdjNxd0pPY0gx?=
 =?utf-8?B?RE9nS1JDZFFCMGozWE51dk1vMzVxTW83QmphZ3dDRHdHNS9FUUZvNDk3NzhR?=
 =?utf-8?B?STlQMXlvSGl2Ry9oVHM3K3N6MEp1M2tOZmtPeHpWZStyK2ZTVFlqSVFVK0xi?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c68a236-4b12-4a60-d055-08db295b3d2c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 15:53:25.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsCeyw1cMbBxk53FHsItg0gnsZyxDI9ilRz9rMfoV13Td3SO6Pi+MRauUh/QpgYRNeMCUw0nG9IUvalHA/oKGs1LOkSvY6DSJ5K1eQGrmhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
X-OriginatorOrg: intel.com



On 3/18/2023 12:40 AM, Dan Carpenter wrote:
> Hi Reinette,
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Reinette-Chatre/vfio-pci-Consolidate-irq-cleanup-on-MSI-MSI-X-disable/20230316-050150
> base:   eeac8ede17557680855031c6f305ece2378af326
> patch link:    https://lore.kernel.org/r/591ce11f4a33e022fc9242324ebdc077202bedaf.1678911529.git.reinette.chatre%40intel.com
> patch subject: [RFC PATCH 7/8] vfio/pci: Support dynamic MSI-x
> config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230316/202303162207.6AD9wdJd-lkp@intel.com/config)
> compiler: ia64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303162207.6AD9wdJd-lkp@intel.com/
> 
> New smatch warnings:
> drivers/vfio/pci/vfio_pci_intrs.c:557 vfio_msi_set_vector_signal() error: uninitialized symbol 'new_ctx'.
> 
> Old smatch warnings:
> drivers/vfio/pci/vfio_pci_intrs.c:569 vfio_msi_set_vector_signal() error: uninitialized symbol 'new_ctx'.

Thank you very much Dan. 

Reinette
