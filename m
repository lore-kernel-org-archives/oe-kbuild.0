Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7110F7
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Oct 2023 02:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXkIqRGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698372173; x=1729908173;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7SeY1Ve4X0onRbAV4RlM5l+cGPBKW2WyRX24AAeyxIA=;
  b=iXkIqRGYWOP1M2xQDa1xtuqzXbVjxscvqo06fw+dakaachidyfjgKFEN
   qA9p8XR6rAbjWbfo8Th1LGFEHtEmGtelZEMhxCpTAk/DqqtwJ4+58HsHJ
   ybk305YJ1ygEwLF/i6FsOGfT+rzIFjp8/zcTQODBQyWf1MavLxanIOVkY
   RimT7va7ra0NG3OKbFnSbGJ6Vno5EvQ94NXOF/jbtTz6+JFkYS66xatzs
   1jC1UacgEeYhbpUG4ZJO69n/0qEVqV5K/8dU8HJYMq41M/i2yGJTJAHDs
   s1fJVx/+ylAqCOs2xTljHy/v6cJQBRSrAKMPEqNYY05McmdxxqoE+TVg1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418801722"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="418801722"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 19:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788691385"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="788691385"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Oct 2023 19:02:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 19:02:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 19:02:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 19:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNl94Tp5nABLbcWUzWquvlHhhYys0Cm0pG3GMT7m0hw/rvx3qXZ4TA0kbZ47iqLm1fVzj6nSQjb8ty5n/sw3qfYSn6rhcaHD51uqS4X8z4Vc81d12/ua8rZhJVb9n5cDElKG7dyaY5QCKXXll5TzVYu/gBwMdHGUNlqjThkRoxzkFYiVuYfLcjld9GIsYBUALQzQGrV/SFEI5MpWdYl43NHJXlybTYzM+pJJruusUjhb5GHTMMd6iCwIYSANXSFajY0kTe4geXdJ0pzb4csWZyjNJb1MIVh4aONoF/UicDRYr+xq/a2bKOb7cjddxDqrzFQ//APqo4ohyDriYbgpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7bu1OrJw4xeq2lKRlglOse5/Bwsmp7VJMVSbJC7wg4=;
 b=ReYFrDRn8gOk+hNhOzKQKvZm4kwxVBINoRGF3dQmlpCEL1VthmWCUVVzzYc2Ktgn8QRacZx0yWzM592+ua2FKBzgRepoJ0I1EoREMZjtf6zyFgWrasBM/sumuLkJazFW7HT1Ue1FxcuQ5IjTVyNnznCGTYabILidSTBI4SJhtyaBeKbHc+yyaRxwyQV2WA8DMS0acZNVLiq6h1V9INOVi/zaAfaey/2oap2Lsgy6RWEN6d6DAEAG65j/joWt8OXxLIHT/AYYWnISpGoZMoTVfZJ+MUB6f4RqXOL3aarjSanXJ0QUfEWafMq1/jCwkf53IFRvwLojiR95dOILEe+hhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 02:02:44 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 02:02:44 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is
 included more than once.
Thread-Topic: arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is
 included more than once.
Thread-Index: AQHaCDdMRyBQkS0+iEq1QxGxkrEjRLBc4qwg
Date: Fri, 27 Oct 2023 02:02:44 +0000
Message-ID: <CY5PR11MB6392394E4D33A2A6C3960D01FBDCA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202310270227.J7UV7HBm-lkp@intel.com>
In-Reply-To: <202310270227.J7UV7HBm-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB7927:EE_
x-ms-office365-filtering-correlation-id: 511328bc-2cfe-43cc-e1de-08dbd690cf72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D6AkJdIT0uNo1j0uVjPAuGG8DhyR8p3RttqPqRLzzv2rQg4s9T1zkZvfhpg5xBopM+sq4/79jHN0bOtOWu07KnPn6feo2EEVxdpP0Mi5hxemfXK4lPmNbIkOhJL+jVlSxT06EHXWfWuI+8GeqSDlZBzCu/tfwWL22Z+9hFGmTxlc6rO6pAa2/j+9fBI6XMubGzpPKXE1LlW9FN99/51R00LJXJMIoqqihqCJLxZaKGAWwBqCFmg87GhKGnWxVPnoBSaKLaeyFdmAMZLf3xwxdHdTEe+9BfgCsnK73PhAKzaB8yCJ6l5RaOyrVCpNYJDEgeX7wUZdfaZ/JnosEYJjnAatQ6Q5bRQmaOlMWtdoDt140tWuE0JfYvrUeYzvjTNuPC5jztHWyNamNwfVwuNganC+6lERW5RHQSCRmouMu7TkqZXcNrGU09r4Juerfd/FyG77oGzFva5GK2M2Odk8HE9GmsXGZh/wR1Mg6cVpHTdSirzMjO+XHEzznbKIRkZQNxsq7z3M4Y8xqJHdeu9ypuAjYmNXoFn/UxcesQkGSoYyq9uCzHHAGnqboQeST1lT9YbSdTbU3QIsXfOuDB2+/IFu5FAQJm5kY42swniqCoclu+QjM6e55ZPUx3BBoq0O+FFd728xOH6CW+nJgGrwr//0XUGzfvdk7+FUpMvcV6RL+C4nxXe+qbI0FC7hshyFc0luCqacEBwPCfR5I2mDEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(38070700009)(38100700002)(41300700001)(86362001)(2906002)(55016003)(66476007)(52536014)(5660300002)(33656002)(8676002)(8936002)(6506007)(316002)(110136005)(71200400001)(478600001)(7696005)(66556008)(122000001)(64756008)(76116006)(66446008)(82960400001)(966005)(83380400001)(53546011)(66946007)(9686003)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tqclrUMwRY1245EJY7+y7eSi0dCYT/wU5qJR2Mkyc4ATIMiZg1okbcPtqpd/?=
 =?us-ascii?Q?kUINNlufYGNGUtHu9WsWzHs+gzkNF7+tEqULQ3OTeErElDku7uYaDXLT1ilQ?=
 =?us-ascii?Q?23c+lCq2E804HhJ1TrWNyXJOPLVGpsd3Wz0lJfLQ/Vci3j6X4rytCmZWkq4S?=
 =?us-ascii?Q?LdbBEYtEDfPtJcWqdWV+wSc+MLz9IxeIPjhad+9hz4LwKGgtyvndNOhv8NJf?=
 =?us-ascii?Q?xz502lw4kqP8eouGXGaK9DzIjeCkwXc4wwvnegZEzoQmTG70HQmxFTeb1GsV?=
 =?us-ascii?Q?E4w+AwYPXB22hsz9oqgJCrwBQ9OlUe04je6U86OsKsfPvT0lMqWpVn+hObAx?=
 =?us-ascii?Q?/9AB0u743Rk4qrUBRZqjCDrHi37fomid2v7MfrAVqZEBajg4pjZiEniPCWq1?=
 =?us-ascii?Q?QoHgd45aPoyj2dk1PXxXhQIWbXlS24TT8Lbieebvidjgr9CyFmH99BvySMDD?=
 =?us-ascii?Q?ZGbvjgcGxOSCIVgpccz6Bh2YySUQjHkwE3sWmuBBOZlT8mBBSVaiOHN3sPsw?=
 =?us-ascii?Q?zBpWsBe8YZKmRaFEphQWXEv1CQP2StpTG4JzU83t/l0Dqq4OIU34lVTKpGdy?=
 =?us-ascii?Q?2OVyNuSLm7Av9vDNHDyzlRk7zwo7A04pzju/ZhqC4n4oGUVPMrNPWQ+0g7/s?=
 =?us-ascii?Q?6wx9O5dd5EK+chiW300LEa3jG//wV19vgGk+FDTQPs5zDnjyJqy4vmVwuLYg?=
 =?us-ascii?Q?R3xdnroNq1F6nFshx4UzpxAlrlBnhii+S+aXrGLKQ8Y0tySkrtgxk9OGqs6r?=
 =?us-ascii?Q?vRHEsHW4AKYhpwFl+tgILoAGbJRafLel9PrcvkoAzgdWbbweFskZgdKP9kG9?=
 =?us-ascii?Q?qWdsYRdph5cr3CxPrVgJxxel09Y1Mjl2NC2NCYXMKcz/tiOL04WmtQWPalhH?=
 =?us-ascii?Q?07s8NCAjTyYWv56haG6E81yDzmBCfrq/7br7FC1zwWtquuV8qxIvYBRNs/r3?=
 =?us-ascii?Q?hkC6oi8ee4aFL8QdzEXaw4OR5Mq84vKW4KHBywn5iIWZzmzDyvqbqcc4SR2Y?=
 =?us-ascii?Q?VfAx/T4NPH0Xqg4+3CvW5VK4PvTVGm52HaiHqcxH+JPERapCkPslGowkkql/?=
 =?us-ascii?Q?+v9JnJZgP0KR0CZtKc31ddsrZANUi6jRw8lESbLfljxeWw0tpZPJ4kMPldR6?=
 =?us-ascii?Q?MxQvdIjjdFobT404P2hLn9qzPidz+ImQTpuk/7OaTcTsTIMU1EzwYyQ16giG?=
 =?us-ascii?Q?P3gIpM3lqv+Y7oMHxB5MausJLdNWlGo7A1GI0ped+jUafv7vQtxdIjlCa7qE?=
 =?us-ascii?Q?iVm8GkeHKE5CY4MllqRhhur8zthafIKwHJu/P921x2rWVlHN1XFBBpqI0loS?=
 =?us-ascii?Q?3CB94QKNCAc2ei51oQg7cTVeR9DrWhWWHYCtPVA/8eaYcTYlz8xnf6cQTpSt?=
 =?us-ascii?Q?RbxCWGyXCaaGuAtOh2Hi3PO/BrCvd8iOcM7RNtxQ8LngrKSIWERPhGzToUSX?=
 =?us-ascii?Q?Z6zwlJC8O55Uoxrcs79ufSzu8MQX9+YLH1zFOFsCLY6hqTltDBEWMdzJG26P?=
 =?us-ascii?Q?83/FJ82+xf/bb6bRG5BaudIvMAf+onQ0e+Vy+402JCtom2U3QrfXWHi1YtlO?=
 =?us-ascii?Q?jyuoWypMh64/r6q44Xc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 511328bc-2cfe-43cc-e1de-08dbd690cf72
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 02:02:44.6901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0lOgMS5DjbEuQliev+nGykX/YEySGqDZHhnyMalhTQg4qHYPfR4BJRYcMuqVzJYCu37GiyG26fKfanWbbca0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-OriginatorOrg: intel.com

not_report 'intended duplicate include"

The comment says:

   334	/* Needed already here for resolving __phys_to_pfn() in virt_to_pfn(=
) */
 > 335	#include <asm-generic/memory_model.h>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, October 27, 2023 02:06
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is inc=
luded more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   611da07b89fdd53f140d7b33013f255bf0ed8f34
commit: c94b1a012f93327a4fe16ab9455331f37e69242f arm64: memory: Make virt_t=
o_pfn() a static inline
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310270227.J=
7UV7HBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310270227.J7UV7HBm-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included =
more than once.

vim +335 arch/arm64/include/asm/memory.h

   333=09
   334	/* Needed already here for resolving __phys_to_pfn() in virt_to_pfn(=
) */
 > 335	#include <asm-generic/memory_model.h>
   336=09
   337	static inline unsigned long virt_to_pfn(const void *kaddr)
   338	{
   339		return __phys_to_pfn(virt_to_phys(kaddr));
   340	}
   341=09
   342	/*
   343	 * Drivers should NOT use these either.
   344	 */
   345	#define __pa(x)			__virt_to_phys((unsigned long)(x))
   346	#define __pa_symbol(x)		__phys_addr_symbol(RELOC_HIDE((unsigned long=
)(x), 0))
   347	#define __pa_nodebug(x)		__virt_to_phys_nodebug((unsigned long)(x))
   348	#define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
   349	#define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
   350	#define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
   351=09
   352	/*
   353	 *  virt_to_page(x)	convert a _valid_ virtual address to struct page=
 *
   354	 *  virt_addr_valid(x)	indicates whether a virtual address is valid
   355	 */
   356	#define ARCH_PFN_OFFSET		((unsigned long)PHYS_PFN_OFFSET)
   357=09
   358	#if defined(CONFIG_DEBUG_VIRTUAL)
   359	#define page_to_virt(x)	({						\
   360		__typeof__(x) __page =3D x;					\
   361		void *__addr =3D __va(page_to_phys(__page));			\
   362		(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
   363	})
   364	#define virt_to_page(x)		pfn_to_page(virt_to_pfn(x))
   365	#else
   366	#define page_to_virt(x)	({						\
   367		__typeof__(x) __page =3D x;					\
   368		u64 __idx =3D ((u64)__page - VMEMMAP_START) / sizeof(struct page);\
   369		u64 __addr =3D PAGE_OFFSET + (__idx * PAGE_SIZE);			\
   370		(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
   371	})
   372=09
   373	#define virt_to_page(x)	({						\
   374		u64 __idx =3D (__tag_reset((u64)x) - PAGE_OFFSET) / PAGE_SIZE;	\
   375		u64 __addr =3D VMEMMAP_START + (__idx * sizeof(struct page));	\
   376		(struct page *)__addr;						\
   377	})
   378	#endif /* CONFIG_DEBUG_VIRTUAL */
   379=09
   380	#define virt_addr_valid(addr)	({					\
   381		__typeof__(addr) __addr =3D __tag_reset(addr);			\
   382		__is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));	=
\
   383	})
   384=09
   385	void dump_mem_limit(void);
   386	#endif /* !ASSEMBLY */
   387=09
   388	/*
   389	 * Given that the GIC architecture permits ITS implementations that =
can only be
   390	 * configured with a LPI table address once, GICv3 systems with many=
 CPUs may
   391	 * end up reserving a lot of different regions after a kexec for the=
ir LPI
   392	 * tables (one per CPU), as we are forced to reuse the same memory a=
fter kexec
   393	 * (and thus reserve it persistently with EFI beforehand)
   394	 */
   395	#if defined(CONFIG_EFI) && defined(CONFIG_ARM_GIC_V3_ITS)
   396	# define INIT_MEMBLOCK_RESERVED_REGIONS	(INIT_MEMBLOCK_REGIONS + NR_=
CPUS + 1)
   397	#endif
   398=09
   399	/*
   400	 * memory regions which marked with flag MEMBLOCK_NOMAP(for example,=
 the memory
   401	 * of the EFI_UNUSABLE_MEMORY type) may divide a continuous memory b=
lock into
   402	 * multiple parts. As a result, the number of memory regions is larg=
e.
   403	 */
   404	#ifdef CONFIG_EFI
   405	#define INIT_MEMBLOCK_MEMORY_REGIONS	(INIT_MEMBLOCK_REGIONS * 8)
   406	#endif
   407=09
 > 408	#include <asm-generic/memory_model.h>
   409=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

