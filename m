Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8C3D45F7
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488209; cv=fail; b=UuRCvhs3vpfptNf76v4oaYgQg+xuTw9xKQfEWVXyJ8ks9LhHVmeIgE2NwIQWPtcuzVKL9gV8ENvjSUWFgV48FX6Rkf1bNlq3dChcX4P4qhTkPIceIKki+0MNMly4TlhkQhY80SdCcdnpkF7CSAvWhq9CjHI/ToVXYGthRDe8Fe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488209; c=relaxed/simple;
	bh=+q72uHRqhMwa438C4zyvHMdrcBIwtM+C8oJlyZPowJw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QZS2F4I7UJhPVf4aIHiC55sduX9HR709mxIS7zznjApXzhgqNrt3wQQysKW4uHHY1zX6nX9mygtdZ4plkvrTGOlovS9nIQHbOujyxAd4SY3TWL2UgPz9nXrhNgQsuFUpNwFrZEO9t6sFxX+jQNNJyo9Q+SQ33DiV6XfmdUG88k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6wPx9ON; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6wPx9ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488207; x=1819024207;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=+q72uHRqhMwa438C4zyvHMdrcBIwtM+C8oJlyZPowJw=;
  b=M6wPx9ONnDgtZVBojyoSZAQqxFpf0URpCPxyvbTEkhbyaaajPyRy7+My
   I3doaNIja/Yjc9UXjGhvmCUFYycO19GmQEekQURxSt41daGzq9tBvKvtB
   5WVq4DOPZrZXxkSrlMZ/3r+n8m1tpiB5Mtb9+jcYdK1Idgasc6VC5a5Xn
   MFvZPLWd4Hz3o4nNQPvwoN2LTWgFTcAVCCrRgkIR65aQseg76GwuTeHQa
   ww790dY8Y9rtjeFMN9WJ08AzvX0KqSpCbbS+p0qS+PLqFCh55/a9qg2PJ
   4B3HwZz6CAki+LZUYC+VzICZsBSAHIvbedtU+pyJs2BgZILXQK6Gb5MLX
   w==;
X-CSE-ConnectionGUID: 9nYQYpkjRHSX4j8bbxjAXw==
X-CSE-MsgGUID: O5afKJzzT62yixItNu6zow==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87981905"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87981905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:30:06 -0700
X-CSE-ConnectionGUID: RLPIOroURSuFuzTWUeR2Zg==
X-CSE-MsgGUID: Sb/5Fw1bTNSgMj8xmFFyew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="304954961"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:30:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:30:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpyhhIBD5SyS4rNS7aZQdkP74ibgptTelgYMkv3rMteJ8zTaePcugfFRFbTXe27N2M6eCd5huccTD2/sDN0FuyjpGSOElv5zNt6yzF0TVdkUtgVOOrJtWwJIqFe3PHmhwBezfcuCJWKW6nMR/O6Mf6KhKIzzXy20yUKAaOwYU/XXRNaPUidsv6QRXNRpTAVNZ4COeat6RMIApyU9AhR864piGrdtuaTzexom/olart7uFJzrgfYmJcQKbJn3tn3OVUgIL1WTTS2kQ+3wLk3vNcm/bE0tKgRom3oT3JJ3a0jaKyl7NXiCRa0GPsJpt/8Fr7mMgpVrSougRazhJwMRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEg/ZsbT0TJD88UrNih21kABAVXqSCGxcrFQ5BFeh2I=;
 b=VBsf58uznvtU/61xDyfoDoUU9amEGicGd4Iwu1s3iMWQy0eYB/LOUDSVwDNJK/oX5KKYRzEV5el3c5djEZP8nwnCKQanZIO2vShZq3lM/zJ/ei9nL0QWGUDEea6UYaSyxllix6hVqpUA9jpfV2HOm8edIc7MsqEO5P7/VFDH58jRdSs+bo0j3NDE0JSo0t1iE20l3FtqwDqcuhVQRVyNzp4EqanU9p/eTcsxaOIJm2iX/0eyt//LyE9MV8LUJJ+Vx3q/12coSw4zGrfn7/aXpIsWUb2MF7yH/z/12/F78AtuiTurHSWKfzV5JuiCrlM1RzqgZLoc3gwsZT3Vu8rOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:30:03 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:30:03 +0000
Date: Sun, 23 Aug 2026 20:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 1/1] KVM: x86: lapic: update apic_base and APIC ID
 together
Message-ID: <202608222154.KilWZhsr-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: f722c9b4-ad8f-4f7c-3916-08df011241b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: w93mpD2VkGXlqkG+hg6PpWRVE3ZQ/rPaCxcbR5tNUNRkv8fsXHLOBlJ7NdOi50ZdWDeWoaK/wf+ZHZCjVuMDRAILETmFGLe31/lZnmagQB701Y58iTXI294Wq87xhZkdlfd4GZBa5o+yenD8Ws2nwOQJ3h6aajSx6j9I6QeG0LhMMHAVaZA4bKOPo0BVhh0O5CoG4qUUhXQUSfBec3Oz6G8kLGKJvAxqGC44Eo9HkG4I6b6pZZexSFn1gFK2UMg34wBRdxZrnRD2s+ftvEJPCJ/URLmgv/Ijmut9UKFkThmK0ZXdih7lG0gI048r9TwbFNzk5O0YzfsCtoUmJjcegFyv0eVdMOhW7EzHUs44jr1EKwr/f6FiHdck2xIC7X6KRuMk8upeoo1dznFBx65TReV9ogCMHp6gERz7k/blpjEalAzYkh5CGEn1o4Om95eS2+GU3fapRyIbM9NNRe53b+5FWHo6FkoIpeEbFsLqmjip2VeBJQizYUgOvuU9aRNAUzumVnaV5eKMtsFW1JlS/2SHcfIusd38A8i9nscY434vCo3t3YIyD1mIjXI+V/yD197EN1ZpxqJI9xxzqauq83e5e+16bOhpSr95Qc5HfAUPDAKfE138o7tcs5FEHGN6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTE3YlA0VlZtUjJYY3dvQ3Ntb1I4Q2QzTGJsZGFlN2U1bjZRQmJYUmJBeEpr?=
 =?utf-8?B?VTBCUEgwTEk1S0N2MTlwUi9FMGh0WlV6amVxdndidGR5VkpuVmRMMEpmWlpz?=
 =?utf-8?B?eHhJMmtpNWNVR1h0SmF6cVc0eWlaR2ZtNFdENWNXazlJeWxmRDNZYU9lam8r?=
 =?utf-8?B?QVNibXMxNFp1OS83R0Q0aU13bEhzcWpZaWR2NWd1MmtmN21PWU9QSUFjZHdH?=
 =?utf-8?B?c1FjeWhEQ0FXbWZqWkJGakFjdDdJRXlmK0ZBWmRhYUVSZWZoRGNGMlU5NG1R?=
 =?utf-8?B?c1FNdXV1MXBaOEJCc2Y5cmxnOEt2QTUrT1NXbzZXNTFoMGk5dlN4bkRwSWFM?=
 =?utf-8?B?NzcrUXhjMFprNFpRK1pZQlE1SmtOQXAvVmUrekIvWDRaVElmOHAzaUdFTUNr?=
 =?utf-8?B?OXNneEtRR1ppemhiNzZDSkUvNVFvNGx2TStkL2JJMm1vbmRqN3lEMjVyY1p6?=
 =?utf-8?B?QzRtRUxHWEJBNzRRczVia0FpajRpVzNPejh3Y0JNa3YrOW5GdWp6Vk83QlV5?=
 =?utf-8?B?RHlDaXRGbXB2QTFBM3BGeFhMTlRiVTVhWEtNL3ZtaVhqWWFnY2JUWEh6SmFI?=
 =?utf-8?B?aVJyMGtOZmZGbEN6Z3MvemE2aThSMndZc1BrQXQ1QzNzRmMwQkV4V25GWW5k?=
 =?utf-8?B?ZndTMFk4bjAwUEhUR3hDV3lFVGxGS2xqTFRYa0ltU1ZLYk5lRUx3Y2E0bERY?=
 =?utf-8?B?TnJnbXJzNjBlVVk3dXErcVZ5MjE3eVBSVUozQStockhjUFI4a3JWSytOU1BX?=
 =?utf-8?B?UWtTdThZcUhkVmd0Q01ENTdKbjV2ZGlIU2hNYWZaZHBMdmJwckdqSm1oTzNq?=
 =?utf-8?B?TXpwYXM1QUFEMFpleVlScUE1cFUyVFZ4TUw2UWVmaEhBbUFvKzI2TzZPZ3F6?=
 =?utf-8?B?cmNJZlA2NEcyYVJ3eHdaaE5RWFo4OForbGZtT3ZEM0R6RnVxSGlKeFZ6RlZF?=
 =?utf-8?B?cWNMYVNzQ3JubkE0REZleWZqSUpSRDdmWTVEcFQvUGJ6anJxblVEM29UZnRm?=
 =?utf-8?B?dlhQL2hiUU8zMkxzU0Z2ZjlRanZzdHc1UmZSUUREWE9ZRmg3OTh1WnVtdmpW?=
 =?utf-8?B?ZDI4NGFxWktzOUQrWkxCT3ZXZDZBdm5wbC9penNkT1R0U2U5UGVrOHp2dEFq?=
 =?utf-8?B?N3dHc1VUZjkvZmVrc2VtZllPOEhNZ0JGS3M2bnF6c1VEUG80Zk5TQnlFamhH?=
 =?utf-8?B?ejBzQ1RxWThoNWlOcFF0b2FmSFhkcllFNHVQZEZNc3dDOW9sZThhc212OUhN?=
 =?utf-8?B?WGdZeGtiL05oc3BiZWpxbTdlUGZ6ajhRaUlBeERPQmdjaGdWcy8vaWRrQ1RC?=
 =?utf-8?B?UkF3UzVpaEhmVDl0NEZGQVg4aDdsOWdjbW9tVWRBZWtNeTRSN2FFcW9lek1o?=
 =?utf-8?B?WEUrbVIzVjB0aitlSktDM2g1LzBDb1hwRllFMHp3WWhvcGhPbU9TcHp4dks4?=
 =?utf-8?B?TklkS1lPNm5jMHJrLzhtcHRONlZtVWJCNEpjMUdHZm5kcTArSE5BOEdOcE1V?=
 =?utf-8?B?SHZ4QlRyZkZNTWtKNmx0UnI5dWU5aExhZFBOQStJSTdpSGpPOWFoYVdCemox?=
 =?utf-8?B?T0RLSENpbldxbXFMZ000eFp6QjRKaHMrM005dXAzSnhCY3dPTE9Ga2ZxeTlW?=
 =?utf-8?B?SEdRcjVVd1hSUzBoQ1UyN2RkaG9JUDdHRmtRRDNHWTFpRFBucXpacVkrUU1i?=
 =?utf-8?B?VmExUnZ0ODMyUWdLYm45K3B5YnI5a0FKei9QZzV2RTJ4bTBtWmtFTXRkdWtR?=
 =?utf-8?B?RnVOc1ZLUlQxZDhrUDZJNEdGVnlqdkwrelBZSTNFbDJKTHU1cm52U2RRbDRK?=
 =?utf-8?B?ZUpFK2pIY1FXdFhxUmV4UFVNazhvb3Q0SzNxK1QvMHNsaklzOHp4TmgybkVE?=
 =?utf-8?B?SnJtQzJhRGdBU2gyQStZVngrVUMzcFB2ODUyOG5CYUgycmcrYWxBaGEyTmVX?=
 =?utf-8?B?MGJoK3kxWmxPU2MyZnFwTVd6Y1ZkcWNhWTRPT3pPMDdXUFZmUGJtcmRBdkFF?=
 =?utf-8?B?ZmZDU3VNOHE1ZDloeWRWdHR4TU9takIraVhybXJxMks0U2MzSXpDS1lJYUp6?=
 =?utf-8?B?ak9jWWRmQ2pMdUxnRUpJOHpsYUhUbHVBNGdvcmViZUowOUJGZkh0R3Zjclk4?=
 =?utf-8?B?alVNcTJDbzh1cHA3b29aZjh6Wi9yem55Z1Q5SGlCK3JKNnc2SVAwQnNJQ1RF?=
 =?utf-8?B?UWw1QzZtcTJRQUliODdvNDNqU0RsZlhjSnhmT0Z3cTk5eCsxTnA5WHRWT3Ev?=
 =?utf-8?B?bnIyY3VwTFZqNkJRQzRlaXB6ajNLVVI2d1ZiVmg3M05CV1lJQWtNKzdVYzlh?=
 =?utf-8?B?WGw4d1YwR0hvOEh2OFFIVWErYXE4L2ZPemxhRUg0L1IxandMeFh5Zz09?=
X-Exchange-RoutingPolicyChecked: ekh2DMjgoHx38tUP8Ia6vKkJFsD5Gwracr1e8x8w/bZ0MmFSuA24PsKXEj7e4nMLWfK+9SoNa9MLhfhFpmpD17uQf+PMzsM0UmoEkBSOR5Q6sm1Y33up2fMqeqnIVckzwXDV2V4lhQot3P5cbsUdzlrovI1r7jXcjLjuxx7am9X11bvlT1i8KjZ15YQwhbdbifYBkQCAg3AJDA1xRx4t9cNixnyNH5nO3MU1sCJdXGWQgcpoYdgU9Ol8YNWr/a6Op9G0deh+2/tv1CnkcBrCkoj5syv7Kz0D+Y6wCrlM9gS7oQP95ahWlWNS6Ng+sKDFi6tFKhMNW2tz4Rps3atLXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f722c9b4-ad8f-4f7c-3916-08df011241b0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:30:03.3720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCXNZv7P2pcBjaCanY3tn2hSgyNhXMzv7F1JLlv97YsWTXArRUrw8+LvFCsl8aqCeQH7+0XLdZJEtBNg5u69TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260818234238.618158-1-dongli.zhang@oracle.com>
References: <20260818234238.618158-1-dongli.zhang@oracle.com>
TO: Dongli Zhang <dongli.zhang@oracle.com>
TO: kvm@vger.kernel.org
CC: seanjc@google.com
CC: pbonzini@redhat.com
CC: joe.jin@oracle.com

Hi Dongli,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v7.2 next-20260821]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongli-Zhang/KVM-x86-lapic-update-apic_base-and-APIC-ID-together/20260818-164238
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260818234238.618158-1-dongli.zhang%40oracle.com
patch subject: [PATCH 1/1] KVM: x86: lapic: update apic_base and APIC ID together
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-054-20260822 (https://download.01.org/0day-ci/archive/20260822/202608222154.KilWZhsr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608222154.KilWZhsr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/lapic.c:2824:2-8: preceding lock on line 2816

vim +2824 arch/x86/kvm/lapic.c

c7722e5e1daeea arch/x86/kvm/lapic.c Sean Christopherson        2026-05-29  2800  
7d1cb7cee94ffd arch/x86/kvm/lapic.c Sean Christopherson        2024-11-01  2801  static void __kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value)
97222cc8316328 drivers/kvm/lapic.c  Eddie Dong                 2007-09-12  2802  {
8d14695f9542e9 arch/x86/kvm/lapic.c Yang Zhang                 2013-01-25  2803  	u64 old_value = vcpu->arch.apic_base;
ad312c7c79f781 drivers/kvm/lapic.c  Zhang Xiantao              2007-12-13  2804  	struct kvm_lapic *apic = vcpu->arch.apic;
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2805  	u64 changed = old_value ^ value;
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2806  	bool apicbase_enable_changed = changed & MSR_IA32_APICBASE_ENABLE;
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2807  	bool x2apic_enable_changed = changed & X2APIC_ENABLE;
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2808  	bool apic_mode_changed = apicbase_enable_changed || x2apic_enable_changed;
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2809  	bool need_lock = apic && apic_mode_changed;
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2810  
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2811  	/*
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2812  	 * Serialize apic_base and APIC ID updates with APIC map
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2813  	 * recalculation.
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2814  	 */
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2815  	if (need_lock)
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18 @2816  		mutex_lock(&vcpu->kvm->arch.apic_map_lock);
97222cc8316328 drivers/kvm/lapic.c  Eddie Dong                 2007-09-12  2817  
e66d2ae7c67bd9 arch/x86/kvm/lapic.c Jan Kiszka                 2013-12-29  2818  	vcpu->arch.apic_base = value;
e66d2ae7c67bd9 arch/x86/kvm/lapic.c Jan Kiszka                 2013-12-29  2819  
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2820  	if (apicbase_enable_changed)
93da6af3ae563b arch/x86/kvm/lapic.c Sean Christopherson        2024-12-10  2821  		vcpu->arch.cpuid_dynamic_bits_dirty = true;
c7dd15b33707e9 arch/x86/kvm/lapic.c Jim Mattson                2016-11-09  2822  
c7dd15b33707e9 arch/x86/kvm/lapic.c Jim Mattson                2016-11-09  2823  	if (!apic)
c7dd15b33707e9 arch/x86/kvm/lapic.c Jim Mattson                2016-11-09 @2824  		return;
c7dd15b33707e9 arch/x86/kvm/lapic.c Jim Mattson                2016-11-09  2825  
c5cc421ba3219b arch/x86/kvm/lapic.c Gleb Natapov               2012-08-05  2826  	/* update jump label if enable bit changes */
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2827  	if (apicbase_enable_changed) {
49bd29ba1dbd57 arch/x86/kvm/lapic.c Radim Krčmář               2016-07-12  2828  		if (value & MSR_IA32_APICBASE_ENABLE) {
49bd29ba1dbd57 arch/x86/kvm/lapic.c Radim Krčmář               2016-07-12  2829  			kvm_apic_set_xapic_id(apic, vcpu->vcpu_id);
6e4e3b4df4e31e arch/x86/kvm/lapic.c Cun Li                     2021-01-11  2830  			static_branch_slow_dec_deferred(&apic_hw_disabled);
2f15d027c05fac arch/x86/kvm/lapic.c Vitaly Kuznetsov           2021-04-22  2831  			/* Check if there are APF page ready requests pending */
2f15d027c05fac arch/x86/kvm/lapic.c Vitaly Kuznetsov           2021-04-22  2832  			kvm_make_request(KVM_REQ_APF_READY, vcpu);
187ca84b4b02d8 arch/x86/kvm/lapic.c Wanpeng Li                 2016-08-03  2833  		} else {
6e4e3b4df4e31e arch/x86/kvm/lapic.c Cun Li                     2021-01-11  2834  			static_branch_inc(&apic_hw_disabled.key);
44d527170731c7 arch/x86/kvm/lapic.c Paolo Bonzini              2020-06-22  2835  			atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
c5cc421ba3219b arch/x86/kvm/lapic.c Gleb Natapov               2012-08-05  2836  		}
187ca84b4b02d8 arch/x86/kvm/lapic.c Wanpeng Li                 2016-08-03  2837  	}
c5cc421ba3219b arch/x86/kvm/lapic.c Gleb Natapov               2012-08-05  2838  
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2839  	if (x2apic_enable_changed) {
052c3b99cbc8d2 arch/x86/kvm/lapic.c Emanuele Giuseppe Esposito 2023-01-10  2840  		if (value & X2APIC_ENABLE)
257b9a5faab584 arch/x86/kvm/lapic.c Radim Krčmář               2015-05-22  2841  			kvm_apic_set_x2apic_id(apic, vcpu->vcpu_id);
052c3b99cbc8d2 arch/x86/kvm/lapic.c Emanuele Giuseppe Esposito 2023-01-10  2842  		else if (value & MSR_IA32_APICBASE_ENABLE)
052c3b99cbc8d2 arch/x86/kvm/lapic.c Emanuele Giuseppe Esposito 2023-01-10  2843  			kvm_apic_set_xapic_id(apic, vcpu->vcpu_id);
052c3b99cbc8d2 arch/x86/kvm/lapic.c Emanuele Giuseppe Esposito 2023-01-10  2844  	}
8d860bbeedef97 arch/x86/kvm/lapic.c Jim Mattson                2018-05-09  2845  
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2846  	if (need_lock)
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2847  		mutex_unlock(&vcpu->kvm->arch.apic_map_lock);
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2848  
a184b36a549d15 arch/x86/kvm/lapic.c Dongli Zhang               2026-08-18  2849  	if (apic_mode_changed) {
1459f5c6b8b8df arch/x86/kvm/lapic.c Sean Christopherson        2023-01-06  2850  		kvm_make_request(KVM_REQ_APICV_UPDATE, vcpu);
896046474f8d2e arch/x86/kvm/lapic.c Wei Wang                   2024-05-07  2851  		kvm_x86_call(set_virtual_apic_mode)(vcpu);
8fc9c7a3079e2d arch/x86/kvm/lapic.c Suravee Suthikulpanit      2022-05-19  2852  	}
8d14695f9542e9 arch/x86/kvm/lapic.c Yang Zhang                 2013-01-25  2853  
ad312c7c79f781 drivers/kvm/lapic.c  Zhang Xiantao              2007-12-13  2854  	apic->base_address = apic->vcpu->arch.apic_base &
97222cc8316328 drivers/kvm/lapic.c  Eddie Dong                 2007-09-12  2855  			     MSR_IA32_APICBASE_BASE;
97222cc8316328 drivers/kvm/lapic.c  Eddie Dong                 2007-09-12  2856  
db324fe6f20b0a arch/x86/kvm/lapic.c Nadav Amit                 2014-11-02  2857  	if ((value & MSR_IA32_APICBASE_ENABLE) &&
3743c2f0251743 arch/x86/kvm/lapic.c Maxim Levitsky             2022-06-06  2858  	     apic->base_address != APIC_DEFAULT_PHYS_BASE) {
3743c2f0251743 arch/x86/kvm/lapic.c Maxim Levitsky             2022-06-06  2859  		kvm_set_apicv_inhibit(apic->vcpu->kvm,
3743c2f0251743 arch/x86/kvm/lapic.c Maxim Levitsky             2022-06-06  2860  				      APICV_INHIBIT_REASON_APIC_BASE_MODIFIED);
3743c2f0251743 arch/x86/kvm/lapic.c Maxim Levitsky             2022-06-06  2861  	}
97222cc8316328 drivers/kvm/lapic.c  Eddie Dong                 2007-09-12  2862  }
97222cc8316328 drivers/kvm/lapic.c  Eddie Dong                 2007-09-12  2863  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
