Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE6D63C5
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jan 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcJQpxBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705307694; x=1736843694;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zg3gJzTDaauOol9zjaJ3T+sTaoFJ+zTlEUPCX1CKBGY=;
  b=mcJQpxBksCGaloDa9UQA969xqUQ4XZLVKkySke1ZhKMDb2L/seMLD3wY
   rP8syGQ3dGmi/OxBXXldXIuNwFQzPV89Hz09XSJmsJIbpA6tc9bi1S1jN
   2w3T94gb/LvuidLi6y+npa9sjTtP2MPmCroWa70fAcgy+sA0irP4NxpiC
   PivnvzHvuDkF7mLE7BwHf9dWGkp9EPctxG545s7FO9PrBiXNbc69FP/iE
   cZbwYA4CCY6fB2K+/N1sXeKzsB/l2FWMpHJNNUKgzscGfDPnamm2L+uW9
   9B7qAxiNgr1A0xO53yoADF19QKawe1q4dRlnwotpA8nrbCtaas3m/Xquf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403323297"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="403323297"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="853931393"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="853931393"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2024 00:34:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:34:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:34:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 00:34:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 00:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzIE6Mu+k7qjA6mV4lsCGNFMgMDUvu3wC2KkQJBIcv4U8VtNEFMmg7+QarUmaH61QQ9gaioVIfyPcVagx2NexpxGZP8EL1kVhRYCt43nJLJF460uOlSmy95Ew2IJGQHX9Lnx115wKn4Xbj2RWGghuAD1KdCawGP5URFMJp4cWFc2RX39mZ4w0joSNHbdJplZKxb/4Wmv2lxAvgkQKeAh/FIY5FQCfnumsdN+FrWIzgcIvitZF9JxVl16jTIYq56sgCMrZ9OLYvgB/T0iTtP3JLrq2N+YVKEzPCeY6Ff9i+atAWs9K6wrbUeMXaDjL0+k3eirec4s6/PCZyrjArBSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj+EY73DZomHjJGyj/0HIz9Ez1aIzc6GED4d36mSEAg=;
 b=jSsLrFKzrWY+zLF4VJJJq5SvI8Mv+oukhVRb6l3CPd8jGrG4YVi0JTOImNHjSC5RGX2ctnSCCMXm2jLH3belBdTrZ8d6P9oMcTmfu3c1WCenuSLpXhj1E53icxh79GLhnvQsfeu0q6Gd7B7zND0EutIV/CwoZKlH42R/iXFzFInC6640ytjb7bwFCFU6ngJ4ymyXe5KwUcvAC54iiPsJv9zxPPZy9GpHkE1d3vUFFk89e3iGS4hCd9OgjgYB5sZp68LnBChLIrPeWqD3J8VOmXnUBdIrAutp5u692Z/JdkNBEnL2tQxh6OZZ6TlPQb1ZS3tN89cb1BF4nVJtOXjPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 15 Jan
 2024 08:34:49 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 08:34:49 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [intel-lts:6.1/dovetail-xenomai 15614/15708]
 include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.
Thread-Topic: [intel-lts:6.1/dovetail-xenomai 15614/15708]
 include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.
Thread-Index: AQHaRlVgNl0jPHDoWUasVEo6QdEbm7DajmAg
Date: Mon, 15 Jan 2024 08:34:49 +0000
Message-ID: <CY5PR11MB6392BE48EDA0E6B1A33D794DFB6C2@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401140318.Rxwl6xA8-lkp@intel.com>
In-Reply-To: <202401140318.Rxwl6xA8-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB7532:EE_
x-ms-office365-filtering-correlation-id: 6721e6c2-0c88-423f-ae00-08dc15a4d666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfRinIVmtRa3PjSkWIn3gzwtcIUu4ODDhrvu3bFQuGlty0qY0JQJJudGBJz4AlO3S2Gs6x7kiQgcsG1sgSnPsha66JIOijhjfsKEFKk5IQRCp4weFCiaw7lGVsjj0tNfufUh1ADSg8m6NikahqwPTQX5wp0e1USeL7iaJN/aZyIGcWS4mtFIrC+ZPDeh83ukuw5fI0mN+vZMb+48UUzUN89fnmdFiaKzedpKoDkl2nPg/wnw6icZMBeEVi9TYHY1tD/CDKLUEQYdcF7SVe3u+i5iqGe+M2UJ2IUMUy7TwxDS1fnCtu/kgpgLEFDI3BMN6/URbPO0pzFcgg+8G7y+GxFj9syRKzEA9ZNL7ktsXBOAVWg63PCixwL+YJ2hDdJj9/HsWnq1KBMiakOldR6XqZMV4T6tPfVv1bVIPJdyNxicrHA/c21EWu0UG76PKUQZ1P0lMbiDGWlswfJw65PlqWe/OciKEJKx+Y9DiMZdJjov6Qf94lQrRImbNXA92NeK76A9CTV/lWj1ZU8721IcrY6Apc308anhDOwRAlZjhWAbABAEIF17YPuEC+OkepT5WVXy3rhdvjDPTdTNbDLmf2LJwE6+ndXp+Y67vcE5L1IHSkUmfi/iRhjRDdTQeN6PkH42QbU9VBcE8PMz17RCh/xkDoz7AqoYxVWpttGMSBv9MQpt4iUa+RoCgW53Hpce
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(26005)(83380400001)(53546011)(9686003)(71200400001)(5660300002)(52536014)(110136005)(41300700001)(2906002)(478600001)(966005)(316002)(8676002)(8936002)(76116006)(122000001)(66446008)(66476007)(66556008)(66946007)(64756008)(7696005)(86362001)(33656002)(38100700002)(82960400001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vJwZruemQi0DYtmr03t2QDQJ2NmSHjzyxOqCmGWTilgA0BjNLHey/A1XfMSR?=
 =?us-ascii?Q?VVJuZPAancXInG+PMFFEeZ1qdsTw4IcL2KWtL6Rl1u0vMAP/unHjCueOKS1j?=
 =?us-ascii?Q?szMjBT60Fgjwe3aYVoyDubUaXDP9xpc9fvXaDUZY65FTATTAlX1QcdAoi+jN?=
 =?us-ascii?Q?rp20u+KcidZuBVl3A3qB2QrQlPrPTZKPFhY/X/on3xWQX2kkaeWu+EoMJ5YQ?=
 =?us-ascii?Q?Fh7L382IqUuf2UxLW0DeS6EuXU6AbxhiE+Kcd7gvHYJLHq1A2HGCMLn/YZFK?=
 =?us-ascii?Q?XT4f1jyeVA9RSyGAusNflZzSSIWdyUcE2Fty6OQiM04YhsuyHnfzqoxsUVBl?=
 =?us-ascii?Q?Jg5x3UBlbQfTHcqER+wtbkzIAHNiL7HYmLMDhtGiJQhS44+ovbow4AclWOxi?=
 =?us-ascii?Q?pHfvG13Q7MaRLH5NI4ZHvMFsPuzITDQSI9T3RrGAvX6EQBu77hxPx07Zmy23?=
 =?us-ascii?Q?HmZcyXPh4cBgT9wgr87QgLLBHuYfbxBKojf979JLdn71eR3VH49E3MNVZ/+3?=
 =?us-ascii?Q?OUcU3wv8PCqBX8L5xrNT02uTU9rJ+zNIKpJi9tTnB4MUEx3Il97SFe93a+W7?=
 =?us-ascii?Q?W+T7bbbxkDXdm9fKBDhk4CVVge95JyBax2YOxTZfozNB8NB8FZDt1sE6tpds?=
 =?us-ascii?Q?cZ5udpApN2c2Ro6OXI/EoXljiAlOsGbF0E+dUGqQ78hVdorWy5nWQ1TuJIif?=
 =?us-ascii?Q?mN9NDi9CC+dUoZpPgfInAaM+7XoUYtUxyBCkmdZOhce9G8MrY68bB/aSSidg?=
 =?us-ascii?Q?Cq1Hv68fxxbvfpUWnTCHfz9/4Lv38wQmNXzYmEjgdEHD3i61cO2x43cfVg3L?=
 =?us-ascii?Q?ZtvYV3k1Yki3jempoQvg3M+liWJT4Acrpyxg6dsu+qHJJnGC2IOyMlyg4Utd?=
 =?us-ascii?Q?RQ7Y1Re+eCw5+QS/qjFLD+m0zsBAJXyj++sL7a51gTE+qUrJMceUpZigZnEA?=
 =?us-ascii?Q?lhZaR9MbMfJcNXAxf4pIvHqdmeHZ1S2ICyS9JHRzSTu+rdIsagzosGRskP0l?=
 =?us-ascii?Q?jx7nn5qDq1WoTZAcW1u7eU59qf3fHBRMqDGJvnmKL1Q8hiTV60wtr8u5+/9j?=
 =?us-ascii?Q?KJJI45oC3b6YO/oP4xqOWcDgI2vom3Mp3UCSlpAx2q6N8wWTRuoJqwXkqpaq?=
 =?us-ascii?Q?ZKT0/QO5og+qBvfNVCSmgbONqz7ht/E6Inu7l0fI1yXg/WBsVEc1F7efM4ii?=
 =?us-ascii?Q?u4etSUlh2vnFKj4P5cVCCvrPYRZsgVOP99FJ3x5KcrJ8U4zDJh+Ut21qxH8D?=
 =?us-ascii?Q?IkzXy/7tJCxEucFfaqgguyXknYAVG+BPTDd2FgzkO5TPPfK14IyBrY8SV2k0?=
 =?us-ascii?Q?daINSDHpTxRSerO9CV7sA3zWh1kLxtc4eALbCqbjjOpipRHYE1A6YLhLvTW/?=
 =?us-ascii?Q?G250ObrBqCH6oFkoBgJ+TR+tlhaToBj/i/TNEEdzuNZuJVrOz2DZfa1jUCrb?=
 =?us-ascii?Q?dFlohCzur23pCiK8ZScLkcwpha9lQZaAeIxByHFd92bwc2SWU2bf4PbfGqNe?=
 =?us-ascii?Q?H/FBiAxjAtLYxDorFv6xWLQyiCW14dUKV0FTAlYwcgfkKN7I1HurpivYbs97?=
 =?us-ascii?Q?bR7/MprIWLb0rTT634ce1zWQa8jpt4Lbrk9uwdWq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6721e6c2-0c88-423f-ae00-08dc15a4d666
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 08:34:49.5305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xPnkw7FezcjPnTH0d0PmBcCEqwSFiev9JTR3R+dEikCui2YzqzB5mmrfJQMpGATW9ZD0+jNtpWvcm8eSKCHyOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
X-OriginatorOrg: intel.com

not_report

Duplicate includes guarded by different conditional macros.

  > 21	#include <linux/irqstage.h>

    84	#else /* !CONFIG_IRQ_PIPELINE */
    85=09
  > 86	#include <linux/irqstage.h>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, January 14, 2024 03:17
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15614/15708] include/linux/irq_pip=
eline.h: linux/irqstage.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: 0297a79c3e4df512eddd9c0ece7e8d4a005d6001 [15614/15708] genirq: irq_=
pipeline: add IRQ pipeline core
:::::: branch date: 11 days ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401140318.Rxwl6xA8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/irq_pipeline.h: linux/irqstage.h is included more than onc=
e.

vim +21 include/linux/irq_pipeline.h

    16=09
    17	#include <linux/compiler.h>
    18	#include <linux/irqdomain.h>
    19	#include <linux/percpu.h>
    20	#include <linux/interrupt.h>
  > 21	#include <linux/irqstage.h>
    22	#include <linux/thread_info.h>
    23	#include <asm/irqflags.h>
    24=09
    25	void irq_pipeline_init_early(void);
    26=09
    27	void irq_pipeline_init(void);
    28=09
    29	void arch_irq_pipeline_init(void);
    30=09
    31	int generic_pipeline_irq_desc(struct irq_desc *desc);
    32=09
    33	int irq_inject_pipeline(unsigned int irq);
    34=09
    35	void synchronize_pipeline(void);
    36=09
    37	static __always_inline void synchronize_pipeline_on_irq(void)
    38	{
    39		/*
    40		 * Optimize if we preempted the high priority oob stage: we
    41		 * don't need to synchronize the pipeline unless there is a
    42		 * pending interrupt for it.
    43		 */
    44		if (running_inband() ||
    45		    stage_irqs_pending(this_oob_staged()))
    46			synchronize_pipeline();
    47	}
    48=09
    49	bool handle_oob_irq(struct irq_desc *desc);
    50=09
    51	void arch_do_IRQ_pipelined(struct irq_desc *desc);
    52=09
    53	#ifdef CONFIG_SMP
    54	void irq_send_oob_ipi(unsigned int ipi,
    55			const struct cpumask *cpumask);
    56	#endif	/* CONFIG_SMP */
    57=09
    58	void irq_pipeline_oops(void);
    59=09
    60	bool irq_cpuidle_enter(struct cpuidle_device *dev,
    61			       struct cpuidle_state *state);
    62=09
    63	int run_oob_call(int (*fn)(void *arg), void *arg);
    64=09
    65	static inline bool inband_irq_pending(void)
    66	{
    67		check_hard_irqs_disabled();
    68=09
    69		return stage_irqs_pending(this_inband_staged());
    70	}
    71=09
    72	struct irq_stage_data *
    73	handle_irq_pipelined_prepare(struct pt_regs *regs);
    74=09
    75	int handle_irq_pipelined_finish(struct irq_stage_data *prevd,
    76					struct pt_regs *regs);
    77=09
    78	int handle_irq_pipelined(struct pt_regs *regs);
    79=09
    80	void sync_inband_irqs(void);
    81=09
    82	extern struct irq_domain *synthetic_irq_domain;
    83=09
    84	#else /* !CONFIG_IRQ_PIPELINE */
    85=09
  > 86	#include <linux/irqstage.h>
    87	#include <linux/hardirq.h>
    88=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

