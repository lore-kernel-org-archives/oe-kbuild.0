Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FEA46A4
	for <oe-kbuild@lists.linux.dev>; Thu, 16 May 2024 01:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715822875; cv=fail; b=RMky/xfp8AT441zw9ac8l78Bu1hHeIBSOFczaAty4bcMgAhT2b9n469IgxYJTAxEaBinCk0eh9oAPidev/xx1/GO8mG9Di17ZtAL0AMDhyBYPKNzg2b9eYgdRVMl727l8PEkePi6KIuQm0jkbXn3DLqizKNkJT8pqlbEngJGdaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715822875; c=relaxed/simple;
	bh=RZ7T5Z5eTIE4Yaqpia9PWBfzMsl8BWZImmYj5S1dsio=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VN3BP6iIeaFlgjMxlSZEnz74jGrAWScl596IMKv1DFeqdD1OMt0eFBWpmPmXxbaeW1eZ3NulrNjSlvDcx84NPzcuzmS+uXZeL9Ho6ludZfsy+T9kLVOQC8P7LK5OQAGeqbQn9fdmLcOi8D9XA6QeKy9n7qZ08SAzjUl7O/g2rQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOKIwSLO; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOKIwSLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715822873; x=1747358873;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RZ7T5Z5eTIE4Yaqpia9PWBfzMsl8BWZImmYj5S1dsio=;
  b=JOKIwSLObhEHuZfFiYPmKGTx2LWBb3cECDvowBwJKWNceJYzaJUtWe9j
   INHAVHxh4ru47VpqN5D012A5AVVEg733uNAyVwInMnSFIOmWUIFmEswvB
   zDEsIlmz90+e0cWdvePashcbVgTkOY57RGQ7FfZvj5z55sM1o9GnomzBs
   enHRUZrcmG4sn1UCP4AnfJvNA1dSuq5tXD+rtr/66UOT9n7uMnbs+6oRe
   35cmTsx+Oa4kjuM8Fd4w08PLsvm9TsLe5+ZCMGiCNvb4CDqVc/hLd26zQ
   5Aenuoe4Z0kbkUg5BQYlS+gt3L79hUesgBFTNbxF+6IJd7rPcgMh8UJLu
   Q==;
X-CSE-ConnectionGUID: /x9KOq7bSE6AIovsJlwENw==
X-CSE-MsgGUID: sjUR8sUNQIiEYnyYno76Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15734443"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="15734443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 18:27:52 -0700
X-CSE-ConnectionGUID: KOzQ1EyjRqaxw88aLYvZdQ==
X-CSE-MsgGUID: IvTz0T6kSOWDcfMNple7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31820641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 May 2024 18:27:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 18:27:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 18:27:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 18:27:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 18:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz1Cd9YUXQluP8aJ2u1oKjZ8vqcQtBy70o5TO7xNZR9gIA9GP8mVuCVEA3rjjliamOD0YRm3f8kpg9xcZqF/KDyRpEkKfvtehyFncSdmOf3tnLl5uC5EzuFZZfD21T/JZ+smX2BTi5zVnr7ibDU0ma2pSLMzCG+Akhb+/pqRURbVpvvzZuqXCyDkxma3UMUWmj+KK3Fr7HrYzWNbcln+LJPprjSlQ75Qxm8DRt1Kz1gUNx9QzH+F3W3REk7brUZvxH5hbbftOkQ0ZRpBa2DmHNQC+F9kmS5JSHRtysETsd7q51ui58B0N7T3d3BEBwj7tOlq9PfDczq71vabZoZTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v3R2G1nC1/gXC9ZMunUvuong2wNLsodUlfXeX5ASBc=;
 b=BWsmq/eUeycsOkHqWG92EZGOkX90rOX1473DpqPHIdEsneTJ3P06zx4rRUbyzasPWPGXS+4epX4SbatHFAOjhiZ2mqtzUDcw/YDg+5DGfGdtRLIgXmVSrEqOYtfUFzE6MAD16M4WHw3jsKkm6qkY9QUi7uTewp4OSyV8hSPhcs6iio65MVv0mIUazr2ulBhCYC4yrPngpsnwFtALq+VN5nFGyI9ZLsomx19Xzeeo101U9anGQBzEUW5a40md9OmSs+S/qevq2yw2vUcoQ+Fpqf4IaoJVLPkMvHiYaTNMJcDn25m3TjwrhnTePzwg9qwIHAjymhTh9rACW5XcxMIGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH8PR11MB6683.namprd11.prod.outlook.com (2603:10b6:510:1c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 01:27:48 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 01:27:47 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: reuseport_bpf_cpu.c:15: warning: "_GNU_SOURCE" redefined
Thread-Topic: reuseport_bpf_cpu.c:15: warning: "_GNU_SOURCE" redefined
Thread-Index: AQHapyZs4OgxUEmguUyk++e7gFRgqrGZEdvg
Date: Thu, 16 May 2024 01:27:47 +0000
Message-ID: <SA1PR11MB83932B71BE8061CA4866FE70FBED2@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405160857.9PzXyUEN-lkp@intel.com>
In-Reply-To: <202405160857.9PzXyUEN-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|PH8PR11MB6683:EE_
x-ms-office365-filtering-correlation-id: b43e543f-58e8-4fe7-40c9-08dc75476517
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?IpLpfyTSRaku7qTbNKItYumEqba3x0xx0Bi2kuvGHX8Cl3M30BXSau+fE5S+?=
 =?us-ascii?Q?PAd7gFSLgAW4SXG5PRvRAGxY3yleqpa8NVJuAUQDdIpKGpIYKurRa+cHN+a4?=
 =?us-ascii?Q?Uj4Xux4cF0sc59GPD6KBoXtA47TLTQTlRwLTQAqxWbSGoSugzktZmQJqzGh/?=
 =?us-ascii?Q?hWGwLFHQiVQEFDghmHchw/bqxdO40J/7ZneqYpNNE5pB9ohulMwkJyIxOvCb?=
 =?us-ascii?Q?5X0kvskNx5iIhovZUSAYd3QjUXiw9bHYEutxlpYNoNuyR3Q9DhKXtynQF1th?=
 =?us-ascii?Q?qQCIafpjqReVVhuOKh8v6VVp1XTi+FRIi51ZPDLOhTf+YAwsDcmAqfagK2w/?=
 =?us-ascii?Q?nsUmko+v/qQ+WWcd8wEl9Tz/VXvrvUHHlvCUKC4BRWhe8HRbFKXd3I8I6Css?=
 =?us-ascii?Q?nmRSQMoi6qHFcmawgOTc+Nuo9U/5LUFx6mN8GrUtCVkFGKyING14Hvajua5h?=
 =?us-ascii?Q?ymIHhwoarnGr3vH2JJeTj9dxz/VB6hF1SoWhM60cqAwWlDnlG9ZC1oYO6dAx?=
 =?us-ascii?Q?uUewfl9gN5G8YA8y3yJgPdHzyN7FhRGjtXNn1WC2utN+TRAdKZ0R+Luzxhs0?=
 =?us-ascii?Q?83lgEn1ed3XMY4OzaHDQsX9adN35OzE1YpXGmRXaNaebmGx6MG++e4RHxSfB?=
 =?us-ascii?Q?V+Wk45MALleBJlKifXUo4J55TnhkBFtctt7ZDPuVJjnUpwBZ0e4d3WD04R1g?=
 =?us-ascii?Q?jZLdXejjKVfry90rJNbHoy6f47mLlBFM/2QKLvyyFxK+kpDkdanLeQNdNQ+j?=
 =?us-ascii?Q?ioQuXEwaSFdVUTSLI0OvVpChcLsuZzyk6mdOZLbHvStAxccuU/cTAq4TX/lm?=
 =?us-ascii?Q?+j8XKpUV54eThMBfKoXRbZxW43RNBu2iz26OlDgO5dXW6hHWRpox8JZx0VFs?=
 =?us-ascii?Q?Bynwv+RZANDfw5RfQvSLM+iMci4ShbhNyWnZ4pexA8j3mKfbBE1O31upWLbd?=
 =?us-ascii?Q?FweEaIDxnD8L67wWPCqGD7MIIr04DEDiSUACMvAXdNRn9hAt1i8oB5T7M5Zr?=
 =?us-ascii?Q?8jvfFr9/pkNvbJu5mj1EdWgjbnyU3JTxLngcRnO8AdFlI7HvY4lJi/IJi6Hm?=
 =?us-ascii?Q?awGsI1sURlCJ27Frs+LSW5cJ4DuP0LyygyZlJWbkcpiIw5DEzdI7ayLUUq7V?=
 =?us-ascii?Q?haQf2zqsZFsap4jHEOkDRlVlAX6A2Ze1YGteZ5DEMhcCSi2PHkfoLuRFmvTU?=
 =?us-ascii?Q?NwKa2/oUd1/ykhZ0jCuhA+gFa0CbfnQsvy6lZbxCcn0cgphV9ecGFLdRCCce?=
 =?us-ascii?Q?8hCClA0oJNePtJWu2LdVtDfCm4DM45yC03MVG9FxDc2P4hqIRKF4zwOf4k3F?=
 =?us-ascii?Q?vo4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4dAnszRtfxFIc6FEQN5tar4/XmBpbE+862hrQTDqv3DM4YrV2swZleBrf07j?=
 =?us-ascii?Q?+9cDcG0YKKF2TLmSbESxyZZ2yIs4IAYYSbbi7+5u2tb4247L3dDBjhxNJdUi?=
 =?us-ascii?Q?c87DWVWFB5Timax0or4c72UhIZzZ9k1HSq/+AYhXSWKJw7RVK/eGtNm1fncN?=
 =?us-ascii?Q?HjMeSQNlhFSeQHa05RLk5NIC3vjsZGQYvN0d5KpMlMTd8PNl2qM4xhJAnIBx?=
 =?us-ascii?Q?8cQYAdgNQO8EhvzjSYRq0ByGsiHSzJ5weo4zxO1wcXjH9V41ye3Df+qrzFq0?=
 =?us-ascii?Q?dnGhdMmqDiFYGZNj9Acz7nZOrj/mWr7AsW1Fiv7tWAAGh3shUU4PPPEEh7JL?=
 =?us-ascii?Q?cyaPx4Bj8P6v3X2VZmDc7yvddhdVgjNL1HA9K4Mug6G85rRIfrsLeJK6mGc4?=
 =?us-ascii?Q?oP9EF9ssW/WSD74pYjcs5R86KKgmQ2Tc9HuG3p7qI4MO0O9mJdIeKWnKqorW?=
 =?us-ascii?Q?vcY4XuSZiCIRy3jBjWoNX91uoka4BY53PsdItBGPJkhfKBg+iIOTQayiY7+c?=
 =?us-ascii?Q?EIQIiqCIdOtAtmB0zixENUmq9k74Diru92akkFLyIO66xW16nyeiODJPSYEv?=
 =?us-ascii?Q?pscbCZxsUjHmPXMjBf1EUaKeieMAifEHkOXpaCywf0Zu/B1oqFcvCYSFtEa0?=
 =?us-ascii?Q?uJFA8XPjc1jtRfQh6AtoyKiDFBq8xjjSkTMKjqnjBZANiy0e380spFO+WSnE?=
 =?us-ascii?Q?YyEYthEhAQG+ujVACJkbhc2bO3syydJze9FXGKwXFMTfceMSMAErjd54DMot?=
 =?us-ascii?Q?xzV4kxrXhsvUJ76t9Ja7MBoFS1kPfedfgX2RSAEk7Dy7D3rHBNYh2mHKNzTZ?=
 =?us-ascii?Q?wOMshBsIB4ApiZ+2O1Iik10nZ7c9SlBFDTD0sUa011wJgsKwgmLONyxEiWEe?=
 =?us-ascii?Q?EhSDq78oAmC/J2hSbTX62c+VuLg1EL68kJE1jgsKrGMomLaoKhE3HfNyh6Ui?=
 =?us-ascii?Q?uNoqQ+Oy05Vjvj6+Hu2Bj+BxI+6KcX/uE1eAdrSHSPqqgCN8ZDkbeArlHJm2?=
 =?us-ascii?Q?HMvHjzhPeAzldt9BOcW+DdtmwcGEJd/9W8VQ5/XRbJ1pb3ZCEalgXTrPdUed?=
 =?us-ascii?Q?S3nIUiiawlLAAmcnm+sFUJcBh1nRmD8u6S97+kJCawbIlOIfpBmrbdfveHMR?=
 =?us-ascii?Q?5LZTFje08Nuhx0G5dCSldkVHbcBmp4fsdF+wEQquyMqNMNv8poaUpTiUJKOr?=
 =?us-ascii?Q?tNMrVvkcQzAS3nmngP1/ZFNQRivj6pYy348utY5q1lZ2jVjasEiYDGZrhchJ?=
 =?us-ascii?Q?m493kv1uJtevTxi6OaxZDBbrvhAMBJ6SL11GWBo3FonXDVLijW8t1dVcOG0G?=
 =?us-ascii?Q?dQ/53zHPuZK3xuicv19VsfGnx+IrOkoCTUianbY5mFy5/f5fDtpfvtEESdi5?=
 =?us-ascii?Q?AjOMrSMxtgq2NKSTqtA4yDfad3LSaKiJ2H2pLvdVek4FDJsCIWWHXv7hTquL?=
 =?us-ascii?Q?uXwCTZGwZ3q73o5djvEZkBhLCubxzcSLgnbgoX2jBQMBfa2U+7zGbfjGJMfc?=
 =?us-ascii?Q?RD/ezM81oNdf8jNHk4sniQk9nfuxpOZrautQLPNON74d+p34RVciCJPIwYKt?=
 =?us-ascii?Q?xO/UwO+8WE/khYQ1Vv0xeDoje822qHrYo21LTMZ4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b43e543f-58e8-4fe7-40c9-08dc75476517
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 01:27:47.8348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PB7EZa+CXptbJMywRmEcvsG/FgpOi+QHmR5SDZJ9DzxY+yUWVROZWx+cXwUE/D8B0BxGyQcV68h7v+UmzO9WGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6683
X-OriginatorOrg: intel.com

Duplicate to https://lore.kernel.org/all/202405130312.R5mxIDyQ-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, May 16, 2024 08:16
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: reuseport_bpf_cpu.c:15: warning: "_GNU_SOURCE" redefined

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8c06da67d0bd3139a97f301b4aa9c482b9d4f29e
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 selftests: Compile kselfte=
st headers with -D_GNU_SOURCE
date:   7 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240516/202405160857.9PzXyUEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405160857.9PzXyUEN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ../kselftest_harness.h:54:15: error: expected declaration specifiers or =
'...' before numeric constant
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be d=
efined");
         |               ^
>> ../kselftest_harness.h:54:18: error: expected declaration specifiers or =
'...' before string constant
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be d=
efined");
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
--
>> reuseport_bpf_cpu.c:15: warning: "_GNU_SOURCE" redefined
      15 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> reuseport_bpf_numa.c:7: warning: "_GNU_SOURCE" redefined
       7 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> reuseport_dualstack.c:14: warning: "_GNU_SOURCE" redefined
      14 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> tls.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> tun.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> tap.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> so_incoming_cpu.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
   socket.c: In function 'run_tests':
>> socket.c:59:25: warning: ignoring return value of 'strerror_r' declared =
with attribute 'warn_unused_result' [-Wunused-result]
      59 |                         strerror_r(-s->expect, err_string1, ERR_=
STRING_SZ);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   socket.c:60:25: warning: ignoring return value of 'strerror_r' declared =
with attribute 'warn_unused_result' [-Wunused-result]
      60 |                         strerror_r(errno, err_string2, ERR_STRIN=
G_SZ);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   socket.c:73:33: warning: ignoring return value of 'strerror_r' declared =
with attribute 'warn_unused_result' [-Wunused-result]
      73 |                                 strerror_r(errno, err_string1, E=
RR_STRING_SZ);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
--
>> nettest.c:7: warning: "_GNU_SOURCE" redefined
       7 | #define _GNU_SOURCE
         |=20
   <command-line>: note: this is the location of the previous definition
--
>> psock_fanout.c:30: warning: "_GNU_SOURCE" redefined
      30 | #define _GNU_SOURCE             /* for sched_setaffinity */
         |=20
   <command-line>: note: this is the location of the previous definition
..


vim +/_GNU_SOURCE +15 tools/testing/selftests/net/reuseport_bpf_cpu.c

4b2a6aed2115cd7 Craig Gallek 2016-02-10 @15  #define _GNU_SOURCE
4b2a6aed2115cd7 Craig Gallek 2016-02-10  16 =20

:::::: The code at line 15 was first introduced by commit
:::::: 4b2a6aed2115cd72faaffc92e03d6516e8113904 soreuseport: BPF selection =
functional test for TCP

:::::: TO: Craig Gallek <kraig@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

