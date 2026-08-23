Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F4368D67
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487365; cv=fail; b=E4Ibdi2HWBxCb730JD9vAAmGVUu9uP0is9HS4dCahA3YgYd10/FE+Zg0jm/HrD/KoCF0YaOxAYyG8G2FRkSnKm9ZwUW9N+X7c4L+s3FI6+SVM6Ki6j8wDAoGMoZT91OM4uS3nFvCI+QI95tVEVy+645PrEt09UEhes/c6b+11wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487365; c=relaxed/simple;
	bh=92GMpvalGztUWwfz4eMfTYfSMd0rtNanitzsW4E6lu8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jrPSUGeHFS2/UlXN89tsMnKD/ZRB3cvP0KI3Xq9j/wCBUZ1HxV970+WvFrAeH1EEsqD2VBF0KxUHN2LKMeVLq8rLttZ3x1+r0jRlIlmawBcFH3YVROCDPE68uSYZjsUudYztevcul6HBAQ87YlgfL0bx0+/UFwnOb6jB64iJNXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv7T34Dg; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv7T34Dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487363; x=1819023363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92GMpvalGztUWwfz4eMfTYfSMd0rtNanitzsW4E6lu8=;
  b=hv7T34DgTi8mRSUxlQu8iXDUGvTzz/FhkQWD3SiH7dKi50jZw9EpxRFT
   bG5wzd4/2pyNUC+Au8HgmWjBcH82SjF1G9G3ueDXRnXex8fkmqTBqq+j5
   DOD/y2DV3/Qj9hZOK48yfIiJLjQYdQobKJHSiCSzAAVeqTW4BMjLaRv46
   CFBZHFB/cpM1LIhtobgwLdB4Zp7xVylrvJPhyqx9YOpoXP9STQppqjFFa
   bujYwFC+EVG7QNeCpdeW3X1eCfL4+4Yuh+/Nmz2wqFEHAg8RbDafNdeVS
   uvjDRPvKLAwoDDVoVPTD85xids0PKOxdPRji3j5/5u1t/IOUiunPbyTIs
   w==;
X-CSE-ConnectionGUID: 4qXlW8kvR7mhTEy1VsergA==
X-CSE-MsgGUID: sKbLsfMwRZi1fLqXtsDdtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98551809"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="98551809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:16:02 -0700
X-CSE-ConnectionGUID: OEpOOIA/SrKF68zUIRfQ7w==
X-CSE-MsgGUID: Vd0yA18jTNS2sFWb+1hR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263059030"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:16:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:16:02 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCV3cMZa0o9WCcKXONPACoVRHghWH8VpPfe+iHgQ6t1LmQAkzY9bETONSO6YNLX0kW3QhtL8yDsQ1B6WuyldILp1jU6OBjaGIkjiAwSayEpXV8wk/gu7WNxmpTNJ3O11A74s+PajV72kKygVgoJQPwNllPb+RrIp7jsUkmrtc2CMxm/DjYkqfMTRqUyK5zcwnD+LsQOwCPHzylQb9RUl+rvLFtikwU7mmKxC/z01tZO8Zf2gZ4HGoJy5kuW3PfH4RFOOQcYLgisYjztVJ+gbFZiGxK3EXV3XM2T4X7OF9W2wmYY6wrG50AQhymIEaLHosfubKer5r4edGLVx7CKSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvGtYpxKtPzLXN8wmdlJMDW6frxmxsyF7BKRhIQz+/c=;
 b=PCU8gq1+gQeo7Abg6F2DN4LcJuBoAKk0tX4spG+/aSs1zjjZJtJXhULq82a+rIrqfAEH72mDJfxfQqjwdcF0fZuXMYESi/RQwpCDCjNJ0z4WnTvyMTE8GrWBIwmoAwJvpdKfczRyj/Bii7t0qABTO6GVR1/Q86oVElw2QKKbJK24fJNzYDZzOQNeCwFRwFuP//9MOY4nvFQhzBAlQClU44Q+cECp+XDkIe07O1kt2AqkEast8Gjo2u2j9r/2MVowglB/6TiaFS2uLAnEQv2HBUwHEWSvdFfgpdDB4tioURF1xKKyV1/BVc9LG5s+n2cIH4iccgaGc8biK7PNaSjDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:15:54 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:15:54 +0000
Date: Sun, 23 Aug 2026 20:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: Re: [PATCH v2] async_tx: use the channel-switch Kconfig symbol
Message-ID: <202608230650.oZ4LyTZ0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b9e40867-1021-457b-6d01-08df011047f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Rofx/iIeONiquRT7dTz3BORrCP4LfqeI3nMuQgZN2o4E0TYoLf9MR28BANBrTHU4Y2/iNcQuU0FE1HqXnI2IWYkjPWP8/ENpGx8S8fDOvJZdfJ4d/BmpmHwTgCHUZn4NPoQJYbAtn4c4DU08Ix1oZlmZBIW4eUMUDKpG2YVeTnGN0V6kqi2VBxH7qPxU1WPwDnHQsQZy0I7VYza07EEAth+OQQU0rQGnSCg0iFmOd5GwTg0N9g5BYVuBjGLPu6pwOrKAiiVumhWq315f33dR+pO34yT/CgDzv7/dyQhTeG9B/Moz1vLjOnUjzZah8a5sSith5BVcdOs2E5waw5q7GYBwnuIvvLKQGHIdRS9+5g7yQb/+qjWJfoDUhV75srSdaPAoGRrgMsoO7KBSABeRXIwsrf6p/2pPWAb1farBiQb24EtwGgAbVUSgxYg2ZlNboSmAel0VoFQ6awEO3Km+wqYLuRBEz+rPgtDkEouVNKEnvgcCsFraSbnV23g5pkpGq99Wh0XKVKbfrZL7AHdV60/SosP8YHw7qd6OqtyyvDcNZbpZtLkR5g+GO1TGRZ5c9UVSue3bGdO0e6Wg38fswghP/s3EbfXjwKL3FifcxGVyzbQXomeapUSnwJmouOnf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?59E1hUj9nXs/yqKMVqmYZlHdeuuFlNRj6g5tXAWIYN2VleJb1x1neJriATa6?=
 =?us-ascii?Q?h+4VBEqA2Nl04xTBd/Tpcz436TL13yu00MS6t44oDXVY9FMCjUk7lLweYxir?=
 =?us-ascii?Q?HUVEbbvwoqedJjZ54jTsw1fYra0De6B4vqXeuHElhaVwOyfVFbca8BYCg4Ie?=
 =?us-ascii?Q?ya8KjPMMbhDX9NJpJbTZDdizRqjPL5yGoOQ/IpOPdqDbbjldpPZKZj7lyVfx?=
 =?us-ascii?Q?L0MGPsg7L8WxpOV/+fpLxAy27v6BEn+bR+YrxybcQfHcjypY1JdkaK1Lldxo?=
 =?us-ascii?Q?gBcpedt8N+dxlmUKWX3L/AnaJUPkmPnYn+/tqAL2Wp/a9f6oHVxPCPR9CSdH?=
 =?us-ascii?Q?96Qq+7r4BK+GHl0G0Azi3zQ2bYGWeBkjqwyZ3x+YknlBqZM5xibzj4lKGGe1?=
 =?us-ascii?Q?ns7RkhMq5utbOjb4TSiQbX7TdqL55EUi+ivMHtyHd2uX/HsQyfS2M66LW63g?=
 =?us-ascii?Q?bWVE0L//2RXbhLxNQ8c1g3JpKX2ryx6CFsCa/LVrIv2PAkMxWBol6ld0M5zf?=
 =?us-ascii?Q?UFjm9mSk1BRv+AVHhIlyLQqX/lYAKufsN9Clg4zMmYdMJfdjydtAGJ8lQ/j3?=
 =?us-ascii?Q?4eC/9SWcfQsoKvd6Gfb51nC/O8kEXBhXrE2e+Nstxw00E0tLsm5D9NnFJsre?=
 =?us-ascii?Q?d6/7XfbEpC2mR6SCjWyNIeiJSUp8eDbdsm32j7J3wWiOACTGzdXO8RIEKWLB?=
 =?us-ascii?Q?i6vfaS3OuUJ/te7oHNDrGVgEOkQknC9gGXy3dZZAAdhIDQw+eM3S9uzIIdI1?=
 =?us-ascii?Q?HAUeo4w85jvIUWhk7EDeF3cafI4KL/GhzzUiZ/3Cib42WfcakAqkhzIoZoHT?=
 =?us-ascii?Q?JmV4TltmY60/NJPU6+xgLe2GWZkj62L1TmKN1HBLG6A+hfbfjnwxIA+MNbMr?=
 =?us-ascii?Q?tjCncZm5P0+J0xKUnT1ZzYsRb+X2ncwzfh0DUSPsjC7g9iodNDH3RfuR5Woy?=
 =?us-ascii?Q?k3UuV/3UuAa/vQ3l/zK5YEwHaGSqCnL9QyGn3v0IDj+VSMu+9UzB78VSiqhd?=
 =?us-ascii?Q?fkCqFZ4jVE1DsjAfCBRvey6AQD2MM7nqBs2ZHJTH2vCdIIXyDR2bivbAxuvR?=
 =?us-ascii?Q?tnIxXckqZ0ZlzoDckXDFgnllnHA8BI/JExiT4PEbKUMKYqx5xSeHW6RZVHPW?=
 =?us-ascii?Q?qLv7UM+R01AesFTPkL7r5a4Ys94aKMa0SCc9VtdbhcrFp8w09szNKDASIL6K?=
 =?us-ascii?Q?66tYuG6HS5wIEHUd7MQMFZ3g7Wqu8BoDxPHcj71SgRqRpvLA7SERqEkIsgS3?=
 =?us-ascii?Q?avxGktsg4gEPfiUA7NUjLdUllL8rgIdjnB2e9BuNMeQGLmrBNZrhyhR9lzpK?=
 =?us-ascii?Q?Vyz6jw2+GJYqIhI8yBw4mTd+y+3sYuocx6irnabDm+Y3a+x8rki29fIOrnRt?=
 =?us-ascii?Q?NwM+Ldabe2Bvil+XLxmXCvn1uXuBn+Njphvg3qv/Sa/faeH8wqpM4G69L8Fz?=
 =?us-ascii?Q?JwuO7sD8ZE8sBpaXkqhnh51pgXmCUkMpNoNgcMc18S2IuuiuDMONYzQBLrRB?=
 =?us-ascii?Q?6lDpdtvYyjLhVyoKcz92JOfKDDUOGvy77IMQlJ/GO5Mki9IwB3J/mjzqrIRJ?=
 =?us-ascii?Q?ZkcCIKtOJo71YEI67rXV5eH+QW5fQaIwafGR5kThKvzpEctNCzrM64Bh8Pz8?=
 =?us-ascii?Q?J0KuMIWK99RJAxaUh6N32B2c/EXz3erp7DxosQ7JbCMFFiABpNuBjmCrLmGI?=
 =?us-ascii?Q?5MSKEjXEUYobjFq1uWaF1AeTBRNnChQdc6UR7Xn/5n6SSg+8v9b9UsKLFitb?=
 =?us-ascii?Q?ZSlegNClDw=3D=3D?=
X-Exchange-RoutingPolicyChecked: jpP5obHR7g5uHR7XJvYUI25kRyyco+clEhJu51rq+Bd5wSMJyjgNl3gSE333OESm1PtOG9GQ/7g+MhyLqrl3N/2F9QBspTCIEu785pPblQx9+Kb8nKmh3aBfU8xyh0HdTPd9jExniPAdHcQCMJ/ltiibJqXjumO+GNcaTlJ8OuL6+pdxWJv0vtYUaikCTpSKbb9UWcv5CitNlr+hCik4cSDi4nZyc4RyJ8jPN+D7PeuVhIHmcV/bYfKx4S/zv3ho3usQhc4mapDsAWyCFRDvtFe33KNpmFRWUslcOOM712VwIBWshpnJPA8XmkLI1tFxY/hnSC2AxsWjDVCasjjMKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e40867-1021-457b-6d01-08df011047f3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:15:54.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2As2w5fusMSB38vKuYAkdEFgY2pNux0zzXHuzuXR16hglM+k4+4KnQeBU4UbPj6H41YSl1mv9OqeKccZOlcw2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260814075403.13950-1-pengpeng@iscas.ac.cn>
References: <20260814075403.13950-1-pengpeng@iscas.ac.cn>
TO: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: linux-kernel@vger.kernel.org
CC: Pengpeng Hou <pengpeng@iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.2 next-20260821]
[cannot apply to linux-review/Pengpeng-Hou/async_tx-Use-the-channel-switch-Kconfig-symbol/20260807-091006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/async_tx-use-the-channel-switch-Kconfig-symbol/20260814-155403
base:   linus/master
patch link:    https://lore.kernel.org/r/20260814075403.13950-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH v2] async_tx: use the channel-switch Kconfig symbol
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: sparc64-randconfig-r053-20260823 (https://download.01.org/0day-ci/archive/20260823/202608230650.oZ4LyTZ0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230650.oZ4LyTZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230650.oZ4LyTZ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/async_tx/async_tx.c:43:1: warning: no previous prototype for function '__async_tx_find_channel' [-Wmissing-prototypes]
      43 | __async_tx_find_channel(struct async_submit_ctl *submit,
         | ^
   crypto/async_tx/async_tx.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | struct dma_chan *
         | ^
         | static 
   1 warning generated.


vim +/__async_tx_find_channel +43 crypto/async_tx/async_tx.c

af1f951eb6ef27b Dan Williams 2009-08-29  35  
9bc89cd82d6f88f Dan Williams 2007-01-02  36  /**
47437b2c9a64315 Dan Williams 2008-02-02  37   * __async_tx_find_channel - find a channel to carry out the operation or let
9bc89cd82d6f88f Dan Williams 2007-01-02  38   *	the transaction execute synchronously
a08abd8ca890a37 Dan Williams 2009-06-03  39   * @submit: transaction dependency and submission modifiers
9bc89cd82d6f88f Dan Williams 2007-01-02  40   * @tx_type: transaction type
9bc89cd82d6f88f Dan Williams 2007-01-02  41   */
9bc89cd82d6f88f Dan Williams 2007-01-02  42  struct dma_chan *
a08abd8ca890a37 Dan Williams 2009-06-03 @43  __async_tx_find_channel(struct async_submit_ctl *submit,
9bc89cd82d6f88f Dan Williams 2007-01-02  44  			enum dma_transaction_type tx_type)
9bc89cd82d6f88f Dan Williams 2007-01-02  45  {
a08abd8ca890a37 Dan Williams 2009-06-03  46  	struct dma_async_tx_descriptor *depend_tx = submit->depend_tx;
a08abd8ca890a37 Dan Williams 2009-06-03  47  
9bc89cd82d6f88f Dan Williams 2007-01-02  48  	/* see if we can keep the chain on one channel */
9bc89cd82d6f88f Dan Williams 2007-01-02  49  	if (depend_tx &&
9bc89cd82d6f88f Dan Williams 2007-01-02  50  	    dma_has_cap(tx_type, depend_tx->chan->device->cap_mask))
9bc89cd82d6f88f Dan Williams 2007-01-02  51  		return depend_tx->chan;
729b5d1b8ec72c2 Dan Williams 2009-03-25  52  	return async_dma_find_channel(tx_type);
9bc89cd82d6f88f Dan Williams 2007-01-02  53  }
47437b2c9a64315 Dan Williams 2008-02-02  54  EXPORT_SYMBOL_GPL(__async_tx_find_channel);
9bc89cd82d6f88f Dan Williams 2007-01-02  55  #endif
9bc89cd82d6f88f Dan Williams 2007-01-02  56  
19242d7233df7d6 Dan Williams 2008-04-17  57  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
