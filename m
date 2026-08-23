Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FD38B7D7
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485862; cv=fail; b=K+wfV+SSTnz5IC4BXLlp3r91GIKdHfYMZGZok0o48CrKoQXfKVX9R/5dS+BhLwPNLDujv9pdS9B64avIGjMTT7XxDKnmV/g/LxqmjQ8Bh/VNK/sYPEmW7VGUGgxHbVJ4i1+LpbCKeLl3a6GHcvurQC1dPRHu7rJYtqnkkfWp47Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485862; c=relaxed/simple;
	bh=8WZHWGe0icZRkv2fHyFL4o50nqJ1yPDZjYkCvNiP2rA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GMJnCzxvbIly2BHFcAdPD9jDHHjdHqeB3ZTBahzcazNNXfweqIH6nQbsc+c9pNXh4bEi3xcB4LhijYbFsgDooqUxjRiG2FV8hSnyH1wXwA2/H46VIFbvo3JjoeLkmi1kG6PY3TfPG5jPIHnMl1rkFIPwN1BcShaJIsjgT0Y7ENk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nz7q0PlK; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nz7q0PlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485859; x=1819021859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8WZHWGe0icZRkv2fHyFL4o50nqJ1yPDZjYkCvNiP2rA=;
  b=Nz7q0PlK44cxW75wDsYpV+Hi1v6JFiS4Yl9j6s15mLiIMYlnbrvEFqCV
   +Zsk3QfknynBPgARazXc18MqndnR/HDJsU+myIWCBtNaolX+Mg3UdRNZF
   HGRqUwqVjqvL1vitWTWYGTX/GGEtqa6kq/qZOsU8yTC5a1JTI84Q+mXhR
   WES9LsnkT3+W2PjnlzKG0SCnss4y4VOeXj65f4D9xks8EirP74wD+52+P
   TXrQMdsMQh/LbVWisl9oHPxuZGKovNWLDaEhhVHMkeRKpxzFFW0R/qFkO
   Taw7XghhMry+QKj4UUMJavw1lILFvzNPDYu4NxWB9Ahdl7rFFsyVL3YR1
   Q==;
X-CSE-ConnectionGUID: jnPiiy5rR0yHZKiW3WI4AQ==
X-CSE-MsgGUID: W+LF7uvsSl+svVzKhdUXBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98550646"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="98550646"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:50:56 -0700
X-CSE-ConnectionGUID: 53A/CgsARDuyARB8l40bKw==
X-CSE-MsgGUID: iZFz44FPRKuTDKLjvj1k3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266234190"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:50:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:50:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:50:55 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ3EOssmuyb0tV5SD9MHuWLT5sxE86zbIGRvKFZxE9Ys5uM4JZhq62/ZB2eIImD301E3ZDrosPVhlb0F6NUkcTZJ0nSUwHDwTP6BYq22GpkzJs/4vErKBpDKsOWeC/Zr+8vW+boTlp4RextJBFRowVcn7TDi/C2Lx0MSYiIITfqAf3czrLKJeUUzV3hoZozpEsdZCioNb3Hhw++q7Uxb0yuCiRFZ1ttACqSujPpQwHNxD/20M9gAqApbHEZ4gF/aly/4tCBkFNhEwZDr1pwU918m6yeR/aVC7jRMQVXW/uYGXKyhDW54gd7QipTRfb7srYolcwZHoHLThLxklFrZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA2sxeEopNn3XusvaxImTV0/xjhjxSPyRAIjP9U7YmM=;
 b=W/8ZBm4RIynqU4mPfs3psDM03elmyI9uZVZYlz5wdtDtzai0j/M3pJ8k6DnsBmW5wJ8M1u3uy3RvL1n22s2HqwqfU4Bv4ZR/TcS/sdnm+5MiTlQ+gk/LmfZvyMQvdwy8Co2pmrpunbdMVuNVUtW19bNFxqK/s0NXPymsD6pFtFoBgnUd3H2tPoR/MbpZJ88VBmVTJ06QKCvgh6Fnry1yhdwySprF/VrbX7YrW/n0iH9SF/hTmaej4oU1BnBEc/Rgg52evIcZhixzUF/dgtWt5jthugkyXYAdiNqHxSBxAoyRsnZKG7F1bJVjSUGPwbcOtEt1W/MXH3IN6+GeGKg6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sun, 23 Aug
 2026 11:50:51 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:50:50 +0000
Date: Sun, 23 Aug 2026 19:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: [asahilinux:tbt-reset-wip 36/36]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: aliases: 'usb4_0_nhi',
 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc',
 'usb4_3_nhi', 'usb4_3_rc', 'usb4_4_nhi', 'usb4_4_rc', 'usb4_5_nhi',
 'usb4_5_rc', 'usb4_6_nhi', 'usb4_6_rc', 'usb4_7_nhi', ...
Message-ID: <202608230840.AaS8mMAT-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0039.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: 429c4dbe-a67e-454b-a99e-08df010cc76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|3023799007|56012099006|10067099003|18002099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 4gYdxEnx0uy5D1uVUqMWILAD5Cbu2VjpRZRZCVEqHDq2DjeYxFM7CrOXrJRlRQgg99f85JGUj9B4fzq2XsisBcE9pvKSCUpBoZ8de8pSxXy8vncIlufXZX7/i0FTWOqHHv4gJx2wLs7aun8Dj8V9lu4LYY9L0ADMmPecz3eNnbIYMs/u1m3vdvE0lXKm942/407j6Hw1B8RYX7wGf+bNRxwj113XUAybFR3Yne1IfFEcp1AYXqhyOhwdP3IPBm2iyU8kAkrBDtqTF5+AgIjGsPa9IqgIa2mgoBRoNyVkLfSZkXyqNQzB7XITSCHHOrWZCxH440AyVfbduIT9branSNLW4ZDfzlqj+puYn3z1JRO0QUCDhlbXQragjKcHRpnhVjzSsmVMqRgxirD6ftMXWpvJ2jKP6HN6i6szoXcG8yvi7RMVBpxr+22PDAxQ3vN6zeFQyjmaVoHeiS+oo5uZsCX+XHx6K9kLFBcVou9I+HpUuwbyoHqxLRZVjH4EDi1CSXotEPu1d1JBDJAJLBoZeDUZPqhJj/JgDRuQ85GR3JgB85v6pzhWK0JMtloNeuG/Uv8FKfxhR7HgzOpw43IkGuTr4MajjQeDaqtZVrtFo9ezm0FeMs84TthWse8rMrea
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(3023799007)(56012099006)(10067099003)(18002099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mWss7045OAw6M9PbB59RLZi7uHI3opmYcJ0rHNdjRIyXEAcBBNDINf8GTI41?=
 =?us-ascii?Q?81FBcK9wU46K9Qfk/7bGIfX2C8tbTWzHG80P5C6RSc821ESDMJfx+NQCcCGw?=
 =?us-ascii?Q?wPhDFg60z/DQFHtZvFMCInyi4JqZKi4gm9qquBz6xH6/44UMaPTEIAjPWkTq?=
 =?us-ascii?Q?PIcRCltASFV6jLAGkVH90x38wwoacZimcP+O7J3UYZmnaxzxph+pVk4neIMz?=
 =?us-ascii?Q?ik1NLP022DkST0+REKJTGAAGyKHvoHFuBkRIxs0CilbJgGxfPHSUSy3QuBXU?=
 =?us-ascii?Q?EooSg3BiAJI7cdBx4MjKrFLYjrjUTt9AmLRufD6iAT4GMkb3VK6COz5d1pf6?=
 =?us-ascii?Q?CPCZ/ji3Gv1A+jTL8MDrMrmQVyFqKHHpQ/bk7ph2sX7S/j8cTzlr+LeTN/RU?=
 =?us-ascii?Q?PAJ3pwa3MlQU2wpYWXG2fHCJCG2qWQfjpdwY1ENBeherpn3XfkZ07b1crx7/?=
 =?us-ascii?Q?Ca+U2Z+TBOU+sUYJ0I2TGup0T1NU/jjyPAWXhDJuGQekkmS8ZC+/zaa34ZqS?=
 =?us-ascii?Q?xwaLh6z6lk5RWmHGvAwZCvQreKu6eM9RYs0APhk8+cNjWj0cyWwJm2C5N5LZ?=
 =?us-ascii?Q?ku/gKQ2j2nxiRsaPL/M4gPGadoJUsHJJUefjBNFQmvsBALhivQ2Vk/VMcTPb?=
 =?us-ascii?Q?dm/5yvtSdmiFc/AjPecgkp+t7Z28Q/BGiwM2+FYyIDSelLvy6PCUXYHkthAK?=
 =?us-ascii?Q?JaSLB3Y1Q3I3DTHlZ4upduMTTy/ygYt9HiarjWbNn4lhPnnUiScBkB44R95y?=
 =?us-ascii?Q?fwJ1iPjDG+KxUq7vGlXHfHe6I4gTXXoaqhSoNXfS0dvDy1guBcmGwPs2GCzC?=
 =?us-ascii?Q?cZpCplrCP5Ve+BZzsJxFFIzFvRuH1+RPqS29EEMZPq0KjohT1WIOQcVlJfgl?=
 =?us-ascii?Q?OUA5JggGjmg6VecPygfXA/GM40pKsG71hwTHBFuD/+yhRRfdYdJEWLSHlhJS?=
 =?us-ascii?Q?bsg9rFF1zvFME/PyMXgQS7sRmVZLUf8IlBjr/EVhDzahw6cN4SQKeY40JX1+?=
 =?us-ascii?Q?TUGSQi3S8/+qpzYP24sBBrSnds5jltFgZC+uAAEnu90bPO5q/2yA+1xvO+sO?=
 =?us-ascii?Q?b0u6xDEuA3mBPsxHeVEaRHwznUonHYrawLTlCqq2pesf0+ubVUXWYfaJeJOd?=
 =?us-ascii?Q?Uomdox/S6ALJ72aC04+c3UnaXoR16VFT5O8LIQclzgTsdxdHyLLs6SiAxxg4?=
 =?us-ascii?Q?m4Ov2BBN4JqnQP0nKKjgHBKDihRtBNGkjk47Sdn0Qr4JShWcNwLSyx/ihCLs?=
 =?us-ascii?Q?vrV6Xn0j4AjieTEjsuxL1OakjP5JK0iAYK/uBFckGMn9L2JNuiQ54IJnRXJh?=
 =?us-ascii?Q?s56u0VvGF//9cunuCPq1sbtMCBEve8ALUqs12iI8rUMtyLYAXEiVGyWB0gKG?=
 =?us-ascii?Q?Z38jUGsIrS/gSOsuwlFpCvmi6Is03SA9XApqBBfAEHtN2cdyANJS21Zon7NX?=
 =?us-ascii?Q?k5sD7aF1AUFysI6FK6l92vC4CDy9yeu8bQ2TSs5nDsYPTHwzHeCBzZO2IhZG?=
 =?us-ascii?Q?y7+LpvE+pZ8naAb/QXP8XlfPI5QUvZ456bw5zeclcB5uraCpsXewrU+CYPTb?=
 =?us-ascii?Q?FJHTSaEHHso3Xy+zn2cQY9sc5YEYMJ7oF03FD1GWAgYjZmPOvrb8kQDsHSHm?=
 =?us-ascii?Q?LmFmGLByXnd5ulMoT7k6FhRzeKYkzvh1COwMzXkU5cGBoICdMwhKwTRRojQl?=
 =?us-ascii?Q?Qx13mYmPQEd6gPcrwV7dexn65+vm76td+Q7LR/pzbT0lxHR/1LyixNw0Td1q?=
 =?us-ascii?Q?gyUYytDaOA=3D=3D?=
X-Exchange-RoutingPolicyChecked: FSpSmn88Al/8KFwvyRUSzOHgUg20Kuyx6+gJsaY0adfBEFIABPcl4SgjtdIRqijsrGubVBLUfPOFhr/gDceD8kc8OtLiLxJfV83M5l4MHC8slmS3Lz6a29F573EmRzBaXmGtxR6v4dFbPwXMU42khwxmWgZK45YSMbTXRC5ksJbwfUSLqQ3MPUgkUmwX3xCdwP8VIhWVW2jaUoJOcj0zcfqUgoWK4Y0ZMtL6UhkcEmvZzeCdNaQmEDpWo/1/ttQeXgGNlAvI6oFQ6pnlbdQi7wlVGePidzkKUFn6vG7LqTVx+gvNrq75AO4LANZwobGB7p75WXD949ZxdZbM00mfpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 429c4dbe-a67e-454b-a99e-08df010cc76e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:50:50.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImnLn1k+PWhd+hzjSqHDn7k7TDyklwzMpzVttYR0wwY7tNFt3V0wgTonaNZ4S/8a+NijFHF12Ys/dS0cFhT+zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   f42b9fb4248a76449873cb91cac2696aa1df9818
commit: f42b9fb4248a76449873cb91cac2696aa1df9818 [36/36] WIP
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2054-20260821 (https://download.01.org/0day-ci/archive/20260823/202608230840.AaS8mMAT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project f39d58144cb1dd40c4135af6ab2ff17ffa3d902b)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230840.AaS8mMAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230840.AaS8mMAT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc', 'usb4_3_nhi', 'usb4_3_rc', 'usb4_4_nhi', 'usb4_4_rc', 'usb4_5_nhi', 'usb4_5_rc', 'usb4_6_nhi', 'usb4_6_rc', 'usb4_7_nhi', 'usb4_7_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc', 'usb4_3_nhi', 'usb4_3_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc', 'usb4_3_nhi', 'usb4_3_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc', 'usb4_2_nhi', 'usb4_2_rc', 'usb4_3_nhi', 'usb4_3_rc', 'usb4_4_nhi', 'usb4_4_rc', 'usb4_5_nhi', 'usb4_5_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@701ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: nhi@f00000 (apple,t6020-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000: failed to match any schema with compatible: ['apple,t6020-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/cio@b01ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t6020-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@381ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: nhi@f00000 (apple,t8112-usb4-nhi): apple,thunderbolt-drom: b'\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000: failed to match any schema with compatible: ['apple,t8112-usb4-acio', 'apple,t8103-usb4-acio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/cio@501ac0000/nhi@f00000: failed to match any schema with compatible: ['apple,t8112-usb4-nhi', 'apple,t8103-usb4-nhi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
