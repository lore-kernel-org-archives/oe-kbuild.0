Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793902335;
	b=TvxHUf5Er6vte6RXNhVNYQyUqs2Vi4vaGNo7nDHbdDajuwpX7TYeO0leOBu1M/7V0ICs
	 HZwxneMoEjDqcVMJUC153uCMvdzopPAKXh1p6g/QcuQPfIvd0TwTl4T5bO+x8QIEqlVYd
	 SSE1boxYtSHl1vrjhuxtF3RH/F0QW1/ioRJULVbFrUv8t6Bs1Cp7VGRHUwbRvhQuh1TqD
	 gdvai+flTzdZmOfJaY8m/afTvvZRA6wi7dgcWhtxXbzDI4OsoIZWpvxLELAhLzvgA94kd
	 J6tgIkH5KYAi4pP13FrauYD8akANAHzvygt9RxxQDr/FqUOEFYoF9OeR9H2cCxQOqWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902335;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=lf5EvLIyFi2g1THk1/BE6CN9UZk9V4TueNumQxr5aqo=;
	b=B2+zP9lVM3JZW9kmDuM4u/iEu+zda/8l2eoc1E1Dm2x6dPUXzZABztnStq17YqaEFy+n
	 GPeoWKw9cRkh8chyqTWw/MdQha/8lBcPs9wS2eXXXR5LHBjeb79PP4eZpBQMyjT2zRiMG
	 1LO5Y9B2s5a3j2PsNpydGvIkjktdgZwO+YjHRVlt16D9f121VKvLUfM1TqLWrpQFcCCwI
	 d0v4AyMLgNFT3RTGc+gxxpYDP8RJjdlxc5cXNnUYJBZAIahWbIKpQdtXjy8kxVyPBnJqX
	 jePNslNKrNKJtOvdyDxXPnOp2w1CR2AmkFkxtbr/ddL1UdBqVhk3vB7acZprBAb40Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bbc1heRY;
	arc=fail smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE61606A31B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 18:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE61606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bbc1heRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793902335; x=1825438335;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2UPAfkstYwuE+rDjhu51vIzXYmvyvTVYlYBqcKV9yMM=;
  b=bbc1heRYvJvGyr6dDj70gK8tK+o6/JluL2TqjqvDSc9v4wtrCyChxFC/
   /46xKqWpD1C+vkPOUPHX7PhOsOedSdgf98vifbHBzHG9qhngaz5TuQDKK
   NT/sVVT+N6ccutK5a5WM4/Q+V03si/8IJo196HyUrnH7vgrwKwwWekN7v
   Tdht4BHxXlbX8/357SS3b4EkE5GlwQgoF9SejMGG+bKzz1Kk6C5Rszc4I
   p+z1zaxwT+uwgWSBerWWbmgByQqq4I/y7+no92Tfy2CkoTlbHZDyAJdOm
   kQ3pmzhASNTeF9tw/C++SdsgqZYbDfp6RGYkrggdaT10Czb+5qdZirsuI
   Q==;
X-CSE-ConnectionGUID: KJ8KaMFbT12DQyIm3GnytA==
X-CSE-MsgGUID: t4qOxC1wRhiLfpMgdnde9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2742021"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2742021"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:12:14 -0800
X-CSE-ConnectionGUID: pal/sU2UTyyxGGy4DAxfNg==
X-CSE-MsgGUID: uhcSQaNYSfG9/3mG9l+RDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7402366"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:12:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:12:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 10:12:13 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:12:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bamWqygEuD8nF7d5JcwRPJa7dCLi70NYhuCWDF9IQ39tRaOjzUR0ucmDrn+tYIxpGBsd+85Tpgjcr+9LfSY0Yp5fEls9yzc1GGQVDj6up6hZyL2KQCEMXdt5LmOBBzETKKIc2vPjnCFVzkZGbwt2x8EhSMMEEfAxL4db5U61BcpcTBFVRwHc4JNGurFtuW/7kzMryMT25g+S6Gl+eDzqmqAwvB6xaYImYNClS+VomRdQiYElASPZQWKal9F+y/0bx7/gxhY/IkYAfhKQzNs/jJ9bFMoSnFvDU2QjTUXhGHhm/GZu8JIignc3D1wzy7bnYM5fFNz2QdJJf6ApqTnUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf5EvLIyFi2g1THk1/BE6CN9UZk9V4TueNumQxr5aqo=;
 b=m3n+qabqNLRbbQJe2zSbn/bDMeCs9ixexpJy0V2kSDo7hLboZzPjDizRFhp2Dp3tdlpoA0kBh5Dn+DT4j8Obzd+0vlz+Zk50LAXvRGLgMPBwfVxJg4OSwBxxkIVhXEZUtfUoRojDfoza3jPz9OMqnRkw2XbUkj1mZOQLD7nJPylQn+XEHvMxqZgQ3YHvRzTYGdGy/ESL0Otkclva1xEp3K9HpJ8zf62CovYjMyUvR0NVRl/gVtI846G36wWaVTmbNHoU5LGne+uAkmmyY0nn0x3u2Ah7fquSzIpc4qlauV7fFrPFTTmTRdLbPPJo05+oNr53ExfxqZikECrYBg9buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CH9PR11MB9927.namprd11.prod.outlook.com (2603:10b6:610:344::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:12:11 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 18:12:11 +0000
Message-ID: <4faa2237-2b08-4c4a-a700-900c244ebd70@intel.com>
Date: Thu, 5 Nov 2026 19:12:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [alobakin:libeth 2/10]
 drivers/net/ethernet/intel/ice/ice_xsk.c:905 ice_xmit_zc() error: we
 previously assumed 'xctx.ts_ring' could be null (see line 898)
To: <oe-kbuild@lists.linux.dev>
CC: Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>
References: <202610281121.DETM1zSp-lkp@intel.com>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <202610281121.DETM1zSp-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::24) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CH9PR11MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 031324e7-6118-4cbe-d1bf-08df3b684fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261026140227099003|56012099006|11063799006|261026121527099003|261028144727099003|261022105027099003|261009223027099003|261022075727099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 7d4HU9utQVBF8OfFlnasimOgMvo1EOKV1YqoR5IRprdiHfUOVkNbD4JKpFS2t0GrxQcWxPqsY+oHPhyF0auIxASJmUapMaQBYCHVPuQ0LJ4z9qOjoWggLz73Ok18gfwY0oKf/tH89IoZ64YKxVBfpla2Z34SKtboi4ga8KWtzVIv/I04NoWF0Z45SjPWRUf8h1ugFickiuKbS8orYJJsAFVCLEKBaTOc95UvZ/G3tJ2hC9+BZqnxxmQ3IlduMROmlxIwAR527Lzw3Z2UbGGyLXTOHJn+odZG+21QFK6rg1VWuqNMypI8hiltz9cLHU+RVLkQji1IpwnT8ZoHYUYS82TX/5oUDWG867dTcWFbicYY7RDtMXRBQLSqY/cbaZ73W4n52WntYhex78vwFhlP7iTxgrPaQbkYg9C37yhvTlpoAk8Xlfa9knFGByRVDcblvZ3s5eDV1zwJSuSjVEgmLbEfDv6GH7/bYuD6pxOFp0ebLC5IqYsJ9K8IgazmZAk/WGaWEBJ45GFFw8aeWL4bcE+jGkfvB//9RcKvW9oglMEh7oWblononYTecKHZ6FBGOlUg/FG2uJRoxGDIIJvh4kiti9oWjXW2hj6IlWk7qEp9OLZQppmm8hUIQjKAhiIF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261026140227099003)(56012099006)(11063799006)(261026121527099003)(261028144727099003)(261022105027099003)(261009223027099003)(261022075727099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGU5di9JR0ZMTGZQVGp5NTdmK0NKK3ZjMjJTR3hnOWVidGM4RmJVNGR0SXpp?=
 =?utf-8?B?NHE4VzRRYkJZUEx5TkxFZ1NnN0tZdmY2bzV6aTlYNnJsdm85b1lTYTR5YWNN?=
 =?utf-8?B?ZzJvQUNhejIyeHN4LzRKSXBPKzhPUWg3ZGpicG55eHVZVWRlWFBSTlZ0NVhB?=
 =?utf-8?B?a3BLTzhYQ3g1YTFnR0poS1JmTjJHR2I4OERIVHcxYWVGOU9ScERvcTFOK3Nm?=
 =?utf-8?B?TndyUWxPS3AvWW9oTzJkRGdHNXJSR3VSWmNmaGkxYUk1eWU1c0pUVUZ4bWZs?=
 =?utf-8?B?ekh1L0JZVktwbVNPd1ZFdjZvdUovd0ZOQ1lqMDM1d2dJTERJYktVemNTZDZW?=
 =?utf-8?B?U1drTEovRGxpNHU3OWIyc1psUThzU1RxZGhoRG1OSDNtNER6Y1hONlhKZHVo?=
 =?utf-8?B?Umw4UC9PRm40cmdpZjFFVW5iQjFwcVBLOW45aFhrZ1pkZytrN1ZBZkJ2Z1Qy?=
 =?utf-8?B?UlVTNEhXcW1DekZBelFPeGllQTRSNkZnd3lhU1d4ZUE0dituaWFKcDREcnc0?=
 =?utf-8?B?dHJXQ1g3bktWTmpKdmRHQlhnREFvMXNNMjZFU0pLZEJjVytIdmgveUNwT3RO?=
 =?utf-8?B?Ujk4THZrTEdZbHgxTnJYSEJ5cUhKUmx5ZXNyaE9WYzM2cFBMNmhPdHAxVnRu?=
 =?utf-8?B?aEJHODhvNVlLQWx2L0NuaUcvTy9PZWdKdjUzS2piemlJZXltZmgwMmdYTFNi?=
 =?utf-8?B?SEdZNmk1cmxrTVAweGJwNGZNUS9TUW1FUjNHZ055S2xGY0F2NFpnNlZjL3JX?=
 =?utf-8?B?YjVpaHBkQTRGMzQvQ3FMNFExNlZIYWNwR2tGVmZVRXlMRWdyQnZQeTBDY3Fx?=
 =?utf-8?B?a0tUajRmSDJnancxcHBLWG14NmpiUWN1VzNwNHZrRit1OEltbUtBbm5ONDZl?=
 =?utf-8?B?bHI0ZkVLVzcvMk5qOXQwbzNaSmpaaDRzLzc3RmF6Y2RpQS8wUXdqQ3lkZjBG?=
 =?utf-8?B?OHVNdDJNZjVXWDMyQUpsZU5YOFh3TS9mOXJ2OFpndTVqOTh4SU9SeUtmdG9k?=
 =?utf-8?B?TnV1dmNqcEEvbC82RFNRSnhVajcwWWkvOUdXNk1GeHdkSnltcisxblVsMlBF?=
 =?utf-8?B?b3dVZ1Y0SVN5c3V6eVNyRnNkTTMvRitqdER6ZUkwUEVUSGIxbzc3Rk5VNW44?=
 =?utf-8?B?ZlB4K3ZEWHBJOVJCUVVna01JSC8zV29oaytOZkNFSStUWmFyWmlGdUs3TWJK?=
 =?utf-8?B?RW96YnJiQXB5S3V3Nml2L1RxNVhLblByWnIrSDFGb1Z5Vm5QdW1vUk9VY2lZ?=
 =?utf-8?B?eWl6REwwZS8vWGttcTk4aHdYYWZQSDNkR1M0cDFWMURBUjlBWkJ0VFo4cEhx?=
 =?utf-8?B?dkszbnhVOWNZVWJIMUYyQk9hSUpJTnYxVUxsR3JsMFV1QWY4Qytwcm9udnYw?=
 =?utf-8?B?QnZwY2wzWVlTZk1xY3RCeEpMM2FSalhJOGNGdjdabjJpM0lhcmdkemxDSCtI?=
 =?utf-8?B?WWlmRkwvWnNQMHd0OXZITC9sMnJoQmpZWXM4ZU1zM1poVVNaRjZRWEZwM21l?=
 =?utf-8?B?VTF5SVVBU3RIR1QzZlFmZEExUVdoWWpjYXJhcWZBbTY5RU5JSzB3Ukdibm1P?=
 =?utf-8?B?d1dQWmN2UjZhUzFmeFE2SVEzL01nZ1ZBYUpRbEUyRE9WOExwNTZVZU9hcUw5?=
 =?utf-8?B?YWJIYm05OW9YTEpVQ1VhMnZHSldKVnFhQTdCVEFqWkJORlR5TitMUXJKV1Ir?=
 =?utf-8?B?eUNFY2RQVFlkNUw4THozVFRtb3RRM3ZHV0s2ZzNlSExUZWFaalhmRlErd2lG?=
 =?utf-8?B?SWY2cHRBTldQR1B6ckFCdW1rNFhKa0FycndmdHoxZTJtYzZzdTc2UzFjQmth?=
 =?utf-8?B?dlpDbXRnQzE4THVub2pKUVdWRW02Z1ZXY0ZtVTFGdm5URnlnTmR5Yno1dTk1?=
 =?utf-8?B?UWUyOG02RzVERVcvU1lkUUpMWVc2ZG5JSWNiYkxOMjNWYXhTN3dldUlmKzli?=
 =?utf-8?B?bFVGaDQ2eHdrSTI5ejVhUEVBWUZ5NGdxbnpYS1FzQnhmM0llSkxQVW9aSTNJ?=
 =?utf-8?B?T3hlSGV2NmJmTU5uUmNFQmUrbENiTEtOUTMwdXQ1Q2hUcmV3SmNNeFU2YkVz?=
 =?utf-8?B?SUZ6UWZCMTkrNGlhdzMxNTIxek5wV0t0UlV6ZTFNbDcwYTJvVTVxcjArUVB2?=
 =?utf-8?B?bWZLYlpTdVZwOGR0Vzdhd3pJMUpLbmNIc0VickZBNnNTUWF3cWxRRTFuUXRJ?=
 =?utf-8?B?SHdTeEZKVUpNaDJEcTJlWVFyWXdOZjUwcDMxRWt6ZkY3T0ZwMjVyTzU3a0JX?=
 =?utf-8?B?eERGMS9pQmREMG5xVDlvWXFNUTJoRWhrZ0VGVkE5R0JvSjdlZnVaWnN6U1B1?=
 =?utf-8?B?TTlOeGkzOU9jM0pTWEhHSmMxN2NUUkIwYUhBdGU1YXF0UDZUamVtcFJGMThW?=
 =?utf-8?Q?VQIZWs1bTcICiMoo=3D?=
X-Exchange-RoutingPolicyChecked: d9+eUHFnigfqTcFhkIgz6uDO/IsHlsX9ZJClcpIIqWSzQhznVr/Z5rPsc+fQ3hD+POroUwuZIcwWM8M1uCtHHzbpl3Zlu6Yu4BDTP5u0pNZy2iduxWbhv3nlZ4VR5v24D/jqKUpLvd0bUDtypza+843I6J75gT1BVs4IqPJfrBlg7C7fDhmvcHXK2GmZrtCWzScAP6EcqIB4uPHWjaC0/m0Y93e/t/Je419Gy4jojKA2g4BH/YMOGOo0/uPrtmuin/EoTPPy86xXY17woPNcutdm7ktelnZ9Z0xpvDKroOGAYcZT++YBZyMryhPQu6ua+5643NQFk7ntJPaY76kLhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 031324e7-6118-4cbe-d1bf-08df3b684fe7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:12:11.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7di3KuvrztEdIjmHo41OXU7N089v2cowNG1C2nLPkdd1ItSn8m5yTGmhl+7C985vPBOnDydL7GlsBykK8OCqh1MybRScprmpYJc2EjHN9Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9927
X-OriginatorOrg: intel.com

From: Kernel Test Robot <lkp@intel.com>
Date: Wed, 28 Oct 2026 11:25:59 +0100

> Unfiltered warning: this smatch report is sent as-is and has not been
> reviewed for false positives, so please treat it with due skepticism.
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Alexander Lobakin <aleksander.lobakin@intel.com>
> 
> tree:   https://github.com/alobakin/linux libeth
> head:   3ec9e9b6c3814a1b55faddacd55112935868722c
> commit: cc74882e6f96d8c3ce10cef17b0fb559886f980d [2/10] ice: add Tx launch time XSk Tx metadata
> :::::: branch date: 17 hours ago
> :::::: commit date: 17 hours ago
> config: loongarch-randconfig-r2202-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281121.DETM1zSp-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 16.2.0
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202610281121.DETM1zSp-lkp@intel.com/
> 
> smatch warnings:
> drivers/net/ethernet/intel/ice/ice_xsk.c:905 ice_xmit_zc() error: we previously assumed 'xctx.ts_ring' could be null (see line 898)
> 
> vim +905 drivers/net/ethernet/intel/ice/ice_xsk.c
> 
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  844  
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  845  /**
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  846   * ice_xmit_zc - take entries from XSK Tx ring and place them onto HW Tx ring
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  847   * @xdp_ring: XDP ring to produce the HW Tx descriptors on
> ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  848   * @xsk_pool: AF_XDP buffer pool pointer
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  849   *
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  850   * Returns true if there is no more work that needs to be done, false otherwise
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  851   */
> ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  852  bool ice_xmit_zc(struct ice_tx_ring *xdp_ring, struct xsk_buff_pool *xsk_pool)
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  853  {
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  854  	u32 nb_pkts, nb_processed = 0;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  855  	struct ice_xsk_xmit_ctx xctx;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  856  	struct xdp_desc *descs;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  857  	u64 total_bytes;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  858  	u32 budget;
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  859  
> ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  860  	ice_clean_xdp_irq_zc(xdp_ring, xsk_pool);
> 29322791bc8b4f Maciej Fijalkowski     2022-09-01  861  
> ec145a18687fec Michal Kubiak          2024-07-26  862  	if (!netif_carrier_ok(xdp_ring->vsi->netdev) ||
> ec145a18687fec Michal Kubiak          2024-07-26  863  	    !netif_running(xdp_ring->vsi->netdev))
> ec145a18687fec Michal Kubiak          2024-07-26  864  		return true;
> ec145a18687fec Michal Kubiak          2024-07-26  865  
> 29322791bc8b4f Maciej Fijalkowski     2022-09-01  866  	budget = ICE_DESC_UNUSED(xdp_ring);
> 29322791bc8b4f Maciej Fijalkowski     2022-09-01  867  	budget = min_t(u16, budget, ICE_RING_QUARTER(xdp_ring));
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  868  
> ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  869  	nb_pkts = xsk_tx_peek_release_desc_batch(xsk_pool, budget);
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  870  	if (!nb_pkts)
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  871  		return true;
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  872  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  873  	descs = xsk_pool->tx_descs;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  874  	total_bytes = 0;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  875  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  876  	xctx = (struct ice_xsk_xmit_ctx){
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  877  		.xdp_ring		= xdp_ring,
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  878  		.xdp_ntu		= xdp_ring->next_to_use,
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  879  	};
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  880  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  881  	if (ice_is_txtime_cfg(xdp_ring)) {
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  882  		xctx.ts_ring = xdp_ring->tstamp_ring;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  883  		xctx.ts_ntu = xctx.ts_ring->next_to_use;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  884  	}
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  885  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  886  	if (xctx.xdp_ntu + nb_pkts >= xdp_ring->count) {
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  887  		nb_processed = xdp_ring->count - xctx.xdp_ntu;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  888  		total_bytes += ice_fill_tx_hw_ring(&xctx, xsk_pool, descs,
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  889  						   nb_processed);
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  890  		xctx.xdp_ntu = 0;
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  891  	}
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  892  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  893  	total_bytes += ice_fill_tx_hw_ring(&xctx, xsk_pool,
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  894  					   &descs[nb_processed],
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  895  					   nb_pkts - nb_processed);
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  896  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  897  	xdp_ring->next_to_use = xctx.xdp_ntu;
> cc74882e6f96d8 Alexander Lobakin      2026-10-12 @898  	if (xctx.ts_ring)
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  899  		xctx.ts_ring->next_to_use = xctx.ts_ntu;
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  900  
> 29322791bc8b4f Maciej Fijalkowski     2022-09-01  901  	ice_set_rs_bit(xdp_ring);
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  902  	dma_wmb();
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  903  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  904  	if (xctx.ts_cnt)
> cc74882e6f96d8 Alexander Lobakin      2026-10-12 @905  		writel_relaxed(xctx.ts_ntu, xctx.ts_ring->tail);

False-positive actually, @ts_cnt can be != 0 only if @ts_ring != NULL.

> cc74882e6f96d8 Alexander Lobakin      2026-10-12  906  
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  907  	if (xctx.xdp_cnt != xctx.ts_cnt)
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  908  		writel_relaxed(xctx.xdp_ntu, xdp_ring->tail);
> cc74882e6f96d8 Alexander Lobakin      2026-10-12  909  
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  910  	ice_update_tx_ring_stats(xdp_ring, nb_pkts, total_bytes);
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  911  
> ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  912  	if (xsk_uses_need_wakeup(xsk_pool))
> ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  913  		xsk_set_tx_need_wakeup(xsk_pool);
> 5fa23e0b23fb14 Krzysztof Kazimierczak 2020-02-13  914  
> 126cdfe1007acb Maciej Fijalkowski     2022-01-25  915  	return nb_pkts < budget;
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  916  }
> 2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  917  

Thanks,
Olek
