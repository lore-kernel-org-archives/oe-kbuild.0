Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29407323C
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jan 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOhiUy1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705307769; x=1736843769;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=sRTCoqp+a8p0rmkD3N7v0wjYs7jkyNSRFjXJEsP4znc=;
  b=EOhiUy1EUABYnYCjwMSW05Bbf3hRD3laXVb3no/0lmx15P/Hm3bhV3lW
   mZN2FmOesvfCnIAte29kdh0y2IbwjwcqGz8pbdKhECqtGnCjQss6lfuJx
   VpZsm3caRzDqHnzB5XdWTHqCfsRyj4d9Exp8tDhgkjt3lBfruWwoaGgcG
   jNMyrWYAy5txEG2YUcqi2GmWlE/zFH0nXnHtpm94XFpqiUB8Do6HT1iZ3
   OCxfolYbBMaGFCPAbrzWJRi0vObJkLBd6P3Pf1ltbhihNhU82oKPqLpUb
   FkY7k8Uf/+0XHdo6LD7TACOEg1jTON2uOpmck1MefNOYyz374HeJV7WVG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="21041639"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="21041639"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="783745098"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="783745098"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2024 00:36:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:36:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:36:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 00:36:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 00:36:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YahXoc1RIVWdXiicFmjC83GPsMgWqQJUAx6yq22nmLbxgkfzT2+TQmNZ+q7MGhe5o99OeYIayH3PNQEaL4QqNVdX/KTocB5xXnV4uf9OiozKylUwBsqaEuartvmSQebnMCDRGx4Nt+9e/B62NKbOdmxvgcMyzGwORNvwC0qXDKcdn/eDHa1E/ne1eVxhiFHRBvb4aU53QSGR7h0ThqwmDOU0zLQnHONjghUMbKs5AU8OJd1B1JfCyPZKY5vK8UvJjCSdKps02Lmh8Rq2U3OO45OpD+AIms2Sfi/V4pY6Icox/5wXN+oLMezUlc+SnFpxENqwdTorBiNBm8PgHEgJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clj5fvExgCtSRhi0MtxqmvdfK9POILgWmdPde5k12fk=;
 b=RiQi2pyWbtWimuSQL4BM83r8PVujeWNfcKQrvBkQ3D7R22O5/o9OR0r9AH8ISXYX63M9+qC3x5KGr78hTq2I86P7iB/KrA6PDep/W16HX3qO9xgfYcxTCyrHNSCj4/sYK8GKmBULbAaSZYA6JCpLvyBqdsYTczT/jRDne+ixkU9I1TbZcb+1QbpVXfIdPnUExqjzzghS72jrcRBq52IE/sRr0u3akT07rqj9J8vGzo5cKoTcSniz7IHxoST3lA/7e1rORNFQs3PckBxbjapKafRQTl8Xeik/uC+/UB2/BsyfdF6QByqJ/sfkdxhw3muTqVw2sPjKORt3PtUyY4wb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 15 Jan
 2024 08:36:05 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 08:36:05 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [intel-lts:6.1/dovetail-xenomai 15646/15708]
 include/linux/dovetail.h: asm/dovetail.h is included more than once.
Thread-Topic: [intel-lts:6.1/dovetail-xenomai 15646/15708]
 include/linux/dovetail.h: asm/dovetail.h is included more than once.
Thread-Index: AQHaRrR9wYdB9q7RRkuKIYF1YgP/prDajhYw
Date: Mon, 15 Jan 2024 08:36:04 +0000
Message-ID: <CY5PR11MB6392D0B5BFF4194377CB6D8FFB6C2@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401141428.fRvhSijk-lkp@intel.com>
In-Reply-To: <202401141428.fRvhSijk-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB7532:EE_
x-ms-office365-filtering-correlation-id: d9743e17-b131-42cc-71f0-08dc15a50362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j04yxb1XSGhUGRNwsicc3GW1+qk/+m4TmVL4WXpysTBPEtpsqJc9wrjjPUobDp30xnZkxdrAVgwL8JHXJ+wQVLSXoyJYGAYLquaCU4uPYCXiryOeaLP6lpBt4hrQrbYatfO57achjD07gS4N8rn6m8WPU4coQAdID1qb6cAdh3HEvGBKfyM40cohgEe4qHKRqPrS3PjwdwhVYdJ5/BzMpJbAEAOjPR5M/cdVgnMBG59UvXwP1eynCyvNSCeO67XTcHYnv9kCxQ6qibJ36FIiPCQe5A3eqCH9uMIdoT/SYyf68WGNsbQZHWeeyKfuS0G6ntC3h6N3uLsXLrL7Q2Z5e/kTWEN8GhTUcmrcyMd1FwvYs0TDDbIK9osB3B5QYdBSIcBwkBbWom3xWWy1FKK3DCXUqH7i4rxay4FYfaqdcsYlnIF01FQo5QdRrUT37JWlx01RMaHgxD17Xf4s9SvvsbgBKkrbt2RbpAiqS61gr0fXt1sItXZd7ULu8FcgD4/NKpaWS26K0lVGLLKsCpmIGgW32c/sWA2IJeRyM+cC1p3Cd4FgiGHhhs51HL6qFsHuyhjADL8PXQ6a9RIAZe9dn0l8xa/5a1vgX9C70tfYD844/ZAUCgAAdmfAumIS0cdnXspSbNOShFyL7SSMOLO5TV7lOTB2BPu/ECvrCVMAA8NrrNXHgf/yy0oap1nCpCxh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(26005)(83380400001)(53546011)(9686003)(71200400001)(5660300002)(52536014)(110136005)(41300700001)(2906002)(478600001)(966005)(316002)(8676002)(8936002)(76116006)(122000001)(66446008)(66476007)(66556008)(66946007)(64756008)(7696005)(86362001)(33656002)(38100700002)(82960400001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tF+4Brif1/rm38N//iNT+ExYs8ZmoqYO7b+gzxCHS7NLbvtUYkBy9+/giAvI?=
 =?us-ascii?Q?sNastMQZn+Jb7269rXI/ZdPg22vkCTkrsYIa2Gm6JMq1D2UvRyjX8j1lhNaE?=
 =?us-ascii?Q?psPRxHptH+3yR/ceC4thFPoIi1cuDHN/t5VFHIKMkXlgLU72zK3mj7DKF0i6?=
 =?us-ascii?Q?u4dI70uTlyqMGnlE+gI/iDA2kdlDkijvH0NTLLvoL3DkogddSGtPzLz59znh?=
 =?us-ascii?Q?JSNJ24aENw8atbQA5oeArSrWoe8g3nC5IQupTB061ZXckMNR/rk7GI0NZ+db?=
 =?us-ascii?Q?BZ509TnkvSRrDyP+qGM8c6exchIUPmQWaL6m5jTon/2ZTiiXNbfSrbROgjdI?=
 =?us-ascii?Q?adRhvtRjttojcwkDWTbopzoXSMbGTpO3j8z7l+bKHhY8rUCbSAJO5uejIsF7?=
 =?us-ascii?Q?EONmi08PzjF15KLQZ7GvXQwmttPSSlpW2pxvqevvXgCBL3DlDIlnJ+ejCm6f?=
 =?us-ascii?Q?h59FZbccxcolCeieQjPbdt9iCYz5IUgFWuJgvnmU8Lv2D7Pp1j8sSVvChQsz?=
 =?us-ascii?Q?aTHjPMuYRINzW9BHkMEip8otnJLGPxUkIDWDeUpJlXG1puAFHinMAUbhB1QM?=
 =?us-ascii?Q?amVoS2F/qY5AGSyiJu4/LZaQB0vhKuG5hvagLIgymChb0qtEHRpnvlIf048e?=
 =?us-ascii?Q?+Kx7Kjc7XVNTCy2uQZKY4yX/LK7wJO0qMD6U/EFMlIMmvcM4ygXRuIp/bs0p?=
 =?us-ascii?Q?7MrBFB3DFC96zwIPWY2rFi5qiuEGYDWCRRktXn6JCdDLHTCB/6Zp5GgOZDdx?=
 =?us-ascii?Q?8z+iJf5l2W0SgBHWwWtf6WvkzMHuiNl4xxMaWT1sEBkJ3VbJoi2jis0mIczQ?=
 =?us-ascii?Q?zHk7W34GMjfI1b0h/YJT7hegHg7wJidRuV4ozsePFSLmTegiBih/hyKSRNPQ?=
 =?us-ascii?Q?DMtnEe3/vDE1jufz9lLH/JirNxihngbyCdAUDoeoqxB6KPX6icT0KYKBO8Ql?=
 =?us-ascii?Q?jkhSzG2zg1Qw0R3EQof/rIwGoFkvL7rUQQv1cvtLM2RG3DwJ8u4aRZdmoH/I?=
 =?us-ascii?Q?VhHM04mJ/GKS+XVQ84TKvukgUsFHZo4v8z1giwug2pnZGDSYZD7DeIyV0usW?=
 =?us-ascii?Q?9yvZvyrpOzighaKss3iBgUmnGAfoX9lLppbzPADpLEenwUByn5WcjTu8HHe7?=
 =?us-ascii?Q?/pYo2u/ijsm+AgnizgvW71Lkl11uTgEKhpgPWjNFbgi15JsT75H++4Gh5bkm?=
 =?us-ascii?Q?xys5x5W2FAt6FuInquvWI8BgFgeqFJMdhswTQATll64YmgR0xbihf+FxLDoe?=
 =?us-ascii?Q?SryOsri1OYSNDutdki4/RE21SE33eCNdFf5xOL52iR7PMLGY1YqxJihqmMqg?=
 =?us-ascii?Q?tkt+A/cfrbTpUstYF5IUV//+e1OoJ4Ti6/JWPPug7YQhijf06DETjC+j+iJG?=
 =?us-ascii?Q?f84l7a5eU+lSlM6U0uebTUOVivDNZct+eMTwJaRCrrUCI4vwD5kvItheF9Hb?=
 =?us-ascii?Q?DA/1FykegdIyWGFP04qOSDvCyiSFvAGeZqkISsaqgYH7+FGlSg6tjHHe8GhR?=
 =?us-ascii?Q?bbx6ORZNLFHZLGoSIRVRQVts+BpqNs217mel/yhcVjkwqOF2SRX0sRfidxiQ?=
 =?us-ascii?Q?O1A+4TmXmMrSjCxzGGLo2KmiN9IbPo+z4l5PxxmW?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9743e17-b131-42cc-71f0-08dc15a50362
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 08:36:04.9881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3RALCDaKdDpuZDTbcK34CC00ltov4sgfv6DDzh4TQPbDVKkPWYHeop/KYLtxskRk4cDzAFnR5D0xZ8LAiOEW6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
X-OriginatorOrg: intel.com

not_report

Duplicate includes guarded by different conditional macros:

  > 16	#include <asm/dovetail.h>

   231	#else	/* !CONFIG_DOVETAIL */
   232=09
   233	#ifdef CONFIG_HAVE_DOVETAIL
   234	/* We may have arch-specific placeholders. */
 > 235	#include <asm/dovetail.h>
   236	#endif

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, January 14, 2024 14:38
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15646/15708] include/linux/dovetai=
l.h: asm/dovetail.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: 93b8046b5a041b9aac3797ad35e2e1ccebd11695 [15646/15708] dovetail: ad=
d core support
:::::: branch date: 11 days ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401141428.fRvhSijk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/dovetail.h: asm/dovetail.h is included more than once.

vim +16 include/linux/dovetail.h

    10=09
    11	#include <linux/sched.h>
    12	#include <linux/mm.h>
    13	#include <linux/thread_info.h>
    14	#include <linux/irqstage.h>
    15	#include <uapi/asm-generic/dovetail.h>
  > 16	#include <asm/dovetail.h>
    17=09
    18	struct pt_regs;
    19	struct task_struct;
    20	struct file;
    21	struct files_struct;
    22=09
    23	enum inband_event_type {
    24		INBAND_TASK_SIGNAL,
    25		INBAND_TASK_MIGRATION,
    26		INBAND_TASK_EXIT,
    27		INBAND_TASK_RETUSER,
    28		INBAND_TASK_PTSTEP,
    29		INBAND_TASK_PTSTOP,
    30		INBAND_TASK_PTCONT,
    31		INBAND_PROCESS_CLEANUP,
    32	};
    33=09
    34	struct dovetail_migration_data {
    35		struct task_struct *task;
    36		int dest_cpu;
    37	};
    38=09
    39	struct dovetail_altsched_context {
    40		struct task_struct *task;
    41		struct mm_struct *active_mm;
    42		bool borrowed_mm;
    43	};
    44=09
    45	#define protect_inband_mm(__flags)			\
    46		do {						\
    47			(__flags) =3D hard_cond_local_irq_save();	\
    48			barrier();				\
    49		} while (0)					\
    50=09
    51	#define unprotect_inband_mm(__flags)			\
    52		do {						\
    53			barrier();				\
    54			hard_cond_local_irq_restore(__flags);	\
    55		} while (0)					\
    56=09
    57	void inband_task_init(struct task_struct *p);
    58=09
    59	int pipeline_syscall(unsigned int nr, struct pt_regs *regs);
    60=09
    61	void __oob_trap_notify(unsigned int exception,
    62			       struct pt_regs *regs);
    63=09
    64	static __always_inline void oob_trap_notify(unsigned int exception,
    65						struct pt_regs *regs)
    66	{
    67		if (running_oob() && !test_thread_local_flags(_TLF_OOBTRAP))
    68			__oob_trap_notify(exception, regs);
    69	}
    70=09
    71	void __oob_trap_unwind(unsigned int exception,
    72			struct pt_regs *regs);
    73=09
    74	static __always_inline void oob_trap_unwind(unsigned int exception,
    75						struct pt_regs *regs)
    76	{
    77		if (test_thread_local_flags(_TLF_OOBTRAP))
    78			__oob_trap_unwind(exception, regs);
    79	}
    80=09
    81	void inband_event_notify(enum inband_event_type,
    82				 void *data);
    83=09
    84	void inband_clock_was_set(void);
    85=09
    86	static inline void inband_signal_notify(struct task_struct *p)
    87	{
    88		if (test_ti_local_flags(task_thread_info(p), _TLF_DOVETAIL))
    89			inband_event_notify(INBAND_TASK_SIGNAL, p);
    90	}
    91=09
    92	static inline void inband_migration_notify(struct task_struct *p, in=
t cpu)
    93	{
    94		if (test_ti_local_flags(task_thread_info(p), _TLF_DOVETAIL)) {
    95			struct dovetail_migration_data d =3D {
    96				.task =3D p,
    97				.dest_cpu =3D cpu,
    98			};
    99			inband_event_notify(INBAND_TASK_MIGRATION, &d);
   100		}
   101	}
   102=09
   103	static inline void inband_exit_notify(void)
   104	{
   105		inband_event_notify(INBAND_TASK_EXIT, NULL);
   106	}
   107=09
   108	static inline void inband_cleanup_notify(struct mm_struct *mm)
   109	{
   110		/*
   111		 * Notify regardless of _TLF_DOVETAIL: current may have
   112		 * resources to clean up although it might not be interested
   113		 * in other kernel events.
   114		 */
   115		inband_event_notify(INBAND_PROCESS_CLEANUP, mm);
   116	}
   117=09
   118	static inline void inband_ptstop_notify(void)
   119	{
   120		if (test_thread_local_flags(_TLF_DOVETAIL))
   121			inband_event_notify(INBAND_TASK_PTSTOP, current);
   122	}
   123=09
   124	static inline void inband_ptcont_notify(void)
   125	{
   126		if (test_thread_local_flags(_TLF_DOVETAIL))
   127			inband_event_notify(INBAND_TASK_PTCONT, current);
   128	}
   129=09
   130	static inline void inband_ptstep_notify(struct task_struct *tracee)
   131	{
   132		if (test_ti_local_flags(task_thread_info(tracee), _TLF_DOVETAIL))
   133			inband_event_notify(INBAND_TASK_PTSTEP, tracee);
   134	}
   135=09
   136	static inline
   137	void prepare_inband_switch(struct task_struct *next)
   138	{
   139		struct task_struct *prev =3D current;
   140=09
   141		if (test_ti_local_flags(task_thread_info(next), _TLF_DOVETAIL))
   142			__this_cpu_write(irq_pipeline.rqlock_owner, prev);
   143	}
   144=09
   145	void inband_retuser_notify(void);
   146=09
   147	bool inband_switch_tail(void);
   148=09
   149	void oob_trampoline(void);
   150=09
   151	void arch_inband_task_init(struct task_struct *p);
   152=09
   153	int dovetail_start(void);
   154=09
   155	void dovetail_stop(void);
   156=09
   157	void dovetail_init_altsched(struct dovetail_altsched_context *p);
   158=09
   159	void dovetail_start_altsched(void);
   160=09
   161	void dovetail_stop_altsched(void);
   162=09
   163	__must_check int dovetail_leave_inband(void);
   164=09
   165	static inline void dovetail_leave_oob(void)
   166	{
   167		clear_thread_local_flags(_TLF_OOB|_TLF_OFFSTAGE);
   168		clear_thread_flag(TIF_MAYDAY);
   169	}
   170=09
   171	void dovetail_resume_inband(void);
   172=09
   173	bool dovetail_context_switch(struct dovetail_altsched_context *out,
   174				struct dovetail_altsched_context *in,
   175				bool leave_inband);
   176=09
   177	static inline
   178	struct oob_thread_state *dovetail_current_state(void)
   179	{
   180		return &current_thread_info()->oob_state;
   181	}
   182=09
   183	static inline
   184	struct oob_thread_state *dovetail_task_state(struct task_struct *p)
   185	{
   186		return &task_thread_info(p)->oob_state;
   187	}
   188=09
   189	static inline
   190	struct oob_mm_state *dovetail_mm_state(void)
   191	{
   192		if (current->flags & PF_KTHREAD)
   193			return NULL;
   194=09
   195		return &current->mm->oob_state;
   196	}
   197=09
   198	void dovetail_call_mayday(struct pt_regs *regs);
   199=09
   200	static inline void dovetail_send_mayday(struct task_struct *castaway=
)
   201	{
   202		struct thread_info *ti =3D task_thread_info(castaway);
   203=09
   204		if (test_ti_local_flags(ti, _TLF_DOVETAIL))
   205			set_ti_thread_flag(ti, TIF_MAYDAY);
   206	}
   207=09
   208	static inline void dovetail_request_ucall(struct task_struct *task)
   209	{
   210		struct thread_info *ti =3D task_thread_info(task);
   211=09
   212		if (test_ti_local_flags(ti, _TLF_DOVETAIL))
   213			set_ti_thread_flag(ti, TIF_RETUSER);
   214	}
   215=09
   216	static inline void dovetail_clear_ucall(void)
   217	{
   218		if (test_thread_flag(TIF_RETUSER))
   219			clear_thread_flag(TIF_RETUSER);
   220	}
   221=09
   222	void install_inband_fd(unsigned int fd, struct file *file,
   223			       struct files_struct *files);
   224=09
   225	void uninstall_inband_fd(unsigned int fd, struct file *file,
   226				 struct files_struct *files);
   227=09
   228	void replace_inband_fd(unsigned int fd, struct file *file,
   229			       struct files_struct *files);
   230=09
   231	#else	/* !CONFIG_DOVETAIL */
   232=09
   233	#ifdef CONFIG_HAVE_DOVETAIL
   234	/* We may have arch-specific placeholders. */
 > 235	#include <asm/dovetail.h>
   236	#endif
   237=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

