Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B0A3D
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Aug 2023 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693275804; x=1724811804;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+l6HzxizSBHUB2WiiaRUOrdqVQ1dw1uJmmhPaXg+BwU=;
  b=lWti2OIFHr/uKcSMBAqnNJE4/WuPMen2t/Vo3AcyE7YBOXU+n1vwtoCO
   wT4KzdG54uTmz76cXmApd0prnWU1ouKlnLfazZK3KCzXEXRt6TYqNlFxp
   5aCGiN5LijyIQbebXCzhk7SPDs+lb3Obbd7xCmb+NEBJENAjVocWNcH7x
   tsI6KaXt+COs0UDw+CSBd2pvwomZr9OOSkOb4tXmI6ZTO5duYuCjopmDR
   W2oNOiOzF7vyj1vI/4wtBJY6gJT0wgi+OSmhOCdNEhAuVeirtkA6ep+cp
   SMbVIZ+HSUoS2YIdj7ny6O7MatsXFJgNhnPTSgynYws9FlE7IBdIre7oP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439206225"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="439206225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 19:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862056087"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="862056087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 19:23:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 19:23:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 19:23:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 19:23:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 19:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OO/dFmSG8MXS1fvfihFgUPwLv+1C2vzp6/8vqcVH76by2b7m3jcRczF922pv2fnzzMoYNim2ZXpaK8j3spFd7Zxlo2s18qhd7flEjMQsHl9Bti+QVNmGzwaaHF59ufJOB3m3RkCXidp1tIR6ZMx2Yatp6++jc8H09XDFr2wuVKfPK5o9m4kpzOiu1MIxFaRHAB64TuivzGecl9U/N/p4CBgXeWCJplfBJCg4g5A19gA78JyAzgNcg9J2y2EslgFdywOOGfa30CTj8yV+3TEb8X5FimCWEJDVwEQF4lUkoHQdMBL9Uj9GxjFqCcngPm4ghRnWhVF5IavP+Q2I4OoLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4exqMlotplzZE6KDjZc7yJxaUlHQcvQZY4c9smFlAU0=;
 b=lab/w5PKUjib3NynLWvtkFX/2HdJ1N1h2fF9s+guZQCDNC20hRLc94sKzPIyIeJFFaGYb80wQ2RfnOPLWEaMV9KuNH+oEku4hRTyajlvcmX5huXXoeMxvnhsg0j9/zi7PVTc1PRyh9IFLcgAEwb/tajy8FezRQQY0ISzoKDf0GkWXhTo2rtVZrR2hGVUFeFMkJRKUaQO+yRrE7WCb9SqtttT6qME3z3pdxi9KOoVQRtq+ipJwSPgC/B2PeTNo+swMIkWjBtPcAcguluapmiyCK1a3a6PN848ZpXRGrIwzYV24Tg4krESMAd+lYQ8SYbyoQxsZU4x3uslAXqvio1Fow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 02:23:20 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 02:23:20 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterator
 kfuncs
Thread-Topic: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterator
 kfuncs
Thread-Index: AQHZzKj1KVHHbb6xhk2QQdYiPdyiBrAApeVQ
Date: Tue, 29 Aug 2023 02:23:20 +0000
Message-ID: <DS0PR11MB6397B58BD007E4F20A0EC303FBE7A@DS0PR11MB6397.namprd11.prod.outlook.com>
References: <202308120622.rMu98Wlt-lkp@intel.com>
In-Reply-To: <202308120622.rMu98Wlt-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|MN2PR11MB4600:EE_
x-ms-office365-filtering-correlation-id: 496ad6cd-6841-41ff-a8f5-08dba836e96f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: seLlYfGAeb0M4E1f244FUZ5agSzS9RGs6Q9KcIbCg5k6cfhc1BtTADSq/wNOkb8w/PfRehZhZh89Fz/mVHz1x+SkGZMF6WNjsQcEaWgmzjqn1j0M0DpvURl/RwL/+wtWO1njLOcKwOB/U6UCDijMcSBYAZcUNIo11VPJ1WeoMD5tfz7F4G1CTEdVxsXIvholTEx5aSeBCd1rMYtphsyq6/eKoKP3UJFn3qmiB0vsF0Vgz+JRVllhL6j1IYAL9ANRcCPeEnBJLhHh1cgjWG5SbsKk3Mk/aTP9KfwI2Vt9CrtoO5qxiwEc9rqBf5xcfMiWv60UwPlFZ+bSQLDSNJYr9dW4dqZx+XusYmNAOozXgQJ/JZYfed6zjqs18xiSEWGryXBKzlNW8Mm9bbnYy9FibAPrzrgA24EESbTlrOMHW/z2Jj3+hKZQZ9yexBxNU4r8KVQjI6ou4WOi/oJnCa4lnqM6XsL17UOhaMb6GpjBMEIxwAeROuwP/0VUiAGjef4+rM79eA/bl4DZ2XMNpk3UAubCgd/jJKICwWczklv772QJROiKsCvW5+0/aHZIdLizB02ZMcuJVxB/uXNyoze+Ne9d/baQKc2RoggwZsy+QZyMZUDb+vtaff0rOoSs/5qadCbmYqNU+o14o58JRGNDlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(9686003)(38100700002)(38070700005)(316002)(41300700001)(82960400001)(33656002)(2906002)(83380400001)(86362001)(52536014)(26005)(5660300002)(8676002)(55016003)(8936002)(71200400001)(7696005)(6506007)(966005)(64756008)(66556008)(66476007)(66446008)(53546011)(110136005)(76116006)(122000001)(66946007)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cio0dWWxkx2q0kq6XkxvOqZD7wufaf92v9MO3mKDB//4OzbA6SSTRXIGK4St?=
 =?us-ascii?Q?HIdN0WMJPrhbsDKZgS/k5IsGew9CmXAK8VqVuwbsaSlBvu1TYLoIC0Uqc4OZ?=
 =?us-ascii?Q?kWLR+oHPWzuaab6kYkLu07gdd/aDqjoAAPMcpKDoNuU6AuJKL280g0Wb5q6e?=
 =?us-ascii?Q?+NDPUy1XB9Hj41f1KUBMeD4L578ytqf/bW+jDZHocd5zLOA/Ovvz8C99BuVQ?=
 =?us-ascii?Q?5IIQGe6HZAO+oe0WR4MBHWlMHZq2OoAtJPsVp1krq6Ztpx/Yk9suoFt7HeF/?=
 =?us-ascii?Q?1Bja79XAd9KOTSAnkhX+uG86J65BW+xK393/whlIpKLzdtj9HXpzgIF6nDL6?=
 =?us-ascii?Q?pE4ZGPChMte1us42W2wRujyLrQuZePzD67VlYsZTLb2jJ0hdv/BmjV7fx16n?=
 =?us-ascii?Q?71A3WMEhxgD92KM7d1o3o/RHG1+97TG2oGTRZ+JUh8SCpGouSEbXfON4w+VH?=
 =?us-ascii?Q?9KYkuEbQmomoABMhq7LTNruFH+zNy3/tFXcZi1HdS/Sr/YS6/dfrC6skscYR?=
 =?us-ascii?Q?MBjYeNHhd204BAbAHIQPkOcNZ9abB/UzLHyojsfLFi+8hdvgWhpTAsEP97nq?=
 =?us-ascii?Q?zIyKrtS5sKFoiiP7C0EnJMgZ4g/HuVhw533AxXoO2Z/8lYMjF8ikFnfEtDVt?=
 =?us-ascii?Q?tudT5oGi44lYSGnCJtj4APfAcMGFu/1f73M4QAvrYxnC98fvtlVEREdH9c8A?=
 =?us-ascii?Q?9SeEYVfYvLpchLaPYKekMfArYEFoCFwxqj5g4u9g1OAC38zgqSi5latuirU4?=
 =?us-ascii?Q?9Wmh0YirSckcArTI53L2CTdzT8tKk5PP02BsiZ3yNO4X9x1M/0Uc4+8Fwho2?=
 =?us-ascii?Q?l4VbpJ76/H/gHoyhbhUeMxa4ixDwVDp0fxZ5zuqg3bbqn77xexx/BD2rz5DF?=
 =?us-ascii?Q?JOwp/+p8fykeVXuvffmfnQV1SfPzZlweGVl7yR0nvldAH84pjPlV09ScJpcN?=
 =?us-ascii?Q?oJt7z+F1nWdUmuQv6yHDmtCGdPF6D3cdqY67sN/d4S0x2sMsvVQhKN2Udog1?=
 =?us-ascii?Q?ppmOOJ/NEdPsttGLT6oXPyqkAIAkqp0tSGebkeF23XrB3lV5s10oH1+y2Jb3?=
 =?us-ascii?Q?9q+N3tcKmKl35j5ydk4yOJQzln6LUKC4I6lHkIVuT3EdG5Skr0MkSiJdikzi?=
 =?us-ascii?Q?QMxBn2ZfZSU6EV740wJxtW0TBhttsbqc3PSfTQ1oaW12WxVMq+itxJlzNVe3?=
 =?us-ascii?Q?yiNzZPkbVI8+ZWes+ev7KWtI5FJRnmbp0ZT98VL88Nb9ZUfV2BYL9N/Aem+i?=
 =?us-ascii?Q?zB0PGEMo56ZlQbY7ufTNNma0iK5AbmkjxXRcBWGokmeGcJyhZsbd+WgbwVcZ?=
 =?us-ascii?Q?39Yyvj/XAbH2vUWKmtExosrNg9q/LoAcrJrLYNJ0x+86vax/btQ2HX8hOSH8?=
 =?us-ascii?Q?bsTO7ExOlSoT9cuPaC87XHLJxFdDt1I3C0gscFE2mpVBup30YpEbfRNe/xSV?=
 =?us-ascii?Q?KV9mmh3vCO58ZSszVVl5rELcqRlKo2G3dhyFVk86yqlqmPhKwzGh1LHvpkdc?=
 =?us-ascii?Q?hn8vJeg6vdvfNzGkf5bTJq4sr+2DxWIFoTx4mxUn4Bhjc1LcG9P8dzKTTYFZ?=
 =?us-ascii?Q?nRjc6VS65A9p6yxL89zLPoUur36sJvKPtl2/jV1Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496ad6cd-6841-41ff-a8f5-08dba836e96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 02:23:20.0938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55zNkC9B/RLUx/EeJXcnywsZ3KHmHTCdNyd2dXrVHIQNoIYCwLH0DUn8P9oO019itAKOc2PZ1dQmLtCW/aBQ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
X-OriginatorOrg: intel.com

not_report "replacement of the patchset in the link"

Notes:
  * This approach was chosen after discussion on a previous series [0] whic=
h
    attempted to solve the same problem by adding a BPF_F_VMA_NEXT flag to
    bpf_find_vma.
  * Unlike the task_vma bpf_iter, the open-coded iterator kfuncs here do no=
t
    drop the vma read lock between iterations. See Alexei's response in [0]=
.

  [0]: https://lore.kernel.org/bpf/20230801145414.418145-1-davemarchevsky@f=
b.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, August 12, 2023 07:09
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterat=
or kfuncs

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230810183513.684836-3-davemarchevsky@fb.com>
References: <20230810183513.684836-3-davemarchevsky@fb.com>
TO: Dave Marchevsky <davemarchevsky@fb.com>
TO: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <martin.lau@kernel.org>
CC: Kernel Team <kernel-team@fb.com>
CC: Dave Marchevsky <davemarchevsky@fb.com>
CC: Nathan Slingerland <slinger@meta.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/bpf-=
Explicitly-emit-BTF-for-struct-bpf_iter_num-not-btf_iter_num/20230811-02361=
5
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
patch link:    https://lore.kernel.org/r/20230810183513.684836-3-davemarche=
vsky%40fb.com
patch subject: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iter=
ator kfuncs
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230812=
/202308120622.rMu98Wlt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120622.r=
Mu98Wlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308120622.rMu98Wlt-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/task_iter.c:837:17: warning: no previous prototype for 'bpf_i=
ter_task_vma_new' [-Wmissing-prototypes]
     837 | __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *=
it,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:869:36: warning: no previous prototype for 'bpf_i=
ter_task_vma_next' [-Wmissing-prototypes]
     869 | __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct=
 bpf_iter_task_vma *it)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:878:18: warning: no previous prototype for 'bpf_i=
ter_task_vma_destroy' [-Wmissing-prototypes]
     878 | __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_=
vma *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/bpf/task_iter.c: In function 'bpf_iter_task_vma_new':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_ass=
ert_554' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct =
bpf_iter_task_vma_kern) !=3D sizeof(struct bpf_iter_task_vma)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__c=
ompiletime_assert'
     378 |                         prefix ## suffix();                     =
        \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_comp=
iletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:843:9: note: in expansion of macro 'BUILD_BUG_ON'
     843 |         BUILD_BUG_ON(sizeof(struct bpf_iter_task_vma_kern) !=3D =
sizeof(struct bpf_iter_task_vma));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_554 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383 =20
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(con=
dition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition=
, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386 =20
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break b=
uild and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time c=
onstant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emi=
t if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert=
, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false=
*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do s=
o.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(cond=
ition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition,=
 msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

