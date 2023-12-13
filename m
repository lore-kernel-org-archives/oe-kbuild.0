Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D9FC00
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 06:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFrDh//E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702450350; x=1733986350;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=F2r4R2R4e5J5Zw84W6t/ujIOH8+fbWebET/AemdFzEA=;
  b=GFrDh//EmrezuzKg3EKKJcHxrDm3dkQh7aDnlMG5CmwY7byq30gtqVbt
   4Gmhje6sBm4QMyIMvpnR00/aYlwdnRxPLrC2AOHDwUCykTI0FrjGZ0dQG
   6dUMjemH7RMy35Gsz+NIE2G61XBb1K9K4skzIXcz/nsorBV5TFl+vQZc/
   19F1XIgPlxgI2WylyhjxJ+E4sIPoDZzicZs9PKgd9QA2CKqtz3TvJC6ym
   +iD2STN6stDOcLlEnehDjAZhPwj03weVEV/9FBojYaRg6/eBBjkgy+Dxi
   0VoIWFE8xZCgB0NzQhFM/By7q+eO5VYmVV9QroPnXD9BWVEFNt0fz7tJ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375075895"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="375075895"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="750001399"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="750001399"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 22:52:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:52:28 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:52:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 22:52:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 22:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaS7FC68WSM+3wBZUk8OiWVakWWQTLF2z4RCeUhz+bT+VKEwHF8Bl0QYLXurrutw+p+yMV0Lc+7aAebv4Tz9JitNgbv8Hc145O0/Og6NVhdPLy3mUGLL+rELX7R5lJPZRapBWOaTNW28+w8qXxaHSmqPkpBXVeDlNAUA2r35v7oyx7aE0Fq3Tvp3XA+/Pqy186PzEoFGtcyZNX58A8Nv+8X0DWUOcIO7jw5VyCHcU2VIn8xWpzK1fAxcTYchVmquFjcp0rB600Rmxba0W+UNpkNUzH1Yu2DdtVcEXY7PTCiLTi7aJf8e4a7dDs7UqgqcgAxfm0XM2eoHRyZPYPVejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM+mexn89qcOa7TQ/YydSrSB/P/cUonS7Idd0ADWguo=;
 b=CQ4WdEK4asY+yHIxmzz4LDdH+xyzl4kV7+uPko6IyRkNet+cLtKzykwofUWrLAJ2x7MoE5aYHX8NU3iWmwEpkbeMYKS7woKR4uIevxaYHD7W3waY9M2os8aP4R92bHza39b+ihTKGuSHZk7trwNy1VWp591D/bCwFVPgEL2pQ1CAEo5I8aImfQhyioW6c27dWLAMes3b9a8IvHPcZjInU+PD1HLOMz+zc04fKpuiCFPX8eup0vgKCh21b6FfmKjHkGuBJTfNkfaXOWgDh4LKO3P+Y/ynrrdBJMPouQOeWysulIGYePuVJvFYxFfuECK+qEkqQX3RHZeQKn7fvLn7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:52:25 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 06:52:25 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: WARNING: modpost: vmlinux: section mismatch in reference:
 tracing_gen_ctx (section: .text.unlikely) -> initcall_level_names (section:
 .init.data)
Thread-Topic: WARNING: modpost: vmlinux: section mismatch in reference:
 tracing_gen_ctx (section: .text.unlikely) -> initcall_level_names (section:
 .init.data)
Thread-Index: AQHaKd/AYb7QWZeHKkWEPtt5WdZmSbCmzfcg
Date: Wed, 13 Dec 2023 06:52:25 +0000
Message-ID: <CY5PR11MB6392833BFAEF1A0462066DBDFB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312082243.uvNpkQo0-lkp@intel.com>
In-Reply-To: <202312082243.uvNpkQo0-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB5249:EE_
x-ms-office365-filtering-correlation-id: f3ff3aca-53e5-491b-2c70-08dbfba810d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ttiet6icMFTLEra+uWbN2ESqF1wU1Jeur6pjYji0NoVwczufutJgCMa2wKV85wMeBlkCJoEAEGbO4rBhUC9igEReUizvliAPwpIodRhtiSz+JorZ38wVtCUr7rmyHeLWzGLGfBuud/ZX/9qF7/ZP39yBu08kfV5R4nhVkGprU32dXIFi+S1aYfdvV9tXb9HqAHhkUTyaT15B8eaggaxvvRfH7IUcP++zaNFnS/ZmT4veDgOwdeY/30F8pJzHWQYHheoQQ4+6YMOjVudDJqX/8sXyGzeW4aU3ENPwefHUC6aLNrKBgFNgrwIMmthPGsD56Bjozgu+UcTPDn2XiX1gdZDfQhmP1xQ+DOlYht+7moacKlTy3m64P8UcpJhXQjLek1Xz+Y9K5gD0veLfZr5+SpMroS544FTeNmQxRzFTyOFKb/oc+vw7tLXSpvnAKJODMJk+WQS7AtnqbZL9Eq+UUvDv9i5pKNsa8A6g5KPBZZwvovvUCn/PWPQ32e4OhkZNXDghBGqP/xC+PS/6Barbw0DCY9u4PSsgi4PaRCYj5vZHsoVE9XluZjQmiLMI6ybBe8HsDbb1H/zxhzqrVj8sopfUSf+fE1a/Gv/GfUcYumBkiY/F9gn7lTAAPGwREUOctmPpJ04hhlRK8F9KnibA1ycomyvWZKXjR1piTz3+0fkZrHilZ9LEHQTXTLndSgGL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(26005)(71200400001)(6506007)(7696005)(9686003)(53546011)(122000001)(83380400001)(5660300002)(52536014)(8936002)(8676002)(41300700001)(2906002)(966005)(478600001)(316002)(76116006)(66946007)(110136005)(66556008)(64756008)(66446008)(66476007)(33656002)(86362001)(82960400001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H60Pkdbi3BpAR2cthSEOmfmKcWPwOqQxZ0Qxwuw3fIIch/h9QFoboLWhkbq5?=
 =?us-ascii?Q?TzrBWrcuVEQq+W8CUgi5ahfL3OlpXOiJ4vQtK/q+4TFTpE98JKFn5jynsVA3?=
 =?us-ascii?Q?WsTyOLDVTHbMPZzgbeafkpnAxXOYYMSCsSHZHHuDrKgA2U8OwqVMWp7KLdxu?=
 =?us-ascii?Q?sY8YpSyRY9QItrS7V4tD7/1k9sQc1c5Pj2+btewKkMkA/8yCtqkAE61UcKJ5?=
 =?us-ascii?Q?VSgqYBzqqIjTIiwe+cSunhiEePsHt3gVTG7y7vGdEhqkZBtLyxkHPX3lLJI8?=
 =?us-ascii?Q?yWFbk1kT5FqEAyZvC4laGc4Y6B7nShmahjvKlECpa82ERgivMEJQjv3/8Lq4?=
 =?us-ascii?Q?oMMaKPlrdLTAtXRi127anRqgwgkib4L9n2gP0rqXq5y9AeVrvYXrmpbG7h5A?=
 =?us-ascii?Q?FOnuQAtlWo2EBiiganKa5T59ch37kYRLCPtE8CAdDAgoNbXXeIEW2l3q8NKG?=
 =?us-ascii?Q?WD+GYq9jYFI1WNd4wbcCIWoQBg8V/kJH1NHDXbMCCRarpIl7PgEEMCqOHy60?=
 =?us-ascii?Q?bCLFcxYTutUbAeBl0SvlfCI+sGcqSn31/E/rPxB0eJXiplE/pRzRcmU8O2Zj?=
 =?us-ascii?Q?K7Owfelnw2S7MJjZqBQfivqxt4A9MDaUOF66QzVaYAxB9m3p+bLLKkkjVEUn?=
 =?us-ascii?Q?hnAEGY94nvdF/mxZ2nsUSEt2BfR+mUZ/aTxTaRGUKXkwlojrEZGtlz4VvZHf?=
 =?us-ascii?Q?lnk1j6ETPGWwr3FHFteze2ZlkLw3CBw2LVRZ7bGJM2V3JOnEUTi46zbpv5qv?=
 =?us-ascii?Q?+1c2TBW49G6beZKat8dGzdoCapwwwISBCW59pQTtpWhwX8laX+8MGn6Fttez?=
 =?us-ascii?Q?bza0ubWAOM/5Ij132L+qzEmAcTXhKH8x+ZB1clqvD7GvXgTjaEkzGs0g6HDf?=
 =?us-ascii?Q?bR2h1viYUv7zSdltqlqfROY2r5ietMqCmeW51sFhz6R22xEvs+/129fiet9D?=
 =?us-ascii?Q?HCoidQTlWV2bDzF/JKjMJPGmfvpmFHCzOFZfpNcQd1ElLKlEGrO7b+uqMo2r?=
 =?us-ascii?Q?UDGkENhA99z8PUEDvboeSZ3fnPKYHOfvnY3k4lckofefw4MVG0ELbz3eHBg1?=
 =?us-ascii?Q?Jh3IyZYFOy0Ok80Pyljri4dkNzfo30rV0x6NNpp0xBTFcL2aGqpbPqMFKaar?=
 =?us-ascii?Q?vlUBbD08wH0ZXhGodHa8ehlHjk+6rydEXbX4MHyU/TeU5uMCck7PYd74S2Yg?=
 =?us-ascii?Q?3ZkHNnxEZmvNmsuhja8yCrumoh1n/iTI8s6sYZ+jEu4xdaE2OS5V6Mdzbqir?=
 =?us-ascii?Q?1FuENHC5dLyxc/DUWQgXN3g69Ul/+CwLGek4NdhjCtR3o0yF5hyBnL17d1BH?=
 =?us-ascii?Q?i75fXo3a4Mhfd0TXhGsCMXOYn7YiROniW6sstfzzNVFziiuENoG5VBGTlMRC?=
 =?us-ascii?Q?bJetbCaacmbOzrRHKKY8+pFDI3rvhGDLkoI+cf9fer9HOHGxBSSkw/KXQ4sy?=
 =?us-ascii?Q?qlT582Z/RdInGHKAdINgWwR6Ix0FE3e2XqOMQMxrDqznW+EStecQvE19Wb9m?=
 =?us-ascii?Q?7Kx4acTDLvfOkpcL+ZPr1km37i0/lakmaIL48H7wt8VV1/pm7RIzGXYrvkTS?=
 =?us-ascii?Q?N8giwPymsrNSEcSRERAidYr4BJpBLjldBhUO4u6W?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ff3aca-53e5-491b-2c70-08dbfba810d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:52:25.8376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMVFr8+iWAQWMAguSaqPr2XWFouaABK29wvkATqeTB2bS4GAZAC1oYG2PDGM/6InsFkAZ2zxrJfEmWC9yKb3WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
X-OriginatorOrg: intel.com

not_report

This is a modpost patch, not the root cause of the section mismatch issue i=
n tracing_gen_ctx.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 8, 2023 22:04
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference: tracing_=
gen_ctx (section: .text.unlikely) -> initcall_level_names (section: .init.d=
ata)

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 WARNING: modpost: vmlinux: section mismatch in reference: tracing_gen_ctx =
(section: .text.unlikely) -> initcall_level_names (section: .init.data)"
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
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-r122-20231208 (https://download.01.org/0day-ci/ar=
chive/20231208/202312082243.uvNpkQo0-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312082243.u=
vNpkQo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312082243.uvNpkQo0-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tracing_gen_ct=
x (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

