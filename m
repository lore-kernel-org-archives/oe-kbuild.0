Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3E4412
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElY0S/Sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699924449; x=1731460449;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8+PonHcFNCppaqgerQR59Ws2XVpo29wUhIyF3PJ9pUQ=;
  b=ElY0S/SmLhItNmlbYeXI8jCS//bJqTVTmkUvIfkunWNFDqgciL2vJwuX
   dHRhgqXOh7bKOF95cG3ucOAIHaOoHhKaxcHLQ4mV9+vc36rOjFJUDdr3H
   SEo9d9bf69u/lboq2oVT95I/EiATHOxWLUhmO13fTKOcCwJ0uMi2gy+j/
   l41CbWsD4DPX3ZU6aax8WktqwJPp8PyetRWMnDFdVXbAKK1XlVXIGpvy4
   HvF9krv8ZXgNHmDaI3QzhL/n4HRRtqZZ4ycNCUq7M6aPHKDfJnM/HYiva
   FysjLaJIw2cHfIAFisIQIT+AkrRyzOubikyQ6UZqeYUmdu78L+kQtLSoF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="457036241"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="457036241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 17:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5626124"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 17:14:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:14:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:14:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 17:14:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 17:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUt88MqWv/L+qi8imxAi2AvB7+F4JKdJ7LkgN8iQGY9l0wtise7DtWCJMjnFmM8BWK3IXxrOtlU9YmM8GhJ2fkVf1HU52SD8jtjxYdlNG4XTjd7A7Peq0J8hipa4Xvy/gCws3G/tQYdjm/3LOXaivxmFFAutuImUIk2o1ilx5cWWD5T8u7VJxN2ORd3RwmF1WS3c3tTx+tXXkvzCep4dJh+nonxza7zBQKp3a3KQWFg0R08mbDEhoxwRwrQtZrCIaqM8v2B3atgwsjJjowW2RSm/HbvismzLQKIQdUytRxly9pbRXHTAKqyXICaRgFEpH5nIHDucphCThYWxUJzGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho0NjupeG7ZiTdcm6xi393leCGwnUXzFE4EQdw5qVKg=;
 b=b6BS5YY2umaGYSHQtRlHHynOmUuIOF6t+w0051A/R2ITAeZG7B3e4vUyX+gQe+MOj6LVAbScnlY4fP00KO01bDQ4Ruub3SlEyLLuyy6NA3TlL21S7XA3d5ii4D56EOyRRNPh25FDIy5SqTO22/ve/qxzoLyiHRaqKQYFXIZtx7UVfff0MWQFJuYblQqIiFQxITByhvsLVvgYqLpFyiv06vJSfLlru6u070UVCosOYvMDPOMm/MSXtpT1Y14hf+30NwgOM3u7+dEq8HyTE/uAF9CPM/wzG7WL7pWyvD71FYPHT6I7Qu3do2y2pHFYEToPF4DnzbuAaEZ/F9BMB9cnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 01:14:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 01:14:03 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: xskxceiver.c:841:81: error: format '%d' expects argument of type
 'int', but argument 4 has type '__u64' {aka 'long long unsigned int'}
Thread-Topic: xskxceiver.c:841:81: error: format '%d' expects argument of type
 'int', but argument 4 has type '__u64' {aka 'long long unsigned int'}
Thread-Index: AQHaFfE8wspKSxYjLUeK6LlhUl3/OLB5Ah4w
Date: Tue, 14 Nov 2023 01:14:03 +0000
Message-ID: <CY5PR11MB639232CE5F460D2F6ECC72F6FBB2A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311131351.7mFKVwOr-lkp@intel.com>
In-Reply-To: <202311131351.7mFKVwOr-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|MN6PR11MB8104:EE_
x-ms-office365-filtering-correlation-id: e3a2c34d-2c33-4808-833a-08dbe4aefdb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J0ZwuH+1JlcSr1v5frujT0O0KoeJ0K49Yg4NUyHa+QpJDP/3NcLwNe/QpkdA1FM2nNdu2wFprT/70g9CFCaZvqJzjWPWXmAYugoOZjlH85pJ+tl4RYMJFS7eP6EDJHuUbHDwQ+3CE8h6Iw5m1oauwkFfpNr2aLhgnUg1rei1WDCbtAyoPSipsnWV362G5iOysgLKjROhpX2CT80SyMpb3f8iWc1GUkumYUF/5Cz2npuBQ6DUIwNAGYCLPuFrNcf7rH/PdioeUT9yCCajtR+MV0Td6HKKNSeJJuKwYyN+Hx89S2QojrFtqUSAEW9KWn6FLgLEidYisJ42grNT67296OzDdwV7gq4I4TuEf64Q9Mc1QSLTNGJljOuB+nwSSQllVj+xdfBOz7qJnH9kDEGpOnCQtoN4b69EgOn0xW2M0fBW3l0xKrLO/wVv7g5kqjS4y/6wDyYeOG/WnlSm6DD9SJiNC76DMKMpkPJPy0RBE4an6QZJdLBXkxFxTRq8uj30uLQ6nMkFDnMXkIIGLvoOAOaVEmqdFIuKaebzE1GRyNa+z9iTbrd20b4kLoytGi7T28OIKQP84/zZQRK583sqm7UUDt1y+BKe5gysKt3OEz6Ulj9TgAeXmXCuJyma7ejN5BZhWqu5duQ98y7p2obfFD1fYVPdq6F9XylZK1LktZk1KfhZ7QYHPZdSJeUIVBXu7O2Okg/GhP0pVt/eWgsSIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(451199024)(186009)(64100799003)(55016003)(2906002)(5660300002)(52536014)(83380400001)(8676002)(8936002)(478600001)(66946007)(76116006)(38070700009)(66476007)(316002)(66556008)(64756008)(66446008)(110136005)(33656002)(41300700001)(122000001)(38100700002)(53546011)(71200400001)(9686003)(966005)(26005)(82960400001)(86362001)(7696005)(6506007)(66574015)(223183001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Elz0SxMxd7Jl1apceCro3ee4+gBcTNW5TgbXFGN2AvaXCHQjmgWeMDVHiV?=
 =?iso-8859-1?Q?kHSy96DQzqRcz/t0OIFmlCYun0F3/W3LrxfeTvkrI+Dq54lIEaLDdrhkXm?=
 =?iso-8859-1?Q?NaML1He8aBOmpNKjzaDVUWwxwMdcH1Y4vc49YmR622yfBBOcpRaMHLY8Bf?=
 =?iso-8859-1?Q?TJcNh/sDq5qaJpJTqrwzC8771IxAAsE453SUt2wJn5CGRm6oekwRONLDFl?=
 =?iso-8859-1?Q?ykTaiv+8VwR96z1W2NIH41r0bY+aWxa9zbx4ymInijs0CjpcKc+lg4uzd4?=
 =?iso-8859-1?Q?tQLutsMN1xtXSNgBMi6823YC3mHWbGZucGN9tnLziIfMe1OYCLML8aQdwR?=
 =?iso-8859-1?Q?wmklMh1eG9wTAMF8nrCoqVmBg7+1izoQB6IEKlQqoTNjzFvhkvr+Pq0TfW?=
 =?iso-8859-1?Q?nZMkKO97l6mC0dHZqHvL9g+kyZElAhs5HXUV/vybORgV5YmDt4KmYR0W3j?=
 =?iso-8859-1?Q?Nowdsws213RJ0ZwjNjpa8mtM1A5ALnWAnL4WjXlIXSnR+kJf4BDzQ105NW?=
 =?iso-8859-1?Q?je/WThL9PurLcdVl8MWu2Rvha1g7el9BMcmFj+nNNNawx4ADv6nRt9POt9?=
 =?iso-8859-1?Q?Tf3Vdbs3XGtz29CFppYEHkljuCOTfdLFfF2IdnEel7WEr4LotwDQMMy4LO?=
 =?iso-8859-1?Q?OVy6FdGPvKyP5WYvMwGDoaecWfqcfh51Mol1K4NrMI0O+Q3u/7hr64dcA+?=
 =?iso-8859-1?Q?jk15Z/xyP+wjMBNtfhJ9z/ow4RhHQXgyyI9NVFoUFp9j40pILGddtIKZJf?=
 =?iso-8859-1?Q?/e/tuXn0N5aJupt3UCLyFcSuWwN+IT+/4rLaDG/3Ry8OUB33JHd52/6V+d?=
 =?iso-8859-1?Q?cQ/BnxpP9hIneaNu+ZGgcgyTywP2+nrF9bzdQ9Rwa7EN2IeLmI3aCokgX8?=
 =?iso-8859-1?Q?/rDmPQZdLVHjsqvzwxUAuF0zLi/vMZNnj9KGFH9QdRjS8x3GOAOdI3uXWH?=
 =?iso-8859-1?Q?YnY4YV31QJtGorvXSzyspRxNCBpu+Fadq/TiHTp3Pwwb4yrfO0ebz3Ijx1?=
 =?iso-8859-1?Q?noBvdsjJ2HTtVy2s4HLqUkqShrwO5MAK0pPlsWPcB+034CEPN7WFiRYKVl?=
 =?iso-8859-1?Q?IEnU1L9qp+EWHTYT/VEmFf20Zq6wK+dljfc143PN9Ycpjm18kby2LL9/yz?=
 =?iso-8859-1?Q?E6lcLtpkKb45gPTnK7kiq302wLJXX1A7LqiJVoLFKYYvdkg1qrYZdatvMI?=
 =?iso-8859-1?Q?0Et/Wzu16T1x7ecznDiE/ZB+dLBNinHW0dpDB2hUkfrwvQLqgmgWcOu9KF?=
 =?iso-8859-1?Q?JpxbEuubAvpKb3mtDdoRZLs5oUhcJg8gB9LAyK/gmAbRG4dphrEWvTarF3?=
 =?iso-8859-1?Q?wfrFNkh2iyCs4cKbondSd7ksXDszxZ1XjRghOZunccV5LCSmpoQz+T0UsY?=
 =?iso-8859-1?Q?oSpzz/XBEVo4lp+W/9k4c2rwXFeOYuFcbdtAc1DBENyu9054QKhTgE3qFy?=
 =?iso-8859-1?Q?qc0PQo1lj+DyeH3xK/+ZpLyRHmp5KM4GhDwbUDXEQFqhy8DRaGidj3Bb6+?=
 =?iso-8859-1?Q?Hnn3UkVO5Q0dnqEKt96dbyAtKG+hN717+HtQW6sJDMbS6vMD46yayp1AVy?=
 =?iso-8859-1?Q?BET4WSsFmqj++onxgLuc3Drult7fmvgp2VpH6nydh4DcPSkyTYoUHCbP02?=
 =?iso-8859-1?Q?3krjPNoWKTgaD1W5yfCMzk6xneEzC/G3We?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a2c34d-2c33-4808-833a-08dbe4aefdb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 01:14:03.4616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiuE3OQL6W8/7pXCBVhT2tvfuPGDgZ+/1gVmWG+KWQLOuD0SljVJOlk+cDDl6/cIGDEYcQvHFSLMl82cW/Oj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
X-OriginatorOrg: intel.com

not_report

The commit message says this commit can expose a number of pre-existing iss=
ues, but these issues are not caused by this commit.

    Adding the attribute and compiling all selftests exposes a number of
    -Wformat warnings which were previously unnoticed due to a lack of
    format specifiers checking by the compiler.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, November 13, 2023 13:19
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: xskxceiver.c:841:81: error: format '%d' expects argument of type '=
int', but argument 4 has type '__u64' {aka 'long long unsigned int'}

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Maciej Wieczor-Retman" <maciej.wieczor-retman@intel.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: "Ilpo J=E4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Reinette Chatre <reinette.chatre@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b85ea95d086471afb4ad062012a4d73cd328fa86
commit: e33a02ed6a4fbadfa7813831f1f52874c991d324 selftests: Add printf attr=
ibute to kselftest prints
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231113/202311131351.7mFKVwOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311131351.7mFKVwOr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   xskxceiver.c: In function 'is_metadata_correct':
>> xskxceiver.c:841:81: error: format '%d' expects argument of type 'int', =
but argument 4 has type '__u64' {aka 'long long unsigned int'} [-Werror=3Df=
ormat=3D]
     841 |                 ksft_print_msg("[%s] expected meta_count [%d], g=
ot meta_count [%d]\n",
         |                                                                 =
               ~^
         |                                                                 =
                |
         |                                                                 =
                int
         |                                                                 =
               %lld
     842 |                                __func__, pkt->pkt_nb, meta->coun=
t);
         |                                                       ~~~~~~~~~~=
~               =20
         |                                                           |
         |                                                           __u64 =
{aka long long unsigned int}
   xskxceiver.c: In function 'is_frag_valid':
>> xskxceiver.c:859:55: error: format '%llx' expects argument of type 'long=
 long unsigned int', but argument 2 has type 'u64' {aka 'long unsigned int'=
} [-Werror=3Dformat=3D]
     859 |                 ksft_print_msg("Frag invalid addr: %llx len: %u\=
n", addr, len);
         |                                                    ~~~^         =
    ~~~~
         |                                                       |         =
    |
         |                                                       |         =
    u64 {aka long unsigned int}
         |                                                       long long =
unsigned int
         |                                                    %lx
   xskxceiver.c:863:70: error: format '%llx' expects argument of type 'long=
 long unsigned int', but argument 2 has type 'u64' {aka 'long unsigned int'=
} [-Werror=3Dformat=3D]
     863 |                 ksft_print_msg("Frag crosses frame boundary addr=
: %llx len: %u\n", addr, len);
         |                                                                 =
  ~~~^             ~~~~
         |                                                                 =
     |             |
         |                                                                 =
     |             u64 {aka long unsigned int}
         |                                                                 =
     long long unsigned int
         |                                                                 =
  %lx
   xskxceiver.c: In function 'complete_pkts':
   xskxceiver.c:956:69: error: format '%llx' expects argument of type 'long=
 long unsigned int', but argument 2 has type 'u64' {aka 'long unsigned int'=
} [-Werror=3Dformat=3D]
     956 |                         ksft_print_msg("Last completion address:=
 %llx\n", addr);
         |                                                                 =
 ~~~^     ~~~~
         |                                                                 =
    |     |
         |                                                                 =
    |     u64 {aka long unsigned int}
         |                                                                 =
    long long unsigned int
         |                                                                 =
 %lx
   xskxceiver.c: In function 'validate_tx_invalid_descs':
>> xskxceiver.c:1343:72: error: format '%u' expects argument of type 'unsig=
ned int', but argument 3 has type '__u64' {aka 'long long unsigned int'} [-=
Werror=3Dformat=3D]
    1343 |                 ksft_print_msg("[%s] tx_invalid_descs incorrect.=
 Got [%u] expected [%u]\n",
         |                                                                 =
      ~^
         |                                                                 =
       |
         |                                                                 =
       unsigned int
         |                                                                 =
      %llu
    1344 |                                __func__, stats.tx_invalid_descs,=
 ifobject->pkt_stream->nb_pkts);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~ =
       =20
         |                                               |
         |                                               __u64 {aka long lo=
ng unsigned int}
   cc1: all warnings being treated as errors
--
   In file included from x86_64/nx_huge_pages_test.c:17:
   x86_64/nx_huge_pages_test.c: In function 'main':
>> include/test_util.h:40:32: warning: format '%d' expects a matching 'int'=
 argument [-Wformat=3D]
      40 |                 ksft_exit_skip("- " fmt "\n", ##__VA_ARGS__);   =
\
         |                                ^~~~
   x86_64/nx_huge_pages_test.c:261:9: note: in expansion of macro '__TEST_R=
EQUIRE'
     261 |         __TEST_REQUIRE(token =3D=3D MAGIC_TOKEN,
         |         ^~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-typ=
e-not-at-end' may have been intended to silence earlier diagnostics
--
   mremap_test.c: In function 'remap_region':
>> mremap_test.c:341:83: warning: format '%d' expects argument of type 'int=
', but argument 2 has type 'long long unsigned int' [-Wformat=3D]
     341 |                         ksft_print_msg("Data after remap doesn't=
 match at offset %d\n",
         |                                                                 =
                 ~^
         |                                                                 =
                  |
         |                                                                 =
                  int
         |                                                                 =
                 %lld
     342 |                                        i);
         |                                        ~                        =
                  =20
         |                                        |
         |                                        long long unsigned int

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

