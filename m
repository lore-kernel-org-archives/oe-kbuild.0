Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8AD52F
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdB6hbyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701014838; x=1732550838;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=M2De4Ifm318gbiJ5IK9HiORbRmViSftBsdktPARaDus=;
  b=YdB6hbyhebDKnsi71krG0CwBoufK8/nS5NkGCsl+hktD0Mvi8/MUGNDf
   +yd32CQOmvJJQ2iUCVuW4h2G7HKk0mCus3o5bbAP5wFl4RisJkEIMVyJr
   LvWfe7ESE8Q1ALjhdrccC8vNym4F1v3AKwW3a70GIhxBaJFe41hA2STF4
   05QN8vCMcM8lIyXbWDzWgeBK2ezQCOcpAraVspTAqNFDLKC7h6Rkqm8CF
   5bZsvS77fZiLPC8oZ8+ZZeJ13tfp0IIOix/oW18KdbsQXAEyEbvpg7+L0
   Kj3lVM94/11Lw19FBM2YKYxCdc9DVX40nWMqI3L9rWBP6mZ/YBTtJuA2d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5828548"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="5828548"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 08:07:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1099543356"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="1099543356"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 08:07:17 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 08:07:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 08:07:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 08:07:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU0S4SJ7xnl4Cg/Rpt/adpSw4PNZA25GPNnQoWJEjQt+cq5ZQxW2/aqLuA3Yf1S64X7QGSVxxpzjQEelkKL7H53zJiyazUoMtfNUu8yMNdz2YpNkiLq6pRy0Wfk5e5w5V0Oc3Q67FlKF1j+7bkPzYs3512VrDdSkl8mql18ltQnG4/uGQ7+ThcI1lkaPLdUtagAn9dh4gBJ8TNfkCFM2VFewlh6rL8cgEtvtkuxwVoOLbvGdQQcMLSwAvoxxpswgWkJFSGh4JxW9hYWhgE1GRhYnLwEZ8oEJIyS9KMESrQ+TJaz8UuMn/htJtxGAci1AXP9LanyeiP0oGCMjaMGUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDMbS0q6/4PuaJ+W8ZNZriI6pGbjR8Px8vDfxuMC2Rg=;
 b=WPm2zvIGFD76ctzQU7P/6e1e9w0X5YymmxdlZ+94m3DKTe0hXDS3rDZwAE6r4fLF5X/8//gXv7kYBXoZKkJO0oDdi87KW4HIjhquUMKsbo7SfVErbLJQ6qcq69VBG0XXWro1ddE4ggl/kXd4p9dyPij9MMb2TUPsG7lP8nQ4krT+AUJaH+ZwWlylzh1AEUkFtRUvEFoBrJvTdTliTnlnnD+uHXoW+leYRWGWo5GrgRLN5PpIbYfl25wsVQUmvVkRcEKI68IpH2C8L+L2Svkap7IwfIsmsDk4zezTWN5s83RvaRjJGPQvB9rkbTszXoD4oo30FilBrc95YV0iD6lC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 16:07:14 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7025.019; Sun, 26 Nov 2023
 16:07:13 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [peterz-queue:x86/ibt 9/10] module.c:undefined reference to
 `apply_direct_call_offset'
Thread-Topic: [peterz-queue:x86/ibt 9/10] module.c:undefined reference to
 `apply_direct_call_offset'
Thread-Index: AQHaH3M7TDDiqLQTyUKrG0aUBbXMj7CMxi6A
Date: Sun, 26 Nov 2023 16:07:13 +0000
Message-ID: <DS0PR11MB6397D8D069E86388C031585AFBBEA@DS0PR11MB6397.namprd11.prod.outlook.com>
References: <202311251458.OHjWvwKp-lkp@intel.com>
In-Reply-To: <202311251458.OHjWvwKp-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|BL1PR11MB5253:EE_
x-ms-office365-filtering-correlation-id: b4a4093d-a7eb-46c8-db9c-08dbee99c10b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rGOGs55QVEytKpaEpvyf8WyGWWsryUmV7kGvWNeQr8CWfgDid+4WAPdhcRJC9QDNa9BWlHxvsV+iXjKjvPu055m9FROeLQfcKegLgv5E+O6dvFjW47nTaM/bB9zMHCFuFpuUs6a9ZZB5b4lY4H4Aihf2rCEaRonlYuXIdAcTxkL476D+pUQY4bfAqjrZVWxBaOHOIp8Kg352ZqJlkpnZpf5FhfFgrB89d1SAm8aoVbJoGHWZhZOsNSupSaV3YCOWuGmA27/HhnVA6YbeMv9x+aa/l/QxzQ6UXFb4VSML8drGJsE9NCskPTUbJz3ci6O0qz3/0ZY6zBlsl/CoC/DmLFcqE0W+s4jj7UyJwtXWw/0olI/689/QQo6AjucsaQ17Dqjr61Dx4FwRn6+UsGtw7OoLys798kuVIEl6CSVRI6YWC9K9CIEJkypvO7XJeomj2rWuCn79AfJGes90V8rH+7U45EFL/Qz+oS5j5Qr+aV+LM88GvpM3A0gI4VBmS4fQOnfNyNcej6/rsL4ntxa4vn9b2W8WoM1HsQr+EfW7ErkrT+tCs8P77O2MEtEXevp1fEWAciBi23vdUxf0DkndjZ8yOgR43M818YEvglVYf+QrRtR53JiA+vVyxYRu+oQm9XWIReT0rzCUwUrN6HaU6LN3sW4OsggzWfdIgjhnLoE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(122000001)(966005)(82960400001)(38100700002)(478600001)(33656002)(41300700001)(8936002)(8676002)(64756008)(86362001)(316002)(66446008)(66476007)(66556008)(110136005)(76116006)(66946007)(26005)(83380400001)(7696005)(6506007)(53546011)(71200400001)(9686003)(38070700009)(52536014)(55016003)(2906002)(5660300002)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VgcTwErMCiDDkZg8hFtd3kwMKBocB9VUiFmpHqX4e2rdEPTnHbjnOHe/KSem?=
 =?us-ascii?Q?On4B1vuqJQq8++2Dbsg0jznhW0+4Jm1pmlO0TcEbIQM4bZXyndxj57Y2O7nH?=
 =?us-ascii?Q?VBDZCoAwbiPnqWt03YoOJ1LY5BdEY/Gsncs2Su8OKTIOYadMt4I+imcLdbPy?=
 =?us-ascii?Q?S0mfLkXJwkhrMyXRKIIENPWbtjzZES0ayi296Qh5mLDoffL5i9ry8Up735gJ?=
 =?us-ascii?Q?n3rb7CbscbC7UUsPRkRXX/bjzxhVh5VhmUxbuNPFtwsUAnETfdr5to+ZIGrU?=
 =?us-ascii?Q?pOYFDhsVlpj3Adq4xL8o4M3j0vilEtwpfVSy+B98OGVlSFqYIgsSlbmvbSIA?=
 =?us-ascii?Q?+o95rJBAAKnyE22Ar5y0eS0MWso4Q4uDFblJj8wISx+faoPX21bH4otgXXkz?=
 =?us-ascii?Q?baB43UJURL0WiJ7erLpkhSKs+1UQtuVs5guUJjy8u1H7a4PM2JKKj63Pgce6?=
 =?us-ascii?Q?b9gWkBhXXBUimVg/sMF8ChiW3gshsSC0Ik+GA7Y/qVSo9H4nBRxekQckx9B3?=
 =?us-ascii?Q?IGb2vMarb+aH+yBPt/JY/3Gbq+ocRP+pO+HB4rb/cc3F2y8butpYKnhC2hln?=
 =?us-ascii?Q?bauMuPuinU3IblOlZVkzvXYFQ09MuYqUsaLtd0L7nirRxhVIpEpcj5nHkrK2?=
 =?us-ascii?Q?/29ZM6rCiNtrUOsrTpsuRuqqTH6AnY6dZL4mxTbl0wGX5xo3hJb+gEYynF12?=
 =?us-ascii?Q?ctM0cxAMZ2AefB6HVM9f8lXBBum+SvzNjZ4HJRIEo84F4PwQzfPfFca6aRzB?=
 =?us-ascii?Q?Kh4U2QazMIbr9tKyS2hmX1xf1T/Ike0O83pd94kPhZ/GuY5YKrUpaWdhR86R?=
 =?us-ascii?Q?wd3o9PqvNhwWBIi0x8CVrCdBvosSj4tDOetkSRg1yqGP6TiybgXzbyC0EUAa?=
 =?us-ascii?Q?NjQxd486q9XdDSsBeTOrSM5yvSWLVe9sbNQgVdIDyuMTv9YjvIdUf9PBSMEc?=
 =?us-ascii?Q?NPDiJkfsr3/oENz5lDpRpdSI6Wy8jLIARyZ3hjNZ9ee1RCloM0EnzDyTfeCz?=
 =?us-ascii?Q?al/7VhUysygwxjEVp61tez5xHz8stLLGQa50SeMrP91jdJYLl6OLyIofOk+F?=
 =?us-ascii?Q?b26MjDZwn/O25EDvEqYVspohBFTagnZWcSTcH5lgZAo2728tkqBUlCDI2j9r?=
 =?us-ascii?Q?uhjxG26ll1UnvaRx/ZmjMtTtRtyG8qQFjohvMsIWYq4MZL1RLpvFm/sEqtVV?=
 =?us-ascii?Q?GSeUPBFxKUEQsg87Zehnib6R2BD9Y6s17YWyDfXmXnCBP4XBIJisRaQMKkah?=
 =?us-ascii?Q?QrfzknA038T+hySfvI/og5bKnwTTIUkvxNPQxFbHpYitw0bGCGUGRHjJMZvg?=
 =?us-ascii?Q?5VLjGILoICVuxq0Xkm7VlQ7yUab4auvgw9SO2S65TTJH3MqFGanoPplIQUXM?=
 =?us-ascii?Q?aHZegrWRNFAIbm1ik9tcJtMGNWYZkL/jEmjkhBgZc19+tU1UpWKH0Y7AFVn1?=
 =?us-ascii?Q?0004c4vKxx3HzYw4OYgS46aFUPHMC2Y5es0i2IEURD3uxUaqN/8aCDXvVppn?=
 =?us-ascii?Q?IfkyngnyXtvk7PBzkLsOAOYJcJSntQ5Y2ryw9TaDdqrtt5SVBkKaHSfVavOd?=
 =?us-ascii?Q?aOyAEOvHywQbd3Mgb1R3HhR6X7paHtvFBvDbd35k?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4093d-a7eb-46c8-db9c-08dbee99c10b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 16:07:13.8743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+2onXq2gmcGAVd4zvQ/4nFMKqSH4lZjStUn1LGTSKxteVJIe2opOYbzu/DdKRKMmC0oxc3jigYLLiamuaSf2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202311251541.xeW8anBk-lkp@intel.com/

one is gcc and the other is clang.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 25, 2023 15:43
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [peterz-queue:x86/ibt 9/10] module.c:undefined reference to `apply=
_direct_call_offset'

::::::=20
:::::: Manual check reason: "has Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x8=
6/ibt
head:   9ba52bc66d03d8fa986fb5a6d5a026702eb90747
commit: f421d1db8a29dbc00303f50c2c01a495cd620a24 [9/10] x86/ibt: Implement =
IBT+
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: um-randconfig-001-20231125 (https://download.01.org/0day-ci/archive=
/20231125/202311251458.OHjWvwKp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231125/202311251458.OHjWvwKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311251458.OHjWvwKp-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> module.c:(.text+0x4ac): undefined reference to `apply_direct_call_offset=
'
>> /usr/bin/ld: module.c:(.text+0x4c8): undefined reference to `apply_direc=
t_call_offset'
   collect2: error: ld returned 1 exit status

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

