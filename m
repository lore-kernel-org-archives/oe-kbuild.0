Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441151A71A
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/1eI8RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701856211; x=1733392211;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PbK3Cv9ZI/xOPKpag6Lo0A6OC82JQgGGq2pjPNamcLo=;
  b=V/1eI8RLjTbzNg/nw2p7/n4XSLhNDLQT2jM/6ivh6oBVdtzZFNuMr6vO
   FbB44josLnSnrLrwfjLURRTeLylqJ65lh7n3AEyKhQ+lHa+JctOzSGuJE
   rYhUCl6q79kH2d5jgxAWyQ1mBP9x7taY3o9FAjuX+o5Wf/CZ/SuVlbehm
   gohc++gMOpYfsRYrTIiXg/rEsc3vQUTd+gBhL3f66NKUMcuRhxetGCt/+
   6GlcrmV2MpxdISRruHCXQj6kH/xdPeJ0CX8Q/i50cMn7+eP0QgUl3kxhL
   z01w35NdHDA960h8RTY/j5gX4+yTZCzcARCz+BeyXzaxBnpkYC/313DlY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384436141"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="384436141"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 01:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837268624"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="837268624"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Dec 2023 01:50:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 01:50:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 01:50:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 01:50:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REoFj/oenUKMEkmb4PIQn/RN7hQLXrat/QOcynS4ivrDf6pB2trXm9wvAwUkEXXzg8X/TZmlOiIQKOAgQ2fk1fNXmjyAHJtb+aNE8KRTZq0MuY5M/vBYMrHTzAnlIf8H/AKHldm6j1gG+nnkTLCbJfbXbqj9qH+FV5PtBRocsX9aaFdd3e3DFDU+V3XnTImFwBmadOICytKV2GZJ2ImleR8sT189hNXJhdQVJ8GfavfNNuDRWDEbVY98+6ax/llrGNOyGUJykxHJ2ugrayzrHG4vT2oh9dbvG192HnX9R9QL/vCpkHjH7doXyC/LZ+PLjJjinyGOextFCSB2qVnIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VQ6vVuuxFSWuTjMimkzAR9ynVmU4BjsaBMV41/V6+U=;
 b=GXYiA2TJxNZquQ618NWdoJQJ9zXyWVINmOqSl7y8rjnxiwi7rTqQICtXMM6LaXVoC8LygTj2GCLHdYiOIfxm7WFfYmpg/eYCpLwXMqQ3CPRZFA8lnXoUUT2PKRKvd0ooNhRoVSihS1QdvzlHJ6HfRCBZn+/vY9Uzw+LjCd+BNP8kupyZov3xTYH2OFT1YXIqqJIN8DdgLvsc0Itd/LROnEaTgK7ouBgDOThfzAkB+5xaGhpNREYbzYp0v0XHocHfjqQLJGu0Ms/uL/lQYsFmnQ/u6qb0/CwxS8qj3/beOLw14dvKCkG8GGNDtkssKmYSkplpMcdDSf2kgkL+gAkuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 09:50:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Wed, 6 Dec 2023
 09:50:06 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [peterz-queue:x86/kvm 11/11] arch/x86/kvm/emulate.o: warning:
 objtool: fastop+0x169: missing int3 after indirect jump
Thread-Topic: [peterz-queue:x86/kvm 11/11] arch/x86/kvm/emulate.o: warning:
 objtool: fastop+0x169: missing int3 after indirect jump
Thread-Index: AQHaJ3J6XefiLF771kSV2MIzdlXZ0rCb+OEw
Date: Wed, 6 Dec 2023 09:50:06 +0000
Message-ID: <CY5PR11MB6392452DC991D17FCFEB17BBFB84A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312051947.9sPdeEW4-lkp@intel.com>
In-Reply-To: <202312051947.9sPdeEW4-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ1PR11MB6249:EE_
x-ms-office365-filtering-correlation-id: ce74da0e-acd4-42af-1941-08dbf640ba0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DW9Rtk3p6n7pf+o+Y1LG5r0smTMRIfG6J+3Psv6Lj6RkzA0gYIQydLg+FoqoNVYsswOOr5ojTe35AsNA4c2v5kWXxxTXp7cy/s+IVlXKGJoigP7bs4w95KBOuIQC8j7yDujIluf1kpAdzG+JOCWcd256KPcV/zVvf7XU3QUH4OpX4N0K4TtV8qShF1lKgzht7d30jGkXPzsAz2l82Tr07+2e4Sj/XimHqSAehl6KBmguI816KNCRE7xNB4OBGKtAeWAjPsDxLY5LmpTSQFEXT2jpyzn2XoBfncR6M7DbeqOvSI2KfiTrAEZTow7QBhu1lRk3eZmUgx0HnPvTWaFsOgNXbQ+LIiJahXeqZRTVTknt/IrFzPBegI4Ly7LnklUeH+Qa9yMB1FUxUV562qcvG2e8yxDIgvLiWZ5fmIyXN5vLddmSTY9mGxt4XmxvbJglX2cMYXoXPbszIWQ7YOhNyXqcZoX32NQt93mm6G/mWjEBZlyLZmYk2S+QDhxjkXmD3JYJdTSFx3p16sgFN2zX527JZq3rMauNFhUwjjBY609ZtgZzxgOwQ8qUE1XI1ePWuizbry+kCgkDFph0NOlk1DPnjbqTe1gxBFqI/iWsbkIqolHCTOaT72aHvz8NFxdfhzDDxXT1PC15wXhwqulRrRjcjp6oTn02qMhg0wLNiVkcGvyR3PH4dp7GRnW82ueK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(55016003)(38070700009)(478600001)(9686003)(53546011)(8936002)(6506007)(966005)(7696005)(71200400001)(26005)(52536014)(64756008)(66476007)(66446008)(110136005)(66556008)(8676002)(66946007)(76116006)(316002)(83380400001)(38100700002)(33656002)(82960400001)(122000001)(5660300002)(86362001)(41300700001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tftl2fucFAo6xI505aQu0sbcxvVJxRbwbN8LzN+KsrcTuZadIeizjobztfix?=
 =?us-ascii?Q?WFnD0Vki5EcLz3NYaM3KIbXbQVieWWkpdKIxz5ATybDNJEQ4YVZX5xV4nJEX?=
 =?us-ascii?Q?X5pe+i12qDnlk6pu70pzygLNwyWM+hMtLsZnKHaLs5w2h4t8whGDQYV7O/gF?=
 =?us-ascii?Q?QVLdRhKOwih0yQVoECIs9qvLs4bCJIGpfQdOa86wZ/qyNiJP/En8COc9U7EF?=
 =?us-ascii?Q?JJSilWwX3+hhXYffN4YyaE7r0pV2wxy2For5r82o6knKC4otvviToNdu97mR?=
 =?us-ascii?Q?oFwvJPaJDxpD0m5jolSQv0oAJcWsM2G/p0t3AG2GFBnMe5AkAsn0u+Wxj/8h?=
 =?us-ascii?Q?1JD3Sjs95bhnKLPeo1FR+6CIe/0O5v0a9qMES87iIj3e7vSIf5tSCX4b0rDP?=
 =?us-ascii?Q?bHzxqIiMxZ3elag9sS7OnVNpQKay3m4f3TI66pnv+g2o8Xs42ATqMzo1G0jy?=
 =?us-ascii?Q?k7JmYzl/g5t14WDGF5iS5sRUU54l5RFXyuvB6QLGf4ruHZ4eBfhcgx0ikidy?=
 =?us-ascii?Q?sb0lWmgDcwDK2qfME3R9jFoZch3iTaBeA/RjQjyTYeoBVCCVlmfABNBj9keq?=
 =?us-ascii?Q?6DUISF4/julMjjHmm4K9VLRdUeXYbyRgYUPx09Mg/0eW8x7o+a+A7bSBfQpr?=
 =?us-ascii?Q?jFs0Hfhba0FmelIWbrvtpQjDoAt/5lefKq0LvWDyOhu3YXBT6KxDQ/nbSlsv?=
 =?us-ascii?Q?98VqYNQc7SqKcmVY6hs905P30Hwc8Y2xdvR9HEAM0r54HDbrgSjd18QYR5d/?=
 =?us-ascii?Q?WY5tnytpBUw2NtV1OpDGlCXnjvmXETmVaqaeuxY5eGMKd20DyiZF8zT5x1Z2?=
 =?us-ascii?Q?J8xG13OuqGHkJt+80TgrVt7M/8KynbddXhm9RjRi9VjQurUVHywf/8s6I3SB?=
 =?us-ascii?Q?u+CaXF5kKgf4PObTlNWRquygLhOZe3wMiWyvm7hrboIYvFlniINxA4nsE87V?=
 =?us-ascii?Q?981K0bAWUuHhjKMScFNRMQkwbzrDk7UDN0jcSs8X4dabwj4qmvmF0aeTqYAq?=
 =?us-ascii?Q?PIcRt/Q7+wttn2w/vWkmLEh+VZKVobs1uLPTZJthRqDDCIWeUIezQOt3UxGL?=
 =?us-ascii?Q?yRk2IzADvmn2xfch9TFbfBoIuQRsI6lFPbrPvQoq4K3lNwWuhhTr7NSYjGTw?=
 =?us-ascii?Q?Vo1fUWtBTsuNUVBObiqkIdzpaWAurhgLyCZPxd48tsSfdhDHUhOvXAIJ2QtF?=
 =?us-ascii?Q?fQvr3gxxrrrVAW/fNJ7lMSzb4b9bYh6YMjJQ9SXXK+IULUTFlxGtFOfM/nv2?=
 =?us-ascii?Q?swVPOLaCU8Dfd7+gQwq8j0x0aZvgyc1LW4axOaQEvtqOgG8RRegVXo2Cvt6L?=
 =?us-ascii?Q?tbhxTvRqMS2Qy6rcv2qU964aN+E1qAT1eQMEnVgj7IvhumZe6EGuQgNTbAS9?=
 =?us-ascii?Q?RqohdD28XIC6ZtsHoVyc/J82mZudsx82rUoMZjFiPhD6P5NIGxCggY6HODbt?=
 =?us-ascii?Q?8koanPSxdeE55XPUqGMA1zscYsQFIKA7grk6Yw+XttvL3Gbaw+saHe4KJu1Z?=
 =?us-ascii?Q?OL455piHvn+PEHecNRNeQpLkGSYoqyESqecnog8XgbfFBRIUhaKHCY3y9EgA?=
 =?us-ascii?Q?6ekixkencdU14zd+6kyy3N2bqr44dl6nUd48nOG2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce74da0e-acd4-42af-1941-08dbf640ba0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 09:50:06.2864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9MIFtIaHOErlY76QT2c9krY0N6KIbuzFqQXOSW5eiunWKexumGOUVl2eNUGE9j1iU2qkxACFzEHeFsmIwULjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/oe-kbuild-all/202312060746.hC2HRjj7-lk=
p@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, December 5, 2023 19:58
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [peterz-queue:x86/kvm 11/11] arch/x86/kvm/emulate.o: warning: objt=
ool: fastop+0x169: missing int3 after indirect jump

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/x86/kvm/emulate.o: warning: objtool: fastop+0x169: missing int3 after=
 indirect jump"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x8=
6/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: bd8e1c4c02ac085925674bddccb989e2d7d6cc2d [11/11] x86/kvm/emulate: A=
void RET for fastops
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r112-20231204 (https://download.01.org/0day-ci/ar=
chive/20231205/202312051947.9sPdeEW4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae=
42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231205/202312051947.9sPdeEW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312051947.9sPdeEW4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/emulate.o: warning: objtool: fastop+0x169: missing int3 aft=
er indirect jump

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

