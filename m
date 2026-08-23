Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961553D522F
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488367; cv=fail; b=NGZFWQdq5BEkpqS6W208cl1skXcgEx+/tcP0v0tSbgdftwQm6gRHBImRQ1o+/dg/INVYjk7zopKgEwV3W7b8LgBdnQvPxwWb9rEEL1E0x6KQz5uVd+9AflJ8HnffLlRhgJMEXplvkXCgNU+g3ZYSZdS7qsjKQ3f6QM3vAJqHjVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488367; c=relaxed/simple;
	bh=SJ+nyFBSDFOSINlrOvNNVwdrWhOg1RmlN+eRmFg6ESM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uZ0yGtJeFtSHQFG4EXhGW7SRsk2mZFthhGfjjK1936BNMePhzrCdNHWvk7ZTN0tme1NdKUTaLNTsJgDlndNvnhA/4HnjzqGaImHG/IM92RdPHQJpUZ+CQBc8u9zETS8r97hXSdQdAEQUCOJU3ilLv/L6rY6CIJlhCA3x3kHLRmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqX7rpkp; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqX7rpkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488366; x=1819024366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJ+nyFBSDFOSINlrOvNNVwdrWhOg1RmlN+eRmFg6ESM=;
  b=CqX7rpkphuwv93VMfiAvDt8yQot0nFn83s25cp3jMj/6cSweBq7FBRIV
   fSBOVh0kJR7aVmKT+EAmW9vNHjSU01cfFEd054uLg3vnpng22e3eNSW5F
   0YSb6xj1XDM7InnjiXuQTo75Oa2NnQB3QFTrkQwN+nw9EXfmLJmZAY6ZW
   m42pS6oWEDRcbOhBjUOxRzXPetWqXxism/37tgL3KEA3XBCVbE704fbd7
   4eFVGg94o8/bvizrN19eICn4MgoW2kBptpluZYDUaEutz3kceCJaOcScu
   We5IPEd8/M4N202rhbr48yTzCNkhhaizLQ6A9WuzaxM7Sqs1XGo1c4Xl8
   w==;
X-CSE-ConnectionGUID: D/j+6eF+RvKoVWoFdGOhnQ==
X-CSE-MsgGUID: mnslgKUSQMWLvSeOsdPTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87830805"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87830805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:32:45 -0700
X-CSE-ConnectionGUID: Asbe+mHWRhWGiZ8HEa+Vuw==
X-CSE-MsgGUID: cx0uNCdsQtqe0ivufoIJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="270573607"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:32:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:32:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:32:44 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:32:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFocZ6BFLs7VaAqUGRaLKkHC+AOyxa2Sf5SqPdBumfY3dvDHfscy9dpvaZuNCGDbcawW55GjxQkp7N3UCgNExM3VM5lSRvBTNeK7lpzoUwP8VENhs4HCK2XiYbU860C1aZtFxRHKs8eR3iFkDeqKPjmB5SYMELqOHnp8ruqAFISHvdtCCUiv7cWqhuc/CqvDfN0kvtLkaEARRCblkIoXcYaYYXLFyUOCnhtzwweO7EuC27P4LXUi9dG1GnaAzwDBk0ZvFgn2DpXs7lYYAf2EJQfO+JJ8BOp3chl/tslAQ19oUNaAs8YDXTIsjyDQwtQyoGkWCCiwlVGFL3WYwn0mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd1tlh4t74fB1k6gfZdTlQ/CRd/MvtudUTMJZEd6o+Q=;
 b=gJnzvmhPuxlGDmm1q80+6VV7khytOavRO2xmuuBRPMN84rObj+mNCxyjbSvq5PaXaUysRyd3X67yWy3/5pDPV+F9EpHd2EzT3cx95OSPsgdHIYtRwsqOiLahIwyIQasXo1qkS90ECkJwG2VjOkyVap0JpwWN9cRh2nRiOrPMWpvf/7tzlP6Zonq8jTgZ3ZtewwQe3KGDXKmAnWGnnBJ4U23/SMj1EOPkB8+9YVhBPS+pAjKBZMLqxVUr4bDlhdPe2+IVOqenpxjlf2t/m0AzTs/ZrEQpVis14Sz1DVFv75ljfS8JeXm0gpgmmg+yseZkH7PPn04Ir9qFZFTI8+sRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:32:42 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:32:42 +0000
Date: Sun, 23 Aug 2026 20:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000
 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202608221244.CYx4lQls-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0054.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::18) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6929c6-7f2c-4e45-a20d-08df0112a071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: xvpt02dN+g4a6XKZQPh0QaU+lQ3QmmvlJBprZRj3hy+o8Hd0uzphJiFryWUxGhiO5o7XyDHD+7nXGBfdhfNYM39NLfv8cU+bkg/hRXssIt03Df8lQKnpWs++cDFR7FN4aS1McAhNm8SsIV4q9ra1wbCu1SaC6dicAImV1gJM/XQOtErMCAjmGQmjUeg9VgSruwtlzafiygNcpZbNC1MIQ+wNEZIz7LiVjd2UZZOfGzlw6oxHJFZOzzIw3IN2chMcUZPmLS1rkU08zS7FeLsKMdW5CcsYnEcO0cYuAndiOnmHgZsGJ+wqfhFIxVFY4ADxzDcXUFLvOx0GrliDGOBgCh28aRTflkSk/wCOS76OuMwLXjHAZiwZm/hS/lkIpXeyj+UiOkFp+0DoEflSZjOIaG32pABh3ZkAmFXjfJnZ8KiKfahel31axIUikGYoMu/GnErA+mKtdzcrwscC60783IEXC+3nb8MX9XbisvIHdI55oLNqI82Ix2agKETqluUrM/ayU8SlZnJgbHUEHradZGDKFVOUZUvfNhmsSOM27z9WDLHbC+B0D08h1mTIKRySpHC3x2lKRDgBHZW+kl/NE28/RGMs8tYdPrgixqhvjLOXEygpchxJwlnBjDORFuX2EnldTdQYCJwdFTTwkUzMbk+Xpr45OyFrYX9zM/qCK8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBmJuLX2Ddo/NpAfxbAPWVs1UAQ8k/9bqma/ML5nIhWHU08BxVW3UBF1rez8?=
 =?us-ascii?Q?9YGP+W45qKsryzzoZ/RvEgDuCJSMaYOIx/CRBTZQZWbgadMGorMZZTvIVwin?=
 =?us-ascii?Q?EV5g2nNgUv9PGSIjmZt3QIUd5W8mofQQlB6KqxE5vtl1xJuzGVJlHZrmMk/8?=
 =?us-ascii?Q?vQor5FGGF5e74/6NN+kMmzVHDSVyiNh+9vn8n3pG2mFfqqzagpB3s0aY9MAv?=
 =?us-ascii?Q?YIRbp+RBz1UHswE9cs7FzK2wV7HLxHbu9xUCbShegvL/k0AOmZB81BDbSIqz?=
 =?us-ascii?Q?F4TEJVU684IC/e9cBPcRNTU03u5j7iILSweLjT4yYXbqsjkAfAfr3wvxYVaG?=
 =?us-ascii?Q?slCDUoQTRDw+NqzZsYu4g8JBhDz+IiSylO4FyYfsHDzva2sSdJCr31KFWO25?=
 =?us-ascii?Q?eKeYOr3Ohy2F/1zXw3/xpRmdHOs+74s7pyC4JKSWJ780cpgZO1p4o6TcQ/yp?=
 =?us-ascii?Q?jW5oUgn0QnbDx3rH5gcnnAXYzO+AS97EUIp6x2g1WbQXcT097hKRQp7EleIZ?=
 =?us-ascii?Q?uLV/9ouuAhc/Ls4+gmyhbp2LR6Z39Ax6SnWnZZUV/aeY1FvjRA/1ee7j8O4g?=
 =?us-ascii?Q?F/n2W+5IcRbrjWOlpgCMkt5u/Nqdr9cO15xauAUJCOfYgP5dhLOakT26MMoV?=
 =?us-ascii?Q?GL6JpW0lt0wFOq1WYffh+KHrJJDdCMLxfS7oJXECLwooZ6zxg3T3yJ4VfPP6?=
 =?us-ascii?Q?IJdpPjT3NicLJgN3zq6Xdooa+gpnEAVV3YroHAd4PF2MySGunpZ88Z2bCtOK?=
 =?us-ascii?Q?AajXy1xGVoNhD+FBLqhjlxJwNBStA5uIPio7PzcdNkwSLpKWHGNAh8UBLy2v?=
 =?us-ascii?Q?yEs3ZUOQ92naMhBhCyaMjLi4k9RuM+5pD3lbw2aN4AgY8/95zHdvPgHqXV1J?=
 =?us-ascii?Q?0YWPBnOszQVCO24K7TXd21loBqxCsG2UkaRLJ2hF5YJh7Uf22iKSGzkqkvDf?=
 =?us-ascii?Q?psj8EW3ICKvIRl3u+c6wTFGOet8hGzI5gJecBB39CZyY7vgsaKn/fNd4Z5pn?=
 =?us-ascii?Q?z5Uz3AOHrTwKSWoTOIvkEeJvAhbuoAQNkqW1veG2qSwi7L1ooK6sIQZcG6NS?=
 =?us-ascii?Q?iU/jQvFHCZSYhKAiovQhv6x56GNyYec49ZDUfYjBRovEu7ybm3p70owurJPF?=
 =?us-ascii?Q?/XCQZ+/jxKbprB5eRn2q54Q9b122KGUjO07RRsfXYYtWPylEG1X1+/3Y9XNS?=
 =?us-ascii?Q?jqA9QqUwZd+kr/NjyApc+yy/lXT5MIWGnE6aZpt2NCdzo09sUDN/jPTB6w4N?=
 =?us-ascii?Q?98sxbkIQM4XtmbUG8ul2Q2hRH+qz/WVITKUCRpPGaG11iytmMkE4gFWDxvFL?=
 =?us-ascii?Q?+hzVIDHXk+h7Bj7Dpgpi6kfvbweGgB5a32RdmvAX5WwsaNR9rq1xdVMcTWB9?=
 =?us-ascii?Q?kuwTuQ5ss5qSh9xYCsimTCvVdhZVxH9znc6gY7eY3PaBOav9d2VUgs0qgMIZ?=
 =?us-ascii?Q?QgJ1cWoZkIUy7EUVXaaRTlg8ZPVLo1GnHia/4KKQe7/1Why4YpR5XFCQkWN3?=
 =?us-ascii?Q?jmTVCC2ufI0qSrH5zn4FjWajd+dUSJX5MFCGKOyujy5FApk/ik5zIqWhMhWJ?=
 =?us-ascii?Q?UYCSgx4mQYlp7JYAsUk6vbUiXXTj9VCH4i1MKwiZTMl3QvW8gidqpghCbMif?=
 =?us-ascii?Q?MorR2odbXvN0gPh6BS3Iq66rgX62NYG1IQ32mcySi8NzB87OOana6W6bEkI8?=
 =?us-ascii?Q?1aDLxPJKfkDQDVrWzIH60vudfk5Ag72nFzuErZeWSnvUZEuf/RV0W3ZAAbiw?=
 =?us-ascii?Q?8VgX7+Jk3w=3D=3D?=
X-Exchange-RoutingPolicyChecked: CHmsP2Svk/RHx/5LzbVpWZZ33hLKujsw3uTjk4Fzw55XUlYYQc2bNIj1hz5ROzII5zlb5ffCNs6Kvlj52WY6i1bDyyNrByhuM3eFmoqtcgko13/uzJ4emb4zI3ustzeqo1/tExBtBvZkvIxBVCNltWcAg2mYz7qMRS4OB7P1qNvzRtwnQ1CDE3mgijbBqbAOH67Yt6gPsMj6PDYH8n1qJpIib+g/hZNppM9qq+e9kYSQie4sJXIEuUV9XrNEiM/PSQfT7yS9jKP2zO1bPbl8kpm4KdHkkUJiTS821lx6ZVPT4T/iB9ncnEJ68pi+xQDHwdJBzd8D8ej//R577rI+3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6929c6-7f2c-4e45-a20d-08df0112a071
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:32:42.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvuithZj+zBS2iNcQSMmvZVX27wvnYlEY0uKFPrO6lmnbPx+1Or9rRnu7X82B/hSjRhbeoyTRNjT85Q0WfGDmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26260251022fbc2f248a3d747a9b2b961b18d2d8
commit: 1c69ba9bf0f3032428e6820bada0bb50016a5db6 dt-bindings: lcdif: add lcd panel related property for imx28
date:   1 year, 2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-2053-20260819 (https://download.01.org/0day-ci/archive/20260822/202608221244.CYx4lQls-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221244.CYx4lQls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1c69ba9bf0f3 ("dt-bindings: lcdif: add lcd panel related property for imx28")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608221244.CYx4lQls-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[68]], 'sda-gpios': [[46, 1, 0]], 'scl-gpios': [[46, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: cpu@0 (arm,cortex-a7): fsl,soc-operating-points: b'\x00\n\x9e\xc0\x00\x13tx\x00\x08\x0e\x80\x00\x11\xed\xd8\x00\x06\n\xe0\x00\x11\xed\xd8\x00\x03\x05p\x00\x11\xed\xd8' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[61]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6ul-tx6ul-sgtl5000', 'simple-audio-card']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
