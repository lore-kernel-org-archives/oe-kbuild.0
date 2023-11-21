Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807A6AA8
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 01:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7KzPEIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530276; x=1732066276;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=F487JFKaUwsNn5TWMi1U3jnpBvRhr8b2GADiKC5LJHo=;
  b=U7KzPEIy/3hb+UKLaHj3+jMwhzX3+iTAGzKVqoiS3bL0EvNpJL5cmxE5
   xJp0XCjjSgGqAyKK697uBwnVMAo466xpHsJhCLiPjgj1eqmqTo+yJ1yLP
   7ZV+F9gDeNJkqiwZt6NN0Ti/T7sbCSxLRvvdN479PltozkkL3QMtQuIz9
   Ayy0pLmcr4tnDWfVAzyB0fOURd5HTHuSlMd4k7AC7TqnX7HG2BL8a0FYJ
   Ck4p/ukF88Ncr6xMZIS+niSAPivI3wi6aT8KZ9Hr1wYle+L5SnNbQpkJD
   Xj2yPt9kiHPQ3qQE75RsyS71tD29qipPghgufCfZYvTT4ZhdR+4vMHPoG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458234002"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="458234002"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="7903101"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Nov 2023 17:31:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 17:31:15 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 17:31:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 17:31:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 17:31:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6V/kGOZ5lAT/m8zAupziWfOEdLP7iSwzcNakGIBwKHhG4GI0P5uvN44hzduK5lMyG4/yTad6J6rsGmDCzoA1yf6kyhwIzgPM6W8D7LX5NLmila8Sh9c+BZAgmxNc490w/gDkMBTyEXqJ6nfCygkeNPncJ7xK6ojEnVCYyuJYF76XKGXvEiTSqb0TY1fFWDib8eGj6soevFl3Ra4jzF0W/JqQuVSPz6yBO/n877ybmgvB/P962Y3Y4VLWh5LYahvd0zWWi++ig6yur31MgFpI6hPhMP/zAEDJA2FKMtkNiC0N9fJb47aC2yAZpxrkRsrVjt0PeeNtMRUWundhZjPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GMw1n05pG4g6Mss8qbInGJ3fE3TAd0c5zHOO0FkLAI=;
 b=ktExb9pTvQtccrtkRZRDDiHTrY4w2B9esl4u8yGybwrNoap7C+rWPMMPQERkq6Ago6TWREvorE/rUDPpAn2fM8vU31syWK7TVecuM7E6VCuvwOR2/EtTAcoHZgKcIwNICqrdNiN7DLkul7Foad54ZJIown1tUmUWCjCWpbYL+OiNIQPDzRSofBepHj+Cq6Npt/qBUDM2hI6A6kh2vj+IFb7J+/t2uvJHX9qNMLFR7CJhcb2U5OW8qp19vfwSV5rqPQEK+m1OS5j/2aCR+i0ECr//bJue/V8nqV65iGCwqHs+wG/uPInxWFi8fWgbyRqLMJq3qjnNjGAJcMqvkzlgzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Tue, 21 Nov
 2023 01:31:08 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 01:31:07 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [mptcp:export 40/44] progs/mptcp_bpf_burst.c:37:18: error: no
 member named 'write_seq' in 'struct tcp_sock'
Thread-Topic: [mptcp:export 40/44] progs/mptcp_bpf_burst.c:37:18: error: no
 member named 'write_seq' in 'struct tcp_sock'
Thread-Index: AQHaHBmihTmth0v1QEyhddSDsmhSpbCD/GYQ
Date: Tue, 21 Nov 2023 01:31:07 +0000
Message-ID: <CY5PR11MB63920EBFBF55F42F459CEA46FBBBA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311210900.KeauUfzP-lkp@intel.com>
In-Reply-To: <202311210900.KeauUfzP-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM4PR11MB5469:EE_
x-ms-office365-filtering-correlation-id: 8176e72e-c2e6-42f2-bf6b-08dbea31893b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j3j56mcqeSby2INh4D1BlhcdxHQErVvuXo+B6kGgHTzQ0u0x0PEo8Jo5wvRep8YAPY1PiHqHk1tA+12quRiGfHX52Ug14762LhPNifztIsY1+RICt3+CNC7vP6+7FtGydDexvBeF+DCV9C4/xO9YQBwvqDgQHkMTtSWFEAVjXZNcGuFtrZu0jQzfa/Gd7HnW+CqbEGspq21TquNlBMmN3eo53+D+gB54aBRb93k+33EoJkDDoqTDj9kJ9gxKabfOyfvuLVEaR0nXTpL1VHhVBC9VTudVheESqwJLAvY5mLr7QWXo0gJL1YEWBf9lFotb+LboNlhmnLyKcBKX43rXnlsOrTSN+AaMRPUDf8yRXA/7w8DUALIztCGqs0KSy95U89nYe0aaaWLFaHwnQSXPeMeE97YN1FJOv2Q976Iac8m2uusDnxVwE1OaVmr0+cg86VAZVuC26wB+69HHCs8YBMP3pMZD0Wq6h8J2MgOUzu593xn1+qTbExDK7Rfw2xgqcYntdQifm+XxD/YIujJ5Erfteo8iNz8B6TgMDfmx6ls9ECicPtkJAZLu9Ygie2y4xYfbvt8t6iURrXpZTH58A3RDdfuYlVyMxoqvPVl3OPAMo1o/NBYqlmc9T8Uz+X0W6HcodnX7DrmFALCTuOz0Yg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(2906002)(122000001)(966005)(38100700002)(9686003)(82960400001)(53546011)(6506007)(86362001)(83380400001)(33656002)(38070700009)(26005)(66556008)(7696005)(478600001)(71200400001)(41300700001)(8676002)(8936002)(52536014)(76116006)(66946007)(110136005)(316002)(64756008)(66476007)(66446008)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GMU429LwpeNP53t5yv8+LEwslioKB5uqNHV/d1sMF9a8L/ARZ5zUG1CzYNaO?=
 =?us-ascii?Q?VY0Cc7UCR3glt5HG2iX2s2V4zfZ+AAWEc9vasJDYSkxZ3N2wYwoUp3nEODbf?=
 =?us-ascii?Q?nbaE45jcrZ+3a097ygmpyhcf7wD33tbbaBZev9/jvcVMurQq8R2P5kHyVDll?=
 =?us-ascii?Q?PZerleZ4XR+RZuIEmw8P6ehpSnlbYF3JsLKn3PdpXR9dvj3JqWPpBr0iHydj?=
 =?us-ascii?Q?pggFqNusN4ZSQuaqw1Y3BenC+Zdt6NNsWoB1TAbcmcMpsHSi8TjEIkQW8kjK?=
 =?us-ascii?Q?HWwEttrkBF43bdZQ3LoSHdCoDhxPfdrRf450BHI/zrjHa7DznIvc6nqMN1nn?=
 =?us-ascii?Q?W5MKeALzK3BU35+b1Rwy/jlyljQwZRelbVjw651z4iWP5BWC2f38kg3qZD61?=
 =?us-ascii?Q?nGRYYIgOSH4WK3ltPHlrGniozoVjhspRFj0TKlXX8sa0P1iSR18GHT+2yNmt?=
 =?us-ascii?Q?aKacQk4fqFJXoI1Gf8/7Nk5mvLJUPtf70BgDz4Aks0EY1GtHh/P8dSpfF4lv?=
 =?us-ascii?Q?uV1zsENIjKMO8fTAyod/LIGh0CiJM4okushV+s8oF0qTbCpBnHfdojKEdmd8?=
 =?us-ascii?Q?NjcXCs07p3nGWFUUrN3i8NG6c6YgE9gsGZdKhztvRUwOQYYkXbbwstJn5ZDW?=
 =?us-ascii?Q?gYLkyE8BVcYpvG58ggplCtjX+bs9JxK7j9JPKd5/WmL67LUg7GmD594JgbtS?=
 =?us-ascii?Q?gDP8zR+jAwtLLyyFojo1MBebsVF6DX007TIUrnYp3F+2610lmQWI5wWuYxHs?=
 =?us-ascii?Q?gbjt7UYdI2gRuBfFVraPtz4sdb0T17gwFZTUoWEhQmIGPyMqQQZeaTVQoPZr?=
 =?us-ascii?Q?jvi54Pcyb7jeaQwdpNzZQakEHmhLjh2rrxDkDt9Mjs4NoV2+tYCA8MZe9M4e?=
 =?us-ascii?Q?0l3+Ido1KeGC/pdjTwzsbk1/B7SijxlngamnibGlaV+Yl05bpFxfpG+GmXWE?=
 =?us-ascii?Q?idoNfX7C4Y0OQ1ZkOMeT//KzZeDaH0KN1eH3ctj5J8sdZtdSpeUvnn1Dm9c4?=
 =?us-ascii?Q?ajFwlL35tx7RwTE+YNWGUGNR1r+2RGWu7k4Kr5/5LBsOMKW0WQ/Oi0EEQr5w?=
 =?us-ascii?Q?ktV7cudBgc7pZzCycR4v9881Xprnf/gqhS7n/2KOAVJ/i+/tUc/T2cXiFXAc?=
 =?us-ascii?Q?F/qnivEZU5yW4+5cTM8f5y+4EHXUlJXL6LQ76wLpGhkhO57I1jdejog1vex6?=
 =?us-ascii?Q?ZT1Edwy0NtrwJ+mNnokd5tUrGuQoJcYg6dYrHVBAPDT4cvVHaQ/EIuSsmbgW?=
 =?us-ascii?Q?oxkPKRaZwz3xKMdogfg/o8BT7+cF6RRJxGLs/T/9CWV6rTNuDi9hOoMZse5U?=
 =?us-ascii?Q?UFyxJ6yOrQv6UMqmcatSE3SeU8P0EnyAhjb1HVhZWnBT5VI+/uG5tBW6B94/?=
 =?us-ascii?Q?vg+GWDN0+P6UINjusTCihmdATH2sqyCFx1bfRyurxtt1Zq3eaAb7lxmHFtIv?=
 =?us-ascii?Q?GR/Quv9d/amIvNc9BCkeI7h5faoZdVCAmazOhGmbfPq4qUffyhvtayLLxS5c?=
 =?us-ascii?Q?J6uhcqK7wFKRDJ7EU7rqlWOyP/C324h9wZ0rHMSfHSLlJHd3rAzQv7dK/zug?=
 =?us-ascii?Q?1F6oxA/VhECyfCgNHSyJrV14kglNI5Z8veOebrq8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8176e72e-c2e6-42f2-bf6b-08dbea31893b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 01:31:07.9221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XzE+hrfRej9Okjkjhrd6kXdxr8qJY3aDYQ2nf8R78guVnvaXMOcUoSiL64+sBa89vpcezbjscvfouB0t/Fwfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5469
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202311180438.KHYloYBe-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, November 21, 2023 09:23
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [mptcp:export 40/44] progs/mptcp_bpf_burst.c:37:18: error: no memb=
er named 'write_seq' in 'struct tcp_sock'

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: mptcp@lists.linux.dev
TO: Geliang Tang <geliang.tang@suse.com>
CC: Mat Martineau <martineau@kernel.org>

Hi Geliang,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/multipath-tcp/mptcp_net-next.git export
head:   4fb8133272737c034fce4cf3a82ea02ded380281
commit: 1339de2f329ae0cabe49f0006b126f120d6c3192 [40/44] selftests/bpf: Add=
 bpf_burst scheduler
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231121/202311210900.KeauUfzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311210900.KeauUfzP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/mptcp_bpf_burst.c:37:18: error: no member named 'write_seq' in 'st=
ruct tcp_sock'
      37 |         return tp ? tp->write_seq =3D=3D tp->snd_nxt : true;
         |                     ~~  ^
   1 error generated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

