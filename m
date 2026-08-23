Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1A339388
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488320; cv=fail; b=RFCJXsjDdUr2Smu2eiq1MRxDiXgZwSTyABtYO+4L03ZWPgn3K8mKv/WRc92XengHnQ11SSlqjYeSfgZZ00GI43tDzKwA+4KdU6N5LpA23nk6rFCBFGVOFWrWSojCi9rOFP83tbFWIfxVxuShzqeWL9/D5MMHsD9M0CNl+rKOnA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488320; c=relaxed/simple;
	bh=0hgsI/xs1T9ZkaoGvmNwFi4DS1ddM+eVs2VyTiXR6n4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mCv5amRlucW61peeOQwUtv+cKTRVNpi7C06NFgbiAIZSkkPYVORhj+/20A86SoET0xlaIAzoTZxsRCxg2Woj6AAOM0xql1ZWJjn9EDFv67Xgiu58cC75ieSETHTwcsuUdhx+SRnID1qwJTw126mZB2uqyQzkR3m2QqsVlAHn2nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhXMgRHD; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhXMgRHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488319; x=1819024319;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=0hgsI/xs1T9ZkaoGvmNwFi4DS1ddM+eVs2VyTiXR6n4=;
  b=LhXMgRHDPAjJUYMpbGFCT4K3VvecygIw8sgSQN+dBhiC6MPxTr+ouY5h
   ja5TxVdFJe0P0VyvJql9IW+x+n/mKnpSmLf3d4AiNpr3q6tqFhXuYX8MR
   ygFuvA/bjl22szIOmlUeaCvm2NIITDAFY/uekq/voX20eqZZ4zPs8/Z+r
   /w7wQL9QdZR+Ct4AK5tfM+EcpV1KbDlRdU3tfNYyec6qUT0FoluUlDrLa
   6WZOdUuS+kOsU/MihQD8QVXgctCGw2DY2HQ+Cwn5gUUbIbVEEbuAGrpJf
   CGOm6MlTPCxBPavV6jGi/R30q7A270P+wgH4OowAbwckOnZEori2br/g2
   w==;
X-CSE-ConnectionGUID: chrx4gHvQrepLXvrKGCRsQ==
X-CSE-MsgGUID: cUuI/R75SiSUowGos5AEeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87975040"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87975040"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:58 -0700
X-CSE-ConnectionGUID: IPXdp5k4SgKHdmN5Ld+Y5Q==
X-CSE-MsgGUID: 9mJyOwPXQGmBImZsaFoK3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264993913"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:31:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:31:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFekNkB10zA1w6laqx6k/jvUWIr9KtKA+KG7Uc97NN6nTQdDePML4eXrC1jsdE46jk9dQ835RbpkF/m9kWYmX5kyAA1T4uwp54dmtjlIJaaShGfHoPk/yDzCmA3jhPsFh+c5jorIRdH8whbh2dRn2dIYXWxundm4Y7I1RBSZ91xPDeIQLZBq1Y2ECA+Xw25Z3dzqzvd0eTaaJ+W4AUf0HmCNvW+MmeyPiUVGnlxKD5BbVHNCfkEk4IWpzriddTloXhIV/tPX0mZUzlrBbilBJfOdqpFy9qv+NJxhbE4bcBZUU8D9znOURMVCOZYvhFv+nKX/kZ49yPqxCkMgq6ANKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNt7vItnTlfqwfGSmbj3IBKBakaO9vLB2njg2t9GM2k=;
 b=PC0mWIjnWb8LFqKKQcHnoDMgx2d/hdHweQ/4lo/HNmZXqgC6BhNkgjeKplSuAim/Dr4qC4HGK2YtCZiD56MPFBzZ6W+Lrt94Rl8lzMPNqczlkozAsS4KoQNcBr4vYJZLGXepVM1Y6P9t1WIQI8btmIluLNTJCRCSECz+4015w1OzceAwt4Thdyz+Af0SvYy36BxeTnbNZY4ca/PakrCoQIMlcTKFYyaV+XuszXOjHdgz+PiJ1+DTkvb4YVDv9srUHx4L43YKkRuGZeOEG6BREYQCjRiuEA/He9JLM0hRdlyvAwLcdBuSNFjyIXnV37oWKkCKaldclfyhycBqShmEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:31:56 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:31:56 +0000
Date: Sun, 23 Aug 2026 20:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: [jimc:scratchpad-v10 6/24] include/linux/scratchpad.h:168:14:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202608221913.XLktNQpq-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 193e7cfc-3e4a-4764-b23b-08df011284c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: L3CKuCx/6WcYp1R/sbm+jIj8SdhbjaLuXvzfYxi5AJty3lLlL0DmxUo487obiDyjArQmEEQI0sVtoBZQn+tKymg87SGRK0SHL7UfJsB3OwTuPlQdK03lF2thDopR2ueiyx7lxhblkW1SIl7Fu2Kpr/I/FYIrqMCo1CqBFN13IETQ5sItMOnoh24t7ngl9HjI6YJIBp3ENIXZ5ebjkb/bAmeBzgM3QeGDs6MgCsXWY675jLmTMedg3H8KhtoBPTENDVEgFeXaLrPQrT9PclXkjihaszoCkcSx7L9Nh+NACV6PZ4Vrgqm//sZH5OEqiI8Cwl25qC7xJdNtb2mMfYJ+V3R/XCEGvSKl2NPctZeYM+8C/LHEXxHv/MgfLXMS1wpaLkpIZ8anveEqLru05Mu+NgfvO5Tg78IioPS1D4NJZbf649c+SxzKRDbkiIC4ObChH6w4cX0uDkY2GYDElD6iLpbAAk3D6JdG3exvvCFPVxoguJ7CBPMdhxICMysln9MSeUlXdELImFNdl0HwcNgkkI5uSW43SrJ8RSb1R0dRNPpQzVzXHJNt6X91MJCoIr3HqcR4eYJrumBp8ZPopKyA6/Ks/gHpZI6UVC2Sdp7F+kakQ9+5SbmD4g+uByg4rq7hHo5EcdFd+DFiHZV1hoIlJsf27Xy7JWCZchTJX/vNYH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWlST2NKbkwzRmUyRmlPOXpUaGN0T044UW1HRld0cUlmcE0xZnMyR3ZxNlRG?=
 =?utf-8?B?TEVXTTNwb3pYT0Q4ckcxbnRGNUNPdlFEbmdHd1pRbWR1N0VYVXNSVXBROURC?=
 =?utf-8?B?NGxWOTNuKzkyRCt1OFpUUWQ0RldSaFd6OHlDUkNheGZMalJzSEI4N1JDUS9t?=
 =?utf-8?B?N004VndZMlNZK1YvckVtbGRzQjUvcGpCL0FEUkUvMFlQQTJWNlgwZXpOb1Mx?=
 =?utf-8?B?N3N4dWZFR1Npbzg5azJhdHM3OEJxSURWa2dGbTFUUEYzTnJPV1NSWWN0Znp1?=
 =?utf-8?B?SnRrZkt4WU1GREZhTHVnWnVVQ1FnUGJ4MW0yUEVNajF3Vm5yalhkUUwvWTVC?=
 =?utf-8?B?N3VEcWQ1TWgrK0pjUVpZaFVwc1Z1dFlGUDhQZjhmUlFsclI0TFJXb0t3aE9a?=
 =?utf-8?B?SGltbjZ6aURCblZ2VE03dmRVWlQzdTJvMEhNd2FlN3Y4ckR6K003b3pTc2Rw?=
 =?utf-8?B?RDhBRENJKy8zRDY3Rks2Ri9SWTc0SU1qTzkrQ003NjdEUisralNKK2pzYUNG?=
 =?utf-8?B?dkhIdEd6SHlNUjlGRkRGOENYeUlLQmUrdk9RaVcrcm1wbGVnWEtKR3pLek12?=
 =?utf-8?B?RWdvSWdCVVFndUFZRmw2SE0wbEl4dnBwSmdDSUsrUldvZVZOMmYzdGM5L3VF?=
 =?utf-8?B?bWt5dFk0REtkYXpCRlZXL20rZlZ2R3FHMXN5VFpoOFNYZk9xSjByU2h0eUFO?=
 =?utf-8?B?NExWNHZEcTlkNEN5OWZhalRUdkZEUEc0ZW1aUGN2d20xN2dPbjlZSGRCazJw?=
 =?utf-8?B?bnJMalN5OHMyMjV0dXNOS2pKZ2VyQThXSHlFbm02U3FMU09YMWRXSWtVZ1BE?=
 =?utf-8?B?QlhyWEwvS25tc3ZtRmg5YWxZZHA0Z01od1VrZkpZQXJRM2tMNkZOeGttcVlT?=
 =?utf-8?B?TkF6THQzbEpFWnFJOFpKNmYrYWhKYTNndzlOd2ZzVHhlb29mdHhxVXp2SC9o?=
 =?utf-8?B?WmMyT09sdXFPbjhZc1ZrSUlXOUx1eDNMYTZoa2xlS0RGRG0yS2g2QXN0dEI3?=
 =?utf-8?B?QU5HZE9STzA3emNUVWRhTFNHZEUzQ0k3S01GS1J3SEhZelZYNGFhYUswZnoz?=
 =?utf-8?B?MWhqaStqQ1BUMXJ2U2h6SHRmZ2daRGMrdExObVgxZVNFdDBMQld5dnM1dEsw?=
 =?utf-8?B?c0hRN2lSRTBkWXNBOEExNXdTcEI4aktaaGhzY1R5bGFnOHNxV2o3cHJkTncv?=
 =?utf-8?B?cjlzV2I3THNoTy9Gak9qUklOVU4xeUpZUHM4OUxWUHk0ZXRETUxBNGswSXFa?=
 =?utf-8?B?WTRFYWlIRkVOMDlIS2dBSllPNm1uWmZnbkYvclh6S0VxckRiMW9xS2hEL0o3?=
 =?utf-8?B?QXMrM2pFKzZzZTh3azE5UXh6cTlDY0xrbklMaHo4d1Z3UjViSW9KL0JyNUw0?=
 =?utf-8?B?Vk9WSVFZWUJJaG1wVmJwcmxIZTQ3S3cwcVN1Vmh1TERSWnhzeVc3UHF6SzNV?=
 =?utf-8?B?eFpSWjlpMHNHVWt5LzhiWEw3Sms4aFdzVWZSbTk0VUx0c3d5Z2dnWGQ3TWNT?=
 =?utf-8?B?ZDl5eGtybkRlQmUxa3lYaW5SdlJxOVVVODBscmJKcDFWa3l2RERxcU1ZdVo1?=
 =?utf-8?B?a3lTYm0zcjQreit3Kyt6UEl2YWdVR0dXUjZYM2ZFWElrUHZLc3RSNjh0YTN0?=
 =?utf-8?B?Wi9PQUtGNlR2b0IrTTQveGhWMEkzaGIySHFJWTVndVlUV3ZySDh3bjhBM3FO?=
 =?utf-8?B?eXJ3RTdZZUJiQjlvQUIwTGpXU3hhZGEvS01BMWNPQzdBQnNkUTc3Q250Q1JW?=
 =?utf-8?B?S0EvZGpCSlhrY2RtQjVScEQvNkFPMENYZGdWMUN2UXk3TU5BbVdBRjhoV2ln?=
 =?utf-8?B?bzlnTlRJRk0rQ2NMREhSR0gvbGdSQkYxWWtuVnRwTEozSnB1M2xuNXBkL0dQ?=
 =?utf-8?B?SzlBQWNFYWdQNGlSbVNDVW5YRGk3NHVPZmRQczFmZzgybE4wY0J0NmVEYWZ1?=
 =?utf-8?B?WUtoZm5pYWsyVHVLTFE4aTJqUHMzZHhyaXkvQnpXZXJpbTlyVndtRndoakVH?=
 =?utf-8?B?MVJLd05oS052dER6d2dtN1dvSmNWak1SSU1SVVYxS21IRnVXT2o3b2ZBRmRz?=
 =?utf-8?B?VVErZnczTS9ZM0Eza3Q3K2VvbmpoSGg5ak5YYVBScHF5ZllJMkNNSnJoYmpR?=
 =?utf-8?B?YkNrREorcytDWmp5Y29ZbHlnOXA5aUFrWE5keGk0ZzAwMHp2cFFIalZTWGZr?=
 =?utf-8?B?V3A2YlZLcFREUFpiRkhDREJDZVUrQTJ6RUE3eUVvK3pwMzQzTmNaa1BzZ0hN?=
 =?utf-8?B?NXRoa2N0THBCQmdweWcrT0tkcXY4aGtmLy9CeXIyWGZkNytnbmozZW5iTFRC?=
 =?utf-8?B?OC9pUEZRRmxTVWI3eXdNL0c1K2k5ODZFSXgrWWlGRXVRN0hKTHJEZz09?=
X-Exchange-RoutingPolicyChecked: zeaaXHZ+kqxLShhFUCkGxA6RH1Nr/ehyMZ8MCBj5YNOOrBseYd/fBRzGVKiqfUSunr7raYyOVIRWsdGekqgCtvabIvWlUBoNGWSGZg6+sd8l/MkTLGbTl1LTvzgDWE9TvQ5RjTnVHrFIAet4uQsSQ4IJQuw777ySCk0XL35GkYh+nY3iEvkcP/XDvuXYk2JRKUuFeA4QNKYMxnUoL+jZpFtMZVaZOjRBVw9N9gtvlRVAGgeDnJC0uuvyGFYTqcEkzDtWUCpIitNS7pIcS1WSWrMPVmeae0Y6UowQPHEzHg3mThQFITahbPIEAu1xhQtKfECDYRXtpDXgxC3+i2/j6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 193e7cfc-3e4a-4764-b23b-08df011284c2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:31:56.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoqoQbUtUlyt2wueWH1790p8wheuINsZcmpdLK9fXMNM8sPdgcqCIPxnSRglHxnqBMLINX9D/9FzDEUIuPhPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/scratchpad.h:168:14: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: 2ff4781936dbd5713098be199d95cd8d516262a3 [6/24] bpf/verifier: Route verifier stack state node allocations to scratchrec
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r132-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221913.XLktNQpq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221913.XLktNQpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608221913.XLktNQpq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/verifier.c:1746:1: sparse: sparse: symbol 'bpf_state_pool_key' was not declared. Should it be static?
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf_verifier.h):
>> include/linux/scratchpad.h:168:14: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/bpf/verifier.c:1709:55: sparse: signed value source

vim +168 include/linux/scratchpad.h

97f7757fd65ebc Jim Cromie 2026-08-19  153  
97f7757fd65ebc Jim Cromie 2026-08-19  154  DEFINE_FREE(scratchpad, struct scratchpad *,
97f7757fd65ebc Jim Cromie 2026-08-19  155  	    if (!IS_ERR_OR_NULL(_T)) scratchpad_free(_T))
97f7757fd65ebc Jim Cromie 2026-08-19  156  
97f7757fd65ebc Jim Cromie 2026-08-19  157  /**
97f7757fd65ebc Jim Cromie 2026-08-19  158   * is_scratch_ptr - Check whether an address resides in a compound scratchpad/scratchrec
97f7757fd65ebc Jim Cromie 2026-08-19  159   * @ptr: Object pointer to test
97f7757fd65ebc Jim Cromie 2026-08-19  160   */
97f7757fd65ebc Jim Cromie 2026-08-19  161  static inline bool is_scratch_ptr(const void *ptr)
97f7757fd65ebc Jim Cromie 2026-08-19  162  {
97f7757fd65ebc Jim Cromie 2026-08-19  163  	struct folio *folio;
97f7757fd65ebc Jim Cromie 2026-08-19  164  
97f7757fd65ebc Jim Cromie 2026-08-19  165  	if (ZERO_OR_NULL_PTR(ptr) || is_vmalloc_addr(ptr))
97f7757fd65ebc Jim Cromie 2026-08-19  166  		return false;
97f7757fd65ebc Jim Cromie 2026-08-19  167  
97f7757fd65ebc Jim Cromie 2026-08-19 @168  	if (!virt_addr_valid(ptr))
97f7757fd65ebc Jim Cromie 2026-08-19  169  		return false;
97f7757fd65ebc Jim Cromie 2026-08-19  170  
97f7757fd65ebc Jim Cromie 2026-08-19  171  	folio = virt_to_folio(ptr);
97f7757fd65ebc Jim Cromie 2026-08-19  172  	return !folio_test_slab(folio);
97f7757fd65ebc Jim Cromie 2026-08-19  173  }
97f7757fd65ebc Jim Cromie 2026-08-19  174  

:::::: The code at line 168 was first introduced by commit
:::::: 97f7757fd65ebcb2ae4d50d3ca03a8c9cea8e51f scratchpad: add Direct-Map Large Scratchpad and Scratchrec bump allocators

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
