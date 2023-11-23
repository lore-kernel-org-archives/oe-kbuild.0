Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F419BB8
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH222rQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700728657; x=1732264657;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TWrJRNZZs3HpU1dWHlq77rTT2YqzR/OG6YXMAx/WSu4=;
  b=oH222rQVvDEaEnZ2oF+NbvVC4nfQZROnMUqYrS1uXkiguFaxsa9LW4RL
   hwk3oSG/2KoOCBhrr9l7j3TjFEhlZolONJ8kuLME41IV7CyAEQBgSMa8B
   ZOITpuPDTNhCsNvbt0LsI/u90Jf4IfqwQRlvKYqCiHSKlBepnf3wcvY55
   /d0euvUjBd2brCxyFPoeeVuoRs1CilhDgpRgn4lCso7AnjrbuHZdNHGRK
   iLA1qBgmVdH4UjyeB/jWdKeMkZRe9r/ysi/ZyM3RQ2tLQ5w+zd+ISCYt0
   /n5NiRC6ZO42oKlBWORPLP2lIbPirReoqP80goSUbakoMfYTTB6KftNBW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458719953"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="458719953"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 00:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="770932331"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="770932331"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 00:37:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:37:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:37:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 00:37:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 00:37:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFPS7+gGn6Fhh9szWE8lUviWrzBkHXJqqeMFfq/fFqcetx3+YBIRuABqNPg1LJIcidkMGTlyHXuv+OpxhdueF/loe56KXFeyjDu+VRH9MQr2I0Fr3xpQzMWkLmhW82uTZ2StWiFM7NqOKJv5KI/261zXOjOe5Zza/2y/PPW8AujmSsIbl5es7zhTjdpxNs5lZ/FuTie11VfBJT+G8dfT4FRTYgI6gTOpU/H/JgPx6x1d81paDnJuWKnTb5iDSfr1TSaS7CaubZe3tgLMcjDLi0y4O2l3JfYiRq5jQtZYoqJwfLLNK/Ss85Zp9fkKxvCVrbaDt5MiIjN+sKsPfCKEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/J+WCrNPSkVuRbVaFg2EDQTB2dWBULaiKYlvIdThvZo=;
 b=d2DIZou/sJojlIuBG1kzhTu1L17o2BKDv+rGMEci+r+tTXi8hS7sKYqJAVkOlyjegKAS0f2u3RjWVxJO/gkjQsKnz0IFA3TLAjxYhVXId6XFTfD393gORovWDWa7yXz+z2ixivkP6N9c4hwiZl4qVRIbKQM3XZGO81/zjc2wZi7BJ6fV/20qRA1qdPwbH5qup4MjvWdJcIZvkK0Pvqc7vpR+Vcj6Tj3PmeCiSShvijR5qSk6a0MIXDOa6eLOc0jxW0QMtJHo1IbwpPs/I7mJDwuYnNqVkHNg5FTE3/H87cuMCup4LpVcEdWcqo+SiL4k/nOzfJww1BsU4kBQNOASyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 08:37:28 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 08:37:28 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [arm-integrator:b4/virt-to-phys-hexagon 2/2]
 arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.
Thread-Topic: [arm-integrator:b4/virt-to-phys-hexagon 2/2]
 arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.
Thread-Index: AQHaHRth6od6opNuXUqWwE5QLqnrTrCHlh/w
Date: Thu, 23 Nov 2023 08:37:28 +0000
Message-ID: <CY5PR11MB639211F05323ABDC8A8B3B3BFBB9A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311221547.fkVop8nt-lkp@intel.com>
In-Reply-To: <202311221547.fkVop8nt-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB7831:EE_
x-ms-office365-filtering-correlation-id: 312ea9ed-d9eb-4eb9-242c-08dbebff6d1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w+WlIBN2aFG9x99yYsFSEkDGN3PvhyKurszWHeL8zod5WxzndPkPGfKqZxmJeknV4sIvynII9CLMchlpMCkV89F8HIXAqTZqdka09FXbTZnp9rbkhx3Z8lG1RvEXr2n+N3A+mpk7yIVtWZbtrnfewhcusCBzqeihrexu7XXADveAvKhMLswYUK5ZcpuMJFkLq8orqmHQuZzWvOmfpzzIYCf5e9h8Q2WYgfelAWSe9WwrGIcL0MnofFR4gHHV80fcZXG8EhSuxmoTyHhPND+2QlNTpsAd6X8ZUC+2oENG+H6TJLlpvU2QfyaD2QMcKl/XPLo+8VQNFj1vTeJHUhJdpXQHT/Lkgd8jZmVzJjCbR17ygszn1Q74e3HV58YvKBL2uZ74PAt4tbEwdqknn8GxXWVkbGSfs0BSWaF0/s+M0Kd5Igd0sH1FI4PyJMKMtpaGI1DLackKKoHW3liHnlYw68UypS+g87Abn0YCp7NobMFQJtOQLpnAqI6RPJtAL1xm7NzFdzB7F6mCPw2A7/+GhQ/hQ7rr17BVhzgk4Lz0OOtdVKfN4CUj79lcBKvQAGVH0lqzqF6fOJRgmzHBTfFuRwnJpQPwTMiF9Hmcbtv/0t4bxQ0ONegUC2nOUNXOCUvXbe4FXqZI8cfGEonITFBg3a9LMMmJ6ldFeL6dw610CDvspkMNI3k3Jhhs8RVrOBO+MuxR04vCUm3ZWewU9vKzRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(186009)(451199024)(5660300002)(55016003)(8676002)(41300700001)(52536014)(8936002)(2906002)(66446008)(64756008)(316002)(66946007)(110136005)(66476007)(76116006)(66556008)(26005)(38070700009)(71200400001)(9686003)(966005)(7696005)(53546011)(478600001)(6506007)(83380400001)(38100700002)(122000001)(82960400001)(33656002)(86362001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GM1dfIKQoxJhj0hKdPH+Atj+0Y70gFwCnrVlTSA5mc8yf7kmgdVWdmbbtvyn?=
 =?us-ascii?Q?X+Olcygxx8/3U2YpgJx+zFrhxqRxVYTW5mTUmooosHyVvJVw2PW5dwSb0Cvd?=
 =?us-ascii?Q?EQ5BJFu5YJujRAwECZCqZpzG+omIxDZjANMs+8Eob9r5y+tyOIpg7KqMKilR?=
 =?us-ascii?Q?HaEjS6V+EAAGuzkl0oKRR0PsCm3I1Iu4DztvUg4gsSHCx1v/Ptj5XjoLG0d3?=
 =?us-ascii?Q?9Fb09oEkCvayjj29/jXV9Zgvi6Bx9fgE3rjiAV0wHnXELDxHX6kHXf2Ur9Xf?=
 =?us-ascii?Q?qsArCT1FKFwFQcsjFhYBFH3g4uniwDkwGcOOGFsQFopXkykeCTsVXkFlYgm8?=
 =?us-ascii?Q?SDZwuZU97zBNCTJbXIcR23X/6ZhEnDm5I8uYr0BeNIKSdWgDNh5wc4M1XjZ3?=
 =?us-ascii?Q?B1giu4Ll7Ojexrs0Nkv/PKaYDXDK40H7Mhz0Vp7v+CjJYJKtDd8+wJBL/xYe?=
 =?us-ascii?Q?2Y4WCITuL73EN1RtXwuxXiNPJkaWcWb6XXR4r8s0r0Bctw62aKy5Lgdog30H?=
 =?us-ascii?Q?R7fOz3Fgv/KeXJfA2fjsHcy3sa2xeJrG8Dfnh+JfNZBjr+ibuyskLDVUrN5b?=
 =?us-ascii?Q?sOUXenoLz1IdAsgsFTqQmqZPuBGzdxBRPBEaYLEF96LdAUi2uT7LCZJiv620?=
 =?us-ascii?Q?ERYwFMMP0jM33sA/uk9AWEpGrm7YjT/3d7amXIX0yj23GyUuVl/3/diTuehQ?=
 =?us-ascii?Q?QBIH9tZ3GZ3p0JXEoo4jqaJWad+Dsk95NFRwh2/zMGdc4Fpita3PwbQTI7Ry?=
 =?us-ascii?Q?UhvJtvo/aZBfDISZ6Q6qef4KToAnQ8bP24NR4aV21eWdVjcVS2ie5U9N5YTJ?=
 =?us-ascii?Q?dpwL0H5jHU83dZe/aA5dBKYcyoIWDw0C/mCUfzoLpW36S8FdNGOEf9CuGkF1?=
 =?us-ascii?Q?dgOYyRKqnevyaD7R69B+8H3PragETMRnCk19b0NOiifyJwBJG/Zpy1ABcGwx?=
 =?us-ascii?Q?zn5n43K0PEg/4nhZOPru0l8KOvCqRCbcjI60MrAO9YHqi1psNT6y7gAcZ4bZ?=
 =?us-ascii?Q?ZYTZqtYGfEm4aHl/WElITSmO+gsVC6vWuvH0IyeD8Ya1k3qa/bWMO4QpdNxG?=
 =?us-ascii?Q?oL0Sap+MBSrQ4ObTqYfIVBcCeBJ+g2kZGi5+ns0Y2kmBMhME3uMlr+ezqWyF?=
 =?us-ascii?Q?jDmQ+WnoybiD46z+iCgj8ccxpKyswD4nqex5QLJ68OvYhtqWCGQGxOcSJwcc?=
 =?us-ascii?Q?kGwOTtlRYJkkVEZVe70AmJyLk+IDuQZsN9jHs2ZLUqBtjrxyIc1Q9jHJAg5E?=
 =?us-ascii?Q?ccdx5hYpNTkD/FRa5IKUZ1IbqtUP4Hc5xf75y4YndD94HFSKqJQcAo8biU+g?=
 =?us-ascii?Q?CU36K4n9+NkyJGVRiHa3xdW34gfO8u0jSYqwVfxgLh+B38K+J4nE764+tjdt?=
 =?us-ascii?Q?WnTe1GCE4dv8tNi53ICJtbRzUMN7MC3TVZNNSg6E9D0h2xGOTXx3J2y7vphw?=
 =?us-ascii?Q?yviaexDA30qgwsCSlTeeleA+W/ObGfnjQ4nvKyZAvnDAO40XOG50nPg5qtre?=
 =?us-ascii?Q?OgBmzShxujyWJyq+CNeDGu1kNAIaytTrn+NLzXyjCTJy90vVy/BAQfOLol2M?=
 =?us-ascii?Q?VphE2u4NGDRTuzrGpepaPm3wwIGZYzGNqXAyXWXe?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 312ea9ed-d9eb-4eb9-242c-08dbebff6d1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 08:37:28.2577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcdcBBZUG3ImF49Abzy00vbjlKrB9PQzhsp59wbGo6zfiDQBfLQbmyCCqVgel2Wm0pucnesFdyDXE7VetzpETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
X-OriginatorOrg: intel.com

not_report

duplicate case to https://lore.kernel.org/r/202308101750.4MLmptyl-lkp@intel=
.com/

not_report 'intended duplicate include'

The comment says:

/* Needed for PAGE_OFFSET used in the macro right below */
#include <asm/mem-layout.h>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, November 22, 2023 16:09
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [arm-integrator:b4/virt-to-phys-hexagon 2/2] arch/hexagon/include/=
asm/page.h: asm/mem-layout.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integr=
ator.git b4/virt-to-phys-hexagon
head:   cfd23bb42230c6df709274664c041dd293dd5764
commit: cfd23bb42230c6df709274664c041dd293dd5764 [2/2] Hexagon: Make pfn ac=
cessors statics inlines
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221547.f=
kVop8nt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311221547.fkVop8nt-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than =
once.

vim +82 arch/hexagon/include/asm/page.h

    80=09
    81	/* Needed for PAGE_OFFSET used in the macro right below */
  > 82	#include <asm/mem-layout.h>
    83=09
    84	/*
    85	 * We need a __pa and a __va routine for kernel space.
    86	 * MIPS says they're only used during mem_init.
    87	 * also, check if we need a PHYS_OFFSET.
    88	 */
    89	#define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
    90	#define __va(x) ((void *)((unsigned long)(x) - PHYS_OFFSET + PAGE_OF=
FSET))
    91=09
    92	/* The "page frame" descriptor is defined in linux/mm.h */
    93	struct page;
    94=09
    95	/* Returns page frame descriptor for virtual address. */
    96	#define virt_to_page(kaddr) pfn_to_page(PFN_DOWN(__pa(kaddr)))
    97=09
    98	/* Default vm area behavior is non-executable.  */
    99	#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
   100=09
   101	#define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
   102=09
   103	/*  Need to not use a define for linesize; may move this to another =
file.  */
   104	static inline void clear_page(void *page)
   105	{
   106		/*  This can only be done on pages with L1 WB cache */
   107		asm volatile(
   108			"	loop0(1f,%1);\n"
   109			"1:	{ dczeroa(%0);\n"
   110			"	  %0 =3D add(%0,#32); }:endloop0\n"
   111			: "+r" (page)
   112			: "r" (PAGE_SIZE/32)
   113			: "lc0", "sa0", "memory"
   114		);
   115	}
   116=09
   117	#define copy_page(to, from)	memcpy((to), (from), PAGE_SIZE)
   118=09
   119	/*
   120	 * Under assumption that kernel always "sees" user map...
   121	 */
   122	#define clear_user_page(page, vaddr, pg)	clear_page(page)
   123	#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
   124=09
   125	/*
   126	 * page_to_phys - convert page to physical address
   127	 * @page - pointer to page entry in mem_map
   128	 */
   129	#define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
   130=09
   131	static inline unsigned long virt_to_pfn(const void *kaddr)
   132	{
   133		return __pa(kaddr) >> PAGE_SHIFT;
   134	}
   135=09
   136	static inline void *pfn_to_virt(unsigned long pfn)
   137	{
   138		return (void *)((unsigned long)__va(pfn) << PAGE_SHIFT);
   139	}
   140=09
   141=09
   142	#define page_to_virt(page)	__va(page_to_phys(page))
   143=09
 > 144	#include <asm/mem-layout.h>
   145	#include <asm-generic/memory_model.h>
   146	/* XXX Todo: implement assembly-optimized version of getorder. */
   147	#include <asm-generic/getorder.h>
   148=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

