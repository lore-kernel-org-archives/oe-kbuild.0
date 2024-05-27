Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687B79CC
	for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 01:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716775152; cv=fail; b=AHSSZ5DBH3U/74X3EbAhacPeNvDmfeJdpCxVGx7uJ8CVN3F/w6VKMjUJRFyyit/QAQw+k1oAndybEtNBUdWDWSPqcfxxxpoYzMIShZD+2ygFcwTE4HnkOSVOPl1g8BAm4oky4gAQV5Uq0unULWOeGn39QNwIXNetFC0anQM9huE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716775152; c=relaxed/simple;
	bh=4rCfjikZWOOAtPrIyO9hI4AMWxbd5W41xqYkvnMvQCc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sX2nzUTYqUu2QJEZGWVugNYwxl5eQ3h9g4yWSFQfcsDc9LMAgnrQB4Z19dorYMtjxPPgYnyAuoN2ZqaCjPrV+LD6a67dOEuJOxbC4OuTduvD/efZwlR0jEU422ZZ8XZgcv03LoRDVMJqtlc4zEgSESHiIRULARy2qShyVPNMgO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EELV0Md7; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EELV0Md7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716775149; x=1748311149;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4rCfjikZWOOAtPrIyO9hI4AMWxbd5W41xqYkvnMvQCc=;
  b=EELV0Md7+nqo83znoAbI3r42OrWtvff8VyzHXdwAk9dV/SK2YDNgZtOY
   meQkwO29ZcUhdD1W51Bw54/PhRExQoWytpVJCmF2GiJGQc53vRQZ7bsKO
   JEtwOz4hJdJKuBDYa6iPGjz93Oe9+mIL7yRlmJchXroXVsESIH6fD9OJv
   eWTsfwcpuK/i1ed1ssMfoTcL8dUFDZ4pA96gWCVs+E93PnXuThpAL4HEi
   Y8um422JQLCmkQaQfo3frMx6yqRj9Yao+4UK7BRY4i/pYnH+o1croBEYe
   9qSti4UThfuRN5QqWY9dCDpNjOu37FDQXBaGBSodnRho4Pg7GiGacSpw5
   w==;
X-CSE-ConnectionGUID: ldPhMZAFThWq9UPxY7hoUg==
X-CSE-MsgGUID: NEo9zZ6oQuOFxLrZJc+RBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23740003"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="23740003"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 18:59:07 -0700
X-CSE-ConnectionGUID: T1Qn1pRjSb2HQdMnry+tnA==
X-CSE-MsgGUID: 3yLgVzfGRW2ZEyzrNJGYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="39033298"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 May 2024 18:59:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:58:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:58:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 18:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMIQixggL4FnWiXTsl6bmYcAgQ/a4ATxwFZqXlQ2GqOVSbnPaYTghcA98qo7BD1NWD9OsCUtzH6PphQPJeoXzfCfMaQjXNBoGV9Fc6acFqemQCL/XyVgCTrcl58g+PFqcTX8tseyHdKiTTOC0dcMxra8fmT7uIxtl3OC2ccPm3ms+CvZWhsahaxFdYKTeN7yUDnqQi90QtZGKig4FimZA08mkhK2nyLiGb/k4Cpwr0h7tyeF5/aPeFrjSWfaf0HmnmI7jgTyJ9HBdGHse/2NfxEU5iNu5cGKVFJ3mFRZCi0GZKjYaBw74Y8sTnGT8O19YnW9Ep7rAbfUICgYFPKhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0c2N1wWAgZtf2s4fmHEHhtJuIA3eUpZEyyWcaWdhbI=;
 b=i24MvcCuTG2J5eysRSpKhpBOIi3C46Gw9Mw710/+ryC0H/SnTn7auKx8sEVHd63JVFnkIAy+3R28S98DMtGC1NTFBMzWYYILM6mbwkGvPm1x6wxRWO7YcdJ2/+xUjlGBTNtsmbC8z/K3nsUAAw/ONgZ7B/EwnQWBIAbo8s1y/uFA52E7y+yA0tguXbyf/Pd+5VAW2EEDr/Gj9Vy0vvqLTCFFAkH7HxPu5EN/YLNigljCt9ywozLQ+eknltnaT04lNQ//DSoHyuerzByjyOGmOlUvfbRm6iZisWPMB3p15FqNqp8kJ4jpLlRPBC7kjUBkxTp+RcXaB9M51+D4mVD5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Mon, 27 May
 2024 01:58:51 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 01:58:51 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [openeuler:OLK-5.10 27119/30000] dtbs_check:
 Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml:
 ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties
 constraint
Thread-Topic: [openeuler:OLK-5.10 27119/30000] dtbs_check:
 Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml:
 ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties
 constraint
Thread-Index: AQHarjsl6jLDdpEDPUCnkUm7ujXVr7GqVbjw
Date: Mon, 27 May 2024 01:58:51 +0000
Message-ID: <SA1PR11MB8393874A8658308FFDDBE1F1FBF02@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405250844.2wAXaBNe-lkp@intel.com>
In-Reply-To: <202405250844.2wAXaBNe-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|SA3PR11MB8119:EE_
x-ms-office365-filtering-correlation-id: 7843ca59-91a5-46dd-06d1-08dc7df08eab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?xMbMcK2b0t5gGOjOQKnGZ9WKxD2IHa48DvvXtG3h6H4ijZU/julxor2wZ4MF?=
 =?us-ascii?Q?IlJnaLEQn0Rqdkq5RUfGSoEcyjVjnezy5xRYBtTUSQjLXUb7HbH9khKdE2lK?=
 =?us-ascii?Q?bJvoGdLFcneeo0m5Ma1/VNTXtQCyvleGCCfNzJSxj5Fw93vFMqeDP1APlHoR?=
 =?us-ascii?Q?36wwajqTXeVrVilbjLE6bwGKTaSYUqV3lBT6PVtJ6Qcvfv5Gp+kXAsXX6PGU?=
 =?us-ascii?Q?nhLUBI5E//KVoP4BVen88NQKWWXgv6bUkgmbE4REc28hnvgkVznVl+y69rtN?=
 =?us-ascii?Q?uxFb8Yn6UKRrx+HbYb4GLhxOPGHOTS8TInu3+iB1gQu/shdmItgg1dJHPTwH?=
 =?us-ascii?Q?AZSurOVhbHGINe16e6grY6UzvzTdG/j8xjqpF6JXBHp3OGEFhZI6r9y+sisH?=
 =?us-ascii?Q?ZrxrqWS6ysA+/7ll/ZK/onMSXxAQElFZwrPi2ndP86e9wJj/oW3CVCqP+vwM?=
 =?us-ascii?Q?sLsJeFnb5zBXQNcTJT6pZNV3w6qTvmMos0iPQoYocQXXIo781Blb1znbZrZy?=
 =?us-ascii?Q?7F8+zuwYgriqeVwA29UyoNPY6zbiPyrNVv7tbYQOkUj8VCYr1RgGa36MwhLd?=
 =?us-ascii?Q?34vHLeRgPh8/a58Qj14EJCvyy6slPeb8vhR4kaQDiU6eEJIWviuM8tm56enU?=
 =?us-ascii?Q?W04+Gvio+HDzfITlOREp+5fs5Ocs9n0hXW4rm+BCks5s8qtIHSNarwsYi+bt?=
 =?us-ascii?Q?glR56m6D7o26ZoDw0zRVmDc/44Jt9q2qfq/jV6Cu+ZvAI9xDZ/LvGK9RKe0T?=
 =?us-ascii?Q?XqEFBalCP/7UyT6pAfFYBnxY07obNiDPjAV76R0DbJEd3mThg3hlnHUbtxta?=
 =?us-ascii?Q?56hlKzwZwG6qFM8yw3oqmUNxuMj52TAk/ZWp8e3FIlQ6BsGGKiyrPvzDCAOB?=
 =?us-ascii?Q?ErdeTUZ76+SUJ7dRUuh9cREpb702BfRz9FUdJRPe1hcvOclG/58shVY7Kxdp?=
 =?us-ascii?Q?pWSKs2HQLG58B715pafRm94LwxmrxSkB6LeflNxI5SyllQ8chgH/IQOilIKf?=
 =?us-ascii?Q?7m97DLXarXTglbCAPP0Dsv5hGc9Bvh0FrqAoJGHwhNyFon1jtowwBprDyd2q?=
 =?us-ascii?Q?FBdoOXBmrmaxXEuwZnhw6Q35EEaQOrZQqsZKjw2HqBAp8N5acxJdQSGHPUFh?=
 =?us-ascii?Q?jZ6u3M0eY7Qn/8HoL7vam4yu9kDizdrmNVWepwiZKONuwchskTKlqgxayjro?=
 =?us-ascii?Q?prASIYj5v52HqWJty9g/nwG74ZRrwLU3Cf8DKjSGt3zIMuAudNxlOarprrnS?=
 =?us-ascii?Q?0OZN4rac+LwfbCADC88g//AV0kQBSdQeupc6ekc4G8OfR4i1k0n/MxNcfVSG?=
 =?us-ascii?Q?fMA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lYIPA9UmeXnS6bQGSCEHACYajxLNrnvjfow9sebR7bG0yfjXr7JIsKwcb3IN?=
 =?us-ascii?Q?e2fm0qqrnR0wS4PY7V32/O3LI7H3hYOQHof/MAN/fT2x0LolAtMLnws8QVlR?=
 =?us-ascii?Q?BdHWErf00Qu6XjLRGFJaRKCt4WjN0Vm/Z62SnC60onC/tabDPIkWXG22sFu7?=
 =?us-ascii?Q?eMz9ub8TUIQwRJAt6x60+pQGK28xPZzFxBNCEn7iv9PnuZVTr5gHlVp+ZrN0?=
 =?us-ascii?Q?a3mtiHNT6l4o25DLGzwNrO3NOy5rAAgYQsczZ0BDKG4oKI/ekc39yUXZxQJa?=
 =?us-ascii?Q?4tSrEZdzMu2Pz3crCEXXKU2ZhHDZmpPhUTwTndGVN6azwKuTedexsgSDJ8QA?=
 =?us-ascii?Q?s2i+R/c6bEvAdXqIUem4ue3/H/Hv4LwO1bO0zF5r/lwL4u9UEwBTDU07aDrU?=
 =?us-ascii?Q?yWjYxFb1WLjmHrzbOQNzfJUrxtkxy7uS4oxdBgEGFYNPpYyp1z27FRHQLzKx?=
 =?us-ascii?Q?JFRbXlrfr8swRWgXSTYXzdVjh1WBwXahJt6mq3BHapxKUKTCPFFuhehtaicW?=
 =?us-ascii?Q?xARqxnscxNVenG0ekmDqvkgjrP5BitysRLu+pdEOJr/p92ZqTX2oiVAKpVB/?=
 =?us-ascii?Q?4cOy9qPNGq44rU32BYyf4+IHqsu1qW7t7VQBaixfjhwBcYSFta7RLrTuUumB?=
 =?us-ascii?Q?LiDKa/KdptMXoHR0DCWGucdMZXEXOLBp8NEbxYob87L7YJmgpP77Y38r3MNs?=
 =?us-ascii?Q?raPVdkxVruxpNG0EJmBp7dZ8V/upnkrE4WM9FBw7DW7s1sOZ64r80Na+ccKL?=
 =?us-ascii?Q?86DZ9IweNS8CXfzgD6rZ2PJtIhalURiCHSA12aABu4pNDoSl8hMCFu4T39on?=
 =?us-ascii?Q?Hzw1q2YXS/t+QsxeyUd0y996nHrRN50UQ/KVKZBI06PMReB6bcYlWxehaUvQ?=
 =?us-ascii?Q?Qd1WTZqL0mZxowMpKUHbZoME51803XoLpXfDWn6GSPI+l+A/WxcxOeMxBMR8?=
 =?us-ascii?Q?NoOcEF/LEg68Q+LUOhH50plE++gGx0T5M7y9iS0AOIjI2ePoZZ6j4vGA9EER?=
 =?us-ascii?Q?AGHk9M7q+9qY7lISeYaeIBlZQx9CRQzmyMhLL6HVA8A3ChqMjkRZ/+UAoOIv?=
 =?us-ascii?Q?zGyt4RqQwuV9tJTX740xYo2Vme9c99crjdBztbe8en0lBHL0NLa8yMPQt26y?=
 =?us-ascii?Q?5KJIhl5FhTBHLkH5pu/A97qRrgNqZCi1i/I2NeW84O646jPMGoMgN5yp25u2?=
 =?us-ascii?Q?G8Fq7eFPrYyStMutQz1CB8vYBXJDorI8UeS4pQvVDLm6L1jAaiUOuFrR6iCx?=
 =?us-ascii?Q?fb/g/M4vP5V9LxyULMYjfPbn4Gl3Q4kAAVOK+cajcu7NpBTmGO6W7iAnrWAC?=
 =?us-ascii?Q?n1rOVou2lVOTcx/IJYiWF9veYvfa3LVL57NSckv3d9NB2URmHbGSiolmWgDV?=
 =?us-ascii?Q?bsBcwdizGJiwi6Ko+yuZwuXU/O1rtlKk3a4f8t23JhBPa+LD131elFeWGccC?=
 =?us-ascii?Q?ObugWMDFhZlY0oeTyKvivsNQrVjPVORP0lqwHdK/xgn8FZ7fZIsh591Feuss?=
 =?us-ascii?Q?nWjs1QdaqBhL57CRDVbHolewN3BhZRcrHHXBC+eFFaF+lu3EUEMIwBYwS861?=
 =?us-ascii?Q?AFRS1sGAiqphe5V2m8pIhFgmyrLJ7HxancWe1uRC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7843ca59-91a5-46dd-06d1-08dc7df08eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 01:58:51.8538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLBKckjCneq6yGFQ1IC54qWoMy6AOVlUTpefVDksO1SEJFIeQCrtfOWBqBnsIo67TOLuFieeI9e84d4lwEBdeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
X-OriginatorOrg: intel.com

not_report

This is purely a patch for ADI analog/digital device which should not be in=
 the scope of openeuler project, so won't report.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, May 25, 2024 08:32
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [openeuler:OLK-5.10 27119/30000] dtbs_check: Documentation/devicet=
ree/bindings/iio/addac/adi,ad74413r.yaml: ^channel@[0-3]$: Missing addition=
alProperties/unevaluatedProperties constraint

::::::=20
:::::: Manual check reason: "low confidence static check warning: Documenta=
tion/devicetree/bindings/iio/addac/adi,ad74413r.yaml: ^channel@[0-3]$: Miss=
ing additionalProperties/unevaluatedProperties constraint"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: sanglipeng <sanglipeng1@jd.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8d7f48064dc365d3e6bfdf6b71a9561d5aa6d3eb
commit: e25e57f7c34051c1abec1fe6060a4af915f71b5f [27119/30000] dt-bindings:=
 iio: add AD74413R
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa=
382fd7257d9bd4f7fc50bb7078a3c26a1628c)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405250844.2=
wAXaBNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405250844.2wAXaBNe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-en=
gine.yaml: title: 'Allwinner A10 Display Engine Pipeline Device Tree Bindin=
gs' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what h=
ardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/nvmem/imx-iim.yaml: title: 'Freescale =
i.MX IC Identification Module (IIM) device tree bindings' should not be val=
id under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what h=
ardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/atmel-at91.yaml: title: 'Atmel AT9=
1 device tree bindings.' should not be valid under {'pattern': '([Bb]inding=
| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what h=
ardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: ^channel@=
[0-3]$: Missing additionalProperties/unevaluatedProperties constraint

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

