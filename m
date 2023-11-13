Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065415A0
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 01:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxIXnCpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699838630; x=1731374630;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ktaJsq5Zgi8vY8gVMBZ5evu25UaYnQayYOVk0Re2Bzg=;
  b=IxIXnCpXnlGLssAvRMtrp6+wQKlyNhPoBtmoEUCVEovXippy/NM7bN8a
   ByMVst5u6zmbVvjvQorw/VMCVCoTi1a+mQaT/tvsqM4oJ7hpQZLWVVtqm
   9UdPPzTPgqYrImwbPOpe7R7LSl5763o8mjyNJpkHCrtrCyr4iDCHkWLkW
   W3uG/wjXTGAeLnQfYzmygg18k4hBi+iNsOTpAtrFqRoa+mpPghVOtBfRj
   BMC5un2wyn9b3OxOult3txzOCDpcqs0NQuahur6F/09FHqzQ9GTy3hnh3
   NEffhY6ktwA0uBzdzgrBfFTNzWLMqfkMUdOG0jhc/yASdPgcnYGH9XB3k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="394262466"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="394262466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 17:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767771767"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="767771767"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 17:23:48 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:23:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 17:23:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 17:23:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KelIkwgOgtyWxMTYhbEy+9p86W4LYgXWzWmOh5B7vo0QauwvNEKfCUdktknFrSFWI50qveuiEYeDgj0Te+Ua454yvEcIL4NNq6doJSXurS9K47w1ROAt1us6GXMAtdj4cQq09ST7CBLIcrmFejRybQgrFwUTpIneh9MFUz2juejMU1iKxQbW6YMp4lm5gR6yXy8PY/l4vfBHbWW1otkgRg1xFhO24tlqkmb9UxIfTRS4JvKl9/kvUuagSLNGo9priiirEYuA9Lg5MgxO9+f+1/H9KERGHIdYg23vz2+x8eG2OL3k314ZAebqJTe4Vpj16vsMrKS76oiY9yjsa2G17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIyI2P8sBNsRdirzRtoOfrJSr2JrOV8w3pgnalfQuPg=;
 b=ON91AIuJHGWz9M56n6kORBZgmaAN0Cgu9+X0rcESHD8oucGsEp267bRa2Y4h1XMr4S6nqgem4xqTe8Y78wk7n4gOBztEKfD4bV2+cW7EnXwfH7pEjXC9DRVIZ05PRvowoPkl+26eDfaDfeP/2nkVS/aP1za8hbzBcbbGp7DXbCHUTjAJCZtV6al/q4qSXb3tRkNroF+joAujyWxQ/wTGqWA3q7pqs++5YlQ3FBUOgne/vrdDBN1o9CFJywhGcv3ZD16Qj2mwCGr3XRmn0ZQ78XwmQveztxTexUiZ+6WQuyXAp67fPma37zwa83L2poF7/nB/jlCx71w3rJdAdf/KgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Mon, 13 Nov
 2023 01:23:46 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 01:23:46 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
Thread-Topic: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
Thread-Index: AQHaFAb7aQulLiReN020QJBGqfV/lrB3dyXQ
Date: Mon, 13 Nov 2023 01:23:45 +0000
Message-ID: <CY5PR11MB6392122C069E2E5113B71098FBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311110257.iSkoKoPu-lkp@intel.com>
In-Reply-To: <202311110257.iSkoKoPu-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6330:EE_
x-ms-office365-filtering-correlation-id: 0448267a-ea87-4845-8fb4-08dbe3e72e7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0q0wHyB4qFEnhyjsEIAe7xIsa7gRcdD+MMClkSpHHUePws+q0zeqUlz+TkoccYhEy1MvnZw16LMiwR8qYni68K8gtcn5/LastfGzjsqvXWETW6goO4nDVBr7loZ0tqCg/poIp12rTRlVz0XAmQKSK7bdrLLCjoIcLblbZmoq1+HplR+/uLgeKg09PZ3DN1LgjAuXbwFUAnn8RnTFpBLDUQKRdVkQa5bobUqPXrD3NmgNlwQ79MvPfXq3HTaynjq/KmldRfvKFMN1BDy3WAr97ER7vMgpRdc9HQq4HRD/pP7pNQ25hCU7UWNuG3KemTaRa7ea7iQaWkbfU5Xl3MsXGHxPOhQvOac0QAkm0fFe+W5HoorDOD72DV8IV0JZelf95TozRAoQ0jd+RMBKgztU+bpI8DcdbPJ8EB+ZD624AsQV66ZEveub8CRrjTLj83cwaP8oPuu36KLicHhdaB9Xd3u/mli12NrBci1SpqNZr0yX85vSQ/LPb+mTixvrZYbbwm0ipWmYzdCRwA7+dnngdYeQCKfWQ+MBWe9ROui7E4DOhlXYiaDl6+CouKnlxkqO45tNdr1GiKEgzMFfWDUFwcLRiwqsXbd7cPVSlSaOWB7Dlno33RGVCSz+A0+D5V1yETbdn7UipM89oA3jLllZpS21T8J4NtnXNRfmBRQKYhJxjbHlUxUdyzLuBMKSx9Zf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(186009)(1800799009)(451199024)(64100799003)(66476007)(66446008)(66556008)(38100700002)(76116006)(316002)(110136005)(66946007)(64756008)(71200400001)(86362001)(966005)(33656002)(478600001)(9686003)(53546011)(38070700009)(7696005)(6506007)(41300700001)(5660300002)(55016003)(82960400001)(122000001)(8936002)(8676002)(2906002)(52536014)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0g7pUGY0xLGkuKJ1Z7ufxcu+veDMRmdOuNiVm/sUPp2bDtJAvwL0bgnIbYcH?=
 =?us-ascii?Q?4uLsKO7pVZpC8ndddEDrdqN/2CzfZj/1ELRni2fHj1RVRs/hVcXrmj1SN76P?=
 =?us-ascii?Q?++fL8l9W2Qe+Fe4jYCReImx5nKprPJfABaivIIao8CpkQBC607y/GF1eI6HR?=
 =?us-ascii?Q?G/4tCciPk974LovJCVBkgpNSVo6zrWk7W3ueFKTBrKXPu7WZ3q4+F+YEiHm7?=
 =?us-ascii?Q?dOY/7G6hT4SHzdgpVmjA6L4W5cpdqQHcZw8SB/jxD0j0X7vDKie2nhH8zQiu?=
 =?us-ascii?Q?Z/peoCqI/K49XDaWabcvYHFLZpFohft2J+ezm0rknRXW+bHoZQqB2J2wcy2Z?=
 =?us-ascii?Q?wkQdF3b13HYcMBs2Q65hFMvYS5r8PLwE5hSX62H0HDrhNx3ETDVWZAKwN74y?=
 =?us-ascii?Q?z0H+BuNFcVoPhTATVG+L0SiI0rmOcV7k7D60WFxwJ5ChQ+G71/lTC98W5fLF?=
 =?us-ascii?Q?/zSj7FDbcFyHu+tgtiojMfx6Mws9GGeftq9Tw62kLTrmJAR3zE1B50urZPnJ?=
 =?us-ascii?Q?AoChS0QeXM5hpGEnrzudU9y4x6K7AlCj9G0TUfjtW0qsMVjTck+A32JFMxGS?=
 =?us-ascii?Q?CCgxnhOWeZqyNL2uOXY9tP4mLcTi01oDZ8Swltku+R1IpKVBuMUZtu3Uxrmf?=
 =?us-ascii?Q?UkxROY/5vsxISscZODq4sh++2P0YIll43rRyD7PQ4aJPY5Z+VacK6KDQRmT9?=
 =?us-ascii?Q?kTPU02mkDTcD+mSqECQ7BuFyV7jvbVC4t2keIPijPn8gz0UE473vD2grRh74?=
 =?us-ascii?Q?aS8N9WZ71Op2FXCvkbGWKD7YDbtxrnzeVAOcjlLZ1vjaoozSHWdB7V4Qu78q?=
 =?us-ascii?Q?lf5ci+WKXnL6fAy/mZ5VFfs6pMP653em1t8VPH44rdS1BSugYCIezBhfPjGH?=
 =?us-ascii?Q?aktuZdItdFi5MD0g7eARfTrCzC4NbcE4SRdLUb3/vH+Cd3xs7jegDAgb3E+r?=
 =?us-ascii?Q?fsH91l8XPEWs/c2Qu8CzNIe15etTw/1cX6/IUNKn4GvOCG6ySiq4D/etECeT?=
 =?us-ascii?Q?2bL4IjqyX/VOSPtf1OTbfdXTSCHCZiuRV8Q4QsBtXxrRODE9rN/3oOmjcJW1?=
 =?us-ascii?Q?F4VU7eGn3FMI6cVqqvt+uy0svyS2hiJI4qhLtf3tSMu1u2e82Uhqioo2tpko?=
 =?us-ascii?Q?bvg/2sAHprLF0p/zR2Vhqa/Doq67LPrnOhh4Jq9h6wJzjpiUg8w6qqK68K8p?=
 =?us-ascii?Q?P/N4iUfiAZICXJQ4biaqIt82o7r5JC1Ww3Fit75Gp2WOB21IjKsGNY80h9aX?=
 =?us-ascii?Q?JEZZrT3WXzrX0F2NT25O9IZPcD7WHJL//xw2gLsTwa+8qZ8kmNTDj8JIn6GM?=
 =?us-ascii?Q?ecz0/mXJCqQBzbmFh4DYIFyjDzTlUYm/QMgf4RviuI6+2IcpkM/kB5e4kqyN?=
 =?us-ascii?Q?7N/C04yHXo85j9FDO4LwOkJD2NEcmE14opQ6ICBOwQDZ+Jtvzn4o+Sty88TS?=
 =?us-ascii?Q?dhw6BjEdvdMfuj87hcpKQTaCOEbDaBh1A4lkjOEqcR8JJzQHJe4BFxGUwRv2?=
 =?us-ascii?Q?iSOyt48VQ71EyI8An7pUGoX/DQp08Hp2SKj2sqMysgZAnXwWY42cEqKLZKEc?=
 =?us-ascii?Q?15j3qaRHlRIpWfa9QHC+mgz6awcgsp7aGF2VRs9q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0448267a-ea87-4845-8fb4-08dbe3e72e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 01:23:45.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDTak3R4VlOjRRP8Umia51g88W58U50M3ZMbgnINnB9Newi4Aw0xGoJktsBhwWUONTyoesYiy9fwMO4uIvgKaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-OriginatorOrg: intel.com

not_report

Duplicate headers guarded by "#ifdef" macro

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 11, 2023 02:49
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <ZU0sliwUQJyNAH1y@andrea>
References: <ZU0sliwUQJyNAH1y@andrea>
TO: Andrea Parri <parri.andrea@gmail.com>
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: charlie@rivosinc.com
CC: rehn@rivosinc.com
CC: paulmck@kernel.org
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: aou@eecs.berkeley.edu
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: mmaas@google.com
CC: hboehm@google.com
CC: striker@us.ibm.com

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Parri/locking=
-Introduce-prepare_sync_core_cmd/20231110-035816
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/ZU0sliwUQJyNAH1y%40andrea
patch subject: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110257.i=
SkoKoPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110257.iSkoKoPu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sync_core.h: asm/sync_core.h is included more than once.

vim +6 include/linux/sync_core.h

     4=09
     5	#ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
   > 6	#include <asm/sync_core.h>
     7	#else
     8	/*
     9	 * This is a dummy sync_core_before_usermode() implementation that c=
an be used
    10	 * on all architectures which return to user-space through core seri=
alizing
    11	 * instructions.
    12	 * If your architecture returns to user-space through non-core-seria=
lizing
    13	 * instructions, you need to write your own functions.
    14	 */
    15	static inline void sync_core_before_usermode(void)
    16	{
    17	}
    18	#endif
    19=09
    20	#ifdef CONFIG_ARCH_HAS_PREPARE_SYNC_CORE_CMD
  > 21	#include <asm/sync_core.h>
    22	#else
    23	/*
    24	 * This is a dummy prepare_sync_core_cmd() implementation that can b=
e used on
    25	 * all architectures which provide unconditional core serializing in=
structions
    26	 * in switch_mm().
    27	 * If your architecture doesn't provide such core serializing instru=
ctions in
    28	 * switch_mm(), you may need to write your own functions.
    29	 */
    30	static inline void prepare_sync_core_cmd(struct mm_struct *mm)
    31	{
    32	}
    33	#endif
    34=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

