Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D4E385D68
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487179; cv=fail; b=t0rufFtESF+XWDoJnxdwSkWtKktb9x/i12brnDYrTdDtqukq6+ykDYkq9QrxdY0OUNi21UwIqWypQJQ1kj6yjO2JqvnNzu/ghd83NsgOaMyoFVJwDgxlhB+UBtaPypgmR1V/Ig+IQZ/kTyodbuiY3mXD9X/aiO28zOsh6mLeXmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487179; c=relaxed/simple;
	bh=A01Fksq2BjG7SGJZ/Ft1Ow3Qp5z2VB7hx1IGcEIgcfI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ax3eDgBFBvEWcm8bp5V8LnchyFFWglFtR+nFNCNsxNfake/ViFjnT6qbHq9/OnTLZ5aJqF92KEM6SCVS3OSf/IwVXQL+aIHhZqTnsYVwtLxioQKIcnznLfOWzzcFyIMmUkY0Y6Occ+I/cCnfCpbdt1dmbxUJxYgFH07vgbP9L9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSB5Tt/Z; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSB5Tt/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487174; x=1819023174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A01Fksq2BjG7SGJZ/Ft1Ow3Qp5z2VB7hx1IGcEIgcfI=;
  b=mSB5Tt/Zn6hyNSufP3Xs5Y7OAfz8AglY2g9HNwMgAC/TmtO8t0/e2Is9
   K1mBecUnuNrwu1IGlKuVgZYs2tKQHj29/tmOqhQnbVygLL+fcx0Mm7TR1
   iX8jwJ3lyV48UkOYiYLuhsU/REe6zGH/6E5W6exX374wjYfGxLlBKzNVH
   Q2zhhkL+t4sJcQpivdzOB7pTyIqPAt+kAFhIvvq9GQsVjBqFl9MgF411w
   5A2GwuGEE+Y1N7V0Mhf3CjIo/rBCc9qSfoYq0hqhf4c197rwFO6mmuoUn
   1QTBUj2AlhzghOyggDMj0p12V9fM0NUvJica8ZqUqOah+HhodUGbPbaqO
   Q==;
X-CSE-ConnectionGUID: u8tNNWwwQo6YhGFMbA8k5g==
X-CSE-MsgGUID: fSVEjJs0SnibMsaoF3ymkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088746"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:12:53 -0700
X-CSE-ConnectionGUID: a0HWQhpuRWSNJIN5gztH6Q==
X-CSE-MsgGUID: eYsL382zQ6GzBGm2FsVQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260602822"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:12:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:12:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:12:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBGb15Nlgo/1kY8Ixs11iqahz2mrYTkCfrmCF1k7KG27Fk0qq5yyENjsojMC9jGvLQycv5BL6If8SF9tK0eDOplD7gDZ2t3UcfL2ERMjdvlpdPN9Ij1mddEi8lw5Mb0LIz+Sm89PrISmbd3Ztq7b0CyRQWseNkvQcq6ZwQP0nhkbWpLWX3I3wsjXqKIuDOjj5JmulZfxpkNYG9y9jVHEqzGWkN3Wh7ESj0K3ATaQ9G6wv69pXbGW6eEom8BKSwDFSL0/guHnQh7A7eCKbYcCZv3mBCjJrzVQOHneJsR/FHnHbzAsA2jEXdcKOPju4mv48UIDDolGPrbfIJENgvMPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnkk/NuzCT9ifS42fJYWxZqNl/988QRmAiPBtNILq/E=;
 b=FMT197S1Gn52dY1UOOGYpfLdzuwdJoWDxAR0l1rZxIe0w1YpKsIH7E5JjbbmswZEpa9TEfYSFkh2e17yQaTeTPvQPmT7F1LIuIdXK/SZRBzGCoCTWydoLCMho90AqEtCQfzlKc8s/xZR7WLg92b1CqTe2k30rwv6v7Ve5GqeCEpl5/qw9f+0gTmfkWdw2H/s4d6n7MwWRUSWPAXclDMnM60vnS3/lMAC3hilW84NoUi0IZ3b8i3I7+uzmY6pXi6Zt9ytMJMU35F1zYT4MSYaAbXjifhP/Gt0CIce59NV83rP+8qkr7qWajAQuYy3lbaXv6+B7v+tuPI0v8JjSWageA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:12:49 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:12:49 +0000
Date: Sun, 23 Aug 2026 20:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: [asahilinux:tbt-reset-wip 33/36]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@701ac0000: failed to
 match any schema with compatible: ['apple,t6000-usb4-acio',
 'apple,t8103-usb4-acio']
Message-ID: <202608230444.nDPdcq3D-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: a333051c-f954-42b8-3836-08df010fd922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|3023799007|18002099003|11063799006|56012099006|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: lHZEb/bDny8yhLZMMJ04dibUf7bi1OsihCeNryJsGlWFIlbeM02arw/qrTwpg3uoRcMrFKc8u4JnfFMpkY04cHh15E+MLWkUm3I/Ozz0fSgglTJaiveVLWQS9xjJJVfdoG3OMknReIFR8NUcrzjutILhEK1zM34Bg58BiDo12cOuA0LhSCzXHZsZp2W3KkvPN1OkD9TK7oykrX6/gKBKiKShN2NMdI5TEBUC5M9kODYvQpe3TpkTLHrUowPIRLeK44zVTD/kUAs6gr4Df6fgNTLT4+4ac1jCpajj+FapLZuFdZ6JT86Bg83RvThJxSZPLRvXUVvFhWtJi31wq8/nUr+cp/BVIKP7YDdrMC1NCC2QXfK7xGXg9llX9ae8i16Ai/6IeWi0FQn2Teqj/5miLv1ZH6jXT3DpyovJGP4tLo3ETxJ4fAlZ0xUy5ff+ROPoooDn46jLRD0arSQ0ya41uY/hY5gF84mVY81OBT3cAvlyvF4nFqDwMAJpO3Lci8USpEPOP20M/g9glX8CnPnYO+br7a3lLNoIySFDhf/9xmQIcyvgLcWeNC5U6wNeEfIi9jyEDwbdmR1X59ZJdCPAC38U5H6UFWipXv/zBPOSmFQO7Xbd4qwojdscNJpWpo+7tzQXInLu/cwnfqJtcNO1PwRW3YWwaDp71zLjrZQHeI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eqc+8aOH3PjrziAkVZj0+Jrc2SSZF8IWNj9hLQuMaRdMyill6/Wz7Vv2pgeA?=
 =?us-ascii?Q?WrbTcia/a7KEtpjYhb7n2ql0KwfpdcG8M82XcJOFS3LBVWYw5IK2HT+XDOkT?=
 =?us-ascii?Q?qahp9S+3G8XYg/Af6d95VyHbROT94UO8Nczf3xjG0F2PnuWn2F1pVyWHO8vr?=
 =?us-ascii?Q?ONWRfubM+YC3MlRRVwkQXsiFW3BCv3vHda7b6o14soFKVCGKdPhOoncEWqct?=
 =?us-ascii?Q?bFSaX7Gs1uJPDN+Re5HM6/AigdA6fsII+Yrzd2bWNay++OQ67lJdJuxmmQ5a?=
 =?us-ascii?Q?QGjflCIbn1/mX+rrg6EPlN3W28o7bONAoTBI8eDSeDvdFApzQxPat9XxGTqP?=
 =?us-ascii?Q?WD5b9vdY1eVTOW1o0hv9swXjzZH80xQvHROCBTAiy2UHRspQJJEePX/qCIQ3?=
 =?us-ascii?Q?cQ1SoZvLGsj38LHEfkDm1zYdJiUBGFYZ4Aez4YPY87pN9M8V2xvaGqdW/ZwW?=
 =?us-ascii?Q?S7klZ/WaylvQUZsc26D7o/0tVITXz1j3PuYXb/bG6ST2G12B2a9gumpiM9Mi?=
 =?us-ascii?Q?AO2qMuM/xoH46WUSGVVcvfS8re1wXyOkBlrbDgyCek85yd8Y1rSFwogMxTi5?=
 =?us-ascii?Q?2laDl3QB+YTNsu2TtcDP3+eslSsxS8iGm8bL9EZQyOVQKbMJAJT9/6R+flL/?=
 =?us-ascii?Q?Z0fW689Sh8Zwmx111BoIFzLdTbLAMeDEByCkOGbMAcNcbJ+r0kzgiwlCLqo8?=
 =?us-ascii?Q?pUpuuTnIJBOS4OcZO6F7WAmcxYYdpNVKA8Qds/Xt7MEFF14bbCDPl9RvLATj?=
 =?us-ascii?Q?Yquz4yB6VzVkkT/f9TlROZpXm8xYQ2XKksMCoVIsfGGKWpPdyQq3i2epY5V4?=
 =?us-ascii?Q?yFSxpBDl9FOZm9hW8ITUZpH6gjZznYJvxnBKIhaPkEPvarDCxbUe3l86PDrz?=
 =?us-ascii?Q?1WO5mdlmJtAv+vZ4Q90inKauPuK19KTEDUIyqOhBx/Gh2RRb4H0cR+sfh5tP?=
 =?us-ascii?Q?B9dFrIjun7f/tKZc2sjP9aBn4ZGBvdx1w/7w/OW649qTn41sCZGKigxkoSZY?=
 =?us-ascii?Q?e3wuekL0o9bFmm+Kh6XH/J9HFpQW7kpicGbVoiHgM+6L1FHR39bbyPRCwAkA?=
 =?us-ascii?Q?Ak6Hagij1wfCBDTIh2rnVE5tX3vlN5b9n7VolJXjwwFJTJkZ+n1K3+TVv9oW?=
 =?us-ascii?Q?zjtZVJueKsB57ZQue4a5p4yVRVSQsFBUsSZren6SUjJsGS5EVdq2sTIp6sJB?=
 =?us-ascii?Q?FKCiWx1OwGjm7kHWI//cZFusqDnN1+H4JWHTQmownFlHNPJ/TtcqGqCyyKvS?=
 =?us-ascii?Q?OBWy1gMjB4kIdQaEk1JEV4lNoTUcPGEAvq50wsnrKPfVpJ+5mWYFG+9XgAm2?=
 =?us-ascii?Q?C4uqN/nW008R7RWJefTtBLim+SiNh9tKdRjU2I30P/Si3UJhkQCRHtMRAFd/?=
 =?us-ascii?Q?iNMNmmvkMITrkgIF35sOiJ8NW5afZFWAiNUjq6HbntYkwzDIhrdVb9L3W+FP?=
 =?us-ascii?Q?0r0OK1JjpOZr/QMMN9HyjbBDexrxhkPd9qVkBUFnD4IXUAAVj/o18DBHuWoH?=
 =?us-ascii?Q?MCdrIFN/N2qig3XzZsilu1OeUIv8tsXpRGqPJC1gPU1kzS3PQwgTEjy7OMXY?=
 =?us-ascii?Q?1AvBeLmS8m5Fi+5NfV+nArRPew1SZEY7zESUxrZh5r5SZXuzW6To0xPU3a/U?=
 =?us-ascii?Q?CVfDSGBVkL1cawk1rIWyQPZ0mbeozmyV+MFKldJnxAizdvDghAJ5oA5qQTBe?=
 =?us-ascii?Q?aieCegluwg8jPCFyhVHoyZkoIyaK7w3Gk/z2gWz32lC1noIpyaqwcbADYVo5?=
 =?us-ascii?Q?H3d62x0NNA=3D=3D?=
X-Exchange-RoutingPolicyChecked: N1X9fWRGAmga57reCIYlHHLyGuMjgudgPSAaqQ7Qe1kjQrnJz+4YCrmaNIml4LEx7NoB3sMGjNVs3gaunBQD71QY8k3NjhR9gof4oLrJ26yrbimE8O9mJpdh6fH9QAhiSNSwzvgNwyKpdCByMilGKUDs6xIPl9q4zxYXruYvUDnT2gz0JyWj18tBFsKdfjtgGA7yT9HJlRVNy//Tz2ujqjEIYf+vKhuVBS9aQni4DUaZiWobRQGhHUnqY2eDOSzbU2yJ2OrhXE4hi88acb1JYop7mI6h+RhmDr1SOXgCwZsoCV1J36bAE9tklWq04H/I3hFKHKDreAbX1eY1yoTGMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a333051c-f954-42b8-3836-08df010fd922
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:12:49.2626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oC9i7om3GyumLsNQ+P5H8LMZ+hf4DKsUuN/dP1QG1hp9zygH7f4FQ5BFasvjXL//CV0IgrEnxFQlDMz9xILgjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   f42b9fb4248a76449873cb91cac2696aa1df9818
commit: 6551d9db2cc1754ddc22a63251592ba928257384 [33/36] arm64: dts: apple: t60xx: Add USB4 ACIO and NHI
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260821 (https://download.01.org/0day-ci/archive/20260823/202608230444.nDPdcq3D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project f39d58144cb1dd40c4135af6ab2ff17ffa3d902b)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230444.nDPdcq3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230444.nDPdcq3D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6000-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6000-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: nhi@f00000 (apple,t6000-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@f01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@f01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@1301ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@1301ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
