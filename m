Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675B364E9A
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485523; cv=fail; b=pDaXk3fQNUNfSJvHwTIvk/FCUb5Q+6MuZicQ12U3EFXfByDLB4VsBm3tN4vmmwfpdhERWy8OPZFQ6I/b6QNzSSsKFSXP0mhDkswZLriqxMf2WLjsgtEqBzO92ZfHI52OaDydXdfLUN890k/QdqnCsS8YDbqWr9cejRhPzT+Wh90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485523; c=relaxed/simple;
	bh=RWnS87ccXtipUzlUW5Rpj0MZNKhri1JvITvqDPpqn04=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=h1/xtM4036ugLBLaHaXdej3ggorpfN1gDEgjiScKzAssZqRhfk/qt5A/+Z6Mh6H6eBxcJgCqm7y0CiHQPGlDHVKWgwiqwMSPU4+FDLizm8hFRbZW22ePXglEISW7ZGeLj1QAT9a7QKqvjvC8T7hyysOOJpLnGCP71rWf6TepHvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uuou7dyP; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uuou7dyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485522; x=1819021522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWnS87ccXtipUzlUW5Rpj0MZNKhri1JvITvqDPpqn04=;
  b=Uuou7dyPanSOTdv07fl2lF365hJdurUYnIIMWw/2M5veWNzhErHLv4Fp
   xZOjOJNz1zd+0dhHkpyGt1JhbZE7asSP7/WNSVRUM+V/Ony/vuCpb/J0j
   CB/O8nJFADyZX1vL57vvx4gKOJ+Ml3pLMiex392rtDg79966bjWWuya7r
   S2yQJr+IJB2FNL8FFKX++SCbIur1wazIV5K3NVQb3KAjSyDcSnLj6Sz3y
   xmkP1qa8UROGg1b1J1dy1eaKzeJVy9S4u6L3N0U9YBgICvfKsK52ZUv95
   kasxcsp232gSbrre2rkEY913NGrLlQklR7Q0g4BAlEGSajWdVXvgnlbQ5
   g==;
X-CSE-ConnectionGUID: bM08m43nS9GXil/HU7SyFw==
X-CSE-MsgGUID: cmiUvLPwRIKObpT+jVX3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87820526"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87820526"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:45:21 -0700
X-CSE-ConnectionGUID: +Rjr4/e/SqqVtSOI69Y+xg==
X-CSE-MsgGUID: nkDC4De0S7irhuF9XRvJSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="267329924"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:45:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:45:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:45:20 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2jAK3C0pacHhHCmX+fw+UTHsnVcPfkTDVPqn/kXzPQNv9TJSJ9oEZyyFSYwwhnIvtDFuPYVujL0KPX0YcGMq15RenkdRz8eQcCkrY8qPdzWyIWVonCk+oMuqNi+TeMA1jwV+jD72/+suIKNaS6jIlAOkvUBePLSKZuL2VJ3+oWVO1uKNywUno7W8e7el0r2OW+qh03/MPtKibMvU164T6y1SQQ2REF1H1zW1tlm3hMF5gXSv0GZo+4YAuJGrSxrS9jWfs0a0C0ef+7lT27dgfoQ9U3vIQUySauq82WN/V/YlFXkUaG+BHB8njSZOjfFomZoyHQfkZDgng0Ii+haCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aAd7uY14VJjp4eKqdKnK5H4kyznu8MAIO/fWEi+VAw=;
 b=qO6hmcsKRhVABh31ptwdnQFXK6T6R90vMKCxwcd9GWXNa9KYTGmFu4E3OvFJ8xyOfDN4ZS9lOK143a7bfOs5713GNSikE1hVxHO9sWkdrNVgLYHW6koWXFLs7Pq0jVV6drVcQFx2yWDXpKb3ElAAhk+cBhZS61iStC2G19BO04T7vg66ZQcpxwv9D4n+eVhh+L5ylRPHNTEFQof7M3P2IIdxV5qmPXmOfdmWqJV2ck8lW4JoQWYjsYY8wxcs7ebj1Tieuc8PxwQOYVAAekUzhaNH/SiMYrw8ML1H2dXqEBMAlGyDWzCWA9MYuNgnAYwn7f8gBbudoIB0Ss7DNbtltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sun, 23 Aug
 2026 11:45:12 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:45:11 +0000
Date: Sun, 23 Aug 2026 19:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management ICs
Message-ID: <202608231513.PfEj0vse-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0015.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e3823a21-c0d2-427a-43ea-08df010bfd18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: POK40kRgmriM/0r/FSvxDcobDZWLFItgCCbHBCwXv+g4V3vwPM04CtHE7kCi5VDkDCRrEfBnlj3itgGGAJtgKsRrOEKN+RG04v4MlSuPWtYqjrEIMDi0NqSI1Eelgd6bQarKotZeW6boOT9ewNzCc+PkjeR9WD2MCqft1+Th1+G1u+c6+k7VwQ2aFKJ6xhutUISlhX5N6WR4ZOf9Tr7iLsrqu46fEYjWGtZ/KPdjgQEdCi2mba4dUMzCdMacaQdVHAj6ifZIFtl4OaaWJtW3oYmghbZKX058439kes6Mq1K5Yfb6KfceC2zaA5wSqK9RqcJOPme8rLpjFWlBN0mGAUhMUvnEXM0SKpQLDgXDwqbOFWblqPBNK4SyKmnjn6hwbrlZfLZlF2h3ZLaa3Mn6e7cJy07dGKRuaF0fDnX4Xquc0jW7kC2E5sdYEZJezCFRwtDgMDJ4ZHhz4W1OH/mnIPjFCh0O3Vl6jgMUraOPTx8WXl54LFXCIUuPDd49eyL8aUEEm36Duv9Ec60NyjPWOX3WH+3O65JvAupsrccopD/Ap57myPeQxlNa8kX25AuMdNh1lQVJt02JuOPPzhf36uhkL+1MoKT90ErSzOc1+HtIsQjAz73IA6RzgV2gCCIn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V5vuKnL2ahoZiFx/7O5z7B6LW93ZBHvXtPe2ADtr7rCI32LdRKGJHiTb7qGN?=
 =?us-ascii?Q?8Lzpazxwa6TfC6HGXjWISPNreyqQHZdbyLpulgUdumSeokkWZSqWbW9FCIzn?=
 =?us-ascii?Q?v9vf0bd35qCeoxctwIezpeqK6dvX7wqvsPor85jGrTfpS1yb6WYX6BGkMtWc?=
 =?us-ascii?Q?TLtj4XA+fBSY5LM0TGpBdUbPrBHnEhjWWrCpB5SXSysGBixSQajp4CAJuuWR?=
 =?us-ascii?Q?2ZC+NmQ8iV6YG2bTYZkCC8PLnGgwjSgEf0XCxz8sPc/U+EZhY5fLzJp/4xEW?=
 =?us-ascii?Q?Y8Pqab5Kbh7qAn1PUxQj/3I1o4/GNJoPZnA64A/oBS/DL8JOQgXWWVuJvxoS?=
 =?us-ascii?Q?dq9OIAX/D69y2k69L//yUt859+I3kPlLyxmp0igt18vu8SSlKHzjL3JWAH4D?=
 =?us-ascii?Q?0JzZHXcD4LQotFo77GXVZncthvLuuktryBba3SEdk8ZaIazBsn2H+5lvx2hP?=
 =?us-ascii?Q?IjNqBNzuBtc1yLDsKy6zd75X2W+TpffvZ1x1oI+l3EdRRKHbEoZDBfIMwVbb?=
 =?us-ascii?Q?6wML/abLgEmw8R/SvxYMdcDQ+5bbfgp85Iw2mEB9Ze/ps/k/MddsZaxhmIO+?=
 =?us-ascii?Q?8CMzsm/3bd6vcE5119dvydOthRegivSgXoRpvlDVZs7SoJKylC5+iqPLSisk?=
 =?us-ascii?Q?wX38A2b9u0NkJQSzsN4iHaF04VHsSnfzq26C6RSKTMdD/hucZbLnmv7pQZhP?=
 =?us-ascii?Q?N8pK4dPZZ0pWkTCRqWVPRRzeK0hUBq0u/bM0fDssbsIh3wRjlgjJDoXDzxLN?=
 =?us-ascii?Q?Jb3pbTWEswoBwlAGAgD0t5scMIBE7clyB8cWpvsvanBuBmpmfUSeGnC5/av5?=
 =?us-ascii?Q?NEVOLAXWDy2Y5vDYsWkJ44pU3nynhZSmh1egRi/nyEk0VbDHv5WIysQc19HV?=
 =?us-ascii?Q?j75WsKT34BxW74/q63GACSSpQlbJcGk0MF2CsQIvjyRteM8/dzs/lWgSR8bp?=
 =?us-ascii?Q?3q2BkhEIVDo+3udPhlPNAY9GmQFp/HFh5CiMkFk96w1iDVjOKaUvAhXJZejg?=
 =?us-ascii?Q?dZ3Df9LWTOs7Vgs/yz1c7Phe+Vj7WtXEcWumxd2zsnF1jy4WzwI3jalg9aoN?=
 =?us-ascii?Q?MZjzzVfRDpy99wKnqB0e0x79vWi2OTMqqoFrvQx+0kne8ErYC4KUEdCQqfCE?=
 =?us-ascii?Q?+tILVCZJhkkQMtmU615t9Zq3lcIq9Yp17P7fJ4DvyqbuyoPvJZeriY/bd2PB?=
 =?us-ascii?Q?smrtOof1Tvf97Fxrul73HKGAubE+6CUG6rRqJc7HUAzoNp67PFzDVmORraq0?=
 =?us-ascii?Q?/E8NMj741Vmls3mH2Ww0eS85RRxitKvBv65xdXy7WK2a1CTjj+tbVmMhco0E?=
 =?us-ascii?Q?wetyME5ohgU+K59xt2GQsfk35z1Ye4QypiRsKw4mJhEnVWIy+h+8TuZYQEcp?=
 =?us-ascii?Q?HUMlcChEJc4QKJrVPAmcRD3K7TNEUy9pEmJu/swa4Us+YXWxB4g1/AA3j2VY?=
 =?us-ascii?Q?rzc044533pyWL2uWuvYy0ZvC5aQYCPXCewQqzTQ4DYdQhrKV/Mzpye2WAvJn?=
 =?us-ascii?Q?Nvc+W/aiE2TK+CIcnQYraJzoIZJgeRmljSwFcGopVhgnAgi6WIVGgtv5HuOr?=
 =?us-ascii?Q?OOQ2n4RI9KLrVKYj/7b1Vkl6jrXhjLzb0B9k7pEyqbT2tMGlcyqUi/tFDNHM?=
 =?us-ascii?Q?RpyvAuGIz9WKURiyW+SW09to05MAkDAZbW/LfJcxVYTNNXxtEJcpQag3/yNl?=
 =?us-ascii?Q?/UItPnpTzo2ztZw4cwPO5mLOfIbB0mVXJE6OJeN0ir58YKzULaISt6hIK+7i?=
 =?us-ascii?Q?2CYTPkg5mQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: qE+xj67fQCraLmjlFYTEBdFuJhJXWuEZH83TVjI4WRAhbBsL1WMhNubqL2Gfnj+2ahyoplXL1D6RavYdifo3DeVPO+6x6395xA34hta8Zgh2qeUs5LsjLi5P/bAhU+tCGNt21DvctpFa0rpU/ltgeuVCs9ErkaQHwKXKOThe3JFQxaY4IH/+HFodQTV2k1lelo1hj/iwiiO6sDa39K4rF3VfDaKF+OyEVlAmYZU2VpTqKfL6ey3flfvXwu91XF1VZk2oIo39nzgbwAfVGnwfmwqkzOYh9UdETVL0UhGj66ChYbFY45Q67dB+VVptUUdKZmWqEdrF2JXdajzYCpTsFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e3823a21-c0d2-427a-43ea-08df010bfd18
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:45:11.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQpBfixsioE5dQbUldy/L+3b0Hj20GKTGaNa/GfhCgt6kb3wHvcuu4bQdrOGq/HtknsN0cMQt+LCZleLHU70fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>
References: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>
TO: Stephen Horvath <linux@stevetech.au>

Hi Stephen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 75f2c0b3690702c90863c2e138cb5520670845ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Stephen-Horvath/hwmon-Add-Support-for-PMIC5000-Power-Management-ICs/20260819-233745
base:   75f2c0b3690702c90863c2e138cb5520670845ea
patch link:    https://lore.kernel.org/r/20260819-pmic5000-v1-1-e5e0ddcf0863%40stevetech.au
patch subject: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management ICs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r071-20260823 (https://download.01.org/0day-ci/archive/20260823/202608231513.PfEj0vse-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608231513.PfEj0vse-lkp@intel.com/

New smatch warnings:
drivers/hwmon/pmic5000.c:370 pmic5000_read_volt_thresholds() warn: statement has no effect 'const'

Old smatch warnings:
drivers/hwmon/pmic5000.c:376 pmic5000_read_volt_thresholds() warn: statement has no effect 'const'

vim +/const +370 drivers/hwmon/pmic5000.c

a0d30d2a53a818 Stephen Horvath 2026-08-19  290  
a0d30d2a53a818 Stephen Horvath 2026-08-19  291  static int pmic5000_read_volt_thresholds(struct regmap *regmap, u32 attr,
a0d30d2a53a818 Stephen Horvath 2026-08-19  292  					 int channel, long *val)
a0d30d2a53a818 Stephen Horvath 2026-08-19  293  {
a0d30d2a53a818 Stephen Horvath 2026-08-19  294  	int err;
a0d30d2a53a818 Stephen Horvath 2026-08-19  295  	u32 set_reg, thresh_reg, range_bit;
a0d30d2a53a818 Stephen Horvath 2026-08-19  296  	u32 set_regval, thresh_regval, range_regval;
a0d30d2a53a818 Stephen Horvath 2026-08-19  297  	u32 volt_set;
a0d30d2a53a818 Stephen Horvath 2026-08-19  298  	int base_volts[2];
a0d30d2a53a818 Stephen Horvath 2026-08-19  299  
a0d30d2a53a818 Stephen Horvath 2026-08-19  300  	switch (channel) {
a0d30d2a53a818 Stephen Horvath 2026-08-19  301  	case 0:
a0d30d2a53a818 Stephen Horvath 2026-08-19  302  		set_reg = PMIC5000_REG_SWA_VOLT_SET;
a0d30d2a53a818 Stephen Horvath 2026-08-19  303  		thresh_reg = PMIC5000_REG_SWA_THRESH;
a0d30d2a53a818 Stephen Horvath 2026-08-19  304  		range_bit = PMIC5000_SWA_RANGE;
a0d30d2a53a818 Stephen Horvath 2026-08-19  305  		base_volts[0] = 800;
a0d30d2a53a818 Stephen Horvath 2026-08-19  306  		base_volts[1] = 600;
a0d30d2a53a818 Stephen Horvath 2026-08-19  307  		break;
a0d30d2a53a818 Stephen Horvath 2026-08-19  308  	case 1:
a0d30d2a53a818 Stephen Horvath 2026-08-19  309  		set_reg = PMIC5000_REG_SWB_VOLT_SET;
a0d30d2a53a818 Stephen Horvath 2026-08-19  310  		thresh_reg = PMIC5000_REG_SWB_THRESH;
a0d30d2a53a818 Stephen Horvath 2026-08-19  311  		range_bit = PMIC5000_SWB_RANGE;
a0d30d2a53a818 Stephen Horvath 2026-08-19  312  		base_volts[0] = 800;
a0d30d2a53a818 Stephen Horvath 2026-08-19  313  		base_volts[1] = 600;
a0d30d2a53a818 Stephen Horvath 2026-08-19  314  		break;
a0d30d2a53a818 Stephen Horvath 2026-08-19  315  	case 2:
a0d30d2a53a818 Stephen Horvath 2026-08-19  316  		set_reg = PMIC5000_REG_SWC_VOLT_SET;
a0d30d2a53a818 Stephen Horvath 2026-08-19  317  		thresh_reg = PMIC5000_REG_SWC_THRESH;
a0d30d2a53a818 Stephen Horvath 2026-08-19  318  		range_bit = PMIC5000_SWC_RANGE;
a0d30d2a53a818 Stephen Horvath 2026-08-19  319  		base_volts[0] = 800;
a0d30d2a53a818 Stephen Horvath 2026-08-19  320  		base_volts[1] = 600;
a0d30d2a53a818 Stephen Horvath 2026-08-19  321  		break;
a0d30d2a53a818 Stephen Horvath 2026-08-19  322  	case 3:
a0d30d2a53a818 Stephen Horvath 2026-08-19  323  		set_reg = PMIC5000_REG_SWD_VOLT_SET;
a0d30d2a53a818 Stephen Horvath 2026-08-19  324  		thresh_reg = PMIC5000_REG_SWD_THRESH;
a0d30d2a53a818 Stephen Horvath 2026-08-19  325  		range_bit = PMIC5000_SWD_RANGE;
a0d30d2a53a818 Stephen Horvath 2026-08-19  326  		base_volts[0] = 1500;
a0d30d2a53a818 Stephen Horvath 2026-08-19  327  		base_volts[1] = 2200;
a0d30d2a53a818 Stephen Horvath 2026-08-19  328  		break;
a0d30d2a53a818 Stephen Horvath 2026-08-19  329  	case 5:
a0d30d2a53a818 Stephen Horvath 2026-08-19  330  	case 6: {
a0d30d2a53a818 Stephen Horvath 2026-08-19  331  		err = regmap_read(regmap, PMIC5000_REG_THRES_AND_SEL,
a0d30d2a53a818 Stephen Horvath 2026-08-19  332  				  &thresh_regval);
a0d30d2a53a818 Stephen Horvath 2026-08-19  333  		if (err)
a0d30d2a53a818 Stephen Horvath 2026-08-19  334  			return err;
a0d30d2a53a818 Stephen Horvath 2026-08-19  335  		if (channel == 5) {
a0d30d2a53a818 Stephen Horvath 2026-08-19  336  			if (thresh_regval & PMIC5000_VIN_BULK_THRESH)
a0d30d2a53a818 Stephen Horvath 2026-08-19  337  				*val = 14500;
a0d30d2a53a818 Stephen Horvath 2026-08-19  338  			else
a0d30d2a53a818 Stephen Horvath 2026-08-19  339  				*val = 16000;
a0d30d2a53a818 Stephen Horvath 2026-08-19  340  			return 0;
a0d30d2a53a818 Stephen Horvath 2026-08-19  341  		} else {
a0d30d2a53a818 Stephen Horvath 2026-08-19  342  			if (thresh_regval & PMIC5000_VIN_MGMT_THRESH)
a0d30d2a53a818 Stephen Horvath 2026-08-19  343  				*val = 3800;
a0d30d2a53a818 Stephen Horvath 2026-08-19  344  			else
a0d30d2a53a818 Stephen Horvath 2026-08-19  345  				*val = 3700;
a0d30d2a53a818 Stephen Horvath 2026-08-19  346  			return 0;
a0d30d2a53a818 Stephen Horvath 2026-08-19  347  		}
a0d30d2a53a818 Stephen Horvath 2026-08-19  348  	}
a0d30d2a53a818 Stephen Horvath 2026-08-19  349  
a0d30d2a53a818 Stephen Horvath 2026-08-19  350  	default:
a0d30d2a53a818 Stephen Horvath 2026-08-19  351  		return -EOPNOTSUPP;
a0d30d2a53a818 Stephen Horvath 2026-08-19  352  	}
a0d30d2a53a818 Stephen Horvath 2026-08-19  353  
a0d30d2a53a818 Stephen Horvath 2026-08-19  354  	err = regmap_read(regmap, set_reg, &set_regval);
a0d30d2a53a818 Stephen Horvath 2026-08-19  355  	if (err)
a0d30d2a53a818 Stephen Horvath 2026-08-19  356  		return err;
a0d30d2a53a818 Stephen Horvath 2026-08-19  357  	err = regmap_read(regmap, thresh_reg, &thresh_regval);
a0d30d2a53a818 Stephen Horvath 2026-08-19  358  	if (err)
a0d30d2a53a818 Stephen Horvath 2026-08-19  359  		return err;
a0d30d2a53a818 Stephen Horvath 2026-08-19  360  	err = regmap_read(regmap, PMIC5000_REG_SW_VOLT_RANGE, &range_regval);
a0d30d2a53a818 Stephen Horvath 2026-08-19  361  	if (err)
a0d30d2a53a818 Stephen Horvath 2026-08-19  362  		return err;
a0d30d2a53a818 Stephen Horvath 2026-08-19  363  
a0d30d2a53a818 Stephen Horvath 2026-08-19  364  	volt_set = range_regval & range_bit ? base_volts[1] : base_volts[0];
a0d30d2a53a818 Stephen Horvath 2026-08-19  365  	volt_set += (set_regval >> 1) * 5;
a0d30d2a53a818 Stephen Horvath 2026-08-19  366  
a0d30d2a53a818 Stephen Horvath 2026-08-19  367  	switch (attr) {
a0d30d2a53a818 Stephen Horvath 2026-08-19  368  	case hwmon_in_min:
a0d30d2a53a818 Stephen Horvath 2026-08-19  369  		/* 10%, 12.5%, Reserved, Reserved */
a0d30d2a53a818 Stephen Horvath 2026-08-19 @370  		const int min_permilles[4] = { 100, 125, PERMILLE, PERMILLE };
a0d30d2a53a818 Stephen Horvath 2026-08-19  371  		*val = volt_set - (min_permilles[(thresh_regval >> 2) & 0x03] *
a0d30d2a53a818 Stephen Horvath 2026-08-19  372  				   volt_set / PERMILLE);
a0d30d2a53a818 Stephen Horvath 2026-08-19  373  		return 0;
a0d30d2a53a818 Stephen Horvath 2026-08-19  374  	case hwmon_in_max:
a0d30d2a53a818 Stephen Horvath 2026-08-19  375  		/* 7.5%, 10%, 12.5%, Reserved */
a0d30d2a53a818 Stephen Horvath 2026-08-19  376  		const int max_permilles[4] = { 75, 100, 125, PERMILLE };
a0d30d2a53a818 Stephen Horvath 2026-08-19  377  		*val = volt_set + (max_permilles[(thresh_regval >> 4) & 0x03] *
a0d30d2a53a818 Stephen Horvath 2026-08-19  378  				   volt_set / PERMILLE);
a0d30d2a53a818 Stephen Horvath 2026-08-19  379  		return 0;
a0d30d2a53a818 Stephen Horvath 2026-08-19  380  	default:
a0d30d2a53a818 Stephen Horvath 2026-08-19  381  		return -EOPNOTSUPP;
a0d30d2a53a818 Stephen Horvath 2026-08-19  382  	}
a0d30d2a53a818 Stephen Horvath 2026-08-19  383  }
a0d30d2a53a818 Stephen Horvath 2026-08-19  384  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
