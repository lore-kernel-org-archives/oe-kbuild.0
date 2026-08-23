Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17663368D67
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487192; cv=fail; b=h1aADF/NZlw1lsb6aasixas32BcwB7/MdcJIjHs9skNGsn0ZrRbgHsEUuJWepRSrNwtOeMTQDLl7zlmcfcnRAm0QeuSSINPqud2+8UBxUQryE1TyK0FfPm8jIZZosHdr4lRzCUrB6PuwAB4Ib4CkRTRCzkBgu+eNxjerSYtiSok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487192; c=relaxed/simple;
	bh=Xos00UkSbC6tBWm3NQ70dTFt7ZKC1vCDdiu0J0rEjiE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qZ/yhXrtkKMozzOk9cbpY6/LSE70pIga/1zd9SpqQYw8V0S/eFGVj+1BjV7AlOEdkQAKW43fqkjWSBvnOXYqf5cH8NzjHqpxPqWQyV/AqUlzERQmQ4xrAGUjJjkewoqFgQCeORoIh/dP/0FaFfDWsOJFP88LpvP7u+h00phDUY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGFotMhS; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGFotMhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487190; x=1819023190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xos00UkSbC6tBWm3NQ70dTFt7ZKC1vCDdiu0J0rEjiE=;
  b=NGFotMhS+DFV/LtepO6+FPYRvgp50HrKl8/GRYamrYXzlL1OQmxuvqSF
   KB+w5QyffB4TIIbAe1TAVIXPal/sbZPGL1gYervT2OUi6zTdh6z2MrUdN
   1nuE4JvDBtCqoujs2EC2QOWKtuDL1VXKRlwo/85gbr7G/deY0zuYbN2CC
   R/Nl3Z05h+PI864KXaj59SJJs0FS3OZbpFDxG+K28szEdvgp04tQfVeJm
   zM9m/xWoi08RjUEa+cvb0i+ExVKvwkfCVzd8qC6veuP+zVwO5c4B6rFkb
   QLI1opW1vgWXm637oFhcWtqVi739KLQBmaCDshubhUjJTpjQsL0NlYBfY
   w==;
X-CSE-ConnectionGUID: 7ekUOdTgQT2c6K/Y4MmOfA==
X-CSE-MsgGUID: XtArM9hzSsmMMqKkBV/WEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088772"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:13:10 -0700
X-CSE-ConnectionGUID: VO82nJCVRK+gqh9jVt9bOg==
X-CSE-MsgGUID: jvpBUBqHRKGXVE/9K94cXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260602840"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:13:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:13:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:13:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Euwk0bVl2EZnUG3dCwXQ0dl6JM7t0YNiipaFtf2qu5jEaXdBqDYoJF0nmfYFVhFENTKsplJgBpzJ+3cTtKbtWqW/HW1SbEphBJ8W8IJl5srHBXdKQmZsO2K3pRmoD0M/Y/U/6s19XmBMxZZ0HC+uYFxAx9J4/QnAbW0iAWct+ge69TMrJq1ByHWYmIj6vRHf7dXzrLuKAdUmkv57tL4vu+oOFSppHYwYZ6VbZkDP7oiy9TfLsPJuY2Zg+yQWw2nmqOu+6SEEvLw4GOdvuSXzeJaaS+9zaQF1/GyMhcdvUBrT19KjvfvnJodRtcCfe9o52741lY4zNxPiIxdL0eeiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8h0PMyynOlu7Sc6l1vC9h4q36XNAbw/qg+egu1tlo38=;
 b=AP9gcMsi4WyYGzLi8j41q1xm7th96y0YXSyf1et2pueohyWnlsZRUqmiJ0l4pHBcjijSilEPthim6Y9XlbluvcGG76fDhrCy/RP2NWUI5hC9elNJq2ZildloKM4M5absX+lrdlmDREWbcAzL5ogH7ZBLOtg/l9Mt9jT1PMoccnl4HjIi6aQqd64hNiVhxMf0GHrN+ppen+xhWxeiMUEZLjU2sBwJARjYQmMib3a8CeOcQC5A7NVE/QCBg8VsL9UfzVjHYZmJSw4KTjAP+0voBverhGV0Rm9nnx3T1QuVAVMywpyECq3PxZzIPzFsxkzBGrzcXqcTItBp+l7IJE86gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:13:06 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:13:06 +0000
Date: Sun, 23 Aug 2026 20:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: Re: [PATCH] wifi: ath11k: fix QCN6122 UNII-3 channels 149-165
 disabled
Message-ID: <202608230944.QS5Ju9Mj-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
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
X-MS-Office365-Filtering-Correlation-Id: 4a51a79e-d1a5-4796-a1be-08df010fe356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: MRJoPQYIxHigaGdiENSgSksp5v6CCqH5AqtqEslFABKPg8MEx2HL8WHXOC+jGtyo8Au6fia7pFTYy28OQDDcr3KjWWePkjHcHjJZP38zZC12gqdHq+SjlMiZoP9PZo0ER5QYKDvTnTJqawaP5+w00CHOI9l16YqPXq9jXOUyNG1mLMUuW4j1B95M90P9prKhYmZSCf/4Y7ewmaBBLTk9fGBhIf3fJDbRLicmXOGYGM8msZ5xfOIbqCao7DijL5Q59G6cqCxz3f7Zb2iKJbz/rhrlGmjVbV0FSp0Dc1iKqfN/ff2/vn8Y15tcAfvED81z+i6bqEIeKlJM86J0d+DNpWOOrz9N8C/aKF0u9MxWxXgZkFRrt+oQ9JbFfOTu2Sng6qSllVal8BKQoi4hhJfxfdJO13YYzzt9DEhpKyC0zjFBTDINo6AIFK1A5wwNzkEEE0yMJBSqiBY4R0CUg5su8m/knjAFkLpTvU7ylrVB05rgoybrUk2ap5IKKgBrF6GzlCCv6+4j7EKv8IvhD3YRFNOdX/pmBxPSOsoTPBv5lErgx4FFuTvESSCHkmQYt0IbG1UTTRR7u49C97wzbdatelrgzvAFBdK8OBXvRjlohLt5xA8GaXRZBiE7KLT26ALJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+uQAFqDozjmboJOuyN7937L28koVlCaCOdaTztjbQrDAtSllBVp08xXYUvNz?=
 =?us-ascii?Q?ozwuZfV8T324C41YNcRu2a4clAcPqI/tSMckKnt/VkLG5i7iroiiFDd6kN5I?=
 =?us-ascii?Q?gi+7N0efreJfI0iYxwcK2TyMehLTAr5ZM5H7TFL/vnEjpyQb6MIoKpup44fc?=
 =?us-ascii?Q?pK/LCrwi9ukNNdQOXj01bAeGDX3fEPwx9RZZaCsldzTATlGpryDkK8ySKzs9?=
 =?us-ascii?Q?iqejn2N81TYbjz5YQwV0hc/UwE0DMcRrgJQ1jRxy99kWmGbAabFpJB9g6+/A?=
 =?us-ascii?Q?oNghdM/TEhERAlJEHemZVdsDS9DHdt5w+qDZLclq2xuZ/vKIcfEduPKeYR2N?=
 =?us-ascii?Q?4Bnow4L2+uBfk2NK0GR22Hj/LSVElimQ5LwXYZEtatvFbDzE7NehzEDmR1nD?=
 =?us-ascii?Q?jzXUL/bHOxY2gIGlpX9678t3g2R1yJNgqAaOISDdYrlF60N1ZyBynsbjM8wh?=
 =?us-ascii?Q?uZd9tB5h6+hxYI5l58COeQdo2fKzyOkgwrafWTedMNrZOaEu6yDID/lqU4P0?=
 =?us-ascii?Q?EsfCPeoxbFml69CowHO2b68+14Phggk2RsCi/+3ELwbQmjLHNWD5jkTLacU/?=
 =?us-ascii?Q?TWfa5Ocd4jNfsiMQQoW6fFbokjamMRqpmw0gy3OIa0DRezxweL5ABy11aIjs?=
 =?us-ascii?Q?xqk4RqJPZQ7wBl/jXnnb4gJNxZuk92ZI7Ckl6UctniYvvEbkEW0hwVCY9+SO?=
 =?us-ascii?Q?5TMPfDhatdmCopv/98C0AYsXimcJDby510NvcX/gF2cJ4RCaPHCzO4RqoaDS?=
 =?us-ascii?Q?F25DY5FvHZHjl2jA8N/7QZKGN8jpcnfF7TgmJzbg/Q8ERHZwWdIBNzxFhLrG?=
 =?us-ascii?Q?TXziUUpQLuEFDFBZDHC1uDykSW42Dsyd5uUDDdh9SovhPnIbyOJxHaqMEqb7?=
 =?us-ascii?Q?Qv0CBr9gaKhgBBLrrTmq6mV7L++6IShgzsOELkprQc1yJ6TgwAGwlJunRo4d?=
 =?us-ascii?Q?LfkoX8HdkySQlZMiD7TlP7a1BdYm78pX2VlTDWdrnNy19rK3FCCA/+aprbsi?=
 =?us-ascii?Q?ulKzXV9JommAhDDOXqejd8vcJQb3al2Qa8zotp0fbgwRk9lnCRt3Yj5+YkSi?=
 =?us-ascii?Q?TP8A9nSGzGDnFy4N6DkQdXgRkD7SWXvgB3KtwhnQCu85CyMJ6DmYMBXinZhy?=
 =?us-ascii?Q?N7puQsPveYJvKfxbQ8U4WvsM2rE5m51E9s9k2pDBSzw63APwIkF441NfR9pL?=
 =?us-ascii?Q?W4ZUcf1A47toh0BDxGmb99TldJyVt1Yt1q8wEWdBUnHMJSbO5H2q074Y3N5i?=
 =?us-ascii?Q?Pwp56QxOZ0UXhuWt0ZE5v00BqnRbB9yPTPEeKQqD2SlKWGAPBKvHqd/mPZcd?=
 =?us-ascii?Q?3qXHTFEPzB9sfQlyjhqv4hWpWTZkLB7WGFCXwKAvaXqixpjq/kk/ddiCJTf/?=
 =?us-ascii?Q?jslULArUYvHqPevu05GYnbE4AP9bhPs7uU0u1gyVqBBYpEwLwqlsOTqfB6MU?=
 =?us-ascii?Q?Khuxw4E0lTDiPuQ5IxlhfBLxVcB3aZnh8U7kYqC20ubhI9wUsCrm3bNF9stV?=
 =?us-ascii?Q?a3h+QHHmYwf7/tdm5xfdhkPili4JtF4T9IQ1kp/3lxzlJVHn3GE3cSn7ftOj?=
 =?us-ascii?Q?qQAQgTTHQPLsbk96XOw7Uyl3nU69DY4ep7FE0ZLTdthc3T7SXzAfbQ796GEp?=
 =?us-ascii?Q?0olniKmTMD/lJ+/xYujVUzq4VIMjfrFpT0K0/06AjInc6wjFqh21l1im2V8Z?=
 =?us-ascii?Q?qmpchnRYi2T1KvB2Zkv2IDZ5mWIloSeCOsWgzMtYsvBUe8ut3sl0m1Dhb224?=
 =?us-ascii?Q?Yyre+RHevw=3D=3D?=
X-Exchange-RoutingPolicyChecked: k2NBBw6mdN4Cs1WmlZeNgZIZbpueYzVyOXnvjcBGQ/im7niyik2X9JYn2QfL4FQ8TGBxaorz4yvV1BzUTP5o+jluCR7jNMURQ//UJfoonqtHhcSYQMpOpryZIXngWBnCwVuHzRG+Xu1mJOC9u9gNWxGj2jNVRQwxT+1PLA5FFv4NzE+30Katfo4uXdKqW2XnjdfwObluEjY3ZuZkcSy+IePGkejYnSfT5ssRQruS88OYJbyfY4zXYPnJCbDfZ0aCxmoawsqQl873UNckEM1vVq2wy8hA0xpIUlFbSIO6MxfBiTyu0sattCAdmyrwoT/xsBdfjmgZwDvcXrrQJXHaCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a51a79e-d1a5-4796-a1be-08df010fe356
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:13:06.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ+orxNV3sJwvhN97a6kDNi1DRHKqS/TTSoDB794MIXM9h95Let068BMaaoAsVm+5FoQGJyiQTqNAFav7ykB8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <tencent_CA929E144EEEC926E8CFF32B18ED3A26A907@qq.com>
References: <tencent_CA929E144EEEC926E8CFF32B18ED3A26A907@qq.com>
TO: autumnshiu <autumnshiu@foxmail.com>
TO: linux-wireless@vger.kernel.org
CC: kvalo@kernel.org
CC: ath11k@lists.infradead.org

Hi autumnshiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on ath/ath-next]
[also build test ERROR on wireless/main wireless-next/main linus/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/autumnshiu/wifi-ath11k-fix-QCN6122-UNII-3-channels-149-165-disabled/20260815-230738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/tencent_CA929E144EEEC926E8CFF32B18ED3A26A907%40qq.com
patch subject: [PATCH] wifi: ath11k: fix QCN6122 UNII-3 channels 149-165 disabled
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-buildonly-randconfig-001-20260823 (https://download.01.org/0day-ci/archive/20260823/202608230944.QS5Ju9Mj-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230944.QS5Ju9Mj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608230944.QS5Ju9Mj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/mac.c:10180:24: error: use of undeclared identifier 'ATH11K_HW_QCN6122_HW10'
    10180 |         if (ar->ab->hw_rev == ATH11K_HW_QCN6122_HW10 &&
          |                               ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/ATH11K_HW_QCN6122_HW10 +10180 drivers/net/wireless/ath/ath11k/mac.c

5f859bc02c7bc7 Carl Huang             2020-08-17  10158  
d5c65159f28953 Kalle Valo             2019-11-23  10159  static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
d5c65159f28953 Kalle Valo             2019-11-23  10160  					   u32 supported_bands)
d5c65159f28953 Kalle Valo             2019-11-23  10161  {
d5c65159f28953 Kalle Valo             2019-11-23  10162  	struct ieee80211_supported_band *band;
74bba5e5ba45d5 Wen Gong               2021-09-28  10163  	struct ath11k_hal_reg_capabilities_ext *reg_cap, *temp_reg_cap;
d5c65159f28953 Kalle Valo             2019-11-23  10164  	void *channels;
5f859bc02c7bc7 Carl Huang             2020-08-17  10165  	u32 phy_id;
d5c65159f28953 Kalle Valo             2019-11-23  10166  
d5c65159f28953 Kalle Valo             2019-11-23  10167  	BUILD_BUG_ON((ARRAY_SIZE(ath11k_2ghz_channels) +
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10168  		      ARRAY_SIZE(ath11k_5ghz_channels) +
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10169  		      ARRAY_SIZE(ath11k_6ghz_channels)) !=
d5c65159f28953 Kalle Valo             2019-11-23  10170  		     ATH11K_NUM_CHANS);
d5c65159f28953 Kalle Valo             2019-11-23  10171  
d5c65159f28953 Kalle Valo             2019-11-23  10172  	reg_cap = &ar->ab->hal_reg_cap[ar->pdev_idx];
74bba5e5ba45d5 Wen Gong               2021-09-28  10173  	temp_reg_cap = reg_cap;
d5c65159f28953 Kalle Valo             2019-11-23  10174  
3da35581ef5de9 autumnshiu             2026-08-15  10175  	/* QCN6122 firmware omits the UNII-3 band (5725-5850 MHz, channels
3da35581ef5de9 autumnshiu             2026-08-15  10176  	 * 149-165) from high_5ghz_chan, which makes the driver mark those
3da35581ef5de9 autumnshiu             2026-08-15  10177  	 * channels IEEE80211_CHAN_DISABLED. Clamp it to the standard 5.8 GHz
3da35581ef5de9 autumnshiu             2026-08-15  10178  	 * upper bound so channels 149-165 remain usable.
3da35581ef5de9 autumnshiu             2026-08-15  10179  	 */
3da35581ef5de9 autumnshiu             2026-08-15 @10180  	if (ar->ab->hw_rev == ATH11K_HW_QCN6122_HW10 &&
3da35581ef5de9 autumnshiu             2026-08-15  10181  	    reg_cap->high_5ghz_chan < 5825)
3da35581ef5de9 autumnshiu             2026-08-15  10182  		reg_cap->high_5ghz_chan = 5825;
3da35581ef5de9 autumnshiu             2026-08-15  10183  
d5c65159f28953 Kalle Valo             2019-11-23  10184  	if (supported_bands & WMI_HOST_WLAN_2G_CAP) {
d5c65159f28953 Kalle Valo             2019-11-23  10185  		channels = kmemdup(ath11k_2ghz_channels,
d5c65159f28953 Kalle Valo             2019-11-23  10186  				   sizeof(ath11k_2ghz_channels),
d5c65159f28953 Kalle Valo             2019-11-23  10187  				   GFP_KERNEL);
d5c65159f28953 Kalle Valo             2019-11-23  10188  		if (!channels)
d5c65159f28953 Kalle Valo             2019-11-23  10189  			return -ENOMEM;
d5c65159f28953 Kalle Valo             2019-11-23  10190  
d5c65159f28953 Kalle Valo             2019-11-23  10191  		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10192  		band->band = NL80211_BAND_2GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  10193  		band->n_channels = ARRAY_SIZE(ath11k_2ghz_channels);
d5c65159f28953 Kalle Valo             2019-11-23  10194  		band->channels = channels;
d5c65159f28953 Kalle Valo             2019-11-23  10195  		band->n_bitrates = ath11k_g_rates_size;
d5c65159f28953 Kalle Valo             2019-11-23  10196  		band->bitrates = ath11k_g_rates;
d5c65159f28953 Kalle Valo             2019-11-23  10197  		ar->hw->wiphy->bands[NL80211_BAND_2GHZ] = band;
5f859bc02c7bc7 Carl Huang             2020-08-17  10198  
5f859bc02c7bc7 Carl Huang             2020-08-17  10199  		if (ar->ab->hw_params.single_pdev_only) {
5f859bc02c7bc7 Carl Huang             2020-08-17  10200  			phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_2G_CAP);
74bba5e5ba45d5 Wen Gong               2021-09-28  10201  			temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
5f859bc02c7bc7 Carl Huang             2020-08-17  10202  		}
d5c65159f28953 Kalle Valo             2019-11-23  10203  		ath11k_mac_update_ch_list(ar, band,
74bba5e5ba45d5 Wen Gong               2021-09-28  10204  					  temp_reg_cap->low_2ghz_chan,
74bba5e5ba45d5 Wen Gong               2021-09-28  10205  					  temp_reg_cap->high_2ghz_chan);
d5c65159f28953 Kalle Valo             2019-11-23  10206  	}
d5c65159f28953 Kalle Valo             2019-11-23  10207  
d5c65159f28953 Kalle Valo             2019-11-23  10208  	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
e2ceb1de2f83aa Maxime Bizon           2023-04-21  10209  		if (reg_cap->high_5ghz_chan >= ATH11K_MIN_6G_FREQ) {
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10210  			channels = kmemdup(ath11k_6ghz_channels,
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10211  					   sizeof(ath11k_6ghz_channels), GFP_KERNEL);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10212  			if (!channels) {
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10213  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10214  				return -ENOMEM;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10215  			}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10216  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10217  			ar->supports_6ghz = true;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10218  			band = &ar->mac.sbands[NL80211_BAND_6GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10219  			band->band = NL80211_BAND_6GHZ;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10220  			band->n_channels = ARRAY_SIZE(ath11k_6ghz_channels);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10221  			band->channels = channels;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10222  			band->n_bitrates = ath11k_a_rates_size;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10223  			band->bitrates = ath11k_a_rates;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10224  			ar->hw->wiphy->bands[NL80211_BAND_6GHZ] = band;
74bba5e5ba45d5 Wen Gong               2021-09-28  10225  
74bba5e5ba45d5 Wen Gong               2021-09-28  10226  			if (ar->ab->hw_params.single_pdev_only) {
74bba5e5ba45d5 Wen Gong               2021-09-28  10227  				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
74bba5e5ba45d5 Wen Gong               2021-09-28  10228  				temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
74bba5e5ba45d5 Wen Gong               2021-09-28  10229  			}
74bba5e5ba45d5 Wen Gong               2021-09-28  10230  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10231  			ath11k_mac_update_ch_list(ar, band,
74bba5e5ba45d5 Wen Gong               2021-09-28  10232  						  temp_reg_cap->low_5ghz_chan,
74bba5e5ba45d5 Wen Gong               2021-09-28  10233  						  temp_reg_cap->high_5ghz_chan);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10234  		}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10235  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10236  		if (reg_cap->low_5ghz_chan < ATH11K_MIN_6G_FREQ) {
d5c65159f28953 Kalle Valo             2019-11-23  10237  			channels = kmemdup(ath11k_5ghz_channels,
d5c65159f28953 Kalle Valo             2019-11-23  10238  					   sizeof(ath11k_5ghz_channels),
d5c65159f28953 Kalle Valo             2019-11-23  10239  					   GFP_KERNEL);
d5c65159f28953 Kalle Valo             2019-11-23  10240  			if (!channels) {
d5c65159f28953 Kalle Valo             2019-11-23  10241  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10242  				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
d5c65159f28953 Kalle Valo             2019-11-23  10243  				return -ENOMEM;
d5c65159f28953 Kalle Valo             2019-11-23  10244  			}
d5c65159f28953 Kalle Valo             2019-11-23  10245  
d5c65159f28953 Kalle Valo             2019-11-23  10246  			band = &ar->mac.sbands[NL80211_BAND_5GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10247  			band->band = NL80211_BAND_5GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  10248  			band->n_channels = ARRAY_SIZE(ath11k_5ghz_channels);
d5c65159f28953 Kalle Valo             2019-11-23  10249  			band->channels = channels;
d5c65159f28953 Kalle Valo             2019-11-23  10250  			band->n_bitrates = ath11k_a_rates_size;
d5c65159f28953 Kalle Valo             2019-11-23  10251  			band->bitrates = ath11k_a_rates;
d5c65159f28953 Kalle Valo             2019-11-23  10252  			ar->hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
5f859bc02c7bc7 Carl Huang             2020-08-17  10253  
5f859bc02c7bc7 Carl Huang             2020-08-17  10254  			if (ar->ab->hw_params.single_pdev_only) {
5f859bc02c7bc7 Carl Huang             2020-08-17  10255  				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
74bba5e5ba45d5 Wen Gong               2021-09-28  10256  				temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
5f859bc02c7bc7 Carl Huang             2020-08-17  10257  			}
5f859bc02c7bc7 Carl Huang             2020-08-17  10258  
d5c65159f28953 Kalle Valo             2019-11-23  10259  			ath11k_mac_update_ch_list(ar, band,
74bba5e5ba45d5 Wen Gong               2021-09-28  10260  						  temp_reg_cap->low_5ghz_chan,
74bba5e5ba45d5 Wen Gong               2021-09-28  10261  						  temp_reg_cap->high_5ghz_chan);
d5c65159f28953 Kalle Valo             2019-11-23  10262  		}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  10263  	}
d5c65159f28953 Kalle Valo             2019-11-23  10264  
d5c65159f28953 Kalle Valo             2019-11-23  10265  	return 0;
d5c65159f28953 Kalle Valo             2019-11-23  10266  }
d5c65159f28953 Kalle Valo             2019-11-23  10267  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
