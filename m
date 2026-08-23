Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E938F951
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487304; cv=fail; b=oyBfa+ebvOxBWtCBqEVSoj+JGpjtU+pk7SYcS3lOK8wxVq+0Gzu8BeZC3lv+6Rasq02uzwIrVWQswvtk3H5v0J217P5yAOVofPJssfHoyv9rNLKgNPXmBcPuvKP1E6hk0C9S/OrnSnBlDz84BgS/ttt6dLZtn2PbQw9R4R9QbE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487304; c=relaxed/simple;
	bh=Tq2a0AxNzxc3TFydPncu6O6JQrPNctVbCfSNHa0muC8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bTUXw6N0JjrDtKsyxwsz0QRKvxtf5UxLrDjIovfcTGzl8P+D3F5lBZn/PQcFRoViLyibHdCdWM6UBNkmr232eiu/cGsJJfi0ZSeYdOIygVvCQciJmd7aK7kgbxm6kj+nfBH5+mxzyhlw0i+uCrHgBSMfVCAd/QdfaVsA8Mx9UYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmlVgEbn; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmlVgEbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487303; x=1819023303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tq2a0AxNzxc3TFydPncu6O6JQrPNctVbCfSNHa0muC8=;
  b=VmlVgEbnWTPaJCQiFwnyWQy0TMlB26ekPUFnbuEM8uKCwpfDcuaEZirU
   mvrX0gJS+0heT1heQcrpy4sFf0FhKfGIEUhaCZqdW4HABQ2TGr+XfJ9r8
   E08nbntqZPuh3yKbNLNMrsxcdPOSCaZU7nLPxwPrSCHVyX1oBUoCxDSvA
   uyxXNj3cZbX0JfzvID1TSFs5UsBdiTdB07NGYfhDZ9rUI7X9S1hXN3+fR
   oHOcQBlTNRTJb/2in73V+QJIQ6BaSi9g9uZ7wkKOQ67/pZ/lgLRzp6j/o
   OoKzweqOIxcjigwW7+hlj6McCAclBnGv5OaaS3q7OJ+J1Q2A8F4hya4mJ
   g==;
X-CSE-ConnectionGUID: MfvR2OejQ5e61srMUQh7yA==
X-CSE-MsgGUID: g7HE2sviR4mJyjAWW3I2Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088913"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088913"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:15:02 -0700
X-CSE-ConnectionGUID: EsQMNX/vSViqSzMDCCP/vQ==
X-CSE-MsgGUID: HlVc3C7FRvmJf63Iym7dpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260603169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:15:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:15:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:15:01 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:15:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jynIVOIaV+I9aKZQmL/Oc++oE1Sm5/r0aXHQtKFlPvQ+5Hsj2ogzIDp/eogjMhHqI9ZuIunl/KdtAmi9iDovOPyDZ+h05nG17c3bUVVwbhThRkxLPzF3DEslyGYj1lmK6Njkk5SXBhrkDkx3dNtH5u6dSeADTrdYYTmuroFYIQ91l2w7e3DCTPwLG8RnZ4683jFFvoYwIAMul/G6jpcpxt4J6uf46nBV9fyz/uVKpNtLZh4dV7E/h5iQkX53YgPmzWne0FVBRk7nSHHpBrfOwIcXaxEoPOxvXm20cm9KLz6MYBa19JD0PdcTuv8eaM/vm+B5Hmdy4sNV8qn6pXY3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV+HkEwgNq9yjnUS6Yn8zBabVcy76Bv2S8cjfy8pp8w=;
 b=Aj1MSAfCeLy8lYfafU/gUliPqsEjZT7wESo1CD5tqy08NjBpE0sSfH1p71SNRkM1/VGAqw2ng3QHOZNpLRxdNxITgLPKgBxo5D262xsyJaG4N3Fd++WmAreYdHjXmZed/43Py0qxCtADpz4mgsiN2uVisWtwO5MjwdBqL2yJe5ryJscUg2aEmDDZOH5lBGllIhGKH1bQVB1CrZuVxV5sCx3Myxa39MKmvmOBPbIz5l0HPxZOe09BCWQRXHimSaVgndYK2Jf5GFhWB1dJm198jyH0cSh7Kx6fUUwIBtVjfMbaD6GXTiww9RASrkNtBfdE6FEv4euXl9NXJtpB14AjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:14:58 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:14:58 +0000
Date: Sun, 23 Aug 2026 20:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: arch/arm/boot/dts/st/ste-snowball.dtb: battery (simple-battery):
 'battery-type' does not match any of the regexes:
 '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$',
 '^volt-drop-[0-9]-microvolt'
Message-ID: <202608230246.Wv01wqf0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:295::9) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: c4940754-eab7-41f9-ecf2-08df0110267f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|3023799007|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 0wt5k8WvgSysmgYSIAAg7GQ5ziruU0qc3cFE6rbFuio2tGZFJYlaF5iV5uxdoqZ8rpcNIgjz/XeXsraah4lZJEO2Jz4drBSg8+uLoNchpU9XmCI2/aYlcfowTinSuULQafgGM4V5kbaKYFMfuNqAE2vDoL2hEaVxVqq2HspR0ksP37n6szxda2PEPy4xAaDekPvWnxQVMAcQWJkuhgUo/A73qjLZTyRCgpkiUQRBGsrNme+yXbcmknscaRSgvj5NmzuoeiVGamX/Y1ZX4A2F72w5AiN/ZZHz2uEunD04cgdmKSZDjiV3C5xRZT+nTc/lbxfhtdTTukukvgd/A3Wi9zLBq+Gz+boPRMhmdQtPMy7OXfhs3gD66vEM+SKC8ssqvomeJ4iu4xfpt1rqPoqcBwbHGmGxrV/ocjaGcnyxzFwRKx7O/+5sGDpKwEw5fewfX9HCaMr7sC12kV6/OFgMaKk9iaFZCr2iGahu/eqbHvcLMbgMIuGvc2pu+zUCPe0+8EY9if658PBr59M5u7SbHPqb01Y1ZfKIc5948R+VZCLXEydrLLEjGMQaWoKWS1berNTltbpGQxkrovCAxnZzaNHjSoDJlwPGXw4jH5hZxvut5NYQElLD7JLPQou5pOcP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CKKk5MrQ/vANoV7oF9pxUAHDmAtrO+wAj9426KaVvAz59o11GQjFztw5UXG1?=
 =?us-ascii?Q?gFsc3r2s0g/9w1/IIsLylk0Uh4xG48JYCyRsCkNnUF74gxEbgOkuEGJ53aoM?=
 =?us-ascii?Q?iHCL4IPwpoMNyUTw25WfXTeqCYgOY6XGiJGFWuFtDszsdLyiy9kw1FqLtpe3?=
 =?us-ascii?Q?L3VLunQxCyLSnQiAoL/JJ4Poq3qbgTYiOiYyxpIYMNloaBpcNcHW8wTPLqwu?=
 =?us-ascii?Q?oASrWQx7AzQKJf1F3pBib9jdc4HK2p3MX+15kWiiaEDc5WZm2rppoccwSt4S?=
 =?us-ascii?Q?xC6SsFiFWjjDaI4/seCEYpzx6qKemk+7hGPgTaE7iag7ebi4VQxk7Ivs4WJt?=
 =?us-ascii?Q?KISvWhUoFuiCwj9uoZqx2k3NllD5j89YBem3aDjaEx5Amv53AhFp70STnx3e?=
 =?us-ascii?Q?zG8zvUuEDfA3SBU8bNTS6QZyEZ5l0ofnCuz09517zS5HytLk9CyZWMzOGNHS?=
 =?us-ascii?Q?ARe4R/BUYSMWFgz9jD+N2cvOPODIJKAAgLnSFAWKx5w5jtlOzytdspMuWGQZ?=
 =?us-ascii?Q?4Xz7C/axS0QouTGGTKcFtV210WtAisRgD7DEed/Wuo06ON7kgi3eNA/5cmCy?=
 =?us-ascii?Q?34fMLvc0+55MrCXMYtYJFPT2IovkLLFLUHbVENgt/ScXvCuSHgl9ESDVjn7H?=
 =?us-ascii?Q?XJi2laZ4gdqIwY2TWrhe5bCM3Th4LuZ+/B+oEfhuLePMaNLeAa9mAqub7wCs?=
 =?us-ascii?Q?QHo4HMAhniT4K28+AbAHdljSodXD/3h9Zy0YeaNwCf4fEwxtMKuH29/gzp7u?=
 =?us-ascii?Q?KvIfJoFQTjyCi34I+iUxjFMTNoM+kx058PxjyIueZkDLEHBIIq/iJZF1+rmt?=
 =?us-ascii?Q?LvsNrSDNR244SEyKr7s5PHW4wbNhely8WqEM/TzwVk/J9gOYm/sunC56yhqy?=
 =?us-ascii?Q?6cBLuDExRy1xjQrJUKX7L73cgA/WkATu6Lpszar50D5mjrUq9ocbqc+4j/QA?=
 =?us-ascii?Q?tfSQ9BQksYBiy0mQkUvK+tYkbpyk8CDRB75ExPp6LV9yE3UjTDGSy8I/loxB?=
 =?us-ascii?Q?xUakdcQSXyyiaJCyZFsqDabgxgZ1RFjrnNJir+5NnFOxRJF0uST0erG/6fz1?=
 =?us-ascii?Q?fNF6cRO+CiC+VGSzyTC9QwYkGGLkZaqMR3jLBwpObPA3hPBJl135x/IUFkWy?=
 =?us-ascii?Q?EM+8YVy4ZiOqHtifq8WJVIo0mgFWnugULQR9V8i9HCNk2QuKVZHZtS3BhsZO?=
 =?us-ascii?Q?xdEfLWfijnefCpF9Acplv5Dp9TH/kii3VJC0gsHLwY52DcZAP+yKGzWd4lCc?=
 =?us-ascii?Q?uzlWCX+3Zc+xszNynCHI1qncO2IQGEGjfKvcANxfGYk3OngsJzxiYlD3DVje?=
 =?us-ascii?Q?gF4QQFEiJ2Y+gY1jZQh00kl0dpxei5kJopzLiGrlHa1SKsXCPSMj2YGCcXbc?=
 =?us-ascii?Q?SMjpPQND5X1lQ4Lpk/otclVjazXOI6T4I+LgWxPZnjmKJ/ISWmoK9m/WNjny?=
 =?us-ascii?Q?7EV4DO/We/kSzdR8+U/kqNQr2SpK3SSLg5AhehWs1Izpviz/2QmoWJsBiux0?=
 =?us-ascii?Q?bIBfT0UOwHDXzArGUrWu7N/RMHgzI0p/sTSbgh2SBlC/dS47ATe2KEeTOmNI?=
 =?us-ascii?Q?G2ukbJxhjQS/93vU02msnei68sTrEkeIBAruEBP9jat3GwYdD3FK0H2Yw7Uc?=
 =?us-ascii?Q?tENLdbw28eUBGD55NKVBdi0atzPaubkTFxUdjZCvKooQW7DF2qznLBdrSkjL?=
 =?us-ascii?Q?0YEz+wOCmT74gaITJVgZ8t6Y7ymSZsEVPE2MqmYkw2zdEO9oAY6G42LaSCDu?=
 =?us-ascii?Q?sdTLxNpLyg=3D=3D?=
X-Exchange-RoutingPolicyChecked: WOsOsJCMoASSSfWBqGbwaIYsw3muwtP8yN4mnOtVBfLF8O/9tl9+o8xu7Uz0Wlr3utoz5txkUyMHO0OdZa5SriZfvkM26tZ2mprCx+op7R3GueT0rBRZqhiGauwN9ubMeVWckouVYzDb2rC2D4iP4tuB4iPcx/bgq4L/cv4GP/rksPM7RtIo6OikRKTZDkuU41mwamGzJz6XHGDrrvu2DT/Ay94V70GofFLAVjpR1kUNfwy5y8pIfPk6WWITHycl7w7tvL073vA3NIbx3Zxofb/YaN4vq0AviPCsBAv+gf2whkp5CZb/6VwPtgD2x9AkZtpP7bfUP63lpTU/S/SYXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4940754-eab7-41f9-ecf2-08df0110267f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:14:58.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBEJwMKzXDPAXxd1uHSYFD8GYmu+8phVqA4iKlXsufWZ/0zNZZM9e2DuYGDEIN2D0Bek3TO6ckE6xKjh7higYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66fb95a521110da673090294561844c9f76ebe64
commit: 16056396b7709b0ee33d88329e9a41166bc8d6a0 dt-bindings: battery: Voltage drop properties
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2054-20260819 (https://download.01.org/0day-ci/archive/20260823/202608230246.Wv01wqf0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230246.Wv01wqf0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 16056396b770 ("dt-bindings: battery: Voltage drop properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230246.Wv01wqf0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-snowball.dtb: out_hi_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: out_hi_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: out_wkup_pdis: ste,sleep-output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: out_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: out_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: battery (simple-battery): battery-type: b'lithium-ion-polymer\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1', 'button@2', 'button@3', 'button@4', 'button@5' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: out_hi_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: out_hi_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: out_wkup_pdis: ste,sleep-output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: out_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: out_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: battery (simple-battery): battery-type: b'lithium-ion-polymer\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: out_hi_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: out_hi_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: out_wkup_pdis: ste,sleep-output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: out_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: out_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: battery (simple-battery): battery-type: b'lithium-ion-polymer\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: out_hi_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: out_hi_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: out_wkup_pdis: ste,sleep-output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: out_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: out_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: battery (simple-battery): battery-type: b'lithium-ion-polymer\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: out_hi_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: out_hi_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: out_wkup_pdis: ste,sleep-output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: out_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: out_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: battery (simple-battery): battery-type: b'lithium-ion-polymer\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: out_hi_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: out_hi_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: out_wkup_pdis: ste,sleep-output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: out_wkup_pdis: ste,sleep-wakeup: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: out_wkup_pdis: ste,sleep-pull-disable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: battery (simple-battery): battery-type: b'lithium-ion-polymer\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
