Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF3FC00
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJsm2pbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702450513; x=1733986513;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0PAO5uMcEJi0y0OLU0DlHWpPahtvDQx+xiKxX4tP9OE=;
  b=BJsm2pbGLlVFoamOTJevhqj4Q2oK0jNB7qO/D7+ckTV0opVL6YCLmmyX
   B6B/NRv+qknyJKYcxSHkgNnJeXB5SN3mwqQOC+TFpbSm3tmH4uyN1myBx
   bsaWfcYqnluN866dwus3vu9rFqpjeBwEltpZNy256XbD7UkN/1NHpgZx/
   bJRLBFyaYhd9sZazzq4yHbWyzGvR0ULBBsQ8It5HEF5Xg/CjJfkKVOYYZ
   Ep0gm74LcrogFFMZ+zN1QabZFI3xo3RjvDEzo6AKha/EE6loWzHN1nWaY
   ArBh2wfFudIR8h5mhxzwUMAeCwjY/0r1c6i7orn2LM1SFB9gDzzRpTbqo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="459241527"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="459241527"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773842877"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="773842877"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 22:55:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:55:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:55:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 22:55:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 22:55:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTb0bqPDweiRbtv7j11XqbHJfaA/mTYAGH7Br+SywDohVObfZpFTCX4XP12hRPJE7k4wVvzdSVPVOlh+FqfYDXiOu1IHqjLT62Ae1D8luzoeCidTVQDUKe5CdUeuQJ12Qxov8Kofvb6G6h/2CVWX++u1p+/sJJCG5EZ5uG1zbhmcPb/E0WTEA/r8gc2X8EQHQAqDpZqzULCT0fI695BK703/CuAa8vJBIlLzZFF0xzkbcBRujp/rER1dsN1oXqgoFi27clVbIbm93uHt5tLK5Dr3uAvQxBRNzymXAmjW4lCGcW9hRo68NJaFoWD+E2KoCY2ksP2+WRyiPTSzgZjwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiO16UW4/keGnMar9ZNJG4VaxdxMeH/6Q43pfdq0nSg=;
 b=e+d0o0PXn8mpZBtvZfjrZOFCQ50OaoTpSNR2hXCanJEKhnJKbadftw4SGDVKCXURbwAxn00+MF4HD5+mo+2h9IPCiEo3z+Bgxbmbek5GwyYhfSbexmqSOyywMbkUWjBnV9qTxAb7xPTkMrlV2e0y1TpPUIE9WHLeEHQQhYfnjCiW717vhScFy0LQe6s6esKQewxuz62smfy7a0FZJ4uAukBj1cZDPww5yQwAMAJanKehu07fTrET228xoHWPjybmibRYOpLSQ9dTxAm+0aCLUFAHId4WDLTXi1kuHXOi6MiVfuwwJdZPFkcNTcZi9vDq2H1ynL3jboBj8XRIBcZ4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 06:55:09 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 06:55:09 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: WARNING: modpost: vmlinux: section mismatch in reference:
 sifive_errata_patch_func (section: .text) -> warn_miss_errata (section:
 .init.text)
Thread-Topic: WARNING: modpost: vmlinux: section mismatch in reference:
 sifive_errata_patch_func (section: .text) -> warn_miss_errata (section:
 .init.text)
Thread-Index: AQHaKfAcziW1/ejPwUW8zGfiZukMI7Cmzf9g
Date: Wed, 13 Dec 2023 06:55:09 +0000
Message-ID: <CY5PR11MB6392E0D51AFA4E31FA18CA64FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312082347.P0v8XCch-lkp@intel.com>
In-Reply-To: <202312082347.P0v8XCch-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH3PR11MB8187:EE_
x-ms-office365-filtering-correlation-id: 3148857e-a7fd-4f05-e10e-08dbfba87257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrXR5aDul3m8174a3DNvg3TTr/ONZX+V2Jh/sKz61C7JX8ad2yAppN5639saj5XIZjLw6DoVYLT7sxCwrXnBIlh2RUCUAzNVrpCW2/oZnLVsE+Gt3cv4+TTeAVpvgrOItCMq58h+11jd61VUGs6wrAASl5EBZcAFMLyAytj/BvuZTeR2NfiSxW2kWaRIfKFfiU3QH7ZW0GGKwY4nF67aR6rzfCMqIZdTR77byFlk08GX4hIz4ANwSGaC6SCspSa2+FPQ7Na4zNJcaHa5kmM5P/P1QmF2eIa2kKJKNOb76fLzj6A7d5A+yBTunr+ZNsw+Mdd5BQNKTha/9VNnxp/3mBUK2TifgL82A3J9xVBI4hmmksyBDlqK5JeRIZImUf7HeG3eM6X6N3voHVuJKfowMF07znDe7lmks+DiBVSjpQu+pnMqzff4Yo7yt8AEu+GSzJ0HRzBbVTduubQIcyA8ywrqYWUe55Q8SQEKaFjPaHaFqjoZhjmOpnzKgoNeoN4Cbx1JpRCh/Y0ZUvxLTyOPbr4zhNUPBegpU3UP8nLMAuxflJKTQsMddwk/NmzFcHxIMgN5SuRo6wH6VTlHuf6dXt0NQ/daZKYIy+yMkTyHUa4CXSO+Z8ZNFm8IpixM5ungyiglDL769EYVscppAANQyFY27h0T+Vh3TQzxC+D4YsmWuMbgC54d7UsCnc8yFilC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(55016003)(38070700009)(76116006)(66476007)(66556008)(64756008)(66446008)(86362001)(82960400001)(33656002)(66946007)(122000001)(83380400001)(6506007)(9686003)(53546011)(8676002)(7696005)(966005)(2906002)(38100700002)(110136005)(316002)(71200400001)(478600001)(26005)(5660300002)(52536014)(41300700001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YKPaqXRzIAtvW4HWNdhz//U3F/c1uP556XmGSFea+WKm1/h5x6ybbrip2ktt?=
 =?us-ascii?Q?REMYMSOSuuENhVNFTh7BjypZyzZ71++1z5v02mtdS3Mvj9pdVkK78m/tdikT?=
 =?us-ascii?Q?Qx/gztwfiYshkhw2OH0fghnOMtMt+nMTqh3EuwKkHpHg/EA3elnEYwqbe03s?=
 =?us-ascii?Q?arHl07BZrd/Gi3KpKC47q7F6NXp1A0kvFABmkdENev1K+Q5IVP/0NMdo5HCP?=
 =?us-ascii?Q?XocjxoD4Q+uvIl2K6GtCLuxs+i7PelkqPv2yF1oOeWfqUKuQSZ1m9v+pgczM?=
 =?us-ascii?Q?DYotcCYOVrvFTjgftvYVWTimRGz41fWUduPeYeiqyN2Lbam+xpOwTmclnwsq?=
 =?us-ascii?Q?6DyyfXOCKVfzH1nVxNmJm/F7bvSiTJdCK9iACP2vnEpU+0CBuhjmbpr0/QKJ?=
 =?us-ascii?Q?DUGMt75JQlaozf8T7DC9B7WIWwd2FObh2GXFVRh/RfaDOUaQ0/kq5n0JWagw?=
 =?us-ascii?Q?B8lP6NDz2XxYqCNYf/jM/+nZOyi4RfRUngQaAYfxssC8DMNLpuYqcHICi+Pn?=
 =?us-ascii?Q?boKvLPI95nLGo+F5fdkT5jVdStXRAdFD+VvuMyaftU0lfL7z4dgZt4l77Yld?=
 =?us-ascii?Q?ljoqkCc/1HcDS0r0XoIuwJgscGYfnSbTcyXTaXwrZHTE/RC6qBMOs7uh4Txi?=
 =?us-ascii?Q?E8DZ7m+9oBxAKetFVjMHh3fhPFOqqQqHdNfiGTXaeqpANSWJ/EwGD5VlnOPe?=
 =?us-ascii?Q?TVp1lWBnH1rCkOcjKqgAW8sWTpqmRSn+jKQgu/zjDVN0RoKX0VhAheU5RF8X?=
 =?us-ascii?Q?neDjQh9j65AwLVG5lvFjcPgj8BWAS5ySggOcCZb5R9ElPsGuOIcDVH/xHmNB?=
 =?us-ascii?Q?pG6gjsNGjC+1/xa9wdniOi52BqiWgcrc5XhlDcDpRgc3Wbuvfgksa/ScMgYf?=
 =?us-ascii?Q?QjZkARGgfe//QtCncxH2vs/eFwakABGW+CCCaHCWkODOH7kYpHoqE1dwacZz?=
 =?us-ascii?Q?U+b7I6p2LbiIjkOHrkkwiedE90Ex7w8z/OTMBtyEDcdkS0lhrRNh5NcUsg8l?=
 =?us-ascii?Q?07fiH81fX/Giq4m6zxo2OyW/wv2UTKzlvo0Vh5jwzoxTFXC1Qf07ftHQa4xo?=
 =?us-ascii?Q?/ozWzzy34yFILNBFujbIWetgO6AdipL/uyaMrwabiQs78LyY3WqyZ5kP4wox?=
 =?us-ascii?Q?pqt9LCMVYZ/8iraxkgJnx580Iba/mn4aZLVICs2ZZtI8aGwutp5bI19wNDlT?=
 =?us-ascii?Q?7HXGnQr57hrphK2F3Xmn+IyPznquRdLYq3EibssAEoITM/Y7sfIWLIUOTTLr?=
 =?us-ascii?Q?axm1ou+3MvPIPPMmKWdw+UhRgJuiOb3D0qlphX5kpP+78amaPSl3GW7xCxZZ?=
 =?us-ascii?Q?RVnvaXMT+mEeeALd9i4aw+M46RlZ3U/Pc+xhZM/W3hQe742+mOeFUpbjolsn?=
 =?us-ascii?Q?TLx9bYs9zVG3EcjaAjmCuJ8aZJOGDiehbjP4qMi4EvnV1H+8e2p7sV22DL7F?=
 =?us-ascii?Q?8tlJvYQjxeGlQLfN7qSvUi8q0my1SxepbJhWL5XrJhdZTGCW4Nr4MKBFpj7S?=
 =?us-ascii?Q?qmJCbM45Oz3SPxgPo8UKzMHw/uKm4yzvZEWH7bqoE86IVRaC4BsPd3GcSEJE?=
 =?us-ascii?Q?lwCqNHeCiJP9RHjMAeQwGkVPMj5ifoiE16A7oo6f?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3148857e-a7fd-4f05-e10e-08dbfba87257
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:55:09.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YpVaTAdjHLWaNX0dqW+waettjqZ5ar4JPbQGpPrP2TSWMD4HQTTnwrzSQrmMmL3QaMZzEBbhckHjF9o6Z7vckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
X-OriginatorOrg: intel.com

not_report

This is a modpost patch, not the root cause of the section mismatch issue i=
n sifive_errata_patch_func.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 9, 2023 00:02
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference: sifive_e=
rrata_patch_func (section: .text) -> warn_miss_errata (section: .init.text)

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 WARNING: modpost: vmlinux: section mismatch in reference: sifive_errata_pa=
tch_func (section: .text) -> warn_miss_errata (section: .init.text)"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: 94d6cb68124b7a63f24fcc345795ba5f9a27e694 modpost: pass struct modul=
e pointer to check_section_mismatch()
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r112-20231208 (https://download.01.org/0day-ci/arc=
hive/20231208/202312082347.P0v8XCch-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a=
5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312082347.P=
0v8XCch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312082347.P0v8XCch-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: sifive_errata_=
patch_func (section: .text) -> warn_miss_errata (section: .init.text)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

