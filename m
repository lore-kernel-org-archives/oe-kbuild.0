Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29764ECB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 01:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXcAA0vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701739585; x=1733275585;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jSpDX3mWcZqTZ+40PvU1AOAsNu5UwlJZ0FBw/laHUY4=;
  b=HXcAA0vmcjAw/1BVxz9Iuf/w0KdEd8NZDa70EAHEAoH2snHlhb+JxzXR
   8YvotoRE/6KirUoWw5Vpos6L7sPvEh+q/Dedzlf+j4gqSa1Y/LqbjOMKc
   qs80KQV4lMOyizkRw19OZ6SGY1dAn/oFnyCXperVH/iITauCDwHrzWZ1k
   +yt20JSztZ3c74qElYYb/6nG08HcM74kvixWfm+GlRwWRGsjOeNGgwZlo
   qJgUVIxlDNo09QYhknBZGdMOk7FxPy+Tb3B1Vu+1jXRjTlikotwX6yV60
   0iYcqVynyvlU/+NANyRk8NX35kQnefuFyWtQmuWHkAMo0aQADS2jZMCiw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393559383"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="393559383"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12158198"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2023 17:26:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:26:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:26:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:26:23 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:26:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UR7302iLrq0up0ZISVBsKvDWF+4+8QePAg0XwFetLUC/UKPFi2cflv/DjmlBtKhufpJZNhUlsrEMOcXowKqOPcIeMLCv7S16nQpVB2+9CnyjxtUmdwEh1U6U6xa9v1+SseEFGllkmyJWhiRSAGN8mhKRarY7YSMurkpt+kCHybLH2FpVcKf35AeET4xITceuyT0dRgovph4puffpNGjJiyRSUZgHAz9t5lyi3T7MYI9ZqbgdZ2OEvitjf7R6C+0ZaQ6q7nr+B7cy0rXCZ1x+jbCekqzgRPR8Mpq0xAt9wkdI+UcFwOsZy+z/3YbtTB5dcXw4arRSL7XrneWcqW9tvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQlfFvjRM0Pa7G2A47EDSo+YMvDZmtAT8+XYiDZ4n+g=;
 b=HRJPMHbN3sQOmh5a8YV4Dst+VQMMdnf0MDFutW7GRkOeNuEHsGQl/2A4BoSOJvItbXqJ0T43gOBHbrzo8fbiGsAcrIdjLd+R0ZjPbzIhQQvzkdgJqyRr1/wFLMWWYEMfGhBJ8dtcNJWNtuFJK+piu9dXSzQ0EtOgn2kGyuB/RTlU9rdH61cxwwNM4IrObGETAXseN3ayF+W04r600gdboeKN0cFzHNpheTybZlaxjs3T4edJ+9uLl3TL7usEaX+S+38nm4Vpue1SM17hrBxqyXcRpIzUuRfOXG2gP6HHkDENkkC3QHng2rVHY6tfBD6PoYt2sSQ/F7VHTZMJxD7zKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 01:26:15 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Tue, 5 Dec 2023
 01:26:15 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: arch/arm64/include/asm/kvm_emulate.h:439:32: sparse: sparse:
 incorrect type in return expression (different base types)
Thread-Topic: arch/arm64/include/asm/kvm_emulate.h:439:32: sparse: sparse:
 incorrect type in return expression (different base types)
Thread-Index: AQHaJqn+MBbfKGvbj0Whpur5ijx9J7CZ5ngQ
Date: Tue, 5 Dec 2023 01:26:15 +0000
Message-ID: <CY5PR11MB6392F4F38234A8B3BAE1C4D5FB85A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312041952.vPqaP6hB-lkp@intel.com>
In-Reply-To: <202312041952.vPqaP6hB-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SN7PR11MB7637:EE_
x-ms-office365-filtering-correlation-id: 901c278b-ef06-4486-00ac-08dbf5312c95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bxv8WOgeHDKbEdlbXZx3+k0/b68q8rbXrZIgjddhp0h6JG6FWxMrPKnxpaBj1S3FjLkVeCQbW5FcANIKf1F+lzrVQbWw6e+vUow4tdOcRgoeUoRLGyTGVpPeKOydjI8YUb5PuIBOW7fUTk9MLGDpt+VB0TRACeNP8P+GcGGKu3Z1ZA21DaViQw6VwmWGIqb3nhBkoXR+lVQ0Mnqh6lNMksOY6GYiekXmo0gYl1yDZjQTzeXAvkayjNXJGwGWjh8A/MX4UUTMDDJr6Bm9oiOhxKSFXDC6kK0ixmccmzonFGX1USfeFAKFZOb6c9AgR1Rto1wFxV7PLWvTJUyKXH9NyYCKtlglQAayKYqq5G4bWVHmbWb7UKAoQgWsQe1Wqx/oLurUixAvQO98QnDH7siwbLowsc871ZhEbjpXyux3K4GxpajC+olRT227QPyWQYMz7FFuS7J+aYEv5MqySZ6xf+cxPV44ix5WSHKozWfbjJ3WRYXjIwe/dEdLKYazBYi0UWdc3bzO+N92wxlkYQjNnBzuBvuRlv2zWSjwaHNLMc8esalMLw5FkwL4lLnuNEppZz9Z6rGD7JJlyxqBOIjGXZDthVTdHAfLWTAF45gpR5H3gOLBNowT59Plp7pCoHYQcs14/42I9Kea8xNLHY/0UlGlcyO9Y4GmP183JslcRSO3HFeKPVsYSxl344FN7AoO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(55016003)(33656002)(38070700009)(122000001)(30864003)(5660300002)(2906002)(83380400001)(82960400001)(71200400001)(53546011)(26005)(6506007)(7696005)(9686003)(76116006)(478600001)(110136005)(966005)(41300700001)(66946007)(64756008)(66556008)(52536014)(8936002)(86362001)(66476007)(8676002)(66446008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jpx/Mr3Vgtuie5tKAQ6z02/IbkVHG+8ATM6IvLwwUA/cXzjvdYqmcQtkcNfa?=
 =?us-ascii?Q?k210B4hlCG6Z7iFEDRMz3b4FUIME/Br/rtHxpRbD2df6R/GVci4uRpa/E2OL?=
 =?us-ascii?Q?OlMofYFf80C5LSB8vMyQ2xvMybIwsVquKC/fjwCQRhukry9B0J1LCIp/aUUq?=
 =?us-ascii?Q?r+xp2dEU+i6oj0zHStTldfwvWhsUvNxu4dMiQ2z/vCl/341NCMVUvUj3tp+O?=
 =?us-ascii?Q?LJbDQpISTPHac5A4leFi+48BVnQcO2eUTf0QBz8646mtieN0i7fLyVnJjNYj?=
 =?us-ascii?Q?e1emIWCk66Ia7LqmPBuP1CCLe5K3EBbHSR8gQ/WJK2n1ASr/MP7VVukZxtT+?=
 =?us-ascii?Q?vp8eGloYkEoURUaxcyWXP6GsaPBbjbZLKeunUr4aCmF9EfOn/Zu3QpNQjVQE?=
 =?us-ascii?Q?TZgl2IuwFnGC8l0jLIjt2vh9qW8LgiLRglYysuzHHDvp2F9yoX9NOM5TwUCD?=
 =?us-ascii?Q?CUGGojDb+agsIrrjfvkEw/eWk+cmZHjCbRsmJ7TnBVNzuJHJtNiMaxU2Nitu?=
 =?us-ascii?Q?wup4IR3Rd4mJB0cZUr5Q/KSyAnzQCTP4gpQ9VuM/P2AaPXKteIHPF8K5DLg8?=
 =?us-ascii?Q?Ilt5CHbj3pZDahSHyVhMpcJTqSGAzVUAqhJpvgs5MpMVzbA2H9isUDwvHfhI?=
 =?us-ascii?Q?sXREINrE9NV0/6kj04WVCxqmvPwQOGQRMDBYv20YQabg1YqzTg9HahxlvXNH?=
 =?us-ascii?Q?cJYHQIRx3jr9W9Pi5IY102zQ/izktzJYv+AOwZZUzMcTfC7VBv6JkZ/1qf9t?=
 =?us-ascii?Q?o+p5HfV9xQrvZZdhGmgdGzF8DaQgCJPDwpq3rwTPaNJAaiAzmm+KojG+55MQ?=
 =?us-ascii?Q?FQ6PEVBv66oXPx6Ndk1un4mTQ3ODFM8QmHEOCUomz2djLGauhDIdQYAQYIwa?=
 =?us-ascii?Q?VVIZaBLTYsL+EMBiujvgxUTk15sBd+h5eYwIflanQi12y7kZnslQby3fP+N7?=
 =?us-ascii?Q?GV5GipKFNDI6kuUo1XlsGFipMA0Lqi0kmNbR6JDjEQWO5xXbV3eJ3XRIau9+?=
 =?us-ascii?Q?0Sw5arHrVDidbcmhvy55BwjeJizTBeAgybyUbIorMU+GoAMz8ty8f23pq/Nn?=
 =?us-ascii?Q?jXXkHvZ+FavtfDOEn024t17ClQigg5LJVOLRsvQg0xmPW03tQcNu0CqetLU8?=
 =?us-ascii?Q?jsJaAxaiqxuD8TYPBgDfvIS4Q8PVV0yj8XsDNzOd5fMZFTNfyAlBau6MjwSe?=
 =?us-ascii?Q?pd+ZCdnS2NqXqrVw+gtvg1DmCSkdo2l1Y2wDB5xeM6BuGOLTwphf/+m4V3xQ?=
 =?us-ascii?Q?ympd/IQDwAKW3Zt7rNHppN5sV/HQU8NOvdBAUeZiIKi+/z1SfJhvbgDmJ+Kr?=
 =?us-ascii?Q?IgZNFYEhch+yn5j5o6wFCbYlGfhvYFt42hgbS7bb4c2+t3T83rHy835n+leE?=
 =?us-ascii?Q?a6UmFnOdRV5JuHX/nrbmy/FyJuFuOc7pvh8RVueNUDY7XoiZeenorGDTLB+Y?=
 =?us-ascii?Q?Nu1sYoPIOhlgNTC4MpiMueaqizlEzBpSxy14LQEIwXtH3YKTkQbcAhsi/xsD?=
 =?us-ascii?Q?yVTtaKdkeLxYkxr1RAzSo+8MWr3t2kw+375+K1+xFEYcUeDiaglUQZpn2S33?=
 =?us-ascii?Q?V+/cpKJ1Ozt48Ipgk1uo7kl+TSLNeftt7aLB2W5e?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 901c278b-ef06-4486-00ac-08dbf5312c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 01:26:15.2989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQSidyloP0LEFpcIYQVqEdEGVo8IGau6mrdDHXV5/uX0ScPeIHImOdQrLf6H0Wh68sDP1avaH5Z7YQHm/gVufQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
X-OriginatorOrg: intel.com

not_report

only kconfig change:

arch/arm64/kvm/Kconfig | 5 +----
 arch/x86/kvm/Kconfig   | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, December 4, 2023 20:03
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: arch/arm64/include/asm/kvm_emulate.h:439:32: sparse: sparse: incor=
rect type in return expression (different base types)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO ins=
tead of TASK_DELAY_ACCT
date:   2 years, 7 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 2 years, 7 months ago
config: arm64-randconfig-r121-20231116 (https://download.01.org/0day-ci/arc=
hive/20231204/202312041952.vPqaP6hB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312041952.v=
PqaP6hB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312041952.vPqaP6hB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/mmio.c: note: in included file:
>> arch/arm64/include/asm/kvm_emulate.h:439:32: sparse: sparse: incorrect t=
ype in return expression (different base types) @@     expected unsigned lo=
ng @@     got restricted __be16 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:439:32: sparse:     expected unsign=
ed long
   arch/arm64/include/asm/kvm_emulate.h:439:32: sparse:     got restricted =
__be16 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:441:32: sparse: sparse: incorrect t=
ype in return expression (different base types) @@     expected unsigned lo=
ng @@     got restricted __be32 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:441:32: sparse:     expected unsign=
ed long
   arch/arm64/include/asm/kvm_emulate.h:441:32: sparse:     got restricted =
__be32 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:443:32: sparse: sparse: incorrect t=
ype in return expression (different base types) @@     expected unsigned lo=
ng @@     got restricted __be64 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:443:32: sparse:     expected unsign=
ed long
   arch/arm64/include/asm/kvm_emulate.h:443:32: sparse:     got restricted =
__be64 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:450:32: sparse: sparse: incorrect t=
ype in return expression (different base types) @@     expected unsigned lo=
ng @@     got restricted __le16 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:450:32: sparse:     expected unsign=
ed long
   arch/arm64/include/asm/kvm_emulate.h:450:32: sparse:     got restricted =
__le16 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:452:32: sparse: sparse: incorrect t=
ype in return expression (different base types) @@     expected unsigned lo=
ng @@     got restricted __le32 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:452:32: sparse:     expected unsign=
ed long
   arch/arm64/include/asm/kvm_emulate.h:452:32: sparse:     got restricted =
__le32 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:454:32: sparse: sparse: incorrect t=
ype in return expression (different base types) @@     expected unsigned lo=
ng @@     got restricted __le64 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:454:32: sparse:     expected unsign=
ed long
   arch/arm64/include/asm/kvm_emulate.h:454:32: sparse:     got restricted =
__le64 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to res=
tricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to res=
tricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to res=
tricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to res=
tricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to res=
tricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to res=
tricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to res=
tricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to res=
tricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to res=
tricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to res=
tricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to res=
tricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:419:32: sparse: sparse: cast to res=
tricted __le16
>> arch/arm64/include/asm/kvm_emulate.h:421:32: sparse: sparse: cast to res=
tricted __le32
>> arch/arm64/include/asm/kvm_emulate.h:423:32: sparse: sparse: cast to res=
tricted __le64
--
>> arch/arm64/kvm/pvtime.c:27:25: sparse: sparse: cast to restricted __le64
--
>> arch/arm64/kvm/arch_timer.c:1016:66: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void *vcpu_info @@    =
 got struct kvm_vcpu *[noderef] __percpu * @@
   arch/arm64/kvm/arch_timer.c:1016:66: sparse:     expected void *vcpu_inf=
o
   arch/arm64/kvm/arch_timer.c:1016:66: sparse:     got struct kvm_vcpu *[n=
oderef] __percpu *
   arch/arm64/kvm/arch_timer.c:1049:74: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void *vcpu_info @@    =
 got struct kvm_vcpu *[noderef] __percpu * @@
   arch/arm64/kvm/arch_timer.c:1049:74: sparse:     expected void *vcpu_inf=
o
   arch/arm64/kvm/arch_timer.c:1049:74: sparse:     got struct kvm_vcpu *[n=
oderef] __percpu *
--
>> arch/arm64/kvm/vgic/vgic-mmio.c:854:24: sparse: sparse: cast to restrict=
ed __le16
>> arch/arm64/kvm/vgic/vgic-mmio.c:856:24: sparse: sparse: cast to restrict=
ed __le32
>> arch/arm64/kvm/vgic/vgic-mmio.c:858:24: sparse: sparse: cast to restrict=
ed __le64
>> arch/arm64/kvm/vgic/vgic-mmio.c:878:22: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long data @@  =
   got restricted __le16 [usertype] @@
   arch/arm64/kvm/vgic/vgic-mmio.c:878:22: sparse:     expected unsigned lo=
ng data
   arch/arm64/kvm/vgic/vgic-mmio.c:878:22: sparse:     got restricted __le1=
6 [usertype]
>> arch/arm64/kvm/vgic/vgic-mmio.c:881:22: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long data @@  =
   got restricted __le32 [usertype] @@
   arch/arm64/kvm/vgic/vgic-mmio.c:881:22: sparse:     expected unsigned lo=
ng data
   arch/arm64/kvm/vgic/vgic-mmio.c:881:22: sparse:     got restricted __le3=
2 [usertype]
>> arch/arm64/kvm/vgic/vgic-mmio.c:884:22: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long data @@  =
   got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-mmio.c:884:22: sparse:     expected unsigned lo=
ng data
   arch/arm64/kvm/vgic/vgic-mmio.c:884:22: sparse:     got restricted __le6=
4 [usertype]
   arch/arm64/kvm/vgic/vgic-mmio.c:88:17: sparse: sparse: context imbalance=
 in 'vgic_mmio_write_group' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:124:9: sparse: sparse: context imbalance=
 in 'vgic_mmio_write_senable' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:195:9: sparse: sparse: context imbalance=
 in 'vgic_uaccess_write_senable' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:278:9: sparse: sparse: context imbalance=
 in 'vgic_mmio_write_spending' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:320:9: sparse: sparse: context imbalance=
 in 'vgic_uaccess_write_spending' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:565:9: sparse: sparse: context imbalance=
 in 'vgic_mmio_change_active' - wrong count at exit
   arch/arm64/kvm/vgic/vgic-mmio.c:773:30: sparse: sparse: context imbalanc=
e in 'vgic_write_irq_line_level_info' - different lock contexts for basic b=
lock
--
>> arch/arm64/kvm/vgic/vgic-its.c:824:17: sparse: sparse: cast to restricte=
d __le64
   arch/arm64/kvm/vgic/vgic-its.c:955:24: sparse: sparse: cast to restricte=
d __le64
>> arch/arm64/kvm/vgic/vgic-its.c:2133:13: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [ass=
igned] [usertype] val @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-its.c:2133:13: sparse:     expected unsigned lo=
ng long [assigned] [usertype] val
   arch/arm64/kvm/vgic/vgic-its.c:2133:13: sparse:     got restricted __le6=
4 [usertype]
   arch/arm64/kvm/vgic/vgic-its.c:2159:15: sparse: sparse: cast to restrict=
ed __le64
   arch/arm64/kvm/vgic/vgic-its.c:2280:13: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [ass=
igned] [usertype] val @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-its.c:2280:13: sparse:     expected unsigned lo=
ng long [assigned] [usertype] val
   arch/arm64/kvm/vgic/vgic-its.c:2280:13: sparse:     got restricted __le6=
4 [usertype]
   arch/arm64/kvm/vgic/vgic-its.c:2306:17: sparse: sparse: cast to restrict=
ed __le64
   arch/arm64/kvm/vgic/vgic-its.c:2404:17: sparse: sparse: cast to restrict=
ed __le64
   arch/arm64/kvm/vgic/vgic-its.c:2460:13: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [ass=
igned] [usertype] val @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-its.c:2460:13: sparse:     expected unsigned lo=
ng long [assigned] [usertype] val
   arch/arm64/kvm/vgic/vgic-its.c:2460:13: sparse:     got restricted __le6=
4 [usertype]
   arch/arm64/kvm/vgic/vgic-its.c:2476:15: sparse: sparse: cast to restrict=
ed __le64
   arch/arm64/kvm/vgic/vgic-its.c:280:12: sparse: sparse: context imbalance=
 in 'update_lpi_config' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-its.c:443:9: sparse: sparse: context imbalance =
in 'its_sync_lpi_pending_table' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-its.c:730:12: sparse: sparse: context imbalance=
 in 'vgic_its_trigger_msi' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-its.c:752:5: sparse: sparse: context imbalance =
in 'vgic_its_inject_cached_translation' - wrong count at exit

vim +439 arch/arm64/include/asm/kvm_emulate.h

6d89d2d9b5bac9 Marc Zyngier    2013-02-12  398 =20
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  399  static inline unsigned long=
 vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  400  						    unsigned long dat=
a,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  401  						    unsigned int len)
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  402  {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  403  	if (kvm_vcpu_is_be(vcpu)) =
{
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  404  		switch (len) {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  405  		case 1:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  406  			return data & 0xff;
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  407  		case 2:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @408  			return be16_to_cpu(data =
& 0xffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  409  		case 4:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @410  			return be32_to_cpu(data =
& 0xffffffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  411  		default:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @412  			return be64_to_cpu(data)=
;
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  413  		}
b30070862edbdb Victor Kamensky 2014-06-12  414  	} else {
b30070862edbdb Victor Kamensky 2014-06-12  415  		switch (len) {
b30070862edbdb Victor Kamensky 2014-06-12  416  		case 1:
b30070862edbdb Victor Kamensky 2014-06-12  417  			return data & 0xff;
b30070862edbdb Victor Kamensky 2014-06-12  418  		case 2:
b30070862edbdb Victor Kamensky 2014-06-12 @419  			return le16_to_cpu(data =
& 0xffff);
b30070862edbdb Victor Kamensky 2014-06-12  420  		case 4:
b30070862edbdb Victor Kamensky 2014-06-12 @421  			return le32_to_cpu(data =
& 0xffffffff);
b30070862edbdb Victor Kamensky 2014-06-12  422  		default:
b30070862edbdb Victor Kamensky 2014-06-12 @423  			return le64_to_cpu(data)=
;
b30070862edbdb Victor Kamensky 2014-06-12  424  		}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  425  	}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  426 =20
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  427  	return data;		/* Leave LE =
untouched */
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  428  }
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  429 =20
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  430  static inline unsigned long=
 vcpu_data_host_to_guest(struct kvm_vcpu *vcpu,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  431  						    unsigned long dat=
a,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  432  						    unsigned int len)
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  433  {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  434  	if (kvm_vcpu_is_be(vcpu)) =
{
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  435  		switch (len) {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  436  		case 1:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  437  			return data & 0xff;
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  438  		case 2:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @439  			return cpu_to_be16(data =
& 0xffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  440  		case 4:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @441  			return cpu_to_be32(data =
& 0xffffffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  442  		default:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @443  			return cpu_to_be64(data)=
;
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  444  		}
b30070862edbdb Victor Kamensky 2014-06-12  445  	} else {
b30070862edbdb Victor Kamensky 2014-06-12  446  		switch (len) {
b30070862edbdb Victor Kamensky 2014-06-12  447  		case 1:
b30070862edbdb Victor Kamensky 2014-06-12  448  			return data & 0xff;
b30070862edbdb Victor Kamensky 2014-06-12  449  		case 2:
b30070862edbdb Victor Kamensky 2014-06-12 @450  			return cpu_to_le16(data =
& 0xffff);
b30070862edbdb Victor Kamensky 2014-06-12  451  		case 4:
b30070862edbdb Victor Kamensky 2014-06-12 @452  			return cpu_to_le32(data =
& 0xffffffff);
b30070862edbdb Victor Kamensky 2014-06-12  453  		default:
b30070862edbdb Victor Kamensky 2014-06-12 @454  			return cpu_to_le64(data)=
;
b30070862edbdb Victor Kamensky 2014-06-12  455  		}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  456  	}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  457 =20
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  458  	return data;		/* Leave LE =
untouched */
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  459  }
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  460 =20

:::::: The code at line 439 was first introduced by commit
:::::: 6d89d2d9b5bac9dbe40ee106ceda9307b6265234 arm/arm64: KVM: MMIO suppor=
t for BE guest

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

