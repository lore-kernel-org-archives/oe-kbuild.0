Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECABC493627
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487864; cv=fail; b=U8rLce5R6o2+ylAxinUifqzhiJeVg0eYTSuu9I6ypwqmuhQuwWy2d2UTO7+FVxeYp1o8b1fVNjGAEl9k4Mtq/Ippc8h26z9+gFfsTS0Jks9nfrzwHKDsyjmj+e2aqt+WLbUn45+ZC1um7aZY+iN5LBP7Vh6Cok/fWfsqA7gJXK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487864; c=relaxed/simple;
	bh=21yeVZfmzQZZpTIM4uVGoeV+yrFl8Fx30/Yu1RBtXd8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=K3eYv7nAxJzy9zsFpWEu568eSFpwsAxMu71d6jam0ed+OiwOjrXQ0YAIhMPDBlBrsnfqsHbxFSuOaDjRsLtck6mFrKtd9cXoPnaHArS8XkeLnSEm5KffE5dQOC2mO6+fIkejpJpmx5T/gHJvym16jU37PjfmIFS5cSncjTmINdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP0D5Mcb; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP0D5Mcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487863; x=1819023863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21yeVZfmzQZZpTIM4uVGoeV+yrFl8Fx30/Yu1RBtXd8=;
  b=cP0D5Mcb7SQkpQM6Fa6+ONArZkLhm5fHgUl0I1wpma0npdr41jjSkTk3
   4zEbm835aGOXNkRVP4tE6Iz1Z+Fn5R4hLf/fz2Ib4BObSiqt8sptRQ52W
   AQ+5wvQm+xziyx+xzMp+zZAQbcyFB/Na/Y4bMr7+ZLApOQ/pJjPToQtQ9
   W3m7IMDsfOqaxTRsqriSif/qbpVJJfG+XhI2wczgLXCGgWwou189TwQh0
   BLopyS5VYEIyrurrDgceVwYSx4Qihqbz9TlNG2sfspHI2beZgjm778/N/
   SABWb4ewzrTOWyVD8DDbyct9cWvzhu1EBGkLIfeUxL3k7FERjL/bds0Aj
   w==;
X-CSE-ConnectionGUID: cjogHxLUSvqv0JqFMyXodw==
X-CSE-MsgGUID: IuWDN0gaRNa//QFp903nBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="99120282"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="99120282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:24:22 -0700
X-CSE-ConnectionGUID: d+WPYL35R7KcvgEvDI+Zkw==
X-CSE-MsgGUID: eunRLmdtRCSNwHvE2a90iA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:24:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:24:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:24:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:24:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXVyk6b5n1KPcXuOtQz5KDq8bWoRJLfS0t0a15FP/xn9W3H4718YwZfI1mvXemYAjfeGLsBx6SDrzMzJ+Kpw3MbJEqbhnnfFOBrWiHzvDeB+p2ZOitzn/CCqjFYwKHjtHFrXuIsaIKDvQitf/CaefmvIUnDBV6pwi5Pvf7ExPDfwQlR9oSRdtHUYN3PImOE7xf7jCg5PoTeeGWsSyBft90NF20tDd5vzvw3ciQ9RTIMPSAhGuz+E0yRjWlOxIksbgJteLEBgSeaL0VLBN2eSENdj4VdVEFYb9XoKcgYNp8wd+xh/iWfeXFLPVapYr9oVNTv1hJ6M33WkxERMxBqIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOBgDJ7kmtKXcDPb8V30o101JsO87mlvhckyI7ef7ow=;
 b=bED8VX8EOvkCFEjLfNrnUrwOmcZF47Lq2Lqtkg0jO81s7/zZUROGGcGHUGJOvNWHX6RFylJNjZzZf2OP621Z/F5ZR4khKrTUqqcJ3usqmfOloJce5sUMyI4xay8T4rn/E5MbknYbf2sBSjK+kUPRI3wArXnRaYZBWZpL5NNVaFfhWgjz44SZHdsc6REn/AKNuTn4AdbvjqnrImCstdK9htmHG5X0a/gD+C5tMumHINGOWCDOU+2Nwkk6CbkeKAkZfjK4yBrMpuEyOtPTSyQwaTtNwttoHIUBxVuSO7UrPT43RfAL3Bd1O7AbKJzyId1IwG10kGyiPeZtLiDDs2gs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:24:19 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:24:19 +0000
Date: Sun, 23 Aug 2026 20:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: [asahilinux:tbt-reset-wip 32/36]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000: failed to
 match any schema with compatible: ['apple,t8112-usb4-acio',
 'apple,t8103-usb4-acio']
Message-ID: <202608222156.wttVpAWq-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d90a9a-ff26-43b8-0ebc-08df01117449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: oj4qQ3MZ3bdthstyKnaYOnLGUTPrMuDrFG3hSVkChPUc5lU90zopySS0Wj/x1eSa9D5L6qnxZIcvKolrn8TJr/rPVHrOftnYbfCpZaOWc7j0RQiQszxqM8xrG+mptWaUKZnlyuyTib7G/CdKwOBCMutiMmRRcXdo9mVpIkFUGTy31m/AqL38FMlRYyNIqn714nGaXB/wJLGN8p7LLdVrzlNVI82sL8GsZQ8X4Rx9GDtyV4Ik5BhEBt9FP3g5eQUJGAAKUH+1vUHCDA2xzJhwEfV6Ovwpjf/xKbsZkE1o9JobTVUcQd9KAEXbu6Ly3flteyr7yaK+hcd97VclrUkupefSSnkhdLw42Kwzbsh0FPJBzqj5napRBOb/wu61Gxb7IMkb1T3viOXGK3uodM1tSwKFV6R6DpWDd8TwZ0PvVd73HahjOgizlpjyaKs4ztf25Wu55FfxQAoVWgYYdX74ZmH1ID8Giumebn6ukS0leY426wZNHU2qp+LRcZIRR3ntvltydVsTTSG8YHia93bmc/q3P55ZIS651q05DEmXenQJdD9vB1rQeQ3bGF65/6GM4pUiPRH62SyBwa8miWqGbOeqc+XzqWN+0E21p9jSZvJpYYKJ1tWL2eTitvIzBXvLfYcKLF8jAaztyi4vLAtLt60Kg01rDpFE9r2cW//jhhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8f0lQHg29ptdap/sYYegh2W36Bs9lEBXszJErSHDxpYN0sgKp/wOhzMvlpyK?=
 =?us-ascii?Q?DBGxzjzyPQWgzqf1dq4HDtK9+OlDMTt/g5qSB8h7BAP5tNBNZtHrU6eG+Jbk?=
 =?us-ascii?Q?mdqpX/OjRXSjPnXKVLLhQ4fqJhWrfUiKK7AoaOHAZbdY0kYz9sKyvQGcqwve?=
 =?us-ascii?Q?01xVMGU0yvYDklK+oY/Qw4+BgzL+EZVJazdkM9+W7j2R/6CNMExM339fPOMv?=
 =?us-ascii?Q?Sovfk8ISb4Wj0retHR3LorwWXPKw5XxNK/TgiQwHIOc13QzhPuPRTdUywCO2?=
 =?us-ascii?Q?QsAPtUlX11HaIPoXntERJ8K8eeJWWYViSBXLZe6BF2u4RT7hkZtwOQalZsrA?=
 =?us-ascii?Q?lsjv2Xbx8aSfBCtE0uNmu9jniWwCj5yjgng39xM/ofXjiJKZQrKqk52hRMQQ?=
 =?us-ascii?Q?4Bm1UoWPiC+3anz9GPMS7btVwIhAWddmC2uNtAPAn0Vjb6+8KJqi0TqIuwu5?=
 =?us-ascii?Q?RLUQAiAng8UtSqp5VrmTYhMENSkFDwB33N6MKtEbh8tODmdziuKwePoMLU5i?=
 =?us-ascii?Q?2o3syHz6pnjGpfMa6tXhFQLs+DQkKcUh501gr6atz0V6RDXzHP9ZHRhv9w/+?=
 =?us-ascii?Q?St6qMh8pLcEuLHM/6u6nm5+JUHAgqS5ADhlN3ZCeJNOWPKEFK7TgyWUbJhh3?=
 =?us-ascii?Q?OBxuzrV63QnKdPKZK9V/qkMTxFTW0ZQiSq8cXyrHKNvzrp2GH81JJvGX9oLJ?=
 =?us-ascii?Q?+s/4R080Ul3O5H1UBVuVbANJ1p9DQtvOjq5YM0zohOrbhA/xYmcvse0Bkcad?=
 =?us-ascii?Q?wgcGMXm78ek5MSu4P7/42JiPaNwxjkDS1YyDZpadfQXwWnUdV+duSpL1Kbh0?=
 =?us-ascii?Q?Eothny/PQtw/u/ixRl2shQwqYOGnnHOzlCI73bjmC/GPJ0deMoYQvQLddZWX?=
 =?us-ascii?Q?xow7lQ3jWYVCPMhoFhLrN7WRV+T5Iqnz1DpjLGar0X40eC4JsNpR33CPtGU+?=
 =?us-ascii?Q?TOntfxzE6u5MLqsSGL79dxFVPO/tb9gR+qqddrnF44n/z0/dNUw65Nwjo1Fu?=
 =?us-ascii?Q?P/Mxg+M7hylroRhCjgYnBHLVFysZsouxHrXNmMdvplBaTPs9OReVQJiNs56q?=
 =?us-ascii?Q?oqexIZLLuf+yHqVS7NXhJXoMsDoFuotHabKlA3aJ0ial+9E1Bb+BzS4utFPX?=
 =?us-ascii?Q?losC7fOMTPmyDuQOm7FCaZWK/MKzDgGMy1xLDQa9iBHT3v0SSTwBkL4jh9db?=
 =?us-ascii?Q?0TtBplv6KufloMVaaD2nYQmYYN6pRfG2lccjCtVnIuQKax6xJe9HS8etTtZ0?=
 =?us-ascii?Q?kB1WgwrG7lMi/emVulYWv1uI6t5F3NcNALQdayFFj43B0xn4j1Kz8u7wmcuh?=
 =?us-ascii?Q?VijgXgrH5aZR+JyMwNQPGGmQagwJ8bnBDoYymSpYXpfYhXwVZEpKyOU8qeDW?=
 =?us-ascii?Q?kQUgBFtMjiYOhO9cyyO2plTqLtp3UTtBninEslbKoxGRvihIZVhOGauQ4hTt?=
 =?us-ascii?Q?IUxs4QX0LT0GuLZmbNY3GktHvzykF6dLIYrc+zWkwb4qHRtYi2WWA80Hbtql?=
 =?us-ascii?Q?b8E3OpVqv4K4bmCJQdtzQL/BLbAsLOb/ztOCTthmDPhnuXnpPeXUMbJxlZDr?=
 =?us-ascii?Q?XShpTcj26MnJ0XjMEP/RZ+mfrLolyx4plTFMBAMOMr7tXFmQGXj/2dUhW/0+?=
 =?us-ascii?Q?DEqhVS9HJgmHOAUQKoi9BmfacwexK3lz9LyQmg2N9O1b+v+kh+kTuN94ZtrC?=
 =?us-ascii?Q?teTpjFS/0kFEvl6Kr4oKdH7u3OhRE8EPSwB0/4Z6zByccVr1zwJ5xRIpP9mK?=
 =?us-ascii?Q?8o5hteboLg=3D=3D?=
X-Exchange-RoutingPolicyChecked: vfyZAfMhzkvGCaUCr3PSxjaG1lHC67MZvb2Itp6QvZ8mTxcXtwbSAhoHHhNSf/v/xVftFGXCCuNy/OrJIuOSEPWJsKXLByfLFffbqCl+NILdKzH7TOhXOAmt7sfe/CtbFq2WkjnStnVgCiAd6wiVboH6blVdxM7WnCy87FS+iZm/lcLVZvyNdFojZK9v5slNpxfRzi5OdN6E4phXKOkjZ8ZgpgzQP5JoYU7B4jLc71x9vjjnvQHsHEa/5fdIeYAo7vo367QOpEEZWs+aQvhcWdj1cnUYxFQ4dThNjkNBImQt6fI7PyxWdRss0+XbsaFDBNI4izU84b2HiNuFFCmIUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d90a9a-ff26-43b8-0ebc-08df01117449
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:24:18.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/DtHK4m4raxB87PewlyTMnDIjxJIlyfY1vu1u3Dd8Gjzho8/SScB6We37yyP/N7I56Fbd1fFaadEhtvFS8hTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   f42b9fb4248a76449873cb91cac2696aa1df9818
commit: 825f6170e9ac79fdffb50550d388e952a7030631 [32/36] arm64: dts: apple: t8112: Add USB4 ACIO and NHI
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260821 (https://download.01.org/0day-ci/archive/20260822/202608222156.wttVpAWq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project f39d58144cb1dd40c4135af6ab2ff17ffa3d902b)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608222156.wttVpAWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608222156.wttVpAWq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
