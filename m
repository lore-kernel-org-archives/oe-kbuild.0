Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F884F1EE
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714981367; cv=fail; b=eJ23zoB+vLYnWbGJFxtnYiexHaF+t9Ars9xdnPtwT7U9ILFxXhrR7ZIHndEQVhsIoCHwIzFlfRZuEgS1E3FP+IVcZdv7aw4n1mFfc+WYaZUh32qGoXdtuM5SOX19bnRYf6cRJ3UiO5LEK5P9OnCxRlsTGotKaG/w2/cbiVHco2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714981367; c=relaxed/simple;
	bh=GOWj6vXxkNYO97h5R3jGF03sDn+r5l1VJfh6TZU+2X0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=seKlrqifCSWhO0e9LRtIrw01cGpfsfiY1ZLrQUZ+7qKdqbCWfcd9x/+SrBpNxdO40sfnlmcp6JD1jGAhdU1hIlak9bICVbw2JqIixB0dR0ScxyplJE8NTJlwhrD+gfPda5ZvySF6MQmUnFTUP8eDI1RFivMVxxquyqE0E1smFU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4ri8OC7; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4ri8OC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714981364; x=1746517364;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GOWj6vXxkNYO97h5R3jGF03sDn+r5l1VJfh6TZU+2X0=;
  b=d4ri8OC7gbdfAQ1T3S5IrpQhd8wz3IBC4RJMwzsjOJJX25VVwQqPyNlg
   zih8T8avIi17XHWMe+iv4EiYCpNaXR0E7FcsXglN+mmYzB6HTkKdXNgOe
   2sArCgNy2vMqiwHwvgKbZlm8Gg2ChCDD2N8cp/DujNDGui+2pqZHFSiFC
   z/3/4CAHW/0/WGYaJIHVtekRI+jUVWsvjMlRRqeX2wtNotF2AUFcLuB+s
   bkVDowm1MF4vEI2yS696jXXDpuLRMNN90N4EhZ4+PQlxIoI/NMogdTW7P
   chU3NeWn0Q/RhvMQ5coXozuEwgCz5aFg9vZmVXYcsQU86D5SMGJaSKu2x
   w==;
X-CSE-ConnectionGUID: xHt0NphhRLWiUMjMIsPkbw==
X-CSE-MsgGUID: iJtJUGoHS7i1dxWGQycJpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22122717"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="22122717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 00:42:44 -0700
X-CSE-ConnectionGUID: xgvHqdd8SX6aRp+0vdLOnw==
X-CSE-MsgGUID: G+4jKzUTQjCwsQbmrs0OaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28165802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 00:42:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:42:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:42:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnFDiF3G6JPeBsmXI8VsYNvhc4gy9RaXcz48eAlk177gGo8nx2q8JaiTvJwatkizFLadSp3NAZ/yQP0Ii1H3CEyV96xtaLZfMvEsnzI18HC6BrgTEBb30CO4ve9OKDfs3g/5Ea6Xv+E65ULuYExCOqWvXDhGLbQMQPeEhBaxQCNgcyL/tT6IzOUetnq1hJHVcuVMVLYgMpcozmfKUwQyuKYCzvxr0Kq5YxG5J4VBxO/dWwc1uNHVjh8+QvtSGz6bJDyQc5B8kRRe1ol0i8PxvFOEtTsRtRUgYyqP8B9e9NTjDV+tMw0yo1dIRHYjU10Tqrd1kEBaRSZ+Q7WudPgdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9slDZ2G0fbbYa5Fm/mM7QAgNU3RFQnWnFmjX/18zQ0=;
 b=iYy9b0rJYvN3LfX7RhMBJtCkzkHgoCXJbNOdk0KcfxMhSYgtoKmXG2AVHyBJXIdPJeGIWsIRlo18tPvq5MK3yFJBPdorRRoRiEU6NRKvXPuFeZ3cYH9/eqEEKiu5k5aBvK0lbAGTt6apeFtsPxGV19D0KMtd29rSAShDhv8ECPWVQONQW9QIlap547WCOu0/bJcAxV2FlzeL3GSXIjkqIcpPwizNQZhddyZIdjDjObeZQ7ggFEB3VrwF05cc3ueT+/fMa29q7F8x0Fr9bMl31i9/joO1jp5ZWoAxPLzK/PvWU6lcyG1Wpk/xDDf5m5YJoYdH/534CoquDoOhQ1RS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 07:42:39 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:42:39 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [nbdd0121:thin-lto 4/4] rust/helpers/helpers_combined.c:
 helpers.h is included more than once.
Thread-Topic: [nbdd0121:thin-lto 4/4] rust/helpers/helpers_combined.c:
 helpers.h is included more than once.
Thread-Index: AQHanGNPrwN9C01OVUmOLsjNURB+TrGJ2P0A
Date: Mon, 6 May 2024 07:42:39 +0000
Message-ID: <SA1PR11MB8393B339FFB42585C25E8B89FB1C2@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405021511.dplt7agj-lkp@intel.com>
In-Reply-To: <202405021511.dplt7agj-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|MW4PR11MB5911:EE_
x-ms-office365-filtering-correlation-id: 02b7b082-e8a9-4aae-8d3e-08dc6da01b11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?slXV0u50xS5qx9BSe86QDDF70zMDMpruFsaaJM3hLnzwu07nwomnmWa2asJu?=
 =?us-ascii?Q?V1x/YX4uEFiM8rYWVphaklceEheW6f3jullHFwdeLynpGACGBzl07Ch4XGCH?=
 =?us-ascii?Q?V8ZFBTOZGzYJfbzc0eyONIVum7RCOApM76+dYAgGXRMYYTV7sjAiUp7NC8do?=
 =?us-ascii?Q?gmiOg1M1vulOkUYJl/mYkEAdgVKmL07p7CUcHZhksfB30GH1XFhT6u/iEtIR?=
 =?us-ascii?Q?Nrnvve+MWrOwCW6VpsU48K5pKGF856ECv+IEmDY1qhTbhi4k21bcVVdWXDwU?=
 =?us-ascii?Q?h6BVlHfpd492b4kOBnEo96iSDh1UYrnfk/sgD5aAH8JYMfQn47f0IXCTIG53?=
 =?us-ascii?Q?1s+G2qavZzPMiamI2ma3QVpJl8sokHlujrRNd8AJ+5YqeNclggSepJhzHbpA?=
 =?us-ascii?Q?YMC9YTPUWa60Gst4hME2N5yBSPK4ssm8Y7bx1KqMgGtyRXyQyBEgaudzykzs?=
 =?us-ascii?Q?6UHfnWQ+a5pJRWx5aqxLgAwEmmUXpgcO/iEpVkP9rxNM9drXKzHtMQ3TEhlt?=
 =?us-ascii?Q?ox37nmDlQzvkfkz3erWEPl8syZBSbDTSDNrw0DKzy2Bi1MIySFvp4Om8up9l?=
 =?us-ascii?Q?U6BFCjBWspfatuTnZEqRQ+lvRP0hOnvZkckCN2AHYZkoezCI/cfqEDtQNBJh?=
 =?us-ascii?Q?8mgK7kzcAyfPBGe3uBJKCa39QuX623HCMbeM74TwhQETTI6+9k9e7h/2oLsn?=
 =?us-ascii?Q?agg7rOaf0MFZX11EWct7ImGiSI27yrcOIjzv1nB2aPYY44zV+f9Fjm+wD/a5?=
 =?us-ascii?Q?6HoE4OSGxS1Xpi9T2D7C+D7C4Qq1AIANOFmJ2qIi2kNO7R6lkRJAX0wrTk+s?=
 =?us-ascii?Q?fLb8CqW5Ff41B2xHKkX4ugg4BXb23olLVxnE2z18WhdnLqWis2PiQgpQwc39?=
 =?us-ascii?Q?QQsaBrFVjZzkEtgKa2AG+HkO2noxM0/5DwVESojp7cHEJzRH1/7RMJbkPP7H?=
 =?us-ascii?Q?DcNQXOqTMibpfAKA4l6+u7pwMPwvHeYucDujQMf+WuWJur7S1I1qr5Dxwzxw?=
 =?us-ascii?Q?Nc8pHmnsZbH8OkZz8b2/PGUpRVRuhPMjGgYMsFW3aK1lo/+TrcwXS/4jgUlJ?=
 =?us-ascii?Q?HBWRcl0pjG8mwUAV44fDewlUbILilH2OKaQjptS1IePPhQ25TOlyyXCBM73H?=
 =?us-ascii?Q?jyNB1RxAtxCHRvrhv2X0s05jeoqFber/dY9cJX6xR9L7qrhrhlnPcD/wj4nl?=
 =?us-ascii?Q?OfkUvdUOYhdFAhPMgdXULsYJegzE85L8HZIY3ZhZ9BPjn8gpv24FrvKZ1ZhZ?=
 =?us-ascii?Q?XA+VQ2GRfsTgmThTdSrGlGrY2vM1SCBDrYndAGAwYFxtlRofDD4oBZtqs8qQ?=
 =?us-ascii?Q?VrY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FoUZFAqjwZnNdOfhsoQmxOxxx8VjThwIE07Xpx2/BzEiHLpLdaBlEqpbfPNw?=
 =?us-ascii?Q?srfQAF0OlqKyymoQADbDHlFwVAgB8ys/XH7UmK4iSYh81K4YND308Q426fh+?=
 =?us-ascii?Q?O7JKyKgpLwoxXmZmEVFXl589HgrkX5Xtxsaa497zUR/ViyprOBHrygRNOvza?=
 =?us-ascii?Q?sa2uFsiMGTH26Jiho09xtaQaTb6TI0liJeXBolo9sUpWwoVi+z+2wEMRVhO1?=
 =?us-ascii?Q?Ou3YoylYU60tv3xyUMyv8Niz53SJS0JQiN1yhZ72vGLyZsPwGOtX/wh+2YwD?=
 =?us-ascii?Q?NAv+CEsp+pOeLHpeBDH9b7kRILq1nVJ4Nl21D2DXTwCZnQzbeN11jouEDxGo?=
 =?us-ascii?Q?P2H/Kxr47Pu38RFv5BuqL1BAqrl5+T4jhCDAThV1kJE9PfmvHOZOyPGXpo+z?=
 =?us-ascii?Q?emwy+L1jFN4vOO/BAB0tr3aWo8/1pMcQtJnaZUxFxoeiIbduN7Z0+q8mem6q?=
 =?us-ascii?Q?ZsEwk/V9+E8hAFNaKA4IVkQm6dnY4joVq//o5yfl5P3tDSJntTu9qNdOlK4r?=
 =?us-ascii?Q?qa7m1g43GNRDsGgLvxsSiNeZiLfCzuoZP3Su0c7a1jy2yNrLyG0TXIJy+T7R?=
 =?us-ascii?Q?GFPOdIr/M4Mmj7JbYyiZBVvxW64/9qTULIxtBT0hA0QzahloRsn60jyEjl3h?=
 =?us-ascii?Q?Q49UL2euQAuRq+sxXftsCMo099poPXAa0bzsXKBhx1ac2LD8XTja0q6uAUr+?=
 =?us-ascii?Q?y5ucHGBRpF4lv4ZYh8H85xnClMCbuA9RpV0ZsPz4wuTUD5gqZZnbEIgE8R5X?=
 =?us-ascii?Q?8E3J55IEMa4bWx0M9wrPrCLMPTC1ZYxoafNJQKQDod0nCeW9ZeEWKecF6Oc5?=
 =?us-ascii?Q?hMMVvhX/gH6EdNG5Un0wj4MOQ2jBRuUMOFLwIVhDIq/PHXYOn/WUCby1b3Gw?=
 =?us-ascii?Q?Y4z5qtt0vUMPB6fbY4eL5Uuyc83ZY6jhG5iejfNfp97X48zhuh3+DC38S9g6?=
 =?us-ascii?Q?h2k2OaVKbgIiOnSS++lP1DOFKhMvlFFh0R8WbaoMhJZgGMU3EyO1C0Ul/XGk?=
 =?us-ascii?Q?4vym6XVuLEK0PQvt4NrFFHq8MZHTcjJGEAISMKKT6xCO0nhqc+sGFVAv5z4R?=
 =?us-ascii?Q?NmY49+doLinbzuYWVBnkXxP4FqCdjO/Qo+30MT3muU/3Ses3jrsSsT96XAzO?=
 =?us-ascii?Q?dMvGsvf2ezv981gdx4VUiINL+A0icCJ4xGRi6v05z0UsAiJvF815LLmN+Jel?=
 =?us-ascii?Q?vcpCEIzP91Ha/lOjjR6qpIe+VKvkHTThaBTMf1YdZbpysxL/IayQSXSIjczb?=
 =?us-ascii?Q?EZvo6MXs3ZcrgnteWVNDQzGCboFzaRVOQZxFb9FoztWb8znGNes1BdoPKXPl?=
 =?us-ascii?Q?hxZSK0bOy79HQYYU/heNInRNEyjYAFX7s/I30YrSHMcenl5OENWNPFpcsRkX?=
 =?us-ascii?Q?irxzP3wi/xu43P2h/zRokRIxqPracTI1iIgknr9W8YZEH4FaBciYT7skam2M?=
 =?us-ascii?Q?kT3WHy9+CFB6fIZVMfyKSwjyN1HQ2X2+Uk6brbb9PVOHWQiF3lemphPP2iO3?=
 =?us-ascii?Q?SX7vx7spopZd2gsJC1XFp5kyR6Q8bYtgRnkbyfR8HrmZQdwcuuY+L3CUFA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b7b082-e8a9-4aae-8d3e-08dc6da01b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 07:42:39.6034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZUYFUWsNlEwSteQMJWWTSf7X9yZ/1qwdT8r3FezoBDLKACa/j2OhF3GlQPDYP9DMD7eyuYJqwAlXXAtfFKIIMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
X-OriginatorOrg: intel.com

not_report

informal patch

commit 98d45a070a161cc285a5aa8f2ab05159ff318146
Author: Gary Guo <gary@garyguo.net>
Date:   Wed Apr 24 19:13:25 2024 +0100

    WIP

    Co-developed-by: Boqun Feng <boqun.feng@gmail.com>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, May 2, 2024 15:30
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [nbdd0121:thin-lto 4/4] rust/helpers/helpers_combined.c: helpers.h=
 is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gary Guo <gary@garyguo.net>

tree:   https://github.com/nbdd0121/linux thin-lto
head:   98d45a070a161cc285a5aa8f2ab05159ff318146
commit: 98d45a070a161cc285a5aa8f2ab05159ff318146 [4/4] WIP
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c328=
9804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021511.dplt7agj-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   rust/helpers/helpers_combined.c: linux/export.h is included more than on=
ce.
>> rust/helpers/helpers_combined.c: helpers.h is included more than once.

vim +4 rust/helpers/helpers_combined.c

     2=09
     3	#include <linux/bug.h>
   > 4	#include "helpers.h"
     5=09
     6	__rust_helper __noreturn void rust_helper_BUG(void)
     7	{
     8		BUG();
     9	}
    10	// SPDX-License-Identifier: GPL-2.0
    11=09
    12	#include <linux/build_bug.h>
    13=09
    14	/*
    15	 * `bindgen` binds the C `size_t` type as the Rust `usize` type, so =
we can
    16	 * use it in contexts where Rust expects a `usize` like slice (array=
) indices.
    17	 * `usize` is defined to be the same as C's `uintptr_t` type (can ho=
ld any
    18	 * pointer) but not necessarily the same as `size_t` (can hold the s=
ize of any
    19	 * single object). Most modern platforms use the same concrete integ=
er type for
    20	 * both of them, but in case we find ourselves on a platform where
    21	 * that's not true, fail early instead of risking ABI or
    22	 * integer-overflow issues.
    23	 *
    24	 * If your platform fails this assertion, it means that you are in
    25	 * danger of integer-overflow bugs (even if you attempt to add
    26	 * `--no-size_t-is-usize`). It may be easiest to change the kernel A=
BI on
    27	 * your platform such that `size_t` matches `uintptr_t` (i.e., to in=
crease
    28	 * `size_t`, because `uintptr_t` has to be at least as big as `size_=
t`).
    29	 */
    30	static_assert(
    31		sizeof(size_t) =3D=3D sizeof(uintptr_t) &&
    32		__alignof__(size_t) =3D=3D __alignof__(uintptr_t),
    33		"Rust code expects C `size_t` to match Rust `usize`"
    34	);
    35	// SPDX-License-Identifier: GPL-2.0
    36=09
    37	#include <linux/export.h>
    38	#include <linux/errname.h>
  > 39	#include "helpers.h"
    40=09
    41	__rust_helper const char *rust_helper_errname(int err)
    42	{
    43		return errname(err);
    44	}
    45	// SPDX-License-Identifier: GPL-2.0
    46=09
    47	#include <linux/err.h>
    48	#include <linux/export.h>
  > 49	#include "helpers.h"
    50=09
    51	__rust_helper __force void *rust_helper_ERR_PTR(long err)
    52	{
    53		return ERR_PTR(err);
    54	}
    55=09
    56	__rust_helper bool rust_helper_IS_ERR(__force const void *ptr)
    57	{
    58		return IS_ERR(ptr);
    59	}
    60=09
    61	__rust_helper long rust_helper_PTR_ERR(__force const void *ptr)
    62	{
    63		return PTR_ERR(ptr);
    64	}
    65	// SPDX-License-Identifier: GPL-2.0
    66=09
    67	#include <kunit/test-bug.h>
    68	#include <linux/export.h>
  > 69	#include "helpers.h"
    70=09
    71	__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
    72	{
    73		return kunit_get_current_test();
    74	}
    75	// SPDX-License-Identifier: GPL-2.0
    76=09
    77	#include <linux/export.h>
    78	#include <linux/mutex.h>
  > 79	#include "helpers.h"
    80=09
    81	__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
    82	{
    83		mutex_lock(lock);
    84	}
    85	// SPDX-License-Identifier: GPL-2.0
    86=09
    87	#include <linux/export.h>
    88	#include <linux/refcount.h>
  > 89	#include "helpers.h"
    90=09
    91	__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
    92	{
    93		return (refcount_t)REFCOUNT_INIT(n);
    94	}
    95=09
    96	__rust_helper void rust_helper_refcount_inc(refcount_t *r)
    97	{
    98		refcount_inc(r);
    99	}
   100=09
   101	__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
   102	{
   103		return refcount_dec_and_test(r);
   104	}
   105	// SPDX-License-Identifier: GPL-2.0
   106=09
   107	#include <linux/export.h>
   108	#include <linux/sched/signal.h>
 > 109	#include "helpers.h"
   110=09
   111	__rust_helper int rust_helper_signal_pending(struct task_struct *t)
   112	{
   113		return signal_pending(t);
   114	}
   115	// SPDX-License-Identifier: GPL-2.0
   116=09
   117	#include <linux/export.h>
   118	#include <linux/spinlock.h>
 > 119	#include "helpers.h"
   120=09
   121	__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock, co=
nst char *name,
   122					  struct lock_class_key *key)
   123	{
   124	#ifdef CONFIG_DEBUG_SPINLOCK
   125		__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFI=
G);
   126	#else
   127		spin_lock_init(lock);
   128	#endif
   129	}
   130=09
   131	__rust_helper void rust_helper_spin_lock(spinlock_t *lock)
   132	{
   133		spin_lock(lock);
   134	}
   135=09
   136	__rust_helper void rust_helper_spin_unlock(spinlock_t *lock)
   137	{
   138		spin_unlock(lock);
   139	}
   140	// SPDX-License-Identifier: GPL-2.0
   141=09
   142	#include <linux/export.h>
   143	#include <linux/sched/task.h>
 > 144	#include "helpers.h"
   145=09
   146	__rust_helper struct task_struct *rust_helper_get_current(void)
   147	{
   148		return current;
   149	}
   150=09
   151	__rust_helper void rust_helper_get_task_struct(struct task_struct *t=
)
   152	{
   153		get_task_struct(t);
   154	}
   155=09
   156	__rust_helper void rust_helper_put_task_struct(struct task_struct *t=
)
   157	{
   158		put_task_struct(t);
   159	}
   160	// SPDX-License-Identifier: GPL-2.0
   161=09
   162	#include <linux/export.h>
   163	#include <linux/wait.h>
 > 164	#include "helpers.h"
   165=09
   166	__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq=
_entry)
   167	{
   168		init_wait(wq_entry);
   169	}
   170	// SPDX-License-Identifier: GPL-2.0
   171=09
   172	#include <linux/export.h>
   173	#include <linux/workqueue.h>
 > 174	#include "helpers.h"
   175=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

