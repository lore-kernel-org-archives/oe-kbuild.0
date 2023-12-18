Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A532114
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxObeByt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702865309; x=1734401309;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uX5heOhJ8hxD+f3keH6CoMxMHLcvOG+SYDkHhsWL5VU=;
  b=bxObeBytqDlgB3yvKn0J0jJXDfuc4RWDhFaklXka/KUXhoE8DLjNTCDn
   t6VJISDtHy/PMydSr8q9XEp9CUgIIbGSq1AnQVdfER1Vmvxfpf3NkirHX
   BzH/AjNjWlYO47NpAOkeqQQZJ3p89C3s9Bru0himkUwQH+BbBAC/YCq6J
   xZ8rZNGV3+Of9uSfHIJ1PXj8JmVEb1T8dY+phD1IasGGHkBoW32qyAUhI
   V2NUJzZeVRE8H+zpk6NiZvucPiQBgOrlpbWzjLEDvep7ff0WHvtP3jPCo
   Zo2NQhoSLk1Gi2HOCVMPwPxB+k3jya9EdIEGpqTFZcm3bg9q3eczZy4US
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="399280470"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="399280470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 18:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="768669760"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="768669760"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 18:08:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 18:08:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 18:08:27 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 18:08:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0GuvpBGd5KUmhAVhLD/hT2SGohXBxrhV68YaONRupYFulFCOKwjBVB6zcX5u5BHHZ2EJ0fYp7hekgAB0KLPl/qOkDkvKuSVm6IiD2v3WtqFqWl6i356X6ruFw0x18yXIwC1qqVGvGKiPuz65Fmck37l2bBZ2ZkPLhVn7FaOiTqOHPT3F3axnvNkYKmtmGTWNcI4bBKw2u7e7G70wFeAPaA40LpV/HL0MSISqh0guJD4X7CBK9WE46eko8grXb7juq+y1XBFNfxRxNVyjUlTGLgNcmQofO0GWJi/z5PffspIFBQctoM1+MRTBfnJ6WsEA2R+rU9Ul0zgreiHUi00Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txYE6+qbEGNVfIm+dmGMtIcGbxkdO0QzLbNgOBpCHRo=;
 b=EVxwearB7Bs6KaIfTDXQQtWdGAjvBUVdarZaPycpOrpGXq2bo3hp3HejlTSpupGTJkV3yra5Hu1FKgxt9+lT108mg/NT14byTrW3+V9kl/5w+BSLHXEJZzIJkr2ledLm6O2v/xkC/xqeSrOxOHG6oWuhvSAXoCFOqMLWHJU12EDCcqVgYtMZLGHDGI46pJZ0fsXA6NWlidWpLvtB93izTIf/Bfukwm+BChHnIRuvJlR9C2/CI61WvNsZVSTOrQotdNfDpCO1iQLL5iK2ilrLuC9lScbv4DuQBv55mrftBxj8BMp/3A2eWKJes45kAUiSW3J1JZ9l39PzfzdI6jZ2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 02:08:24 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 02:08:24 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as
 NULL pointer
Thread-Topic: kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as
 NULL pointer
Thread-Index: AQHaLvfyGnQW851L7UaWTLQYxMbMobCuT/cw
Date: Mon, 18 Dec 2023 02:08:24 +0000
Message-ID: <CY5PR11MB6392113F9E394B58F1A8C3F0FB90A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312150951.Boq5rGVZ-lkp@intel.com>
In-Reply-To: <202312150951.Boq5rGVZ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CO1PR11MB4899:EE_
x-ms-office365-filtering-correlation-id: 7b8fffe0-774c-4709-c42e-08dbff6e3787
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v1HENfZi1X0xjwr0bekJe1HmEs9jMssqTJk3zMWq4en6x1VA2hoLHm4Ig95Q4jVhToCbLeUVGoY9Y9tHOVkvr2yjkf+4FbIbwjTZ9Fzw6SvEMwQdhPYII/A2GipI48sgmK/0rbhHgTrhc3LmuiTagb6eFnKl3FrG9ioVfULjWU5yjlRQXDOapLzlbmdXsY5n2gbgi9kudbG1Dw4UIeRI34AGcr/3QctnBH0f/ACkU0+77OGHmbcMFEQn7e1dwoOf7Y/6n/ik8Xy6KPPSUPtBnro5mLTI4bETjoDLUgDdLpI8zc37E0BIikOxk95E1Vst6yL8gG9r5+OSBaiv1wxvvyYeWDDyS0kU/V6Y+QpMQ0FxWdNCGUbOP4PpNuJea1ykQz4QGPRZ7YLrKXjA8NIDOmrvbvcwbl7mCmmbPoUHpRUVjz3MsHJhnDgvscd/kfRLvcnu49/4io4D2ekVFKUFY3gPSiCbXXu1qIfGh5MOi7YcVZPphjviMcNtWzDCXYFNMZ+1vB+qgbnniOkipCDilAiWOsBN74JupuB/vMXrDpo6JYTqRFblWjg0VNwApOqMJDno7cFx6mN5RUaWZvyDX+qOx/cD+Emlu3QKGk1/4bskneHe6ow/VcMAzU0iHw4sofsJgXiEejlMS51jDqZznekTKgJRFXFhveiCV5o4BCW5E2DcJoiDAIkiGqsKwKS/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(83380400001)(26005)(6506007)(53546011)(7696005)(9686003)(66946007)(52536014)(41300700001)(2906002)(966005)(71200400001)(478600001)(316002)(110136005)(8936002)(8676002)(76116006)(66446008)(64756008)(66556008)(66476007)(33656002)(86362001)(82960400001)(122000001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3B3dX1JgnVWQPEz0WKbwWdJQndY0L8qSH1dzYXjiXoJasfoO3PX+Q7tKL3I7?=
 =?us-ascii?Q?CbHasLomuPf6mJFLSubFy6O60gZeZ1xZvAcsDIZaaZFnsfKEptYd404bhiqg?=
 =?us-ascii?Q?UeyG9haMGzfCXYne29Ns1k65lNmJx87xH9qMAVMPDnTt01vHO8QzrReXbhqc?=
 =?us-ascii?Q?LEPFCQMqwaXSQc0TTw8sXGSfe7MrPVr1sE4BtAw3YRZWs4c0hZWoJDyygzza?=
 =?us-ascii?Q?JZi7fD5yFIwkkBjEgQq4MX0SCADOmrNkfxg7QqVCJocfCP+Uvl7nhvczmS4G?=
 =?us-ascii?Q?KB5+MlQp9q0qaCLB0smu7IpQ7XVEhi0NW+TS30Um4SPfKQCpJKhlmzdbbUhW?=
 =?us-ascii?Q?6eJ0GHyzXGmBY87PELs08cgJqFFwS1+vsJWy5TqxQKjEgde4FjsBNtig2NSc?=
 =?us-ascii?Q?spl178++Y4d5dmYN78MkC72ezNOWKu+sw/8eyGU684JjUbLlgOymvr9KZrZ0?=
 =?us-ascii?Q?0q4Pm+eeIoQ6p7F9vmi+iRNfClH84ogoAj72N40iFaZUzVsZIhdb7cFwjbMr?=
 =?us-ascii?Q?mju0Tpxd+VxgCqcBKm44C+j6TMMGD55oz/pbI+sSAlB6ihoWW9U2ypo526jw?=
 =?us-ascii?Q?e7uCUXmM6hzXc6qhL0kFPqIod2YpflsVtuYU8z8xRqdd6lnbIfrtyTjZY+SS?=
 =?us-ascii?Q?SGjXWDKzAW0edsBnXHHVXzH9lvhM44ATga2hg9ZW8NGytEqCwLrvMgYfUoFN?=
 =?us-ascii?Q?jSSMfyxUyVizuLwl/G5nthwP/OyndVuyKLcVq44B91A/wGbjgV/ydxtESx9J?=
 =?us-ascii?Q?I12xGg72ZLlfhkcoGyHF6AMEH9Ap0hj3WjG1CGMvfhMKM8oq5IXySwKe3/Ki?=
 =?us-ascii?Q?4ZvNXNEcjn7uE8EZj3qLY1S2T+V5WC+MSDpbRpPG3Og/uoyy3rwIlBh3iODv?=
 =?us-ascii?Q?T0a+tVRNcm/sHQz7ArHLl5xsIRdPNUSLmAXtJ01qp/3sapPBEoFidCFv2GGc?=
 =?us-ascii?Q?RKww/nWgfg6TGkQmj7ixCRXpGXYJaoEePEhZpkUi+gYmUwdKQoZ/vE3qVefm?=
 =?us-ascii?Q?fRgGK/HJvbpR7I76YR82+zDpwvASDC9CEQp6qNEDM7InRg/u8Ct6HvKmRMhM?=
 =?us-ascii?Q?dIR4MszntImJ7ov9h687+xU4NhEXmIqkLfiMFOUQQhD1pCx1UOMrpIrPigbG?=
 =?us-ascii?Q?W7nKv46W0X5h6G5h3m0mEYhie6Ki0HvKNiZG8cqEq1BD2z0mk3Ne2POkxB+D?=
 =?us-ascii?Q?QVZQH4mV68XynRMeNumZKwmL79ukUMFNwG+GElNmaVr56es/PfaC8lxrfRfu?=
 =?us-ascii?Q?5T9dGLaf9BTw+od8twQH/uOL4DZ1Pgsdnv+eqJJ7uAtF80KCm1aXKVB7OJjB?=
 =?us-ascii?Q?fPZeARAAuIJv2ehXm/8n4pSD5/k3ppp1N6DDtWOTOM4009cmZdRtN57ZIXfz?=
 =?us-ascii?Q?cMP8k6CdVetO27IA8HMG9t7jKKO7jMnE5ClWvyNRd6p3XSr/emocwRH/++Ot?=
 =?us-ascii?Q?LeUag1oi3Vx+IPvgj89BDH7+l5yF7LY+cx/QhuaABfvhG2Yr18nIqmwg4kFw?=
 =?us-ascii?Q?Lg4R7zhYDsJO07kJL8IeMvCFN5dZnUiK1e9oRULEXB670UYz0gXja0ZyUX7R?=
 =?us-ascii?Q?YLBauYao5RTUr+iaziI1SOtvGblC04tQIUVCEEnu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8fffe0-774c-4709-c42e-08dbff6e3787
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 02:08:24.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTaDi9sZWhx+bdpwZ9z+DC8fWNJModWpg5eqSiQFPPoSQaWZx/LNQGzp1uyDt9vGw4+rLxsKTezP7Foc0r1bzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-OriginatorOrg: intel.com

not_report

Only Makefile change, not the cause of the sparse warning.

Makefile | 90 +++++++++++++++++++++++++++++++++++++++++++++++--------------=
-----------------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 15, 2023 09:42
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as NU=
LL pointer

::::::=20
:::::: Manual check reason: "only Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c7402612e2e61b76177f22e6e7f705adcbecc6fe
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target=
 builds even faster
date:   4 years, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 years, 1 month ago
config: s390-randconfig-r111-20231116 (https://download.01.org/0day-ci/arch=
ive/20231215/202312150951.Boq5rGVZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150951.B=
oq5rGVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312150951.Boq5rGVZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as NULL poi=
nter
>> kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as NULL poi=
nter
--
>> ipc/msg.c:612:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/msg.c:612:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:625:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:625:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:746:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:746:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:759:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:759:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:939:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:939:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:1230:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:1230:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:170:26: sparse: sparse: context imbalance in 'newque' - unexpe=
cted unlock
   ipc/msg.c:253:13: sparse: sparse: context imbalance in 'freeque' - unexp=
ected unlock
   ipc/msg.c:451:9: sparse: sparse: context imbalance in 'msgctl_down' - di=
fferent lock contexts for basic block
--
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2259:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2259:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:557:9: sparse: sparse: context imbalance in 'newary' - unexpec=
ted unlock
   ipc/sem.c:1167:17: sparse: sparse: context imbalance in 'freeary' - unex=
pected unlock
   ipc/sem.c:1629:9: sparse: sparse: context imbalance in 'semctl_down' - d=
ifferent lock contexts for basic block
   ipc/sem.c:1888:24: sparse: sparse: context imbalance in 'find_alloc_undo=
' - wrong count at exit
   ipc/sem.c: note: in included file (through include/linux/workqueue.h, in=
clude/linux/rhashtable-types.h, include/linux/ipc.h, ...):
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'do=
_semtimedop' - unexpected unlock
--
>> ipc/shm.c:1194:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/shm.c:1194:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1207:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1207:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1335:6: sparse: sparse: symbol 'compat_ksys_shmctl' was not de=
clared. Should it be static?
   ipc/shm.c:1391:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1391:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1404:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1404:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1591:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1591:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1733:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1733:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:120:17: sparse: sparse: context imbalance in 'do_shm_rmid' - u=
nexpected unlock
   ipc/shm.c:248:17: sparse: sparse: context imbalance in '__shm_open' - un=
expected unlock
   ipc/shm.c: note: in included file (through include/linux/preempt.h, incl=
ude/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:139:25: sparse: sparse: context imbalance in 'shm_d=
estroy' - unexpected unlock
   ipc/shm.c:346:17: sparse: sparse: context imbalance in 'shm_close' - une=
xpected unlock
   ipc/shm.c:352:12: sparse: sparse: context imbalance in 'shm_try_destroy_=
orphaned' - different lock contexts for basic block
   ipc/shm.c:415:9: sparse: sparse: context imbalance in 'exit_shm' - diffe=
rent lock contexts for basic block
   ipc/shm.c:683:17: sparse: sparse: context imbalance in 'newseg' - unexpe=
cted unlock
   ipc/shm.c:937:9: sparse: sparse: context imbalance in 'shmctl_down' - di=
fferent lock contexts for basic block
   ipc/shm.c:1581:17: sparse: sparse: context imbalance in 'do_shmat' - une=
xpected unlock
--
>> ipc/syscall.c:110:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/syscall.c:110:1: sparse: sparse: Using plain integer as NULL pointer

vim +1405 kernel/seccomp.c

48dc92b9fc3926 Kees Cook      2014-06-25  1404 =20
48dc92b9fc3926 Kees Cook      2014-06-25 @1405  SYSCALL_DEFINE3(seccomp, un=
signed int, op, unsigned int, flags,
a5662e4d81c4d4 Tycho Andersen 2018-12-09  1406  			 void __user *, uargs)
48dc92b9fc3926 Kees Cook      2014-06-25  1407  {
48dc92b9fc3926 Kees Cook      2014-06-25  1408  	return do_seccomp(op, flag=
s, uargs);
48dc92b9fc3926 Kees Cook      2014-06-25  1409  }
48dc92b9fc3926 Kees Cook      2014-06-25  1410 =20

:::::: The code at line 1405 was first introduced by commit
:::::: 48dc92b9fc3926844257316e75ba11eb5c742b2c seccomp: add "seccomp" sysc=
all

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

