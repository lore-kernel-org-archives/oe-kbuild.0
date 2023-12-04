Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC6115A4
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpRYKSBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656897; x=1733192897;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=S+HXMnreZdnsbFyAghW9Lc/2jAouZLmxpWkk9mcwpAs=;
  b=SpRYKSBCLhrhNULuZQvOM+VhVgQeHVJRFGa/9RcemYlr4EaLLSUlminS
   Vu6NxX/rMa/u0xQkqzbAu9J96wQroAaPVnvlyMYIPe5OnIIuQV3DVqTCR
   xz4OwOhFZGufcDScAskRjuimfBYer2J/OhehGbzR4SF+fgzW4iRP48oRz
   yloWf0nXabWtbQTZ5e5rROZCuuuKWuEF2m+V3zZL/0WPVZ7wAjN4gCA/2
   vKnP++YfaJM7AZJYbep0MsQvP6BHerUYoGtNV+Zj2VBIQut/8x6RILU5M
   MJSPGraArQoNrEn9udbF0dZBswvxZkX72axL9Td7i5lBgZ5km7ODW+JaL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384079015"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="384079015"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="893837211"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="893837211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:28:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:28:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:28:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:28:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:28:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk5o9fIX7DteGDF2LOTwurmmySR89L0oMJndEH/MzvP1ksKWNHKpLPErhl+2Z5dnItisf3mMyQmIY6jS+NDbyMgL4jIQxlFXEC2Xt2pODLiI7PaLNeCDx7MzuXggn2bGtLYxD30m+ZkAiMZmQOTcdIrhVK6FoVzmxXc9GWEvtlQMQi2fj+ZOP6dadfuRkRFqawGcEngInsGP+XsSnPaazBGPISmXsCdlMTISVtodhMEbhpnly1m+EZHWSepfIokRjImN+VnMthaDrrymWGE+8CqNOG+4blzWRM5cPJZMKGDWfRrbUn33x2TlB3FbNGN9dvyPBBs/bNxlE9QFg/uplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcOZLjp6EeMiSP6cK1IwOIymbu2Og+PERALKJOJvvy8=;
 b=YY1HLl0+mVpt2Qm8pESxI7s9oZUP8wmhcbyPvMyInZo1ZQOmSBu/b/C4wiD8SSnwiEAccYPGx4oJusqhao8dYjvu0d4h5uf7a2k44y6HL1r4Vxg2jGp5s4EZk/86VUzcnYqS/GwugTV3HLddVPIDXgB4kxR1/f7YKPyeMQrmfcEzQbtSCJd99doF1wBDvS61ztpMXTdAt1FZ3sApjO7NEq9c+S9gaZL28uW41zCGdV+J8pltJoI/QiojzSVra65DRupYpWp5nhwBFzHZGTVDs0rMT98GGYfifsbIjBWq+X3lFWCWZ8XSYJU26gVqjdj9cemULBQv++D71DreZtDInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:28:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:28:14 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is
 included more than once.
Thread-Topic: drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is
 included more than once.
Thread-Index: AQHaJa89ptO0vqh600mN7Ee9aQUDq7CYZ6Nw
Date: Mon, 4 Dec 2023 02:28:14 +0000
Message-ID: <CY5PR11MB6392176CE4BDE3F00B918BB7FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312021245.VaX0hEIJ-lkp@intel.com>
In-Reply-To: <202312021245.VaX0hEIJ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 12a2914e-8498-4733-b121-08dbf470aac6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CXHkNq8MgDLZnIDN2o9tJSYkHvJYdzAx1btHprnIjo4Klxya/sDpRLBowKTzgeTd7FNf4oVBKI3fLTA1yrjYOtpw7srpmFPT6WvHSD/V1h7X2eSHaO7ruV5jTOiMx8f27NmBd7XLVxTUtGC/olDlgWJqlcrUCBvhSaXQOsnzkaeLBBY1UYiVlR8BhtxXRO19MjGg69yc+XIJ2PXhPd7NbVA3JD1lahPs+44Gz9m/3x00D2b2FeWSlUq7V4SRWx77DEFsYIP5yQxCP+5ywM3VKp6Oc10aoBeLQOB8PiQVjrwjfSxasul6Vfd1/sfWiXJ79k69LZ5Tq9XDtMtFFWVBRdvQl6D7/U3QrYJS+7pFQXjlnFgQsxk37mABwldWeWmgbxzhUTvucQWA/JWzSKSx7ccslojf9/jfXvHGjW2jiBWo/UkBOHqRLyHR9r+ml38xz1A/4AlYmIQtaJvzy8N45L1Dfi1SxlA3Ufe9qH7k+y+/c+Q22u7bQK3Y8edp/wwrYpPe51wwQKIpuU10W6f5BnhJQSfAp80DcBfo2GKTlDlCj0L0SLSJkp/sRIT/pYkI3r1GfV1t9OlK9XLSUiBtUpmwBLc9q+0fruQwKj1pl0rGlGYUikzfoOPHsNk+oKw0R/K4+vstJdJhH+mIwyBmr3D1RqQuxD+FXj7HFwxqtJwI/dwmYDGBf5cpa4lRLrIr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(316002)(110136005)(83380400001)(38100700002)(8936002)(8676002)(52536014)(33656002)(5660300002)(86362001)(122000001)(2906002)(38070700009)(41300700001)(55016003)(82960400001)(478600001)(26005)(53546011)(6506007)(71200400001)(9686003)(7696005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D5o0UiZa/DYv2WqNwJzRx4gVI21827zW5e60Ns2KxyLbznUoqhTIVu4Mu0mi?=
 =?us-ascii?Q?X2ifAO8zvLuZsrNbVgevbibK5g5lMCFEJdX+jZdQjXxfV7NGP5LfRBvL/kDS?=
 =?us-ascii?Q?rlJLYSUgGMz4TURDKKdMTWhiOyOjd1BodIuPPDsUku3ZWD6mEpHXoPq9E+es?=
 =?us-ascii?Q?pBpVEaevojWAF0ddf52xAPwkDStQH6B6D7ktEkrmZkiy7O235PStkq6EuAFh?=
 =?us-ascii?Q?r1woyOVWfCdIUG3ATpudE9mlZ0DMLpwxtOjFf5i0Gz3ZtSn/xVKLpe28urrs?=
 =?us-ascii?Q?w8dIZvWGNrAZ20d31uppdkghNo6Fcso4al6/Jj1C3MxdKzRm1bh+tjp18Aqe?=
 =?us-ascii?Q?XEmjlpaS1IuKnHuGIVFp7I4a/QvF8OA8hNdcYCg0zsWHa8NZQeZpZWQCIB3I?=
 =?us-ascii?Q?QKfXO9j1GYaAxbq2N5cs/GJ7hB3wt6cyJo5urIAD7h9P+zQ6FoGedZWcFR6l?=
 =?us-ascii?Q?NCjO9ffoiwE61zQBocNNDVaAdWeR0KNx8Lnmmby9VygTAAJQYNc0GoNmLkqb?=
 =?us-ascii?Q?JrpgN6MUNHfaHK7KPIlYlo+GGDie4/VnNkKTeojJ2slGonf7G2puPd9ZasKP?=
 =?us-ascii?Q?mZ3/GiXdm7jBDdJ6OevnCbWwd1XTQL3ZUxjLne6nws61hkzLXSImxaLdJqvh?=
 =?us-ascii?Q?kErCO3Kc2ZwTbmH1zKm16CWqGnFOVZMeHM0mAlR37YVLmmsdPbamSa6r90oJ?=
 =?us-ascii?Q?9xTxQyTJh2NWzzvVXRtMq09kQIwNQt+SJfjsYYAYCWbt6Fy9uoYP9XBEkyrI?=
 =?us-ascii?Q?JfprPWUkJXaYYbxe35OLWA2GVZxepmryTz7ZUdvyWQrzldwJ/sj/pZWf97KZ?=
 =?us-ascii?Q?kej12sLh2Px61ROFs/1LsUYC4U1uO2CyqM44ig4httf6ohAU2UI+DocFIzKB?=
 =?us-ascii?Q?GlnaeHD1Cba+ClHWUB2pvTG5ArCdVZ5yDT9ZUI0GSLEalbSfBQ7bzGckc4OA?=
 =?us-ascii?Q?p45eG6z7Ky7kzjJPpYSor2+R1UCfqjs8bojqUzqqaNZhtBcYMJXaX8cx1Ky4?=
 =?us-ascii?Q?l7O7erlk78CLt7BHEKy4K/jfpr/U5XQSoScyc20uXbc6n5AGR3m7bGFo1d4D?=
 =?us-ascii?Q?1xJvq3Gx1q9M5OuxXF97XiNv8wV6lXTaGvlSMgn7c2EUZnw5oM8xGUyelVQh?=
 =?us-ascii?Q?OuG3J9T4kB4LpgPfxLhHfBcYOfkuxzF8pPGnjPvUMlbshPXYYAVWUrbh3fJ9?=
 =?us-ascii?Q?LaPmLK+y5E6Gfsi+X+pHDkc25cbDdvlTYa3aZFLqbLciE4RjYX9qY8C1ujuT?=
 =?us-ascii?Q?oWjKaYhDWEUbOJgMZnOXVQA+t7jUWmy+ZXsoXuLgnBp8kmMSiqU4CXaEipdw?=
 =?us-ascii?Q?HKoOii4zLGYV5li53784kf3VhkuobqNZMdP5LPo/VzfLkjOYWdaYDFp/LJ2w?=
 =?us-ascii?Q?QNxyyELBBfAuc5GcRjD3z9up/Z9S8D5RTSeWHsGlk5sMffVHLA8NzW0kP/7v?=
 =?us-ascii?Q?llUsapF9J1dbmIMpYrMGAzHssRpAy1MGqkreF4hztNBCpFVm2hvb3ivc+Km+?=
 =?us-ascii?Q?k7JdVz3yCjIrNWXGgJB110UqSO02jLfc64eT3zKba2D2xcQ3q3/fEYAnCkla?=
 =?us-ascii?Q?WvxGvgGAe4x3xuaL7vmseOPGPgA4W/dHs+wNxgA9?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a2914e-8498-4733-b121-08dbf470aac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:28:14.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmemDHRN6VIZ6zJLYyK4Lob4ljwOSAiFIuUOuJKpupYKCsbbWyyRpKmpNEV4D4IpavAvseCZU7IQ+dC6ssZvNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202310311925.XhpqocMB-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 14:07
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is in=
cluded more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: intel-xe@lists.freedesktop.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git new
head:   f30cae3de3b138849010f4e54d8800eb1cc080b9
commit: 088b462e322c581d33261a814abef7f09fc59984 FIXME: drm/i915/display: R=
emaining changes to make xe compile
date:   6 weeks ago
:::::: branch date: 5 weeks ago
:::::: commit date: 6 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021245.V=
aX0hEIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312021245.VaX0hEIJ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included=
 more than once.

vim +19 drivers/gpu/drm/i915/display/intel_fb.c

    13=09
    14	#include "i915_drv.h"
    15	#include "intel_display.h"
    16	#include "intel_display_types.h"
    17	#include "intel_dpt.h"
    18	#include "intel_fb.h"
  > 19	#include "intel_frontbuffer.h"
  > 20	#include "intel_frontbuffer.h"
    21=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

