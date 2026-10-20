Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792501730;
	b=WINA51xeGP7zS8sWbIBD4Bj0z1VHXo5zUcyGCqVDb2WI6CBVaAtc1P0NYsUdCOVD59U/
	 vKaGANGx2uUE0elE+jwv3J0DxgYa0bA7kBJmPCYpU/VI+Xt8ba58vLamxuJl3VXWqubnf
	 pKznyFuHLBi+B6p7it04iJ5RUrw0+P8j/QVnccn9YFHxgEE7yh/i/sey5p7bZlHsnWrCb
	 qxDPbNEKCnYrZKSH4cuSUDzwTtQRH1lWTjUZFB+wemkbiq8rhM74yRlIubPcWN6ApWbzb
	 plIuID6OGOgeVmYdXzbG+/40RkzUoJcQgBi7uep8jImol1Xmg2Umv16k1orqqo3oe5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501730;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=QeHjWwEV1Z1c0JJnSy4v3aRJuoAt230IGEjddGGn5yA=;
	b=DyWQY9y2SN1eRSiWFm/+Gl9qfjgAOvsST2A+oGIwcEdANXcCpDejng0fTrrPNSiJiwnu
	 gUkBkAZwLg4XjEIqTO7VtM47u98jclJCLNCqz97CvKBHsNusfy/Uh9HxJSufOvarYsOTF
	 U1A8kMCET5/wBguI4RG2X5nrP7pAJEBQiZALIBms8cYh51qwEsbqQ/cjPyFPpjkuM2Eqb
	 CYVcWh6hnQlBoPbTt4Ic2jl6MwOSrxh3evvNCPVqvFJRRjQGZtXAQDSiCafBtE2BYRoxB
	 G9TPReuXXa766ix3dG2zipIg3q/9bQbCUDtDrNgm2GkhRKauG4hnoG5TQpMYJ1USoGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rh5vQjqf;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983D606A31A
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 13:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6983D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rh5vQjqf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792501730; x=1824037730;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=omgOSBt8KN4e5p+6N9FRa9UTFLcO8+HjfPHILLu43Ow=;
  b=Rh5vQjqfx/Zp0GWg7+69xmzPaXRTZNhAqD2RfCae+2/7xz6QdiWSn9kf
   9Z6owZ5+zHdLzlpdHGLLU0QFXiqY6gHdhcx1WrVQnRgOLCLANykxe8RA3
   GcKjdLwPusaGIowZJQ58dhASP6d1CMMCfFrlFleEtAaWsBhHN0FVIFo2r
   KbAg/vTSshe2+riIqadj60LNTm1byXwoFD0d3qDYy942jUguzC5AU0NqU
   RatgL/blrgWaHI7HgH6/ZxcSMOKtPdrU9bEdnU0A33HjH96HBQ9fsO9Jr
   KBxvikG9z5s6uf2nUz0m3TqpvZH0d2rhwSgpjfZh4haQW/IEePnpuIrsJ
   Q==;
X-CSE-ConnectionGUID: K6Dotf3RTda88SfxDw5IEg==
X-CSE-MsgGUID: EwahP/bcSzWvo78L969/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1104902"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1104902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:08:49 -0700
X-CSE-ConnectionGUID: taGeMjxsSOG0sWJBGllVag==
X-CSE-MsgGUID: GIqxbFY4T4qfF74NrPmQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2878526"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:08:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 06:08:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 06:08:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 06:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCFR1X6V5qG6ZNTXR+nZR6scr0cqkwz4TnZirbzExuZd3D4HZ9Cnf4Os0uoY0CXms3+jzGCRROqM5r+GpI3IfRp7etXPfd7/Gk8mWQHDZ3w2WHokoYu72KcDLI6OmzT7kUWvrK7xaDg0l0etlD4embxU9jcL6cORyfUjZV1Qire4M+vkq6boBivZVnpxE3CYfc2tICZdDe+RupjNg5z+0yZN+/rcPLkJcBBWLfAQky5XOzmHaa1xIIXa3fSe7Hv5aXhsNbfmtpaQp/GA8pomee+b/Ykgz1nYJIw9ypsPx4oalURbqFRBN5hrtJIdsZ0TfS4jzn4tMVoR+wXkjnTfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeHjWwEV1Z1c0JJnSy4v3aRJuoAt230IGEjddGGn5yA=;
 b=jvwC3la9Ybw9bN4CIX2XZoH5z9HKbdeiXOGeEM4zmtVkDbr/BcWbdPfkU3vaOKjJnxPpIyCZ9ggicHorPkgyYv54LodCEN0QxJzKFbBfQVzpGuXYGDrevUrqd4S7/3bL8JbSxlX2w0kLrS2XFr8S5877Fv9wMtyzA14ykwIuVE7kSD1WzpqA42Gys3MVVjqHqP66Dk9T8JpT4amvc0D3yTXaFc7W7WcFa+S5PUU/DHmdYnHnn33KyMmq7AIdhs5W29JEq/3G90J217CjjgX5LUCMfXYJC9GQ9edJtdiXXmuDl/GCsJzyLTArfYkPYSp0QnyKNWa/wWgKwOyIxkdLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 13:08:36 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:08:35 +0000
Date: Tue, 20 Oct 2026 21:08:28 +0800
From: Philip Li <philip.li@intel.com>
To: Marco Elver <elver@google.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>
Subject: Re: [linux-next:master 2294/18293] fs/ext2/super.c:1040:7: warning:
 writing variable 's_mount_state' requires holding spinlock '_res->s_lock'
 exclusively
Message-ID: <atdnzKs+/ldpUnO6@rli9-mobl>
References: <202610191233.W2EJXnGr-lkp@intel.com>
 <ataR1cznaBt-6ge2@elver.google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ataR1cznaBt-6ge2@elver.google.com>
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SN7PR11MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: ea05be26-e1a5-4f72-59ac-08df2eab3f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|3023799007|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ylBZnXNdkYxBo2rtxJTNmIlai1Zn7lmyzQXj0Q48jySPZm5M8JSNz8A3rNJThoaMI+5UEPkqDHMNvltkQyHWdC5GCe4koEagMnDqQfYQUx6vXk3er6r3yiWtVd8XCgtNFU3VLBxLYNhbVsQgu3ZCbazbJRN5dhcBUBHAs9TEQ0d+1vKWg7iKXbyUxBYyLlS13ZxHt6QJhtux1w06ImqotzHR/zIxpvml7tIqMj9aMWbI13TL3IreY9kiaMSbL8N7OIHl0U19cb3lZWCSrkKUjuLDMc7OHK1HASW7Az4dmhy50jynnWgT1s1uMN4NqjFf44MRYBaMXqAIPyUMTWlzaiI2BSU6tyP8D07ViEX9J63gKF2DkxUZyr9XP7SWS3+QOt2aXKNQ4jsqlMcdMU7LxxT6JuZZ9eXm0YoIWiXQHz/QSFxVlViUobKN0vlfDjha1utEnJeT6ED5YPrECCUrIJgHW8ggaZYCT7W9s/oxF5GuVMwIUFOSw/1YhsDmYCgI2ErKoVfqOdSG84NNYChdhpXZq1auYGkBVDtvMkc5p7ZgDvkNwjY1bKM3+s/1GINWy0PL7dtE8Oh9crLPzqiI1gcHgLDy+wuu+2lsEiY4hONgRcieHOjLI6hwICKY3nar
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?INey2bX2/V7NXqAvZe2gBbqZWT2i8RY4TlQGhvgFBuRG6GsHFkX3rfhONLeV?=
 =?us-ascii?Q?n/VBG2bzRVH3XSZ3NDWCkmrWDM0EFXDi9dwbhXqVEOwNqMoOjGlLYbmSEJFt?=
 =?us-ascii?Q?TbO1jlWngZPyy7+FuL5dJGXk32xmk96tjtnSZrcYkXBFFpJztUd9BV5RC4yI?=
 =?us-ascii?Q?XKEiuNzww5Rrcgx2rfIvog7AaukVj9DI4RVk3tgRiyojL0smJIW+3/Yn1IyE?=
 =?us-ascii?Q?xvLSBVTvwqwxUv4+yIvGdMgRpTwhOwLIVR3Q+0QR136NE6iqlYjdWyPbDEfi?=
 =?us-ascii?Q?LtPGxjmS5moYjC8B0CzK8D9wvju9MuVLt46+QpWYoxRM1YvHTMM3kutyI8Bm?=
 =?us-ascii?Q?cJQd0ovIGLB47T4YhM76wus3b/KK06Bk7bnqGNw5ExtBfjGAmyFjUhf4fiva?=
 =?us-ascii?Q?Xlnqgo+4ZN2gUSInOYqlWkZiMut4fzWN6bcbFUPcKk4YTSoTBw1nNZBaLU4I?=
 =?us-ascii?Q?Ji8EFmbWjKnV5qM8A0dGuEh3JwVw5COLoFI43ygLhX2XvXcOfbnwGdl6ql2Q?=
 =?us-ascii?Q?OiJdLiCb1cd6T7UPiRysHLOaj+IbDvUE3Dh0TCzPOdMGHmkG7dfw0Tvr0iyg?=
 =?us-ascii?Q?IZFaQr5OyCa7NMDC4MjQnCyLWD6K6XDzdjMgsQEMe7aIRpG4wXwgXyFrb4n2?=
 =?us-ascii?Q?uefbfSnVkjcglfl+cclrjue87RyAYNtzvZZmBUL9E5Yn1s1YUfqNMp71HkvW?=
 =?us-ascii?Q?4q2waYy3sGXFZ77YKa/YK5mcKaVfMf+nQYIkQvsVne8ByezXMQtYXWoFua5V?=
 =?us-ascii?Q?XVxIGwacQj430yKRG7h5QRyM0bFg48WtRYPwePDA7eU8uruhoPJ1ogzxgAo+?=
 =?us-ascii?Q?6d9Ju3VB4jZ+6Jjjqh5ISAMcsQR+QFI+Z+S58CQWyTVY4RVV9PaPDgkS/KeA?=
 =?us-ascii?Q?YWMyuCdBQqd2rUXf/Py4yK86BivqvEIhfx6KIcnun2A00Oplxx5Rik3mjokU?=
 =?us-ascii?Q?xO3HWHXay2R5VWO4V1Yuy5ouDYKZA49u7XRmpf22SuIsI+0BsyzGy6J1zV4X?=
 =?us-ascii?Q?gWU0gmgVApApWl2/2t72B9z/yUM1LRRA1CKQKreD1iOgRR4JrNhWqgnCCM8n?=
 =?us-ascii?Q?idz7saR0exxtHsQF9jiYL7mZs7KQ5TS5igCSah3sJL1Wej6BxSmnnRo6gV2p?=
 =?us-ascii?Q?2FOeJ5CUiA/QTuz53uV+gne25ib62p+5eTS926vuiauqlVeiGmH7k4HBH1ze?=
 =?us-ascii?Q?oszwL512M/u3hYxeHP8x+sxjOXZvGl10r4SaLwwLZvbMRUcU8NWJVtxmWbmA?=
 =?us-ascii?Q?P2VoErUdLJNPtpgzCuG78kDxjmu1FAUZlVtYAm7ir51iB+B9tUQjKVKhsmAM?=
 =?us-ascii?Q?/0hxnl6CUV+iAELAhpIL/itwbnO1xf2N5grQ/pgkEcRffBGuQlCnhIEA3QUV?=
 =?us-ascii?Q?yXnaq6gTTXZwEwxVgio+lsnDQEQoVwkM/ATZp1sv8KK2OrYy41BAwWj1yJgx?=
 =?us-ascii?Q?HTkWt5Ulc58VljbRSDVdF33SL6IJpd9Mh8wgdMdhS217UV0kzeVQtzeuQn2t?=
 =?us-ascii?Q?vXjMlbZH404cFLK9q7E8JlvuStSTZMJC3G6Ec15AUzdfA09DNM29Giu/BfTy?=
 =?us-ascii?Q?qvg6eWAEkBCXR2cyRmWs0vgKMxXerJMSZawgpCSg01YTG7WVb0CHdJ4xzNCN?=
 =?us-ascii?Q?TB5h+jYJ4QmIq6HS5qUxqD37zi8F0Y1yrlWUZPYr9s4SdEq7PDyw/u9D6UtO?=
 =?us-ascii?Q?Nw9Oy4aSUTdY362b04DH8T3iA9+Sdn2Dk0A3KC9+eFkDuWZq3TZ/uJWKCLpl?=
 =?us-ascii?Q?xitp4FsloQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: x/vHD/iQRUMWt7AZcy75eQp1tfZJFhSwpgxW1Cws8cEAAWLMGvemR1TEc5JHzX5u8ip+ZsviGt92zr00fMyfizvcP5uLKIHbCPsPr9dcEbLhymLtSyu2mRhac6MBbf6Lg0ekz0dFqW3g5rlzglwtaX1LPt32CvJT0Y2zfyjn53rHORCkTCjcS1tII8ds9clJ1yrmEPpnCILVGWsl++AX6czjLmWhCHZF0ZzWoeI9cTvUfM8FzZU5Ytl+rVZg4JqsCucrfT9CE1giOmWMhYIWiV5KxLigAZ2cE2/swr4+TPsp8phpyFNKKtmb5pXRFLLT/tUu65Go6e4R/LD/Ynn/pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea05be26-e1a5-4f72-59ac-08df2eab3f9b
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:08:35.4654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXt7qoOVD2h+ck2koHRc3ECe7reTQhQ4GR+OIimF992nXVLgTeJw0wMxoAyW5ECFmuvwU7CBSMyvHKCPT082bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
X-OriginatorOrg: intel.com

On Mon, Oct 19, 2026 at 09:55:33PM +0000, Marco Elver wrote:
> Please ignore: https://github.com/ClangBuiltLinux/linux/issues/2187
> It's an unstable Clang issue.

got it, i will configure bot to avoid reporting this commit again.

> 
> On Mon, Oct 19, 2026 at 12:32PM +0200, kernel test robot wrote:
> > :::::: 
> > :::::: Manual check reason: "only suspicious fbc files changed"
> > :::::: 
> > 
> > BCC: lkp@intel.com
> > CC: llvm@lists.linux.dev
> > CC: oe-kbuild-all@lists.linux.dev
> > TO: Timothy Day <timday@thelustrecollective.com>
> > CC: Jan Kara <jack@suse.cz>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> > commit: 9708538ba204d20aa9a5936530862254dcbc6f70 [2294/18293] ext2: enable context analysis support for ext2 filesystem
> > :::::: branch date: 3 days ago
> > :::::: commit date: 7 weeks ago
> > config: riscv-randconfig-2001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191233.W2EJXnGr-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191233.W2EJXnGr-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/r/202610191233.W2EJXnGr-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> fs/ext2/super.c:1040:7: warning: writing variable 's_mount_state' requires holding spinlock '_res->s_lock' exclusively [-Wthread-safety-precise]
> >     1040 |         sbi->s_mount_state = le16_to_cpu(es->s_state);
> >          |              ^
> >    fs/ext2/super.c:1040:7: note: found near match 'EXT2_SB(sb).s_lock'
> > >> fs/ext2/super.c:1138:8: warning: writing variable 's_rsv_window_root' requires holding spinlock '_res->s_rsv_window_lock' exclusively [-Wthread-safety-precise]
> >     1138 |                 sbi->s_rsv_window_root = RB_ROOT;
> >          |                      ^
> >    fs/ext2/super.c:1138:8: note: found near match 'EXT2_SB(sb).s_rsv_window_lock'
> >    2 warnings generated.
> > 
> > 
> > vim +1040 fs/ext2/super.c
> > 
> > eab61d3260d76b3 Eric Sandeen      2025-02-23   866  
> > eab61d3260d76b3 Eric Sandeen      2025-02-23   867  static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   868  {
> > eab61d3260d76b3 Eric Sandeen      2025-02-23   869  	struct ext2_fs_context *ctx = fc->fs_private;
> > eab61d3260d76b3 Eric Sandeen      2025-02-23   870  	int silent = fc->sb_flags & SB_SILENT;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   871  	struct buffer_head * bh;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   872  	struct ext2_sb_info * sbi;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   873  	struct ext2_super_block * es;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   874  	struct inode *root;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   875  	unsigned long block;
> > eab61d3260d76b3 Eric Sandeen      2025-02-23   876  	unsigned long sb_block = ctx->s_sb_block;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   877  	unsigned long logic_sb_block;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   878  	unsigned long offset = 0;
> > d09099051057bba Chengguang Xu     2018-02-26   879  	long ret = -ENOMEM;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   880  	int blocksize = BLOCK_SIZE;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   881  	int db_count;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   882  	int i, j;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   883  	__le32 features;
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16   884  	int err;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   885  
> > bf4afc53b77aeaa Linus Torvalds    2026-02-21   886  	sbi = kzalloc_obj(*sbi);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   887  	if (!sbi)
> > cea845cdef4f509 Christoph Hellwig 2021-11-29   888  		return -ENOMEM;
> > 18a82eb9f980b5e Pekka J Enberg    2009-01-07   889  
> > 18a82eb9f980b5e Pekka J Enberg    2009-01-07   890  	sbi->s_blockgroup_lock =
> > bf4afc53b77aeaa Linus Torvalds    2026-02-21   891  		kzalloc_obj(struct blockgroup_lock);
> > 18a82eb9f980b5e Pekka J Enberg    2009-01-07   892  	if (!sbi->s_blockgroup_lock) {
> > 18a82eb9f980b5e Pekka J Enberg    2009-01-07   893  		kfree(sbi);
> > cea845cdef4f509 Christoph Hellwig 2021-11-29   894  		return -ENOMEM;
> > 18a82eb9f980b5e Pekka J Enberg    2009-01-07   895  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   896  	sb->s_fs_info = sbi;
> > 93d44cb275f3eba Miklos Szeredi    2007-10-16   897  	sbi->s_sb_block = sb_block;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   898  
> > 023051c2d0f1d78 Timothy Day       2026-08-11   899  	guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
> > d09099051057bba Chengguang Xu     2018-02-26   900  	ret = -EINVAL;
> > c15271f4e74cd6d Jan Blunck        2010-04-14   901  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   902  	/*
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   903  	 * See what the current blocksize for the device is, and
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   904  	 * use that as the blocksize.  Otherwise (or if the blocksize
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   905  	 * is smaller than the default) use the default.
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   906  	 * This is important for devices that have a hardware
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   907  	 * sectorsize that is larger than the default.
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   908  	 */
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   909  	blocksize = sb_min_blocksize(sb, BLOCK_SIZE);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   910  	if (!blocksize) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   911  		ext2_msg(sb, KERN_ERR, "error: unable to set blocksize");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   912  		goto failed_sbi;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   913  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   914  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   915  	/*
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   916  	 * If the superblock doesn't start on a hardware sector boundary,
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   917  	 * calculate the offset.  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   918  	 */
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   919  	if (blocksize != BLOCK_SIZE) {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   920  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   921  		offset = (sb_block*BLOCK_SIZE) % blocksize;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   922  	} else {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   923  		logic_sb_block = sb_block;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   924  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   925  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   926  	if (!(bh = sb_bread(sb, logic_sb_block))) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   927  		ext2_msg(sb, KERN_ERR, "error: unable to read superblock");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   928  		goto failed_sbi;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   929  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   930  	/*
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   931  	 * Note: s_es must be initialized as soon as possible because
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   932  	 *       some ext2 macro-instructions depend on its value
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   933  	 */
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   934  	es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   935  	sbi->s_es = es;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   936  	sb->s_magic = le16_to_cpu(es->s_magic);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   937  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   938  	if (sb->s_magic != EXT2_SUPER_MAGIC)
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   939  		goto cantfind_ext2;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   940  
> > eab61d3260d76b3 Eric Sandeen      2025-02-23   941  	ext2_set_options(fc, sbi);
> > 088519572ca8bd6 Jan Kara          2017-10-09   942  
> > 1751e8a6cb935e5 Linus Torvalds    2017-11-27   943  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
> > 38fa0e8e4a3b932 Chengguang Xu     2019-05-20   944  		(test_opt(sb, POSIX_ACL) ? SB_POSIXACL : 0);
> > 46b15caa7cb19b0 Tejun Heo         2015-06-16   945  	sb->s_iflags |= SB_I_CGROUPWB;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   946  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   947  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV &&
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   948  	    (EXT2_HAS_COMPAT_FEATURE(sb, ~0U) ||
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   949  	     EXT2_HAS_RO_COMPAT_FEATURE(sb, ~0U) ||
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   950  	     EXT2_HAS_INCOMPAT_FEATURE(sb, ~0U)))
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   951  		ext2_msg(sb, KERN_WARNING,
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   952  			"warning: feature flags set on rev 0 fs, "
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   953  			"running e2fsck is recommended");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   954  	/*
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   955  	 * Check feature flags regardless of the revision level, since we
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   956  	 * previously didn't change the revision level when setting the flags,
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   957  	 * so there is a chance incompat flags are set on a rev 0 filesystem.
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   958  	 */
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   959  	features = EXT2_HAS_INCOMPAT_FEATURE(sb, ~EXT2_FEATURE_INCOMPAT_SUPP);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   960  	if (features) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   961  		ext2_msg(sb, KERN_ERR,	"error: couldn't mount because of "
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   962  		       "unsupported optional features (%x)",
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   963  			le32_to_cpu(features));
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   964  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   965  	}
> > bc98a42c1f7d0f8 David Howells     2017-07-17   966  	if (!sb_rdonly(sb) && (features = EXT2_HAS_RO_COMPAT_FEATURE(sb, ~EXT2_FEATURE_RO_COMPAT_SUPP))){
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   967  		ext2_msg(sb, KERN_ERR, "error: couldn't mount RDWR because of "
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   968  		       "unsupported optional features (%x)",
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   969  		       le32_to_cpu(features));
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   970  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   971  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   972  
> > 62aeb94433fcec8 Jan Kara          2023-03-01   973  	if (le32_to_cpu(es->s_log_block_size) >
> > 62aeb94433fcec8 Jan Kara          2023-03-01   974  	    (EXT2_MAX_BLOCK_LOG_SIZE - BLOCK_SIZE_BITS)) {
> > 62aeb94433fcec8 Jan Kara          2023-03-01   975  		ext2_msg(sb, KERN_ERR,
> > 62aeb94433fcec8 Jan Kara          2023-03-01   976  			 "Invalid log block size: %u",
> > 62aeb94433fcec8 Jan Kara          2023-03-01   977  			 le32_to_cpu(es->s_log_block_size));
> > 62aeb94433fcec8 Jan Kara          2023-03-01   978  		goto failed_mount;
> > 62aeb94433fcec8 Jan Kara          2023-03-01   979  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   980  	blocksize = BLOCK_SIZE << le32_to_cpu(sbi->s_es->s_log_block_size);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   981  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   982  	/* If the blocksize doesn't match, re-read the thing.. */
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   983  	if (sb->s_blocksize != blocksize) {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   984  		brelse(bh);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   985  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   986  		if (!sb_set_blocksize(sb, blocksize)) {
> > 4e299c1d9113b5c Robin Dong        2011-05-05   987  			ext2_msg(sb, KERN_ERR,
> > 4e299c1d9113b5c Robin Dong        2011-05-05   988  				"error: bad blocksize %d", blocksize);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   989  			goto failed_sbi;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   990  		}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   991  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   992  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   993  		offset = (sb_block*BLOCK_SIZE) % blocksize;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   994  		bh = sb_bread(sb, logic_sb_block);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   995  		if(!bh) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   996  			ext2_msg(sb, KERN_ERR, "error: couldn't read"
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19   997  				"superblock on 2nd try");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   998  			goto failed_sbi;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16   999  		}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1000  		es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1001  		sbi->s_es = es;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1002  		if (es->s_magic != cpu_to_le16(EXT2_SUPER_MAGIC)) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1003  			ext2_msg(sb, KERN_ERR, "error: magic mismatch");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1004  			goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1005  		}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1006  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1007  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1008  	sb->s_maxbytes = ext2_max_size(sb->s_blocksize_bits);
> > 8de52778798fe39 Al Viro           2012-02-06  1009  	sb->s_max_links = EXT2_LINK_MAX;
> > 22b139691f9eb8b Deepa Dinamani    2019-07-30  1010  	sb->s_time_min = S32_MIN;
> > 22b139691f9eb8b Deepa Dinamani    2019-07-30  1011  	sb->s_time_max = S32_MAX;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1012  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1013  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV) {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1014  		sbi->s_inode_size = EXT2_GOOD_OLD_INODE_SIZE;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1015  		sbi->s_first_ino = EXT2_GOOD_OLD_FIRST_INO;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1016  	} else {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1017  		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1018  		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1019  		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
> > d8ea6cf89991000 vignesh babu      2007-10-16  1020  		    !is_power_of_2(sbi->s_inode_size) ||
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1021  		    (sbi->s_inode_size > blocksize)) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1022  			ext2_msg(sb, KERN_ERR,
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1023  				"error: unsupported inode size: %d",
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1024  				sbi->s_inode_size);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1025  			goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1026  		}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1027  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1028  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1029  	sbi->s_blocks_per_group = le32_to_cpu(es->s_blocks_per_group);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1030  	sbi->s_inodes_per_group = le32_to_cpu(es->s_inodes_per_group);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1031  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1032  	sbi->s_inodes_per_block = sb->s_blocksize / EXT2_INODE_SIZE(sb);
> > 607eb266aea9dd2 Andries Brouwer   2006-08-27  1033  	if (sbi->s_inodes_per_block == 0 || sbi->s_inodes_per_group == 0)
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1034  		goto cantfind_ext2;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1035  	sbi->s_itb_per_group = sbi->s_inodes_per_group /
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1036  					sbi->s_inodes_per_block;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1037  	sbi->s_desc_per_block = sb->s_blocksize /
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1038  					sizeof (struct ext2_group_desc);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1039  	sbi->s_sbh = bh;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16 @1040  	sbi->s_mount_state = le16_to_cpu(es->s_state);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1041  	sbi->s_addr_per_block_bits =
> > f0d1b0b30d250a0 David Howells     2006-12-08  1042  		ilog2 (EXT2_ADDR_PER_BLOCK(sb));
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1043  	sbi->s_desc_per_block_bits =
> > f0d1b0b30d250a0 David Howells     2006-12-08  1044  		ilog2 (EXT2_DESC_PER_BLOCK(sb));
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1045  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1046  	if (sb->s_magic != EXT2_SUPER_MAGIC)
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1047  		goto cantfind_ext2;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1048  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1049  	if (sb->s_blocksize != bh->b_size) {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1050  		if (!silent)
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1051  			ext2_msg(sb, KERN_ERR, "error: unsupported blocksize");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1052  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1053  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1054  
> > 404615d7f1dcd4c Jan Kara          2023-06-13  1055  	if (es->s_log_frag_size != es->s_log_block_size) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1056  		ext2_msg(sb, KERN_ERR,
> > 404615d7f1dcd4c Jan Kara          2023-06-13  1057  			"error: fragsize log %u != blocksize log %u",
> > 404615d7f1dcd4c Jan Kara          2023-06-13  1058  			le32_to_cpu(es->s_log_frag_size), sb->s_blocksize_bits);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1059  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1060  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1061  
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1062  	if (sbi->s_blocks_per_group > sb->s_blocksize * 8) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1063  		ext2_msg(sb, KERN_ERR,
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1064  			"error: #blocks per group too big: %lu",
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1065  			sbi->s_blocks_per_group);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1066  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1067  	}
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1068  	/* At least inode table, bitmaps, and sb have to fit in one group */
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1069  	if (sbi->s_blocks_per_group <= sbi->s_itb_per_group + 3) {
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1070  		ext2_msg(sb, KERN_ERR,
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1071  			"error: #blocks per group smaller than metadata size: %lu <= %lu",
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1072  			sbi->s_blocks_per_group, sbi->s_inodes_per_group + 3);
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1073  		goto failed_mount;
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1074  	}
> > fa78f336937240d Jan Kara          2022-07-26  1075  	if (sbi->s_inodes_per_group < sbi->s_inodes_per_block ||
> > fa78f336937240d Jan Kara          2022-07-26  1076  	    sbi->s_inodes_per_group > sb->s_blocksize * 8) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1077  		ext2_msg(sb, KERN_ERR,
> > fa78f336937240d Jan Kara          2022-07-26  1078  			"error: invalid #inodes per group: %lu",
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1079  			sbi->s_inodes_per_group);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1080  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1081  	}
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1082  	if (sb_bdev_nr_blocks(sb) < le32_to_cpu(es->s_blocks_count)) {
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1083  		ext2_msg(sb, KERN_ERR,
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1084  			 "bad geometry: block count %u exceeds size of device (%u blocks)",
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1085  			 le32_to_cpu(es->s_blocks_count),
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1086  			 (unsigned)sb_bdev_nr_blocks(sb));
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1087  		goto failed_mount;
> > d766f2d1e3e3bd4 Jan Kara          2022-09-14  1088  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1089  
> > 41f04d852e35958 Eric Sandeen      2006-09-27  1090  	sbi->s_groups_count = ((le32_to_cpu(es->s_blocks_count) -
> > 41f04d852e35958 Eric Sandeen      2006-09-27  1091  				le32_to_cpu(es->s_first_data_block) - 1)
> > 41f04d852e35958 Eric Sandeen      2006-09-27  1092  					/ EXT2_BLOCKS_PER_GROUP(sb)) + 1;
> > fa78f336937240d Jan Kara          2022-07-26  1093  	if ((u64)sbi->s_groups_count * sbi->s_inodes_per_group !=
> > fa78f336937240d Jan Kara          2022-07-26  1094  	    le32_to_cpu(es->s_inodes_count)) {
> > fa78f336937240d Jan Kara          2022-07-26  1095  		ext2_msg(sb, KERN_ERR, "error: invalid #inodes: %u vs computed %llu",
> > fa78f336937240d Jan Kara          2022-07-26  1096  			 le32_to_cpu(es->s_inodes_count),
> > fa78f336937240d Jan Kara          2022-07-26  1097  			 (u64)sbi->s_groups_count * sbi->s_inodes_per_group);
> > fa78f336937240d Jan Kara          2022-07-26  1098  		goto failed_mount;
> > fa78f336937240d Jan Kara          2022-07-26  1099  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1100  	db_count = (sbi->s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1101  		   EXT2_DESC_PER_BLOCK(sb);
> > 32a92f8c8932698 Linus Torvalds    2026-02-21  1102  	sbi->s_group_desc = kvmalloc_objs(struct buffer_head *, db_count);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1103  	if (sbi->s_group_desc == NULL) {
> > 6a03e6a8dcf573d Chengguang Xu     2019-01-01  1104  		ret = -ENOMEM;
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1105  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1106  		goto failed_mount;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1107  	}
> > 18a82eb9f980b5e Pekka J Enberg    2009-01-07  1108  	bgl_lock_init(sbi->s_blockgroup_lock);
> > dd00cc486ab1c17 Yoann Padioleau   2007-07-19  1109  	sbi->s_debts = kcalloc(sbi->s_groups_count, sizeof(*sbi->s_debts), GFP_KERNEL);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1110  	if (!sbi->s_debts) {
> > 6a03e6a8dcf573d Chengguang Xu     2019-01-01  1111  		ret = -ENOMEM;
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1112  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1113  		goto failed_mount_group_desc;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1114  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1115  	for (i = 0; i < db_count; i++) {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1116  		block = descriptor_loc(sb, logic_sb_block, i);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1117  		sbi->s_group_desc[i] = sb_bread(sb, block);
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1118  		if (!sbi->s_group_desc[i]) {
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1119  			for (j = 0; j < i; j++)
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1120  				brelse (sbi->s_group_desc[j]);
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1121  			ext2_msg(sb, KERN_ERR,
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1122  				"error: unable to read group descriptors");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1123  			goto failed_mount_group_desc;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1124  		}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1125  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1126  	if (!ext2_check_descriptors (sb)) {
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1127  		ext2_msg(sb, KERN_ERR, "group descriptors corrupted");
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1128  		goto failed_mount2;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1129  	}
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1130  	sbi->s_gdb_count = db_count;
> > ^1da177e4c3f415 Linus Torvalds    2005-04-16  1131  	spin_lock_init(&sbi->s_next_gen_lock);
> > e76ed86ee88f68f Timothy Day       2026-08-11  1132  	scoped_guard(spinlock, &sbi->s_next_gen_lock)
> > e76ed86ee88f68f Timothy Day       2026-08-11  1133  		sbi->s_next_generation = get_random_u32();
> > 0216bfcffe424a5 Mingming Cao      2006-06-23  1134  
> > e312c97ea253f07 Liu xuzhi         2021-03-18  1135  	/* per filesystem reservation list head & lock */
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1136  	spin_lock_init(&sbi->s_rsv_window_lock);
> > c23746524fafe99 Timothy Day       2026-08-11  1137  	scoped_guard(spinlock, &EXT2_SB(sb)->s_rsv_window_lock) {
> > a686cd898bd999f Martin J. Bligh   2007-10-16 @1138  		sbi->s_rsv_window_root = RB_ROOT;
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1139  		/*
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1140  		 * Add a single, static dummy reservation to the start of the
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1141  		 * reservation window list --- it gives us a placeholder for
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1142  		 * append-at-start-of-list which makes the allocation logic
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1143  		 * _much_ simpler.
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1144  		 */
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1145  		sbi->s_rsv_window_head.rsv_start = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1146  		sbi->s_rsv_window_head.rsv_end = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1147  		sbi->s_rsv_window_head.rsv_alloc_hit = 0;
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1148  		sbi->s_rsv_window_head.rsv_goal_size = 0;
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1149  		ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
> > c23746524fafe99 Timothy Day       2026-08-11  1150  	}
> > a686cd898bd999f Martin J. Bligh   2007-10-16  1151  
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1152  	err = percpu_counter_init(&sbi->s_freeblocks_counter,
> > 908c7f1949cb7cc Tejun Heo         2014-09-08  1153  				ext2_count_free_blocks(sb), GFP_KERNEL);
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1154  	if (!err) {
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1155  		err = percpu_counter_init(&sbi->s_freeinodes_counter,
> > 908c7f1949cb7cc Tejun Heo         2014-09-08  1156  				ext2_count_free_inodes(sb), GFP_KERNEL);
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1157  	}
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1158  	if (!err) {
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1159  		err = percpu_counter_init(&sbi->s_dirs_counter,
> > 908c7f1949cb7cc Tejun Heo         2014-09-08  1160  				ext2_count_dirs(sb), GFP_KERNEL);
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1161  	}
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1162  	if (err) {
> > 34e92542da96430 Chengguang Xu     2019-11-29  1163  		ret = err;
> > 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1164  		ext2_msg(sb, KERN_ERR, "error: insufficient memory");
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1165  		goto failed_mount3;
> > 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1166  	}
> > be0726d33cb8f41 Jan Kara          2016-02-22  1167  
> > 
> > :::::: The code at line 1040 was first introduced by commit
> > :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> > 
> > :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> > :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
